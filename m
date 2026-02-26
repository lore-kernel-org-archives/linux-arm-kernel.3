Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F793FD8FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=; b=V5byKu7UOFi/nnk76l4+ih5a16
	v8ShVzPgdpH17sedjKytBknLmPrmUC8sfyfgq5k+GjC0sLa4r1IGcdrh7QYw7V2v97O769GnAY5FU
	IiEBNUHTKtKpr7RUpXMn6VHuI68lMkliyK7A/35nZFAV6fwUoXydcsA5DJVu1mk04jvgwsFDBgHPw
	OsdWuyWQ+MB5iqy3NDxYcghIhGeQUsDAK2UzRQq8TTQYNFFdMtr0yMGCpxQjfWuYsJ2/AI2MTh02C
	WBvOBEv6LRU9N5WGVLTywIFwgeJgh6VU76KNEf9YRe93ImpbdD2sb72f3jocxFfjfEbi60yoFb6Qw
	8XxRgaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfw2-00000006wV0-0FMh;
	Thu, 26 Feb 2026 18:18:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvfvz-00000006wSs-2Sh6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=;
	b=floR1yESbuIFMD/cRZ9HHQ1WlLUu/OOjBEDch8ckcRbfgghhiq6kwkuvFDrB7+BBPFYJs1
	odZ3JHz3A77tIo6P3FBV6q8YSu6AUyqgcHN1+9iw4qhPSQMJtpIjNnUf7pafLLcogEp6To
	C0Jbza9g+8btFoIZTVL+sxyHGMbbMus=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-Zdjm3SdeMnqRsA1bK5FN1A-1; Thu, 26 Feb 2026 13:17:55 -0500
X-MC-Unique: Zdjm3SdeMnqRsA1bK5FN1A-1
X-Mimecast-MFC-AGG-ID: Zdjm3SdeMnqRsA1bK5FN1A_1772129874
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so914461285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 10:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129874; x=1772734674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3uV2/wAdMeM5qH5oqiOK9IOTmbJcovH/H1PireO6xM=;
        b=ugakTntqJpYzRk1VOtlWJ61cghZtDsbca7yboP1PSBAnUPFgoi+cqhioV1MmdWaelf
         1tbRqAqSaHXLJfPjFpHGI2+SnrjpV+SzSEuYNK9l+Upxv60zM6j5tcAWnBS7avl5w3Hs
         vLtv0AVfIb98ix4R9BqMTc/yQrlP5cVtOyxlwUKfqyVahtwBLSrM/whrTC3UFZJSA7r3
         h079hty72xeDQftuvrDOZVRL0RC94Q2iNkgxKmamZMgp/m9L163jhCoOCvitpBpfPJCt
         YwW2AgwzkkiuiKTQUqDxVO+iQsHnLv4x52WT+fZuihqhj/csrcIIBN3q+Ks3RVcMJqTE
         MZAA==
X-Forwarded-Encrypted: i=1; AJvYcCWTfdJMGAwQb0ef0qNw5s11I+PvF65FJ2D2YB4di7Ara+GOMhsAW08uLYVTr+rzox4GbRGHNo+4Yc95eN2hjuJO@lists.infradead.org
X-Gm-Message-State: AOJu0YxTjOVeK1wb9/vOwwhMwiqXyN+K54LJyZKOVb1ceOGoKpfnQQJF
	AC9mQDNNWv/Qol9daCbVGTnPHDPRFS/7hdmpzy7OQ3JaGiTDhesL3IhmX812J7hS3gHK6WP8q8c
	BQf1ihmtbLqnCsSXnti3LIPWU4gNrmYyY+p9czEvJ4HHxK/8ZnPvC7cMH+GNofwav/3yBUzlIxd
	nf
X-Gm-Gg: ATEYQzxy54gEXvqT6ZrTNL1YYzVXuUkQ46yu9fcIbgPSGhJSFhN07LVTT/XFKfGC++w
	R1668yixkW9b9nWKluYVLZrn2q8xIbG1z/xYwLVq/i+vbnv0sDJvsNhenWYLVD9C+4XFuVCcl+O
	K1XHis/fsjCheGBKg3ff+f+jPXOJgGjJNSJZxzSFQUEu4CuKt75RTBkt/AKWuHU33GS7hRjfCv0
	gg/04BV08MGD9EyD+4/7WcOIWconIoqf+wfZzSi23Umrf5aZkZEULAwE1z1kBkTt9Tu67B6kJJO
	KaxzHFwW21Gpp7TBlEkk/1zNBSskEmXGG4kswsnMVgWXLbg1ILqFzMEnV+hsbY6xmQH8F1tXmI4
	yDdxLdOTa3xbDkndqpDn0js/5+JZZb+pi1l6gvtQEBK15pH80decPvAvNPRGi
X-Received: by 2002:a05:620a:40cc:b0:8c6:a707:1b52 with SMTP id af79cd13be357-8cb8c9e673amr2555085885a.4.1772129874488;
        Thu, 26 Feb 2026 10:17:54 -0800 (PST)
X-Received: by 2002:a05:620a:40cc:b0:8c6:a707:1b52 with SMTP id af79cd13be357-8cb8c9e673amr2555080385a.4.1772129873991;
        Thu, 26 Feb 2026 10:17:53 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:17:51 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:50 -0500
Subject: [PATCH 06/13] clk: imx: scu: drop redundant init.ops variable
 assignment
MIME-Version: 1.0
Message-Id: <20260226-clk-det-rate-fw-managed-v1-6-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=TodRKnNtjx7goYZ9pZValLwSYYe0U+36cHd1VYB3PEo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9Omz/9if9mBCnqkMh94+5yWMMk+cJS1CyharLw//z
 s3D1BDYUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwEROJjEyfBaTZ29cWDSZS/HG
 x7ORv9LX6G4MKXByZTmjdCi607FmBsP/oL+rljKc3tHXVud4P6Il+PIB9dclEXF/Z0Yt1b3lvPY
 NHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UmidELr39HLhCk42Gh3feOLS01hyW9uZiJLB2gexYCk_1772129874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_101759_702478_B96C3516 
X-CRM114-Status: GOOD (  11.41  )
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

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a85ec48a798b58a12f893587c85709bbd8476310..a39c68d664655537e81df55c7e6d32304de9338a 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -475,7 +475,6 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	clk->clk_type = clk_type;
 
 	init.name = name;
-	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)

-- 
2.53.0


