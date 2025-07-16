Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B2EC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 20:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlhGcA1+SMRJvkNTiF59+kJkm2bBxNCy1RLn8jrW2jg=; b=Kc+gHcXjeSvvXs+vmuFessECTY
	AerRLggAiH3gNh9mndAG5KdwvY/NR5klBNx1W3eHmBEKaTA5IhMOm0+3zgfoiVaeM753BZfpa/r0c
	ZbcFkpo+VmhM3MnbZix1QQV5OLefU0WbP+2NOKIebljQKPe+FmPkrkkfIxUvrNsOdqTSyD3QI/3el
	/RM+R0mkerf7BuS/iNjNO7CBuWqEZVpCk9Jao3dknrqoEuZZRgD5zd8z4usCENqd+LSwIfiOL958D
	SxKX248bX1jH9nBog9e6qwIIh/JAZUqs9F84ELcaI8EtsuaCGsv+kIxaaS0ax45Bzaj8xad4XF5/D
	dkFoSgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8yz-00000008dET-1Qgm;
	Wed, 16 Jul 2025 20:44:05 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7wu-00000008WA3-1l7Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:37:53 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-40a4bf1ebb7so201203b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752694671; x=1753299471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlhGcA1+SMRJvkNTiF59+kJkm2bBxNCy1RLn8jrW2jg=;
        b=AZj0h7goeCHZ5zpDjWJfppUJgCnRMuOVN+PLjxacoz4QqF+m6wnBYambDL/FoYbupg
         kpmQaSgiGeSRuP1AIC9RdwGZsa8lY6iUi3LaJ0gtzw4c1PSuW2fhmFd9/cC6lkPuRD+i
         Fn9+GgMc2DdZoW+DJsu+ALYEf4pRp6WpyJpoTABcZSHk67xCsy+Jn5ZbVXqDmagC+Dai
         O7oN+jAZARZS7i09aEKXEqnnbmTxIGwl+aLaLY8XYTRKb/hddYOBHr9pE9mFuEEWiF05
         L4BEBzSozkwQPdhp9xitiD1NBy6sNwBOpZuewYXEtuRXI0FYtl1HrYfQ2ewq7h+wBRsV
         bLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694671; x=1753299471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlhGcA1+SMRJvkNTiF59+kJkm2bBxNCy1RLn8jrW2jg=;
        b=KRJnMt2+uPmQiDf2GftPCk0jZjCHqcfhvpMPDh9JisaN4LtfbT4TuwVGKaKW8f+r26
         ZJB0DYbKrbcdRAE8kyJ9soAYejKgVWXfjOkT4syP94ZUG8f5QlIsATyKixqChtLnwlT8
         OLOBp7dvR/41DPgB8WdJbxDx6FCP0WIJu5jdRGZk9bPVQAXJMExuuNUYnvV3z6H29Dsn
         yqvw5DiiAqyT4DCiSuRw0RadUYT8hZO0P9scd3Dd7OwhpO5vHshP8hV1+7n9jTkaRgSw
         CmgTbNBK2VLFyV1ov7CMyFa/HfEyMjBf3mGqd3SxbVeUBNLE7eP4ZgG6xm/A0SzI0+YP
         CBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3o0mt0vLzv89ZTYr1FOsxqLZkjXl7cpKlv73fsMJU8facEZxjqkYL6Yody8kGMQKGsMlmdnFbriTiV1+dQoq3@lists.infradead.org
X-Gm-Message-State: AOJu0YzfePGfKvRoMnT8vRkYzz6H8mZRXfQDWmA/H85hjf8HIyQ+96km
	25Eyi46Y3Xm/kyBAhNoetV7mVZW++KP2gZQlWmuvBOq+Fy704u1Akd1koLiMDl9ljSk=
X-Gm-Gg: ASbGnct14ohsnPbc+ZD7ZqXmAATPr4k88NEHPShQ7UupDZh1I6rJjaaPcOfqepHjhHG
	R5UFFskULmRX2lAqG53NBg4BZbM4xBY72BsmQcnBBpIyVUNBmzFzIP9/B7Kjt++0tVKtsYE+tpo
	XXSu5kjOk+Nue0q2hsXhK6boCdKJdZZZKYUY1krZnV1oAxcco6Z4lpdauJ6+Vg6cZgkP/xA80vw
	ggnkRmalRu//jHvyqa3ov52K1YfHBVL6jTEDmliZ8h3DFSXynN7lV3sjW0zz9wIuROcrAvmaKzv
	+iTEpto0bkVOx3ZIyhE7FLAX4ghiExDx3Risg95NRHqynjRPk9sEz/5g/qAXEjmJTiu4hV6gqCx
	p8OOqw4S9tS1DUpNPIc+LCFGIEEZRlA==
X-Google-Smtp-Source: AGHT+IGGKvJLp/fhPwmU1Q/9ypsIGaSvfz/Mhue64rW8YBuOSpnqPTVe7w4asOutp9MiDek7/enEMg==
X-Received: by 2002:a05:6808:1a28:b0:3f8:d2f8:d735 with SMTP id 5614622812f47-41d0545fc7emr2878205b6e.33.1752694671547;
        Wed, 16 Jul 2025 12:37:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff111c3776sm3762394fac.8.2025.07.16.12.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:37:50 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:37:49 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] irqchip/gic-v5: Fix forever loop in
 gicv5_its_create_itt_two_level() error handling
Message-ID: <863a729f-c57d-4ebb-a23c-b22bc720642d@sabinyo.mountain>
References: <cover.1752693640.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752693640.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123752_471435_E5E3EBAB 
X-CRM114-Status: GOOD (  12.81  )
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

The "i" variable needs to be signed otherwise there is a forever loop
in the cleanup code.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 340640fdbdf6..55360ae9f1f6 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -191,9 +191,9 @@ static int gicv5_its_create_itt_two_level(struct gicv5_its_chip_data *its,
 					  unsigned int num_events)
 {
 	unsigned int l1_bits, l2_bits, span, events_per_l2_table;
-	unsigned int i, complete_tables, final_span, num_ents;
+	unsigned int complete_tables, final_span, num_ents;
 	__le64 *itt_l1, *itt_l2, **l2ptrs;
-	int ret;
+	int i, ret;
 	u64 val;
 
 	ret = gicv5_its_l2sz_to_l2_bits(itt_l2sz);
-- 
2.47.2


