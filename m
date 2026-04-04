Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD2E63FE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImHUbCmanc0Ar6XtjjzggRp554WxKEvvo2Sre5Dw0wA=; b=viGpRTCTMgtsMn6t/llA4Dn422
	aPGuiDEYofV7CzhWcXHfeUPDLZESsbTkZssEwlfQs/eaN2B2ceHiaCRn8Uqda896RywTB9JPEnsCe
	4yafwBW/Es3uAVRQCfq5TsAD5XYYH/xgkz637CMG1ch8+FeblDYU7mfoNUN0Xk8Z0qaHWo64l1IM2
	jQe+bAUQaufLye4k95HyErBDbqJ83K8yYzU4iwcYOEvckKSRpvJfw3tQQyc3HEmXz14qMnwTMSX1L
	PzRfQWq39fv5/40s+C62SJHf7nZHlKNr6bVh5oWPptrgCSqWUfhhNmvXtZEyREiUHJFt0mg6urK1g
	upRkKk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94L3-00000003cAd-0KXE;
	Sat, 04 Apr 2026 16:59:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w94L1-00000003cAJ-03j9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 16:59:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0732D40212;
	Sat,  4 Apr 2026 16:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDF2C19421;
	Sat,  4 Apr 2026 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775321949;
	bh=2nmDBifOoextQmoTG695I77JtU4IfJ6hHi18F/uovOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pzHa0ltJ7P/3nc4QK7/bV808HOZOGXaMyVekR/DB1WE+018orzHWLwztSYy1/aXtb
	 SzI8tsEInej9eoHjBzyIJaVGBr9u74dLFfrXcTThineYb99ODPDwsaOS5PNoPpADEf
	 RKWNJ7Ic0kSfp5FmUOXVQ6PFQBKcfI9b1bar1hvVu+oDjNbThyquuuXTFP/2f4hh2r
	 sNZXBYXoEYlp3D9Lzsjn9fgXUhLg5zak6jG42FprWSVJLQdnerHFANSStlrij56Tl/
	 nq4W3Agf2uSQ+xhFuLGyUpc0A63CtjXoWAelZzEtiaPysfp3k4jpj5PHDxaigPyBx2
	 FsekL+yzYor6g==
Message-ID: <76355cb5-0b5d-4a29-9702-8d020a79f4c0@kernel.org>
Date: Sat, 4 Apr 2026 18:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 00/12] treewide: Convert buses to use generic
 driver_override
To: Danilo Krummrich <dakr@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Long Li <longli@microsoft.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Armin Wolf <W_Armin@gmx.de>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alex Williamson <alex@shazbot.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-spi@vger.kernel.org,
 virtualization@lists.linux.dev, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
References: <20260324005919.2408620-1-dakr@kernel.org>
 <DHKGQN6D0ANO.2QYY3JTM5435O@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <DHKGQN6D0ANO.2QYY3JTM5435O@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_095911_089223_696CA3BE 
X-CRM114-Status: UNSURE (   8.84  )
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



Le 04/04/2026 à 17:07, Danilo Krummrich a écrit :
> On Tue Mar 24, 2026 at 1:59 AM CET, Danilo Krummrich wrote:
>> Danilo Krummrich (12):
>>    PCI: use generic driver_override infrastructure
>>    platform/wmi: use generic driver_override infrastructure
>>    vdpa: use generic driver_override infrastructure
>>    s390/cio: use generic driver_override infrastructure
>>    s390/ap: use generic driver_override infrastructure
> 
> Applied to driver-core-testing, thanks!
> 
>>    amba: use generic driver_override infrastructure
>>    cdx: use generic driver_override infrastructure
>>    hv: vmbus: use generic driver_override infrastructure
>>    rpmsg: use generic driver_override infrastructure
> 
> I have not picked these up, as they have not received ACKs from the
> corresponding subsystem maintainers so far.
> 
>>    bus: fsl-mc: use generic driver_override infrastructure

I droped it from soc_fsl tree, some dependency must be missing.

Feal free to take it if you can, it is acked-by Ioana.

>>    spi: use generic driver_override infrastructure
> 
> These have already been picked up via the respective subsystem trees -- thanks!
> 
> Thanks,
> Danilo


