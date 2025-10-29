Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CDECCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=; b=S9olhgKw0TUnJ0CHAJUK+hFCdz
	WnivdG0c7RKg3kF1f3LVuyaQtidMpz81aJ8bEegHCOz2DDlIpITEFC5aNodWFX16qhUKQLcuxDJYo
	sNbpybehiT2YF7yXBX7Vvp2gvX3aAkYikk74gTkVVHits2FFFClAGxeVC4FVoNoqCJz5ZFWZCZlmy
	0V3AE9ufGLqRpfYagwFJAeyd43BSr6n3+gv6HPQm6DQv5XzlIeKb38W8Gb2klpTQ1mBt9wP3UVYSO
	pNqeFYS9J+4xXiWaVtsKXZ9YE6wbNSCgNdteFctbyZarZ/dr2vN7WocDQ60rU0gblG401KzcV5HUL
	UpMuIADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6em-00000001ShO-0HQE;
	Wed, 29 Oct 2025 13:56:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6eh-00000001SfD-0wvh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:56:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b6dbb4a209aso465898066b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746161; x=1762350961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=XjtvaRkoy2YQXdeSAbygByiLoI8C/hw/HDNicMIyWDfx0GBfRL6L3DNliYVUiJ6IyW
         92AIrjFrVfczlM0wVC2Bl9T70TsuFbBbJoahb9GLcfOyY8EKBZuX735WVyVq9vR2aVBn
         8XmIm1Ba3777i7aYuk3YUYthSLaG4ngEXXbLsuqgXfXaVJF2whLNhnFTrLkE/g6yM52N
         Xm4M/kzxneyA859GLvlbABl4/r77X4c6NttteG9LLFiSeaL+h+dHqb4+TK2m9JIIlWjN
         mIUNtTBlS4vz7A/C2BPoNdRL1eTvFIE3UaW5cfj+fKbj3U19a7ld7ZFHWcoVRAe8BWxT
         xqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746161; x=1762350961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=ue+3OM0u51IZ0tWArdLaEPpHDhfg/0jAEy3kyEA0gAUbCNpGc8D71ejk4U+sjoMpWk
         ehFbBoAT4xRnEQ7LlnG78og5u2IDQZHUdrdDRrlRxDXSfK9JqMeNxnjjTF9uGNtZ04sg
         YqymMJlGto9RZgrhw7N3LQWFz781lNBMka81wXibXL/AfdVhlgexMWYXNCSQLj0Phk0Z
         oaxFiOCuXrLhGm+zbmqjyPipc39X62d2fTnvW7nfNbzieh2KVDRhNMeO8GNr4eFrXet+
         pPqXLg4djd5/DQIMMMucEtC/MhsFGBY8eObjeqbTVMRKz7yCLvZwD+FTnPamrjjWzpmO
         a28A==
X-Forwarded-Encrypted: i=1; AJvYcCVNcps/wZl69FbdJAFKiNN4xGj4VRZCbPewDJ/YknjGyslLdF5S6KJ+U0xUGyE8GsKMn9ep+/iq7SC8U38Y74fH@lists.infradead.org
X-Gm-Message-State: AOJu0YxnW07QyBSZWzsJIm2rYt3NaDgldrklrrFzKpPZwJHh5Va9xpEu
	do+wPfY8JKHAUplUutg2SYfcCMUwn43IzlzqxXAmlBOAKQ1K5ozfRhRb
X-Gm-Gg: ASbGncuwSJzCXOwdcHEeHY1SdZ1LZpQXnpDwLLALjECjWK3ebKqKBt/s6bBjo0gQmQm
	ShQ6Zjb+ZR1/2qFQ6Qy/zNzvUz64CpLcM936Jep2zQcgO8ypKd0OhS5ZWiWhNNj3tKXXGlCsG20
	tpPDodzmxLp+LTGp/fr9aYWSqM3HhtxeMU3WET80bVcxJ4XiPDD7mkkE5ZSiPHsRDa9sE1b59qZ
	hcRnsO5pdPorzPFHP4m0BZhNpB1YFysWeDJjGYTercsc2pVH6qBQlLelcrVuE/gFWNZFtSzGVOG
	M4csHIA8HwujyWKAGS5S8tAwFblHci2xo5XZB2Ai0HlsNe4NQ9uPfhgRo7Dou6pP4Zwa13KBE7I
	lneScMSftlJlSdgI7lcGrgDjmMsqhKdjA1QpxgqbDQaqxSj3Tkxc/Cqjxe8qLb9CjkQb+shaMFE
	L6XqM7DTERvVID2AiHegKLPMmUlE1kqA==
X-Google-Smtp-Source: AGHT+IHrghZaQi+o1U9HBM80X1LpTX8WL6sxC8J/8ai0EXsL/1XFPVew5l5qwKEGLRSKZrM0eDMeIw==
X-Received: by 2002:a17:907:96ab:b0:b6d:c44a:b698 with SMTP id a640c23a62f3a-b703d4aeeecmr296884866b.40.1761746161026;
        Wed, 29 Oct 2025 06:56:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:00 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Wed, 29 Oct 2025 06:52:22 -0700
Message-ID: <20251029135229.890-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065604_675244_B8605F99 
X-CRM114-Status: GOOD (  13.89  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0


