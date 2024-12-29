Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2799BE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 18:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulhKLw5+JbKqvDhRwJDvbEaKwvgTV3rkm9lX6bKO/k4=; b=dtuHfL+C7QYe0hj6158ihiocsK
	tUahcOkvLPvcrlYAbVYFOrnffXE/PI7FhR8UdsYvqZ4nLP2jMtZXcMcBnJw7JbLapxWfzQk6pyspO
	q0XpPo2G4j/8lOZUBi/TSwl6bo3HpOq2QA7uWmkcFubzrL5URc+nctUFeW+osklKB7rCOU6Iyy75a
	micZKFG8H7XT2LvKxakuK7K+7Ui8J0hNMm0LitrRlK7iuOJj3BTycVATu7zKhz/IPUWgpmOrKTW+N
	uwmP2ekBr6xVwuL+ZCNrImhFlvUeZ+FesfQVa2N2fZ/wX9BgylP3LhfgHUFCkL0Jr4ftg7qyQxDE3
	n3HikPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyMH-00000003lmS-1Re8;
	Sun, 29 Dec 2024 18:49:49 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyHY-00000003lA8-3fiB;
	Sun, 29 Dec 2024 18:44:57 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-71fbb0d035dso4582313a34.2;
        Sun, 29 Dec 2024 10:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735497896; x=1736102696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulhKLw5+JbKqvDhRwJDvbEaKwvgTV3rkm9lX6bKO/k4=;
        b=jobNDCeueziZlPSBgiMtGja8RuF1f3AYE6OMdoab5Egkfx+SzStoo616v7ypky6QzI
         Up9vhQDChBewfznCBoOguKj7cXt2Ke/vdA2I8bZDAg7dB6PLy3Ep3SHwfPtZTHvmIEPL
         CgcxZttfCfxLYC/fOH3yfYMcZ0duZpH0FqGeOezoz6osPx1nl0z3Dfsi/CbI7jMeNKgZ
         0Jd/hnTWll6I88MkF6IYTG39PrXI4ueP6S79jIYtQbfjOdt5MKCo44nND5CazC9pLqKH
         UbRvsB6S36lkATGsYFeUYf7PWikhtqALmQwF/BlhTyAmJlnG+bdHAs4fwLL/TmAcRHvC
         QdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735497896; x=1736102696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulhKLw5+JbKqvDhRwJDvbEaKwvgTV3rkm9lX6bKO/k4=;
        b=M6q2M3npGpUYLkSXbeXelJnJkcU3oA/XCBulj/K0J/gelFdM2mrz8+ZDJ6G3F1xKdL
         ua1WTh3z4DWY5uX0AZFDsUsAKMUG6Ed/5bjO9d9wwSQaT5+coWarZQQX1qQB5OA3hPzF
         zUymkSWLFQ2KW26jsylS0ne+o4RFoOuPT4Wki/6YtMKIi7Hy09lyW15/DY9EueFaIAhL
         CZKrBlH0LX3NCEoJsH9t4uh0Zr9R+NAI/YPJzIpnZ9Mjd0L7rhoqGJH8BFEqrbbwMSGa
         EWrQL1Ab1eVNP0uQpl8F1NF7r3wn9oPY0P8Wfm4mFcDlSY7jpgaiGhpoEMNlXvDP5nue
         uw4w==
X-Forwarded-Encrypted: i=1; AJvYcCUJX0BGSFysiXQT+/oavhNlad9J8WbfjCzrfdVm7907sf3AqJJR5GaH1DklzsaDFz0r+wY9gyNhaGjUzueJ2pk=@lists.infradead.org, AJvYcCXau1uzwyb1EcN0YfzVO246QHUGRbFHCWszne2apL2LH2pHVu4gEPq4GtrUbOGYsfKZ137q+DpYFMbW2OIoHJj0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc4I7XbO578l4HiAliNMdqVld8RODLXFqblssSVRdVsyPiYLyJ
	bsd1esRCG51BCNnlDsh1HE6CvEtr3VV4UNJ0bXzK1czIHt9yK4kO
X-Gm-Gg: ASbGncub2m5H8xjPPCuVuGoqLwRTECZ5aELssgmxcLC4htE2wjYmM0qh5Dcw1BjfGoO
	6p1GYS3Fmkx5PWWdDOSpHB1YOVrmduNaD3PyMWGulGbLgJwfTQjFUJpD/Pzdy9arEuKKA7yBuGv
	pnph3psDE2ZZAAloYkmGzUVes9M2n37olGLnx196CyX06Phnv+aSueJ4ME8ogKCIS960e9pxRaX
	RUUT+EDla8SZxlqCk8oGqQkigoAPSoFeaeQEP9g2fduhbdFMb9IKXBuTGBhuWIP
X-Google-Smtp-Source: AGHT+IG353lfPKAUO0GPTNdiBZOi3/4Y24X8g/neHVLcYZrSeT7KQ9bG0wnDvPuvP6aZoQyN2ycVig==
X-Received: by 2002:a05:6830:488b:b0:718:d31:feb8 with SMTP id 46e09a7af769-720ff6c9bcbmr24007839a34.7.1735497895925;
        Sun, 29 Dec 2024 10:44:55 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:e765:a49c:5c4:1103])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97d6fafsm5515645a34.31.2024.12.29.10.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 10:44:54 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [RFC 4/7] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
Date: Sun, 29 Dec 2024 12:41:31 -0600
Message-ID: <20241229184256.1870-8-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229184256.1870-2-honyuenkwun@gmail.com>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_104456_911776_3570A303 
X-CRM114-Status: UNSURE (   9.49  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Ultra board.

The Orange Pi 5 Ultra is a single board computer powered by the Rockchip
RK3588 with similar board layout as the 5 Max but with the HDMI0 swapped
for HDMI IN.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 2a141d99c533..9dd424265826 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1075,11 +1075,12 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Max/Plus
+      - description: Xunlong Orange Pi 5 Max/Plus/Ultra
         items:
           - enum:
               - xunlong,orangepi-5-max
               - xunlong,orangepi-5-plus
+              - xunlong,orangepi-5-ultra
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.47.1


