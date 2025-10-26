Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D239BCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+ee3KqA2yzD2P8W3Se92HTLPVHTZnMBaNq34xZJiVY=; b=ghXnyhiioNTeowY+q2dgzaatyg
	V+Q2HBWDgz2aUn7QisOm68yXwOsxcKDWD+3XwAZ2iKyhyXBe98kui8RAYtvddarDi2ihN2sg3Q1uL
	HD66bbaX4EhmkvUPsZzIOZJCBAQ5TghMfsP8yu3Zyt7B2ljTX+trvbtq/hSMi7dvMYvdUugLDN8yF
	UwTxKNOm37WIhRBmEUqhHRXKTPJRIKa4ZubNi6SP75W0moCkzrpsa+tC+bGjt25TSklTej+5qZhqv
	GM2tPdNjwcH5eVildQZW6oZV9bKpA736h3m6g8d7TR/KqMB06B/5AjRx8E/Hb8AWwUD6xXq6Q1Kyp
	/jKWWqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1sY-0000000CQo2-0s8h;
	Sun, 26 Oct 2025 14:37:54 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1sV-0000000CQn9-34ey
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:37:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-7a28226dd13so2586039b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761489471; x=1762094271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+ee3KqA2yzD2P8W3Se92HTLPVHTZnMBaNq34xZJiVY=;
        b=ZlEQRS+CialTm9kfiEoH5xTW3+Kye5dxfYnTBQmk5KMhityetPsMXTDCg8w/pqudnt
         mYrrMzHZH6OiyWT8R5spPk5okhIysZ7pLppjDuWTtaUsqMoN8U+CMZod5P0xke38ihAa
         2W7fCK5l5mRWz+cjlXrw/yHETuxNTCoBlNTx/j8bC+CPARQ1SKj+L2rNCerk8F7XDNLt
         piwPrSpGHbgEekrVK2i8sxNQZ8H5ujkgeCqshh3WkimDh06hWQzyrggAFXfmM1DChAnj
         E/MfhbWVqV7t+v1TEBI4OhNDFa94gqSdReT1pwQxhNZ6m25T3McxtxJu3GBzNddnxhom
         xL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761489471; x=1762094271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+ee3KqA2yzD2P8W3Se92HTLPVHTZnMBaNq34xZJiVY=;
        b=EFp8HLmmx16AEw/bFAKBFE9A79Nne83KXoxw9m9SS6VEWhQuxs8XxBvRJ1OzGtH+t7
         VblxighiG/cUHhTJR5zcPulZg+iE4dryuUdCItRQlvFp2c4OzD2PoJtfezp/pTEjlhyS
         vdx6nfsa11qeRo7H2cutbZip02ZMQyFBAeY9c5opfjfYFY9daUX7bOg/EsJBRQ92D+3x
         XhufsN+xkXFnL9iL0JfdO1xtsScH1aXRbhdhyZ2Fz8BD7bxq2oABbcGXbRTCakypSsdX
         +LHmIER0hZWj4zbkUN/3Qr7OJjiKUUWvsraSsuqvXwZbbemtPYYkeCy/qPGatgm/4mD9
         o8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwQM9WsJS1JQJ9YTNeIEUEGrfw89xfkgu/2sfbrT5n12zf8BP0N6PwCXDQn9DCACd21QfgSxDg2Kv3146pA/qI@lists.infradead.org
X-Gm-Message-State: AOJu0YxNqGMd9Y4ZLISVnhckbW9QjB+Le0BhI80TyNTsoaJpyUo2qz+K
	xtapTiFExMqbwB6Z4appxIISS0zHHJd7CiP5z6CNkyp3UA8CS8TSaa6Z
X-Gm-Gg: ASbGncuslg4z0NwvNTsMia7h86p+G7KypRZXlnDLa4Ula0Vf2PpEaG1HcL/uii5a9JG
	0c5uaNVPb4Y7Pc3KfIPiWH3u44I1mYebySEoixJEFcA8kw36SDYUIEZIGewAMXUYIfTnkwIMOvo
	E4ztfx5LTgTijWrp2LPCGXSiwd7CyCuNfWm60KvAQFPiGd5gTwERSNxYZuqfeJRu2pSpljCPcbS
	udIKut/iB/Ixt7Urdku6OumBNaTVtJHfXeaa96m6ACp1/K6KnUQNmGvo03jG5fPINz10LZGTbMc
	Qh3QDvNScdJVcSOhIVMRsIxL+CyRsMyUCOJhoZHnb8R4XRXsSGpr3PsOvLXIx8nXKelV0R6vljI
	Z3r6HxBXlyjv6axAnj32gu6UKNhGxZwxO4VTSWcXXkkrEL9Iy6rxZrFn5Kaw5bENp9AOeX82qf2
	Y=
X-Google-Smtp-Source: AGHT+IGorRTsGK6y1BXq5Jha0i7pSNQnEd4P3A4eW7mtzU1czQ1tha1INqCijpQurD6f2CrckDUokQ==
X-Received: by 2002:a05:6a20:244f:b0:2f0:91c0:1886 with SMTP id adf61e73a8af0-334a86444bbmr46784680637.59.1761489470867;
        Sun, 26 Oct 2025 07:37:50 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128d4d44esm4652691a12.21.2025.10.26.07.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 07:37:50 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add NineTripod X3568 series
Date: Sun, 26 Oct 2025 22:36:46 +0800
Message-ID: <20251026143645.917588-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251026143645.917588-2-coiaprant@gmail.com>
References: <20251026143645.917588-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_073751_771601_6C22D536 
X-CRM114-Status: UNSURE (   9.28  )
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

This documents NineTripod X3568 v4 which is a SBC based on RK3568 SoC.

Link: http://www.9tripod.com/showpro.php?id=117
Link: https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8ac..417100209 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -777,6 +777,12 @@ properties:
           - const: netxeon,r89
           - const: rockchip,rk3288
 
+      - description: NineTripod X3568 series board
+        items:
+          - enum:
+              - ninetripod,x3568-v4
+          - const: rockchip,rk3568
+
       - description: OPEN AI LAB EAIDK-610
         items:
           - const: openailab,eaidk-610
-- 
2.47.3


