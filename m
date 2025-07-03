Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D342C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 00:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=; b=N+4ggheqqvNK0Qd1JcXFf0dcAU
	MjnHC67YvinJZ/h0NbHQhwLWVezY4XmnEyzG8UTSU9gkUV2mFYtsPYWpdq/IozAnDRbR/OA6f3PT0
	Epcu6WEkHsaagsqX/O6j4+naIccxv3KEsB9ILd++mbBc/+TieYKfNXAL0zk/2QPHWCvxv37fVDSqq
	3Csglg5H2d65WfeLrT0XyRVe+XKH6mBBdXxHA4dua8HlK8lUkLP8ZqX0HnWiyTvVbhFxJo+EtDdUJ
	rsgdwolX56a177h4iJ+Fa951F2CPJbzt5EZPey8U/fzDgS7n5RyjQei8dCcQm5odoRI6cQb0C9slV
	WP+SL3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTtY-0000000Cu0S-3eOf;
	Fri, 04 Jul 2025 00:03:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTID-0000000Cove-17j3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 23:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
	b=MTsi0+kxOzeWt9L7uRXgqErGeWXsLBQhxIF5fM7sJ//nvGw1q3sX6lknJfYo//nlIQww0j
	s1Gl+AIb3HVSQmo5YY/NJzkuplIkGuemHueyRO3pW0j3HwmYNfDDcAP3jIpQbTsnG6ed7+
	zenOc/40cBkQoxWfZHiRGPY9gMdyFBI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-SoqSqbdhPMyNHNaklHpV8A-1; Thu, 03 Jul 2025 19:23:09 -0400
X-MC-Unique: SoqSqbdhPMyNHNaklHpV8A-1
X-Mimecast-MFC-AGG-ID: SoqSqbdhPMyNHNaklHpV8A_1751584989
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb1be925fbso4680566d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584988; x=1752189788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AzaXolkpwLeUXX6Tltm5nUeMgctbaGRt9VbQb3Als4=;
        b=oS6C5yNo6FXFrBPwfF8ongqM02evu8KF05eb2+d08UjOT+91b0Ywk/bqMVZaSOswTA
         y0gf+UE3MMPAgRJO6Vg5guuwCyEzMChFUUpmlCyINMwUTh0Wx9yiQ+8RUkft7rtCrZXl
         WZh6KtTZa4bQWsX8T9wbcUVtLQjiA8gBT4Fes7m/TrdKD8Cs20RSC+9yBk2EFpW3+3t4
         YRy3+FqAKel+B3ldN+DaViqIqwrhDdZWdAvjRE9XuZPjjeg0Is2UFX3hpmogQrEZQKmF
         erY9GCDmeKZpcQuSLZe5kAspDZ5dbSkdygowTSSV8tVlAQ4QfzUPNEeKk7PZKGkSwgRF
         gwrA==
X-Forwarded-Encrypted: i=1; AJvYcCXgp4JKzfUTwT1hrxMgCma7+wSZh6axhRkQ/jbAXtdIEFkaCPSpOON1bueGS7hYEp8Z87IKww7Q/YKNwidCzeoL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6JSCOcfVO2NmQKpDE4QNBDpirY+NrYoVaI8Rtp67hQ1PT1APN
	SST/DKOFsbM4c7ppQQmUqnJ4lLlEgGhsPdW2XQLHt3E9/FBeivWu3Rm7Pwd7o8Bsvxeeq7oFGw/
	R0eW3FsbmQHLKyPWvmKOiexQM65TTZN8iVwIP8zSFKdbrL3FcrCvty+seAc5a9M1Etwgswsuw7a
	EO4SniRTbNtWuCvkhobujJCKOj5Op8bZ4P3Drf6Rs8YK6X1tvdvu8ZYHk4zZY=
X-Gm-Gg: ASbGncviVXQw2GH5f8jxopG5mdw1ek783/Ru41xaD2VOBjJsS7IIHJwB6ce045rqWJ6
	VVOqh6Av33Pl2LwJn4+yyr6lRNyRhIVuFPrVfK5HEtI8mgJIc+m7NcEEwrU368CpP5VoE6q8Vqy
	PGMBiUxhHqkQaUfeNsNpK+hZLs7wZG/HNBpjfuqqqKfXAlJNqxTJsHkLmvY6FWdpi90hfkeEjZG
	X450+zEUdD0uYAkfBhyquQXt7XNj3LFWayXzDfefg0giZLN+CUBxpiAAAgcyQ+Kulq8Qy13M3Ip
	BJcfOjA7/HEAqnuuw3v7jIAA8Qm3mM+hFDQywStkceTM6c06LG+ToN8h3BvN+Q==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3029246d6.32.1751584988605;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENUtIQTiH949ayUO0n64DI+W13Cd0LYVyie5G9b3GrNFyICIYDd0Xx0nCu+hVBZqsPuJ4DLw==
X-Received: by 2002:a0c:f40e:0:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-702c6d89379mr3028786d6.32.1751584988220;
        Thu, 03 Jul 2025 16:23:08 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:27 -0400
Subject: [PATCH 03/10] clk: qcom: rpm: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-3-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1752;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xV38q5FTl0giHcO6B1fUUKKklwS+ypfUiAE8QJ9ufs0=;
 b=svr9/D7uxrC1Dyo7FmzxHVdb3SQ3e3f4HK+SsFrtv7eZKxGDXZOMRTNco/2iQ/OKe5mC+FRhE
 8ilIx65qxJ/DEVqiPHJ60/E+M1hDDeodgGsGMkUI7YBfZ4ZMx7XNLc8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kjKit1iCplEUiXKDDMT3XLz9z10GCmIGzeAhcztyCx4_1751584989
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_162437_406635_9E2B242D 
X-CRM114-Status: GOOD (  15.46  )
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
 drivers/clk/qcom/clk-rpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index ccc112c21667ebf8522b06b37234f46c69b07698..be0145631197bea65438f3bed10344f18d6de802 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -351,15 +351,15 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_rpm_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int clk_rpm_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	/*
 	 * RPM handles rate rounding and we don't have a way to
 	 * know what the rate will be, so just return whatever
 	 * rate is requested.
 	 */
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
@@ -383,7 +383,7 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +391,7 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.round_rate	= clk_rpm_round_rate,
+	.determine_rate = clk_rpm_determine_rate,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.50.0


