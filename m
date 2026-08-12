Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE61DC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xCetfRdT1kQP0+GZObnmMEaJzYFwf/S5fuBWuhlhps=; b=kdU/gr1lxyvaIG8K43+zg8X+Mr
	vnj3Rl3O9AxRKRgGljtdMI30LZvp4HZP/d1elzb6QlmiaMQDY8gHhr6TRRrjE9RRFY0BmXbGZoZVh
	62MArH24CA55gEMBhIMWqtDD9Z0HkupGGVHrp0FOqNlU/bg+rKvTr5Y4p7Hut4qIMRMDFtZZcmcB2
	PueUMtNRHxOjSXMDWSGnCrajhPLchiou5K9Y149Zs8ME/ZTknOCFcqMGex0kXDWyqolm8p2Y2R6Ir
	OBQCfxkwnbhxYgopHqYRsm285OTI6Vy0CC2p0evrLQizz2h8ryJArK9ik/bRSUciDk2Y9fI8TU1qE
	F5l4jjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFM3-0000000GyZY-2k5f;
	Wed, 12 Aug 2026 20:15:15 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuFLw-0000000GyWt-107o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 20:15:09 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so793350a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 13:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565707; x=1787170507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xCetfRdT1kQP0+GZObnmMEaJzYFwf/S5fuBWuhlhps=;
        b=S16LPRqgM61I+lJZIK7Doq0GLOi0cw2bukDaQCU7MBWLMFSUZ5Y45vRGw9eJujPOWk
         s42sDGb5hh6GztK3S6VnD/MOZeQJM9FTPpOvOddIeuSdIv+w5Kqkd1HG128g3qfliSQd
         a2e7G7cA4AScsm7Xcx+SJIIqHjGyLnZExGDdwHcz88SWfYNzDsI5bsZA0+BumW8oKFBD
         B9LE/wqaaeMWk0q39nVR4PFYAnVrUwwG//IsE5LWVpgoi4+9KXgLwV9pgx4W64BIUUWI
         blrX1ZSjCEt4C3nShhpJGX3EsaV4vRyiG+IuhCvj3yM4AqAL6ILdDvIZRfE+xa8kxDBS
         92eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565707; x=1787170507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xCetfRdT1kQP0+GZObnmMEaJzYFwf/S5fuBWuhlhps=;
        b=EKetBNhgH1kZqujL1WHDyz8NE/mItMbNIXF7wumtPWuNWjPB9Sq8AzOszA8Am3NbfN
         PbmEzaRDNCWdEFT2BaAm34hfw0JY6x5yJc8T12DQmGkEOuasmq+0lK4x6eWLteBgDBVh
         aHFTI8G2AsDkfER3MMaQGJ207H6nnS8dHrvlWLFfSkdOtXotn+e7Wcy6g14wKZDhM8Fs
         1Y8iswftB0nRxmWnsm+UmYlqrmj+GoJshzN6V37GaXJaSjHpUnF1deVqObrjFV9oJLxr
         NxDOyfuAHecMhMIQdkDJL9idS61cl3RunEAsiuFde4/PHmoxCdz2saqtIVFyjzg9vzGK
         guvg==
X-Forwarded-Encrypted: i=1; AHgh+Rpf3Ae4Pnk6FDMNabu9oUxv+WuZbRDIaAedNl1u5nzVR3muz65y731q6nG9ad3JArpDQI39PVZZDbbMzdCZzSNP@lists.infradead.org
X-Gm-Message-State: AOJu0YyGsSf+BANYOkUg7FAs2ieO+mkX73OtjbjtzJ5mw/TU2djyCYMb
	bVGRF0spT2vaDHaS+F/KDG0abw4IC5C79O7LcW6DrN3YC1ctiIqiSJaB
X-Gm-Gg: AR+sD11i1wakGuZE/lshORjU2YPFKcEnMmNfkx+/pfP9DlNk2toDWgJPfLXDJG34dy0
	82q+cqJLtDoyb1PgpF2Ty9zmVnGdJrHr50d3GT9XXrfePFf8VWsGMakocSIyiaoSzsMON/IvdO4
	cp2VnNVgC4IyTANVHkpUn1csw4O+RW5W1SLbM89YnZQjeaZnqGyyJrP0DIYJ4FvLaB8aFah0OCC
	wY3UZbhhKJD6MPDIk+vVM0zIT7z+O8im8FuOstku6hATyhZ8GVjE98mRkZx5+WueDKv6LjaYrTU
	BLPj8oEQpex1JFaPvNHO9f/MywtmucwUG+b3ogntOAq4CBwilHc7b7p6KorBzZ06oQ1+lC4uivA
	Ne+uhZyhj1ZxSPluhSde0iEEgkdTrwP6uOQnqS9KlFr11tZ1/3NVA7XmszuRbplk3xCQOz8RPCe
	n90on1x7sz4xlp6GeIx+n2Uv9i9gpv6UTTKtPPkyae8PRIz+IpMGxYYKGgVTs8MZ6BqvZPlcL36
	IrOE496tspfGz9O6c5TrmPlwZj+etL7+o9hXzx3
X-Received: by 2002:a05:6820:4b8b:b0:6b0:449e:5d15 with SMTP id 006d021491bc7-6b0c41a23a2mr1073613eaf.4.1786565707024;
        Wed, 12 Aug 2026 13:15:07 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:06 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH RFT 1/2] clk: sunxi-ng: add feature-aware M divider helper
Date: Wed, 12 Aug 2026 16:15:01 -0400
Message-ID: <20260812201502.264919-2-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_131508_285438_96A50E4A 
X-CRM114-Status: GOOD (  11.40  )
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

Allow single M-divider clocks to retain common CCU features such as the
hardware update bit without using the two-divider MP class.

Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
not tested on A523/T527 hardware; testing on actual hardware is needed.

 drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e976f..fd222ef0b8af90 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -212,10 +212,10 @@ struct ccu_div {
 	SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
 			      _mshift, _mwidth, 0, _flags)
 
-#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-				       _mshift, _mwidth,		\
-				       _muxshift, _muxwidth,		\
-				       _gate, _flags)			\
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					    _mshift, _mwidth,		\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, _features)	\
 	struct ccu_div _struct = {					\
 		.enable	= _gate,					\
 		.div	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
@@ -226,9 +226,19 @@ struct ccu_div {
 								   _parents, \
 								   &ccu_div_ops, \
 								   _flags), \
+			.features	= _features,			\
 		},							\
 	}
 
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				       _mshift, _mwidth,		\
+				       _muxshift, _muxwidth,		\
+				       _gate, _flags)			\
+	SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents,	\
+					    _reg, _mshift, _mwidth,	\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, 0)
+
 #define SUNXI_CCU_M_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				  _mshift, _mwidth,			\
 				  _muxshift, _muxwidth,			\
-- 
2.53.0

