Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D8CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=; b=o33hLpo4zgE3vCI7PbmYQiZ/Ud
	srHlaadvuVAVdfNVQWFDOj9kC7M65T1GPzx1HcHVDcS1XTDA/gf3rTGrjqKvsF5rgMJtOBmH69iiE
	9l5afducqUtXRUvZ7RM9nrA7XZts0cLzSEwECHQyLq79Sa3bEFTh3sWf73UoDjo6YC1fDpnX7f/9+
	HU2kLBm2I/D7ntDxGyCqFGRWQaw8btuwL2rKNRaaAMQ6vAox4TAScIYXhS4FxgIgZ5Ig1qApt4KQU
	VNFDRe47aT1XsLVD91zr7LjNlzTbkSUxpQiDu8tFapoZAb3B9d15tkXZ8WWXO9f7TJVr5AkyKvN/X
	cg5ZD7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinh-0000000Djg2-2fEM;
	Tue, 11 Aug 2026 09:29:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtinQ-0000000DjKA-33Im
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 09:29:24 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso2900835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440559; x=1787045359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=CuGw0iBVhEIBquqo9Z8wfZHZ506a9ay1+o4/CaHU+oGhcgLhi76CcmGXszK4t2p0gq
         /s++UNZJz7lhfPgnvPWmU0FszZdgxOuEpX0Q7DwZ5UrEsm7rFTO6TyemN7XxXLX+I94n
         KSqitBGBym9Gjg/u+Wy34Y3Hs3fI36Z2oxHARHP3h+2v2KQ5Oml8na538FDGWFrYC21w
         vYHA5EUV8PxxL4yKpn2X9wPSjLksBOlCLZU6ogmFFVUfredzxw7Td37UiDre6OzeQDdK
         cHJPH+SKfMSTin/+xh+S649BsXP2He8ZM+MFqX+tk6VSZA0QEsChmQo7QdQZc47GGfpn
         tTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440559; x=1787045359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=BJQxm7RNMbMGL6A1Bb5AM6V841fDcaQOK/eweyxQEpbj4bNSbe1+MT5I93GhR82yVN
         u8Z7He1XS6KkRwwrGQsNXRTQ2rP9ABRZjxajr7TYW8NjC1Q1TVGuPwZefxG9TPmtpjUE
         k2EYIbRbYAHbmXM/KyAggwtjrI6vHtk9B+fNRJtnSKHyisOJ9a8Jmy3AWaVTPrgKHqjy
         8EtsFIRY63IAeOZuwzUlpn7FJkXNfyY5x85AWBlG6ewhNlX7AznNWcNwuyI3sCDUU1EA
         wAiO8jnImLg7nsXk2oanITaVG8raC+JBCFdWJ2L7TgyBpKwG2SGkaMXWyFBnnFq112tV
         YuUw==
X-Forwarded-Encrypted: i=1; AHgh+RogC3lNbkQ6BNRKUfMEt9iopQADUISTyRlEc/aO77webuDOA1BO1n97sTfJ8rH9g9D41Tygo7f0xqiRE1O9mcPm@lists.infradead.org
X-Gm-Message-State: AOJu0YyLHnW5SVcUaFmfWvnmRjSHgJjtaSow4OoMae8v9R7LcUXt7IAX
	NDLW1lJl4daexSsca3HGybjeBErVWSQwzAkLVuU7SmS0o9OzAdgVueJU
X-Gm-Gg: AR+sD13iKUwkWMWbAOvAfrLbycbAXrH92L8tr+XtHuAzWz3ib0BMwNCsauFr7dYW3Dc
	ZSApBN3GG28lKG+Dseyzl+OySA0rV/hr99ce/9JTh6jt6/OwEeYNZC9wqPsb0UjkZqxXzsE5FEV
	0ylUODRwg7gfzR+6lIWNpkVzyMbqcCsfx3H7v9Ny6CBsijJ8ua6J7ViZF3HWMeIiFVcxRBt8U19
	JuhMlaUX1RGonxI33u7IG5uHfifPUrk0Nd3lCQEhajhAJ9sw1sLyLCbpFxxs6lrXMxG6eMU9FQ6
	1Npzn275iSSnOHCr47V2dsv6W1avid706Id/xbSWK2lyK6urZnQ7NT5ChYashTpyHWvbE6SPMjs
	/6IaP8No1GzQ8Sot00P+inVUjmqJL1KFBQiKyi9LwozgIOwcWTX6QzwGbYC/TvVdXWRxDJhNV/b
	gtqYgBW7CSt9hnJaykGa8fQEyBUNb46FaoTd92TSVXB3fM3UQnUF7nLl+EnFCdq8s1lVfX9ZRGU
	Wy52VzDS+PSyjk0TeVboFaH7+Q6JsA5dmakAuQFI71h/4pg
X-Received: by 2002:a05:600c:1385:b0:499:6faf:336e with SMTP id 5b1f17b1804b1-4997846c8f8mr35438295e9.13.1786440558763;
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v13 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 11 Aug 2026 11:28:33 +0200
Message-ID: <20260811092843.673837-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_022920_788812_FE3BB22B 
X-CRM114-Status: GOOD (  10.74  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0


