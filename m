Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B921C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCr73Arn7lW8l2qhlI4qEFhffjvPwgr/9jG/meQTRwk=; b=tpmchE9FLHiVGykNZI0JPY22zH
	Hmft8C7TLXO3Ra93oOStJjMoOisbOyxJSrcUlRzvVk7zDPccjpb5vOX0g+jO5DUW5t+2JAKcDAi5e
	cOMzunRpVOjAEks7tnQmk33OI3kz/0jRr+iwWJUW+/hHha1HeRk4qJ4kheRYbCUQqNdUP3TLpPjES
	wxSFE1MAz5JWU2NAvaOy8MSCETMJUGXRqjII33CahRlkmirvVEvVDZQLJCAuPufV+rb9VysfY/UyL
	PxQt/8yIFx6hQPOP+u4gb2SHD3aSNJPjLjpYEIMhQ+zMX423eMCVOMtZEYL1L2tLxG0xWLqe/UOdD
	/D9v7TAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2RV-0000000DS3F-3IG8;
	Fri, 11 Jul 2025 01:20:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0uX-0000000DInk-3mxm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 23:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCr73Arn7lW8l2qhlI4qEFhffjvPwgr/9jG/meQTRwk=;
	b=jCCQFwrS1F/HKg0DyAsjV0BZ/5eX7CG9/92dRHavi03gk/Cl4mWhSRtH05wc8egL9Miph6
	SAnz2S7+fubvXLDaaBGzGPcjWVRuX4Hga6dCOfdO3CaAgFinULPn0bpwK9fxF6txIxQVDM
	548t/zNtYWpi2D+33DX2s3lQBf9zras=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-W383_TRzM_m2ohjteRDs7g-1; Thu, 10 Jul 2025 19:42:38 -0400
X-MC-Unique: W383_TRzM_m2ohjteRDs7g-1
X-Mimecast-MFC-AGG-ID: W383_TRzM_m2ohjteRDs7g_1752190957
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-704a8024e6aso864066d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190957; x=1752795757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCr73Arn7lW8l2qhlI4qEFhffjvPwgr/9jG/meQTRwk=;
        b=C66UAfr1QV8dfTcqbvWKSEwJrKY6HPqfik7qe0ifKyzZ3+Wy7wLH3VtQ9fB39/nbR2
         1qyagu4STxOdttEFk70wkjoAmtUj3u7LQ7cse3iYhJcU4rR83qs35lWnCbrG5BqClREY
         Ooe1yFJT7vEkVahMhPb0rAqTeodFrqkVOsHm84GIl9Ya72/AVFtcTZ8dE0shg0AgALEf
         1ZzkvtnR3O008be5j4uHR13bMlkdIg+R4W+n/a5P9Kv2mPBssLxWLLb0fGytbYOJbCNe
         bY/qHZ/C0p9TTnbKZ699g81bBWb0rzw6inFOLj7omwYmAnCMAiYzy68+ZnkaGQwxkkSo
         +hvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4mj6B1vyz3suaoq25c2qY0DrQUytLY+Vr0SCcaTtI1QkcWu7MnsIUYaPx7Lpvn1eJgcsDffJpD5VJL/BWRCPd@lists.infradead.org
X-Gm-Message-State: AOJu0YzvaYFO8lCE3fpXurSgMI1woE1DcgquqR7+pZCyqLIyyeYYBIFb
	nUzPSgMGAdE1PbQwqEKaYZI2fXtb0nYwzp4o/Ng25hxhphCiNCJzBPS9bjNkFrGXy8vk6MrL9g1
	Enptbt6w9PuNa+nARAmEhOOeltkLLNhwv8fkdV0r+i/+VyKz2nAJujZxLZ5z10a+rsAqjF7PIK7
	sj
X-Gm-Gg: ASbGncu6pljFt5M2l0dnWwRgdRbgCaW7WRR8d/yLh7xF6puq6sJJ4CL8DMA5TKCpjHW
	Q30GpCwtDMgjgrUjcwZZYjcBCNnTFCSLA4ir6JF/j7qzQae4PwL1IXMDCwHba0saLMKriMz8jX/
	MoPGtODhDjTD3/DZZTUAAhnORvNeyfqB5DmE0Tcc1VicEWu3TBLA1f/NdFlQVjV/dLSboDJ02Xz
	TIUagUOZDzPirlRc3HbtcutAq44ooYC267GcDt7la1c/kDZdWyTrG7X51RXXnkm/SKEUB9VHT77
	Ih5lysO4FQ6OaznExX707X3TCP8aMR68rSYJZyE+0oY/ImUR3kHwjccA+SxTDr+ZZJW7eDmAny6
	ZIJY=
X-Received: by 2002:ad4:5b82:0:b0:6fd:3a4d:363a with SMTP id 6a1803df08f44-704a359027fmr22077686d6.25.1752190957620;
        Thu, 10 Jul 2025 16:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLz6ZETzSGQzjCyDHW99TpL/CMMlr/fLIeK9Mwj1zXQh8KrDMwNBRoioYOOVVqlEpleU2jMA==
X-Received: by 2002:ad4:5b82:0:b0:6fd:3a4d:363a with SMTP id 6a1803df08f44-704a359027fmr22077216d6.25.1752190957272;
        Thu, 10 Jul 2025 16:42:37 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:17 -0400
Subject: [PATCH 2/3] ARM: OMAP2+: clock: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-arm32-clk-round-rate-v1-2-a9146b77aca9@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=1927;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=EUcAkc+MwYYvI7xJQeU4DcisuArrrCwBemUDYG66Ivw=;
 b=N+7e5WUdWe0eSqdVYYqPWF410agqUBM3oaZotQ0G8zXJXUkdVBjHFser4LNyGdI4AwRnWbRfy
 5UkEbXLMQmiAkXM1KekVeBLxlTf9LNC8v14IEIyHzxm7lTWB1d0OHWe
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FBY8EIVDRzR9EmG8dCP3-nRIFaFwKZTV0R0q2OrptdQ_1752190957
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_164242_019288_059B2566 
X-CRM114-Status: GOOD (  16.70  )
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

The change to virt_prcm_set_ops had to be made manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
index 011076a5952f0bfb24eadd13b8991b41b8115bae..96c5cdc718c8b9449a4372e1bb83582eaa91440e 100644
--- a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
+++ b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
@@ -70,8 +70,8 @@ static unsigned long omap2_table_mpu_recalc(struct clk_hw *clk,
  * Some might argue L3-DDR, others ARM, others IVA. This code is simple and
  * just uses the ARM rates.
  */
-static long omap2_round_to_table_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int omap2_determine_rate_to_table(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	const struct prcm_config *ptr;
 	long highest_rate;
@@ -87,10 +87,12 @@ static long omap2_round_to_table_rate(struct clk_hw *hw, unsigned long rate,
 		highest_rate = ptr->mpu_speed;
 
 		/* Can check only after xtal frequency check */
-		if (ptr->mpu_speed <= rate)
+		if (ptr->mpu_speed <= req->rate)
 			break;
 	}
-	return highest_rate;
+	req->rate = highest_rate;
+
+	return 0;
 }
 
 /* Sets basic clocks based on the specified rate */
@@ -215,7 +217,7 @@ static void omap2xxx_clkt_vps_late_init(void)
 static const struct clk_ops virt_prcm_set_ops = {
 	.recalc_rate	= &omap2_table_mpu_recalc,
 	.set_rate	= &omap2_select_table_rate,
-	.round_rate	= &omap2_round_to_table_rate,
+	.determine_rate = &omap2_determine_rate_to_table,
 };
 
 /**

-- 
2.50.0


