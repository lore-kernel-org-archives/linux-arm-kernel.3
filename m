Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A1FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yQoYy4cuA4mzA0DKHv3VzkC9jasrIyQDTDAp6AzCb4=; b=bUkCf+RWPvLsSPbDnvAKIw5ZxF
	yJqa11a6EkY4M+NWYWX+XgmUp0f9iIGvP6R92VItXvo1utJ1OiAK4MXdBF6AQQRAXsOxlJIhGHfLD
	fmopVG6aUt3ssgOHUCgj7B/nNNjhqaRcjdksSNkuadBxFREgzO8rvTnWxTni5MtitolPWp/HQb0j6
	EcQZbGg0dMHPxuyj4VdHagyNKZXZhx/eXmKR4uZmBrmgeJcJ1LvgVSWd7KkRdEkqkkD/MzJ0o9Bzk
	TjttS/PmybvdV6TA75KZ2EfQGXUsTaZO3VVErdidybeDGNURLos3q8xj2NriRh6gHMlek0wrYlP2v
	u5AdS0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA46-00000006zvR-34zf;
	Wed, 12 Feb 2025 10:33:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9XZ-00000006tfy-2ef3;
	Wed, 12 Feb 2025 10:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739354420;
	bh=4OBZG7uX/8CsjJnTc/XKtHc+h4pbWEM3iLpBrSk7XGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mNP2xFoNXIDZ7NNXdzVu7NRA4380M6RigKXK+u401dsLvBr+ubh0hYGfQqMGB3jBW
	 cGsndad8GZZ43KSuv05hI/rIl1TEs7ZqfCy81jLQ9G8w+IbfMPGdOzUZWVT7qYbO3o
	 TH1Cr3Rf0Qt7vVtIiFpzb85NSHDx6IdcxL2k+W0Cb4iydppLdZN2lmkjYpIQvJsRrA
	 79dPOXNi3496vj6M/NyPRqtTkypqVwn8YjsBJlLZWljnzlaCwnq+uKZquteTzpQV38
	 wE+D6EtbCF0uvBNwYbAHuLf6UhJ/JC+c1sPLszRkNByTclR0yQ/bHChyl5mct0tXXd
	 A4Nwbq2ons27g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A648717E154E;
	Wed, 12 Feb 2025 11:00:19 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	shawn.sung@mediatek.com,
	fparent@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pablo.sun@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v1 3/8] soc: mediatek: mtk-mmsys: Add compile time check for mmsys routes
Date: Wed, 12 Feb 2025 11:00:07 +0100
Message-ID: <20250212100012.33001-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
References: <20250212100012.33001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020021_813681_360B5F63 
X-CRM114-Status: GOOD (  13.19  )
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

Every MediaTek SoC with multimedia capabilities has an array of
structure mtk_mmsys_routes that defines a multimedia connection
between hardware components.

This connection is activated by writing a (masked) value in each
specific register, and the association between from->to path and
value to write is expressed as an entry in that array.

Failing to set the right path does not give any meaningful error
and makes things to simply not work as the data will either not
be retrieved from the right input port, or will be written to
the wrong output port (or both): since a misconfiguration may
effectively still be a possibly correct configuration at the HW
level, this may be only giving side effects in terms of simply
getting no functionality but, again, no errors.

In order to reduce room for mistakes in declarations of the
mmsys routes, add a macro that compile-time checks that the
provided value does at least fit in the register mask.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index d370192737ca..d5f6fbdc6f72 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -80,6 +80,20 @@
 
 #define MMSYS_RST_NR(bank, bit) (((bank) * 32) + (bit))
 
+/*
+ * This macro adds a compile time check to make sure that the in/out
+ * selection bit(s) fit in the register mask, similar to bitfield
+ * macros, but this does not transform the value.
+ */
+#define MMSYS_ROUTE(from, to, reg_addr, reg_mask, selection)		\
+	{ DDP_COMPONENT_##from, DDP_COMPONENT_##to, reg_addr, reg_mask,	\
+	  (__BUILD_BUG_ON_ZERO_MSG((reg_mask) == 0, "Invalid mask") +	\
+	   __BUILD_BUG_ON_ZERO_MSG(~(reg_mask) & (selection),		\
+				   #selection " does not fit in "	\
+				   #reg_mask) +				\
+	   (selection))							\
+	}
+
 struct mtk_mmsys_routes {
 	u32 from_comp;
 	u32 to_comp;
-- 
2.48.1


