Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455B0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/A5LzUgjLDfaIZn/ibgkg/r05V6xjs3r44I0TyV3l2M=; b=FeX7Ghw1wMa6b8ibbeYf+aqE9X
	cOQ5lO22FlRXhy7V4HED9Vdf1QOJgbLFPoxZtQMxCzSTrqi7mxPOT9WAbOP0TEaJn6MUfNltVxhkV
	qOGcaIgfoktaQpeRc68uEqCGvrYbQKdVdCMcSFoX+swWzvJBLCAPuaVMkCzw2xxJKnX8Es5nfCcQX
	myL7tgKwFZ737//a5tc3PL8nuis2MaOaLhGB0FsEY5Tlwurz2bFxLL8c0ZNXev/4XBD/Y+bHZr6Fa
	2Gql5e939F0wglqDkJgq+LatWtmb1fIQcbHSPD4edIrScbypbU8trSfZu2IgWX+Alyx+stiJQFfua
	XhgMzwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDFM-0000000BLQ7-1sKD;
	Thu, 06 Mar 2025 15:34:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD83-0000000BJmt-316k
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 15:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/A5LzUgjLDfaIZn/ibgkg/r05V6xjs3r44I0TyV3l2M=; b=jHGFHRpf5rBV2E0J7XECsLnL5U
	8CUQ0OEkfqA9iS742NyaGSPSG7ZRnQNMPytdFYmAqhGP2gQYU1Ncg+1vTXuXcBgjtmQ5ducdVI1nj
	42vxtBr8uJaDMuxbeNu7x6pe9qPb96xroh34RYgSmMFGcz6pYlrd0LE4I5QB5OpqBod7T6wkfAduU
	piNs3BS7PyuHfBmqcwvni47ZkPTQZJbNGy9BjJqTj5sJzt39bYj2Gq/OuUE5/Zmc/SCkF9b9agxNg
	1wKY5Q8S5nlxAMDjMugLzw0kt0FBXFL8c4HhaMCpBD1zgBVKXEVKfWnVdkd3FZqh0lw6rv+6Kb7Jt
	fTvHIUJw==;
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqD7z-000000018Su-0484
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:27:18 +0000
X-CSE-ConnectionGUID: xxiKjAxeSTmGXV/kVDUV8A==
X-CSE-MsgGUID: k7Y5oJ7jT6Gpp2h/+8ehBQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Mar 2025 00:27:04 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9225D400091F;
	Fri,  7 Mar 2025 00:27:01 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/13] arm64: defconfig: Enable Renesas RZ/T2H serial SCI
Date: Thu,  6 Mar 2025 16:24:47 +0100
Message-ID: <20250306152451.2356762-14-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_152715_398529_2689E398 
X-CRM114-Status: UNSURE (   6.36  )
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

Selects RZ/T2H (aka r9a09g077) SCI (serial) specific code.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v3->v4:
   - Remove CONFIG_ARCH_R9A09G077=y
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..1403848d659e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -492,6 +492,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RZ_SCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
-- 
2.43.0


