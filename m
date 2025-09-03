Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A180CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BDLROrHANQ5rnFjq0nioXWqPbh4i6CKj6MmqSMnW3w=; b=wOFcgMDMemmFoZW12dXCAZ0DnF
	nnywM0M3Ay4VYI9N4bUIpixdV8bw/PcLGMfhm2EgnZEUIVW7XlBigMTgYzXa54KJ52UovW3z2ceyQ
	o/ONW4Zuru4adYP4UVipr4rDI1T4GfasHrExxQUfwLDjsNEA6+xWP/ZoIXBIJiG3DskB0UZk/KzJx
	gV5fTF9xFK+Kf4/bYz+MTa/xyY5+ZqLJLAtyAX0VGqH3Ip3Iz5Fzmi4LQxWkb1w7GobPOA5RUPIsG
	b+pKDHoKMbiXhRMu+/4XlcTNhkg5AzFX/9EMJDt3hldoQW+cSpdhEQNMGQtk8AVM/lkeE8PB2nY9z
	66kUBdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uth8r-00000004iC0-2eiI;
	Wed, 03 Sep 2025 06:38:49 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uth2p-00000004ff1-3z3q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 06:32:37 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5836WV6Z3163068;
	Wed, 3 Sep 2025 01:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756881151;
	bh=8BDLROrHANQ5rnFjq0nioXWqPbh4i6CKj6MmqSMnW3w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Yye0lol7VcI7GZgSKUI+cL6ViooyhfCuFSexWnMj1n8siQ6Y0S4yYbi3IUDCydIvM
	 yUpX7KzKcy6K7MKpWExk4F8GlzL3WPPosbbwnfHzjOW0EFllv/7Ri/VYdDKdaYYq0T
	 e5DlyGy5gAx664P8PnWmKJT+iTyBbjMFm0niMDcU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5836WUkI3398227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 01:32:31 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 01:32:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 01:32:30 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5836WTiU839700;
	Wed, 3 Sep 2025 01:32:30 -0500
Date: Wed, 3 Sep 2025 12:02:28 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <devarsht@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am62a-main: Fix main padcfg
 length
Message-ID: <6e206470-89a2-46c3-8fb9-357a56b2d03b@ti.com>
References: <20250903062513.813925-1-p-bhagat@ti.com>
 <20250903062513.813925-2-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250903062513.813925-2-p-bhagat@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_233236_028367_F5C0B1F6 
X-CRM114-Status: GOOD (  10.78  )
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

On Wed, Sep 03, 2025 at 11:55:12AM +0530, Paresh Bhagat wrote:
> From: Vibhore Vardhan <vibhore@ti.com>
> 
> The main pad configuration register region starts with the register
> MAIN_PADCFG_CTRL_MMR_CFG0_PADCONFIG0 with address 0x000f4000 and ends
> with the MAIN_PADCFG_CTRL_MMR_CFG0_PADCONFIG150 register with address
> 0x000f4258, as a result of which, total size of the region is 0x25c
> instead of 0x2ac.
> 
> Reference Docs
> TRM (AM62A) - https://www.ti.com/lit/ug/spruj16b/spruj16b.pdf
> TRM (AM62D) - https://www.ti.com/lit/ug/sprujd4/sprujd4.pdf
> 
> Fixes: 5fc6b1b62639c ("arm64: dts: ti: Introduce AM62A7 family of SoCs")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

