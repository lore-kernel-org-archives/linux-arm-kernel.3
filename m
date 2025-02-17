Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920CBC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YVr1hV2iB6PfGNoj61PMcywr1x0JJZuf5oSH4KXCTLQ=; b=onsU/cvvW4fAYJ5l0sHxYsH/uK
	YD8rLHgcXQJt8ykjRFgBiUeeL1smDFjr9LVIg0GrKUuBhIg1vJjg5isp8b8Np3YHpTL2HVW3oqk/2
	KEpYU+YhhZ9edffjA3u0Hn3yycuHY6Pbm/PiVyl4DB87DRemhvr+lX6IJjy4GppwsPcLvRxadtEuP
	WvUH/GoxA1rmqgEbEERMfuEBISt5KilMOqLiXD+M7YxZAOjv69p8XXXdCGWyhMoP9EqLdV0WbRy43
	XwahAyHfR8RfQJaeWHUQyLnz8W+8IUJMpX0/MbHSddsIh+CMpfk0xC8B0gQ1VjIlB2wydikyhyR81
	IPNQ8Mkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7na-00000005uF7-0Ido;
	Mon, 17 Feb 2025 20:33:02 +0000
Received: from mail-lf1-x163.google.com ([2a00:1450:4864:20::163])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7cc-00000005sU6-3HfZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 20:21:45 +0000
Received: by mail-lf1-x163.google.com with SMTP id 2adb3069b0e04-5452c1daabeso2745375e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 12:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1739823700; x=1740428500; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVr1hV2iB6PfGNoj61PMcywr1x0JJZuf5oSH4KXCTLQ=;
        b=Bvx3EtBs5NwQHZWtVsOXe2+Uem/Fv1Vioujz8fgIbJ1hHHS2kZXzFNNJoLkn5uz0JJ
         nZDy09s7y6vLGXx6Z2FUkvvATpz+VlX0tTBiWfBu3jx+Nh1pAT9vuxD5yyzG+SJswCV+
         FzTiVgzqp2IZjZWPgRXN56g8UFTMkQIBFIOMWr8L6lKqvvMgsBgi0ZfTeS62rZa7smBl
         RI76G4lHB94ZFJ8rmxdUzpGtFucs5NaTNe45WAqy7MRKz1GMxIWZWTtNvsOhAjZq4I78
         vYYO8igbjvRHIvWK9Ok2HBYbAFVT/PE2RWhJ4zVp4LI9W6FSeS+qSPIbd8L4VR5V+uiR
         QfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739823700; x=1740428500;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YVr1hV2iB6PfGNoj61PMcywr1x0JJZuf5oSH4KXCTLQ=;
        b=DGkM0HqdVP5KD8/Qi4/28DAWz/9AOre6POP5O8qCvatSJL+MSajJdbc7oU1+xGpXg6
         gKH8crKuey78nYQVXI4i5+iRZZT+H4PPPp5rV8LT6AviWw5vz+mxElurSJ0dy6lTTLQg
         +ADPTG1OhioF3NLYzdh2ASLnWnD2HU8gaWVa6IZQ4Jx97yRYHcCseM2HF0Y42LzTriDl
         oMzPEKQQ7w6ZDoeaQ7J4/f+70ATWxV2du7WD+R69Q5R5jjIrd+HdELvIDid0FqpFVbpB
         Bk/I10DStcwDPScim7+xoQMRTGpGRUGVXPpfefnNmFDU9Lkhe1Yzse9fwbev/4WJ4qF5
         KYOw==
X-Gm-Message-State: AOJu0YyhInJ9Ym0AnTQrlUmBiRwRVydr5zCUuNEp464i3DA06ouB0Tjm
	5EDYXSHifd8cDNDvfk1fAJZfyS8rvrCreQ8JpwrnSVs1Tt0hPZgdtqZ1k1aOYSpeJSU4FZAUeKL
	7Qa3f7ZJG5cEE+li31CbFCRf+607orRZl
X-Gm-Gg: ASbGncvAjxQLX42OaeZccKWOQJTtVi+z3FO5lKXuFU17S3hYSJMU6QbEcCapF3BWopL
	1tsLcyL4f47xC4xoMw+neNMPFBGA7CASouW6ZL+EF1pjwDcXS20XGhMJ6xJjoPw3a/9HFGYUy0J
	Ghj0QV9IqsEm98k5Aa9P+8GAbIyQr/TmDHJKS+DvaYnQfXTQdhZN9AiZNteG4APt32irbcolcZN
	vR6KcuxTUqomK9QrpYO3zp3s89jZlW8E03ccnzp/dWfmFAnf0y70SnNJ0o/DkjwpnHNOAzJjNAE
	dTNAtTgIHhNkjreTVjuS8Q2ae0LfyScq
X-Google-Smtp-Source: AGHT+IG1KbT9YXMVLvcLXnzqaNmMCKEzhOQTa2fDguunLh0CvEnteT/83KIuEJOKJgj1nh+n/Fr6t8d1LXAE
X-Received: by 2002:a05:6512:3b08:b0:545:1049:eb44 with SMTP id 2adb3069b0e04-5452fe8bef2mr2746361e87.36.1739823700140;
        Mon, 17 Feb 2025 12:21:40 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id 38308e7fff4ca-3091ffa5b3asm1234801fa.21.2025.02.17.12.21.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Feb 2025 12:21:40 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Mon, 17 Feb 2025 21:21:35 +0100
From: Patrick Wildt <patrick@blueri.se>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
Message-ID: <Z7OaTzIpeJ-IACrl@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_122143_078093_FB8CB42E 
X-CRM114-Status: UNSURE (   8.66  )
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

Document board compatible bindings for the MNT Reform 2 with it's RCORE
SoM, which is based on Firefly's iCore-3588Q.

Signed-off-by: Patrick Wildt <patrick@blueri.se>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v4:
- Added acked-by
Changes for v3:
- Split DT as it's based on a Firefly iCore-3588Q SoM
Changes for v2:
- No changes
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..e21c5c8fc2a3 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -178,6 +178,13 @@ properties:
           - const: engicam,px30-core
           - const: rockchip,px30
 
+      - description: Firefly iCore-3588Q-based boards
+        items:
+          - enum:
+              - mntre,reform2-rcore
+          - const: firefly,icore-3588q
+          - const: rockchip,rk3588
+
       - description: Firefly Core-3588J-based boards
         items:
           - enum:
-- 
2.48.1


