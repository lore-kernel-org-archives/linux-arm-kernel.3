Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B0EE9539C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vw4pY4dR7kSA9L7fEwOm42xTHQF2Ha5YuN0sTkWD41Y=; b=lGfm6bI3ip32sBQWxaCKoDbq2O
	yfkcjnaSJ9y7y7haUjse4EMfUlTxTxb9ldvPOW1zEIMhtn28mL5/+Xi+gFMUPy/YOGF6ToBLulHIf
	lQ9ytv80yipIIerHdUuiPYZ0w4JSg1eSAdf2OoElmqHa2v9cITFOex8/NAfPSnWIOPVIwmC1VZO7E
	ZlBjIFgkPjcbV/vJC6ugWCI58uGnBHQCMtVMHdRD76r/RHIieCm+S9ESO3Y4p2lMN6hcoaOU1sCd0
	oqM/lef9ezxHXaVUh1uyTLsHkjkUJmjtbKlGD4SAQOPmerQZR3PJPDMUPGV2TP/eUwqBugtZVfMpT
	f22tg7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncub-00000008VZe-1uvX;
	Wed, 04 Feb 2026 13:27:17 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncuZ-00000008VXb-1czI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:27:16 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c6c67bc8b9eso456942a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770211634; x=1770816434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vw4pY4dR7kSA9L7fEwOm42xTHQF2Ha5YuN0sTkWD41Y=;
        b=GDMbUwp69UYrglF81cciYetxXzvYSuCpwl+rQEUDF5XDe9eNB4xKNGlJHMhBROjGtU
         8jh1Zu7djm380+0qTO+xG9svyfBjWxx6yL8nN8Z8MNeg+ALGpnG4D8ystJhYsV58gumo
         3qM2yVRW9Dzd/mborb8JtGhf2C5RhXP1hcDsEv/XXWkEGuBJTbwWqamhWRkZredOl2m4
         Lc/U4XA7z4XBIoURNeLgphJD8tTFs3J/WKV8v3dl9P6mfdZB012NAUwWPDSnXQVD+QHu
         CxCz12EsI/XrbM1ztpPShF99tUxm0lQsn3AiNKJRlYXLvQLinN3QCj623m7yM7tf5c9O
         zLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211634; x=1770816434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vw4pY4dR7kSA9L7fEwOm42xTHQF2Ha5YuN0sTkWD41Y=;
        b=eq04FAxJ14co2dwVdJznh/GEd0yyT+UwMunVSXgXLoJd6dpNf7qW+UExGGno+K2a1h
         hrsgFbzWnpltWFyIEYjPbl5ih23O/zrFfTsNAqulw5P/yBftL0YLeXITYmnlBEmQqWvN
         YojcjTtP8BayeG/Ni/w0MOzIu1/AMUl8RtPhuzpMUOiT6CU4shwKb88B/SyRVdRwwycR
         yguNpYVBawyCZpcT1g8U91d6hRaPjWo+w4pe04CYlkJcH8UGyIUZQ6NI8mbGL0pp/lID
         jVKep0DITGVwH1rJhulsyBwm9xa5J4RDpuo7wneYo5UUPblxSMNvvamh+2nX0MUBrziH
         u3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWmtNAlHm9Y45Na0DkH7KyXELarONKR981E6PSVOzl5dND1PHAUzk/e5iwa66ORbmVc7QVMylAYxNaRtakBFOND@lists.infradead.org
X-Gm-Message-State: AOJu0YyH8wX0yglhxVzmmGrlhGW8rM4lKNuxTsNrn3u06DGAgtOd0o2x
	6/F0GiwPbJmd+cNe5wmNosW0qMuPUFKAfEMwPWkX6lE6sGL7aAXQN8Hz
X-Gm-Gg: AZuq6aLFuExRG60W8VV8w1A36+dQBvbA5xHAul9/Jg90noTd+QpcUIiyQdqmU0gs0Ht
	L5T7UQCdzZ2ieZGL8RuQblVOKzf/HpzuQgWA0BkD9CLCElu/L/JAM+WEjtalEhEGPs3v5SHFjsw
	SSUu5XerDE+EsEgsS1TWCKfXfBR06rGqcjRbz+EAVzclyjq1m4323g3YG57oEB4FbPolx9RBe6F
	K+wp0Bn1CN6mrdcz7L9TXEnewS8QYhiOsb8budlcwxOt+Kcykq2aqUGrz39kfn4rvmQu5tCpo6x
	Bf9amGvLjSBKtTmfMEpkj51EPZP6+0frunNqRenOeMwjePClQvzk3VOehjD7nxkU4bZShW/3iGy
	1ttvTJ45oDJruZnDizTfMqpc6jJ++dPVY41dKFE414N7A43Vn+LQPsbfwe88/U10qsiHeZbTkiG
	oIw0jPiXLLucSK6Thghiw=
X-Received: by 2002:a17:90b:57c5:b0:353:38c8:b612 with SMTP id 98e67ed59e1d1-354870db3d6mr2643119a91.12.1770211634292;
        Wed, 04 Feb 2026 05:27:14 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487726e6bsm875763a91.6.2026.02.04.05.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:27:13 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	andyshrk@163.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add OneThing Edge Cube series
Date: Wed,  4 Feb 2026 21:26:55 +0800
Message-ID: <20260204132700.329894-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204132700.329894-1-jerrysteve1101@gmail.com>
References: <20260204132700.329894-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_052715_421991_B2181F16 
X-CRM114-Status: UNSURE (   9.40  )
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

Add devicetree binding for the OneThing OEC and OEC-turbo

The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
eMMC storage, and supports one SATA interface, one Gigabit Ethernet
port, and one USB 3.0 port.
Among the lineup, the standard OEC model comes with 2GB of RAM, while
the OEC-turbo features 4GB of RAM; The rest of the specifications are
identical.

The OneThing Edge Cube series (shipping with the vendor firmware) is
originally designed as a PCDN (P2P Content Delivery Network) device.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index ae77ded9fe47..292fa0bbec93 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -813,6 +813,11 @@ properties:
           - const: openailab,eaidk-610
           - const: rockchip,rk3399
 
+      - description: OneThing Edge Cube series
+        items:
+          - const: onething,edge-cube
+          - const: rockchip,rk3566
+
       - description: Xunlong Orange Pi RK3399 board
         items:
           - const: xunlong,rk3399-orangepi
-- 
2.52.0


