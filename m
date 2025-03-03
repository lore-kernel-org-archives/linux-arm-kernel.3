Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EC2C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FB+r4IMcrYP9X1FAsufMXQchNOKyq0qSgDMx6XaOSI4=; b=pXwvcAAc1KW2TxvTxEmZcDetdO
	cjFXe2OUeGPvfLrjGeip2fTt3cwQh8LSoIO72GZLofI0rpqoCUCJl92V0TU6Qo5XURcYqcXq3BwGd
	j2ZlgRJs4URCqgQcL0j1uQPolbpEEosQ761i4/HlwZDCm8P8Kkpcu4ydImNVjoDhEz3anJScxJOVP
	itmrTe06W0cZAIT4fVsEeLIAHxgOUZesBf3e5NTIkZ2xlpetzZsrvvxEp0bZIwPR1RAt1VoQIav0y
	f3SYta/CJ0QNUYRHkwti8HVrQEcsFGkA2jlqGMOhnMPZ+jecQd5oknWcGvwYygn9NAfmV7KorEtqs
	Pg36+u0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCDa-00000002Aw2-07vn;
	Mon, 03 Mar 2025 20:16:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCAu-00000002AZr-0IyL;
	Mon, 03 Mar 2025 20:14:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-390edaee0cfso2520095f8f.2;
        Mon, 03 Mar 2025 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032842; x=1741637642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FB+r4IMcrYP9X1FAsufMXQchNOKyq0qSgDMx6XaOSI4=;
        b=Wa/8tgC6HI8n9aUpXqyjbHxXmjE8zuDCzFlNgCHYvit8+XA/DsuUfbU6a1eDHC9Y78
         zwMfePWuoeFiH8E1L8Lg23uc+nWL08UqV7K/dRssVIcSPj49ym8yUsglOTkw/emrj14K
         yd4hyXgFlvCJYwUbysJ0FLeJVT0UyBYsRSNAxxAEKF11v6IvV/vJTr/SVWE9boLG54Ty
         4AoZrOrlPc4jJY8JWcYT0XpBKrHLZmx0O3/pY9/nr/0xiY+n0ZLAXonDVSzeCOMxmwfc
         7pKsNf8KKo+eFlUGJMg0+o5Q5s7K4J799sF197YdNjE9xWLaaK9HbCejCkpypfbGQwwC
         YZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032842; x=1741637642;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB+r4IMcrYP9X1FAsufMXQchNOKyq0qSgDMx6XaOSI4=;
        b=uVjxJHevCeAU7uibSA5hwoMQr9ul+euICHG4lJ9j6VrLzFSJga7mlTLDRP0kK4Q8kS
         pzah5nZsAgjXqN/cefdUmRBxQZae81G+/ORXzDRBVwtmy6CVXFuHbe4dIjzJGhc6MpPD
         /Daw7qZQ24U5w4KPxmH5fqVUXYqVVIJ1yIXrZ3TaqlUF1zz6dYmWR9qmS9CbLpPQYjL/
         ZGJQCx+ca6y3JMk4UqJMGWlEuBSeyaCMWcEyA5q3TnJKqhKU09iBxhJW30ECcRtIGx4Y
         cyFami6f1Xz196SvYInXYF93OrxncxJnXCqbB2+PH87aoCn30KoqfLIiYwNalt4dSYrm
         ukMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgjouVMgT8w7RoP+LL3v4KHHEB+xmr/OkIWIPl/Gqf472Ay3i1HwJD20gwoETmdyumqPUSWVJxe2Iy1bUBf2g=@lists.infradead.org, AJvYcCVzbhlLus82NmCWPa7ZrvZfNUPO9zsUzq7n6YsUKZCssyxJKRY+weMIOhlxj5nZU7Q/R/8l5ZdLav30hhEJK2vk@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPLakKacLuxqoElwXjFauhgTB/4lLd9TZG6DyqXer5xyS7JoF
	nUrS84PbV0V/sqDbZIRDqrZ/NpvnmD+nciM4dA+y15HMLV3QHC3F
X-Gm-Gg: ASbGncsEZz/KZk4v5+e3A32EBtcj0Eq8tdpa/zDQr5TBC+OWKHpMERN31FOVoOXhFsx
	61NFO0zeEWAYo2CSWA2XnyOhY43mOv856K8ILFABAN4ERlU+xfocHw1ugI86InTU7L7rOfifB4F
	ULP4Ly1mV+WuOw12+P6PlXBzWfneENLtduTI2bUpLs3dGF6sm4zGPG5nCqCIsa6Q8gene56vIZl
	IwqdNwG4QBnKqujT9yBB07VWrUzPcCpYfy/1TwjMQvNt1csrBLSidiiflheuMTAnm7wgO4gQqwd
	EHRFsVIFHgvKrmroE/J08qdyMnobeWAd3k09Jdm7PbP1+mQbhTqxdThSA6i8EFykI4HTy+NLDwT
	KqpJqRp3b+XytLqDXzbRTni5MAFQfXEPLF91Nt+CKPebFn7Ul0HV60eokib1lPTpouJSMf3o4d1
	XZghj0vF4T4V6NBbOPaknZUZu1iGbkAqa04NwR
X-Google-Smtp-Source: AGHT+IFftp5oGTv1dqci4Hrpf1S/JobH9UCuDY4jwpxtV8qQCaPz2QhAfkAOR2R2yUrnMGAJVqmcsg==
X-Received: by 2002:a5d:598f:0:b0:390:f902:f961 with SMTP id ffacd0b85a97d-390f902fa79mr7524306f8f.45.1741032842440;
        Mon, 03 Mar 2025 12:14:02 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e4844a22sm15577084f8f.74.2025.03.03.12.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:14:02 -0800 (PST)
Message-ID: <c6da0b27-4479-4717-9e16-643821b76bd8@gmail.com>
Date: Mon, 3 Mar 2025 21:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 2/8] net: phy: add getters for public members in
 struct phy_package_shared
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_121404_116747_81EB3833 
X-CRM114-Status: GOOD (  13.73  )
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

Add getters for public members, this prepares for making struct
phy_package_shared private to phylib. Declare the getters in a new header
file phylib.h, which will be used by PHY drivers only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rename getters
---
 drivers/net/phy/phy_package.c | 14 ++++++++++++++
 drivers/net/phy/phylib.h      | 15 +++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 drivers/net/phy/phylib.h

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 260469f02..873420e58 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,20 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+#include "phylib.h"
+
+struct device_node *phy_package_get_node(struct phy_device *phydev)
+{
+	return phydev->shared->np;
+}
+EXPORT_SYMBOL_GPL(phy_package_get_node);
+
+void *phy_package_get_priv(struct phy_device *phydev)
+{
+	return phydev->shared->priv;
+}
+EXPORT_SYMBOL_GPL(phy_package_get_priv);
+
 /**
  * phy_package_join - join a common PHY group
  * @phydev: target phy_device struct
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
new file mode 100644
index 000000000..a42e1fc07
--- /dev/null
+++ b/drivers/net/phy/phylib.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * phylib header
+ */
+
+#ifndef __PHYLIB_H
+#define __PHYLIB_H
+
+struct device_node;
+struct phy_device;
+
+struct device_node *phy_package_get_node(struct phy_device *phydev);
+void *phy_package_get_priv(struct phy_device *phydev);
+
+#endif /* __PHYLIB_H */
-- 
2.48.1



