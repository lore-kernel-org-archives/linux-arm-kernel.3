Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7231CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 03:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlIHiZicXqonxoIZ8gXjkv3nF3NV4zWaAnN3p0bvutQ=; b=L0vaPrhqPU2MhvaTNuz3/Dgwdn
	+a1NlDpBj5sWVbSqJt20yxPybWjmv2JpYKvuMpEj1UWhu/M5Kk2DkD5QWCGO8RGxk086s/IzFAKbL
	5f3k4JW6CaWjkHaLNB7SIO5e+5YvvrKiHHO2iXkp0Yr3B4B16aDBGc2l9qQeWvySQPkBp0VbV1ow7
	qj/3RgS2VHUMqjMcq1rFf1/bdUMImAOQxIpco78Qm3n+QckY9lKOwzM/X/N297DwxJiesS7y5wFOR
	skj6xCPeFwX6kOXrmUHnxmycIvHhnPKOgLP5Gh9t5dXeg5jyS+RrwXjAuDninBRsyaeLHb/Hav6lu
	hNcdaKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlBn-00000001IxD-3RMe;
	Fri, 15 Aug 2025 03:33:11 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umksN-00000001Gnf-3xvu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 03:13:09 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57F3D4eQ2522137;
	Thu, 14 Aug 2025 22:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755227584;
	bh=tlIHiZicXqonxoIZ8gXjkv3nF3NV4zWaAnN3p0bvutQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KM5sqvmZklivQ31BBInk2GRL+teaOmiynz9Z07o/F5CCSkcTz8uJZTlidO/9r8YDN
	 p5a9Mqk69vmOJlf1rJAjZ13iJiLXGFoFY1A9Fb8iRYkRmt7A0jlTuvw8eFTVCUg+Q0
	 cILXlRbX3mKodeiikqxjQfGnydfNPlk05WXKprCk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57F3D4CR2294493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 22:13:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 22:13:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 22:13:03 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57F3D3nd390516;
	Thu, 14 Aug 2025 22:13:03 -0500
Date: Thu, 14 Aug 2025 22:13:03 -0500
From: Nishanth Menon <nm@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Beleswar Padhi <b-padhi@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 33/33] arm64: dts: ti: k3-j7*-ti-ipc-firmware: Switch MCU
 R5F cluster to Split-mode
Message-ID: <20250815031303.ms6ieu4iovho5mp6@desolate>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-34-b-padhi@ti.com>
 <f49bf01b-6704-4a03-9b3d-7f7495e544e0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f49bf01b-6704-4a03-9b3d-7f7495e544e0@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_201308_024476_12C54CE1 
X-CRM114-Status: GOOD (  14.59  )
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

On 08:11-20250815, Kumar, Udit wrote:
> 
> On 8/15/2025 4:08 AM, Beleswar Padhi wrote:
> > Several TI K3 SoCs like J7200, J721E, J721S2, J784S4 and J742S2 have a
> > R5F cluster in the MCU domain which is configured for LockStep mode at
> > the moment. The necessary support to use MCU R5F cluster in split mode
> > was added in the bootloader. And the TI IPC firmware for the split
> > processors is already available public.
> 
> It will be better to mention sha id of bootloader with links, may be below
> tear-line

In the commit message, let us stick to just what the kernel folks need
to know. Specifics of bootloader etc can belong to the diffstat -
unless the patch has direct relationship to the bootloader in some form
and we need to refer to that details in git log in the kernel (the
diffstat and discussion information is already on public-inbox if anyone
wants to do "deep research" :P ).

Device Tree is about describing hardware. Let us keep it to that.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

