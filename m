Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA29DC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX2AgnXjLZsaf/23m6DzBSsHeoFXJnMo+ci0aY0CQT8=; b=TO9v0M8ZbANpgtmB9w27Ah6R5r
	RMwYUYu/PxlmGlzL1R98SksphzwTIG/rFNnwqCLBDhErQLm/1OT0JgqwhhtuLXdYHvqYm3MKgVqYl
	tGpgdmcYIkpJ3Jw3RAr7YmnH50NIuTCCLD0EmcD18nUNVebTNHgKqxPfP2WaCR3E1bUosd9BW64wH
	J1XoGakXi6X6GmQXpvU48ZZwv3I0+S364Ig35zf8v21ZedSsF6FCqApfwfO70PJroB6u2YsOj7INY
	lC7hbg+8blnJ5OYv+/avECh4K3qDrfRv182jq1nxScV+HiuEw/azMv/rdEUjB6x22CXe7L0IoE/Ek
	5CWxju7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbg-00000003j6f-0fi2;
	Fri, 09 May 2025 13:17:40 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMoX-00000003aMh-2A1N;
	Fri, 09 May 2025 12:26:54 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c5e39d1e0eso234239585a.1;
        Fri, 09 May 2025 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746793612; x=1747398412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX2AgnXjLZsaf/23m6DzBSsHeoFXJnMo+ci0aY0CQT8=;
        b=TKBUGoCZ0TG0LwwwVPWWk/s+sRX2p32xCqbWDHxEHHIVPkCo6xM2Brrqpj6To6VCYM
         zsjmyInutL8jaYhGqqaP2RqvAzP85r+i4fR4eRjNztpwtMV2+4BP5pF6/ZykXZl2qsuJ
         sbUXZDd8A1IK4Zs4g6VPGE28ThU5KdLeY2ZpVkt0we9qbJU5iZRBL3zG5dW80VqtI3x0
         O/p165GVIkbZdRIBPZfkYqahejXIwve+SAXW3Mzd9VfrHiyOVZvWhYUhk7MWma12+imS
         ze02nwhGb+KLEnTmtatixQP7/ILF0cYd1d7lGe7bcaDtwYCSi7UP9ZrqPGZmgP5gUXAU
         C9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793612; x=1747398412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX2AgnXjLZsaf/23m6DzBSsHeoFXJnMo+ci0aY0CQT8=;
        b=UvC54+9D9Mudvv8gOyLinJHe1+YapZU8unof9tenmrrDcPZ0CJjKzGIxzGQY+gV98c
         TxPDRO5xcuRfNsnTPpDs17snjAbt0Vy43QjERSuLeD3FZVDCs+xhUXg+1h+gf8+2FH3L
         8TaDvWsmJtVR2kfr3e35o5dtg7AbOPy1uBbHEiRIl1ljlidusR+F7eafl6ibTuI1+rGd
         mG+DA/icn+atQueQ2Yp4wnP1q9o2o2eqnMBiHhQagftinGMXsTcKKO4eM6WaecFzpBsg
         mUSG6QZNCGfwXtkDSc/xjpQdZl7e/hp7uAgV83i8N0vgry+f4cLebD0ebNe3in2L3eup
         jFmw==
X-Forwarded-Encrypted: i=1; AJvYcCVX7enITRI4rPA0im6Q6hOhH207d3bBJvANB3SFyIdEaj+Zn0cKzoBptxlFNbiEqTBjTikYVoeVMH9bxkHuWUE3@lists.infradead.org, AJvYcCVtWmPlNYeztQc2326dKHDKqwPeMMb/biAkqRm6A3dw7iZvQB7+iTAJDh1fk0pGQTkvBKFgQIkmbz2A9ArwA8w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fn5BPpZ8sb+zjfkCsLSKFJ1SuIcqV5FWTMrWUX2JdEfM2dtx
	1Pj51J6CMb0B5NdsyCDOAzP/XDl31mjFUo0BSQH9bliddSwIwkiR
X-Gm-Gg: ASbGnctScepbevGIOKf4ywNaaV9qYAJpnspHEVDy0x/CtWzrrrVMD91W4L8o+Ez7w8T
	Ws2yC4syeO7rTdngXOmDs7VaqwI7GE2hVIYC/dp5pRGoywCZ1Z9Jmm244Kx8lxWfSY0R8KvFUvI
	QnFlBBJEHP3UGVjByOLw8L8fUbnN4tJ8qxGVDbiX9d2Gqe2m/TltYWyPH1x1mQpxfxr2Gpu1RgP
	kL9X6VhMMGUwA8lzH64iAagIriVwpusnCYPGyVscephPrdZtLfI6L8NSrMH1YN+ajH7HPIT/Sqg
	NBjWoNSYCCHkNG73gsxokOcNrIQd/0rniVXnoVjnM65vZV/Epk1L
X-Google-Smtp-Source: AGHT+IG6sxLD+Cis5uDp/dpl1JHYadvIjwdjsVn6rAao3CymIp7nphXMUCDzYlOkiNt8Psg+xB9QkA==
X-Received: by 2002:a05:620a:c55:b0:7c9:2344:ce59 with SMTP id af79cd13be357-7cd01102230mr540578185a.25.1746793612261;
        Fri, 09 May 2025 05:26:52 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e19asm131843485a.4.2025.05.09.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:26:51 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v4 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Date: Fri,  9 May 2025 08:26:35 -0400
Message-Id: <20250509122637.26674-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509122637.26674-1-inindev@gmail.com>
References: <20250509122637.26674-1-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_052653_544964_F92FC721 
X-CRM114-Status: UNSURE (   9.21  )
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

Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
produces development boards like the Luckfox Omni3576.

Signed-off-by: John Clark <inindev@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..9391e0c31bb8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -892,6 +892,8 @@ patternProperties:
     description: Liebherr-Werk Nenzing GmbH
   "^lxa,.*":
     description: Linux Automation GmbH
+  "^luckfox,.*":
+    description: Shenzhen Luckfox Technology Co., Ltd.
   "^m5stack,.*":
     description: M5Stack
   "^macnica,.*":
-- 
2.39.5


