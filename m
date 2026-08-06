Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2324BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vOL7cmzT8i6DixZXZmGfCOr4Bi06fOU2/O4s9agm2c=; b=sBEgzbn+PQOZAMHS85tzbq5uP0
	CZhio53k86i56mC+ScffcnzpGciu2U/qh2cIGA9d80ODusJ3ksSGVDC6ZeH7rSFELNC28eG9OpYjz
	SvHtgwQg+bZ1mDSo3IIT7B8H480Qby0thsqb18mvxzp7Dj4UX/D3GyOMkv/pFDDKMqr/qfzMxuLI9
	Z+MIQIlylzTUXLUekc6AordW2gS/DCkWBNr1H3Uh/UlDAXCG6/4iYtsYZMS1pYenuQRaU8ig6QQxn
	yDyAgBepJHBYQ9FIT/bt3prXFsBFgEWGUvaERdHoI8Est2HAsTz9tyvo7ns846OjUVh9XnNXnd4rQ
	Cg2Wf8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYw-00000004xOe-31X8;
	Thu, 06 Aug 2026 05:22:38 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqYu-00000004xM5-3G4G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:22:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84a652535dcso1204113b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993756; x=1786598556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vOL7cmzT8i6DixZXZmGfCOr4Bi06fOU2/O4s9agm2c=;
        b=R7HJCminUki3qI7H3nIiybcAatbDIS+n8qdvjIU0DiGgC1yOzKuthGKRdpkCqRALjP
         GcxKc3riDiAclaxSH8RCbB+vCqBgWxyF70FHinsqMHVEw7LkUvxnviLdhC3xiw+VK8mr
         f6EDXxtI2/ffCwJf+zLqRweZVdUoCAtP9AG5tucj/GwGyHUvNLJn4VWo0ebr92Ua4qzX
         rFn6MfDmu8pTGTK89+kq8bP84zXXsfzQR6nXyz3fdph7o3om+QDZlPD7qe60J4/R+dYV
         pj/gJS8TZ6+NsLlkQ+Qjzse5YR7dNNIm9vHR0AEFzBhJf9PIL1HnuMbbDntlWlDDQ/pj
         QdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993756; x=1786598556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vOL7cmzT8i6DixZXZmGfCOr4Bi06fOU2/O4s9agm2c=;
        b=X3PUPoYz9Wtb/cBAgqbN0QcyDdLLYzxKgR1pP+7Z+sk9T8cMFjJfL4NjTFJ5yfxsgN
         DsITYMh9rZxwN5vV81Za+gt3ewPdDKYCv46RhXs/fFVs8td79vPOEuPq0Jw4dEoQ5lz5
         n9NTpMjxcDZkFZ7ShJTOgPynCjztvrY7WjwSgErueUqOI9Wxc3x/WBzp2w9XYiCQeRgL
         0uxjlmOOpktr1oDWtJRRlDdB/Iqn5Y09NM7v+CzYokNCrwAWHw2GCNaB7HwgLEkSai1g
         tX2sT2ylnoKx5Ku4njRD+YdCpr2oB63POE8GXN+nCnrSNxCasgWTezoLFbp0Xf0QMX94
         w5qQ==
X-Forwarded-Encrypted: i=1; AHgh+RoILp6VCZFA0eD4KDyex7AOXd8YDCNg0rYZt6eD1H7BazGNhTHoda1Uc7/IFup8eKtmtzfJMD5SUuEi4QOjKjvL@lists.infradead.org
X-Gm-Message-State: AOJu0YxQHJ02eVtlIoN/HLVSmYzG4FTdir/eU0UHHAU37a3C3c5DpQEA
	zf6Ez8A7HOx3vqpXsVRthD+/L62hOCjXTzgkIkJkWOwbsAs+bKb9Syfw
X-Gm-Gg: AR+sD13pCiFdn3/pO2ag8uowx+4i6YocJ7xJk6CjExn6WjUWlTBWl7xg8xys6xA8zWf
	IDe+LZc1zXCrKR3bnjFXuv4vLm4tD2SoCNjeVARSKgozb3er0nQQL/wWUMn15QftqOrulO3fbRU
	h936GxZtE7UZ+l+xot5D/5XoD6zd5ia/4hGCYwfZHrX/BHQ0zFl1e6GSvou+1xVH5BfVPHg8Ijz
	SQ08F2uPjvlr7iQA3KdK2vJCCjRETH+pyP56sJkZQi9e6uowIKo3aBXKEWBVKh86NGrnLzHETqG
	IiMulTNH5MvLJd/g5VP521plyFNp6uM5oj1XCx+L5dIdPTXPWt0+VqmIIsrDDi/t/AASBs1khH+
	tGq/j2w3pYEG2F6bJno8nNAgBXxtl8EyWTqCpe1UVqYOCnBxBvU92DIZJFJNYo2i3j1PZrNrf8R
	p2xPHKMzGOyuoiHRVcSj10QC7RJt/AXqiIyrc120KIVnjGdBxBR+oClIpKhu1BqsareUhsBZDy1
	EHbOa+COAlUmeftJHjJdOmcXeZTsblLc1K6spcIfZwkiZOkESt8hFYaPzo0qhA0369GSdpEKcNQ
	EKgh
X-Received: by 2002:a05:6a00:2d8b:b0:848:3e74:85eb with SMTP id d2e1a72fcca58-84f2e014749mr13013714b3a.1.1785993755907;
        Wed, 05 Aug 2026 22:22:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:22:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/14] ASoC: rockchip: i2s-tdm: Inline PTR_ERR() in dev_err_probe()
Date: Thu,  6 Aug 2026 12:21:28 +0700
Message-ID: <20260806052136.21034-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_222236_833092_F2257C00 
X-CRM114-Status: GOOD (  11.95  )
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

Pass PTR_ERR() directly to dev_err_probe() and avoid assigning it to
the local variable first.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index e6229a325ffe..c9ad769a4072 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1263,16 +1263,14 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	i2s_tdm->tx_reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								      "tx-m");
 	if (IS_ERR(i2s_tdm->tx_reset)) {
-		ret = PTR_ERR(i2s_tdm->tx_reset);
-		return dev_err_probe(i2s_tdm->dev, ret,
+		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->tx_reset),
 				     "Error in tx-m reset control\n");
 	}
 
 	i2s_tdm->rx_reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								      "rx-m");
 	if (IS_ERR(i2s_tdm->rx_reset)) {
-		ret = PTR_ERR(i2s_tdm->rx_reset);
-		return dev_err_probe(i2s_tdm->dev, ret,
+		return dev_err_probe(i2s_tdm->dev, PTR_ERR(i2s_tdm->rx_reset),
 				     "Error in rx-m reset control\n");
 	}
 
-- 
2.43.0


