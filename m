Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3EAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzcdkHd9gFbf4QypMItIoKQ58RyRYzqIMuQJ/GqwgQs=; b=lHvnM2YZ7ZQewwMwcfeMpijWHJ
	40FX4XvajrYMY02dcWNQNCFHiY+tqAk3T5yICe3/LZBX3PNTWp/OtsrUCW7CikyV0PnHutkb2UZNf
	Jvejsm0Q1yPswmzZ/iYFpbljsYpVlmdO7mB+zwTxpVfsgSpM25u87c/OElZbYmUzhKrTVzvmTmHl3
	Yx7gAJzmARcknW2N1vl+t6zyn1ElgsBn50B5EzX+F2YQdi2IbgJsGvWvmPYscwisHF65mFa7d4OJ8
	fK0QYyuI9SB1rfhbHLKz5BoOaqDYsr4aLBZbayA03tPDmzExHB27SJjw5FraaMdSHCN0qi0JMmINs
	JhbS16NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2RY-0000000DS8h-2no8;
	Fri, 11 Jul 2025 01:20:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0uY-0000000DIo0-3lLF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 23:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zzcdkHd9gFbf4QypMItIoKQ58RyRYzqIMuQJ/GqwgQs=;
	b=SZlGlZz8vRD5dg6oHkP2LdXGUo4OeMBz28p7JsRA7pjIEMJ1rJ8irlr2/cxKYbiMpjXeTn
	8Se+7u+gCVr3VWitF/YZrybNV0/trVPxJe553euzJmWr3F5bj6scU/Zs1pulrKobnSKjWH
	PNBHhPqgdwJVOi/aMaUfSwHhkETAsrU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-RPLrxSchOEug6RT8lFfPhQ-1; Thu, 10 Jul 2025 19:42:40 -0400
X-MC-Unique: RPLrxSchOEug6RT8lFfPhQ-1
X-Mimecast-MFC-AGG-ID: RPLrxSchOEug6RT8lFfPhQ_1752190960
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a585ad6726so49430031cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190960; x=1752795760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzcdkHd9gFbf4QypMItIoKQ58RyRYzqIMuQJ/GqwgQs=;
        b=p7jYA5pI2/Kfc0W1jNCQBMlsdAdPskZvCBNwfk/AIRSNBxJCdKhxXzY6f4EXL9fTDQ
         +NR1GjOmEAyrzwJuVj9qqA8KNrmuipDOQ8crX5pOItGQIVmZGmjKlYcHZUNd6z32xbo1
         q2fwM5zOslxslpaXwckKHsiKHE+cz0nK94z1q1cqJ6cPjNgInjcXvmWYXtHhtHS9D3xL
         qAwkukkPGeAbdvuX/CPMJEkEZUX99YCpZZ2wS+zzFfRHJ1hB6BMlVPG/xeHkBuOPEgHo
         7hwoSMrWPQvIvcpM/xVOTFr7k9dxs7D3zbtzZIyzjghAb8h9Hx274cpdDuWLvNoXlmQI
         7stQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDs8b5rQ6t9gqRTTj/rbmUp4u5qFwqNoo87SVXvEg2vbzfIUcP0d/C4YC91RxkBysIEAb15M7Krim0SuGWbVG5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4IuhNNUv7n18GnXmRMJ0pH2I8e6sEPuyeJA3VBbSQZqpqXE7s
	wnzir09i0+0SgGSvQ0Zr+5XAnvIJ33en5yLZw8sS6xAzOs+Ig3DjF4pxALSG642BIOOKq5kxPHl
	abMeaDKbQGHN7NrTdQippW9Wp758rsE/E0P9pLEuWWxbIAVwktT+2fka8C0wtOkfi62UggXehxj
	b/
X-Gm-Gg: ASbGncuwF/2WbJHspqcNf5JTubuuWsfkM67/uOSjvaFUkERSQEHZ1Uk6uq50YojQQ2k
	s5e59dDB3x44qg8J427q/qxozE5VNYlWOaQTobVASjsp0/O/9VdgKIf8saoCW9SUQQJmn5KLoO3
	sBQ2WNaY/l4aRJyP/9IJ0ugBPiWxCFrUyKjoe+GBGWeisrG0YC0Hr+gYxESnNeJwz0uIp7CSJch
	IKypMbrsntEyr9u1rdsU3JXpLS7jJpTrkfJe/6+xVOH/kqxj8DKzU2b/seojIJXAZVSskdBGRc8
	31TULs5nykwWqggpb6Wpt3WBdXx6Qgo4VLoj6R7XLtb1yefdG0u7Itkt79pMdw==
X-Received: by 2002:a05:620a:284b:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7dded1ef04dmr206090485a.57.1752190960383;
        Thu, 10 Jul 2025 16:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Qf90w3WAIU2WDAVl84idxN1ukujHZknm9tJ2hmS373+cRWGc+ayHL6trz95Fv5oRIp+Mrg==
X-Received: by 2002:a05:620a:284b:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7dded1ef04dmr206086485a.57.1752190959849;
        Thu, 10 Jul 2025 16:42:39 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:18 -0400
Subject: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=1416;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=jwHUuIfJpkKtUxi73mEQY+91PJvNh9g5xkFpUZRiga4=;
 b=BvPcx1n0mHxD2gopIAIHjnh1g8w2Bjp39wDL14lGnKxt1a2WhjWjIRkC4v+Ur+bh9HIHtBv/h
 TZtY3GXOwDxDw5NimZx9GggwdDZr1X0VaLAtH8tcwEpCQzCkO8UueKy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7WGKoD7WrDRGhuR9iLBqZ1HzU0p5HXkbVTvIVQiZlIw_1752190960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_164243_012847_42D186A8 
X-CRM114-Status: GOOD (  14.07  )
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
 arch/arm/mach-versatile/spc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
index 790092734cf6155daa63c44a1e5af00ecef30737..812db32448fcd415fa1a60f8bb971661369151e1 100644
--- a/arch/arm/mach-versatile/spc.c
+++ b/arch/arm/mach-versatile/spc.c
@@ -497,12 +497,13 @@ static unsigned long spc_recalc_rate(struct clk_hw *hw,
 	return freq * 1000;
 }
 
-static long spc_round_rate(struct clk_hw *hw, unsigned long drate,
-		unsigned long *parent_rate)
+static int spc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_spc *spc = to_clk_spc(hw);
 
-	return ve_spc_round_performance(spc->cluster, drate);
+	req->rate = ve_spc_round_performance(spc->cluster, req->rate);
+
+	return 0;
 }
 
 static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -515,7 +516,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static struct clk_ops clk_spc_ops = {
 	.recalc_rate = spc_recalc_rate,
-	.round_rate = spc_round_rate,
+	.determine_rate = spc_determine_rate,
 	.set_rate = spc_set_rate,
 };
 

-- 
2.50.0


