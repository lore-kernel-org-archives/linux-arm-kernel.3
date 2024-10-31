Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2830ED74959
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=; b=BE3HaQ43TPrdaaTecT2lMp4e8Z
	4B5pyMijm2hLD9qqKCUHIaEnA3y2tsNcH9MKRrZfjhIIn8KpHQrPwZySXzlXMlz7cVYfpQ0GSrIpV
	mUDXEuvt/mqZm738ajT67Zdh5hspeeXjTHDWXVqFd2JJBZPhADxxUIIrN3YjUfz3E232rX8kgaTJu
	W1r/Jy5UXLn9ijv+8OOZnMEFeqrl4u/AhuNQluYAOjCW0eKTYdX65N0hk8iuDWGQGf2Ye/CHVcv8i
	c9tSQBQ75ut1n0tc823Mw//ZUqqLgrN9b1hD2JFIuM5X0VM07bZWclZwmQPuFNeCMteYxqi6p2m0P
	RU91vZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UvI-00000003dQY-0y9F;
	Thu, 31 Oct 2024 13:09:12 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6USP-00000003YWK-1I9Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:39:22 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e983487a1so671655b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378360; x=1730983160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=Vv9yOc870cXXdVInjCc1s8nDsVKa/8ewPr0l5tGv/5LjpvvFPA+Tw4ZuXGPdr0tbl3
         Hn4tcOMViM1nrX06ttXDhubRDm6cQlq8rLP3HbMsE969h0BZPD+UNEdhQDCk+MjSkO8F
         Ggx7FMlj6MkvpRTJw1MAyt79NWjLkLyV94CGpZ1YyzAGZDuhFIEf0QixelaI24zcqsaR
         IxkQlBHCrU+npode486n6sVyDdHqqr642vlhYz+SIyKWJguoKxXOxqZw7Vfeq6k4XpRQ
         8u1XG5vNUlknr+3Ozb9a4fc/tw76hdZimf04RFg5m4KhlgRMt0E+FKhp2kWIHSPJ1wjS
         64DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378360; x=1730983160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
        b=uUamCnRJUAjSnN35SWOxvymbWMVNWvijNHQDBgdBpYvGYY1pH4P2m8lfbWuy5dtPoI
         yzvvbxvnv9HKLPtLUbF2GGKEgAD2Z5eXdR207koSEdnmNb8oOjuD8V10mUnvMhC2C+Dj
         +RT3hjZr/KPD0Htp8tKB1qOV0UwOtycuBL04lDb71qjVUNMDA4Qw37T7eVC/QUngkU//
         mi+GsFFjn+m09fEVOueqSqT0ejKubRaCpr3FlUf3Zzra5Mz0h45UQsUvybNxKfHdYu0X
         7i/GxI5bg0rHhVku+70ggtYa7CzYD1EOfbXwr8Y8NCRGifHxvWwWkOqXGGB1BcJaVitW
         DMXg==
X-Forwarded-Encrypted: i=1; AJvYcCWLqudpCnQAqDmuhpA+iz4I7p1FjfnZZoT8uDM3wllWimhgVRFwUOpfF5VZPA7S1LVZaIEG/urDtB5GLOuYHptx@lists.infradead.org
X-Gm-Message-State: AOJu0YzI2tO8Tber/yDFyJRAhPM7gxvzR46GeOU98wAmMTYC1xqKTV0f
	koHJe88XPPPFpBD5r+feQIyfUs/UhxuX0jevrmmr8muJuS0KRXf0
X-Google-Smtp-Source: AGHT+IEYepYTbWzaNjZB6/WykZo7JXNjSOPeC4faI93w6dXeeMLicqGen6Mz6ACbQEadzKBbhQtzhg==
X-Received: by 2002:a05:6a00:1397:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-720b9c96d0emr4011140b3a.13.1730378360174;
        Thu, 31 Oct 2024 05:39:20 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:39:19 -0700 (PDT)
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
Subject: [PATCH net-next v7 8/8] net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio
Date: Thu, 31 Oct 2024 20:38:02 +0800
Message-Id: <527799d9e4e28fbd51eb37754f130b037bc0f6ea.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053921_372485_9172D524 
X-CRM114-Status: GOOD (  12.36  )
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


