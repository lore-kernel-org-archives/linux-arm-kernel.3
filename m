Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BE5CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEg9IzJfORmEUVVC8tp3QP7XHlH+b0gTJgTrq0ptJu0=; b=4K3Z+vbFmoBGH8D1TuekWo4USn
	ocN2rhK4+rA8OaCswXGjUMk7JQOPUoeWqtcTuhgPRu3jkx8zB95bFD13J7+NwUN0g8tb0oZViulSQ
	uO2B6LelqY0TR2Zo6ObI6p6j3Zi4LD8IDcrVi+W1/7l9jsCUdo/cnreb59A4rws9LmBdL0mjaxb3y
	27XTML63XIITR815v6xmj7PEKZpDsVVEa+1QOePZFKjO2iFJ8B17uUP8ZpvMdIBhvEAEaFfEtNSjJ
	5xO7G/rhF3XWWVjeMFEihztkCYFyjVyyHi4WZGEkmNKRaKk7U5fbm9aQo9vQq+H5NU+Sy4bG3s8J8
	Ux4luk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorS9-0000000F6xv-0eNL;
	Wed, 20 Aug 2025 22:38:45 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonH6-0000000EeKy-0wiI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:11:05 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-70a88dcb665so2425876d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755713463; x=1756318263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEg9IzJfORmEUVVC8tp3QP7XHlH+b0gTJgTrq0ptJu0=;
        b=ZjV5OkzBuq22mYyJUbjdeSuCTkF51uCGLX2WLee44ecmGaogsIYDna9Ow2QYoJnfx3
         FksL3ulC1G34Cs5IjSQUASO0p1fu75C+NxN3IiEIQOGTTIy3XAo6ZyDe4bcKPmrL0Zsi
         iYLN81yBn3dtXYych9kxFlu0AKgpBS3qXLllxyFR/xwXO+pM5991oXYld7fwpXF2r8pI
         FilallK1ERZuHCV1QsI+ERxTEjhV+gwbmdZJvOG2LPgh3ZkZ1oFunRiywETYfa+9eVkI
         pCWYqUkCnoJGfRpW5fKcLTYcxOIGuSj/h6fGW2CIvEnRiPHS68+M03xUQ15ldqd2tlzr
         Yptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755713463; x=1756318263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEg9IzJfORmEUVVC8tp3QP7XHlH+b0gTJgTrq0ptJu0=;
        b=NSHTW5eCSghly46A6yXQZqad5HnHxqOS4ubTwmYc5ivJ2BOZMO1IOYTzeAbDp4Whdb
         HZsvCar/ZPGbG3A/2fD5sAntfBCj+mVkj16ApXGIkmes5btXYuN5+R9qD756OzBKIKjF
         lep73e09kw4Y6ilAmzalpFf208/lcE+l2u0BJzdhaJvPtXVU1/BiBUfQlq4eowPJQUz3
         k2Lo6rFRB3wSau0+TVcndirmFesrBxSCTGGhhn62bN6gMW+ybuE3rsWKNOKIiY2iPM0Q
         cihourrRGMkfjum3tGXJXhy67ABFJyNSHtdKZCvgLpI/DqcitdvrYpZq3pUQ1zp3uCOD
         hNXw==
X-Forwarded-Encrypted: i=1; AJvYcCUq0UI2OXRwJ6B3JruUaq5s1Xp4kbRx6as2/88+8DyE0eIdL4Hyh2fyS6qzNu4+B0FZRv6vaDlUT33srZls3Yet@lists.infradead.org
X-Gm-Message-State: AOJu0YwGCk9r6NgAilKFoh6Mtv0eJ707fMm/Eomb6xK6O7pGJm4WgSgW
	EhNrdd8BloBfAiOMtFts2zUi2VC2+zUZK3n80lNbUU4OI4Cx1/ST2XZDckAkO3BQnQ==
X-Gm-Gg: ASbGncvpt5emqWBJVyTmwKEP3/Kq9Cvt5N0yJb+slb4zofox+J7yOJI5Cx9Y6rpryXJ
	vRkfaymk0IhSv9ZEhpCufE6D/aH+tEPF5DQbKvg+TEu7qfrxMlPaTdaf8E2dLNF6+dZBi+7Eg4l
	DUz//iGfdrv82TV64sj4LauMh0LfohC+UqGwWbjwCGGZI9LoaDBeOch9TbAZ+BuZ3zeNCis+NuB
	iI7oEdO4y7PC4/BJnd9swe7najOxRhbTrTjnO7jbRHqTn94w/eGyGy+DuLuRf43uAwYShfNjbgS
	Ii6fY54oAMPv+cX+h8afGWLR69lKVUBHZbMpG2dIu8dxB+sU3gwAE773FlEGOUz+/XXZCPW1oE4
	MiEiLiDZRdFeIxeJ6vOYL0Wn37fwJr4BCk2tCYjupRwiiZHL+nclttKalE3sxQyxm7cyqS9tGqw
	VAPQECLIAK//4bl1SJa5PXQCu0em8FKT3qaarV4MGvmlsA9A==
X-Google-Smtp-Source: AGHT+IEhwtbBn17CFSkW+x+E31JWfVdYnrpp1FxIk0F5/CAtt0bQ5xc/VvPHKPM3nmoyKj+xtB3uWQ==
X-Received: by 2002:a05:6214:d83:b0:707:6665:eb67 with SMTP id 6a1803df08f44-70d76fe0302mr39522186d6.27.1755713462700;
        Wed, 20 Aug 2025 11:11:02 -0700 (PDT)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e076811sm977497485a.36.2025.08.20.11.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 11:11:01 -0700 (PDT)
From: Jonathan Cormier <jcormier@criticallink.com>
Date: Wed, 20 Aug 2025 14:10:45 -0400
Subject: [PATCH 2/2] firmware: ti_sci: trace: Decode message types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-linux_master_ti_sci_trace-v1-2-2a69c0abf55e@criticallink.com>
References: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
In-Reply-To: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4840;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=a5AYMxBqdJDz6gkrxlobXlcTTsJboGuBBxIbO2fep+o=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBopg+y65DfxJcmBr7YNYJ54nyOqO3l3NJUMUR7E
 KADuw/pnDiJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCaKYPsgAKCRDc1/0uCzbr
 qnB4D/0TzDsPJ7lRUNl2m1uohyDVNtltT1shOqGDs66CxsyOs6kuIzGUc+yEVSIhPMrkY1iKD8X
 G+heAKTVSssyrwBiEWItF318NblLONNj9uU8OPndwP39HMJgcPbC/9J3Gvr6S6B3SSsHSST4Svr
 CaVqCfxh+CNuVrnH2cM/MuNIG0yigWUZS5BkV88qdqG3xVykc91T769HPEqXkCuTc9Qn5SD1VXG
 T5A0FziX8wFILfXfBXLNztp2+jR5s2f89oYVQFyzZ9+xDLgIQKjIgEFm3sLLy4K1cBJOPjmFdPh
 g6dcdaNOX6fbRLAlBKebIXRn5xcDieK8IbY9NWRuIND9wrWTCRTBt8zyEJZXgmJpBpmwPEFavm/
 uLsyVSE1DJbQi+AQhzf0aghepy1gqWntTK88OXH4hgUeAN2ON8LsHcZOK+665FmZwuWrdbwHGpQ
 Q0VoETLzgwZdVkJ0BnYIlgIF5KTJ92rXaFJANPVsRbQGWHJvi6GJeFq3tdx9TkM9JvXgrAT6IhU
 hzfoGW3GvHCMmATRgHFiQeKyymbsD3sCoZEuvZ7nv5xq5eGNJdlc3MAtFsXh6Mig7EiUfWLDdsQ
 CNwsna+Yv4mGWYItziGkFwyXbqg6VR3rz7ddrJ+DQsUzrXNTK6ZuXPNnQqTtWV/4f0WXjSRbKT6
 UMSvOKeRXSdKAkQ==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_111104_271423_9368DF8D 
X-CRM114-Status: GOOD (  10.70  )
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

Make debugging easier by decoding the ti_sci message types

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
 drivers/firmware/ti_sci_trace.h | 69 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/ti_sci_trace.h b/drivers/firmware/ti_sci_trace.h
index 7f99c41ea08aec6cf64d601576cad29b14c6ad5b..88a159e13907d7d7806b312a2ad3103c106d1972 100644
--- a/drivers/firmware/ti_sci_trace.h
+++ b/drivers/firmware/ti_sci_trace.h
@@ -7,6 +7,63 @@
 
 #include <linux/tracepoint.h>
 
+#define show_ti_sci_msg_type(x) \
+	__print_symbolic(x, \
+		{ TI_SCI_MSG_ENABLE_WDT, "ENABLE_WDT" }, \
+		{ TI_SCI_MSG_WAKE_RESET, "WAKE_RESET" }, \
+		{ TI_SCI_MSG_VERSION, "VERSION" }, \
+		{ TI_SCI_MSG_WAKE_REASON, "WAKE_REASON" }, \
+		{ TI_SCI_MSG_GOODBYE, "GOODBYE" }, \
+		{ TI_SCI_MSG_SYS_RESET, "SYS_RESET" }, \
+		{ TI_SCI_MSG_QUERY_FW_CAPS, "QUERY_FW_CAPS" }, \
+		{ TI_SCI_MSG_SET_DEVICE_STATE, "SET_DEVICE_STATE" }, \
+		{ TI_SCI_MSG_GET_DEVICE_STATE, "GET_DEVICE_STATE" }, \
+		{ TI_SCI_MSG_SET_DEVICE_RESETS, "SET_DEVICE_RESETS" }, \
+		{ TI_SCI_MSG_SET_CLOCK_STATE, "SET_CLOCK_STATE" }, \
+		{ TI_SCI_MSG_GET_CLOCK_STATE, "GET_CLOCK_STATE" }, \
+		{ TI_SCI_MSG_SET_CLOCK_PARENT, "SET_CLOCK_PARENT" }, \
+		{ TI_SCI_MSG_GET_CLOCK_PARENT, "GET_CLOCK_PARENT" }, \
+		{ TI_SCI_MSG_GET_NUM_CLOCK_PARENTS, "GET_NUM_CLOCK_PARENTS" }, \
+		{ TI_SCI_MSG_SET_CLOCK_FREQ, "SET_CLOCK_FREQ" }, \
+		{ TI_SCI_MSG_QUERY_CLOCK_FREQ, "QUERY_CLOCK_FREQ" }, \
+		{ TI_SCI_MSG_GET_CLOCK_FREQ, "GET_CLOCK_FREQ" }, \
+		{ TI_SCI_MSG_PREPARE_SLEEP, "PREPARE_SLEEP" }, \
+		{ TI_SCI_MSG_LPM_WAKE_REASON, "LPM_WAKE_REASON" }, \
+		{ TI_SCI_MSG_SET_IO_ISOLATION, "SET_IO_ISOLATION" }, \
+		{ TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT, "LPM_SET_DEVICE_CONSTRAINT" }, \
+		{ TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT, "LPM_SET_LATENCY_CONSTRAINT" }, \
+		{ TI_SCI_MSG_GET_RESOURCE_RANGE, "GET_RESOURCE_RANGE" }, \
+		{ TI_SCI_MSG_SET_IRQ, "SET_IRQ" }, \
+		{ TI_SCI_MSG_FREE_IRQ, "FREE_IRQ" }, \
+		{ TI_SCI_MSG_RM_RING_ALLOCATE, "RM_RING_ALLOCATE" }, \
+		{ TI_SCI_MSG_RM_RING_FREE, "RM_RING_FREE" }, \
+		{ TI_SCI_MSG_RM_RING_RECONFIG, "RM_RING_RECONFIG" }, \
+		{ TI_SCI_MSG_RM_RING_RESET, "RM_RING_RESET" }, \
+		{ TI_SCI_MSG_RM_RING_CFG, "RM_RING_CFG" }, \
+		{ TI_SCI_MSG_RM_PSIL_PAIR, "RM_PSIL_PAIR" }, \
+		{ TI_SCI_MSG_RM_PSIL_UNPAIR, "RM_PSIL_UNPAIR" }, \
+		{ TI_SCI_MSG_RM_UDMAP_TX_ALLOC, "RM_UDMAP_TX_ALLOC" }, \
+		{ TI_SCI_MSG_RM_UDMAP_TX_FREE, "RM_UDMAP_TX_FREE" }, \
+		{ TI_SCI_MSG_RM_UDMAP_RX_ALLOC, "RM_UDMAP_RX_ALLOC" }, \
+		{ TI_SCI_MSG_RM_UDMAP_RX_FREE, "RM_UDMAP_RX_FREE" }, \
+		{ TI_SCI_MSG_RM_UDMAP_FLOW_CFG, "RM_UDMAP_FLOW_CFG" }, \
+		{ TI_SCI_MSG_RM_UDMAP_OPT_FLOW_CFG, "RM_UDMAP_OPT_FLOW_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_TX_CH_CFG, "RM_UDMAP_TX_CH_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_TX_CH_GET_CFG, "RM_UDMAP_TX_CH_GET_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_RX_CH_CFG, "RM_UDMAP_RX_CH_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_RX_CH_GET_CFG, "RM_UDMAP_RX_CH_GET_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_FLOW_CFG, "RM_UDMAP_FLOW_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_FLOW_SIZE_THRESH_CFG, "RM_UDMAP_FLOW_SIZE_THRESH_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_FLOW_GET_CFG, "RM_UDMAP_FLOW_GET_CFG" }, \
+		{ TISCI_MSG_RM_UDMAP_FLOW_SIZE_THRESH_GET_CFG, "RM_UDMAP_FLOW_SIZE_THRESH_GET_CFG" }, \
+		{ TI_SCI_MSG_PROC_REQUEST, "PROC_REQUEST" }, \
+		{ TI_SCI_MSG_PROC_RELEASE, "PROC_RELEASE" }, \
+		{ TI_SCI_MSG_PROC_HANDOVER, "PROC_HANDOVER" }, \
+		{ TI_SCI_MSG_SET_CONFIG, "SET_CONFIG" }, \
+		{ TI_SCI_MSG_SET_CTRL, "SET_CTRL" }, \
+		{ TI_SCI_MSG_GET_STATUS, "GET_STATUS" } \
+	)
+
 
 DECLARE_EVENT_CLASS(ti_sci_hdr_event_class,
 	TP_PROTO(struct ti_sci_msg_hdr *hdr, int status),
@@ -28,8 +85,9 @@ DECLARE_EVENT_CLASS(ti_sci_hdr_event_class,
 		__entry->status = status;
 	),
 
-	TP_printk("type=%04X host=%02X seq=%02X flags=%08X status=%d",
-		__entry->type, __entry->host, __entry->seq, __entry->flags, __entry->status)
+	TP_printk("type=%s host=%02X seq=%02X flags=%08X status=%d",
+		show_ti_sci_msg_type(__entry->type), __entry->host,
+		__entry->seq, __entry->flags, __entry->status)
 );
 
 DEFINE_EVENT(ti_sci_hdr_event_class,
@@ -73,9 +131,10 @@ TRACE_EVENT(ti_sci_msg_dump,
 		memcpy(__get_dynamic_array(cmd), xfer->xfer_buf, __entry->len);
 	),
 
-	TP_printk("type=%04X host=%02X seq=%02X flags=%08X data=%s",
-		__entry->type, __entry->host, __entry->seq, __entry->flags,
-		__print_hex_str(__get_dynamic_array(cmd), __entry->len))
+	TP_printk("type=%s host=%02X seq=%02X flags=%08X data=%s",
+		show_ti_sci_msg_type(__entry->type), __entry->host,
+		__entry->seq, __entry->flags,
+		__print_hex(__get_dynamic_array(cmd), __entry->len))
 );
 #endif /* _TRACE_TI_SCI_H */
 

-- 
2.43.0


