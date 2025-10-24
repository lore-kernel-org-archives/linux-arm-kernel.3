Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A21CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 01:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnPNWSYL8/32Ip+DCAgHjLLC5ALgmJeNiRp9bOMc41g=; b=Rhufn0tdGShTNqgf3+mvosoKwh
	k/zMn0KTTL+ePJhlW6MrS27mWAvh4+CRyATBopi6Nhlx2ch3Wb/NItsrinwzR6wOCVFIC65BO3k6O
	YvPfn2Yktm2j+gZwVfzvLP2HjlyTn2Cto6kbykJ4+xUepykxzvtq7b6SCIPoSSUMzDLD4tF2ZwDi0
	K59nLGYWPBEBM4tyxBamTw9xFHa8vvIB5IVxnikgFqpQmZ4XpHkt+oONuBBgnkUerIpfATDzbG72o
	MpCVl8MJtXnOvDqzwUiBL1Hmtv9rhpFgjlBEsRGGHyFCEIXEeuqe/P/LxiGw8eX8QGgiNU/093Jp7
	QYbG7v0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC71t-00000007zBG-2LSt;
	Fri, 24 Oct 2025 01:55:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC71o-00000007z90-3WcV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 01:55:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-29488933a91so6220485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 18:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761270940; x=1761875740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnPNWSYL8/32Ip+DCAgHjLLC5ALgmJeNiRp9bOMc41g=;
        b=SZev8C1V8zH2eB98n6qTJm3MvuyuoLTjCthOK6JHfblgSov3Jl22nOJjOVM6hm3py2
         WVBWRV1ijaZ5BgDQzodIVpM0M2ltwIsndbcnqLQpqxned0dR8mbvHKE+wwHUcMxeou6I
         h182Qw4zNW+rvJgEwhvhEhwOp4VpNY8eidce4FGg3gm7cwh9aTd6jgNNfOZLmZFVgNMY
         jlCfhZtHF7kbTvEom0yCs0s+2eYYqzAzW/B9bXG9UkfWIzDt0SrIX7ZMcScMOQX1YMPj
         bVeeZf7e776WHNmOHQsLwCn+HBtl4XFL75KWBuOIsPWn3oNbGpttEUoR7B2Hsb9xr9S+
         09Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761270940; x=1761875740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnPNWSYL8/32Ip+DCAgHjLLC5ALgmJeNiRp9bOMc41g=;
        b=b5id9WXtT5ASql9S60DSStwmGuVOz/fzOo1MCXukOIUWZ1jSPA/VCrUmc0Ah38UtlM
         ek4JClLDknWsnEtaNud/lUU6IeVOugh9mXvbZpZqogVT7n3SMFxniiCtEtQeyOtst5Tp
         3QtirCwTKEFA2b2qtFRC9hBsVcdZMhd9QyFRHe4U0GhlUg7StXk1LbC8s/0QPY6tvRA6
         FGMdtrpRIdLN5K+rYiitB+mS86i4Olv1ZexRqMnw6Te80a5dg8Re2KF+2mzJ2hhS4qlu
         tjU4a2NA/1dG2rmdLhEq13G0KMffz3V1J+IDm9Z4E7Ogz5aElNc17uy50eF9NXZTthMt
         PULg==
X-Forwarded-Encrypted: i=1; AJvYcCVDQkH8Z5MvF0piJt9rNibWlhflC7EK62KIvHyaZWcOZBwdgAYl6vMF5RxA1YWnp6qzfBBQRTePqBzir2lRWTOU@lists.infradead.org
X-Gm-Message-State: AOJu0YyjntoqSac01DeBuj1H845w0er07WzE083S+cDJRvM3EDZARFYj
	PSIvzUfN9MSoQISJCkUsCYXLxUpXtnPFtuJti6pIr1fBDiaA26ztZpqd
X-Gm-Gg: ASbGncuprX+pVh3uWtXefz1+bG7ZuiEKAt9c21ulI4LVol5B5DD1XhC0B8/8vUs5+z5
	v0960XfbLrH+soGhoBStoByNw8U51LZiXuyEvoVKieqh5glNfjZ49yThTb4utxzJBQPW+fWPQ2F
	rs8ItJbvfE77iaIYibrIwQdrckuzO69RKykqONr5TZHy7vvswwfoZFw87s0htIjFFkcJ+mIM6XH
	CDso9ZJj5MyHFSo8ZYW0KoFqg1ztj6DbF3GL5iyWKgn8BWPjQG7CHd9PyXXWXpj2h+/a/ym0zBY
	UsL665AE+MU+cZpyWNVgL+wUZX3wL4R3hjILUbUvc1InXudGTb+pB7+C+o9JWMPn7r/uoxmY3Ny
	ryQXYc51EjuX959aSc/AFnxsgxJFXW+r1MIYwF2BK2u+LLSz6lM7FyYvDL4IGqup7/UA+deCZjO
	U=
X-Google-Smtp-Source: AGHT+IEvrwCV3AqeaXcBCGHkmVsO9zDXt6O5hUjk/JLZSn4FLKu2VrTulSCz8MIwR6RtZ00/qylMQw==
X-Received: by 2002:a17:902:cec7:b0:290:afe9:76ef with SMTP id d9443c01a7336-290caf8505bmr346295515ad.40.1761270939983;
        Thu, 23 Oct 2025 18:55:39 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddeb51asm37483385ad.32.2025.10.23.18.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 18:55:39 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy mode restriction
Date: Fri, 24 Oct 2025 09:55:22 +0800
Message-ID: <20251024015524.291013-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185540_882912_6EBEF455 
X-CRM114-Status: GOOD (  10.23  )
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..0f1523dc0e36 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,13 @@ properties:
   interrupt-names:
     maxItems: 1
 
+  phy-mode:
+    enum:
+      - rgmii
+      - rgmii-rxid
+      - rgmii-txid
+      - rgmii-id
+
   resets:
     maxItems: 1
 
@@ -70,6 +77,16 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      phy-mode:
+        enum:
+          - rgmii-txid
+          - rgmii-id
 
 unevaluatedProperties: false
 
-- 
2.51.1


