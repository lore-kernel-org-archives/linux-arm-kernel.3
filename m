Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B25C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=; b=H6t0tyXyiEVZaazyNxpCLhvkTM
	bn1UlyJMqivImZ26Jccng6b6RROyAftKCCGkeShgyDrUaososKJcYnFItdU7d1NaOyjLSiFcBUvdK
	EkrzcSZhuRsPqHD9lQtwMjSGQjnihq0ZWXTqBaduSNQ/5XWSa4R2JHFwuP09pOz2PmAndP57F9agk
	ssMw7CRryNQzK+g8+lmmSMd8eo/DwrqNGZUF5mIjTJlyU8iT95koGtRFIKDboI9IjHjz+bXoaUTXC
	dQF2O4KzzMDpz6i9FROhxVtTINgt4TgFVIKlNsaaR15kY3m+ufmpDCCCUFZ9fH7+KvajhiPzWVOi+
	m8UQBtQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uED76-00000007nd5-03pG;
	Sun, 11 May 2025 20:17:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uED35-00000007mmz-1J3f;
	Sun, 11 May 2025 20:13:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso40052585e9.1;
        Sun, 11 May 2025 13:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994402; x=1747599202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=;
        b=cJIv/t8NCXSyfxGWu4MJ/ZqwzKqS3EkD/mJMP+S+MA0M9akdz2NbNmcs7UnooNuyuG
         HFQU0XICnIjL4k4avgKliBEQJSDbdMgw6FrN7GEBSnJLlL+v4R0ZqpT7ryJZxfdNu/9Q
         c0ofHyVdI1/JTXlfZrzv4tcvTFpdB189tg9WYABLpFVwsGYTJsweAhs4hrLj46FxHGoh
         cP6XxpDl47eA1IQaYgxWg/5Ye/e8Q4Hl8u3xEuJ0KR3iHCevhw+KuWU14VRzJKAkA+0w
         a0B0WvmJljEFH3DMHCT/W68Q/B4SxLtFYI4VKw3foc3sV8ZLABTbgS/uyY/Dh4i3KPZq
         Le5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994402; x=1747599202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=;
        b=dxuu0YXBKPaz7XIRJc8uv49argG/bxfOiziOev6OB9PgXKKzKpZ4RJWAt0GGctjURb
         G00ZRcu3kyMsZc5NdjvnkNO8DGTBgcyKaRTIML3zXWK3n3xxdy9g2vJovRcNl2TkmF5t
         Od+u8sJotcvwMoOtQ0Q7mfFLKNxOK3bplW0nb/BoSUF99pLmf0YOUQuEMBosw5+KvIqo
         SH6iSQPgbQdjSyGdzU/M3j7WjAmez1ky/Ygr1A0EUJh0J2xCnE2wZYhSXGp2c4stpRyY
         F0l1QCiG9gYwNKl/CZPwZuzGOMJgLI6BoFC+tg39MgPV/W6bB0XSXRFLldw7uRMS7yw/
         aQmw==
X-Forwarded-Encrypted: i=1; AJvYcCXCVdMQ0k90bFZ6AlZoDEsdXClkw88omeB4WcqlcWm8fK6aXacFBLc3BxVG3g2JGsCIduGjaiEdmhfzihiJmPc=@lists.infradead.org, AJvYcCXJsahePZh9BQ6B/t818EW/pPKaQ3iACBkZ5mD0Vdkhvnw750bRXX5ITOiS/F/IS3XAOYe78ezW++Eo9/KLLMsx@lists.infradead.org
X-Gm-Message-State: AOJu0YzVXV38zLB9j2sjgQ9ddAxNgra9ve3RVFItYzbKPA5roWKayWjY
	03JJTC0jjhpI/GqvdNRtXlLj+k/bLgack6NZICZ3wXgHwE56RLmj
X-Gm-Gg: ASbGnct7xf4Fo6s7V5XeRkaFoPvcffbmQS4ts3aHyPAfzRR77uUREEon7ci6vw3Q96E
	sld3JLnCgML2AYP1CmLGfqaCT7VvuOXyXeW2giJ8b8M+mEZjOFmcU5SO+3IKG5p24QQ4/btGeok
	um5UjHB6R3ijowQIu0KBhKUEhKcYxRUZlYkLfttDoVfBNYSXaeNb70oC4L1zdG2jc3TZsYD5q0/
	n5zGuthl43a0rcGiejj6+RpHKNI641QYVo39WL9/scwT7SWxUWm22QCDwvcfojVYEha3+5+xa1W
	80MpXjB1Xd72dXEf/ZXRI83hlip4RmbyR7d+eWB9aUz6TZfVQ1AUl3ubDIpxZigak/onUA5kSoP
	tivRa5QAEESA/QHISNdZo
X-Google-Smtp-Source: AGHT+IEnQwKcdJIIC9mWyLPQ3iul9zlKmb5PJkirLZR9E9nTVzO83g3zG+H4e+2LZ3puNkjMaAX+0A==
X-Received: by 2002:a05:600c:3e0f:b0:442:e109:3027 with SMTP id 5b1f17b1804b1-442e1093222mr47153335e9.24.1746994401481;
        Sun, 11 May 2025 13:13:21 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:20 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next PATCH v4 01/11] net: phy: introduce phy_interface_copy helper
Date: Sun, 11 May 2025 22:12:27 +0200
Message-ID: <20250511201250.3789083-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250511201250.3789083-1-ansuelsmth@gmail.com>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_131323_342798_AEE87635 
X-CRM114-Status: GOOD (  11.13  )
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

Introduce phy_interface_copy helper as a shorthand to copy the PHY
interface bitmap to a different location.

This is useful if a PHY interface bitmap needs to be stored in a
different variable and needs to be reset to an original value saved in a
different bitmap.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/phy.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index d62d292024bc..9f0e5fb30d63 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -173,6 +173,11 @@ static inline void phy_interface_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, PHY_INTERFACE_MODE_MAX);
 }
 
+static inline void phy_interface_copy(unsigned long *dst, const unsigned long *src)
+{
+	bitmap_copy(dst, src, PHY_INTERFACE_MODE_MAX);
+}
+
 static inline void phy_interface_set_rgmii(unsigned long *intf)
 {
 	__set_bit(PHY_INTERFACE_MODE_RGMII, intf);
-- 
2.48.1


