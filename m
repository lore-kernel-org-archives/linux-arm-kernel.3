Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91A2CF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=; b=2zJT9wMurdCzGBkqSDJb6Qy3lm
	0SNkaoLlWfxfnCq0eshDF8xoo8CS7OvBtoZPc8ToQ5VKSIuQWgiBo8n1uAgWm0D9HwqK++zigzIyq
	pt2iSPJ+XLQlsKqN46mvYUNPAg9kERg1uiygZ8QqGth61dVT2jnWugAvPTt9RUopZLlO3t2i8OBH0
	or3KV5BBGO1AG4lK9mOGmt42jdbyKARI5a35BL5XLsqQ/p1908C3fRl1sngkIYHn54cofwArTKFif
	TWUMrgJe8mfJp0TC0qiUkrDPi6+jLEC+yHnoAv7JBvTFTH1CiccDuKapALNxtFFx8xvylWAo38zba
	8+CAsnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNY-00000003WYq-0odh;
	Wed, 19 Nov 2025 15:45:56 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNJ-00000003WGs-2eXe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso5589322f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567139; x=1764171939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=qQXXvMPY1HK5IWwuAiG6fOiqWDAYBF3jdkCmhnxHH83tQ3Je1S6kh6S3OafPD72YHw
         lFcFUQAh9trpg9oh31W6PiE/Hja73WOqgCeXuc426MQaWM1kUcwd47QdiR3+TNS8XAep
         g7TDafSk7jSN4dW0yIW1EykeJZy2PHjXOdvZibO7xm5+uqYcQpfVKADgl2oRi64ydaKu
         idSvev1R/rr5wI8e7cWpT5PBd49hBWLR2rGBB503x6/6tcJ2Ue4JTjwA/SsofH6x56sJ
         3o28afF5KfnMmmXwxzn9zyYMnD6+xBVXZz/xnsyZeOUt+SoktakXCGMyNFDayXH+hn8W
         i6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567139; x=1764171939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjJbR05GJTjvP4eC8iuNclWxk1mMm5RuLT4aWNn+uIg=;
        b=jEizQZog6FUG4omVG5VHWtCjgVS76x46OmQQL6Hw0b6IvlTt9Riw6WD1BY22Da6IF/
         z4Try4AxP6CNjeXYO8rN9/c2ooStcfHY8A3sbJ6A1TxE0NE1pNU09B1vpC7wW8ct6y1Y
         P3EklxB+5KrrMBUAmV3A7uEx+0OLgZcJmDccEGHbwAhcDZMVsVMx6NOj5Jd+9epCfam0
         BE0tLEp4L7yNvNuXYt3HH3NPBRCuaYKobnRpRFYMk06f15qXjg2p17lcU6+qoaAHwH9G
         PX1X1R46v+6t2fWHw9A7XXyr76mWYA+JQTNHXeTNSTBCECnb0ThhkJaW3MWixS6a4Wjc
         bZKA==
X-Forwarded-Encrypted: i=1; AJvYcCXS01Dd9OIcfgRjWeOCh7xLTLkDKorEWvAJAhRB5X+VqfETtCvi6I3YOONbVufgukQPCiOCUEK2BkZM+zgi0REF@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl6qz5wt3IDwVaU/N3h7zZjuXEJgTjbYhSfz1WSTXKTtmFbPaL
	wuNvZKJ19591K7VjbUoS6zTTaHrzaoLL0vjv8RMozsCHU/yXtKGRaxkDlMOallqj798=
X-Gm-Gg: ASbGncsF1OTVNU9SrzR4Qkx7UmKR9VHw869cZDyCbn2nRUbFq2oboeUZD+c6QiUSgvt
	ctX2Xt2AyVFnUlYslSyGEeWrxsUPVx8Gu9vbJhF85ODt+MpRYOTdBJQrOvEsk9eUkr4hNajfG27
	gZJ91Q7v61QIeVqs4t1Vr6Ot+lxVsCWK6pO/1KDjeDnlagAWFMzADCKnypcTQG0ikJuO0E/FwO7
	0ynqbzK2BHXN3EF0h3ZDbGbNh9j3oOjn5xr8outalMWa4wsyqW3BmWNMd3dcN/xdd2nKs05nzLX
	IknYAEkmlm6ZYU9/TRrJ6YohhNHaUgnMcN1BfcFb/oX5WGxHTrdHI/19vPG2irUC4MxqwwIaQC1
	N19wY+AZ+TWGuYhVf4loLLY/hPIZ3gyWeeVKv6f+k5OE3TYC9HumqQmJsS7GBPsXLX5C6cugfhK
	+EJb3EMO9Uq3b2/3Bx8c+dhsPE7uSZzQ==
X-Google-Smtp-Source: AGHT+IEyhedKwAlBM3EiuchJNsF2kJSsWS7yZo6BNIFhuE+C/7ka0URI4Q7HQ+TXxvH0Bkqj0xsuVQ==
X-Received: by 2002:a05:6000:2c11:b0:429:cd3f:f43b with SMTP id ffacd0b85a97d-42b5933e404mr19233459f8f.4.1763567139371;
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:39 -0800 (PST)
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
Subject: [PATCH 13/26] mm/init-mm: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:14 +0200
Message-ID: <20251119154427.1033475-14-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074541_729133_0A97DC11 
X-CRM114-Status: GOOD (  11.19  )
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
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 4600e7605cab..6931549bb7a2 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,7 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +20,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -48,6 +56,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {
-- 
2.43.0


