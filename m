Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B831D7496D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 05:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=; b=2xmlnzS/Ov8gepJOcHEZTsirzH
	3WYYzHsrRp4of8eFT8XZVW1npubg6pC+HrqvLAM9FSKeJTtPbVb2KRYGzHWnI2O1cVmyaKXJDB0rZ
	4oFvxAHXDciA1bX4SxP7vtGH0xst1y+QU1ua5OSoHiASw8xepk7jEEuPcfIeExAm4oGBjxoHZ/J4M
	7PCgs/dJAlGc2EwAcHtwAYNIpDNhVbNhIMgbXKIw9qcHrtp4zjY6tjfSuZAxUZvvdLAn1OMDyNMXi
	b+TATPzURRdkAwgO8i4PXeuTQHFR6p4OAxlcLISXKdHRP19Ah5rc4mCINTjel8yn1TRrdoJHGrnjg
	LD/36sww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t61ZF-0000000GohY-3gVz;
	Wed, 30 Oct 2024 05:48:30 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t61OP-0000000GmnS-1m0K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 05:37:19 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7180cc146d8so3414639a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730266637; x=1730871437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=DSwNYLhxdOogLtOhMBXbqCL011/NrO/qMRQDvFHMgQWcOND8eR1gOhUUK8NR0QWFui
         02I32xiPGVqEst9ISRcAEQXbgMUl44y/HklKbGotlxK47syj5PJHQA5huugPYdI9TPxm
         dQgs6/MjRA69ZCcrG6bbLyrE9U2pfouZOQX4mUPx101tUz4pPCOeyd6TCdQEJGqrWxjW
         4XPcEqQZXQU3D054wJHy+SFCQ/YM1H1JdFmLt0QI8PEbO3F7k5SjebyiQXfw1NtIs4Hj
         iFJbf1Hh3DuEGX3OExsIG7CXU2aYz8ulHeNuU6sjsyossCc9ptLiZj/XEHgDrMHo48Ti
         LgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730266637; x=1730871437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=CqgurOO7c3DqDDSr1+e843LvNxsahE9DuUSFd/e+BJU42ewlLp/pv5XFZNIWC72t27
         dcNdSzMwezXN0xhS018AyX/0Bt0H+UTXMcsYMhMzQQfR4hlZh0Nr2bwoKYh80m4AIaVj
         bbhoXQFCdlW5pAGiwr7sKXOizxvYTtFNDEUcdM1pgzsRqR7JuC91yrhNi2Xhvg2evLbM
         Zojx4r9gu60D+7jbpkxdb1KdN8OJquPNAQn760xNLtf0gdCI/i3IYAC7pZODJqEy43Jr
         Kh4F93E1EujW790ZngPhhg3tcYP3EigVL72KxiCrcDKZaM/djc6rk2M2CdKHDaExWij7
         VbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxKWYBGlc6B93/bd7x4LQqWpkd8tO3VVAOFWcuUZqJzz4ttwG43ywhLB4KXcuBvKZ8BxnLy0i4bGnyTFiQFg+V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh2E269uFC3QD60SVoiOGbOAKKuZQWTV4NqyM0SWHns+raUcU7
	aFe9fy9MjPflDmcLIM9vVzsG+NFI+5Hak2WDP7fWyfs8hL1HIOkA
X-Google-Smtp-Source: AGHT+IGMcZP86Gb9PnWt4RuHGD9rvSbLa8zwQO6JV3gjbDXZLVASBGbVFvRNeULnympjKkTbrbfaPg==
X-Received: by 2002:a05:6830:43a7:b0:710:f74c:1b2d with SMTP id 46e09a7af769-71891ffc758mr2049461a34.2.1730266636633;
        Tue, 29 Oct 2024 22:37:16 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 22:37:16 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v6 6/6] net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio
Date: Wed, 30 Oct 2024 13:36:15 +0800
Message-Id: <661aeb8658f53e71814d204da393968b998a9939.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730263957.git.0x1207@gmail.com>
References: <cover.1730263957.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_223717_516812_AA0B2F62 
X-CRM114-Status: GOOD (  13.06  )
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

The FPE on XGMAC is ready, it is time to update dwxgmac_tc_ops to
let user configure FPE via tc-mqprio/tc-taprio.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 75ad2da1a37f..6a79e6a111ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1290,8 +1290,8 @@ const struct stmmac_tc_ops dwxgmac_tc_ops = {
 	.setup_cls_u32 = tc_setup_cls_u32,
 	.setup_cbs = tc_setup_cbs,
 	.setup_cls = tc_setup_cls,
-	.setup_taprio = tc_setup_taprio_without_fpe,
+	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
 	.query_caps = tc_query_caps,
-	.setup_mqprio = tc_setup_mqprio_unimplemented,
+	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };
-- 
2.34.1


