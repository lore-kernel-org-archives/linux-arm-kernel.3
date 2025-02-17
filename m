Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF4BC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drEhK3cDQdkh38kldJ0Y/4vDN7xVhcKxyh6okSkh4XI=; b=gtyA90E9Wqh6bvE+CPJO69cdWF
	Ttl/FDzlqxm6gN1Y5kLJ77RyGJjF02iNEku2fZZWPJg3U6NVTmSNYMF5hqQWXrtDt/8DW/p/4TkQc
	psgnUy5VtLA21GvHF57KkpW7+fS+SSFbHbysWbt2C5ivWKrUT3B7RSE5S0tLPpVsUeg+CRVzY8Xck
	PLhSm8YvDO+zecu/qC9Ske3JBSlbml/xOfn1rPVHLiIqIEWfM/AbEaBmHjo1xzMiwwtmE2yzdJoGA
	TEzrqcYkiZFwbQGdtXjyqS9ZLTdkZbjUik6iSGV0U92eHQHhnwMfGehSsMB2UvAE0m2Rsh4cR0oMq
	THtYQcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0Fu-00000004SEp-3gVX;
	Mon, 17 Feb 2025 12:29:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjymw-00000004DsM-3CZc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 10:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=drEhK3cDQdkh38kldJ0Y/4vDN7xVhcKxyh6okSkh4XI=; b=ezaPpQE9b4iaw7Tvh5GI4BbtLb
	YR0I83ozt3APALnVU0DUgvWF8CW85CY+cXikMtN82kh+LfspPjCwpf2km12ti3JrKaY1/grgaVHk1
	vxmPhdTqM+vA6ZWxpDpDdkMAmUAB4IqGFz/6lhkLVZcreCahsLDOXPloV80IX7a8GTxBjvpd6kiDJ
	IgKj754aa/cLMhWInfk3jfRoPZElaAJJkHKJmjO9usKOvnuRy2e1x1QCtOz40SXuf8T1zCL9o14TF
	VDgXP4iCJvPoIS91ZavNweYJIAZ/XtwpfET2s9e+eJ3+ISJbBcg9gZyGDsm0jdIM5Pc9oLfFPAaIW
	yTrUWWoA==;
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjymt-00000001mQQ-2FZI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:55:45 +0000
X-CSE-ConnectionGUID: dH1SiHvuTcqhKOIHg+ullQ==
X-CSE-MsgGUID: pBJC6dxFRmaq9ePj81h7vA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2025 19:55:32 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D0FC84280572;
	Mon, 17 Feb 2025 19:55:29 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] defconfig: Enable RZ/T2H Soc and RZ_SCI
Date: Mon, 17 Feb 2025 11:52:14 +0100
Message-ID: <20250217105354.551788-14-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_105543_938293_6088A61B 
X-CRM114-Status: UNSURE (   6.48  )
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

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..a1cc7a37386d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -486,6 +486,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_RZ_SCI=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_QCOM_GENI=y
@@ -1457,6 +1458,7 @@ CONFIG_ARCH_R9A07G054=y
 CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
 CONFIG_ARCH_R9A09G057=y
+CONFIG_ARCH_R9A09G077=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.43.0


