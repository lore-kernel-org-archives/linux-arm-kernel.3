Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE5DC98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=; b=1736vBthkbaogd5tHis/Yr+khc
	QuqhfEaJgu5TRVnryt+fPYuTqdN1Tg7mKVDgHDjGjssaMPH72SvMnilNOp2kC04X6EtelkDjOIYEA
	wiJXzpnWqon710JUAJUIcL7Y3imGJT+oter3G67qpsZnHlLNB6j7j/Eq2gNBB74AKALm6JFNuSWKd
	khf1wB4Id2VJQsRA4QfNpbUWojga4opjDbj7tzByM2JSIERn2/gRynFRU/YIjRMkcuAtPhilrPtGP
	cgNNHNlB+j/BiLSvKIR99JRNc5tuSW/GxlzmEhCdoCw5K9Ssrle69DtEgVLhqkP64YkuT8pJVuEFJ
	VRv1wtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQMG-0000000FJLa-1D1C;
	Sat, 26 Sep 2026 11:14:20 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQMD-0000000FJKm-4AbV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 11:14:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so7655055ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421257; x=1791026057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=;
        b=CJ95c4NfOAou86MumexIftSg0Wm6dndqE9qcsFwNGIa4zjI9e7kq3W6IWIl7RptVem
         zmOt0OboPesLi0kE2ZRR0Z8boyH1vTlnuowpavNHh0JBINLil1nHlBRDxzB1UhLvZXbp
         77ye4eVF1djPKDCKQHDEsRbGdOsoOyCZQWGeCYo60fmjyFDhkQbbJAfuSk2BJRrEDieR
         48P5E1+cToWlQgaPrgSkdvTndYX7cbfdN1Npc0c04iqIkfjDV8iU2qQIlBKWm0o7Vz5I
         Qt7RyoH+A7QiG4O7CMdjQhP+iDc1wRFRmRPQMBVd5x18KZqLUzd1zC0SSBNy92Uxw7kf
         uv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421257; x=1791026057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB4iIPD9s85NH4nmWfiMXw0s7RZqmki7HNYdJPxvluo=;
        b=0IQpnP6b3lMb6Ue1cjIk/T2091fjQKjxP2yN38LZWWVMlOviGB0zxGt8KdtjD9nwcX
         eb0pyT+Bz2IJpwILrsUcE67XUsKHbojurVe9MiinOB4AVdWyAC1VBN+lpxy4Hh/rEK/x
         cutS/6Vpr8XX4BwOZ+sAslfKHL82tRAJ9tSHXzFgAjKb5uR6PIcvRiXqoEzG+PZkuD5p
         BFWJUkR9znxcYRsytNy2wIvgd90R/CAlKSxtHjI0Ph0cubkfeWewtwDLV0uwR+nCT1Cj
         NiNqHLa3lPhSIAIjm8HtNwjTofrrCjxQq4a3Fjkle0MBgEHyNvFaPgsycXI42YBkbvfQ
         gPQA==
X-Forwarded-Encrypted: i=1; AKwUvBx+rJ1oPOz7822afZ3DyWFV76jJ49bMoYZ02pO+xwUhirQJE15cmfUXek/n8P4jZGRAV6yqUuTmzoKdgqAWsGz4@lists.infradead.org
X-Gm-Message-State: AFq9FYLQo3lKEZWumffdwUzTAnZL3oTkRQ0MqLnS7t0tfeCzUuR+TgUo
	xdWb+3eNTGr9Y2RdXzrgsaKCNHOlAlYSGGghairRfgBgl3RqHItMR2uE
X-Gm-Gg: AYBFou1P5Q5lB1VfG5+j9kr+yCpJOES9j+4jBi/9xjjg5RgaNMHEl99CeYv1gLX7xd+
	KAN+y2jnSSMhX2n+xZILCf7tOCv+T5aD/1bhxKIvbvtmYDK5HS/+Nsj5RhHo4hetTcoza2nb3Yb
	wxZE6YzhRTS1fcheilmx6ZfdQvPj9U5iy8uE/Ia074fyrJvBGlUgKircqDTeKkmQHwLGxtNaSc4
	pIpkumNtJS/f4jb4lW7jRIExB4o5lKrQNNbc8og+PxzhIGzAxk1AUAj4vgQ0+gUrpLXaQq/G7wD
	efbpOvCr/mQ1EonA/pevZeCbIR0/CkpGAkWQCc0/mXcuNAdKKplImxdNVxrRLGu6Dvhdd0EEycn
	seMWDSS5UJnkPzfbiJ5KQQAq1sv3gajzyWh1CgfdOOB6VDVCqr+N4jxzMBEu3WS8NSZkarx66+m
	GKTLmTo4KPfsMgmA5pi4Sf2THlpU+BUdgBaDoG22B55lfqfBJV7p0OJ9zQRmIPINykoIsPkd2g8
	/p/6gmjl7UFJcBAdhX8ib9WEg8X0k8=
X-Received: by 2002:a17:902:bd47:b0:2df:8f81:e5ad with SMTP id d9443c01a7336-2df8f81e8efmr23449745ad.25.1790421257028;
        Sat, 26 Sep 2026 04:14:17 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:16 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:13:59 +0800
Subject: [PATCH 1/3] dt-bindings: reset: mediatek: add MT7629 TOPRGU reset
 indices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-1-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_041418_063266_E1F11B89 
X-CRM114-Status: UNSURE (   9.62  )
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

Define all seven reset IDs documented in the MT7629 TOPRGU SWSYSRST
register: INFRA, ETHDMA, DDRPHY, INFRA_AO, CONN, APMIXED and CONN_MCU.
Use their register bit positions as reset IDs.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/reset/mt7629-resets.h b/include/dt-bindings/reset/mt7629-resets.h
index 6bb85734f68d..828919eee298 100644
--- a/include/dt-bindings/reset/mt7629-resets.h
+++ b/include/dt-bindings/reset/mt7629-resets.h
@@ -53,6 +53,15 @@
 #define MT7629_PCIE0_USER_RST			30
 #define MT7629_PCIE0_PIPE_RST			31
 
+/* TOPRGU resets */
+#define MT7629_TOPRGU_INFRA_SW_RST		0
+#define MT7629_TOPRGU_ETHDMA_SW_RST		1
+#define MT7629_TOPRGU_DDRPHY_SW_RST		6
+#define MT7629_TOPRGU_INFRA_AO_SW_RST		8
+#define MT7629_TOPRGU_CONN_SW_RST		9
+#define MT7629_TOPRGU_APMIXED_SW_RST		10
+#define MT7629_TOPRGU_CONN_MCU_SW_RST		12
+
 /* SSUSB Subsystem resets */
 #define MT7629_SSUSB_PHY_PWR_RST		3
 #define MT7629_SSUSB_MAC_PWR_RST		4

-- 
2.55.0


