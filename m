Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496B2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=; b=JNt+IYLqWdKvnZsGRRdLGZ3zI0
	VODirvsO865vy1moBACXz3nMlKnEOlTP9vvh090BQB0UhMJboKYCWt8CVW1DJjj6qtpt/eTRDLzy8
	Hgui5Yht3rB2AtAibjVnFJL8+xizFf4yLDvmDD84oTRetOI+C8WILAxCicpmPiigxNXgw41FyFSsa
	OPaOiVIEm6OpGuDq1fBPZk1pn0a+6zbcmaqQZgLRSsSlrSpySKsoxOrTGzbhrGHQvk2jPeICrU76Y
	GMbo4pySzTzVI0cV6P3RE1+PMB8K9c/hIfj/13kuH7GeX4cBwDmMGExVeLhoce/ldILZQhxtKMlZm
	72safm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvhm-0000000CfPe-1LP1;
	Thu, 10 Jul 2025 18:09:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtYy-0000000CJUV-2BSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 15:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752162715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
	b=celLluoZkFwbxr2D/qEZ+uo4KedZFjqRjf2EAXMW3u51lT4mUpHP5jZrksh30oM1G0XVPw
	CpVUeFGvH8XJSTFf+3oCyaj6lAAzQCwMa2vKE75/AnPx6l6Obxsf4uHepqmPRzBxDQxeNQ
	AbxJIcK7gazUPBFa2b8C7g64+UBFST4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-3HziiptvMMmPTYSM10Ps4A-1; Thu, 10 Jul 2025 11:51:54 -0400
X-MC-Unique: 3HziiptvMMmPTYSM10Ps4A-1
X-Mimecast-MFC-AGG-ID: 3HziiptvMMmPTYSM10Ps4A_1752162714
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-702b5e87d98so23402576d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 08:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752162713; x=1752767513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
        b=UJ+DdoTxKTTPt8yea0AKIBwIqk73GQgUMSQd/dr3El7k8Z9lvMBGT30aK7xRlr9otd
         GLFRrC7lPRShOqOABc1TKu1toMeQtekdBcPB/V1kefwYxfjGtyjTF88XB36Fcl8njnry
         mNxfiDK1hlumgOsaJwS1tPfYlc+oIRGjoWLb+uRuaZWgueFDHi9aJgkcAD2b01jS1QB7
         ud1+FSqFQncjK965xQfdbHH5u86rR7ZL9maoHztcjXSdZz8LsgPJy6rJsL2MBFHHVCmq
         VwP00J7tqrjjyxSOktrnt9imB+E2lXqyIkQ01LKoXa5IcgT2kMVLdSDWVABXyOkV4xyz
         jSow==
X-Forwarded-Encrypted: i=1; AJvYcCWPQtONWRuCtRBOMZ2l/REF8KusrExZuyRGpTLpvfzgH4HvXApKjZQplLOCjHtgRAzA/DYHjeTLSVmQIYSBK9qK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9s61c9oxZmX1dGPg+mNs4kJ2lmjDd2r0jNVubn8CrS0691VCX
	UTsTKAKHY2L5fYog0+aBlbS2HVctpNG/DE8S8mzX5biRWqg5YBoZqE/6WmSaBlTQlv+HjfK9fGy
	BMo8W7K8JuPoDkHgNRzHVxXalfFxWpWy1ZibX76KOLsJmN3vnh1u6moKvIyVX6b7aq2pg+dAIF/
	NuBjto3K1LH8tFvU3sX85AoMeI2bwNFMI8zG4EdViQHNLv1y72PTzd4S2aNFc=
X-Gm-Gg: ASbGncuga/hBIAlB4fT+9fbwU5T7bS21wL/iucTbofIsGyC+wzNUhrSHPxwz98X69j6
	x8wYkbTQNrYiO6LMyVNaQpAD/CFL0QNWorrEtgW7sZqOf+auxewpY/0qdGSCYEyv+ycFRY+04lb
	2HkeIoLdZsLwjjdJrOhDLvNlnd0X4gU6Zc5oRo0YwCoBGLu254evlqCQ1Y6ZVounsidhvGK0DQr
	K3Dh1x70KuzXimgfBLAhvJ2YjKKBlhSsV14Ga8qTuHizO6alm82mJIPPQy8eGQwWugDmwje7PSi
	5zXUGrR8B8rqaj3ugz/JxBcSbTkDQVz7G/9MTZ/udOY+qJkm0TP9vI4/D5wP
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109102006d6.33.1752162713270;
        Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETv8kKkAF9gRKcsuP04l5OSaop0yTF67wtB5mlM/oS84I84ISgz+5x5RQyUV0R0LiOWXu3+Q==
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id 6a1803df08f44-7048b904350mr109101146d6.33.1752162712560;
        Thu, 10 Jul 2025 08:51:52 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:51:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:10 -0400
Subject: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1297;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
 b=C1NOkFYk4ZvkSlhR/nJT1ZMxm1WrhT5fr4V1f6MUwtgu1IwsGHRhGihPJyKm/qfChcPciMqRX
 jMkYCRRA7J1Bi4cmmruZSnKv3HXP26MoB05WHwsHZzBAvqaIhMzvhGA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6M-ksLwPBcIXD1v7qtizltHxxp2DN9oCs6bl7JYsWLE_1752162714
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_085156_634298_5FE0FF7C 
X-CRM114-Status: GOOD (  13.10  )
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
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index e758411603be5157e468e8c076620d7c18661bf3..03838582aeade389d9a2d90cf9f03fad835f0733 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -69,17 +69,17 @@ static unsigned long clk_q6dsp_recalc_rate(struct clk_hw *hw,
 	return clk->rate;
 }
 
-static long clk_q6dsp_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_q6dsp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops clk_q6dsp_ops = {
 	.prepare	= clk_q6dsp_prepare,
 	.unprepare	= clk_q6dsp_unprepare,
 	.set_rate	= clk_q6dsp_set_rate,
-	.round_rate	= clk_q6dsp_round_rate,
+	.determine_rate = clk_q6dsp_determine_rate,
 	.recalc_rate	= clk_q6dsp_recalc_rate,
 };
 

-- 
2.50.0


