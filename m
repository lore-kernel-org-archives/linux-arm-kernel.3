Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882B8C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0fKTNpooBtTNW6bieTS4Sn1ltwivMMtcmL45dsUlns=; b=tmcUea9AFP+RW+5mGVYYIEf9FZ
	s5BWvENGnIhjwlehQwMnuLBV7UE1ixWPPmFgnmjw6ezXIxK5zN2oU1ed0DpSIvWolVgQcludluCn+
	gHxoMzPULp1yLJO3L6m8wE/JthnTpVwdwZgmuBjJl1J13bc1PpRnEDkOcZFYZiJL2kvNiwwrj1Hxt
	nlKv4xxVpLbUvRMi6DGZcOn9DCJKF7l6BsQYI0myL6yM77GKgD0F0eSbTuUIhb5EROf5UH16JGilh
	SiYr63lPND1Qy5hlYJcxw6AKjvdgnSIh1//lVP1GuaNy46mJwcEmZDD37UBxCUlqzHIoxfGsPG/m8
	Ry6DvhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUU-0000000CbtJ-19F5;
	Mon, 10 Aug 2026 18:12:50 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUP-0000000Cbr9-2gJ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:12:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1849114a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385565; x=1786990365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0fKTNpooBtTNW6bieTS4Sn1ltwivMMtcmL45dsUlns=;
        b=bBtwudWLgRyCvDufoSZrm9794mPUuIxmTGHHUhgbi6dAqQ79h6fK7vDUnSLB3IB1ua
         AlpxhlZTxB+BksPop6hc0t07+/Xq6Z3K68vv0QcLkqinVzsd432xRPZPZlbo2idsYMqi
         LeooyHfwa5tIG+9/5afUCH2lJz9cvPRfHgKdigeGAHfwWk8dPr83cYOXRmALIgAa/Qqd
         D7hriI0r3pjZinfdybqE5qcRHGdKUY2pBtn8mqlieaCvu2f2/BGgU3SdwdJ2uGLuCck4
         nw4z91wedpYqXLny76Wn2eBZHqfQRxMu9dHn4OiCZmgcxt7JnYqH0Sni48fAoBhIPsjR
         bLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385565; x=1786990365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0fKTNpooBtTNW6bieTS4Sn1ltwivMMtcmL45dsUlns=;
        b=DwkrpsJjJyHWDelnxwnKMTACO/P2KRwM2YiRk50LZB9YAtOK6Lv9OVTuI4ykzOgJxH
         md/TAo2LbHfISyWM3zTOdxH9gMzkkgmUTgCisaPBGL/Gtw3gtesjzv+jcAHzCz9Rnmo1
         6RhL/k0gyVSzzFE+3/PGI3e6VB6cUEOaI0a4C7/wxkI3xPbZoycfg2ZFaFSVz78stYqO
         q9L/KAn5pTXsOPH613kyxcQ9YVkd1veuLVUY1iX9rIG6LTv1aY+c6YRIyy3YuulpfyoV
         KSQEIXfxKSpxCam7r3FCtLiC5j6MT1qWWtKS+kuIpRxr7Cshr9wwR8NT7BrULnX0w0ix
         L0ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsuvfMSmGOcQFbehRe06Iayoj1sLuqqOEmrMBO1+CV1uxGps0BYx2RpGrmo5TrF7VW9yOfhXMNtVgTwMbAtSY0@lists.infradead.org
X-Gm-Message-State: AOJu0YzblFG9DI9YtGPTFNArdopMnn85aCwjO/K7AteFXKauy/GMSBcX
	b2pVBO52QpEeBEp+uNgdoFwKeOTpldkZMi+itkJqZ1MTOtnoB8a5X9VB
X-Gm-Gg: AR+sD10VW94cLC2Q9wkExW47THbvEav6eg30klovd8mkTlMByqkmBxFktvqEIf+D4Fk
	PwyK+kuVGw1YZZZL1on/3+hmRuHv7YAxjTZR+bXEWsunEBAagbY1YEm7Cgb2QRSukJ6je7FHRil
	TmIcsC9k0vRWERZ3hjlGk77oh2W9fYlsJvuLlKUzE2GnEz32T6uW7GYlih7UknGpZH2Kmt5/Hs5
	fnokwWCDIEFrRDTSAmLBojI6L+S4sL7p9CLcuR5fz7ca9itt3qdVFWXq9C9t4GwB5XHVFrsonuT
	6NHoe1qdHKB2PpIcA9DZPznyTLuKwleu/IFrvAHSe1+9U68HUus60jxTWuNGn5JhsnZbr1Jq2xY
	Nyy4zYMNWuf4rdeX5wrPgni1h3uDiBINZreAefKopQ8HPO7LxpAalW/rm6mcWmV2bHc5Wqi4lsE
	YQBLM7q8DcyeFkfurThaLwXXBv6Vc/lnaXaerOrZfJR8T7U7o/73yuIiu6Y33QiYSrOMzb8lF0d
	w==
X-Received: by 2002:a17:90a:d444:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-3909d79f918mr32734942a91.2.1786385564472;
        Mon, 10 Aug 2026 11:12:44 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:43 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 20/34] dmaengine: xilinx-dpdma: kill vchan BH on remove
Date: Mon, 10 Aug 2026 11:09:21 -0700
Message-ID: <7185ee59e7bc0451f9ebb19178d3f76edee65658.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111248_074513_32C944E1 
X-CRM114-Status: GOOD (  10.25  )
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

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..7e147ea11368 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 		return;
 
 	tasklet_kill(&chan->err_task);
+	dmaengine_kill_bh(&chan->vchan.chan);
 	list_del(&chan->vchan.chan.device_node);
 }
 
-- 
2.43.0


