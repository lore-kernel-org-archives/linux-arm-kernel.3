Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40B9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 05:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rogkgLiMxM/qpPu5zNxUF5knwWkoakJvFVE9RPvdc+8=; b=y2s5TEVrGUt2Zb7IGhseszBPj6
	IQO9+ZCwI4mFu9i1B3BlgB/a2nK4t8gaTdT13gOLOljE4l22LgerOv4h6yCOe36Or3XAr+JVC82GF
	gXGD4JvZJlY9HBp/8Flz9W+g8IqNG/w3zjFjMmVo5asuo0YjiwKdycFKTt3H40PRPHGp6/pH39cU7
	jaWx3BXXJExgdQVQECb22Dj4DD6rE1nDoi1LF55r9fbgg3UtfEaT1klLh18P10+PNFHNb7yub94Ed
	SU9eEcRSF8eCY8bYm97/pqky70bZuRGCkpe6SijTF3UJJaaR3ErnFAGjRNCXZlkVDs8GhMYuiWNpE
	+2k2P7hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taTGA-00000009PXh-3lhm;
	Wed, 22 Jan 2025 05:26:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taTDT-00000009PJI-38Nf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 05:23:52 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2166f1e589cso156914035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 21:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737523431; x=1738128231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rogkgLiMxM/qpPu5zNxUF5knwWkoakJvFVE9RPvdc+8=;
        b=M8DgsE5qWvoWSp8UDBzohciUPRLGnDE1dEP71oe19PakLkKHUBkKbLoikJELGGrhHV
         KP5dOTheCYD+VinmpONx2tprg+uOo+mi6r3u2iKDl7KSbgqc75DfURDQF8vbfz3s6FCT
         Jyi2PuibXNPgfE28pckbvMxU79myFxM5huEcS/AsPN//gcF0f+G5AnF3+q2sr4HNX8er
         4BVYgeat+kEdIuwDZWCi5zgK4oB+PSDsXBCFLthEmblskxlbAUlDmzaHzSfVqQjAP8tw
         lidZkX4oZ4LTCv7c4lr6WkuxEf302syoofg1TgDU/BV5bjL4qsfEo+RlmjQ06s0zAB5o
         7ipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737523431; x=1738128231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rogkgLiMxM/qpPu5zNxUF5knwWkoakJvFVE9RPvdc+8=;
        b=lczVNLEuTzIpgryWzFZ7eSzccLxywrrdybeFeJGJ8ajOcBR9xRJfeQczXcOyVXxKnY
         HpafJXHkoF+D/Xbz2FlSWtcHSNe+oG1t7L/tcV+biDVeZk21Yd6q82mEE7R46b6BIpGe
         Yd0tt6Wdfo9Y1L4jcEgc5OoaTncKgxvb7+aZpHCVHvTjGlbAPOX6Nk4HjCMqBoyVu7Up
         /BlO1f7N2e2C1s7lRngnEnWXHCpVVWKoPlDl4j8aAqcxPS9XKgaj8DotYUFsXy4Y6BOF
         f1XGlMGOOjc16I2WRQQrvNlaOhwamn5nHl65tCg9uaWKs65EJC0g9WJLWlBHj6KWJcBI
         Uvug==
X-Forwarded-Encrypted: i=1; AJvYcCXu9cNG6sbblYAxlNuEHIzC8bCI5KEK7QR2VAJLmCBHIgw2lheA6HqYntAy5ho+gOjqzaKQEG6VoPXs3xFW8jfp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2KAQgWezTQHnUZwTtQFr34OrH3mkVaAy8QdYqo65ClG3gnpM9
	+USuWRE2iIfhnjcufmBSIaxTUTlA5QmFlD8MdYJzdrMzlVxgUuegTD5wi7G9leo=
X-Gm-Gg: ASbGncsS9mmRKPFHdaONZRXcsrwuCXJmOYLH7wZPNrNdJWchU38NI/A6FFkHJcYiV3H
	ovB0wyYSSGIRO8eceJ4gRPD02aOyJTnSH6+HiI4k4ahVHY1OqkElhcxarEth/8GIebhQOu2zuso
	TIXArkHsoY2cemaTnIEFW6TpP243KMRO1suAFo0zSomF6hB5/K7eMCNT2tl/MlK9zsNNwxzN36f
	ChIbfIyTk6ZtqvRPSpz3vnNx00QIZACByXV0J9/WyAHQQv0oI90vPFIURVGw6pOC7T74Qe4
X-Google-Smtp-Source: AGHT+IEPqDe1yqvKzBLjAWElqaZtpyjXL8Li25l93tVo0G95bXnS1JRd6Jcj8OJjonQqW0E4kYj2Ag==
X-Received: by 2002:a17:903:2291:b0:215:6816:6345 with SMTP id d9443c01a7336-21c355c4292mr312338035ad.16.1737523430910;
        Tue, 21 Jan 2025 21:23:50 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac797sm86139995ad.155.2025.01.21.21.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 21:23:50 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firmware: arm_ffa: Allow multiple UUIDs per partition
Date: Wed, 22 Jan 2025 10:53:43 +0530
Message-Id: <e7990bc3dc128e5056c3bad381e548a49ab67c81.1737522729.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <0bc7e1754db0547c6c041ed178cf24ca326af2d1.1737522729.git.viresh.kumar@linaro.org>
References: <0bc7e1754db0547c6c041ed178cf24ca326af2d1.1737522729.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_212351_787549_3BAEB1E9 
X-CRM114-Status: GOOD (  12.58  )
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

A partition can implement multiple UUIDs and adding the same partition
twice will fail. Don't try to add a partition again, if it is already
added earlier.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b824c7c024fd..6de941821319 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1389,6 +1389,10 @@ static int ffa_add_partition_info(int vm_id)
 	struct ffa_dev_part_info *info;
 	int ret;
 
+	/* Already added ? */
+	if (xa_load(&drv_info->partition_info, vm_id))
+		return 0;
+
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.31.1.272.g89b43f80a514


