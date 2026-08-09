Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EF1C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=; b=uTa6MbCiVgalhNfSVwdazv/zMx
	E9Sf9eUGffs3nvF8+4hoGsGHiQuV0VIJwmj/c+Q34ZDNCJzy9pYZdxMFFyBRyGWbGUSSuw4/7/uJh
	V7QZRXxiu8IugiH+G8eXqZLdZB9AlyB3hAPxQuLEMpBXaRmu2umnGcBKk74HQpbethNmkJng6/JHv
	Ke5FxeDrqMQ7mfNvmuOjB6jbzb4Lbq8algSLjemn59hJ/6caZW1UiueC+Az2VPUNsHZyNGWh6W5gG
	rRWf0GfrEcSoE7Ey89ISPuik1wfgMgoeKDOBQRv2e5JdGwoWIQiytv6YG5uMMgaYFefoACitYbSSd
	4jov49hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABT-0000000AgGF-0V7s;
	Sun, 09 Aug 2026 20:31:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABQ-0000000Ag9F-1tPs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4980dc26022so12039695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307506; x=1786912306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=FYfyY/XQ0ptWuUyQi70kmtXr8OH5uw3quMM81tBxPiQoggjRHBdDLxCLWqCiOwIQGa
         mmruWLSGSZ+hItkVgRiBiNbx1EUNf/416o94WQRci97EmpXYN9Bd/NAhkOsogCLgGBMl
         XL1aI42cuqIOY8EOor3IJic1hprZIou0DFx2iiRITMp5hDI49v/hzxuf4BDA3ykZGjAA
         I8TxtJAU0JtwLiIiC0TUbOET5OecRbRrK8UgSoklYqecWmmyK3f4i1kp0fA/poKt7erJ
         wk0LLPuOrEuBKE2q7gkBcOJXEkHlwz/eJvTlrzLIFFcvr41Q2QRitO10s1903bonPyb+
         uxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307506; x=1786912306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=T+bGQ8An8+S6hUYMjerCWYNhISYTwIhslFEndR/NJLdDVJ5d4gFKbMeqkdWImt5y++
         gijkl6pMCBdajpMNM1eIz6CbxNz8hrTsEgX73DJzXREqnHE9mc3zaZ3YC95Khtjt3+aM
         0x2tOVdJwZjC6TEZKXU2AHDy9ry4P3NMFpGLUV/zEhojjUA8f4anlE+H2MEeyTQN0uun
         jEZxd9Y4TeIEY9PgPrRH13eEJaHOaXsu2RIFWTRAjO/aHpamykBloSOKzu/jdNnBUohg
         UDohePTSV1S8sQeGzkqUP8cwB0064/r3XkoW8NC/yc+myfTzEH4AxmRWrs7WEQvISh7Z
         uV7g==
X-Forwarded-Encrypted: i=1; AHgh+Rq2TFBkV4rkUEf3C/52enHNqSTllQ3xWQjUaadHgIfFTAa13vplLEd+w0ADBf2cEjrYI5Z9IRMVZ6MwQ5AWQ1fQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95l+NTCAg3rvWtHlWFn1T8/qZ6yviTqsv3jTK90CuTMgqL7ay
	FlRYcWM6zvLjR+xGDJnN0trVS9MnYQTRG61zwgj4GSVcf9e5vwRa9kTx
X-Gm-Gg: AR+sD10b/baQOHZMp0h/Axdh/uH2KBPGWjofny9xQxReJ8a0xMTNbb9b+VCyKQntA2d
	ZZFp+rLol1JlnRNM6T72JggndMpsD4zLQSMWomlDekCNPM+HerjTPRdeSQXGqQ260l4cJ91rLKJ
	WfuUWwB+ncgJ7PMiWL++LAEwacAkv0FkmK1KalcrQ6is/FWUPn5AcdBKorNNs9bN6jkcPKkpO07
	WL7Bq6N3H985ZV8q91XArgck/nW7SWfksBeaRs3VB099TJJdCJxVf3WyupkHe+zqpVtfJiKVxhY
	tTnZSXGRkzgWqXmyD88UynwJ3SQgNWBt3zwTNUaR6fY4wnYka8YmHjJpaKBu5aP5wnLZlZIgASw
	jlAAn/OfNgXtSgSDO8iSgXbBlAl6IxHuIVeDUCP7clNfZ6+42kB9FCjEYxBCKhLEd9R+qhfCa2N
	PWmaCMHol7SP6KzpwQsAEXLJQ5LfWoeRcfmZaiAAxXAgxUJ1NEWUrvGQouldX48YOFFDUumPbc6
	kAfrWh+WC1tBMYPt1AKYXCwfd4KgXL5A7T14mRvdZWOdfuL10/LPTTbHsSF
X-Received: by 2002:a05:600c:5251:b0:499:5b04:6920 with SMTP id 5b1f17b1804b1-4995b04695bmr259698705e9.16.1786307506550;
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
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
Subject: [PATCH net-next v12 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sun,  9 Aug 2026 22:31:05 +0200
Message-ID: <20260809203116.640271-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133148_542693_92753433 
X-CRM114-Status: GOOD (  10.83  )
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


