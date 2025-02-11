Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E6DC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 01:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Ah4k5+xQ1fRNUu+6C0S6nP1nA7x+T5drbERSfhVVRE=; b=AFlnwpxlda8m+EOPJSzqnVhEZJ
	UVjIWo/d+JhzIuuFg8yROBob5oT9JOABs1tYwT1sqp9En4fitAp2qKZauyUAqCaFmBzQe2QT3BJ8C
	onoZdMGd2HJaqF1do3XWJwpPLiZO2ZZK83bMphrK0dj6+wy9R6u8T1qP6nQ8zTdIkzD2Q6s+zXhn/
	Pm+9wYZFO2Rkh/oMcj6mes9w9Zm1TtDR7wNUqEo//dAvLOfOCCpDvzZzEP/PgY1rpiwC0JULdWaHM
	BiNmak1SA71hIdbAafhX9o60XVWrnQnhBCz8YbDOMjT/4PqLCy03DJ0mdZ3uNTZSdRl83xCH1YFdr
	QX8FDTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thf27-000000026Kt-0CK1;
	Tue, 11 Feb 2025 01:25:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdqD-00000001vfX-3nDE;
	Tue, 11 Feb 2025 00:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4Ah4k5+xQ1fRNUu+6C0S6nP1nA7x+T5drbERSfhVVRE=; b=BVHETZJFanUyA5R6wQBWTma3vs
	WflVLqOHP0lO15ZpSNLyYNRWd6Gh23C7LH/DbRgUJB1yY0kmUd6JjQV7kbCSS32TJYunPeJIT6VY+
	b4ptp9JcckIXobzh+alBwzdjnQlDW2WDedkwdvlAm0+c25p2++LXS/TZDny1hdDbF624HkOiIvQO2
	VXNrNlfkfUhrQwiYVGOPXmNZ7GBGINIEix0aNJNGHdPQq3okY6bT7gBdf8NZtWjAyidJGUKbux8kf
	uqE/HoH0cPZVag5ctk9evfa86dL8yyEah+vkY+lA8P4V9ON4pRIFU80PcsRJVXK2f2HzA1LNjGYf+
	T8hjGZpg==;
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdqA-00000000NtD-3BjP;
	Tue, 11 Feb 2025 00:09:28 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e44cb7adeeso3734636d6.0;
        Mon, 10 Feb 2025 16:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739232561; x=1739837361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ah4k5+xQ1fRNUu+6C0S6nP1nA7x+T5drbERSfhVVRE=;
        b=Z7YVIPMs07jJwActJkRMKLtK4uv84h8N4TSTMD9c22UBRZ4t/lCN9YURtgoYwzq+Tv
         vwadczRVAbTHq+VnKohtkfHotFzY1vo1LY4eMePvSGudNdfT9NZwB0IQNs/ULQaB86YO
         BYCWXU2iOxkiM2Lv1m1DuhHXJig6wngon3s/RJNe3KdKTBMoHRCQlLTuGZhHoq6w+gu+
         SZEXtxhzxUX9f9wYgb+3R7+IpV0qEimaqSW4KYBojiw3vhfmerCitdjWoMbtmP3Iwvzn
         OybeIJksmZyRZBMgtYg1215i3vHg/EeKXdBUl8gquXVbW49IUpsO8XQcZIiCYlIkWofj
         QJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739232561; x=1739837361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Ah4k5+xQ1fRNUu+6C0S6nP1nA7x+T5drbERSfhVVRE=;
        b=KKg/wfk2S/95SQyvmsFp8wJqin5fPWb88FPets3VpePVZtROXGLAQYowpxTKPwKYk/
         mkPRCOZ7o95SAepqXsE7XcIyWV1rouzcj7AS543tsZCDWPTXL+XyAljDo7h0AED5Wy77
         KXcvYvpDRpmyT/xbT8du62K9jmgmowt5S7vIql+djIfSO+JwkEyq+FgTsqovzKQj0lGQ
         AU5x1QAlNnOM7CzRlsEEzTqFuCGxIgzLTFbdMyl0YvoOnS9nTDgqlpFvGXB8gkQgW4OJ
         9LaYTsaWphwiwrob7rQgWM/8xfJuCykxqqvrcLJlMwOMv1rh7UuRhVkTBNpSXMtYwPSd
         ojVg==
X-Forwarded-Encrypted: i=1; AJvYcCVfCt9rbLvx+B5G5ZQQVAGZP811SyAh7HNbRkShWzaSeBxDx8uzBkPt6LuUNYPWUKWa7q+h89oAPl2n3eTBZIUw@lists.infradead.org, AJvYcCWevsh2C+39/gsy0ba5RhtgJS2kflc+sM98iy8HWnS9Z6BHGusq9seAIoaIZJrMhX6w1ADGPjZeGqgLOF8HXxfi6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVdsAvuOZpDyMSmSyqjodlWe3xVn3t1LiCKPmF9q7/nMlwVxLB
	coKIekVKp9moY9xdJ4MoE8gZrmFVNNMLZMagxvAMXV34DQqb+70=
X-Gm-Gg: ASbGncvpWQ1NYTy0Y9U6CIjHjyVXiQKWPSTz9w8kREG5HL0DNoxAau+DfaVWmMFLCC3
	FvuRbtYckLnp3M9WT1zXYz5NCmjV2+VZf/cpCOa4/3fLgLU+wh5Fnk64vvGVzJCmlvorK4LkjiP
	Mb7+LSolHxdPz0x7Fp6nnO3u3wI4oYKwbsOWk7kesC9J3GMaK+9cgmgoPJt0D8AB2Gw4xJPrwSv
	q+iGUyAv4htwE4Pqsw9oybWSy854E/Q51YoMhMIQzl/sR8IKEqn0VhJeU9m+bKgbRh424UDFwS1
	SoM5BcqKrASC
X-Google-Smtp-Source: AGHT+IEBNymajCc+NwMXIImuo+y111CUAjewA7syDuazHuJdvT8SyYtv2TQjZ/rPxap9qo/cAU2erw==
X-Received: by 2002:a05:620a:4150:b0:7b6:dc5c:de5 with SMTP id af79cd13be357-7c069ce9f4emr42655285a.1.1739232561394;
        Mon, 10 Feb 2025 16:09:21 -0800 (PST)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0603216c4sm173032885a.97.2025.02.10.16.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 16:09:20 -0800 (PST)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	richardcochran@gmail.com,
	dave.stevenson@raspberrypi.com,
	popcornmix@gmail.com,
	mripard@kernel.org,
	u.kleine-koenig@baylibre.com,
	nathan@kernel.org,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	zzjas98@gmail.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] clk: bcm: rpi: Fix potential NULL pointer dereference
Date: Mon, 10 Feb 2025 18:09:17 -0600
Message-Id: <20250211000917.1739835-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000926_978338_DAE12B68 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

The `init.name` could be NULL. Add missing check in the
raspberrypi_clk_register().
This is similar to commit 3027e7b15b02
("ice: Fix some null pointer dereference issues in ice_ptp.c").
Besides, bcm2835_register_pll_divider() under the same directory also
has a very similar check.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 0e1fe3759530..720acc10f8aa 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
 				   "fw-clk-%s",
 				   rpi_firmware_clk_names[id]);
+	if (!init.name)
+		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
 	init.flags = CLK_GET_RATE_NOCACHE;
 
-- 
2.34.1


