Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1105FCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9G+kMKaEAMkwP/BhuP5u5wT04WjwEoiyWlNSJLDnQU=; b=fALn9A1gPJm7i5fS+vwCa9O77o
	2z5EDmxIqGLJEaAvgYmRZwfCx2HydYIvAkpCc6jEVsCxIvle2iWdA1UBKpJqxZ9lgdlF7afnk6vxj
	GsSLfXjWjOUjMsKD9QZkr9CmPfWHvVvWTINLCVOKT9E71hSDMRsVJHzv5tvaaQkv7xjKiZNjBlNJf
	0LbHPDw9MSZye62ZQIz959ZeZDtV1s1IUleFAs8jifwMLlW2SGkYs8IEm/SPriIyKBJyKJSJvsIxD
	6CDVag5OF6YwSgMvNDSD4KQlSCSxw6hnM4PQ84plOxY1/NJsiJ0yyvFVYFEZcX3+0JQZMJNdRtOC0
	lwqysFMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLj-00000002Q3I-1M70;
	Thu, 28 Aug 2025 17:23:47 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbMg-00000001R7N-2CLY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:04:28 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57SC45LF2000489;
	Thu, 28 Aug 2025 07:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756382645;
	bh=q9G+kMKaEAMkwP/BhuP5u5wT04WjwEoiyWlNSJLDnQU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GgWj1biVWL5DARFBUTJ1hBxtBXfo2T79G/u/UAhrMbnweVzxOOV4nrh+tEQQefzR/
	 xOaP6X4YMcaf+UA1EEXN8IPEgkD4SDIi5ZqSYmZdsqMCyN67TOZ2JWL1A/xOGoOZ4Z
	 PuAxSJPguHW57k4Ln6vSzUAuAOl6ASwVG0c9CUjQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57SC45243444468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 28 Aug 2025 07:04:05 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 28
 Aug 2025 07:04:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 28 Aug 2025 07:04:04 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57SC44W6298429;
	Thu, 28 Aug 2025 07:04:04 -0500
Date: Thu, 28 Aug 2025 07:04:04 -0500
From: Nishanth Menon <nm@ti.com>
To: <huaqian.li@siemens.com>
CC: <mani@kernel.org>, <arnd@arndb.de>, <baocheng.su@siemens.com>,
        <bhelgaas@google.com>, <christophe.jaillet@wanadoo.fr>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <diogo.ivo@siemens.com>, <helgaas@kernel.org>,
        <jan.kiszka@siemens.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <kw@linux.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <lkp@intel.com>, <lpieralisi@kernel.org>,
        <oe-kbuild-all@lists.linux.dev>, <robh@kernel.org>,
        <s-vadapalli@ti.com>, <ssantosh@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v12 0/7] soc: ti: Add and use PVU on K3-AM65 for DMA
Message-ID: <20250828120404.dtg5n7owgsot6uzf@tightwad>
References: <yhbjfg7dqx3xud75rhwlhq7ayqa4d6wrsan2j7ki7ri3uynpeu@hdv2o33x4hdn>
 <20250828112434.2310936-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250828112434.2310936-1-huaqian.li@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_050426_695863_E3AEA8E2 
X-CRM114-Status: GOOD (  14.72  )
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

On 19:24-20250828, huaqian.li@siemens.com wrote:
> Hi Mani,
> 
> Thanks for your offer to help with the patch series. Yes, let's proceed
> with splitting the submission:
> 
> Please go ahead and take the dt-bindings through the PCI tree. That would
> be helpful to get them established early.
> 
> Hi Arnd,
> 
> Could you please take care of the driver code with the cross-dependencies
> through the arm-soc tree? The PCI controller driver has the API dependency
> with the SoC driver as Mani pointed out. Could you let me know which specific
> components of the series you would be willing to take?

I assume you have seen my reply [1] - I don't intent to carry code
that we don't at least build and let bitrot over time, and we do not
want to enable non-essential drivers as "y" in arm64 defconfig (you can
find enough references in the list on the topic).

[1] https://lore.kernel.org/all/20250729162338.so7evngndnysg4ui@cinnamon/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

