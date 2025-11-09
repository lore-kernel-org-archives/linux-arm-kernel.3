Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8479CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2UkvAHMxncU2Y5mr7DiOlJe0jQHZALyUcA7OKmpGVgc=; b=3nd6SOCJbnbV+BTg/1ksaWtAvQ
	3c2nLZlUhytVt6nP8KxH0spoajbTfOYDz0cWJIucqCdCaOQjSD52KYJg7UHB7s89GJX/AHqdlrDPm
	Np6WOe5fIYzijo3bs52Yz4yPoJesej75+S854CDJu06cEOFBjFh2EzbRRi1HM7NKII9rcebD1SgwE
	myiCJPgXw58WN5TA+p/bQjW+Q8lImDqDi1y7weP2lMrHEOVWisscLNMZTOrXAvCpPc6nUDF9I2vB2
	UgiXTzAsGH7+BdT0sEIwaelZDo1ZXdY2fuuTcNVkNFvjjSyYQ9wXZs4KbMgwD+eSjSUJnUHc9tBW/
	MblKuCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDE1-00000004Oyh-486f;
	Sun, 09 Nov 2025 21:45:30 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDDy-00000004OyK-10sv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 21:45:27 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ed75832448so37672481cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 13:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762724724; x=1763329524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UkvAHMxncU2Y5mr7DiOlJe0jQHZALyUcA7OKmpGVgc=;
        b=FFg1Wg+2gSGTe4vCsTHwwrk7bG+shACH6GkAFBIjWS7lyCu8oobf4j7hSWUjDZHUsX
         v2dfPDgkg6aTVQpNBtaAbITRLojWMuz01jDKABPtFBIu+6l1NrzJgYrl2LuYE7DLAfY1
         MQ9aDjSJTA+9gwYdTa5PsacQjXFiaHWOoklQYN8UpvVmf930akmXDRAum0t5gq6noF+v
         iiQlZl0M6OsCeNn+Rze3xmEf6bTNhD/VV1fgsABy58sc8ayfWuUeEzDVcOznMkK5Twlo
         DuH8BoeS6AN7QkJZjIJvhVa48NtDCkeTJur8DOUGUHKv/8xnBI54t50b99hDgsl3NiS8
         kinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762724724; x=1763329524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UkvAHMxncU2Y5mr7DiOlJe0jQHZALyUcA7OKmpGVgc=;
        b=gzBUhgb9CyR4aus4IVSG7e+GstP66tPIGjjAbswlZCHLezcAawUfA1pquDeUiLfX6W
         26Nc3nnsYcFJes5vOLkgpmG6jpwLAWwewPss3pPyM3kb5IyXDPGiSdfSO3ihx4mBZj5w
         sXHv4V55vgBB35RvqBTsAig66LAuSecrlpTdiBSUlepNmLLhy8MidYalVWHj/qcN1mSz
         6NfIOMPYc0TB4KiSYqY/nE/rVRiNoiGZLub3RfEKGNJnAvylRDg9PklVb3iPcXWpiQmT
         GW/Zut/Gu9rDVhNs1MdzTLGMy+aOrWYJ3pm3FeQdzwnPdU2iJ/10+XMV0eUvmWqclkn+
         3D8w==
X-Forwarded-Encrypted: i=1; AJvYcCU1eXSjeieeIiq2eWp4NjNdgEmxxmlmdvsHZm4zAVxdzibGhZamVGramT93pr3s5FoKAJVz9ueZTV+P1LeQf2gG@lists.infradead.org
X-Gm-Message-State: AOJu0YzPY/JmfcQU9B6DpYOUF5Pr6XVG2p9Zg7KL/RicGbMvqupJjV5f
	6xIzPVYTI+S88FeslkMlyh2Pt58DZmT9TnkUxkRMiAIwz2Y9tYBlyBWD
X-Gm-Gg: ASbGncsGF7wjI448toHHfAtsfveZlgzf72rL296YSQXT2UZghTCFxjJAboyngWovz2R
	L30HQzsUojFrclsrsgz38h2T8UlsRgpA0vMEvtoZdGiLEmb6dbQq8cjnNua2Oyi9HZLAySxUkQy
	iNhAqxJA4E+QQFErRrD0iCGtC6ZOJV12ZJ4FxhVllyAiF8t3U58pctLK9YD2XJZk32sE1wQQb9s
	BqEMFyEoYsPH8EZDGOzAasEczqNwRp1JgC+1xpah0rRaYlkARDnbb60GpFCcd9ThR2uDFh1S9lz
	UBqXC11BFbzKMLgvVfUjRf7foYoSxuwhLHIKd5F8WGMp12oPSSO/rZHUzggEWfbAoY6fQKuonr8
	7n2Evl7mRGAzpPRwfi+CwIVaYrCvQOVD1iWhA2el8QZuShHDPQIBARZ+06Cpt9eDLJXxfHNEsRn
	4yy3SiITX7HBDLlhgyUw==
X-Google-Smtp-Source: AGHT+IEO6aQCuJCW62+UaVaTjY+QCSjAHhvbQVmQh7V/364o7l0RIj5zQd8SK9Ou2X+RfANIrJ+c9Q==
X-Received: by 2002:a05:622a:198f:b0:4ed:bbca:fded with SMTP id d75a77b69052e-4edbbcb0857mr21223051cf.17.1762724724459;
        Sun, 09 Nov 2025 13:45:24 -0800 (PST)
Received: from rogerio-laptop.home ([142.188.15.215])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda578532csm34422821cf.19.2025.11.09.13.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 13:45:24 -0800 (PST)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sun,  9 Nov 2025 16:45:14 -0500
Message-Id: <20251109214515.121742-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_134526_364203_B770F31F 
X-CRM114-Status: UNSURE (   8.54  )
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

Add device tree compatible string for the i.MX8MP FRDM board.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

No changes in v4

No changes in v3

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 21b7168d61f5..f46cf6d1f502 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1


