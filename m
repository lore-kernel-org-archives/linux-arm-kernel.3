Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BD0C71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8NWQCR/vjjoocQDKQ3G4Y+84Q55VY5nfXeYI6Rtw6A=; b=gkCOnQ9njsvjpCVp712LfXlO4/
	NLn/Td64f+8aQ0p46oE/G+epgY/Cte1yqaR4gRZEzF5hXPzBgjPgSZ+TNQXFINTnlWntDgBCPm1cQ
	3YGu8XP/RP6Yd/T3c/l5Tc7wOzowO+x9W4akVSKn46tE1XdKNeD4nsdzROzSk+eZuroFMeEYbYQTW
	Eu8CwrXbnACubgsARJHM3lC2vt8NYagCS3TmMZtH78WOvtxT9DH5oYsHNe0tsK1Ulfr6JqG4THfQj
	RuTQ/uBE5Z/xTyK8tQnixwv+YolhTtvIjQS+N2wq3GqPhpJEvPD/0vL/gOni1DnCz9QIioeaktdxP
	4x+Wghvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2A1-00000004Uau-0bks;
	Tue, 08 Jul 2025 06:50:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ20w-00000004Sk7-1AfG;
	Tue, 08 Jul 2025 06:41:15 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5490480a12.0;
        Mon, 07 Jul 2025 23:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956873; x=1752561673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8NWQCR/vjjoocQDKQ3G4Y+84Q55VY5nfXeYI6Rtw6A=;
        b=IDXWt0JC7u/KIN7ZK8A2BA33XKigzNadAcMa4WGv/VToPA8DTKfNYKVkBn18eXKDMj
         iOAshy+kkgf+BAcTG4qBTyyGBpAFxuR2YTMSgnqiU9WBLI3KnnyHRU2HFyXVd+d8iiAQ
         P6rzJOn2mCmzh7wrGXBsw1f495H88xOvtC6Nqx2Iv3ulgD8X8jCJUEeLYooaJ7ADWIKH
         ZeA4Z8p/Xxpct5jYw8+4ckrPwci0WXCHVfu6Weu9vhpzrOlYtvxW/Cq5sdRSTzZYd/ks
         pHegjRvEj4Q8oCRSdP/80xuoCOKkJhAXaA1UDA8qsdAha9Xe0CO5Ot73xB0m2rdg9qQ1
         Ww+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956873; x=1752561673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8NWQCR/vjjoocQDKQ3G4Y+84Q55VY5nfXeYI6Rtw6A=;
        b=fDWz6Xxa3zQnyDQ5OqpLeCN9qoI5GB2XDdpDE2a9bMXwOT8wafTQ6y/DhkCbJ3uGdi
         jWh8wq4nxkvu4Ay+O6Q/x6HA1HXw2hl/TgxVZJvAEw1PnZuE+utJ/L5QKBP4UkIpyQYg
         Kxeyx4l5PyHxsvneXf1ICu5Ax77QAak6dK4a2zB7TGGju9snShCQ9phrD5m3EDnptO4A
         noEn6PKPHUJvsneSqAe5hvqtxwVNV3IGboZvLojQHwEUt1hE7LoH68NLzwnYjZ1JVcGn
         ZJS6CFwWdDmmctdiK3Cgz4Cg3CKhUMSJLtryuVzHtTh2UDE0LsJ7f5Bb/ihUe2YSdnBX
         wbvA==
X-Forwarded-Encrypted: i=1; AJvYcCURnGXsjE8ewZW7DjuuxoFkd/L+fKpCQAiD9g6isbljE65DHJZJiiV03jwflPF6TE2/rLCffqNwdmUHHYEyp1+p@lists.infradead.org, AJvYcCVXPJAgeFWNkojzf60t9mtufjB5YJ63rPbnQ+sqx1IJcZYKRUpjGlaE+lAVpj2syG+2i7bciOQTTrxuOd4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvtY2pDGMNiWLmRIWVCzzLSW8n923xQOwY6VcY/Vt19S21aY/e
	udM55WguC5mbRl+2bYlQC+Z9Z9/XWqQuwJrSlXYFuK/nMAwT7e1LbZXP
X-Gm-Gg: ASbGncttgOfoNPuV1S6urkE4Ot4nxv0ccRtrMnwpilP3Xz5K0XXCAyGxAs1RndBYDpp
	MFja6l8GuZAYoXjiw8Kysza9vyOdH6o0O6avoANNpQEKaGLVHRnXBSJLPPAhp+rvk9vJY3e8MHU
	1L4upzzr+dkT9/KBCr56lYuBLCExS7b/d4mXMBHR8PbrESIc7ObXoSw1AcJOAkoqq2BCWk0xBEJ
	mPCnMUgiU8f5QqTq95BTmr2HooTHKjLOhmU/vIYGD74+JjC8xZyWBLiTCEyv0N39FQyxHMB7jdK
	a8Vd3tCDOeTcXsiMHz6uaQoZ4p5CyZbwg4Tea5WX/GW3rT+6QL7tZMEXsy2lGw==
X-Google-Smtp-Source: AGHT+IGi3okrZezMQqZWaDno0rnyTSGvjOHwFQZN6i9UVU/ZSCdmvAAsyqq8FHCig1FFJj0ZJIxfOg==
X-Received: by 2002:a17:90b:1c0a:b0:30e:3718:e9d with SMTP id 98e67ed59e1d1-31aac552db1mr23882560a91.35.1751956873397;
        Mon, 07 Jul 2025 23:41:13 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c22055c99sm1328425a91.9.2025.07.07.23.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:13 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next v2 3/3] net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
Date: Tue,  8 Jul 2025 14:40:51 +0800
Message-ID: <20250708064052.507094-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_234114_324920_766677FC 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Add "snps,dwmac-5.30a" compatible string for 5.00a version that
can avoid to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..399d328b3b11 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -410,6 +410,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.00",
 	"snps,dwmac-4.10a",
 	"snps,dwmac-4.20a",
+	"snps,dwmac-5.00a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
-- 
2.50.0


