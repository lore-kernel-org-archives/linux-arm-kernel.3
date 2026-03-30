Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CC5FB3D15
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tif0BX5UVtB4rV6WFT+caqXXTeWJp7XZF9XEZjBKH00=; b=xi7X48xkBJnUJ8uNyRKI+lzJ5J
	tw75tq3yVO33ovhUEekg36hO5TSn5npB1NQWH94W1koyW5VjA/NtQIFCqlmOMWNiGmvpd0vI939f/
	dsew4nh7yBrEEWUceziu2y2/CYn4Vp1N6rCv5NFgALXgsCMXOab15Q3J19JU3btOWz3HJ5ktgnYb9
	+99vwsCgtV4R16q+XlcgYt+Q3HtBCUN3JkcbxE2/KOaCdjeXOWqCZO4C/8E1zI+1/JbmXtJ7XRVCI
	NzPYiP6LZBq7atz3kIEW/mpshwOs5SWSeuJGfyNc/zJCvQQz3lPFIlL0+raWt6SUPeqenSuic4qbp
	YmIqOquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ANT-0000000B7uK-1bnT;
	Mon, 30 Mar 2026 11:01:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ANR-0000000B7tD-0vHn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 11:01:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a871daa98fso33378895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868508; x=1775473308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tif0BX5UVtB4rV6WFT+caqXXTeWJp7XZF9XEZjBKH00=;
        b=XRlYyhlV8XKNjUITtfoMmUbdo1/l+o8vJyvxDDey8UHmDEZjCYZgvp3JTA7+RB9vu4
         BR1cOStEY0pRnxwJ41K1hcT4k7W32lglkkPBWY74BnWYpjR53IQkceqYNvojbGt1kkkD
         zZU04ELfOGAR3DQ2MFrxohW4V+97tueYEXcLY9G8J1jMjNSxt+9+2D7RmYgaQwlmMALu
         UImDvl3FlH2obkwZTVVOmhRXCrhOmLKrqS39J8gEd9WVLu7CEBvUR3d8Jbk1BmDHBe0S
         SxmisJMmzQXAdt+yDLUMStIr3HfP56jebSb7wuYBaNaRIEmfWPx9NjErCihwY38q5zZn
         qMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868508; x=1775473308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tif0BX5UVtB4rV6WFT+caqXXTeWJp7XZF9XEZjBKH00=;
        b=JWgAmFNC44k7ZK47K5tvBBZElWV/WoazU3s41t/V16BJMlJ58pLdeGN3S4NrT/Nw9F
         xShYr89zV36JLFKxhLePIA6ArOF0v2k+GPqtKmyZ+Eo8t7BBnXcWvAyI3HcSUGRV9qZR
         6+imlJqpn+D/jsD6tOVYx4V0h+5FEZIrUUlgDIOvsu3TgO2vyOX+79QR+kcxY2m3vAmR
         KR2VBfNdASYS/2Wea/bma6GyXXpN08einc2Fx4JCLUIhFiGh2+casL5+63/S6L2N932M
         KbOmqfsif0YA3oDRhWQUiLDOUfhQs/DsNnrRZITt2y2tCYV0BIFcHt+jc6MwKN6PxHOy
         Dl2g==
X-Forwarded-Encrypted: i=1; AJvYcCWxHRV+WMPt5tRkwT9/BZGjjhTMrezZyx35/dMXxnStYUEZyNFSJ/DLSi6Jd5lzz94wvldmV51tn8+hmdQB924r@lists.infradead.org
X-Gm-Message-State: AOJu0YxdWHVob+PV0ePeA6bD0SOLFAK5qIyHxMNcBOinQ4eubOn8R6s4
	FveaBag8RchssDhDK1/rU8vE1JXqiIbsIcgOXzT1TQvjcrOZWhiLYUCB
X-Gm-Gg: ATEYQzyjvTw+j2aGWkXPXVrSoeKVbknP9D6X3EGhsuF+MfzYnZAaMVKaC12Gw1yn3uT
	1Jbz2Tn/GOd+fRgBDhsLLeki5eJZK9tAKOtmW35kh8z0Y6KteMA1/sZv6hxha64NBtDZo+Z07Om
	TbONQ7EmYImMVn/Hq8qs0doWtEzyubHX/Mbysk9yH1Wgj9L53O+ydEYuBqxEhFHR30uAoPKtfIa
	yB/pn3TlwliP+nEN1wnG09U8G2ckSzlBbQcvvi0zS7P81MOWSl3LCQyt0qwC6R+G89MswPJuGMq
	AskGasUkQwejiz7zzu6MsvGNQ8jHoxnq8cDZixgPhMd1dN0sjAvPIpr/x9MHb09HBqJrRQIL2h0
	Yuw0Y67l1kCk1cJGTP0wIwxfi0LZfT+RJgMv2V3pGW1uZxGFwxl4kxdaC5WW/Jwpo4vqyQXJfPM
	K+YZJvRWvpAL8d1zBahNY+n1XnEAd+
X-Received: by 2002:a17:903:37cf:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b0cdd104e6mr122029165ad.46.1774868508266;
        Mon, 30 Mar 2026 04:01:48 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9a6e:3eae:13fa:fe3c:864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm77701375ad.60.2026.03.30.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:01:47 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 0/2] dt-bindings: power: reset: cortina: Convert to DT schema and rename node
Date: Mon, 30 Mar 2026 16:31:33 +0530
Message-ID: <20260330110135.10316-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_040149_257623_1E89B8E0 
X-CRM114-Status: UNSURE (   9.25  )
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

Convert the Cortina Systems Gemini Poweroff Controller bindings to
DT schema and update corresponding dtsi file with new node name

---
Khushal Chitturi (2):
  dt-bindings: power: reset: cortina,gemini-power-controller: convert to
    DT schema
  ARM: dts: gemini: Rename power controller node to poweroff

 .../cortina,gemini-power-controller.yaml      | 42 +++++++++++++++++++
 .../bindings/power/reset/gemini-poweroff.txt  | 17 --------
 arch/arm/boot/dts/gemini/gemini.dtsi          |  2 +-
 3 files changed, 43 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt

-- 
2.53.0


