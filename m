Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF683CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm4ooCobJ7IPas/H5HYQmks0EaS+ndM5xWuuBgOopDI=; b=O+pa84ODVwbMjO625uh295ym3u
	3OYsPPTwXKVMeLqUMzg2KigarZ7F/bmHplNX+y/WkaREL6FpHw4IcY2kRfaQOCMFP+uIEvruOM6wi
	BS9pBA1tN5PCxQACdJBFeRfNPS9Ursijm+FlI+CNN6Rv/4+XgFpVCguLSjLatQ77EDZaTgyE8zN7T
	WZV/1MH0Dc6qOtks+lMlITYreld62XzmxIMYm2Wj88XCno8ty80YIc84iHDe+xP3CFe7eGJf5PD4y
	IVmxuyUc6jYLR3zPijWc5v1D+YwlN7JMvcL0LzVmarjF4/zt5cFtA4lpsUu78K17rg4zWREcentzL
	dt9S6hLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hhk-00000007XLg-3DhV;
	Fri, 17 Oct 2025 10:29:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hhj-00000007XKy-0Rix
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 10:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tm4ooCobJ7IPas/H5HYQmks0EaS+ndM5xWuuBgOopDI=; b=b3rZP2wN8gUDdkjIk/2YbMqnmO
	KzpcgAANhmcNgcPk5O2BGQ7uaOvwO2NAAv6AI8cMZzmFL2KYxWyhj5yf+Hoj2vpe7FtNSvLXrKRbq
	R+iCPSAFPfOKslbbeThWcluNoH0KucTJMxKgOdh0uTHRcNzuugJhLxbFEqPZ2tJJzWD1BPmh8IYSb
	7ta6t8l7qYwbWEls9AdDPBZ0KoUEZZbt0eeI0utWfEOS7wE/GfAjYTkPUiWdszPdHRPlQ4rLmrx4t
	cHS2ypY4kB3xtRCK3uTAdWYvZ3BvMkSabLEtYad8du11Y5D/lKnIQt87d/TFaOMn0AAP0dlfCUUoq
	lymgO1+w==;
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hhc-00000007TNN-1pqa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:28:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760696920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tm4ooCobJ7IPas/H5HYQmks0EaS+ndM5xWuuBgOopDI=;
	b=WTP7GzL8Jy2nRkV6hocOqUbWXZbhCRKkOqHe+t6d1OQbf5VbtuwnkhqLudQErrb9qS8KL5
	zh3c8jlGz7QWguxAbuGDSiipAi+VxUm7WNAVLXsagx2nnawqeVpVQsApfOLEYzSvAexKNR
	b5EcZTOb8D5EZlcGWdoAnif1ghCoDug=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] stm class: Replace kzalloc + copy_from_user with memdup_user_nul
Date: Fri, 17 Oct 2025 12:27:44 +0200
Message-ID: <20251017102743.75394-4-thorsten.blum@linux.dev>
In-Reply-To: <20251017102743.75394-2-thorsten.blum@linux.dev>
References: <20251017102743.75394-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_112854_571413_D68461AA 
X-CRM114-Status: UNSURE (   9.48  )
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

Replace kzalloc() followed by copy_from_user() with memdup_user_nul() to
simplify and improve stm_char_policy_set_ioctl(). Remove the obsolete
comment.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 5834f796e86b..335bcf749214 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -733,18 +733,9 @@ static int stm_char_policy_set_ioctl(struct stm_file *stmf, void __user *arg)
 	if (size < sizeof(*id) || size >= PATH_MAX + sizeof(*id))
 		return -EINVAL;
 
-	/*
-	 * size + 1 to make sure the .id string at the bottom is terminated,
-	 * which is also why memdup_user() is not useful here
-	 */
-	id = kzalloc(size + 1, GFP_KERNEL);
-	if (!id)
-		return -ENOMEM;
-
-	if (copy_from_user(id, arg, size)) {
-		ret = -EFAULT;
-		goto err_free;
-	}
+	id = memdup_user_nul(arg, size);
+	if (IS_ERR(id))
+		return PTR_ERR(id);
 
 	if (id->__reserved_0 || id->__reserved_1)
 		goto err_free;
-- 
2.51.0


