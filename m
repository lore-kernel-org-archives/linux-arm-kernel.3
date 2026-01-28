Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BB5D35687
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=; b=5Bv2ukz1/1V+F1yBO+Wx1fhQJZ
	Px3BnYPlkNwBrmwyCDWhnF1b5r+EThxBZg3wOrLtktXkRxeWEuueSQ82rCKGQlKn9jVLkpEdP/WM0
	Rpjb+Aqvadk7u4+y/nZh6FYoi+QWmDrhjNVH4yPJpgimSwSWW71D2QUK7UaWLios8q2m55/6J/Er+
	GEYoA71uXhCF8HSosXEBm91AZf2WT7ZMnPynDNLMF2dbJI1Cg+YZ0dxNKNZHQpjzib+TFG3lsLmD8
	AbFE5m9Djon5AEs9JCdjdFW2tGy655Nepn+G41gvhXfNlrobI7amaPaaRhc8WqerS8Hm/8RVT0tZ/
	ELn/3Y5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl004-0000000Fa8v-11xA;
	Wed, 28 Jan 2026 07:30:04 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl001-0000000Fa7u-2KBu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 07:30:03 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2b1981ca515so7920807eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 23:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769585400; x=1770190200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=JAEkgcWdbkoGJGL3E7igzZ0i8BRMHvMTjIoegVL0+VGVq3S+zDzeSLZ9kci1cDOFPU
         Z1PDvl4o1LTBzDMDQiXnpc74sDU2lTTG9hvNTGK6/GqE9NOpnSaY/fSByUi5Y8H5+YHF
         qjffIOECEL8JBD51kqSzsdB5Wjgdq4viNKDVbh+5Si7VRUl6hFzva48Z9whaLcvPASsv
         Ije+OwdSFhgzCJJ2AKC2JmjWVcl9N6z2f/+ikjvxul+fixsm/YfF1SsdubcMYBtmFVTF
         4rn7j+YnLFT3w+ITZRWBLMBL8lhc0q0H0au9NetE5X4l0uBkPxQT3Thp0DQcwksziCzK
         BdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769585400; x=1770190200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=vyoDOCZBWkO5X4/cUEauo8MUfEA3PWtDExaTiF3nkAs9+WZpV1Q1/hE6d1JpwC5J46
         CA6hotlw9qJLrs8Q6D4wDzJ8SGwyAnjevmNF/vKQHHSaDndJgf013kPZJBOjksdgqTM1
         pvy9abkxSUsfaxgAb4sytAz4fAtV15gLpzqf5+64cYvfSio/dg8fnLAvrR2QlFVLqeIt
         tP+nRH0bLXtRL8QtqRAz2Jwf98ay8gHOG1AoR0sYHc/0pDGsiRpdmMjEU8Xpox34qm5Q
         bO20bfNIeiJ+UpuS+2t2wGxLXmbf5YOvLqOYySe2lmJQ9SJPDWuhu1aWWEECtyQy63Kf
         WMXA==
X-Forwarded-Encrypted: i=1; AJvYcCWgQCx9JwoR3gTqVYpFGfWPkVCqUzd1wMbSoGvUFuyNyPaZaaZP88f/vwnp0tbPvxQ5SGUNqxvpWEQGQXyL0V/I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Vt0EIHEY8YyDJcul8KRXaJ4C035jDXQI5IIfmZ1TGmtRY1bf
	FG9//P1J/+sykNDJWeNbX2aodXSdTXEuHb7Jxg2iHCzvSld8JbuXUCAr
X-Gm-Gg: AZuq6aIXq3M6fv2jSloqK5DWWmlZOmNKkyE/F8wzW7dyrJmnmwZBjLe/B4f5l6ZZlek
	+IOWMY9D4phOYhzjoGyNmclHlFmJZ73usXRoHFrDbCImLTBnxxwg1cMOQ2bQmuHg8O3CDMqTGpd
	cUnqK4N5KjfPCpxpyD07e1e1ebSgBfbOgNz1mBjtGFmaCVpSNpGDxtjqoSNDrtG4jHFe+e0W/mN
	od8JSBLC8qs8nyP+XaQDYZun93EbOQeb8TwvayTu8E/plgr1TDJQJkDVY6qqGDEBKaRCle+swVK
	muIIy/4pTBubUlfO3tT9xRtmzueEWW/46J2849JYdSDlx375vLagDwzBwYNi/EO3cmwJi+FigyJ
	9OUwJ2nfygXkCB7q+E2Gr39DXLC5MfDlDWxbIRHY++o+jbA30ij2Z+hv935/+sU+KtHg3f2T8+5
	s7tsBm+aYr6i08GIcRuOsx
X-Received: by 2002:a05:7300:cc0e:b0:2ae:60f7:7f42 with SMTP id 5a478bee46e88-2b78d8df584mr2785650eec.11.1769585399859;
        Tue, 27 Jan 2026 23:29:59 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add66fsm1479966eec.28.2026.01.27.23.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 23:29:59 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v3 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Wed, 28 Jan 2026 15:29:28 +0800
Message-ID: <20260128072931.875041-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128072931.875041-1-inochiama@gmail.com>
References: <20260128072931.875041-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_233001_588052_52BC77B9 
X-CRM114-Status: GOOD (  10.96  )
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

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..54c7b1537ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.52.0


