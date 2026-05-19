Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DBCCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pl3lC2lLvKX6xR22U61HDIBcCG9FBCIFd8HUnvukfE=; b=AaaG0/J2DT4xStJHF501axVjjI
	ZZVrXa53hL0FL9RdgmP5IZQhfGwlrzoy1dYHW2/ZUAJchvOZ6rLU9vMRp0AKXBqTStDwkjN4159go
	wrFMwtzL6a4BP32yoHi+8sqCwGezjBymsDjeoQKWOA2RYq77Ndx3u8Iv7S64C1YQaUZrZBqa/3SSI
	Dl6VJQwIRq1uP9aI56EeQwepCbWZES/h1TgFAoXGNIsSDny7Z8Q3fsS1gNsrL01Ey0aCQL7A3xU9N
	ybr0XWEdooQdF2EH2kTjsJDJy/UryqMG+RhO1PeooCh667Clcp+KWTpTOheDRbmjZZFyBxICSojex
	Sez5zjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSc5-00000002uEn-41MW;
	Tue, 19 May 2026 22:08:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSbz-00000002uA4-2lMD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 22:08:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso22757255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 15:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779228506; x=1779833306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Pl3lC2lLvKX6xR22U61HDIBcCG9FBCIFd8HUnvukfE=;
        b=SLc8to0QDfFJgORHT9m3LiQZetBqm9Alz3gd5JEzx2UePFGtVOb1Dag4EXsA9WEwJT
         BR9EtQ0jnYUJaYlJYuMWEAWcR6w3M07fJ/ZB5lZ7b/1lZ5cmNelGF7DBrtthKlA5003s
         mIdhs57dPvHVJtAw5EozGNYQPO1IrX71GOR2L+/SzUCwUqcmizSrL+FmT8LEeHpYMA1q
         Xyt1K3RjdOLc3MdZyjyu75VqrDpNNRNnwi8JJibpfdYsx7IpR5lmdH1qig0Y917lM25P
         +7Hu04JAroL7QQwWWMRaeyD38vo9sPr/ct2wnxIX3TWyVmvI1pbf3JrFlm7C26VX4idV
         hENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228506; x=1779833306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Pl3lC2lLvKX6xR22U61HDIBcCG9FBCIFd8HUnvukfE=;
        b=e8U+HfuzERboI/sS69qxteb0JUowfl6AWThNjOBxiTztURzxpe9vbTUuCvg6rO/BTB
         7oul08EXU/wZJTBd3GLysv0KOVjJ+G7wD3mxwalXd2Z88FNpce4bvbPI8kJZrufKEFFe
         OVa4MocBbT9Qqa8gKztftNLsiqfiil1XkWnKr1eBWvqI1eAq4T6zXBsXOI+NiTBO6wfS
         uh3Cj7dY4h4g1t9yKcxsetpMjkJJFJ/wuxJj9VyK5tAT3E3L5ZyR+QuQxbM2676GruRu
         IsQISGF1Gu+dkIwEGXqxy+aYo7pV8qooSA+XESob/ZQ41MVmSKlvunC6GvdlyTaccPwI
         gNSw==
X-Forwarded-Encrypted: i=1; AFNElJ/4q4FEA8bkyiC0lHFpkkMfBrLiaJQfQbqgmbZVplJhlTThOLQrD/KD+sOhIbm4lprkG8ToFIllG6GW/UJ+AhP+@lists.infradead.org
X-Gm-Message-State: AOJu0YxZznBdnUKd4AtXBPYPlrCNYGEESOWoVanF+Jwi8jErhgkcc0zt
	xJK1D44FXDq0MHpb6BMGg9Z7yasMpg4ywUBEqP+fRkTVUmLQDE10e2Tc
X-Gm-Gg: Acq92OHtHeojmDcIA6OdqNRiHrX7ONaezhgipM9ROMamQI7PoE6XGpFJuCUc/Gxms1l
	wNtasdsyLGC46CSsiIBz4N8AZnohcS3738dS/Gd+oTKml8RGBcxDweNyFaZWGq2gJi/U4ytS6sm
	N8PGwbIgyM1kOGjPAYST/vTgaT5C79tldb0cb0g8MmM20thS6A2ErFkljOAEgzRG5P5oKbmTn5i
	+YfLZA8HBN71I/sVcpvsYW9eeRYUtY6FSKY3oa7q51l+HGSFxP+sN3CLQQ5BjQxPJweHjSqAtla
	sC80LAIeGZkYveTp4eppC4K+i+OHu6fiI0Nf3MCCyK4SBWSwqUnwt/+acgKxx2Q2WHwJqbBUGts
	PpaSY7xMCnXlFExcfVxBAzarWJoSKUxV4orXNXhh+4iiew3MKUhQ5xmXjiuEoE92FEpKwUQ1ybh
	X+3FTG8qAv7giL/MhPNIEz98QaW+LF0r+adq0tVNshPHm/lXYUV+oOUzC/8nYdZCC9k24Dmnu61
	JWs1Ju5sMr5wCTfkc92
X-Received: by 2002:a05:600c:1593:b0:48f:f199:79f7 with SMTP id 5b1f17b1804b1-48ff1997aaemr165115725e9.27.1779228505743;
        Tue, 19 May 2026 15:08:25 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48febe585absm118304005e9.19.2026.05.19.15.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:08:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 1/6] dt-bindings: soc: Add bindings for Airoha SCU Serdes lines
Date: Wed, 20 May 2026 00:08:06 +0200
Message-ID: <20260519220813.28468-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519220813.28468-1-ansuelsmth@gmail.com>
References: <20260519220813.28468-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_150827_704202_55737E28 
X-CRM114-Status: GOOD (  14.26  )
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

The Airoha AN7581 SoC can configure the SCU serdes lines for multiple
purpose. For example the Serdes for the USB1 port can be both
used for USB 3.0 operation or for Ethernet. Or the USB2 serdes can both
used for USB 3.0 operation or for PCIe.

The PCIe Serdes can be both used for PCIe operation or Ethernet.

Add bindings to permit correct reference of the different ports in DT,
mostly to differentiate the different supported modes internally to the
drivers.

Values are just symbolic and enumerates the Serdes port with a specific
number for precise reference.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/soc/airoha,scu-ssr.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..33c64844ada3
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_PCIE1		0
+#define AIROHA_SCU_SERDES_PCIE2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.53.0


