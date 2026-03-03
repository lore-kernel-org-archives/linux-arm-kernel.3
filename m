Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569D1EB3641
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=; b=jO5kKBoKdEMew0IMlNtL3wWi8z
	j544MdXtXIjWMYtE0K9lyQbDymdMQKjqdBdPWUVYT4IHn/6HWrHnKYe4v70GJtOZXprBIdfOlrEzx
	3jbFXs1/wljLGXjOMapUykwaj3K83DxP0ZOW8C88hA6sRfN3wlqWbBIqGLprb1GJZ9QQZlj3BDMme
	SLSUgvn+MR2EuOYUgK10M8+1gYlrbM0i7N4ZrmFDv5IQeBsL3WJeqm7UAaIhEsyTaQj3Se8M57tXI
	MlyM8YgpiWqPSbhUSMAebWgcXyV0upeEPd+oFNQNpjQP8O4xzFWsPMpq7EwIZ1gclkl1fDpwQV+ni
	41vyUNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEH-0000000EJ7J-3xSc;
	Tue, 03 Mar 2026 01:07:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEF-0000000EJ57-17LA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 01:07:16 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-823c56765fdso2472848b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500034; x=1773104834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=ChEMjfzLNPQNjoZi3Mu89LlpYV146lcwdZ+Nk8FvEzjyTe33fqQFO71bjvQQ0jlkAL
         MPUmxpIYfDl+8y2cuAXIqqe+JYR04ovLF2qAPwkVbo7AxLN79N36uhgIqeDho0okRf41
         2yOa/Hyw0dVvh7HYOlRNPgylutfS4lfwoYOLjUhkIuYG7eYUR+hhDO6zODw/RKgMKXPk
         YVlHJyiNu3h4DaVGR6It5YUv5uT9yFnDOhYiPOF5CJid+FaYkutrY1e8NlKF3IEfwAhe
         rtTCyB0XUueKL5mkO06uQILvb08KjZ00FOjXE9nTEjVOih77yb446dJwA46pKN0GmHWG
         UX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500034; x=1773104834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=vISrjmSSEcEOC+lZYieGcvKQmFwM34O/iGgW7Zvmytk9yODLjLtEtK2D8sxeWe53n4
         sQfOaxLMhhahbvJ+zpsOV7rSk1TeTB0i0B2LPLjxmNs2AzC9GaT1ibNss4jFs8CCHDGb
         sc55vWRDXd8rB6a+hP4NsjIcMLwtlTDWWvb724GJ8OllFHOiucA63SKZWuuxhUVrCROb
         rhj8TwQKw59VDq5vgt6bP/dZvsXG11KF+SqGh33z/r+Po7wYPOjP5CrhgPYetrbWa4fe
         SBGxB+5RxgC2OVnBtw0BiYGkiUxSGmg51VEz+1O9gSH/t50tCCTcS3GTRCIdeZHZ9+uT
         Pnlg==
X-Forwarded-Encrypted: i=1; AJvYcCWlaH2ahCJXrbOaiSVKm5rBwRuCmHpz/8U7tp+glBb/2NwEC+LCDNPYTDvLi2WWrTqwlR/qpOvLLCaXUhJv2Yw6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2eUyE+VdclR29IdMk45uG1GYecA2nOcgI8AsdWT5L6Mwjpxuk
	7b+izZm7tHcjuLHfo86om2UykLq/I01ffF9INW9T3zqn1Ovo3vlpW3R0
X-Gm-Gg: ATEYQzzpdRWLZGVGtUID3vrkj6bf/kngtRNCdGCGhRMSw8xqEH37Y9FKMlk97XgbMII
	9XsG5wJwYkckpy4Irc0cEjj8VpcJA1A/5dsz9A9mWpOJy9ZkyVyfqLvB7BK3GCNyNFO7Yn/OAWo
	Y4AJGXT5k7aQwl1YblbYOTi2hdmznoIFrNfvivjYCh4D+C6vQr7AteUP5H87n0VobDfY01yWDVf
	OTHQ4JTv4fnJUKKTpOiuQtEJcNnb1Utj0mHum6ocl8voaPJVak6UtjJ7x5fhybVUNawdw+57Ctm
	1vul0R6wUn7Ytyhaaa/F3Seb96NrY3CjTzxKAfubuu/osPpHYB05sfzeEEKWnTtY3C+bte6Mt+h
	QrAneXsuIqPNG12PaHwUeR5/+l7eU30k+GyzDRpksd2HK7p1rWhoZgn/qSemG7i8tAKYGnI6ix1
	+uZQGB+3iVOdsPQtl/Vd2CgQ==
X-Received: by 2002:a05:6a21:170b:b0:35f:b243:46cb with SMTP id adf61e73a8af0-395c3a1a5f3mr14011142637.12.1772500034381;
        Mon, 02 Mar 2026 17:07:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ef857sm12435059a12.7.2026.03.02.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Tue,  3 Mar 2026 09:06:28 +0800
Message-ID: <20260303010630.567674-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303010630.567674-1-inochiama@gmail.com>
References: <20260303010630.567674-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170715_302288_25FCFAE2 
X-CRM114-Status: GOOD (  11.17  )
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
index 5c9fd91a1db9..02303a808fb5 100644
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
2.53.0


