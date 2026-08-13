Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E82EC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qEhbAdeBtYd8Pzzm6iRICcp6vTdyVfBx3PFK2vEBGKU=; b=VLBu5HZBdBM1xVKQZQc1zGEV/s
	+XwmCMa3aaMa3HPmLhpU2izEDdG3+nHLQ/+bjB4zR++b9jDfUU8yamtgU9tcq8Nlj83Jtjc1tci03
	m+XYrViNQzJNcFK1dyJOqF97ZAE22IsdUChW3MMfNHdzMZSCBJ5HJNL12QIyjya1FKHzoPEhDXnOY
	RNgfx2Mw6cH4uFI7s+OF8yeadVrr0amQQUEECOP/4vVRBGY72sy/7d4psQRLHAqSKmjqFw4ZXiKXc
	LISTIosTcCiT2g2m9egeSwP78B1pkXHBh7B3MDl1wk/j2doFOvb7WoMdF8ceHfWc8ObfJrrhMX8OF
	XMJy3a1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTJx-00000000Wvy-0L4E;
	Thu, 13 Aug 2026 11:10:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTJu-00000000WvL-2tfG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:10:00 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cee9b74ee1so4600885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786619397; x=1787224197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEhbAdeBtYd8Pzzm6iRICcp6vTdyVfBx3PFK2vEBGKU=;
        b=bqHgc9iMpVPKh8CJJhzJGpHRaxgHH+V0nOB/l+q3lsIJKA/8pXa65IQrkU8TMu6xLo
         kAAwCjWpX59RB+6YCT/bG0MensfmkbtNpaQm5s9uUaTS0VhctQf5pBDOG8gJVb2YMtDz
         W3PXuLbXOzp8CpWuGLdmw9GFsqGV3YqIcVanhNmXLTzlNi2fXFasOpIs723gBryS5qAk
         v09iwFqxOg+4TEeqVqVYMswpQ3Iz5TG92Bml/GkCZAIX3h8Y/GWWMepGkncROVXRst8O
         NBPhLKWyVwwjuwSut4ognL66c94A6VUQ7I/AEb7IoISEK2OMF79xkpgAzqIb5MaOV5M6
         kfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786619397; x=1787224197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEhbAdeBtYd8Pzzm6iRICcp6vTdyVfBx3PFK2vEBGKU=;
        b=qTaygB2BQHm1qAz4RG3k0NwcmbEPNwa9oogT8JT5Aw+1CbbrbaR/ecUHwJQDLIWhky
         UR6SkC7Cz7iwXCKoxZNArgw5kdWLHfAt51U9tO2yZvcPocxLu75qLN9QGvSgF3VimgPG
         vWVB1LLv5sZUMmuBZHHa4rIPIu+v8Dv6wR2rfi1B+0w6Agbf98XWoApvg1a+Hj/+p83U
         2BR8Vqj5opyJqorl2n1wVlmW4/V+8m4ZY9DRrPYQSavdQ15VM/yR9zjrQbG2bIRf+iOj
         kiQeriT+mMDBWzMpnafxamJnPS//O4pjF4uaV238vAmapGEtRl3irW0OsdpBDT2lxAgk
         N3gA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1hrU8YBkL01avHXvzF1j+Pl7+325yWRelXwclRqtHO1t58DfdzI7A64CyvFSAet6qMZIESJoMsjXyqT0Ki2xU@lists.infradead.org
X-Gm-Message-State: AOJu0YzhVWPPLySBc81P0uIkN1XPKRBTrrBMpZkX47q6rQBOu1IPsBqy
	M6Hg8F3NZjCmGyCGBskBo0Cm6RnrArQqEwDpYcR9WO8EVXaZ1e4rVqVi
X-Gm-Gg: AR+sD13JjvhlOVzWyVjf9qXt18sawMt0vdy7ap+tJcW5enm03xzY/kbPj/84Smvd0L9
	SH+HEWGqKwBXiN7RYwP9I+AvEW31sd0g6VBCE83bpzx4XH73SLPIhLTwUP1mDvI9U9kYX2NOOGT
	X3LjMYT9XKAkh1NRnJi620T3I/pqGd6OAN1izDLsbaocNPW1BwXyIqRZ7X2ZDT/ddgbbFVHIxpJ
	8FWUeWiPr3+0ze+OyTQiWQSvDHNLFTiog7n1q7ExuxM8Alsc4A1a6y9gIRf/g92PM5Lj7umBSNQ
	QvUZiw+Swj/CVampFA21ssV24xWI9KlHLPInrgMdV/M5gs+wZw3oNSkgwXoIoi9MOjgc0fabg/9
	khvrc7C9NjDZtDDuJzUkX22eslYPFk8Cf3Hgn73+L/IITMLLSrKdyeXg3ih/K8DKXjLyX72ABEQ
	TldLHp7iEaCJzVcD+VTs/Z59+neHJ7KHsVtybIPDfsUvyyRkdWeIiOXS3hwM4SitgkHuF1O6FpE
	meKbIjVL6NYw9kiWXHwWXf37IvZJ2MB4Of6MB3CjBYmbwbuHLYprDmbPIX/CTmaXd5zcdpu54mP
	rxI=
X-Received: by 2002:a17:90b:53cb:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-3931e0241cemr6358795a91.3.1786619397312;
        Thu, 13 Aug 2026 04:09:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412da7d3cfsm10442224c88.15.2026.08.13.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:09:56 -0700 (PDT)
From: Manush Prajwal <manushprajwal555@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH] pinctrl: imx1-core: fix device_node refcount leak
Date: Thu, 13 Aug 2026 16:39:38 +0530
Message-ID: <20260813110938.1512-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_040958_749564_AD51AB3A 
X-CRM114-Status: GOOD (  12.96  )
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

imx1_pinctrl_dt_is_flat_functions() iterates child and grandchild
device nodes with for_each_child_of_node() but returns early from
inside both loops without dropping the reference the iterator holds
on the current node. Since the function returns a bool rather than a
node, there is no legitimate reason to keep the reference: call
of_node_put() on both loop variables before the early returns.

Found by inspection; the sibling helper in pinctrl-imx.c avoids this
by using for_each_child_of_node_scoped() instead.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..fa8f6a7e03 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -551,12 +551,17 @@ static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 	struct device_node *pinctrl_np;
 
 	for_each_child_of_node(np, function_np) {
-		if (of_property_present(function_np, "fsl,pins"))
+		if (of_property_present(function_np, "fsl,pins")) {
+			of_node_put(function_np);
 			return true;
+		}
 
 		for_each_child_of_node(function_np, pinctrl_np) {
-			if (of_property_present(pinctrl_np, "fsl,pins"))
+			if (of_property_present(pinctrl_np, "fsl,pins")) {
+				of_node_put(pinctrl_np);
+				of_node_put(function_np);
 				return false;
+			}
 		}
 	}
 
-- 
2.46.2.windows.1


