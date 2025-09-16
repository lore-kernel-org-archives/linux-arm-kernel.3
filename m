Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD90DCAC5A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxrxMt/N4dpi/T9k6sahK9m+SYHc4ch9rBILVIoKVxU=; b=r202Hgxns6oq6pVLqnhMGysI2Z
	SjLKKFQjzpFzr62YNTuKnGGNt55YyKBbnKljIG6SUogZB7mYbfgBc42ZryAwNgWPssJ5EjrRYChZG
	msrVGymZfx7TpCsfKEsHC/I4du41NxmJu+R74TJNg/fcraTlAVcf1d8i2Kbsg/DUrnjVzioeE5H/o
	QJpIoQfk6CXLUiZeSBuJn3tjpLDhDWuRiGTC8auuxnjjbjASo4jH55hNI0Qlbt3xDaaXNULwpa/Rh
	azLtL0s8+jQOoDxGuBzfeLL3XSaP1SVCPf4pvHAuTXGuS12robUgRpJRSrWk6w8FCiSIBFGRNI8o2
	Umhrrq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySCb-00000007Pno-3LXL;
	Tue, 16 Sep 2025 09:42:21 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySCZ-00000007Pmi-2hrV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 09:42:21 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-336dc57f562so42168681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 02:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015737; x=1758620537; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxrxMt/N4dpi/T9k6sahK9m+SYHc4ch9rBILVIoKVxU=;
        b=SIr2MFra5XKs/oW55UTIeqyvIzhgB6RRM4KP7ZpJNp4QP8s3Jn8AmwbE9SI6aAIvA0
         7tsMDEvKzMa2Whawa5qFBZI7TbANGl3wVa4gvLg7QYf4yNmJUSguLduOFC5YbC80fl6I
         35ItGL0S4XKYzUxyzMimZ+NQNigQWdiJ6DO05xTJwZ/mRrH2vhdg372TLJGl+S0dbyeO
         In29inJbHj68KhLjSAd3q6C2Vg4ZqQ9QsWuPAPvRUBnKSCTUU/0Oaiu3O3LbikR7tM9p
         MpJkAuzCHmjn8+qyefBt05Ls69i6yzacPvZ6Mfj6T0Q5QM6gq+P4UBKgYqwPY4Huc8YL
         LK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015737; x=1758620537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxrxMt/N4dpi/T9k6sahK9m+SYHc4ch9rBILVIoKVxU=;
        b=a+bMHeWF+kYsNPPYHQzqSeK1fL8S14LJGgRUwKJ+RDVInqfiF/HSPvkLzJo77b8dPj
         L4TX1/xm4mg9u/OeGXqBJYPt9+R9i3tQeWHTuH1HisODD2Sz+qJOyvrlxezdjhtNTc1+
         7rFuwZa4yE/GBE81CHm0xJZQbuqyPtDhojR7Vt1cZS8mz/GmVUulfnyTKApzevS6sJCU
         8R3qiqG4YocnJRBxDntMMWaU5UuV4jaqPtFBfhcOjwBhilaIy5Zpa2/h0FCuK+KdDCn+
         qO6Tih+dfQlj9eTaWjJi2GGdUXzZthOfsQ0UJW92ORA9sYmFGBT7df24rWvaxfyOnsU7
         PqEw==
X-Forwarded-Encrypted: i=1; AJvYcCXML+huhtGDl1ArQRjQkrv2ORa2n8L7YAmV2qhNvPPgcqGLB3GB6hnTJVCX1bSBQ8EIg8o+vNqDN0EtFonVWlt3@lists.infradead.org
X-Gm-Message-State: AOJu0YybFAs4qTtSXa1IEUus7n7R1pDYjmiq+cS9Hf1a3Phv6+ARExC+
	zV0mvBfzHvdzmnmAEuIHzFR9QE4sfAAplvAo3nzDULIK/2ISi/Xl09xVh4iWnNp8a0R9QmxNc1A
	fN1xbQsT9UrINT96WeOvwaPpfDtbXWYM=
X-Gm-Gg: ASbGnctY859jhUlRTv+WET6H4gUnVosLIPDYlAs8B46E4c7j1I/hI6keCE6GqOqNN40
	te+BavhoavHHfRIyHfV+6qGLp12RZf8eduqcIfEPpFeka4O1G/mjEWSRdFQVa61ABmNb/kDJC8x
	dNhzTNRKcZRyBe4KzIuDrBqERm3c66NJclo+DE9RbyZgAEgI/h/NTPjE7xJ/7v6800ijwGVNo+W
	+Nvc0qDbe/7HqpxqG5D
X-Google-Smtp-Source: AGHT+IHSzD/UXtsWQJdvEcDe5zgMaGL6TzhZJBGJKbCYfBRewNgR6XMtJmfU671bOH5GYMzsf1oInRq2RbM4os8qMC4=
X-Received: by 2002:a05:651c:4393:20b0:354:4e91:5163 with SMTP id
 38308e7fff4ca-35cc1503303mr4719061fa.10.1758015735185; Tue, 16 Sep 2025
 02:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250916-flexspi-dts-v1-0-61567f969165@nxp.com> <20250916-flexspi-dts-v1-2-61567f969165@nxp.com>
In-Reply-To: <20250916-flexspi-dts-v1-2-61567f969165@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Sep 2025 06:42:03 -0300
X-Gm-Features: AS18NWDVVl3vA9anWkY4oi_Wwrstjq0EwNsL75GDNd_C0krbxXIk6QAPlbESP7c
Message-ID: <CAOMZO5DYWenp7fzrthWUiEyOHAVcL02wBqvzA3RyPqiQ8CzGUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm/mn/mp: limit the max frequency of
 spi nor chip
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_024219_686478_B6472092 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

Hi Haibo,

On Tue, Sep 16, 2025 at 5:57=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:
>
> The spi nor on imx8mm/mn/mp evk board works under SDR mode, and
> driver use FlexSPIn_MCR0[RXCLKSRC] =3D 0x0 for SDR mode.
> According to the datasheet, there is IO limitation on these chips,
> the max frequency of such case is 66MHz, so add the limatation here

Typo: limitation.

> to align with datasheet.
>
> Refer to 3.9.9 FlexSPI timing parameters on page 65.
> https://www.nxp.com/docs/en/data-sheet/IMX8MNCEC.pdf

Fixes tag?

