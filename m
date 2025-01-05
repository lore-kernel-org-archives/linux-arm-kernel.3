Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42A3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOAsdgxDQEvC5uDcWK+yR25E57Nu26K/3jc3ZbJ9Cg0=; b=b8ip72T7LN8vSAt9aikn01uk+H
	E/eTbp4T/hdBCIFtj1mq495ccxFlXpcnkizfMJdNqmQzlype2Ul0YzmFQ2wIjAuOaL3PN6z29ce1i
	Y7gSDBArckfOmqeiDiAsdx0WPtqwfaW5EwtcEA0f5Vrzz+S0b33jW1AK5GY/uNITTH8YLCPBdEGsw
	O0jh2LVe7BO/vdRlSeWS6XaMDrNUswZJynfgZZRFAACMrLjBTDWNR3euJtCdWjYuZ/txnQPJxeEjH
	EVIx4J/sHxSEYRjXarF9HoZ6laGQAehPOs+sF7Lbkep5Ik0q00KTOiHfSEDSW4JYwHoU28RXf3ZTC
	hBjVcDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUVDR-0000000HFNy-2OoO;
	Sun, 05 Jan 2025 18:19:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUV9z-0000000HEvr-3x4U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 18:15:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa679ad4265so2692503566b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736100935; x=1736705735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOAsdgxDQEvC5uDcWK+yR25E57Nu26K/3jc3ZbJ9Cg0=;
        b=DrwsrgFHmUjC6AbNA+487CzWOhFc9joDJJndAb9UPix8gSnJE4XXt3xhwMywUbIrhS
         uZnAU4nVyzYDU7wLCpFvgZjIlgzVjkK41e/HYBZi/bnU5/ri2BzBd4AJBvftEUZL1asz
         4E9nST755B8ZVfo/qVKmzsus6DkGyKOO7SoYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736100935; x=1736705735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOAsdgxDQEvC5uDcWK+yR25E57Nu26K/3jc3ZbJ9Cg0=;
        b=NbmQqpw8G5cRjsDcMfx3W1ApeJz/YvFYy3nvSyfsmMvwbwWHpeyNd2NZn/yGAZv3U9
         FOmO0u8JmHltOMKDIo2bVNGbe+R38s6b+p5mlX5lel53N4dUv2j1OmRA8bAUE4+dK7X+
         FMJtUw60QsWrqY/3XShVgfgEs9YDw01/CcxDGXF05efaOqAgESJJDP+mEXrZ89RzCOqn
         5UZ3L9w/S88ynedr9lzNeAvjn3XmY/cr5s2wFVzGdwOf9vGbm8rKuVGHKRDrvqe5iCa7
         +7v9eiVfOTg6J4XPNfIDHsYlsni5Acj2qmClUID5Cli9GPBbSmFKbv8iJQERkiePJTkv
         fQqw==
X-Forwarded-Encrypted: i=1; AJvYcCUkTwa9vn12huDeM+L5ZVOEh7X500d9doFnTexn/aqFY7yhRC0pXJDJD+P1qElBZrT70aLN4E1PMeicWvtWbTjk@lists.infradead.org
X-Gm-Message-State: AOJu0YwcKHs/0ehx/fPhxhcoMD1Agu6cmaKhhf5kx0yt7U18tVz8C4fh
	UyCfYoG9bBsnJ6e3tEx2td5zA50rFMq43iMqze+MI2LsuIY8F3YjLOIs5yd+WcM=
X-Gm-Gg: ASbGncumqU+PHsVWuv7RvUz/KFYQxZ7DECZ16wa+nGzQQFYOnm38FnVZ6rq+XxvSxAI
	QdAmStC1U6dl6Q71kIfxsGCmzQj8TJw7D9QRv6I3Hf6MNMzgnS+QCyN+9dy6n3pZYB+HeoulIgr
	S2X6hnrAEErhG+wcze4XoEE/RDzN1xSdg0MzljpI281zhlYT3n/ECf0jmjavS8pUsfHRdeixF94
	pAWlnfqXzCG8Zz8qFaJO//6JHxk+FCvlhoY75lfqSjwB5VrYXaDyobCu2/FIkVu2FYPZuWvrcpW
	TxcBCOHQk+JblmPfsDRLgJec6eME5gIzyFLvEwC7kYRCQPZkHtKjmEz8NUz0DVMB31d4Z1lWcpW
	hHCOqw+2huHIxpMltTg==
X-Google-Smtp-Source: AGHT+IGmgVgc6B2TGyiYFDwVaPwnmHLCNND0P6xPziVSDtm7hEJn68GNvTjYVOhO12g7nBOja7hhAw==
X-Received: by 2002:a17:906:dc8f:b0:aab:a1a8:92be with SMTP id a640c23a62f3a-aac080feebdmr5370408766b.5.1736100934660;
        Sun, 05 Jan 2025 10:15:34 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 10:15:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/6] dt-bindings: reset: st,stm32-rcc: update reference due to rename
Date: Sun,  5 Jan 2025 19:14:14 +0100
Message-ID: <20250105181525.1370822-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_101536_000448_A554FDFE 
X-CRM114-Status: GOOD (  11.00  )
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

With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,
let's fix it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
index 01db34375192..384035e8e60b 100644
--- a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
+++ b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
@@ -3,4 +3,4 @@ STMicroelectronics STM32 Peripheral Reset Controller
 
 The RCC IP is both a reset and a clock controller.
 
-Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
+Please see Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
-- 
2.43.0


