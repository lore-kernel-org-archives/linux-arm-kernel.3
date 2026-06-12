Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C217ACD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhJOSlOXe4wPGM8xzx85nkRQR3cHPSJG6DXAJFJqngc=; b=PgocPd/jxzEB1+sPPVHVRl14rk
	ndXaDlxlZ+rjj6I0GQvvGkyxLz4EZCMfm1ZoRpKOeYj6ibPA41P0zZCVdgrXdHL4pOce+ruHAWZza
	26yKenUlt9QXOV5w2//wfMIQ6K2ne3OY6SA1WC1sWW7I+hzr7AxkacQ6hLn7gsk/pC+Ur32cG0dLp
	htR1j5RJtP/XIyW8E1TJq2hgA+UGAcrwS6BY0iGWw9c7uo5BZ7toq1xBJ5Jf+meIrCEFqvZPN7b4l
	I/h0hMq71/SozHTBb6H3YBz+zEY+PcvJHGb71zIRHky1N+2kT7xhOu9hI+qjZXDVqfQtn9Yb74Cmo
	1JXS8aqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY19t-0000000AsVo-38Qf;
	Fri, 12 Jun 2026 12:38:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY19p-0000000AsSP-1VDJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781267926; x=1812803926;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=KEaEUJCYAEMjwC5QjXh2bDIIjrmXMR7PQDf3K1RKJdQ=;
  b=XoZLK1RR99bY8i5gRRkrtReCNzpNleTIVTQdWYW8zR1I8AoVld+p+woK
   QQHCfZlUt05R6CnXDgxot2JvHVun8P1u+Cw722QJ5EviejMF4spy7boiJ
   gjzqtWxx7QtoNMmnKoRnQoGlvyr78dHZjZiZw8DZhGuGQMWRiI25cW1ah
   gR7W83x/zhtAfcujY4xDCNW9C1kue7m4KTx6Mge42QHk/JbFdo6YbuUnR
   Dkdg22z0Nccv4hQShFUxQkpr+ZkNajMWr4I9ofzROjktWQ7KutXqgRkKb
   y06M7Pbkbrf9nwS17smZmIHYHus1+UHfi7H+Izxe8hr34AG4yV4s5QhWc
   Q==;
X-CSE-ConnectionGUID: rlQPc1ARTNKXdeL4uOz28w==
X-CSE-MsgGUID: A4ky+3h0Sg2hEwaLs8c/Zg==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="59023666"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Jun 2026 05:38:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Jun 2026 05:38:44 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 05:38:41 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Fri, 12 Jun 2026 14:37:12 +0200
Subject: [PATCH net-next 3/9] net: microchip: vcap: make vcap actionset
 decoding type_id aware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260612-sparx5_l3_routing-v1-3-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
In-Reply-To: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Machon
	<daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053845_411913_087A183D 
X-CRM114-Status: GOOD (  12.83  )
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

When reading a rule back from hardware, decoding has to identify which
actionset the rule was written as. The existing logic was only aware of
the actionset subword length, which cannot distinguish actionsets that
share a subword length but differ in their type_id field. The LPM VCAP
added in a following patch introduces this case: ARP_PTR, L3MC_PTR and
ARP_ENTRY all occupy one subword and differ only by type_id.

A helper is introduced to extract the type_id bits directly from
stream[0]. This is valid by construction: the VCAP model places the
type_id field (when present) immediately after the typegroup bits in
the first subword.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 drivers/net/ethernet/microchip/vcap/vcap_api.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
index 6946fd738458..30700648672f 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
@@ -216,6 +216,13 @@ static void vcap_decode_field(u32 *stream, struct vcap_stream_iter *itr,
 	}
 }
 
+/* The type_id field is always right after the typegroup bits, if it exists */
+static u8 vcap_find_stream_type_id(u32 *stream, u16 tg_width,
+				   u16 typefld_width)
+{
+	return (stream[0] >> tg_width) & GENMASK(typefld_width - 1, 0);
+}
+
 /* Verify that the type id in the stream matches the type id of the keyset */
 static bool vcap_verify_keystream_keyset(struct vcap_control *vctrl,
 					 enum vcap_type vt,
@@ -1331,8 +1338,10 @@ vcap_verify_actionstream_actionset(struct vcap_control *vctrl,
 				   enum vcap_actionfield_set actionset)
 {
 	const struct vcap_typegroup *tgt;
+	const struct vcap_field *typefld;
 	const struct vcap_field *fields;
 	const struct vcap_set *info;
+	u8 value = 0;
 
 	if (vcap_actionfield_count(vctrl, vt, actionset) == 0)
 		return false;
@@ -1355,8 +1364,11 @@ vcap_verify_actionstream_actionset(struct vcap_control *vctrl,
 	if (!fields)
 		return false;
 
-	/* Later this will be expanded with a check of the type id */
-	return true;
+	typefld = &fields[VCAP_AF_TYPE];
+	value = vcap_find_stream_type_id(actionstream,
+					 tgt->width, typefld->width);
+
+	return value == info->type_id;
 }
 
 /* Find the subword width of the action typegroup that matches the stream data

-- 
2.52.0


