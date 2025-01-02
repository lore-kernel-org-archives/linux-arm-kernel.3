Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55822E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 16:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQWl9L8CcgSposYnH56+tEXk08+8VfZVZgvipoYZwrE=; b=IMcibqu7xR0sBEXx4SaDbTdMPB
	Qgt354darPSrYACEHBHrbWbxVZ0yqG+L1fBOdDyKk0jNa7cC09JCG0K2UANMiAROECluoSSeqMIz6
	GcTqI1jbRcYfTJSnp/eb+oYBvfZWkp9jXb5J6QWx18BXJTENQD6/8t3S+ZRmhwKF6Fimwysojsbb0
	+eqsrVTLO1OYWp0eTWhypmvVaYGXMZ57+2D18pKAWna+Emdka0j9t/A+YPV/sdTg1COKkxn7GuOk8
	VeyCBgX4j7jPAWgZmaHT6JNpSuj5EM+OA+9tRil6Ryg/RVO7hsOJzsfssXxVtUZfGW44Cgqh5gdpa
	oYEYVQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTODZ-0000000ArFm-18nX;
	Thu, 02 Jan 2025 16:38:41 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTO9A-0000000AqMq-2POP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 16:34:10 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 502GY5DZ2272314
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 10:34:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735835645;
	bh=hQWl9L8CcgSposYnH56+tEXk08+8VfZVZgvipoYZwrE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K8XepUVBYPIGdoYnPR4bO8iko+IYTW707iQHBC8pZyWRgUB9vbYsazg8CRXvMAYFL
	 OB/cSeXozbBmBe44Nfpo/JGtZ22tTbnmXXyHpLZidoZO4qPt4dmKU4HFF0EACvETVk
	 /d22BYzAz7focxJ/ZL92q2RJ94FHlGxckO/kELeI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502GY5n1007873
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 10:34:05 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 10:34:05 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 10:34:05 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502GY56A061055;
	Thu, 2 Jan 2025 10:34:05 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Anurag Dutta <a-dutta@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j7200: Add node to disable loopback connection
Date: Thu, 2 Jan 2025 10:34:03 -0600
Message-ID: <173583563568.269479.10047461594837475356.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241127075644.210759-1-a-dutta@ti.com>
References: <20241127075644.210759-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_083408_712263_64F84815 
X-CRM114-Status: GOOD (  15.24  )
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

Hi Anurag Dutta,

On Wed, 27 Nov 2024 13:26:44 +0530, Anurag Dutta wrote:
> CTRLMMR_MCU_SPI1_CTRL register controls if MCU_SPI1 is directly
> connected to SPI3 in the MAIN Domain (default) or if MCU_SPI1
> and SPI3 are independently pinned out. By default, the field
> SPI1_LINKDIS (Bit 0) is set to 0h. In order to disable the direct
> connection, the SPI1_LINKDIS (Bit 0) needs to be set to 1h. Model
> this functionality as a "reg-mux" device and based on the idle-state
> property, enable/disable the connection bewtween MCU_SPI1 and MAIN_SPI3.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j7200: Add node to disable loopback connection
      commit: 6b51892b31fe83fe7cc8cf69e4bf7721cf08951b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


