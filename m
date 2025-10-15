Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD13CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 21:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ka9acDfWYNVlXTADikeAWQzZKPfls3YVu38LVwS+Ync=; b=D19M5oubwwaNUD9kviiN3v6O+j
	Q25c5IXm3hCw6P+lYaTnHb+tXiG26+LLmOaIp12FKgaGOynaJAXBMyYM9nzJ6M4w5/yiFaqlqQcB9
	AZmKdLAPYo6NYQIUm8bMlWW2oirrNd6IMehqhrrY+Hsed9h6YreDlvBz8Y6ZB3fFsidreK3b/DWJK
	FAerqaZ+R1ofK+XXa70aEWFRwRZvjfwvaFPWk3kFZ/aZyaILG7Sy8h3PWxG0k6H20TIHoBvFE878I
	kSnjpWIv/NfoFFrMz/S2Iw3kn+BD4J2Jm1O62Ifwnl+ya2JpHlWq5NNesu/rOTTXYbw5CqoZ/PmG+
	ZMudNj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cY-00000002tjk-1a2v;
	Wed, 15 Oct 2025 21:01:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cU-00000002thV-2ysK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 21:01:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ka9acDfWYNVlXTADikeAWQzZKPfls3YVu38LVwS+Ync=; b=UgNSZ249fYvQtF73EEhHXh/8eC
	MhyMnddExuWhRzIUAJI9mlzDvPi49kyy46twS1ftDkDYvPjw0j9MwQehile35Pb8z2pGOWJ+XMNVQ
	gFY5RZpMjVuV4wWy05MMmD7mu1WR1N2KSOXB9eQOETLVjds8iOMLj9bh7MSKZnm4E1bRVNKD3NoNT
	+EbMDQTi7kfuvASlNjUYnZkwifswhuFjvqsQFV6jxzGGYYmakl4MffqgwZHZOaD/uanP+lDNpkzbW
	mcwFcE47Q86GNX2uxtTc1Tp0zq6ZykJOwAMe8S+JwrJzgqJPdNzvs+Gk52ug/FrZE62KDWg/VMTHf
	w9A9tY0Q==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98cM-00000006G88-1ofx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 21:01:09 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3f7b5c27d41so1566f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760562063; x=1761166863; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ka9acDfWYNVlXTADikeAWQzZKPfls3YVu38LVwS+Ync=;
        b=jv/mYsnhAY/2KcmQOp1IEscgZ6v8lIx9yR+0vnYDP5L9sdLyrdtlp1NzYgqYR3QVz7
         jjXSA9QoHCY1WDPKfKyDjSU5S1z9vaM+iK2E9R+I401LygZK964oIjPk1J41CREDmm6X
         OxkMiDNs9ptLKwIqJLg5+ZqYT/5w6RBLq6zexPTzdQ4JaKcYrWG5uwEmf1a/9hM/XKIr
         fo6rc/PVo4+1ZrEWb7ZvOvyitnbOdWxZ64qr5Mplo6/rPFMQIBOy3bL0zmBe1S14f4Ov
         zSOCdPPDnTyz5Lnxm7WSx3BzUaajdcLdfhbkAdrwS+jg139hfKvLI3YRNP510B2JXZOE
         BWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760562063; x=1761166863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ka9acDfWYNVlXTADikeAWQzZKPfls3YVu38LVwS+Ync=;
        b=aPUqgtYTCGpTjSrDIqh5JYnQYjlv35Z+tdL3dqwVJsdES0m9Sj55R5WRZuRLibYGtH
         Y9PBR36Or9L1O9+VYmaF6JKYKgkR9I5OcrmEWZhAwjmiCUUzIrnvXkmmumJHwwLjomFt
         6ULFRdh1L8L40/i0Z5kE9W8oMyBlFZirArwLZKmBcLypQ6QmI+xvq4hiV/2djZsH0yzQ
         ywMbB6nDOZIZc2vJZKiMnE7E3T/3nFk14PzXMYXLGwDsCh7P3RVVdfgWfc/NLq2iDuBP
         XPYpjc08qDhUvk+dvjWEunW0HHUK1zky6xUDlHEI1aus+ggMpywKnRPoD+n3QWehMy76
         w6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlMOWDFv7xULRfucxqNauqmtlxibk6ZjxjzI9ZedIM7k5jAORIwGlE08t/w8eGzxYu4Exfor/CGM0MJ7HLGtyP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy4wsVeQrjJsHY5giNJQdVAQGiEpSdqlCp8UjE9tjBI7URDSe3
	UEiGy2n+mtJwmBvifq3K+OopKgnB1PIPbMCTNBWx08WSJxJdRSu36WMrkezd0NlT6nw7hVWIFg=
	=
X-Google-Smtp-Source: AGHT+IFKTW/66VSsBVsAUER/FDq7sYd1YbEd3eoZpeBB4yPvhP9MMDUr1WYotgBpEovQntSXolk5aG9w
X-Received: from wrbbs13.prod.google.com ([2002:a05:6000:70d:b0:425:f04a:4d86])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4608:b0:426:fc52:cca6
 with SMTP id ffacd0b85a97d-426fc52ce1amr745223f8f.7.1760562062643; Wed, 15
 Oct 2025 14:01:02 -0700 (PDT)
Date: Wed, 15 Oct 2025 22:56:36 +0200
In-Reply-To: <20251015205634.3820870-9-ardb+git@google.com>
Mime-Version: 1.0
References: <20251015205634.3820870-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=ardb@kernel.org;
 h=from:subject; bh=JyRr6WrjNMazb438tuZ9KzQEKZXISsNH26aHqvF27Qc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeMDV2tC1n7FDTPeV2T5Cns9OHybTyotoSC/MG9h28E9c
 6e9XhzRUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbibs7IcOb7w1WO7Qs+rOkM
 ELf0rhGcYyJ5Y9+Kya9PRiVKqrEftmf4Zx95zqD/wkvN1ftm2b2fulPT5faOaY7fu9K+9XRNYPV R5QIA
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251015205634.3820870-10-ardb+git@google.com>
Subject: [PATCH v4 resend 1/7] efi: Add missing static initializer for efi_mm::cpus_allowed_lock
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Pierre Gondois <Pierre.Gondois@arm.com>, Sami Mujawar <Sami.Mujawar@arm.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_220107_643785_D163E00F 
X-CRM114-Status: GOOD (  10.90  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Initialize the cpus_allowed_lock struct member of efi_mm.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/efi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 1ce428e2ac8a..fc407d891348 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -74,6 +74,9 @@ struct mm_struct efi_mm = {
 	.page_table_lock	= __SPIN_LOCK_UNLOCKED(efi_mm.page_table_lock),
 	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
 	.cpu_bitmap		= { [BITS_TO_LONGS(NR_CPUS)] = 0},
+#ifdef CONFIG_SCHED_MM_CID
+	.cpus_allowed_lock	= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.cpus_allowed_lock),
+#endif
 };
 
 struct workqueue_struct *efi_rts_wq;
-- 
2.51.0.869.ge66316f041-goog


