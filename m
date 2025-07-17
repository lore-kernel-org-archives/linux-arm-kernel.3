Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82302C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lq2qXRTV07ZyxJO3VWSgjG7vTWGiG8uJDpTR4dmthYg=; b=j9/ow/MeKMVGT+w8t7SAWDBbiR
	iFsV/sIsUysF14sUDC4lJv4HFo8qRfdskXSP3QLKiTn2NhtqAb6FPeiJCanp9rzCzYIBDDQodgRwL
	MaapBbazOcIhPbcyYglbtjW9+M/jx39t2el0vt7l9Cp9khrSqTadf0K8kHkVDsC8sJmAHsA38k4AR
	0Q2nF5kLgdzj9SCNTQHrwwZo7yjC3QvUmU/49G8zVPHT9WU1/OxcuSRpNUInIm43BEBvzfefOekW+
	NOD/NqJPTIjmtKbrcQGvbPm1o4r++6QolM2SpD1YHX4lTUCkNiS9i5UNVYy2eDXwktjxH9BdbChlq
	Jf49u9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTjj-0000000Awle-0tRz;
	Thu, 17 Jul 2025 18:53:43 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTbt-0000000Auv9-1q5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 18:45:38 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-72c14138668so562207a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752777936; x=1753382736; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lq2qXRTV07ZyxJO3VWSgjG7vTWGiG8uJDpTR4dmthYg=;
        b=IQY/+8DP+r3j1OAQhO/xLRCaHF2u7icWBZsVp/pMmdXDSOxEu47kBAJJaQPVOQSXy4
         4JXDsS2bLy8dyiptZ0WZdPkTawcIMibMsWOaaskQU1uTAGa2zMPB54yDMpr44BRTTmxx
         6o91GE7L12fItS0ZW38gRhfbYcN4RqVZCBg9Mhq9KqrOAP39vrPikNejT4VuQLkUS2qN
         4cTNpnuqoNQisDfe611MmArS+UAl/w/pLrv1LnmcfpCYrwDcue9ZiJqEjHYVbDjKdmjH
         QSG8CKhZywAGZk77J99cLfS5PrSeT0QgXMN/B0MucxkujBLBZ8yvNHNF8boq5YQpdUzS
         XxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777936; x=1753382736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq2qXRTV07ZyxJO3VWSgjG7vTWGiG8uJDpTR4dmthYg=;
        b=N9GkPVpkr8ZRNLE9QTMb1lRqru2sHhkby1OemizsrnCz7u1UfEn4GdmbT2iJYyHo9D
         UJYb3sY9d8wRCmO7pWI8TbVtK/TNOh263CUyaFnljQmVKAL8rho8dUwT+p1Y7IeZogfF
         M6z6jh9WAw/c3LW6jbpLPPZyNjT0irnGmaWScfwt/2hU0as7tYWYtlSdkk059ytz7l+H
         NvEfJ3K7jr90GViAhoxFwhiATu6MHpEXu7Zx9MUbrfGlrTzu4lX6xMNnKjxgWLArP219
         vHu2Er/LTt1FsRscv7YHtgWpXRXpUz9YjKzNvdOzKo/4GCmbhMXmo+jgacjBdXXw2+m5
         tTPA==
X-Forwarded-Encrypted: i=1; AJvYcCVEggok5Pm200fNfHv82JYqoAMFrKZAS8DdVSnrQVSiJejtZv0FfME7wUxemWyD/T6NXOXO0N8nxEeMNi9w5kVo@lists.infradead.org
X-Gm-Message-State: AOJu0YwTAWzKcs5VFj3LsGDh5kDspI7+ekg87r9R/tJextPvLu94yNlc
	9F6Xm9MOyDiWQr9EaZ4GrnGAB66pjmjB4iU6F++YskkJZvRTtaz41zVw3iqs5jl02tE=
X-Gm-Gg: ASbGncsj68vVwPV3w26xtPgI6aEm/KsRXpH2T1xt0RbZdRAh49aMU4HcVUZlIiEI/VX
	DP+MbzK2sFBJ86U/Tr0He3vn935jgqdrUIQUtRGgPgosO56C8U1W0uY8Aiapp8VkcYm339BqiJO
	xbD85W+jIUT19SnnacOQFDcr64PVx/HJ1X1z9lYGIZyZ9bEKA10F6VSSr+dtoZDA+bi1Baq+KlZ
	VPMKmfw5KDqYXno5PFVgqLt/fFlIKoohzjHYgHofAg4B3pGj0XIOra/o0YKSY7GsOLhIihNaHBI
	TPdV2prFibAQlDJp/9AYDGjEXdOPCgUEIzfa6tGD3hTMLWUBAHKvh2Mjec+VtnlL80fU2q+pYqG
	P1EsLFJFjW1Ufw9+2ZqrmLVFVKBZGAA==
X-Google-Smtp-Source: AGHT+IF1kxsKho7uNfC6NyyIk0SBA2f3pmyOLP/AFuxSfjIZkOdeUcU8zmuAMfH4k8S2Dr4K3Gc4KQ==
X-Received: by 2002:a05:6830:43a7:b0:73e:54cb:1ddf with SMTP id 46e09a7af769-73e8337798cmr6187a34.8.1752777936530;
        Thu, 17 Jul 2025 11:45:36 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1982:bb13:46f1:2e60])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73cf12b62e8sm4068736a34.60.2025.07.17.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:45:35 -0700 (PDT)
Date: Thu, 17 Jul 2025 13:45:34 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] irqchip/gic-v5: Fix forever loop in
 gicv5_its_create_itt_two_level() error handling
Message-ID: <a6dd885a-5a1b-41b5-9673-0d42f7fa929d@sabinyo.mountain>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752777667.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_114537_474283_82F696A8 
X-CRM114-Status: GOOD (  11.86  )
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
v2: no change

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


