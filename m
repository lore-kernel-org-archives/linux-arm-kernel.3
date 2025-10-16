Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75A5CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BTjbXzfdMPFmTq5CiXRvNts61W+d2MXa+OQ9XQk41MY=; b=qtMTWyyWeAOIlxgSYLCA07vNCf
	5D5alleGP9d4e0zwHO9mW9gVzYYADtH956v0TbGblt/OT/HqqpYhxDaMt4ELJF8yL6N9w2c404I+3
	DUsGWkzBpSfFUWzlz6RVc7SPiiZx3akVrbBGZ10bU3DuS5GPo3EBkr3mDXiptvDH7u8r3hw3z8YZF
	xRXaguwIcEcTcQnUZDijyTuUBAXpMOrnQPHLmgTPUaQ/VsypNeR9UKnOhZAoItvAhIxxk/4J/UOFT
	Dq5M56qbwpOfiukVmcFCqW4zcpTaFU5RmLNQZ5g8M96kfat0zpsnmDYXCSX/lsRs++B2O1zne+xf2
	scHirtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QWn-00000005MgP-0opE;
	Thu, 16 Oct 2025 16:08:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QWk-00000005MeZ-0bf5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760630908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BTjbXzfdMPFmTq5CiXRvNts61W+d2MXa+OQ9XQk41MY=;
	b=eCNCO+tB5BFK+2aDJW4rDHpzG3wZ4QATfmf2MaOyOwesV4YF6DRUCQ+1QUBORXIMWBBb4/
	N6pHnxZGZMUZYE5My3fFQeJKtAGM9TZ0840MX2jcwHuzb6bZ4cDjiZXF7CBPvdqLhSrodR
	ElKlpmRoLRhaAcXmE571VE9Lw4ufS+M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-YsGrGEl1NqCIJdoR7mx70Q-1; Thu, 16 Oct 2025 12:08:24 -0400
X-MC-Unique: YsGrGEl1NqCIJdoR7mx70Q-1
X-Mimecast-MFC-AGG-ID: YsGrGEl1NqCIJdoR7mx70Q_1760630904
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1cc5a75dso24479576d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 09:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630904; x=1761235704;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTjbXzfdMPFmTq5CiXRvNts61W+d2MXa+OQ9XQk41MY=;
        b=k3j2s6KwPv38SxNprkn0FLGRfWBC06C8EoGLhTHOUrYWqBmnwF2XfXYQkw5Ht0id0t
         8Ykf9mJvKEol24ydbHUw11NBxW5Xr7lknaT2kyxpggIPaKrzQcYrybj4HoLEwlYS4SY2
         Fv3hqIFGrxkpSqK71B82ZawEziNumw9L8jkhrfokPON1X7wpjChrFdv91vZh9OdkLvAW
         0pyPprOsoPUEONi1VlkSw1kabGKql7KvBKZmGa5ZmALRAT9gLk3CZoNwUb38a9gPu44y
         VK4n2q++TJd4wdKhbomlqtU0SLFS8Ma28/R47Ghi6VU5BS4bfN2bMYs20b9uwyvLluZa
         cUJA==
X-Forwarded-Encrypted: i=1; AJvYcCW/vMkhV4N9eN98sSSFyIsJiMPIaZHOP+xm+yEmz5KfDzfKlPKQYhtVv3NALboaAkTDriGx6SIzoQvNAu72ATj9@lists.infradead.org
X-Gm-Message-State: AOJu0YzlT78Jw5Zaj79xbrv2MTSH4dB2LcAAgYdIYWCPMNZOZF82WFxF
	FoPvCjXYEhJXPGZDfEgf25b0U7G6dJD5OBBwOXes3x0s9T/j2bJIvkMHPevNLE79Irv6EEzaJ1m
	yDxA6rK6zxwatdcWE7vOvAhp0KpIqxp2KRtW4t/Zff1jxWatZ/YufutcxtUtpgS0E1/ZcURfFtG
	r9
X-Gm-Gg: ASbGncvpKhG87JxhNs6CjE6UWd36FDU2CzW5GgPJlVPDBnjN7W+Nq+3dnRDVYHa+Tqs
	VVnnhbiBkS8CUqBb84B+r8PGlafu1dqGLfGNvGc5JBcXRoLEA5fKC5b/jy7z0xblRC+E+ajWtrY
	Sj7+t9gBKp13gX7KS+w7LoFXQOn5jVtL/o/ahTufzLW4z8TJC4xNx39Q1j1sb1KOmzKWfnEkA8c
	y9o4zJi09B2Oz11EC/Pi7LxJs5IJqeKqeXCqysVokle0AdWnV0QRl/HiLAsy70jrX2EoAkO+Hcy
	OS5wl5X6rTiJ0R9NGqhJH3PBpHvhTwTPkuxk7Fggh6eZsCpNz97VOdGs8OV/bQU462lLyM8VHWX
	aTOESYY2wNdf2dz8P+h2s93nVz4+oGHKd9cygEKoETUqQu36zC3yww7JDEvzBMza4jBmoIA==
X-Received: by 2002:a05:622a:130d:b0:4e8:8a5e:6dc4 with SMTP id d75a77b69052e-4e89d3e7f64mr9077351cf.79.1760630904322;
        Thu, 16 Oct 2025 09:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtZrwo8eKunqrW1ZX26p0P/KX7TpXb/FgnwTi4CXt26VbUSEz89WMw80Ziq/vE1CwQ6xEdig==
X-Received: by 2002:a05:622a:130d:b0:4e8:8a5e:6dc4 with SMTP id d75a77b69052e-4e89d3e7f64mr9076761cf.79.1760630903879;
        Thu, 16 Oct 2025 09:08:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e89e723033sm778991cf.36.2025.10.16.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:08:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:08:12 -0400
Subject: [PATCH RESEND] i2c: busses: bcm2835: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20251016-i2c-round-rate-resend-v1-1-96dd1d725e8f@redhat.com>
X-B4-Tracking: v=1; b=H4sIAGsY8WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Mz3UyjZN2i/NK8FN2ixJJU3aLU4lQg2yAx1cg8xTzN3NTIUgmot6A
 oNS2zAmxutFKQa7Crn4tSbG0tAIG/XihvAAAA
X-Change-ID: 20251016-i2c-round-rate-resend-0ae27d7f7529
To: Andi Shyti <andi.shyti@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1W6726b6s8hC+gJBj2Ljp1SG20lHiAdl2ClI15dwHqQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SpRdj7zNMjvRJearcyn3jvcCybGbvzCpT/zf80RFZ
 bakgINVRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABdxZvgf2ty/NiPw2Wmf3y+k
 wjw/Sgh1SvIc3c68oL70Vk3QcZubjAx9KQfdhaLOvZ/5oe8Kx7O0/wkzcubZlK+NmSm+fW6363Z
 eAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bFPImW2GM35AECZrP08mdBMZ3UW6rKJjEN4wnvTjtW0_1760630904
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090830_251203_407FBA7C 
X-CRM114-Status: GOOD (  13.14  )
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
round_rate() to determine_rate().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
My original posting received no feedback.
https://lore.kernel.org/linux-clk/20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com/T/

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/
---
 drivers/i2c/busses/i2c-bcm2835.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 8554e790f8e36c5a1cf56c0aab8556b377f2bbdf..0d7e2654a534e92a529f27fdc049812359678522 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -137,12 +137,14 @@ static int clk_bcm2835_i2c_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_bcm2835_i2c_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_bcm2835_i2c_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	u32 divider = clk_bcm2835_i2c_calc_divider(rate, *parent_rate);
+	u32 divider = clk_bcm2835_i2c_calc_divider(req->rate, req->best_parent_rate);
 
-	return DIV_ROUND_UP(*parent_rate, divider);
+	req->rate = DIV_ROUND_UP(req->best_parent_rate, divider);
+
+	return 0;
 }
 
 static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
@@ -156,7 +158,7 @@ static unsigned long clk_bcm2835_i2c_recalc_rate(struct clk_hw *hw,
 
 static const struct clk_ops clk_bcm2835_i2c_ops = {
 	.set_rate = clk_bcm2835_i2c_set_rate,
-	.round_rate = clk_bcm2835_i2c_round_rate,
+	.determine_rate = clk_bcm2835_i2c_determine_rate,
 	.recalc_rate = clk_bcm2835_i2c_recalc_rate,
 };
 

---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251016-i2c-round-rate-resend-0ae27d7f7529

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


