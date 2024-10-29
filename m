Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15305D13590
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NoTHtDAF6ws44F47OVjGKPN9wXynxJNwGjXwFS8SeTg=; b=AogKd9/eWdW5QILsbmuXgcXg5B
	N4nm4NcRYFkUlAZ5ssnTkxYUMf2NQoeCG2CQm5y+gkjHCWRLAMZyfFR0ns54pBYDhUm/2pHCa/eRy
	xce4kMImaQvAYD7pOYLbpBkltaTmMsy9QAixvagPMnNSpQN3kStk4qQuMvszdHk+GU6K0b6Betejx
	ex2tmLzsfqbvexBjgJjsbPx85emjgIEspmm01iM/P825n7++CpwtMFm2dE7GaagDGfDLuePqbYybV
	AqeyqqiGgre4DflDHn4rHJORLwTXw0bK/197FJJUVbf1cx04AJ8QZwgwNg95/kcvEzFls+03UXwAb
	I8ccQisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fuQ-0000000DOKk-0AZe;
	Tue, 29 Oct 2024 06:40:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5fsn-0000000DO6B-0nkt;
	Tue, 29 Oct 2024 06:39:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20e6981ca77so54580545ad.2;
        Mon, 28 Oct 2024 23:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730183952; x=1730788752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoTHtDAF6ws44F47OVjGKPN9wXynxJNwGjXwFS8SeTg=;
        b=cuRk4mrwXY9ei72SGNL514TzHN9CFkJ2+CcYVLXUsC/w28Tivhg47eDCww8p3atLq9
         3K+i0b2uy7H/KJ7U5CyU07Z9MaEEzxwagzABS6XfLtiGbs964eQnuoyhPAgQoMCjaItd
         MEjO8724xqpwxAAZdnrlJVfAAEumu/JEWJ0U7ZF4BMZBERhZk0oR4Jp0zVjO4gSXtmpk
         9QhI5Nv3OHzI72ioIfFlBYyDk5KV+KXSZk6trhxYlzOHg7Uyawt4U3BMn6Sb6ObTSCAf
         GnFifW3cqTLO2eFxBS6UFncyG0ookPks63MvN7F9p0vrLAe/8qSLFnnJbVatXidvZlFe
         e9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730183952; x=1730788752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoTHtDAF6ws44F47OVjGKPN9wXynxJNwGjXwFS8SeTg=;
        b=vQf+oD/zZvmJ+pg0ZJiOPXgCGVj5RDAwu/nJnLDAGMkyDV9U5BGqVuRVMzfqyAOgLT
         t32fCsH2yW/GbEBiVLr3iCTt4OXiHfbgTFF8fa3pyxQEX9qgZRg0JE8JLssYYHyBHZxb
         KRpBd5uGBJURCAfhy7Y5qRBuvtg/d+C7W6YubaUgz2zYxMorEmIPNUNNw4LMydcLQs6/
         HzN4N588+CkfeDVidIw0kd9lyeuESi75ByUp1SXQI+ORyETfuvEwIFouPIOLHa1BkKKB
         1L1DSxYbbiLjH2Z9rrBhvr4bWssGaPHI7PkZ32vGUo79+VgHaJ93L1V5h2MU5fyvaVCk
         upKg==
X-Forwarded-Encrypted: i=1; AJvYcCVoITTdthTlgqXH9ixO9dEROwRmVLgS6u+qRg4fWQsPyeNUTITS/g6c86Pwnb9zloOoBYG+wVX7vQBQEa3gGIE5Aw==@lists.infradead.org, AJvYcCXmWSszNtFO0j1nA5t4GZQO3FCTMUpY4x+o54I21XeIdH288Z0NKuJnlWiYehOya600Xw5QsWbVjfuAsxVqw5CD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3g7123LvmpNPa0kQMGnie+sPFuEwZqRmUg8qRpxRhJzJknisW
	EmXI65XFHiicF96f01FAymghwgzaPtlSFBfXRnhfy380ekKHf8iR
X-Google-Smtp-Source: AGHT+IGgiP7oIWXuGp9Me5fkVVdBioimX2YIYTbB7y0RxwXTtVz3gXwarihKlTlWpugpq7ix+Xj/5g==
X-Received: by 2002:a17:902:d48b:b0:20c:bff7:2e5f with SMTP id d9443c01a7336-210c6893180mr145648635ad.13.1730183951697;
        Mon, 28 Oct 2024 23:39:11 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02f16csm60340365ad.209.2024.10.28.23.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 23:39:11 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: vchiq_core: Remove unnecessary blank lines
Date: Tue, 29 Oct 2024 12:09:01 +0530
Message-Id: <20241029063901.1857067-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_233913_251195_BAE4BA69 
X-CRM114-Status: UNSURE (   8.61  )
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

This commit cleans up the formatting in by removing extraneous
blank lines, improving code readability without changing functionality.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 9e56e34ca4d9..da18c77f3cab 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3486,7 +3486,6 @@ vchiq_bulk_xfer_blocking(struct vchiq_instance *instance, unsigned int handle,
 	if (vchiq_check_service(service))
 		goto error_exit;
 
-
 	status = vchiq_bulk_xfer_queue_msg_killable(service, bulk_params);
 
 error_exit:
@@ -3624,7 +3623,6 @@ vchiq_queue_message(struct vchiq_instance *instance, unsigned int handle,
 int vchiq_queue_kernel_message(struct vchiq_instance *instance, unsigned int handle, void *data,
 			       unsigned int size)
 {
-
 	return vchiq_queue_message(instance, handle, memcpy_copy_callback,
 				   data, size);
 }
-- 
2.34.1


