Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FC1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=svkyQVAUK9Tk0TyurgUHC7rUmk29GdL4jMQcYPSE8LA=; b=g25LBSs5h6niApDk+Hfu108PcT
	K04N5qiOQE3D1eLu4DLnfSS6F/VxIvhBAFvUZgcSl7pDcgfQThmFHgYoqZnS17BnR/gVJTBu0BdW9
	ODqmcRtXKe7bXNhk8BKZ6He1qdruZufM12DvTsfa2uI/UJFBHbKsXxb0HF+Oxu6NZoYIcNrRvxVDx
	UheqvbIO3dh3m0ujoioxqCr898jBDBolZECIRpccWoxBlm/cHQ/OM6n27Xs3qHOjrwXq59LXSVrqP
	UJKDbqcHYzkBU0NwJAh21ePgFzc4ltCDdctLYtmG5YEfAC9gPM95bOr1Ocpw7OMu2Tjeio5hbXbER
	fWhUpMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMxT-0000000AL8n-1DQq;
	Mon, 13 Jul 2026 20:08:55 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMxQ-0000000AL8P-2Gci
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 20:08:53 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so3752732a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973331; x=1784578131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svkyQVAUK9Tk0TyurgUHC7rUmk29GdL4jMQcYPSE8LA=;
        b=pzrrYRwkm3HnHdXDdEWWZMJgBF1mU1AZTR41yKk4Z1/px32zv4Tr12fl8EF3l97/JL
         XyuBzUwZJwdZRDsCrsOn4SzyoL4ijIkmkbq45JW7L1lCaSSpb6Mf+YtzhG23y730kepH
         o2AKQjAJtF9LyG0RLXJanjGp7cj/lAYEfdbvQxxDiNg0guSJJpZUF5BqVLMhYzdNU9fq
         n3fRwwOhpNtl9N4t6pKRQg5yha7zyArHN/6363YvDDERtyjn/SXnIpLdtiaEpUhJdL/u
         1DhzbriJwwNyCInEzS66D5yNohpLNJlidTzwOIlYUvX55C5eeYwYypcOewAOyMAPVxqQ
         v/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973331; x=1784578131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svkyQVAUK9Tk0TyurgUHC7rUmk29GdL4jMQcYPSE8LA=;
        b=FYOCEYAOGqDz/KW59zr+vSiKccZZ3OQX700X9v2KB+mDiJZJZozEV8YvYViE3DnjVi
         7+Lh/FI6WvY3tt8u6J23YajzwrCoxV7cHmhlDhKbBEEPXBna3mISna++s35vpmuEaf3f
         4HCMEWpDDARAwV3pYPWzfGp86v0TX9On9yP795Rt5tWhSVrlJqdZHKOLaA+yqAvTDWH2
         pqVDagomGA6Sp8Vxll/cYz1WJvlbKTYdZcHooDMKDy62Nis4G7CFaDqIgvKo1wdi82qZ
         K1q74k/VtXk5/NPppavrR5Iy5l44/qSkmsNJzltgdii0xr8a4+JTiiZcy6E/4qn/s+sk
         q+wQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwUa0sxiO6dwNP3Qan+EGtL5Qx4CHNfqHWgV6lg5vluSn49DO889fiTBATgNAvUSoZ5NO7DQ6ZjXQLoIH9Hcow@lists.infradead.org
X-Gm-Message-State: AOJu0YxLk57XSPQBmRLuEzo9awIqO/BcelMaZ7cf7JYf5QsTyQFpx3wG
	86fdfCyNHZz5viXeerfIs8yTV/EKO8HYw142oj10gJ8AkBLH3GmoTU6I
X-Gm-Gg: AfdE7cmEuvdKo9fotVFBetagjbWCw60rAdNqHhFVi9p7x7a+Js6JLeK2xOJ7LdLVWhf
	5nGXa1jSgpg6YjXZH4sqALEMNoht7rvzjpGp8lcmefPDTXaMERRsGxc3HfTN5u6Agh/rCedwu9v
	7llqwLdMmhTAY5fnE6rGsbv+tRElW0WOQAWsGFxShYxrLYDK16xpxov+P688wIBEEBckBAqzQcd
	OjPWXwgg5OanPI3k/QAYkQ8GvwZj4kROsUbJEwz6mhdTQmxu9wFfrvpRlEhpBXZbMNf14b2w1jH
	mOVLahTImOL+33oBlcQSe0zob7l0rqOetqJ06fKzFdjD4m2bf+h5dFTaXsfujUjsSGlI3SoDMes
	PCT4PSY59q2oexTE8gcVSrOc2XOz9oG8s+IJtEnSMqtyy0YUA03u1plZrZPHv6f03D/WAMs9uOz
	OgLqkJn+FHodHBVH6D/RFleKF3ZQY15bF0xtBT114YuIgh3qLxKxK2fsH7hSDZoocE9isch3xrs
	+Ym6yZfid8DqkCiqkLB09qWR4Tr
X-Received: by 2002:a17:90b:4c4c:b0:38e:dc4:3f64 with SMTP id 98e67ed59e1d1-38e0dc4412fmr2193622a91.38.1783973331046;
        Mon, 13 Jul 2026 13:08:51 -0700 (PDT)
Received: from fedora ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm68238202eec.4.2026.07.13.13.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:08:50 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	linux@weissschuh.net,
	krzysztof.kozlowski@oss.qualcomm.com,
	tzungbi@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] leds: bcm63138: Use %pe to print pinctrl error instead of %ld
Date: Tue, 14 Jul 2026 01:37:32 +0530
Message-ID: <20260713200732.2470666-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_130852_603870_CE8BFC94 
X-CRM114-Status: GOOD (  10.94  )
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

Pass the pinctrl error pointer directly to %pe to print the
symbolic error name.
Detected by Coccinelle. Tested by compiling.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/leds/blink/leds-bcm63138.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index 45c0662df933..12b70ee31b9a 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -236,8 +236,8 @@ static void bcm63138_leds_create_led(struct bcm63138_leds *leds,
 
 	pinctrl = devm_pinctrl_get_select_default(led->cdev.dev);
 	if (IS_ERR(pinctrl) && PTR_ERR(pinctrl) != -ENODEV) {
-		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %ld\n",
-			 np, PTR_ERR(pinctrl));
+		dev_warn(led->cdev.dev, "Failed to select %pOF pinctrl: %pe\n",
+			 np, pinctrl);
 	}
 
 	bit = BIT(led->pin);
-- 
2.55.0


