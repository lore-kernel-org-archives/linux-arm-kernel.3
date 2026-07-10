Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6668AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=; b=U6K/3Qn5Esao2MW/zop1PfXbAC
	r1+DmHlS9hAuPpOB3D3H7QS1kKKlXa6rQSD1R0rBlI9X00jQI45niQYphembg+Kqw48JBoH2Il3pO
	gOUX1sJgwM+9QgbE7x0bhHVTuz9GQ/1CvHu4ruhuI0V6GNLaTm5+khIkucA/ZLyYKa9kT9tif9JE5
	D3+UbGOXwuH/xKq+CcwMJpIGIORabrg2N+NbtwbiQwO5R9vUOn0NwOq+AGWhAAnaoZu4B1ZTxlPCp
	zLUvK7y9QwCPR5cK/daC2TRBuZtl9qPljyNjoOatakpBe4Kv6Qu0SxNULlocZUkAvXr0+q9kLPebs
	NX27CFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sf-00000004kqw-3hLp;
	Fri, 10 Jul 2026 10:54:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sd-00000004kov-1xOp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:54:52 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso530738a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680891; x=1784285691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=;
        b=Am8KP+p9VL/4xR6/z/y+c/BFdweV6B7jvdfK1MZ+dHkgmDMD37CFXakMBqJ/x98qd3
         lK0StZo3VzNu9B5rAewyt1CwlydlahbGpsT9w+hWxOcL/MJxsCHjCT/geGN6OravyyiG
         sbeX8kxiHNa9W1dcUyEMr5OzlGQkK4eIhidYb88MeF4uuRsLTsX1eEmBJrxiGqaZlAX8
         2NY1Iw7RjxyE+OnWEWyfRbDH70DuiwPxmYbkPF8uUpuFAp6Yy5EDiXPTWr7QsPLe9MKz
         YmKP0qM0RHbuPpfObS/F8LtVVNKiwiz+wErw3go3jwJJcyQqMyMafuKzS0HE95zCQYkj
         ZMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680891; x=1784285691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=;
        b=QoO1L4G9yqQ87iERAbFz0hES4GsQirgmCJDBL6pEheUcso3wltIeKbYSOjWk9LiayO
         hbgesKdq8W6JA3uYMZ6aGrZHrGJnNA19eZjOxJLEwhvp5iIonM4KNV12HlJgqGPs8VU1
         VFteU3l2KgTJUc1XrdZKzoAWV9LA3Xq/iW9ltLbNrGo4sz6o5SlFarw1k6bL1jUnN0c+
         puDTEMc5mzp0oRBqDU7V7ctbWMHha413iV+fJ2kFBoC8wuZ6ifib//U6kWDor0EFY8WT
         lOqEA8xPadRH5LiDulP6gKc3gCD6peUl3EnET49a3yHrjZH6fW6fkoBSuG/5Aqim9RsX
         PCmg==
X-Forwarded-Encrypted: i=1; AHgh+RoBcdq7CnGU4vADaFUsEnLfITndYfURmKTEnc6FmfnCmBTQmi7TP2kqaYH3DkMajWDB9kgyG7eVBMJxBCbjIjtV@lists.infradead.org
X-Gm-Message-State: AOJu0YxtOQ/3bWcM9qX013M2zFl1rxOTeiexHCDDHciaku27RTHxCMPw
	NbYO4EI/wmADi4HhjDH6+zlq78p65Zm8hw1iYJS932lWoRyHhX1RKla0
X-Gm-Gg: AfdE7ckqCA0/jRTEj6u15wpjk0ahjCdKlrH+t7c6h20mb4qw3auY9MI2rcKhuMAc8tE
	k34fg3n/LkzgQUwBVqaoVVbvVv2lcUsPU6FL+RUDlD5EFISSrYbyQAlS8uvtePpMESGTyegwvWV
	uhp1x0QoedzFiDcg8ycfogYU/WlKviEf2vlPBDX45bNIQ0ds/xjJOddeUdTVDKlNRKjUdQNfqRX
	lb0v1GZQQpKOzd+VwNIF7B8TbMzi2aoO4smtx/efaYGmETTspuPFjtz+ATg2YHULLQRr/NNRzt5
	avCnM6HifcLFllYVK6FjQJftCG6sO7bTpit3tHYRtVgNoWRTndTYcbMGe0puk+X5zfkhlZzOeA3
	H7CpwDWV3L+Iib0guLYknAbnen7jh9EcMFUzSlhut2IvdYJdtdMNhXObeJfQHxQNBE2q8S1RBXE
	+c3ITtlqhtCuAKPLWiTDQ2
X-Received: by 2002:a05:6a20:4304:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c0bd206c10mr13691119637.43.1783680890615;
        Fri, 10 Jul 2026 03:54:50 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm40752937c88.9.2026.07.10.03.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:54:50 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
Date: Fri, 10 Jul 2026 14:54:23 +0400
Message-Id: <68e85666b6dfedab719aaa388450eb86312eccd0.1783680864.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783680864.git.naseefkm@gmail.com>
References: <cover.1783680864.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_035451_511893_82FBD37E 
X-CRM114-Status: GOOD (  11.98  )
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

The EcoNet EN7528 MIPS SoC integrates an MT7530 Gigabit switch,
memory-mapped in the SoC register space like the built-in switches of
the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its four user ports
are connected to integrated Gigabit PHYs and its CPU port is connected
internally to the SoC Ethernet MAC.

Add the econet,en7528-switch compatible, with the same constraints as
the other built-in switches.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 815a90808901..90b3582b7619 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -100,6 +100,10 @@ properties:
           Built-in switch of the Airoha AN7583 SoC
         const: airoha,an7583-switch
 
+      - description:
+          Built-in switch of the EcoNet EN7528 SoC
+        const: econet,en7528-switch
+
   reg:
     maxItems: 1
 
@@ -318,6 +322,7 @@ allOf:
             - mediatek,mt7988-switch
             - airoha,en7581-switch
             - airoha,an7583-switch
+            - econet,en7528-switch
     then:
       $ref: "#/$defs/builtin-dsa-port"
       properties:
-- 
2.34.1


