Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C41AD5D688
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt9MS58xF4HsqIF5peHhSoa21COI3AlbqVKS9pZd1dw=; b=Qb3PVAyKn8ustrlW0YfeIsYano
	PweLkHJcga8tuqeC7hZWk1UYxu4eeM68kSnRkw18NSn6p8RF6If64ZIxob6g/dv55Vdqtk6Cb4tUh
	Qd0cBXWEI2/HeqvNxqjgAlTEdu5vqRtspenPH2H/M7Hp2xuChAnxXXkfB+ulEutEQTqC9tNSTdYiX
	dhZl/rSzLfp+dG5ZcFBzE6evOxNA/GIeLBA8WAbgWi9W93p9n5W6x1zzn0ZDe0H+kBFgYEJrqUdPD
	yW5nSQwyOJWKaxACjJPDtRucguSSkZQI4QzGOC2UzsONaYOcsiQoNMYFlDjpK/X2IVTQUr61BT7Ie
	04n3gB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t99yB-00000008Obh-2WIX;
	Thu, 07 Nov 2024 21:23:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t99ug-00000008O4Y-2GnB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90E2F5C5521
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Nov 2024 21:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23D2C4CECE
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Nov 2024 21:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731014371;
	bh=6EJOYAl/kUJjbYJ96ISBGmvuILjiyPodEgngmPrqfRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bP26CKUrRcRrW2/AeW1GyvHZMXgcYT7c/f+vibPT8LIs2VJFqvPskAD8rvYLfBgzo
	 7MHnPaYwWUsH+9wQGMel/RwjWd4TnkGvdUiNsD083AMvPL6J+gWC8klP4Wz4vdx8UR
	 jOQmpalPG3/crnZfavXjsmP7HMtjdfDQH8RhsqhXSnnNGB4j1uB4Idgfv3OK5NZebZ
	 kFck/4HaaVsWGXkHdEjsKIQGVVqVHLwH6k8havga2STvg0sOjkCKERQJv6dekLUoMI
	 JYOmeqBBtmAWZwNEqw85hMyinARCUiLoTEQaAQVJ/EuVQySBBX8i1phYJkac6oYK+w
	 eDRGZhoZNtIVw==
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso1404318276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:19:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWo/M8Iv0bW238Yv+Ruz3OGAyHLqjCnd4oTBOCwcSIH7pwSEnQpY/Zt+7sI4Xd2P/xdGJYZ0/kM1mxVLJMbt45C@lists.infradead.org
X-Gm-Message-State: AOJu0YwRyoF6YfuSi+gj0Btj6u7AAqYW+q40uqDnLdfhkg8IAJ2yLHFi
	hsY9vRR5X5Rtk7wO/Pq0GW5fcg8ecvaPY01yX8+FISFthvbtOlowwAJmaqCxWUyZlfe5xg1y85N
	EKu6lsoOC2xqgoZoHTNtluc0F7w==
X-Google-Smtp-Source: AGHT+IE0AYklUc4GjktYkiuQo+juQwy9Dp43p1y0r83xjpWA0bzLs74rK20hy5R/HwgvbbtaxtREPNHRwoiGz9DD8bo=
X-Received: by 2002:a05:6902:b17:b0:e29:236:fe2b with SMTP id
 3f1490d57ef6-e337f90370cmr472949276.49.1731014371053; Thu, 07 Nov 2024
 13:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20241107153255.2740610-1-robh@kernel.org> <20241107170002.wz7wkqmtyqiiaswl@pali>
In-Reply-To: <20241107170002.wz7wkqmtyqiiaswl@pali>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 Nov 2024 15:19:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ-BaHq+o+E-OtAf8YbJbNnPSKHjvgAn_oq8KVEKPq4rg@mail.gmail.com>
Message-ID: <CAL_JsqJ-BaHq+o+E-OtAf8YbJbNnPSKHjvgAn_oq8KVEKPq4rg@mail.gmail.com>
Subject: Re: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_131934_668098_62D1126B 
X-CRM114-Status: GOOD (  16.23  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Nov 7, 2024 at 11:00=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> On Thursday 07 November 2024 09:32:55 Rob Herring (Arm) wrote:
> > The mvebu "ranges" is a bit unusual with its own encoding of addresses,
> > but it's still just normal "ranges" as far as parsing is concerned.
> > Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
> > instead of open coding the parsing.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Compile tested only.
>
> I see no reason for such change, which was even non tested at all and
> does not fix any issue.

Maintenance of the kernel is an issue. Maybe not for you, but for some of u=
s.

>  There are more important issues in the driver,
> it was decided that bug fixes are not going to be included (yet).

The larger reason is to get rid of custom parsing of address
properties throughout the kernel. As well as remove and consolidate
uses of_n_addr_cells() and remove its support of long since deprecated
behavior. Also, I intend to make of_get_property/of_find_property()
warn about leaking data since it just returns a pointer into the raw
DT data and we have no control over the lifetime. Then we can't free
those properties. Why do we care? Overlays and Rust.

Rob

