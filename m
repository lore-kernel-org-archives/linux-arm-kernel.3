Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ACBC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnSS9f3MD8fKZAuW9eSUSFbsKwmpz+6ZY7PPsWdPvPY=; b=LG1LVB3ZcojxTVBwlKdoEWu7gJ
	MUTm+H+z3Oe0XLFYT91r/gG+ZbyE31iIy7STrJIPkJn6ZPy6h8HT4bBs/DC78tufZ8xBee/ps1dPD
	msZmOu/b/5btSaJgCP6zS75furtv+YjtW59rnSgk1xmRLvxvmk3tAtAFfctPjQMjatky+5C00tXIk
	jdkPpkpE/jG4WWK2enttQAFJDFH63SLRJ0xY9sqcVQhka9IXJWhZ60Lr9GQm4CN01dNoqK67DLn1X
	SwIkzFaydp+/bAdP6jQrpolDl1hZNr/wzgXFWb7Sd64T1VWCd9EUbHoU+qO2t2bukopzY4HGlZQ8Q
	nlcbLO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesuz-0000000F19E-0dZq;
	Mon, 03 Feb 2025 09:39:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesr4-0000000F0Yv-2OqF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:35:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385e3621518so1955304f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575297; x=1739180097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnSS9f3MD8fKZAuW9eSUSFbsKwmpz+6ZY7PPsWdPvPY=;
        b=YKEL/fEGk21220nWgoJ+F2MNat4rZlIqvKgrEKCJ8f1Mmyy4HLNvdyHTbLscrjUt1W
         ODoNjhoh7fzrwYE2MyXCOdko9ui7Al584PMgA50/vzE+eLr3FHdC6KbSvEqDpAWBVlLa
         zc3X9aM3UKO8W6el6ECRUVi304KkGb3Ig6ODGj/I1A+SJwllNeH5EDcwgKgwQhRdkslL
         tN8SV0m6/l3SlfkFtnkQl0AEO6NtAMSj3Mo4BQpEXPstFZYRWdSk+XcqufV5cCHwZdmf
         3oPWCLA3b52xJQfnyZg71k/LaqISW/WeK2F1RL9GXIzsXCF6tlw5djOPEd/s/zgZ0H4B
         ZTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575297; x=1739180097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnSS9f3MD8fKZAuW9eSUSFbsKwmpz+6ZY7PPsWdPvPY=;
        b=GutBTsoGZBOEEYKB3ZhOUtL0RZz0XOqhro4Jjn4TJS9xTxxoXUVJ4rjkmaC7MGisb4
         Y1A412opvKZlTdIWjdZitQYSooT3b5U8q82Xbejdu5XL3sjmZuGJh0YtPdTo5s0r+vRk
         vmRHqmVLtA+Xlz3yMQ/9e4znFRdiIG1gDUkkVgdy6BofFnoRiWkIw/Qv8AQKvQGAoSCL
         +Tibr69VyPvnbAKYeH13NyzFqhrZko4fuMQprsbl91kSSmT0r5bHsB27nk3keQtuGKFK
         kAWQx6T3XFbJ2rThtFWawIvyBPQHoaUCOyLRequNX0bgVqkQLVo98Ka51omX+Vxm1Fnx
         Ppgw==
X-Forwarded-Encrypted: i=1; AJvYcCX+OO8CGV8rPSTbPjHtd/JTllHhWtAwWYqywCc8AHSFaOUL2i1G2BS+CycJH/1H9zcWUKD5acDtuHJsjam8tUpQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxYboUKkX7eysMlObsocvCj+xUwUX85Cuegq89v3NRl2qmdnje7
	lmRhwSJXkelUa+dkr97Xsx9kC0IUbrygfPRKP35B0PWCugHsCUEpNAiukdaWSjU=
X-Gm-Gg: ASbGncteszVDDYkG4jS0z7nsRCH0G6jL2Zv+ZWqbN7IkmH+43rmQM1zUCngs7yicU47
	K7x3HvueEZVXEGJ3/1U/sB8Tj6s1HOR28VgB2PiUAVc+9wFdPk7dIJJZ7cuRIpkt8lKm9zb/jdZ
	bVtTdOA3BbPkdLcGzJ+4yV35iZMdK07qoADcM7aq4Xc3ZSfGdbZt7/TebzED5MnVf7nKYzHqrHu
	fpqyuZ6ucB9rph566smwOXSuEB1c8n9Iu9m9u+YaobV6knYE18SwXyzDL9Q6TjeatjLkLrcGCuS
	F2HBJ7/589og
X-Google-Smtp-Source: AGHT+IHVup80fVqySU5QaAbNVEA/8sgh1BuT2rEc7XuRh35/kJbhk8uzXo9g1CG43bnRoXlXegX1SQ==
X-Received: by 2002:a5d:634f:0:b0:385:f0dc:c9fd with SMTP id ffacd0b85a97d-38c51974c0fmr15234519f8f.27.1738575296879;
        Mon, 03 Feb 2025 01:34:56 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438e23de35csm147774385e9.10.2025.02.03.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:56 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 03 Feb 2025 10:34:10 +0100
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62x-sk-common: Add serial aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-1-f26d4124a9f1@baylibre.com>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
In-Reply-To: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; i=msp@baylibre.com;
 h=from:subject:message-id; bh=FQq+RvU/nx827rTHdk2gvuy7rYaA2bdFnPUICZ34hOE=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9C6qS0ue+Jl37bOqBIu9Ng55AncafCY1Fx9Jz7+Tb
 h25hGNCRykLgxgHg6yYIsvdDwvf1cldXxCx7pEjzBxWJpAhDFycAjCRFzWMDMtvJ+9KdPhq7hua
 an89wbW6seXwyQKPrDy+AO26uxcUCxkZruU2H5MsZ5HIfq0R1RphveHAm6sHwj0nNhYcvVmfnNb
 HAwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013458_625708_0341866C 
X-CRM114-Status: UNSURE (   9.96  )
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

Add aliases for mcu_uart0 and wkup_uart0.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 2f129e8cd5b9f127b1d1baab17be868938fae013..d52cb2a5a589a8e5eb325fd90324d57ec1e3783b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -12,6 +12,8 @@
 
 / {
 	aliases {
+		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
 		serial2 = &main_uart0;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;

-- 
2.47.2


