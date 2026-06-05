Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070E2CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szIQNyD+NnmIvV9OHmmg2MxKrIQLLZ2S3wbfJkga4t0=; b=QKm7u3wNHaF5WVBfZaTQ9pi7Dy
	hg0i8Pb6sevVhNnrEwQqkwRDxxXW7jtdXmd6nz0F72/c7FlGDDlZ8ssaYE1Tgzw+urfg8/c5Gqrpz
	Tx8vNfaQIzoXCecieuMtdvuy/0FKziVO1tssJFmG/T+05qXgAWwMOuld4gYaAlyqCrTBvR4BeMXnc
	7jBjxHW9B0GHzkaYM4HE5CGmWgP0DNWPSO8nUkN7h0+Xofk+2wk8PEpuUZ1vw1DC4hYC7wfB9DhoI
	0AKE0ePIFLMXSinI2/gGcl3MATV7PZkDiBxxzDO7Icf+S5DMoMsxeFL9+/3nHWGjC2zPVlhAAh4sx
	xttzWu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvK-0000000HTYq-2PcK;
	Fri, 05 Jun 2026 01:00:34 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIvI-0000000HTXk-2deu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:33 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-48670d35a87so1012241b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 18:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621231; x=1781226031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szIQNyD+NnmIvV9OHmmg2MxKrIQLLZ2S3wbfJkga4t0=;
        b=fcO9xPUik+8lE4wmieAZW+JM2Su0OPZlH7i8Y/o9yFvHj1wYLhgyYqrC/ZANINcvZM
         4dL1IMMOmBkO8kuyKfMjsLWjvi4GlVGR59A/JeKzJCzlPlb1un2AsVslRkhjna6HVZoW
         yTGRBMl4aLR3yGbY9Rg9zOJUXG66gDNpVp0Es2Zfb4rvd7z0G3XNlugF0320weQug1JM
         s0/TD3+huz6uISLvPF92WURTjRF/g/8L3UNxXKdZ89HPnb2qm6OZuViBqj5ojcCTEwv3
         94gWfdweEpClT4WbohogBSQ4Xxc9mNlYNMLoCAOTFX+dZPDzwUA9D1EE7fIKrbljKFew
         TSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621231; x=1781226031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szIQNyD+NnmIvV9OHmmg2MxKrIQLLZ2S3wbfJkga4t0=;
        b=S9jqn3ZSJMgLJ3AB9hRpNjo3fPbFENY7PoBiLg+zXVD0x9H0q3SMSYtnXlM1BVHiky
         AZ+dDGyuel9MWXV7Z6j79nfxhtBFUs/SdqCEyOJQcPjhHL1nklefo8ol2tT1cZvvXKvg
         HljzzKj4L9pllSv8etpxdEsA5BnxSmaBkCj93i6N0blq8JJZxb5+nWPcizW4Iugn3i4d
         07zbXBYoWXnylQeubhmOx+VJXHFkQgBrtFEv0s+ARbjq11BEg0ztqONFyCH0U0SzfWWO
         x85zX23uu2I+SpqyyTDtaONSxKmPVTYbgyBMWsHyYpqvLKlKO5W3aEo7MZziXyYo53zu
         RY6A==
X-Forwarded-Encrypted: i=1; AFNElJ8OKob0tqDierEWWoB48UWjcd4m98vMR/jeGnxNUe1NbJvc2nSTeAfuJG7cM4oRAREM7IdF7Ci9lIkDZwtHijZh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/DD+p/1pM0BSFvhC8fDSBmZQeTQbfYZbh1fpZ8w7x6xOTPh5u
	a/NUMvEcjNa2mms5zvPJtKBsI4aW8DFGdyaG1xmeUqFm1iC4ITFvvR+442Q0lcpA0hQ=
X-Gm-Gg: Acq92OG7AH758jXQF78R325q5SLMeAfT/h0MJPKcvl+FihJE+CQKAHS+fdGi07+/5Kj
	EERhio6UZbuK5RcS9PEd/f02WBAo/LBWPIRSUrJG53b+7xlPAsEV0/K2do66y+OO7T/CHoeDB49
	DnsFZHSVlh1qklcBF1o3yscOrieuIQTMsWXhV08BAygl5kGmpNv797Y/ISYa4HVbHUFBiV0lnML
	7IuyI5efyYqElwW6YiLoyD9acZMydX2nLDWWDWduQjECmLFKcTvISZuCc+ZVumV7fzLN4pvvTtl
	3F7ifanGtT2UWhwfTKjIjd99W9iTi/S3Xj0YLuNPwcYuXGF1So05KpnyS6QuES2CWtfUlohfG7k
	nMO0SITkVReFp2QfaMCVOPDJh9MB2prTSvE+Zq0q0kBsXj9HqbxPcQVgWTqdRw1anuQtuhb0uB3
	1FfJ8SxIbt72Fy0PNXbF+2GFlcN9zvZ8toyM3G+A==
X-Received: by 2002:a05:6808:30a6:b0:47b:d07b:ec9a with SMTP id 5614622812f47-48692d347d3mr155790b6e.15.1780621231634;
        Thu, 04 Jun 2026 18:00:31 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 01/14] dt-bindings: net: qca,qca808x: Add regulator properties
Date: Thu,  4 Jun 2026 20:00:08 -0500
Message-ID: <20260605010022.968612-2-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_180032_674968_283B35C1 
X-CRM114-Status: GOOD (  10.06  )
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

From: Daniel Thompson <daniel@riscstar.com>

QCA808x has four different power rails (although in many board designs
the different rails share a regulator). Add each of these supplies
to the corresponding DT binding.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/net/qca,qca808x.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qca,qca808x.yaml b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
index e2552655902a3..3c1b7eca33caf 100644
--- a/Documentation/devicetree/bindings/net/qca,qca808x.yaml
+++ b/Documentation/devicetree/bindings/net/qca,qca808x.yaml
@@ -25,6 +25,18 @@ properties:
     enum:
       - ethernet-phy-id004d.d101
 
+  avdd18-supply:
+    description: 1.8v analog power supply.
+
+  vdd-supply:
+    description: 1.05v power supply.
+
+  vdd18-supply:
+    description: 1.8v power supply.
+
+  vdd125-supply:
+    description: (1.25v to 1.98v) LDO regulator power supply.
+
 unevaluatedProperties: false
 
 examples:
@@ -39,6 +51,8 @@ examples:
             compatible = "ethernet-phy-id004d.d101";
             reg = <0>;
 
+            vdd-supply = <&phy_vreg_1v8>;
+
             leds {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.51.0


