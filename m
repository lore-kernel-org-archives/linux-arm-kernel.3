Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81329E6B27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 13:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wphCThRlK5730NbXh9Ab0RkkuVRzjiZcFhR/+OwDyt0=; b=RdtWDrxmUspKnR5EJRddBwO1Sg
	K2e5JpTX9GqRszlHcSU8tskbt+yejlcfaMlc7cP8o4gT9N9UY+4STRYTdoY+TYl0lshXo2gpa/MQI
	WpOlKbfvcQhEYhJDsapiPScsgnmU4AJofy0Jmanjha2GR3XIn3TjbxEvepmmqBbjoztuzPhAGk8fp
	Gm8cxvlqStJe4M+LaIpZTrx+fm2yE+rZXf1N8vAfdXWyTD7mIT/pGDbXgDI6bCRjds+vtPA2dew3t
	+MNSo8EROyaNGabSovvZ6sPIyjh/IrTv9G8eB6xU4Vbjx4wjPU0NP97eZaaY6yEQ0XwnDWuW/ibcH
	+R6HhF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rvw-00000007D8O-2Ek4;
	Fri, 01 Nov 2024 13:43:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6rlG-00000007BQf-0RFt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:32:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-720b2d8bb8dso1542254b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730467941; x=1731072741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wphCThRlK5730NbXh9Ab0RkkuVRzjiZcFhR/+OwDyt0=;
        b=AHLI5p6iNqPpFOGtJED3+8WNbuFV8iF9MOqqNPmw9qL83ldKEhgWAjiF1swM+mYc1y
         r5JetcQFf0rtH1ZqIsi6TcvrAY6oU+0deg5r9dKUdqJpdwImTzzrkNAGRwBmgVBfv/Fm
         dYmrNkZgoIGqDngLXd59i5ID9gcbyP9TqOXu5aKReo4UhdoPvdRZx6lqmhiX7vye8DvX
         dMCDafGhR5eyIgLSZKpuATdeKYdBnS05rwtUOeRD3v1+4bSHIij8faCweFfj5kVTlZHb
         B4hjDEaqjr8o41nEbQ/uVXLY0XgJXs+CTRP4WJyh96BjgqFXw3f6WGfoz+9IGDJKiSXf
         uuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467941; x=1731072741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wphCThRlK5730NbXh9Ab0RkkuVRzjiZcFhR/+OwDyt0=;
        b=HPvzCSyiHezCWQrilUpDtSJppVOGbu1N3K4TB1ba5yERHTYmExi5FdtUF4bhdO6JFa
         t7QwsBOtYH9du0p4M/+XY6BA1cJm764ZpPubM+MAeK42YJVCIuknTJVTNuybmP+vGG4F
         Y9P25rHjlvwF8hkeDF6xi6fdzAacmByGHnS6IFz27URNEMXVNgHB2+R7IQT3CZ/seVud
         Ki6dRUjRB/4iCrtPOf+94213EXUa/Bh3QM6EVTyS3USzbdkX3781fgjINu4+29Z6a3aE
         p5LtirLBeeLk4sfwVTrOU3IZJleKwWfvVO9y6tv+S5jY2kqkGoFKb9J0dXBDGiiITlDR
         A09g==
X-Forwarded-Encrypted: i=1; AJvYcCVh8MLDdWlPguWf8I8U2OyptRAFp2N14VnHcvrKySfT95M/RWiYdRplG9RBoA8P7CiIUgj3eFpLTMFHASyGOnMJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwRyMCh3tpxmFkknclwctY/oLSk7TDrs8+4487pOpBkhHxl43dR
	iDFPDvtjiiudDnGV329sK2703gmVhWuTRTcaYhlEwmRmjN9LmOOX
X-Google-Smtp-Source: AGHT+IEwkwocJqJz+kaOZcvq+ymOZftMTIobWIrePUj2ag6n4idToR7gk3ClbrJoOWA/v/BFlkpmRg==
X-Received: by 2002:a05:6a00:887:b0:71e:72b5:3094 with SMTP id d2e1a72fcca58-7206305a115mr32325469b3a.28.1730467940877;
        Fri, 01 Nov 2024 06:32:20 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:32:20 -0700 (PDT)
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
Subject: [PATCH net-next v8 5/8] net: stmmac: Get the TC number of net_device by netdev_get_num_tc()
Date: Fri,  1 Nov 2024 21:31:32 +0800
Message-Id: <6298463f4655a76faf94e4273a4205c13ca17c77.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_063222_170628_B986627D 
X-CRM114-Status: GOOD (  13.30  )
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

netdev_get_num_tc() is the right method, we should not access
net_device.num_tc directly.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index affb68604b96..ab717c9bba41 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -304,7 +304,7 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 {
 	u32 val, offset, count, queue_weight, preemptible_txqs = 0;
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	u32 num_tc = ndev->num_tc;
+	int num_tc = netdev_get_num_tc(ndev);
 
 	if (!pclass)
 		goto update_mapping;
-- 
2.34.1


