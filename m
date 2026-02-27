Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0811CFD530D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=; b=jTjyh+G8Rz29djcPxxxR1MaUh7
	FGUUc600XOlrpTRFjLv6PFELwMcazQw1Nd4F+8bUancvfTRd6ZmQfj1ic44ovSU8xYfhIZxHtbtU5
	3OTmWQNt0j0cJxKF5yungrMMJQjfBye/g/3cTNEx00kkTOhtvSi22xcUTPELZYrmaa08GoKjNFcLH
	7kU9sJ0hMN/KNuXF1/8jXmzHvK7sJuiZX2Pcy5J+/VA5HaVqS9h73YyztAb5Ra2U5+F5sr0CFrQ1e
	yCfKFGgNAmZSBNMOo9Y1jv1Y4ofU+4//rEndQRIYh4MZwfZ4kPZc41tFXLg5t2wQj0zrLClJxmTx0
	IImQewag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjX-00000007vVv-3W4k;
	Fri, 27 Feb 2026 07:57:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjR-00000007vR7-2LvG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:57:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ad9f2ee29aso10845065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 23:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179073; x=1772783873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=b13RbrBGGpZqlnPsRN0KgRzLjYVZRwlLKh/cKgUpDvguQM/UCjV2SnkTD86lTMqI4v
         5kf5rO+NUCZDtEDXb9UfxfdcguBCx6wye8fEUpVqJHUdTAp6H/WDGRE2mXJxGElYRaBU
         FYfDNk133LqF901YJjalXnVULCU+z9H/rXzwJeFBIasRSK3+XmCnZjkLoBPHaXi2HFL7
         i2WpN579+eNficCkmjma65f6E5FNeoIyvEH/8EpWeTlsK8UIMZG5VkXgqf/AMNoYcp8g
         fsz+E+vkhqEUjSuwWzgnDju0khLdpgHiZDTG6wFpc0uHMYa2e465d004ovWfBlCQ5s7I
         jDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179073; x=1772783873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
        b=ivcRmVKQAGnTjay6DkXdwZ5vm0cRgdJeBQRwuC4epSXNQ/v3F75Dr7ssb+xlifxbxm
         kkx3TGsnHb9BxBFSbLodN4wJjkHqSCHz51lVKTlJ589rLRLEJ9ly8h4GRdP6/HMndfGf
         dQGWb3BM/nZ1y8QPpDIRQx2dDvi2eJBKXPk3jJAcXZo0wD/zGWZj2cl8vESXiWWURLUn
         WnZPmWzNbz0Y+J/hMlTosXKlIdSA09ibpFP5LV01n4Iob75mToRbxsJDs48y7dGi5lxV
         j5IHFSO9uBxoGMSJHd+DUKHpzp9FqHb+zmRzDOaivUC+mreene8MO+93sCKGSxqQ+OdK
         P7tg==
X-Forwarded-Encrypted: i=1; AJvYcCVU+9/4fBIL93n6/249uolMvFe10QWhf+fGT+h0cPTVqpDd+aHCZZK4qL0XHMoI383HRO6L02zipQ3IewzRqQ6W@lists.infradead.org
X-Gm-Message-State: AOJu0YwaWal8taieKnLXGx7K2OKqbnGvRA7i8JGDUu+Y4KVLjit4fouc
	yjhAI2ISaj41I/Tu54nxzLS2TKzv67qqJiSGwbiQQMhWad2+v+3/Wtcd
X-Gm-Gg: ATEYQzygEnjLGIfkQ+Nnh98119MC+LXXHG7KW9NSKnvT4QdFMH/rkWfkuT+y1Q4BO+i
	9C7NpHaEI1YZm1vHUQNWVhK5JKqstbX6P+FFXcOnj1PD0bn3irIAh6gfZfAdyNTXtnKLEBNLyCp
	ey6jVaLtVh3ujwogRxNxpTiFmGGRhr8E0hTUaWS+BHTcAwYqvn0fM3tkv8OeT7lhuoo4r3x2eHc
	IBHHxu8LEenV8DbsmJ7RTtpefveuBO6rIgtQBJ/vtW56gvoUno3Sn8MkaFlzpujrEnD3zducXMo
	rHs2d2XerU/+5ZHnWT/dGv2tPWAO4Zv1tO3RT2qeLyxuXtFPrEATOn944yxjXp7CHmVirJU5cnz
	sn2R1hFd69KsYfape09d49uQDSJzXnTS9pICYaOm3AJ0Gng9nr+zzT7+g2xrb5takYBKXgEBsLU
	yTSzJwItUA6t9p1nlH+zgw5g==
X-Received: by 2002:a17:903:1b6b:b0:2aa:e817:1bd4 with SMTP id d9443c01a7336-2ae2e4b12cfmr20205135ad.37.1772179072569;
        Thu, 26 Feb 2026 23:57:52 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm47358095ad.46.2026.02.26.23.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:52 -0800 (PST)
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
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH net-next v5 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Fri, 27 Feb 2026 15:57:16 +0800
Message-ID: <20260227075718.2243818-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_235753_610902_20CCA475 
X-CRM114-Status: GOOD (  10.76  )
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


