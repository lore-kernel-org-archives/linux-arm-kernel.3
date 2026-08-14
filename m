Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825BCC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 19:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fnPkLJqZQz4hKZtS8FG6LEBJCnBc6ph4JdLLK3tJlY4=; b=tPQ7tD72b4dL0jMaoEzwsnCoOJ
	Q+UmkQaj+9ZYJjwSktmDvr9aAs/AYgFnlxfmtjM2aS9q2z2UWkVSJYYh3ASLzytAyYYPVpMdpmP6v
	LItWuBOWUcIfutqLJnc2CEsqDbIZLsoULsU0G1WHlH+2uRLSyUUJHSON8Jt5scBO27/bKF0Zp+jmw
	+K+2r+T/S3Z8PpoTMy2X6ZDJyUa5JDzJleNPXXt0JbBzGTDHQhCJgEojcHsPFsAGS+oK07RvIoQM+
	kiOnvJ249t2UniEE1iVtSjB5rmYLuTxoysBPEXtQOD5b61FF73mNg+n77IyZX2VSylVTg4JMzvQJK
	7EfmSd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxE1-000000034gE-2D43;
	Fri, 14 Aug 2026 19:05:55 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuxDv-000000034fU-3j04
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 19:05:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1828004b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734346; x=1787339146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnPkLJqZQz4hKZtS8FG6LEBJCnBc6ph4JdLLK3tJlY4=;
        b=tMIRBYqED2c4XiTMhVC/lmWL8hSlJC+eyV0/PRrAJHGCpg7y3NVGB7GlHVNKdc531c
         pjXTmFLvHloA7TB25dKqjCP/ZTn9yDlkT8oZw68z9XeDh5gvSIMxrwxNP3bRM4n7OqvG
         Y5JMEWV97gHJiJXgdgXcyaN3QrSJK3TbFnN5ZrpGRe3KT5nEJodmJSCX0ilAmGLiAN9S
         do9mF8o2/M9k0cSnWkjdnVcRE69V4UYGzz49M8PBuEJHKX9dPfrxmA5PxWEWxevlonx/
         BJZ9cE3yAsI8VLX6fqORoc3I8ItrjTZOWL+MZbVL5t3GS4qPHoFo6Tm1GcZDtAOZ/dyf
         A/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734346; x=1787339146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnPkLJqZQz4hKZtS8FG6LEBJCnBc6ph4JdLLK3tJlY4=;
        b=otK3/b4589B/CW4/Qv3jCjK2CDvzsWtaNXtW9myueSceX59YsTil9htoRvJH7stjPP
         A47bpr07Ufk/QruTymLUAltWqsJGdA7sp44kPZbDNIM0qn8MHMCnaG+y/myy0LvIAtgS
         a8YaG5eaRO7Qd/iRTLEEKTo6NublRkd0gh7p3PTPrSLiXHVR2gX2396XbsCCXm2ErvQ+
         2pRZWHlzTc0K+f2SbTd5PnyArCBGwZdgl7uIVD9EuiVt9UDWYjGBnJoiZ3kSNnqSHpd8
         0dhJ3839nEpk0q+D2H6DnYgJ466thtuizl7mvJhTzKa5WhmjqybPZHOzok/KV3NnBuuC
         2bWg==
X-Forwarded-Encrypted: i=1; AHgh+RpGRIZBQ4K/0RNXVDrJVuzo97G4ea/feg791SfcoShl9niE/LH8yhTO8Nn1weYvYgmVturDjUsvUP/447QthMhg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8hm7yi0c/7cEK01vDZdxLx1vs/r+K/kv4QzKhrhpH5TZUuFKn
	TnEJfoJzLIdqk5p3d/9vJUh39yEvZcIttyYZR/rrsoIA/fwaAQGx52i8
X-Gm-Gg: AR+sD12fzx01zGVvXDNAsKM/KpGSbpq885I7V57DFZo19Z0X5od4eIpHtoraExPZYb2
	jaTn2kDuC3zQD5O8QlEQbe0uwyJ9tETtdkPGxf6hp4esGFzZlW06Dh95AvwMZKFqYfVUdirt5MZ
	ls0w9u37yZgM2rNxCKMj3Zi83MX/ehOnQGTCWQ8f2znTk0BFbyYqJ3fzgfQUFJ2+f3EvBnAVrdq
	cZMVzf+lYryjdIFx/EFwnBiD0mGFC7/mm2pwTiFqSD1Hy47rZxLjGY/nEdv8T/oNmuSFTKtZ0zk
	z6cbH6dAkzJNakZPNjcTyD31qz5PhREdSCqG86g1l3817vuBn+TXRpCMhbJptKn33u2HvCeSCYy
	syIFmeby05Q/GF/Pt6ybS8Agz264s4+UpE/rNmcV730FLjA48UA+FphNM6FjApYzTTLZSUlWhkg
	8h8+nFL8ebOPygrJ+K/S64n7u9NSg4bD36u7Q41+KH2VWeN+rIOAzzPzjk0A8Ugx+ffIfHKOUO/
	VHBd83e+ZmLG9Djs/vOPUgbSJHt+/7/lHzAJswg3ZmaRQSP7ffzgNNfHoA15hComd5emNd6g9mp
	9A==
X-Received: by 2002:a05:6a20:d48e:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3cc71a2c76bmr10428980637.12.1786734346257;
        Fri, 14 Aug 2026 12:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d66e52d2sm7081695eec.13.2026.08.14.12.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:05:45 -0700 (PDT)
From: manushprajwal <manushprajwal555@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH v2] pinctrl: imx1-core: fix device_node refcount leak
Date: Sat, 15 Aug 2026 00:35:27 +0530
Message-ID: <20260814190527.969-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_120547_962809_FA13532F 
X-CRM114-Status: GOOD (  11.26  )
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

From: Manush Prajwal <manushprajwal555@gmail.com>

imx1_pinctrl_dt_is_flat_functions() iterated child and grandchild
device nodes with for_each_child_of_node() but returned early from
inside both loops without dropping the reference the iterator held on
the current node.

Rework both loops around for_each_child_of_node_scoped() instead of
adding manual of_node_put() calls, matching the sibling helper in
pinctrl-imx.c and imx1_pinctrl_parse_dt() in this same file, which
already use the scoped variant.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
v2: Use for_each_child_of_node_scoped() instead of manual of_node_put()
    calls, per Frank Li's review.

 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..fa8f6a7e03 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;

-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
--
2.46.2.windows.1

