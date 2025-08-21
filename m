Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC15CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTAUFqQj+Srt76jvVzsWjRdQqnKeQiisH+eWp10upeM=; b=H3NJExRUiEE9Kcpkf32GqHsUBA
	z7fMFpMJLNHZhSfmNNhShO6U1lxk3OhnWYJ/doz1nSvQdpfFpRpMcsN2LUOpABUp3qa/4bqpXWiPg
	qgEK+U9ExM8iIqeDO/TTGct3mtzvRzpQ/5eVq6mALVvBwmxOoG4/di+lrnr0drH6uxvJiNPFWd+5l
	P8bke9Oqlcb10R06IZjo/kv18M2MiAn0mnkoWLKWPkYoN8hQcsAISKEe/hBkUR24NH9v5qs/T+uM/
	jDbaCWrhm0ousxrdKEtbEyh/9QpOtcg0VDuAOFQw6YIblk+6hzR36QpJdVB8FjS26KC/tn0pIBekW
	jRuyF6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7FK-0000000HN2c-1Sfb;
	Thu, 21 Aug 2025 15:30:34 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3YW-0000000Glzl-0APQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:34:09 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57LBXsjW3422679;
	Thu, 21 Aug 2025 06:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755776034;
	bh=oTAUFqQj+Srt76jvVzsWjRdQqnKeQiisH+eWp10upeM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Xjb4qtzu8M6RZpELdSuAm2Boqv1Punv/CZ41zdOAImU+FvVK/Q5PvtUdbJthVefdP
	 u4jLPevxs2LDibXoejsGNNU0j6KstqWcC93Vq16QreyE3US8BI8zmJ5PnglX/nEbvc
	 FgbHbQjYCgXS+6KtoWFyYIHLnKv70+cr1+SKAxgA=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57LBXsV22789075
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 21 Aug 2025 06:33:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 21
 Aug 2025 06:33:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 21 Aug 2025 06:33:53 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57LBXrPB1799874;
	Thu, 21 Aug 2025 06:33:53 -0500
Date: Thu, 21 Aug 2025 06:33:53 -0500
From: Nishanth Menon <nm@ti.com>
To: Randolph Sapp <rs@ti.com>
CC: Michael Walle <michael@walle.cc>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <d-gole@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <detheridge@ti.com>,
        <matt.coster@imgtec.com>
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2: enable the bxs-4-64
Message-ID: <20250821113353.mhumx2omf3i5mdtv@cubicle>
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-3-rs@ti.com>
 <20250813151819.5rthljjrpryfwezz@skinning>
 <DC1HU458W3QA.YLONSMYKK0C4@ti.com>
 <20250813181300.xfpsu23arx7xy4fy@anointer>
 <DC5C5JA237HD.1ACBQVG1LYQ7Z@walle.cc>
 <DC5T752T3P8B.1UC57G2GH35Z5@ti.com>
 <f0353dea24751f2f2ad6e7735232b933@walle.cc>
 <DC6P6R1L2ZED.2UR8XRHH5RPJ0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DC6P6R1L2ZED.2UR8XRHH5RPJ0@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_043408_167787_DFBCAE92 
X-CRM114-Status: GOOD (  13.40  )
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

On 15:47-20250819, Randolph Sapp wrote:
> On Tue Aug 19, 2025 at 1:38 AM CDT, Michael Walle wrote:
> > Hi,
> >
> >>> Apart from that, we now have two series which partly overlap.
> >>> Should I repost mine, as that's more than just the DT entry? (Which
> >>> doesn't work as is, I'd guess.)
> >> 
> >> Ah, I don't see that series on the linux-arm-kernel list. If you can 
> >> forward me
> >> that I can work around whatever you've got.
> >
> > That was the one Nishanth mentioned earlier:
> > https://lore.kernel.org/linux-arm-kernel/20250716134717.4085567-1-mwalle@kernel.org/
> >
> > Also this:
> > https://lore.kernel.org/all/DC5KCSEUZQUJ.3KPENNUQBUFM8@kernel.org/
> >
> > -michael
> 
> Ah, alright. I'll hold off on this series until the AM62P related sections you
> were proposing are picked up.

Are all SoCs impacted by this need? just hold off the am62p changes,
perhaps?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

