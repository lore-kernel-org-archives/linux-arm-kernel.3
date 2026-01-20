Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE67D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 04:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=; b=OXu+1c/syxlQsDEP2Gx/SWJNmn
	RK0p6Hn2/qo0AYU8U2CZGWztU2De6UTUskhfhb9qHK2ztNFEA8sRpvxUWQTGzDJbDmTJr/4o6vqHv
	0Rvp5MJIHbJLDOj84bX1vy3UgK2iR3ff2OGJqznsySc3OrpOPapAU9nzUjQljqDfkR/wmahrimw3O
	9tZruayIMnlwDL8PN5B51Blq61WPxOwH9WGVSYyI9dVTbhppnlTM28F0JGIMwT8Jd8uX1P2VMaJof
	1FW7BS4WwAlHaldLc9UWsPAed2Mslpu9XnvS62mSawWzQPKCzZOvdtnbrOE5wQ+lVNfaCHmC4rpjP
	bPVUQKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Ts-00000003C2p-3ihW;
	Tue, 20 Jan 2026 04:36:40 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Ti-00000003C0Y-3s9w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 04:36:38 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso948876eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 20:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883790; x=1769488590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=b51fCfsYvhKsVdsgFVAz1c1Flqhyn5aLHxjyJez67IlGVb2AFxr/d20d+8B5La9Bo/
         RTnM57gVz2ReIF3jzOJhSvR9fJf3Ug8kqKRPfvPwO8JH/k2v9tkn/tJdD723katHX3g4
         2lGZP4kXPhvbRCXp0bjcMxuxQ5WCAPkO0mYPmGtLeayRwXfcbCwV/xrgc0LC0QNOb5+r
         RuXdtH2IibspFNthQF2XRtbk2MkfBATdzXSSnWaXopJBQucYaUGiTWb8JrWeSwn04pkU
         3qvRTMpLpuXcctz0ggkkNdGMVDaEam4vweMxygtTYeO7LW/NXv0yHaKsLhHdAZc6b3st
         q/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883790; x=1769488590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=aTd659NcRlgrUKsg+wEIJ4ubhFSC6IkwFBVDNUlX+0ngu39zTSLGhyxqaMDVetVbrG
         kXU44L+AdfILPqN6E1aRvy0qQDWgMOCbaJRH/YDvzdTlEvv1J3iCqqpFrxL+PLr5sa4d
         rq+O03vKlqwspNb2C6kT8Nkoqm3NrGwqzsvQAIBFeNhHKFMAWa4WBGYF3QPE0sVfEWJ0
         SbaBpPuMhtpy41EydA+q2qawsDHmG/WzLlWS7Fvibinkofl5XKNgTFhNEWsLBU8/aE/3
         GNxcpLWisjUv9/ihtKgq8iV9376XBS+CSnYczb0VWzozKC3mQmzCZp2ps1l3YPNC9ngl
         SBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMTwqhV9u3pKdA4FnvgZUDUu7POJlztQzaD63PkE3WfwRDRjnKMQMAGtyuKkbWPwGwhA2S6riljCjgrP0PzC7+@lists.infradead.org
X-Gm-Message-State: AOJu0YwGhOZlPvaU5c1LyyB4k861A2SZF1KSYG5ZEco7P/j0mpkYvfj7
	FSQuq5mGRLcbkuzG0mgzCmfheEfjKcPqMQ9QNsZ5aB7IdZHxT/BtSo5y
X-Gm-Gg: AZuq6aJ09iKMZUoJ9V7bSmDSrSxCtqdceJY8XD/h1s6f0XgKRszA7w8tFillXFCW73i
	iwn8FB0Bx3oPEipovUb/u+RWdGAfGLufm8WFnZbhDxcEoK0q2K8zxC2Mf9MJAHEb9bchUdodwS/
	wwXfCYFr64dL9rL14i9XGIHLNJTnXJJUk3qsd1CCuQ5XU2YDisvF7doMl/3zL7hE2thB3wx0fmf
	EedW5upCd92cB1wIfQjIJ+6Q1Ymv9wJQrGfaEM993RAqmoOmF8EMj2J5eSEA79EruQUi3AMkAqc
	l49Cd4tkKUmrrjppbBc1qZKrR4LCY4YCUGbev6Ui/NN0lon3NeTwOk2R1aZPBHc/wpmbDXmuIRX
	/wFVaixzb9Xs/DiVOpse+uwZfoGATLBtuIdHG1VYbSifWadRp/qNAFMzjVwJhqpYmXgcWbPoi7B
	By/scmc20iGoIbRE4x8ROf
X-Received: by 2002:a05:7301:9f09:b0:2ae:5e93:b6d with SMTP id 5a478bee46e88-2b6fd7e55f9mr304430eec.38.1768883790053;
        Mon, 19 Jan 2026 20:36:30 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fc2820a2sm1030314eec.35.2026.01.19.20.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:29 -0800 (PST)
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
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Tue, 20 Jan 2026 12:36:07 +0800
Message-ID: <20260120043609.910302-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_203630_964514_036810C6 
X-CRM114-Status: GOOD (  11.11  )
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


