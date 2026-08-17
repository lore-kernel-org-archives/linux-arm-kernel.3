Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F8DC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzi8GymOZsAzDRFxhnMcMsHjxOXoqegqJCBPzRg9+sM=; b=qdmrZUA2WlIaKXsKHbpneMbeIg
	szcB2mibUTNGgF4EkPcLdxPwBgXC00U7W7CDZPurNHsexFV05Jl0gYu1SBqi0zOrcgUd27m7qmV5w
	LL2aGtfULT018DOSC8wh5CnL0nO9Bz9B1Sgt42Lq3JEh9X1I8bQVmD8uhwuwHpEkw5y7elN8tE/uv
	EfmY0L3GbP65JoRdKyjQ6titNCkO/gwpgQA2LJfm/5fOAvZrXtH4SdJ+Dl7RN0fi55Vziz3/KXgcY
	yQX4V6sZpKvaBS2npQEm7v/C5uF2gigbGi3Or+M/9CFUUmgSWPNnwAruwVQNdiwsJpEnoOiWwirZf
	BTtb8F4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaf-00000005eka-26er;
	Mon, 17 Aug 2026 08:21:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaZ-00000005eaX-0xas
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:21:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49558ce01afso23535915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954858; x=1787559658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pzi8GymOZsAzDRFxhnMcMsHjxOXoqegqJCBPzRg9+sM=;
        b=aIlr4zQRfPzR30QqyOBceyYMDg79AANVaGp5tDQQxLU29HvY9SybhRaOYT6irr7YHJ
         7DlFup2/KkPhZw+kxldYkmp1KRgDtQYLj2H28rikW/7j7vuUwVUL2OlaSLT5MMYu0KMh
         dx2kE0yFCLexKzxY00KD0v47mbczQ8ymEMjukWqk4xuCEHpAjC6WUTaJKEWVtW8/tyb4
         RIXxbiBu80rr72EZGdV1IYJU5+57AguyuuncPuoHc/b0Dua1bpfc0df/c8QCAhYZDhEg
         hZbpLxA4lmB9gDCBgC2Ad3zvQNFPnI21N96PDxIWFY7BvXHC93hJMJHbXA41UFhUwI/e
         FzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954858; x=1787559658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pzi8GymOZsAzDRFxhnMcMsHjxOXoqegqJCBPzRg9+sM=;
        b=ZFuuxbZN04WaYJ3BsvAef/Gk1VG37XhGEqkHMDJT+ZW39R3AbrI1FDI0rCTXJnSjCk
         edWo9vp+2yaiDmfe+5dL5KkyyVyLB0FBlz/mzGlZtL5rLKZSS2OOfhVFbJXNmOVGQJEg
         csmt2Ttv3upQiM/oN5UdIKyNNHkcpWftjioTPEJAEzfjtlD0/Mqt9uF82d3cFjVkOnbH
         9C+ke0gOK3vq1jY3+d0IEhtaNWrzYj5t7IdG3UvlC9UtaJaxMndNdbrVsmd04r3vk1F2
         0VAy/NDpzryvERGPHoKhUwlzd8TV7DwmHqO/kGu3L/TlYD4Az3Y6QgYNsLZv1iPamWxU
         YGJw==
X-Forwarded-Encrypted: i=1; AHgh+Rpyv944p5shPwwuT/deTOOgUUq9BTj0SgeDbcVpJVVyMAiRFaueqsOqXXHptSEO+4UIILJhjU9mgaMhjtbK89W7@lists.infradead.org
X-Gm-Message-State: AOJu0YymZganfP3BE0qa43IIOSDYM8KcwvUc8KZV+CxuT+pWviPMTbMW
	DfB+GgldwxOBhREUdyMws1M2QuhRdU54H+H43lm/1ojwidE/LxejOE8U
X-Gm-Gg: AR+sD10ZTn0awfN1CW63dCSgqd5AxkX2KyuMQ+UcsqAtekTBcTZKZNCnEw46nP2nrmk
	EaYlrK9A2PLbIl6PYS8o+Rw0+Oe7iZtJp6gMZK+wATpzRqtBiThKKJHCk0DOno0XajLBRC1oCzL
	+Nwjcs2l9kLVG73AzTIekMfy4yzZAQcptDaluiZB7ibJ6JZZfD01gE5eB2ZYGajceGkYzidrfFs
	+rF7dY/aCRehzG5qSo20eeqbmRrH/5Djolq6c0PTOt3p0Sk1he+pMMFzDqtG5416r50oqxXC2c9
	r3Yw9T/lXeZ5Z+eV24Cb/hapshYSgS7PHPPUwEzqt9o+N8ZUQx95Iab1GTKUcGybhu6QVSokmYQ
	EfqNZGMVOHoCI7VSk4v8HB5oDKfmmxGElSwOUmLBdN+hrpBb/tRGvGBE/kV3LX2ycRQwKBWz/TO
	nwTT0h/c8aoXjY4R4N6lJ700bJzSiPNI07JnCMW3mxAUSZDeprn54aCRD+JKKhK0ZzufMdB3L7n
	Bt5idpDntrEbxm9++wsCTpQ88G66aX/JtnIVP77x/adZ83vqiY5q6M+
X-Received: by 2002:a05:600c:34ca:b0:499:7f38:d77 with SMTP id 5b1f17b1804b1-49988cab011mr368103075e9.6.1786954857528;
        Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v20 07/10] MAINTAINERS: add myself as maintainer for Airoha AN8855 Switch
Date: Mon, 17 Aug 2026 10:20:29 +0200
Message-ID: <20260817082034.20326-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012059_294248_986E2553 
X-CRM114-Status: GOOD (  10.87  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0e7fae5b92f..d9338fd2f19c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -760,6 +760,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.53.0


