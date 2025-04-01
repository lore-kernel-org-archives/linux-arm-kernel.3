Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331DDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=; b=A/3NPKaPwle1ylplNK0EG27Yeq
	7EK/p0NfOxNUUpJPCF+HTYyD70geWWJNgAKwyg2AbbNJVZPqqF2Nm8rbWanplb8Ho2a0FSPxQPAM6
	jW52haA/Qzkd7NBmzW2WzRRWqyOzR6nObVojb9Y3HI8kbNP6tDjq63Axf2P0pOfOHNB0do5YZpAMN
	7rkJa9iBj80zRy6qWSe5OCHdukH3sJszLh8NqWLUeC+J2IdLBQhKcHBtOBQyMCKoLlLHg5y9XyHp0
	gqwLlvg31yWJVV95SV2plQpNgbSMe0XDvUOgNaFVpsEUBLSSQalw0kAEIUwUCnICFCto6+1Jxgji/
	H6aBOI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcaF-00000003aRH-3L1M;
	Tue, 01 Apr 2025 14:27:19 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzcYS-00000003aAd-2pCp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 14:25:29 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-22622ddcc35so34095355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517528; x=1744122328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=ksacQnl/xX+jeaxVXQmBsTpD8JuLFJBQCFkWpxUHH7/N94b+MiSPLhebR0ZPSfUy8u
         UDsoUsHSplrqFuH+H6rz0VsgjjUDWYWmMNcglidVFfyScUmenniRD5h7sEJAzSzqxNAK
         03+AScjWmETwcnwwAU+bluU7vEn471q2okdG6F0gqgGdipHu1ydualGLCRC027wDnI4x
         jNf0Ra97yku/U7Nn3qFXsmTc3hxDYyLJaoF8XGbIIYl/mQdES5QvsztDy6v9rTB71/Jk
         gSlm1ne993YaRwntfxdxy749vrB2OLlXAHHhH21CdFnEYmR0OfLF2dULVEPL5UnKYAIa
         4OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517528; x=1744122328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=f1eKeFoWw+Q7+w55/HqsmBGyg7GcaAwens6I2Uns5fYXV1Tt0iKCn8Gzf4xWhxoF0C
         YY5PeNiaOLrtww9JW4EJH+4m7DKP2ie+dt1toyIN+9GhNF3/uRebpqFSjeNsIhV93qJd
         fEzF/g2vom8P2D7L9V5gWdpy9f1Gu+c/+5wXBchS3btKOv4q4hztvzTM5UfaXGSMBmc5
         TbUs3rfx+KBb5L1FKUL0IW7JcC6FAkHTAbnV/MnSH35ZxgASbEOqEqSr7VMtveKqwJKo
         PYsreEnqGM3cHGcsQH7mV4dAxCYqfgghZf67j92LQPAzxhqhYAm2xk3w+psZ0D6SdTAr
         mZqA==
X-Forwarded-Encrypted: i=1; AJvYcCUhciFk8VXUYles8sdfavmCH0KtUrIUN+KqcKsK2Cz9C1nVejq5TBPtIryQBo8Q/R3bM8Tf0XEMocqRfAuFTeK5@lists.infradead.org
X-Gm-Message-State: AOJu0YzKkqNp1AziekwpB2YH9bjEDkLcjshJzVEgj9iojNNR184CWb61
	z6Bd24Y+ihC+VcZhFGptIQN8wcs1qJm2Nf7TFnHBBSsaR3yBNqPd
X-Gm-Gg: ASbGnctEQXJnTz64E2P9gtZqjNyMTNan9/EKwyQDad+sgRRDaHArKY8Bl6AfLcl/FWa
	SFJwDHS7B7XrYj9RYZ3JjOtYdT7jUkC5cYqC57hJuDMM+DUFSyLhzlIyxfgr7Io667CWquAaZND
	ZmbLPDfejohgMZ0iisYUq440ordmQcnWXmpexzf6eyGphfmNMzi7cLTY1O6+tsYQpj6VNEYpXUf
	Q0R5CJLgt4pVxWDSjQ2f5VmAyl1btpeWldO4ROKicio9d5FxCQhafIrBGup+u9JClVT7So0hvLr
	myU3Bv6aiV1rJcYhfr0UX0saOtnLxACn3dVG6xPH3fm9oAl7dn3ht5TUYlHCLDtExH2isYw=
X-Google-Smtp-Source: AGHT+IFV9dBzNcxDUHEuxWuZhPi/1saRFkCoRQug1IzAs4LF+0tMPIs9Zk7YIgX5WGynxkjRbFRZFw==
X-Received: by 2002:a17:902:c408:b0:224:1609:a747 with SMTP id d9443c01a7336-2292f97ba73mr186070825ad.31.1743517527938;
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee22a2sm88704425ad.81.2025.04.01.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Date: Tue,  1 Apr 2025 22:25:10 +0800
Message-Id: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_072528_713586_09B2292B 
X-CRM114-Status: GOOD (  11.55  )
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
imx_card_probe() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 sound/soc/fsl/imx-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 905294682996..3686d468506b 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -772,6 +772,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].sink =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Playback");
+				if (!data->dapm_routes[i].sink)
+					return -ENOMEM;
 				data->dapm_routes[i].source = "CPU-Playback";
 			}
 		}
@@ -789,6 +791,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].source =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Capture");
+				if (!data->dapm_routes[i].source)
+					return -ENOMEM;
 				data->dapm_routes[i].sink = "CPU-Capture";
 			}
 		}
-- 
2.34.1


