Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2651CC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QhJOyahO2VNaU9k107tVS8fzsZZa8vrmStmLuVi0BYE=; b=N7r+np6bGYh923pIfqUSaxpmhQ
	glfFIfYa8yz9ZZyhNRZgiYdeQXxHcJH6IaoxWuK5WYjPz6soXnRcve9jf7G7C0gICJyMf2s5Z0c2h
	mn1wk6eM8xx/mi+uxbSISRswilaPVVbRIyL0r2l8g4EP2SLd/z9ieulCtUXJ8hwRm+/TYMSvUKiDu
	Jm7QOP4sEzfgBxFivWqT1yVszsRLzaSnrVcVgYYWoPa81s8sU7Sl/4dVREMd1zkymPuXmZnbzxgh6
	xc/bW0FeSZNE/n2V8a+Pg116z6QxFVW/oaw9kkLneXFLhb+RcqjyYv/YQZ4xDIBnjZpmM3OTEDHHG
	/WYONAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRvK-00000003pgh-3L7f;
	Mon, 27 Jul 2026 20:27:42 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woRvI-00000003pey-2ahE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 20:27:41 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so3100974a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184060; x=1785788860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QhJOyahO2VNaU9k107tVS8fzsZZa8vrmStmLuVi0BYE=;
        b=jbT/PNu2YVAkhmLZG02ET9uDRDv6zQi+VPRQjU+AmJ6/tQjsd7hEZwQgLGa5lKY0nK
         v5jxdnHd+hvZm1Tx1fJHmPhhuPVAupCzTEQ7Qe5MOw9TGFbcu+GhU6Ew6PCr5Xf8iRfi
         oRsC5/nrZ3tatQdQBT0segUj0vUf+WLYzoVgTTGZRqpQ7ypOxcGi5affiS7i7UBdYI6e
         WmN/Rzye7RHl50wQg24sJausbrgha0MK7K6CWGXzROOue9gmywuBISHDDEnX1vXNPJBB
         gnBl80al5OTD1oSDAmu7occ4jSMpzbHwnGVwDo5Sp9Kmrb3+7s1wNikjT5ZfaVJjqawW
         RX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184060; x=1785788860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QhJOyahO2VNaU9k107tVS8fzsZZa8vrmStmLuVi0BYE=;
        b=PyL2FbWYmd5iJca+ifQwzv+a9Amd40Tb3ekwDMr3aSF/Z0jLc0SuPFDL7/1nmgsC1Z
         PY/Lq24fuL3m2ODldyjORMXS4IDOZao8XSG/9Emd+9AMJ+LBZMtCmFfpxXs/OvkJPq4U
         KtjGa+HmvxUN2b5x8zURZqgbiwSYGI3MAxoRA6o5poQ9mWdunGIHZ6WGsBniC4b29+rS
         D1HxmyilBOiMQ2TigmKmxgXA4SYkJegApHhE7E6CwvOCdAELqV4/kiekwWoOS4K2vX/B
         S1LF4LRJ0BO8Qaxat4HPvPuVyRzST2UWbWOYOf8Mr9Tf4CbpDpd2TY0fJ7wN+jRGJ0Ib
         rgOw==
X-Forwarded-Encrypted: i=1; AHgh+RomobQnTWTx4sLeLpyAAIECKLM7o28vG/6M40x5zUHzfiQveO7cH7sA+YDZnYTC/0JAiFB84LZwq66uCVZJQPzM@lists.infradead.org
X-Gm-Message-State: AOJu0YwjD+n12FF9a7tc+hGTma+iNGd3yJ9WzY5LvbHc9nY5/jJx8yaU
	/XVkGuK2VJINVkt64hZtpOkihQ4T5WDIxL8oTufCvvdwL70dep9fam+9
X-Gm-Gg: AR+sD10L2hL/+iKncm5lz9eD6uAR3AGWR/5r0Z0o/ZFYA7LhQsXwclWR8gG9ETptt+L
	oQvs7Y3CJfEz4qKu1mcEf7YECi30n/shLEIYkuhsCURiMpcEkFV/opEIDFU9sstZxrnOtzYvA0E
	NSFW5vB+Wn9zywyUnN5C1fCSdIMaPADCfaJKo19IP57U90uFU36PM45ZNGSeXgBb3h6kb0KSYMi
	vxvXu9YyQcM9ELJYOgxxatkC78dwddyCojVHMXLaapWpADYkld9pbBK/jH4p7ZpTWyd7p3HuiIl
	LjYeFfCG5TwVzYFTCKTo5djPskICg/Z0Acke3xnOu1dTnpy2iTtFVVSuvIeGDfhpwywaiS+73nu
	aIV8NdSXPibyyO61bF9rh7ZP9G6e2+mBRvyuKFe6bSqt5KnF6G6SBjoIsN+6tPlceuV7yuhcpH7
	Vtzs3Z3JuhqAbn+LQntDnmiVMwdDbz6GCbhXXdRTYxWfxp9SSfCv5XCmwRwMW4tNOLR55ZAr/Vo
	rEVkuTJ4v8Gfghm9rVLAenOWefSW/w7qojsFvI6kS8MZ2L2jvW3Z/atIOZMRqUwYQ==
X-Received: by 2002:a05:6a21:692:b0:3c3:91f5:82ba with SMTP id adf61e73a8af0-3c67dfc1288mr9428321637.57.1785184059789;
        Mon, 27 Jul 2026 13:27:39 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm35331168eec.0.2026.07.27.13.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:27:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: DIR-890L: set WAN MAC from nvram
Date: Mon, 27 Jul 2026 13:27:37 -0700
Message-ID: <20260727202737.21862-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_132740_660430_AB6DC2E4 
X-CRM114-Status: GOOD (  11.27  )
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

The WAN MAC is offset by 1 from et0macaddr, same as DIR-885L.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
index 3124dfd01b94..944d592dee2c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-890l.dts
@@ -114,6 +114,7 @@ nvram@1e1f0000 {
 		reg = <0x1e1f0000 0x00010000>;
 
 		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
 		};
 	};
 };
@@ -125,7 +126,7 @@ &gmac2 {
 	 * actually in use on the platform, we use this et0 MAC
 	 * address for et2.
 	 */
-	nvmem-cells = <&et0macaddr>;
+	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
 
@@ -190,6 +191,9 @@ port@3 {
 
 		port@4 {
 			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
 		};
 
 		port@5 {
-- 
2.55.0


