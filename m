Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5481C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tGZEF81c1hS/9Au4dc4XwLiGg9LAJ62Kn+70ovHwBgs=; b=047cSUOxhjGXV8llNEDAXBDiQp
	dUn+Big++gAwKKUb8HcwAhXBIApZbQ9QLIn5NTVyM7iUZ1lM7RAAvx7CVFsK1oQk/ym+hwL3LXYQq
	xcB3YUs8vHsxY+qm2N5lLDiJR836kKKlVY/1PRvl4sgivxQMLwCD6YAHJU/l1SrVXRCPr1lQ+fWC/
	Jaavu9NKBJBv2T4+bca6UaKmmvhMmBRwwC2QGdrZV11Ca07Sv1jjOTTb+5NeH9aiDqKSa0GhilKCH
	9X4dY1oXUOzKAeIjnhSRU2vg4HW65rkB4DIpcrcDHTvKW9qBnfHuF2ky6fGGwwK461iT5nBrEBBSo
	yUR2fy8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYn2E-00000002k2K-2464;
	Mon, 07 Jul 2025 14:41:34 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmqE-00000002hwC-3h0u;
	Mon, 07 Jul 2025 14:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751898537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RC3DxRxRmZ3iIL08vvhDve/tPUJD4Hx68N+0o1lTBpKz598zGm/bLkyVQW3FC+nCWhl0x+HKVQDRLQ95isIuZ7RTI00Cm3qKdSqJR3UgPwyVNER+goXJL+J1JIGZm896zDoKEeK0pgDl17lH+JGIar3MYFACLAJqIAsyWMoBNTU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751898537; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tGZEF81c1hS/9Au4dc4XwLiGg9LAJ62Kn+70ovHwBgs=; 
	b=HDGfWWlErtvEmMg6sP/g26Z2yVhJAMYjNfGKmw5iT5LD8L6u93dXFN6lGY9e6noCNdRLoeLFl8KQ2KXlOAwJ71FgIaGY5V9wN7mCd4qbsTN6nDgk0RemXqMoaQiOl/Ly6bHRMAaOf39Kl7N/+nTh/7f9iXzs8+jUiizAhndJG1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751898537;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=tGZEF81c1hS/9Au4dc4XwLiGg9LAJ62Kn+70ovHwBgs=;
	b=LeXiScxbRlnVG3YYxOCm2vxpt5Oy4iA4P9XGT6Tw5+hVcT0AugVIpxPdX0wITOWC
	w3RmaByW3eKznC5eF3UY9XfKYtipJTd+v/qjYoGizdCSTnBT6o1kPZKUeJ1KbF+y+Yt
	h12Nrs5o3LrYoZZFOcX+nVipDIyfWhxRIcRU4CYo=
Received: by mx.zohomail.com with SMTPS id 1751898534893882.0472378471675;
	Mon, 7 Jul 2025 07:28:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 07 Jul 2025 16:28:40 +0200
Subject: [PATCH] arm64: defconfig: enable XSPHY driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-mtk-defconfig-usb-phy-v1-1-4a5dd0d26402@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJfZa2gC/y2NQQqDMBBFrxJm3YGY2hq8SnGRmFGHkmiTWCzi3
 Rtql+/Bf3+HRJEpQSt2iPTmxHMoUF0E9JMJIyG7wqCkuslGNujzEx0N/RwGHnFNFpfpg9JZfde
 6VuZaQdkukQbeft1Hd3Kk11ry+ZRgTSLsZ+85tyLQlvF/UUN3HF+eC29xmAAAAA==
X-Change-ID: 20250707-mtk-defconfig-usb-phy-0db868842a31
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-mediatek@lists.infradead.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_072910_981259_0FA38A09 
X-CRM114-Status: UNSURE (   8.28  )
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

The mediatek XSPHY driver is required on mt8196 for working USB support.
Enable it in the defconfig.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865fe8edc54911213321d6f1278aae4..a3cd62f360a16bb9d63152ffc2e20d5df8158efa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1607,6 +1607,7 @@ CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_PCIE=m
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_XSPHY=m
 CONFIG_PHY_MTK_HDMI=m
 CONFIG_PHY_MTK_MIPI_DSI=m
 CONFIG_PHY_MTK_DP=m

---
base-commit: a89d580927679464582adf00ed40c8096fc434fb
change-id: 20250707-mtk-defconfig-usb-phy-0db868842a31

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


