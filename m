Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F76BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 15:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAQDfFMNbJlGJYMgDRZ9BTVJcqKIy+XzJe6gVZr4FxE=; b=qpJOiLHjgriRUa38chtoSnyi60
	u3l6+6xAEsBbEpjA77mTkQhXTgKQTHtJgOhwNcHW1Y/FfBZJw1oR7Hsifyjq+BPby8zd/pG11ox1t
	3QcLnMvAYOktLxA3qEF5VzL3Utv76bqvNPSIVRIm2DBmtLg7zLpaK07hGCgv1TnyUqDgjltXiExif
	oRTqhUIycXPTlSxDI7ZydAu00zoKLodYH/y8a0ihaDPJDprYgQvX58iujqRxxzhkAwjCXnNjR3xgk
	Ir9205qs773z6aSZnN5Cq+Nm618tIyy6Ej97bmxVbneVvNYd+Pi1EVE98knProX4L3a1OTW0SNuiM
	yiMvk7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYP1-000000093yb-38Nt;
	Wed, 08 Jan 2025 15:55:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYNl-000000093aM-28xq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 15:54:10 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508Frx8N2745865
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 09:53:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351639;
	bh=cAQDfFMNbJlGJYMgDRZ9BTVJcqKIy+XzJe6gVZr4FxE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XSV9K2NzXK245w+T/IfgEYRL401J7vKenS/pim/kf4pd/ixxe2p3jyLlKjNG28MzT
	 oEKtxlplgMAv54PX7ZAjW0guH45QSwrBhRQ7nmfcQanXr0pEMt3/cSetRulexwgggW
	 PQiwKSy/wxDTJyG1CCTjtjAAEfO8mvMeDq3WXcOc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508FrwY6017301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:53:59 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:53:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:53:58 -0600
Received: from localhost ([10.249.32.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Frwo8090017;
	Wed, 8 Jan 2025 09:53:58 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Francesco Valla <francesco@valla.it>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-beagleplay: fix DP83TD510E reset time
Date: Wed, 8 Jan 2025 09:53:57 -0600
Message-ID: <173635149147.1208481.6150266016867373341.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250105162630.243899-1-francesco@valla.it>
References: <20250105162630.243899-1-francesco@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075409_658402_4E17C21B 
X-CRM114-Status: GOOD (  17.24  )
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

Hi Francesco Valla,

On Sun, 05 Jan 2025 17:26:30 +0100, Francesco Valla wrote:
> The reset deassert time for the DP83TD510E is incorrectly set to
> 60000us, while the datasheet states that the minimum time required
> after an hard reset is 30us (while 60ms is the time required for the
> Power-On Reset after supply stabilization). The error probably arose
> from the two timings being indicated by the same symbol (T2).
> 
> Lower the required time to 35us, aligning it to the value required for
> the PHY to complete the reset AND to be able to accept the RMII master
> clock. This saves ~60ms on boot if the MDIO driver is built-in.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am625-beagleplay: fix DP83TD510E reset time
      commit: eb2008a8fcd243fcb7d646bdf1909349b3faec6d

Given this is a minor optimization, I chose not to push for Fixes tag
on this

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


