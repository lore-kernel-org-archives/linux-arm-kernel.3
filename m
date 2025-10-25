Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4314CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=; b=B0DikWAwp5kuB6roamvW5/YO9F
	dtGaGf0tHAEdz/GEmh3FocXypd/Ycr/zDqGNnFmmjKiTPl4bGdul1/qcri0NLV4Sz40byX8vr56dv
	zAHEObS0b4uYROARRpop6wc1WcdEqeWf8cFykNRywdQfOrQF6xARAu2trNGDmN0myo4r2xdiX+jwM
	gJSM6t4ronlGCkM84n3xay1M9ar/nQVgUbCEQk7KibO3h4pchXxFw+cE88E1R3dJu+KYH5IXDLadz
	4mE1pONdZDme8yZ5Bm85MYIU5TrnuPyB2nZq731810PMchtsCYtxoFTklF9qFA2UuBdhwy2umhZLY
	1qh7Nruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChDN-0000000BXQ7-0lQo;
	Sat, 25 Oct 2025 16:34:01 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChD5-0000000BX7w-0JCx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:49 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-88f8f346c2cso331685685a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410021; x=1762014821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=RbIUaeOFP/zbiTujNE6AKn4Do9Q54BoZqSovQLN5DNjfoP12734aEMfZWuhROAPtUZ
         XZcRKlmXtRg9poEdut+a9B03KXVJNO2dJZ3ONXaEvTN/j5zYCsnm4V7yip1fZj/Vrp4m
         04MeEKUapIVTmCZj9yocpMTF9YolpoS4+trhm8uQIlV0DcWXI3vkQhDxppOuFi3byslH
         v0xbvzUfSPpZT7e5qsGJAzVwTraE7gocVqNxMGW7xuJZ/xsTuyFamnebOTaWVhKmF2/z
         MZ8Gu/GOQIGxK7YNx067+yE0Zs4nXnWiQ/JLFqiHf/tU30Ba1M4+OiVWJKhg0Fm1Eh1m
         xT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410021; x=1762014821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=pXnrNEeZNQ3Ybt0NfGCT49pBvKT2h7YWTPAA/3/h0qqfmRe7PJ5u/VUiDG8KKTa0Sm
         WknNreWqdAQJP38tq6xRAvvN5+6ET7LuFxnEoY+g5WwbyYuViYp9afSd4svoLTfZ5oUz
         649uJvCfCAoA6zZD+80JZdob8wrw7irPTweWQeBPWKyT45w+ZDn6ihSZg1pBG5PBo8rJ
         Lk4CEWM+noNp34UpM/w1VYU0ImoqAFJY8CVYTe3XO9HUlnQif9j/uLB5vsHSGU1imKlk
         TZVupsT2CKscirROTYQglGFJUa+8y1yFqr5kxHPIEINr6Q5iLPxda9VnwtGe8EIdjRS6
         MQzg==
X-Forwarded-Encrypted: i=1; AJvYcCU61RFbQHTYbv5q5NYLNOxM77kroTLqWGaZidqX4PFgGMmElWYsh4RL5RFdqcLMdsrhtcaVq1oZO55Us8OhR6vp@lists.infradead.org
X-Gm-Message-State: AOJu0YwYjwlJkLfi9rEqn0YaE3g3ktpx3aNUIALJSvMYPJtHqEUCFx5t
	ESdeC/WMEfBsXXyPdadMlRKMIA6Mc9/2FAS+y11wwXPsIfcnG4HcBQ6d
X-Gm-Gg: ASbGncvBt6EdQDId7xB3UOSbqog9zq9Keid2fi4cX2XGZK11uv5aargwnHUyYDf+K+L
	z9shXKEaFKJeLRCJfRHfWmUGlcc12oVH/8E/dhYHxKbEsVQWrgqs29LMQVJOd08NVABRZAvAmwH
	QCCYTZPzbDhilyzc2BaU+uVIFe6WC38qjMdnahDGEEEQuMrtq1HrvW/fvsSkpXFdX2SEZ/V/VLr
	p5Xqk5t+WPBJJ9D/ug6eXhEtPpB+tJbWWa9w+BhliVpz7B2NsmJwZZO384S1eILO67V+wSA1FxD
	AX9XNaTvRN6wY3Z55j9wndSHi6RM1IItliGRmPYQU6XvSRaS4KjpapT7dvYd9xqoe+P171yjGmY
	YsAcWk3KkCWUTHeR+BWLIRISqfSc7BcC1ZAYyF8V/iRtPABJewCJed7ctX5G8aiDNtjiYGF6iM/
	FwcFN7t4A=
X-Google-Smtp-Source: AGHT+IFZUXzUCKjX2GS7KVjFpxXVayhaSU18PSnROxCbmg4ehcl8/3L/N8ey4/nagW/qyG5Qi/ofXg==
X-Received: by 2002:a05:620a:2990:b0:829:b669:c791 with SMTP id af79cd13be357-890712b8ca4mr3694996585a.78.1761410021395;
        Sat, 25 Oct 2025 09:33:41 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254a41cdsm172336185a.29.2025.10.25.09.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:40 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 21/21] Docs: add Functions parameters order section
Date: Sat, 25 Oct 2025 12:33:03 -0400
Message-ID: <20251025163305.306787-14-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093343_179433_3B290D14 
X-CRM114-Status: GOOD (  13.71  )
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

Standardize parameters ordering in some typical cases to minimize
confusion.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 Documentation/process/coding-style.rst | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index d1a8e5465ed9..dde24148305c 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -523,6 +523,54 @@ below, compared to the **declaration** example above)::
 	...
  }
 
+6.2) Function parameters order
+------------------------------
+
+The order of parameters is important both for code generation and readability.
+Passing parameters in an unusual order is a common source of bugs. Listing
+them in standard widely adopted order helps to avoid confusion.
+
+Many ABIs put first function parameter and return value in R0. If your
+function returns one of its parameters, passing it at the very beginning
+would lead to a better code generation. For example::
+
+        void *memset64(uint64_t *s, uint64_t v, size_t count);
+        void *memcpy(void *dest, const void *src, size_t count);
+
+If your function doesn't propagate a parameter, but has a meaning of copying
+and/or processing data, the best practice is following the traditional order:
+destination, source, options, flags.
+
+for_each()-like iterators should take an enumerator the first. For example::
+
+        for_each_set_bit(bit, mask, nbits);
+                do_something(bit);
+
+        list_for_each_entry(pos, head, member);
+                do_something(pos);
+
+If function operates on a range or ranges of data, corresponding parameters
+may be described as ``start - end`` or ``start - size`` pairs. In both cases,
+the parameters should follow each other. For example::
+
+        int
+        check_range(unsigned long vstart, unsigned long vend,
+                    unsigned long kstart, unsigned long kend);
+
+        static inline void flush_icache_range(unsigned long start, unsigned long end);
+
+        static inline void flush_icache_user_page(struct vm_area_struct *vma,
+                                            struct page *page,
+                                            unsigned long addr, int len);
+
+Both ``start`` and ``end`` of the interval are inclusive.
+
+Describing intervals in order ``end - start`` is unfavorable. One notable
+example is the ``GENMASK(high, low)`` macro. While such a notation is popular
+in hardware context, particularly to describe registers structure, in context
+of software development it looks counter intuitive and confusing. Please switch
+to an equivalent ``BITS(low, high)`` version.
+
 7) Centralized exiting of functions
 -----------------------------------
 
-- 
2.43.0


