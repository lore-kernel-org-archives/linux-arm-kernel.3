Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB449CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjH8UdBHf0HrwXBnky887kTj3Jl4zPVz38mQ8KQXbzg=; b=m9+RvwFYOug7AXL3FtGPvniCHU
	DSDi3OI8XadJiPfKHXUM+u25SrL9B9A9orTxxZ5TQ3gm6hiBOpwHCHVoYZfrE5XnctCgfQWlDeH/E
	LbhFStmLyH1WUWMzDhNqDDEBQY7shT+WT/b4AAwgDqQq/jB841IUriRczJs6j9oBd//gXpbrsZF8J
	9RNBPMpPclIIBSdzMhwYNak1MxTx/xk8CloPgUJQMmNtRNIiauMDRQuB7L7e7jaojOjufZFx1CvqG
	aNiJXXoXJUjmu0b6CwkLigDP8bBTAtFttfb/hk0K8dWf1XOBgrF2SUzhlJU9b4fHIjlGpsuCmfT4G
	Q4YAtyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbw-0000000GZGV-212G;
	Wed, 27 Aug 2025 19:15:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIp8-0000000G9yH-3BAL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45B51432B3
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 16:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221C7C4AF0E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311394;
	bh=zLiz6AkzyNnkBrQOVwv/VSA4M3l/zNcKpbwLcjJ+448=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jTHWpxXATY3CaEyQH+uS+P/ItI4kZnjwMDeObQFlhuk73fHfZTwT5HARLnzBL+vtI
	 14H2ZGWhQSzPX8gniBqdW7PB4a2cGecZ+Ch6rMI3pRrc7JFC0/jGo7fXOHrM7pX30H
	 FMRy/4NAQpvIXDVRRiED6LBV0F02Y0GYFctpZyDTC50whJ2Fyn3EJkzrYwSg8Rh5de
	 evn/2WyDsBmSszSpOpSN7OrQ0AsnbF4Yo0ZSB7jp9CzUU3QOXPD5GyO0BsRM/+Ni0D
	 Z/QFAZhmheC9D1Vu01RV1jNK8pbNjM/V3eD8A30Kud9jT2R3iyNybFIG2/FJ3p0LEn
	 SFS4Klj8qA6hw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so945448566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 09:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUd6/hqfGUp+x5nkh2dE8WGJ36LLpYN7EuZQCWZydEXU5UgQpVCKlrJ01Ni9x4LvnNMqBPMJIZoUbzCssZy8QYr@lists.infradead.org
X-Gm-Message-State: AOJu0YzgHZ1mJKHZlhumpMqIoKsuUjLtKpHZOiKs4hBxUjiq1Ug8TvEH
	9OejMGKkcFMXQRtjczJDY13mOVcmNftuhm8I0dvSFF50/HRJhl+qOiLQ/9oNgTGW5CT2pAEc/vK
	rCRtF9pResrUJvEpA+D23z0Ze00l28A==
X-Google-Smtp-Source: AGHT+IEXg6+7BprsV5EoZDhEEr6bgsBWXcf6QxNl0BWK2TTd4f7AIeyL6z6NHk7g97eiKGWG44PeeKjxlyiXe/1zEDQ=
X-Received: by 2002:a17:907:934d:b0:afe:ceee:87ef with SMTP id
 a640c23a62f3a-afeceee8bd7mr157915066b.46.1756311392573; Wed, 27 Aug 2025
 09:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250822153048.2287-1-james.morse@arm.com> <20250822153048.2287-11-james.morse@arm.com>
 <CAL_JsqKUSJjmyj-E6eduZt3S=x6v7VUR5JEJV_Ow6O-O49TgEg@mail.gmail.com>
In-Reply-To: <CAL_JsqKUSJjmyj-E6eduZt3S=x6v7VUR5JEJV_Ow6O-O49TgEg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 27 Aug 2025 11:16:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJDpEHBcWeCqxSiUjpyBs0gEJKVyyR70xJO56x-pYQHMw@mail.gmail.com>
X-Gm-Features: Ac12FXzE3A9FSJi0MT3IqGBLAftR8IWne7jiyyfQlU3jf16oWdruRH4E1uAnKzM
Message-ID: <CAL_JsqJDpEHBcWeCqxSiUjpyBs0gEJKVyyR70xJO56x-pYQHMw@mail.gmail.com>
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
To: James Morse <james.morse@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, 
	shameerali.kolothum.thodi@huawei.com, 
	D Scott Phillips OS <scott@os.amperecomputing.com>, carl@os.amperecomputing.com, 
	lcherian@marvell.com, bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com, 
	baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>, 
	Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com, dfustini@baylibre.com, 
	amitsinght@marvell.com, David Hildenbrand <david@redhat.com>, 
	Rex Nie <rex.nie@jaguarmicro.com>, Dave Martin <dave.martin@arm.com>, 
	Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com, 
	baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091634_836341_13BE41C6 
X-CRM114-Status: GOOD (  16.43  )
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

On Wed, Aug 27, 2025 at 10:39=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Fri, Aug 22, 2025 at 10:32=E2=80=AFAM James Morse <james.morse@arm.com=
> wrote:
> >
> > Probing MPAM is convoluted. MSCs that are integrated with a CPU may
> > only be accessible from those CPUs, and they may not be online.
> > Touching the hardware early is pointless as MPAM can't be used until
> > the system-wide common values for num_partid and num_pmg have been
> > discovered.

[...]

> > +static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored=
)
> > +{
> > +       int err, num_ris =3D 0;
> > +       const u32 *ris_idx_p;
> > +       struct device_node *iter, *np;
> > +
> > +       np =3D msc->pdev->dev.of_node;
> > +       for_each_child_of_node(np, iter) {
>
> Use for_each_available_child_of_node_scoped()
>
> > +               ris_idx_p =3D of_get_property(iter, "reg", NULL);
>
> This is broken on big endian and new users of of_get_property() are
> discouraged. Use of_property_read_reg().

Err, this is broken on little endian as the DT is big endian.

So this was obviously not tested as I'm confident you didn't test on BE.

Rob

