Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6149D4335E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=; b=Rwrf4tpm+lHBccvx4RHWBODVvX
	sleOabE6t389eaPan1tGyc4an8GxdsiVSVwfdz/cXCGl5AEeN/UlM9P69AofHjWDiCgCauDibINoH
	uH0gORiEYwoddYGf1LVCTkNUTtidgkBtMG27w1/zFigkIfTtZ3PLyVzBJC43CpSyqM+A9dolQABxN
	FDNgv1oZv0PxLdIlDxTS8ji5xO+lF43URR7dCX3LuUKowO+XAxZBZhsK6JlXTyqOV5tOKLhxuwESG
	KzqjZeNtkrMeuutuCU3GSq0kltjbGOA6YtflqO16SIZnpuhfxVBM2ozmESV79nqofzLN+pU+O9l+x
	VDE10mAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpv3-0000000HPdQ-0YWa;
	Thu, 11 Dec 2025 23:17:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpuz-0000000HPT6-0kD1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=;
	b=AMZop/4TS0O5boWg0qviXeR7hBPCVn8Qlos78RddDQjj9v5JEf/x6bIWIQIx+e3n4otCOX
	0N0m3p3V7/TH5bcvw62lpjLzJr5WpUIk1wa7SG85OkaAaqN0Eze3t5EZdQ6D1DfIGj2jcl
	Z2nHgR+9KrSulScTqST45IytZLY+UK8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-iHMk0sodMDy3gwZO64P0rg-1; Thu, 11 Dec 2025 18:17:48 -0500
X-MC-Unique: iHMk0sodMDy3gwZO64P0rg-1
X-Mimecast-MFC-AGG-ID: iHMk0sodMDy3gwZO64P0rg_1765495067
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e235d4d2so224729885a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:17:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495065; x=1766099865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WSMzcnKfH5zogbN6xIJkP7sWMqF2vATubBjeteI/qGc=;
        b=s9kBfTUodYbSdoCBBQZ8cJ20/hWLKXA8qz9JNCw/mzfyRZtaSM8O/W91snz6FNxX9u
         CMHg0ZNPv6qMzx+ksuKHjVF1LMWrUEftmwjDsJRZPsl+9BO7BBbxCSE1qVL9gOBSAxAI
         FR3iM6KsOp5Lvf7rCQ0a19PbhZ6d68UGUBGDx5uxu0gwoNIu07Y56a2sojcM/wguVurd
         GSr45hRsjlgDyHoXHfisVFgii3cs1aAjeIC9DRqaA5ZxGTCKkPS3v3WKEnJiW6TalNjy
         kIKkLMYYMYzMOFrl4lp5NIVWisxAB+iPWcV5amiPkXzkgLDCdoovpzoFoFLSKAnTO8rX
         y2HA==
X-Forwarded-Encrypted: i=1; AJvYcCUFThCgPUFPram0F6pxk0jc5pzqHRE3p4DAot7tzybwW9zJ8F/Jaoc0DKnGvzXVDP9rs+fhovFxaFC89OTER0jb@lists.infradead.org
X-Gm-Message-State: AOJu0YwsPVWQwTWmtvKKTO0KhG2AFk/LAlY80zXX0FDZiux+L1aRo2sq
	kWReCJp+DZVCD7f+ye2d1TGJit5C9I7ZFAOXBEP/35IixDc+chyEQk/zgKUI+uG2NtprazaxoSK
	wczVJxQzAJSeDRzpuZIISW1fx1sakSS/Q3pycbJiaaDhybZulT9MQXZMqFXRKEXJJohC4QBnb1Y
	Sflp9ncw38UbQ=
X-Gm-Gg: AY/fxX7uNb/AcK/9EVfL3QVZm8uQukz6ebQao3uMsIib1aWykkCoC1f6V+zbbS3+JzG
	pPyAB58rodZ9IoDEeQYo+mAgqEhj3VfIiIu0Or8vFKlt4vGbddaCqzwTg3ZG9J5Pyjjv5v8FrKP
	FcnB1pzI7Uux/xwo0O8mk4VQElZGhBUzzU7tNERpybVhfNfnP5/f/sglqvtorEMyWLhoO509Ir1
	fz/iHzLOa0UJszTWCZbky37RHfT8wugX6SHAVlbX+2lF3hneMY0uBdHDLW5uGdD6ZbRKRCRovzt
	455Hk8GgJuEdjp4DFfbeG+y5HAkKkQxvL/OOyhqbFjw5kyAEMuktJmVCzH+o/lVbIg2qUaFZuP5
	c5gTSSVcfMcLymbCWUT1iSrpEGbknKzGLh/GArrGbm8ug7vr9sxwXOg==
X-Received: by 2002:a05:620a:4416:b0:89e:c659:3f99 with SMTP id af79cd13be357-8bb398d703bmr36053685a.6.1765495065302;
        Thu, 11 Dec 2025 15:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLYKRP7lHhgawU3OEaYHk6OghheRQMM/cwXxtpO8QhTtXeryEcvWYjXWc+lMjIJt9Bnf4lfQ==
X-Received: by 2002:a05:620a:4416:b0:89e:c659:3f99 with SMTP id af79cd13be357-8bb398d703bmr36048785a.6.1765495064870;
        Thu, 11 Dec 2025 15:17:44 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:17:44 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 12 Dec 2025 08:16:27 +0900
Subject: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=NfOJan9Myaz8PWi/tdBEvmDwiM4IlBdU+UqmIR/UHpw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy71PRfV83r1eE1XcMbr4193OXztck+aIzTF0fIwx
 8OmyOXFHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzkcBnDT8bgg94/bv76LP98
 asNWnk3r2i7mlX2fL39CbHOvzuf29BCGP/wVmU95Y0IeCWi+VV+bOlm/YtKFpXbSLZp8AR0a0lV
 hPAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wPQdTGxuQgQFjy2jywcVzYgjxJsKpnndvd5CmFhhqkQ_1765495067
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151753_324079_8C0CE988 
X-CRM114-Status: GOOD (  12.95  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index a8b440c6c46bb0c754845655f9c2c0ba6b435b8d..cbc98d4dec74560e6403fb899ebe2bb916440f45 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
 	return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
 }
 
-static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int wiz_clk_div_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct wiz_clk_divider *div = to_wiz_clk_div(hw);
 
-	return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       div->table, 2, 0x0);
+
+	return 0;
 }
 
 static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -958,7 +961,7 @@ static int wiz_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops wiz_clk_div_ops = {
 	.recalc_rate = wiz_clk_div_recalc_rate,
-	.round_rate = wiz_clk_div_round_rate,
+	.determine_rate = wiz_clk_div_determine_rate,
 	.set_rate = wiz_clk_div_set_rate,
 };
 

-- 
2.52.0


