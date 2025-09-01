Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2331ACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWJdOsASsTVaMoPyxLoTcgfSjvqU/yV2YgCFw0wJex0=; b=W3M+PeoLjTg/JOxLWJCL6Oh/Hk
	yXvs5rxXpZ9jKOkRMd0LvagMmoO3yaupmvMp9hWRkWcL+knN7a9aSH6MyVQbcLp9msaR8Xn7jNl13
	yuEq+ALjspKl3vv9w5n4ta8dkxU61V8ltfNY+63PfU72SkK2NSbYEF5ybUGyFk9jfdgFtTpQGAt6H
	hvjaE6Egx2wWMZY0rierYm/dqxRUDknN3IxK70daxMVONLpsf86wpL3Uoftjqw/MACEMpf1KK5c7n
	BG5K/Bk0rYmw1G36TqPdUyGct9QZGGEbpuKsEbLKp81yjNrWRRc5Fmbp5hEHr0S5f4UzDqjLb4Z9h
	qo+zPEHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFFh-0000000EXkg-0FJU;
	Tue, 02 Sep 2025 00:52:01 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut78e-0000000DEUT-1ol1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 16:12:13 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3379165e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756743130; x=1757347930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWJdOsASsTVaMoPyxLoTcgfSjvqU/yV2YgCFw0wJex0=;
        b=O4WTWCLDC1wx1Yh/YnQJhbox7uwO/lbZS6des3bJMcUJVaZZ3VTRPe6/KV1C1cQjwM
         UV0PnlhEPYLw0fz2/zeciR3vRxzZvrke4QhjzU2oECvyM4MSXPzrHgJ6mPot8AUKGNfi
         4DZfY6dRVQ4hWXNBgYU0gGzNL20CJBIZXbjuXhaJ+FDdO/PFJw3bHxR/EfoIAMsJK8cz
         Gz3PXxH92htGtXRJxFTBkS84zZyQOKOUoUK/0UttH2Dh2E8mK9InRObyrpZhNcdFvDK/
         rXbbUU8kucWVCdNlLvmB5vNwVwWbpVT5wnjyQNrHF9EpPCsy3FQF4b6k81fiDTBsHNe3
         6GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756743130; x=1757347930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWJdOsASsTVaMoPyxLoTcgfSjvqU/yV2YgCFw0wJex0=;
        b=CLN8lzKzx9RUlZ4n1lLNnEO4p2yFO2a3YWfTc40FPbLDePcRVZE9FYFYtpQSCRBiPl
         W9sZUXyNfwunmKsgId/arTkJEVDjDNDFEuqS3RxxsusN+D7JpIjHusn1wX/SHaNUA6EQ
         ah5pRGl4t8V/KsVBpM3dei+K78wdgL8znjodnlU7TgCRVklVXsHuBqUQaUp8+m3ZwB0y
         hk4udpqJw9PF9GHn1VkY1Zs7ytkrwrDBreKa5UWVcmI13F01j4xsiO3KI3DLueU/BGSX
         CJyBscNGtK/C+d0EHHi06ORhb6AUFcyzFZ4t+UoYiZ8kHiHeKFCRQf3Hh4QSk8kYO9P9
         BsgA==
X-Forwarded-Encrypted: i=1; AJvYcCVeWiTnPJNqnQ2WbyaQY3KJsb7u8A0lecuFmpJhOWYIjg7nDeusc7NOy2Z2Ig2BGwmPQpN1SrO0RONkL5fexQA2@lists.infradead.org
X-Gm-Message-State: AOJu0YyRiaXhPJt2pwt6HoSWTA8hYUqcEBnwBS6ZRFey+uK4iv47kx1S
	F8R2MPfCdiDdr9rHHO9fKSFX83byF4jpVD4e+Ch3BlXtMV/z4C0kL+15
X-Gm-Gg: ASbGncvNtlbms0ShkEKaKeBrIBZ9WLjwtpftQptsc0Kwc3EI6KRxbRppLJQmVao4xL5
	uiZz8vsqObqqmrYxSTGnnwlWPYrBsYSDGVhlPPeCxkRTXFx/XzpJq36CCebIzKu22HjB7gjzW2q
	mEfNZ0Cqp3KzNZuH5zLZDNmK5O0yAagZx8PJ4jk40EMAadNjGP1GHx0L+Nc/w8Iq1AnhX39j9HG
	y9XzAoLqc1fn12rO0ailUiQ9U55t7tlPzXALj2Pzt+hIs/QrBuIwvTQbrodD5psFFoDpDfz96UH
	Pk9k4Dyakp94XncDvKaxJgNLC5Y6bTzT89Gb34jOjKgBpyJavMoDfjWmMeSLCBkZNEfMU76Nskn
	bg5HGGDOQmLou4F5A4OP98wSbzQiA/Z+r5isv533+lE9DB+/3supk
X-Google-Smtp-Source: AGHT+IFTWMLUEQtnoB7hpFoQRkFS5VMsX4Q/s8JYAXjx1U98mhPYfLJJdrhBQSzQ+nV2fqe4Mj4VVQ==
X-Received: by 2002:a05:6512:448e:b0:55c:e806:6508 with SMTP id 2adb3069b0e04-55f7092c3e0mr2292770e87.43.1756743129896;
        Mon, 01 Sep 2025 09:12:09 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6771b237sm3028827e87.54.2025.09.01.09.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 09:12:09 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firmware: arm_scmi: Minor cleanups and documentation fixes
Date: Mon,  1 Sep 2025 19:12:02 +0300
Message-ID: <20250901161207.2501078-1-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <y>
References: <y>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_091212_472670_43DEE34E 
X-CRM114-Status: GOOD (  11.36  )
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

Hello maintainers,

This small patch series addresses some minor issues found in the SCMI driver:

Patch 1 fixes alignment and indentation inconsistencies in two files:

Adjusts function parameter alignment in protocol_id_show()

Fixes debugfs call alignment in raw_mode.c for better readability

Patch 2 adds missing documentation for the xfer_lock spinlock that protects
access to xfer buffers and transfer allocation mechanism, making the code
more maintainable and easier to understand.

These are straightforward cleanups that don't change any functionality but
improve code quality and documentation.

Best regards,
Artem Shimko

Artem Shimko (2):
  firmware: arm_scmi: fix alignment in protocol_id_show and debugfs calls
  firmware: arm_scmi: add missing spinlock documentation

 drivers/firmware/arm_scmi/bus.c      | 2 +-
 drivers/firmware/arm_scmi/driver.c   | 1 +
 drivers/firmware/arm_scmi/raw_mode.c | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0


