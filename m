Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E38DC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=; b=EwrkdvcpsXy0fUa1TduzOH63Jj
	kl9N2VkvGX54xexyTEoSzpxdOvrq6oTsBvMW/O4yaHvJYWWs7P9hhmKxZffbYJFAnGpxvcwdLTSfU
	cXXZq11ymHFMhqgMw8/O6qAkFC0lNgjskXXZgcF+rtSIKxIH59D4h3tY063O81+bYfBXetGA5Yj5q
	SE55tW41oOxeycyMXSEa81qbFSTdIVXRURQVqnenrJSr065aBAc/UGF4ajvzXMK7Fed24WCoh6msm
	7Q/JuBWcYQ5p3SiUcsei5qEnJd62YrNndmQxoquyLt01bKz4XeIZzsUIMR/En/XB9pld2Ku9Ovx8/
	4a7C5WRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTp-00000001JkT-0Xzs;
	Fri, 17 Jul 2026 06:55:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTj-00000001Jaj-1W14
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so1646825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 23:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271322; x=1784876122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=piD4/1WdC8uLlRQbsZzvr9V+P43+mMtWzu5EZy5hQbeWuxNEErmU3XxZSl144dxNtx
         /qQ4emzQTzPq9zHIgQuXnbpWvVrJsmU2sU/7CEZICxEJqRXf406OE/HR86TrVQug3B/P
         NTyReOFCFNcQVF8EmEuesUS3mevrTL/OwJPU8xhgg4pjU139et9LfOWcwYcRRT83obI+
         eDYOXvCXxwBa8GC50O+CSnZm1UK/6E0nUJmiq7KZcpuykg6BMHQqI7t5wyKfaplwKvXp
         rOK2tsf3UFh1AcsFPIqFJY0wp07olSrdHe2b5L+SS4EamABvFyRbLDOwgeX/kRGaiENz
         cTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271322; x=1784876122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=i/LpX8dVfU9Q4x76b+JYnaiOgYekLzk7szYYNK8d8LuarTh/CVPleLTBHD8KygbH/l
         GumXc2nRGNzVnqIGJjN2coceiNy1C0CgtdY186aW+O7rKrNoARR3GVVIHga2fTJNzMJw
         8LBHz/dTOzocZVeojSV6yQfBkfoj9YO109BeZWkZAQJeuMVtC6oKhf4Q19hWs99FR2iU
         Y6F5UJ7bmKwVFeoUMutaCTlzvQMx5iigjB7rCVPoo0TZh/JifAXqM26KsBbAvAdXJxOI
         n6DaW+xrXbR/CL/wf6nY2vMDh239o+7+y4ipR4a1ICuX+Oxp7IC/fkJwhpocZkqkJap7
         Hsvw==
X-Forwarded-Encrypted: i=1; AHgh+RohGjLzlm2fDHhH+38ZOkSKMXgH/nFg4dfr25WwiOR+z4uqW7QkaUiS+fMKaNnz2E3rsUzktYUipEMPY4vwregL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Qc8jSAEICpI7lh/fQvr09IbD2xuO9C/3hVI8mDBTnTTgtaBz
	Xvkr35tS9akL5J477fhK92SwIbP7rP7846qTxtJ2+wQBfHy5TR69cBRf
X-Gm-Gg: AfdE7cmbfIUOUACcuW9aiTHQTyBLqxZub48fyeoVF2hJL7jsgQ4SHE/ozYK5F85q+jV
	eHbt69z90/z+MmLoXkLvpNT7CFDFC25xGcu/oKqxW56BgwPIrAyRervcDEZe28ETZYgGvMz6vBW
	dznZe1/4GzZNoPo1aFKmi4y48fxbWkekY4zSZnuCr/SZvG+NRk+DOrKES7CuEhR+TUeOB6kuxZX
	m4fFM6MnKznaJbH50JtYEIeV4p20wsqDEnp/xuoJWXuk9FPrmFT52I4TMj/ibfe8NDMFzmw07YB
	HkZ5BgIRCWvVxWLUSx1wFabbdMKJtivJAPFgM9aGmDejZLZLFQiLr7Sh9jjr71sn7WN3b0py7kf
	wIAA+TVaxPbuUT23uegrJYoMILP7Jk2A+HJ05O7LrKH6aRWcwln5rOXLeiXYEmtw6kcQx49yfGR
	+GmiKL1GbqtAtCzUin7SNdlzXZ0lI9Qese0whX5tFna4erve13r9t2nsv63Svn4FU+V8bUIw==
X-Received: by 2002:a05:600c:574d:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-4954a405e58mr9272335e9.22.1784271321433;
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 17 Jul 2026 08:54:07 +0200
Message-ID: <20260717065448.1498335-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235523_422637_1B21282D 
X-CRM114-Status: UNSURE (   9.82  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3218abefd0c..51704a90ca46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9682,6 +9682,15 @@ F:	include/uapi/linux/if_bridge.h
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


