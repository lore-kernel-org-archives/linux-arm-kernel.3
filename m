Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1912CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=; b=mI1SiRwoxGDsC/YTQXnENGJKlu
	1gtRclJVkPoikA+byuq/DH9dVEkHNNkqpIrbB52bSU9GNlHxWfi/ceH5alG94V/2+cNs5dk1nt4ou
	Lw0sbcjbdd6WM/RXvyc1Erc6/5tk4wV/t7vy4G5BS+3YXBlC+dqxIayMh/obLT5/ZBdmNfPkLzJT3
	5JUsdahuDNPa/4RZ72tAFtH52raIicJjXtiQfIEah+ENjrOPWt/MqWwP2Py8a3u4cbI1jxm7Q8Hs8
	w/+qbMH21OM0zwRRW4uGdP9e1oSWh520HccXMTas/pjlcKIrOmPptZnhLz4tOtUckhK8rt5opDfkB
	ya08g8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBN-0000000FKnZ-1dyf;
	Wed, 14 Oct 2026 11:30:16 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxB5-0000000FKTr-2ffq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:55 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2175215a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977387; x=1792582187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=rjxfNVbkl92iGYs1S6niCnB4x0pt61x6OmqQadEg5P0aGkfblgyx78wUpnf0+23rjr
         q490AH6BKRQVNtH4G7QryyRXbh1KTaucizfKBthqR++g+IEVWPudIFvRnE/dE2ylXhGi
         iwbgXi4OqeVoy68H1zghBL5OZ6JIB4XYgUv7uZ57mwSYJGPH/uWKi3ro7s+M+EFJ+cte
         MCC2Ccv4hW1KnQmdQR/S5wEZTo909Pm+5j2tZvUbL5dP1vokGs8i7kkWf9dhNVb5ISMQ
         Zm+95FhTQ74rL/+lEs7X66b7ZTcLKmRtGdHK642dEhsbmmd9PQvmrNRx4itBhPwMmWfe
         qzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977387; x=1792582187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=x3Ky2yHqo7NFBHepU+c7MrjOApyRpDnIl7rZz2uKQJc8zEwBcQSmZ1aCnKGTSkRxxC
         /dea648wnO7dKdfU75nVRORaKWw3jOPWr+bWDRLoRJ63nE8n7DBCAijBFCjsd7LsZE1d
         Uct0EJR6TJPMHfCLLhKitfL8fVbEwFYHbYn/KMpok32iZAGw5EpQZpRomOHvxqLSKqqf
         4mTL2dFk/pDNQbGraId3G2TLw2eL7uFef08WLkt9AX2rPlfvwCZGV0KuY/xYbBivgx+H
         oTQrlrs1UPm9xiFv3KRss0rQuO9jbfHAuNXEnyGHSF5Ex3BTqIg1vo+BSwfyYodTxr6Q
         QpWw==
X-Forwarded-Encrypted: i=1; AKwUvBzbdj+3tkQcYWX+QGqn9DBnD8768U/Oio7LVaHNhw6do4GaL/Usas/J5ooI+miP/r9OOsLByrKkzrsY/gHKxuhm@lists.infradead.org
X-Gm-Message-State: AFq9FYJ5CVXi0RzsqsBjOdSo9E17Z0E3qhODm6SAOdXSyDaP2VoUV4GF
	V4hd1JXE9I30ow3hd2a81IGydJ9hLWDWQqSZw/t36SUmp8GRmV1yHTqz
X-Gm-Gg: AYBFou3WlymI6Ruui/Bk+SFsVVjJyinXGq4B8gXjojW4T9LHxD84R320mRnf3vH+Cx+
	AhGdBPxIQhPmis0LJfnG4QDIbNi2Uz3xq0GehY+BG/S0T9NWlWARPDdAnuS3neqnMtr8bYkV1cb
	53l18kRv/FtwDUSTYWX9uwP5Ip1ZPOdH6yGVnKezgq818rp8AxV1j19Yc8pCYXq9Ie+2Gd1QH2D
	zowUEkOera3V0heFSxPSwIBhig3hBIf78rA2d9e//rnuGoY6vaB+lIfY1Ue7BR9aeg9W0kHljbE
	MbOzQ5eA4OT2TrMWsKpYA3YlzbsJe1JMo9xFusQ0pWwYfGreBynplfORPbbD0EK+9rTraB3Es72
	CpmUMkrDwnS5qSr1xP4tfmzxdc4GxMBpQagnGwrkXqyCxwiNMalCzW7mmB4CeksX/tZ4nOXXo9e
	yPdr49BK5LvNDTpqIYVfXqj918WQ8JJ53F2AbKfliGlBaWGNGILHj9DLqBUW3Ul0LUSKyaXOzVT
	xDG4XnOudAqZtQlPe3GyQOiB/6z8Q8gwlOVnxT83/1+UdsTwde60/6jp6jcBXAWIltfYJs67Nma
	sMfSYwEE47yOWQ==
X-Received: by 2002:a17:90a:d44d:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3ab3a8d0e98mr12992962a91.42.1791977386685;
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 16/16] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Wed, 14 Oct 2026 18:27:51 +0700
Message-ID: <20261014112752.683032-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042952_232919_4B138B0D 
X-CRM114-Status: GOOD (  13.23  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_audio_hires_event() ignores the return value of
mt8195_afe_set_clk_parent(), so a failure to set the clock parent
goes unnoticed.

Return the error so that the DAPM core reports it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 -  Update the commit message for the DAPM error handling.

 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0


