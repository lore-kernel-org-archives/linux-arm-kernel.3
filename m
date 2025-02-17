Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704E8C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Td102jvjcyxJvAztEsXWW/VUH0CMT8UhqkeVVK6uLU=; b=ZHlf7FCF9ZtQ/V/7HeuFezUIU8
	4DokmJVUSv64/wNNbbe3J+TEVvY83zYXbt4ungjhhPs3iIYvNh32sxAlS/sM53qvQyAKFyErZvMSD
	q/yMDa7+2DT6YLGQRwBX3jHboRp3+UTJ5YXbEgfk9Jy3rz+GVau5eyrYq0b7Vl71TslQiSYIQ4/xc
	sriTJyUfzQwRg8X4MAHiFQpRbTaTEAhveRSbaomBC4ChKATkSilvDeAeivS9V7ZC2WGuCfDibQb+6
	0FUYQVclqWzHeXK5SomCdvm5EASPYxSwbni0qzA6txxy8J5nTgtpP3xPJtzxYrmIR1FiUb6SNlc0S
	8R7gT0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyky-00000004BJx-0SQQ;
	Mon, 17 Feb 2025 10:53:44 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCN-000000045NF-47in
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:18:01 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-abb8e405640so160943966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787478; x=1740392278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Td102jvjcyxJvAztEsXWW/VUH0CMT8UhqkeVVK6uLU=;
        b=Vqlh8rqtbj196p2BPBJX08E3cxmkhQ+Y16oxL3+Xay2l9sIJRgvdufQOyhHUQoYSgi
         sNrVMU4qLBcwH4fhbZZgiHWReqz/QekUdsA4tBZzQgtYwBnYmB2Gy+Ng2ewIwejgqWnf
         /AkxfB86ituszcPHAthhNnOz0sCkEVWvLqb6vcUUon130TUxon53AZNaI3aS9uSZGIru
         zRRvn4lbT8SqGtym0pp54tZlrsmN/2zIOQCBxLXntLewylqPETDd8jtzsgI6nnOk/A9m
         N88cXMeFFrke2M/5FyKplXT9r68dFdi7K5dp/GikTG3oOAx1ZWPrttQUjJQhsw2pMrl9
         H3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787478; x=1740392278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Td102jvjcyxJvAztEsXWW/VUH0CMT8UhqkeVVK6uLU=;
        b=MEWbFIjJVRDF49yGH+w8kK1PTZp7B/O6zFCuSHrROLmnkqB0V2Ugj7EMhgtR4gYu5k
         k4RVY3mH/7ya2nUmjrQMO3uN4enRsaP6CfboddpqYwSgeAu3e9LKZ+t6Nl1CoVaD35XA
         l+c/hk26W2kgiX8FPfrSeT1awEFIrnKMeXMY8liFXeRuH3xz0LY6kYiVq5mu9big+Ubz
         hxnleZPFiQHursDyAjKMvxE3JZgeSAg8Z/PuSzUd1e29pFsfgYOQRqHe0kR9bjk5YvUG
         KPmbGSN2uHWczXAOd2nr6/hS9RJGjXCuGo9tFgtWjSNzHL4is2+zFhaO2ujv7O/eSCbC
         eRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc3Avbsd59VtEpeHxne/cCxLm0T71JR8bkolziRev5KDObskV1fqD3kKw40KwBoc/lH5Tb180dUrunb8yexKHy@lists.infradead.org
X-Gm-Message-State: AOJu0YwokHTHokS411uf75MT8fL9X3qDWy6GAXGhEi9biQS+pRwNBMdi
	s7CLkOibbS9uQeKqYaeaYJmGIHfFMBTTXm/nE409kPqSuJTMahaEE/mk2svuyWY=
X-Gm-Gg: ASbGncvDHJPnEwX1rO7+BcYQ0kDqXwxGc8giQG3Twv+XSBXOGx3wiwHVwbvgrBiQFdG
	DSB2J7dk013Y05dkoOFeQfi471hle8azagLYdroTPYVRD/NaWloB4nOFV/jk8mudytSq9l41bM9
	i9dv392Lw1/BLNHEaI/JS26FASk7/7rcwhEAEbqBD+yRd922OOvmZMj5DygiVp9RR0u/+V9KhKW
	tFeWTFGDT1TfgOiCrrmqnaYFiwCV3Ix7Zl0BPeO1LfqaCnVXGo77JPXmy4QcHTFUGokJb121gYo
	llkvSACNdlXIC4UzhxnRpJ2v
X-Google-Smtp-Source: AGHT+IHY65P+Xz4TNjemyphPqqQ9+ru/mohlrB5vFIKJf/R1MNkDOblIAzwWX9YVxAvz0IWpeGk+4w==
X-Received: by 2002:a17:907:7752:b0:aa6:79fa:b47d with SMTP id a640c23a62f3a-abb7091cedcmr752835166b.1.1739787478322;
        Mon, 17 Feb 2025 02:17:58 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:57 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 08/10] pstore: register kmsg into directly mapped zones if available
Date: Mon, 17 Feb 2025 12:17:04 +0200
Message-ID: <20250217101706.2104498-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021800_025049_3D511373 
X-CRM114-Status: UNSURE (   9.12  )
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

If dmapped zones are available, register the log buffer into one zone.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 fs/pstore/platform.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 32448d9dd316..9a5c1d6d5031 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -452,11 +452,22 @@ static void pstore_register_kmsg(void)
 	kmsg_dump_register(&pstore_dumper);
 }
 
+static int pstore_register_kmsg_dmapped(void)
+{
+	return pstore_register_core_area("dmesg", log_buf_addr_get(),
+					 log_buf_len_get());
+}
+
 static void pstore_unregister_kmsg(void)
 {
 	kmsg_dump_unregister(&pstore_dumper);
 }
 
+static int pstore_unregister_kmsg_dmapped(void)
+{
+	return pstore_unregister_core_area("dmesg", log_buf_addr_get(),
+					   log_buf_len_get());
+}
 #ifdef CONFIG_PSTORE_CONSOLE
 static void pstore_console_write(struct console *con, const char *s, unsigned c)
 {
@@ -582,6 +593,9 @@ int pstore_register(struct pstore_info *psi)
 		pstore_dumper.max_reason = psinfo->max_reason;
 		pstore_register_kmsg();
 	}
+	if (psi->flags & PSTORE_FLAGS_DMAPPED)
+		if (pstore_register_kmsg_dmapped())
+			pr_warn("Registering kmsg as dmapped failed.\n");
 	if (psi->flags & PSTORE_FLAGS_CONSOLE)
 		pstore_register_console();
 	if (psi->flags & PSTORE_FLAGS_FTRACE)
@@ -628,6 +642,8 @@ void pstore_unregister(struct pstore_info *psi)
 		pstore_unregister_console();
 	if (psi->flags & PSTORE_FLAGS_DMESG)
 		pstore_unregister_kmsg();
+	if (psi->flags & PSTORE_FLAGS_DMAPPED)
+		pstore_unregister_kmsg_dmapped();
 
 	/* Stop timer and make sure all work has finished. */
 	del_timer_sync(&pstore_timer);
-- 
2.43.0


