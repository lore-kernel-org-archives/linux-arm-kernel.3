Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C6EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o7lbqvBfWFIL0G8uqSnKhjS80pSitov1mvBHEMw18dY=; b=ff88V7wJXKspYqtgrgPr40Os/9
	DZw5w74CEozO9Ys4IQojIH/GSwbrMJKbYx2n8+UFOT3tbBrhb/Ow4Gt1AZY0s0DrVddhJYrXDiSyb
	7CVCcvhwOHMD38KbQmpXhrAZbTgtKwA/AENTJYuXW5hvig59w9zACnNiWK3vITtXAs4GDowTWIChD
	89f63acXzhWb/wn/OQI5SrfyS5RBr2P1Fjt6l3AWO2UCuwoqaWvzBjtkdT0FpCuJ6P+a+oxksckr/
	VLjDx3cbuQ6xA8yNCsbC4v10O3GuPqzDxmOFykz1dAQTJaSaxvp7wRvYbEtpEUmxsL+piXGoywzc4
	WvrbG3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFR8-0000000EI8c-2GYP;
	Fri, 24 Jan 2025 08:53:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFPn-0000000EI3A-34dj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:51:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso962432f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 00:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737708705; x=1738313505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7lbqvBfWFIL0G8uqSnKhjS80pSitov1mvBHEMw18dY=;
        b=U2gLg3o5WWQt8D/VadikTLuEaYHLOPf+d0du41SNxPKnJmKuKrb2YXhUIK9rDDoClI
         vbh0JX579QFIV/o1OPU+4YU0qaUi9b6AyGiaBOMFwiCvpAi7Lax0fL146gvzku6p/eI4
         B9KEqwMOEUlGLRMqM628gqvPGYnjn/xK9ElpS4bVpDXFo+IO7y+CoO/DLk9c+UaFuSMB
         lrjHCNB/Lm+CWQxGgBKLOPefV+gOFnSVaclOw8D7CQLOk6F9x5q97mg0J1Ga72ZJAcHt
         eaiJ/ngoVCi2BYMaTGQEs0by+Lcj+/GVa9EyRB9X2oGdsCSazQGVZMjvyXUy1YS4drx+
         zSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737708705; x=1738313505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7lbqvBfWFIL0G8uqSnKhjS80pSitov1mvBHEMw18dY=;
        b=kLMvyTTQspGHQOjhX9DFu8OnwjUKMAUd33zkUEXMovUmaVW56ZMd6tsz/mSb6EqRQq
         EreDbj/GEv+hRk+A3ulj2/q/zbGHBZvdnVYR42LgaWwTF7T0VQLmLKy/7TYlq20IKhgq
         I8MHqLuskqylel5eqA4ZTVAyfJ9NfELXVFSLiPr8SUOWbYy7EBWBURHLnCGao30Igk5R
         NE+rK01Omf/vvvBA7Gy7MGjdFzYSupxf6jAUI2QxTQAno2275Fa6u0hm6UjK2ntlkqO7
         /1F6D8A2r12UusqXYIlEPbOja4XSmnylt+8M2gsoFfQaO0PbJmDvXSt8w+30uNlyYXcE
         WrUQ==
X-Gm-Message-State: AOJu0Yz9dfiKn9pkhpAsx6bYl2FIFLq+U42vGpF4Btwv36J5oGX0ayft
	w6b3aVrM+BSk6sFPW/sKhYGzMKE3RTqsSsbqkQeVzIyxNCOW6Jar
X-Gm-Gg: ASbGncuFjlQ1ig18Atr4A9l0+efW6SKrMMWZA6ou84/xxe9W710Jfmne4OR28jKAjpu
	g2s8i7X1F3BkDr3x2hHQztx+QZrYEPR89rDeuv+jt7kusy1yuSzWjgsRMsx/rP+yVExcpB5yLTY
	JKsciFkJdA41NzePBtp7bVt403WcL1LivISL9U3u4D5u3fhmOMhN0ZsheKtFmx6Vh5dFbuVBpB6
	sVS5OzsENMRaxNR1T+TchE3GXw0x2cyUY0X22XF1eZDNja4SMUzr5S2pBq1/3kNfdL00wNIs3NR
	xN6ocUg7
X-Google-Smtp-Source: AGHT+IF4dqAR6koojsslJLJ51I90eR24QucpBC3Wc4090WYTgW0SGNn1teDBd4jW7zBLCJGN0QkY1w==
X-Received: by 2002:a5d:5986:0:b0:38a:a083:9200 with SMTP id ffacd0b85a97d-38bf59eb93dmr30924270f8f.44.1737708705110;
        Fri, 24 Jan 2025 00:51:45 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:58db:611:d7b2:c596])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188c33sm2085115f8f.53.2025.01.24.00.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:51:44 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	tglx@linutronix.de,
	shivamurthy.shastri@linutronix.de,
	anna-maria@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] irqchip/irq-mvebu-icu: Fix access to msi_data from irq_domain
Date: Fri, 24 Jan 2025 09:50:39 +0100
Message-ID: <20250124085140.44792-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005147_784981_4A01A175 
X-CRM114-Status: GOOD (  14.53  )
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

Previously, we incorrectly cast irq_domain->host_data directly to
mvebu_icu_msi_data. However, host_data actually stores a structure of
type msi_domain_info.

This incorrect assumption caused issues such as the thermal sensors of
the CP110 platform malfunctioning. Specifically, the translation of the
SEI interrupt to IRQ_TYPE_EDGE_RISING failed, preventing proper
interrupt handling. The following error was observed:
genirq: Setting trigger mode 4 for irq 85 failed (irq_chip_set_type_parent+0x0/0x34)
armada_thermal f2400000.system-controller:thermal-sensor@70: Cannot request threaded IRQ 85

This commit resolves the issue by first casting host_data to
msi_domain_info and then accessing the mvebu_icu_msi_data through
msi_domain_info->chip_data.

Cc: stable@vger.kernel.org
Fixes: d929e4db22b6 ("irqchip/irq-mvebu-icu: Prepare for real per device MSI")
Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
Changes in v2:
* This patch is a v2 because it addresses the same issue as this patch:
  https://lore.kernel.org/all/20241217111623.92625-1-eichest@gmail.com/
* This time it addresses the underlying issue instead of adding a
  workaround (thanks to Thomas)

 drivers/irqchip/irq-mvebu-icu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mvebu-icu.c b/drivers/irqchip/irq-mvebu-icu.c
index b337f6c05f18..4eebed39880a 100644
--- a/drivers/irqchip/irq-mvebu-icu.c
+++ b/drivers/irqchip/irq-mvebu-icu.c
@@ -68,7 +68,8 @@ static int mvebu_icu_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
 			       unsigned long *hwirq, unsigned int *type)
 {
 	unsigned int param_count = static_branch_unlikely(&legacy_bindings) ? 3 : 2;
-	struct mvebu_icu_msi_data *msi_data = d->host_data;
+	struct msi_domain_info *info = d->host_data;
+	struct mvebu_icu_msi_data *msi_data = info->chip_data;
 	struct mvebu_icu *icu = msi_data->icu;
 
 	/* Check the count of the parameters in dt */
-- 
2.45.2


