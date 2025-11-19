Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4327FCF394B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=; b=Abd0ynulW8Lg/WORwu1zyl2MJf
	G17pw49TFyi0VaGgnf2+gB6M3CwiljqkKO0PXlpunb6ZTJi8EhpgIm7pVnVqQsxi/Dob/qFLHuTis
	/JkLnAO/Z3hHpU0tJUIzSXxif7Dp+IODNgJHKjBQfzA4d8v3jX6iqcdyW+zQ0yQR3e2wTLBBHy7KJ
	QlueP04b3fbCjv83wQknqGrKqmOSdd7Hz1+f9BZMA3shAMCTuh9Dh/459So2JZDTmG6B+mY+86YG7
	WUOzpUJFSfVcCegeYgiWv1TOKhFJ0SUYXSpWrf/KWgElU3SE3FbUEMIjGLmHbHT0/JkLmy5PpdO6y
	FDuqREiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNW-00000003WVy-2GEd;
	Wed, 19 Nov 2025 15:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNF-00000003WB7-0SG4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Nov 2025 15:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=; b=fzhSSzbeIHeF/yVRZYOhGhq3ab
	gWh34lzwKqd//TBgf/xCj5h5BLAPJP39z4sYbSoJjVekpVbNifjNNCo0DUq5hQyNCCfM4D+UFnK3A
	9dDJgWUSmgVdhmpS0asxY+MTpWac0FrVqdZiZSxtxg2LongvIYpnIsYAoO0BYwccVFoatXPcKfsPS
	B5lGXZckQNid64/c2192IywfwfdeFwFXy56IpghhHuxS36SwkzwW28DD+Lj1iluVPAFkUYZtuPBi0
	WTCxvX2MDoV+EVj9GyslGJssh0qVlE51LZxU6s2Dmsy24r2UDgjy7Dxxzr8ZsiH0ZRj/fmscogXGt
	crICZzxQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjVZ-0000000CYgo-0H2T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:50:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42bb288c219so3582968f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567132; x=1764171932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=;
        b=C1/0sLi58qWLwK3TAwIZEbrwV+6q331z01JJpOpWJxseEpQhDqVrK1ka8boczzfmYc
         mAw7ziC2CuAzPryGRlvT5b+Tr1vy0OyNqMiC97RstBpgPL90ljx7NCiCdF2nTGhq27d5
         jGcOMuxjIS/vUxbT5AEL33M9kqm5xVARXDutELPzcoIlzEdYMhOsKsUWLctsCBqq7yFs
         reN4t/G2T2mgo3JUkXN08i+7HYR0CkRDjakGChvzQOh6h5v2NvSloriss9ggKtO76eHt
         /N6SygrbJLitYj7WhhhW4rwkK27Zk4uuYuxaXZ34HYPw7q/us3Vlgal+ypXt7Ur4gNYW
         BS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567132; x=1764171932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=THAjTq9x4zT81mmTnIarOvW/kNy7ppuR0bAFxzz05mc=;
        b=R9wvqvYdzto7CvVE4pwJV5owJUYmE2mAwTYM14C7tJUQ5HilaLmqMgjhg37MUskLAS
         CM3xy3N89Fadf9MM08Lv27+5Yp2kyHMUGPSe5/ojqFeJG9k9jtATQ6rJDiN1W3LO/hHl
         1ml493rnmRNOv46dGiGg1F7Pq7iXJrkIQvPOkPjgqycqBuYOdYQMMmAql66CS1GJB1Cj
         8OeuqbYUR1iCbAQ6vIuiZyFGVwgBKY0iSupSoIaSiCiM85ZXN/s0LZTSTG5aznbSggGB
         IMPzbbhmKOlm/dpUvblFDen5UixhTCoplEGVBnXG8qXRxSfLbe7iDElBmqgxA0/8jQ1b
         DUsA==
X-Forwarded-Encrypted: i=1; AJvYcCWQf9pEJkH950+qpZOYjB7HRrrHWKeuQk2NSAhlbOTLedwZi399tVuG8Aw4R0d8YHZrU7hbioykkid0AfBx9AFj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Qk8XkSm1fvixwsZSjVrffJGDctpWzHIsAduNm02hmGkcpgXi
	x9f+j+JylqDvR5iosXSGvzZtVC/kE5Qf/wAHxCoph4rhm0aK1RZacRYUzRGG76fzNEw=
X-Gm-Gg: ASbGncvSMUEmiiE6imOfwsX/Xk9qHUXcLrx3G05CcrbVGBYKi7tz86RNGKEP6E2jU7B
	tPKQgiDVwpgpY3HXfH1NNwxag5tSzf40Ckx8l9cy9F2/XPy6q0iWzGxMvgEmO/n8Oye/lLPhYIE
	UJkkzELdewFQZP9vOk+cb0+j753c77FFlm57fW3Z33gX8FUQ7UZeXe5dxkEtTpKPz1xYSmWHuNg
	H0/c8xrGWVxBMKt70euU+har7fHOvyzBQE18uaXuF63T9wPZRAVfr6e7wc8F9fWdHN8Rp9l3i2J
	aPuDKo1Ov63yl3UYc2hfGqKPxSQLlZMqfa86MCWn2F+ukPU28ibyDQMRkiQasqEBIAscPgl9fM3
	BWj/Gw6AJsR1hq85Ht99suITquu8gjz9MEBop/ov1gsA9is9++PdqruZKfWdcsuKC4iMqia1EOA
	3C1RrT2M7cNlbWaKmx7TRvslUXhnAgjw==
X-Google-Smtp-Source: AGHT+IFM/SLutYeAmIo2p7oRt8B5TNnuLzBZ4qt+3E18Kli5wgQjVTHlMxDsxZxKW/tnJD9yRmbxGA==
X-Received: by 2002:a05:6000:2a0a:b0:42c:a449:d68c with SMTP id ffacd0b85a97d-42ca449da11mr9102186f8f.30.1763567132399;
        Wed, 19 Nov 2025 07:45:32 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:32 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 09/26] mm/show_mem: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:10 +0200
Message-ID: <20251119154427.1033475-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_145009_140786_1B261A83 
X-CRM114-Status: UNSURE (   9.44  )
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

Annotate vital static information into inspection table:
 - _totalram_pages

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index 3a4b5207635d..be9cded4acdb 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -14,12 +14,14 @@
 #include <linux/mmzone.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 
-- 
2.43.0


