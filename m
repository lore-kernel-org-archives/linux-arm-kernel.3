Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3859BD49219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qre+YsoAA+tCpP15ljstTn0wo8h42CjhpKCl34sV5so=; b=25U34VbWBSezogqCLv6QIfks2h
	J671N4iJQPV70G+fRxCp8iosXOjdxBmqeu3S9DDWfCJPXo/PwLQYqY/1ntuTmRFjd0O1kk/Lc9jjM
	SETgxE/8LUhOvdlTjz10VJQ/PCCSjP/A+/mtYDz0uqVjbiiI5C7H3RXczPi3ZvBwJQ/SfMtQZnTWt
	spuxigExnKI/PqXE/BKsz2e6ZY4YUvgU8LLqYqrn+bodDSer0e6C1uhHtyu4CvCFSWd6WI+TmUltw
	mJIfsgVWOasmGkGCYMH3nL+nJOSaIqbu6c/dVS8y7h4EHgwYK3sHVXHvWcEt4Vrg8X2BdE2yhSrnz
	E9GmSAew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1OW-00000009TZE-3gWc;
	Mon, 18 Nov 2024 13:02:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1NV-00000009TIX-2iz6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731934877; x=1763470877;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=7GTsdJGtOglgq6pJjKATbODyOcoDANT26+ktdOOzcCk=;
  b=yMTnhDiFnYwyEHn2XKbW4dbeF9rcrzYNsP9agNKwWsOf+2z/5vseDBtG
   WmGnC38FKQGU6Ww0BstWKg0tGCj1bFGOV2xSGTfBh2GFzJ7FOpE4LJpHD
   RshFoFkaQ8B11vkHBZwCBXWL5PfqjPdke9i9O/cpalsgNrBHFRWbqBDhx
   OkGXeqz/XGR5tA0hD6k4Tm+21t7L+004FGwwB3ZH1QobAlgjwjdXVO+xM
   wiloyrpaXrN056IX1nljmZKZLTn1Cx3cQy286MpO+bDEM5QhMk5hEnbIE
   2N7yt1fPUNVNTZdJ6q6QYe7LDfVDORqK3zibDSmIEf7ZSTbQj/gEFDzNX
   w==;
X-CSE-ConnectionGUID: DbRaG4tGSXe42+jZNuS/Pw==
X-CSE-MsgGUID: 5RzFK5rwQPmbu9sVlMLNWA==
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="37994319"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 06:01:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 06:01:02 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Nov 2024 06:00:59 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 18 Nov 2024 14:00:48 +0100
Subject: [PATCH net-next v3 2/8] net: sparx5: add function for RGMII port
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sparx5-lan969x-switch-driver-4-v3-2-3cefee5e7e3a@microchip.com>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050117_764843_3AB64092 
X-CRM114-Status: GOOD (  12.17  )
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

The lan969x device contains two RGMII interfaces, sitting at port 28 and
29. Add function: is_port_rgmii() to the match data ops, that checks if
a given port is an RGMII port or not. For Sparx5, this function always
returns false.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan969x/lan969x.c    | 1 +
 drivers/net/ethernet/microchip/lan969x/lan969x.h    | 5 +++++
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 1 +
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h | 1 +
 drivers/net/ethernet/microchip/sparx5/sparx5_port.h | 5 +++++
 5 files changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.c b/drivers/net/ethernet/microchip/lan969x/lan969x.c
index ac37d0f74ee3..a7e41058cb7c 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.c
@@ -329,6 +329,7 @@ static const struct sparx5_ops lan969x_ops = {
 	.is_port_5g              = &lan969x_port_is_5g,
 	.is_port_10g             = &lan969x_port_is_10g,
 	.is_port_25g             = &lan969x_port_is_25g,
+	.is_port_rgmii           = &lan969x_port_is_rgmii,
 	.get_port_dev_index      = &lan969x_port_dev_mapping,
 	.get_port_dev_bit        = &lan969x_get_dev_mode_bit,
 	.get_hsch_max_group_rate = &lan969x_get_hsch_max_group_rate,
diff --git a/drivers/net/ethernet/microchip/lan969x/lan969x.h b/drivers/net/ethernet/microchip/lan969x/lan969x.h
index 2489d0d32dfd..4b91c47d6d21 100644
--- a/drivers/net/ethernet/microchip/lan969x/lan969x.h
+++ b/drivers/net/ethernet/microchip/lan969x/lan969x.h
@@ -59,6 +59,11 @@ static inline bool lan969x_port_is_25g(int portno)
 	return false;
 }
 
+static inline bool lan969x_port_is_rgmii(int portno)
+{
+	return portno == 28 || portno == 29;
+}
+
 /* lan969x_calendar.c */
 int lan969x_dsm_calendar_calc(struct sparx5 *sparx5, u32 taxi,
 			      struct sparx5_calendar_data *data);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 2f1013f870fb..ad8c048179c7 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -1073,6 +1073,7 @@ static const struct sparx5_ops sparx5_ops = {
 	.is_port_5g              = &sparx5_port_is_5g,
 	.is_port_10g             = &sparx5_port_is_10g,
 	.is_port_25g             = &sparx5_port_is_25g,
+	.is_port_rgmii           = &sparx5_port_is_rgmii,
 	.get_port_dev_index      = &sparx5_port_dev_mapping,
 	.get_port_dev_bit        = &sparx5_port_dev_mapping,
 	.get_hsch_max_group_rate = &sparx5_get_hsch_max_group_rate,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index d5dd953b0a71..c58d7841638e 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -313,6 +313,7 @@ struct sparx5_ops {
 	bool (*is_port_5g)(int portno);
 	bool (*is_port_10g)(int portno);
 	bool (*is_port_25g)(int portno);
+	bool (*is_port_rgmii)(int portno);
 	u32  (*get_port_dev_index)(struct sparx5 *sparx5, int port);
 	u32  (*get_port_dev_bit)(struct sparx5 *sparx5, int port);
 	u32  (*get_hsch_max_group_rate)(int grp);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
index 9b9bcc6834bc..c8a37468a3d1 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
@@ -40,6 +40,11 @@ static inline bool sparx5_port_is_25g(int portno)
 	return portno >= 56 && portno <= 63;
 }
 
+static inline bool sparx5_port_is_rgmii(int portno)
+{
+	return false;
+}
+
 static inline u32 sparx5_to_high_dev(struct sparx5 *sparx5, int port)
 {
 	const struct sparx5_ops *ops = sparx5->data->ops;

-- 
2.34.1


