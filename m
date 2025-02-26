Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC044C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 18:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nyrTkivqa5p9GTKson4Jh8E/hGqHDVIUjBOtaASPEQk=; b=iYMx9ULB42AcdSw4phFpVBdMUP
	CYnGe/hRTthO/jiXDtQISAfu3V92tXrTTW9Pmy8/JXVJu2Ko6nM5VexyDCJGbwyG1sfVYEPZnZwhR
	Q+UecRDZHeKLRm0PhOtDPI5QfZkzWP6rgt+W+OoCvX0QVcKPDke7/Q4Qlvsu7pFNN3DAqJ7bO4bxq
	TMNxn8qaSOvZES8doAB1hO7hiTWwsMw1sqXt1w2CgWm5mXr2qxvYj/hiyxLq5l8QdLYxFXhhxGYMr
	nxxP/KJiIyZ6L5FH/m3vr7UCAn1oWfx9OX3xOeZbOnCdL5MVfGX2ncfk276ut8ruB3rox8vG2jFUs
	r2VS8omg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMZJ-000000053QV-3MDM;
	Wed, 26 Feb 2025 18:55:41 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMTv-000000052PZ-14wd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 18:50:08 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QIo2KI1550254
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 12:50:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740595802;
	bh=nyrTkivqa5p9GTKson4Jh8E/hGqHDVIUjBOtaASPEQk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C5N51EM5GbMuZuZRgqOlYaCgVonW8i8DNZvRxAaxH7Llusaey0UOpy62uEMR/IySQ
	 qKAPBri6Ah0Avm9Y640WaFByea8fpQkHZd0LNMtCPO9bv+hm6D4mzfSKbHylWt5O13
	 ouqwxlIYtoC3ncq/sOsKOWSTuNntp64D/qbKRKyI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QInvkG108623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 12:49:57 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 12:49:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 12:49:57 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QInvBM082351;
	Wed, 26 Feb 2025 12:49:57 -0600
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>,
        Guillaume La Roque
	<glaroque@baylibre.com>
CC: Nishanth Menon <nm@ti.com>, Andrew Davis <afd@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] firmware: config: ti-sci: Default set to ARCH_K3 for the ti sci driver
Date: Wed, 26 Feb 2025 12:49:56 -0600
Message-ID: <174059578810.2603560.7052142220899568448.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com>
References: <20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_105007_394981_52015029 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Guillaume La Roque,

On Thu, 20 Feb 2025 14:31:17 +0100, Guillaume La Roque wrote:
> With ARCH_K3=y we cannot enable TI_SCI_PROTOCOL=m because
> ARCH_K3 selects TI_SCI_PROTOCOL.
> 
> Modify the logic to enable TI_SCI_PROTOCOL by default when ARCH_K3=y
> allowing us to submit a future patch to remove select on ARCH_K3 without
> breaking existing users.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: config: ti-sci: Default set to ARCH_K3 for the ti sci driver
      commit: 9a9b7cd77b2427d0722fe52301fa270690928989

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


