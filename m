Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7CEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=; b=JRQC3Gls2zhAqB4OLgbxvrH6ul
	WbKAAoqpkqvHqIa5ZyyPoto7hiHlIKlRwwa1Eyq/qoEbe+zhNb+b4CnOjERmHL2UYiDHYqThDERIC
	xPGvr2zWZcj3PAxPzSKsHDsmONImBFVOo7aq0j70Y4xnvPNbCZTHjAgssMXGRPu/0c89Eyi55ieUY
	AL/p+jGy5BZiqFAGp+uTi3Wq+u0rmFbm8tnxU8VKE6x7mmmU5YlT3vwarm7XQoPmxFBvNcdtgGWi6
	rWjgzhOOZdT5bXzFMmLneulilX5gEoCAJm4y93g+Qg8zJGOw5AiLjG3fCdynpkzoEB5UmvrQ391uJ
	M2Nz/O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSF-0000000HJxI-0WgX;
	Thu, 16 Jul 2026 12:44:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSD-0000000HJti-04eF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 16 Jul 2026 12:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=; b=BnowcMcnbk1gDaqz7jikTxFaIP
	jP9pD+e4n1x/4V0aOZhX3vK9uFMQKTGMMsflgwunFSkPJyMepYxIL1T1dEy9sxbcxoCSa9r3ckAEK
	l8Z7VhsbEq6U+AAkEwizrsr6mRjcWvcHGFgWQnJctpv7Q7JWqnX9gH91sMaJyg2q3kfEEppWzzJie
	Su7tGg3nQcBqgyJhKKYutdLgAhaNCpqoODXTKdUwgFkaS6X00Gq63tv8Vo5uBfl/3aJSe0DbXSS3q
	nIoQBsAxtJFWJ9GpBRZJ/Jcy8C4MVZ6dnKhC68ljAoZCF4ctjbUiHN2WRo+2irvnfrvgEul/uCocj
	cFIVebcQ==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkLSA-0000000E37L-0Q4v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:39 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso4725074a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205872; x=1784810672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=;
        b=bNzOVh7I4KaEO+bBuo529tYKucrzCStv4ETdl9vE4rKZgwVkg0B2iqUd5ulFShjcNV
         CrcGmE4ACoXM+COE4QQU0UD0CzR55uT0zyt7zhiMLPHMVwZnH53C+9dSdySO14QgM3vG
         kMMpduIiHTgBdWCYi+KSRwWiV24nke872fqgsl9hxaapP5IviXlB+JD8IW8JFvRhFxHH
         R18BUOxMvBhjh/d4SsMJ/NhYZSnKvtfnFA56zVEb6VrYZC2r8dxG4Sx9/eRvvVT9afe0
         k6kA4SFAp9VljycYPQKeySYoKD4p8Q0XykmpBqWdiXb81YWYm3yyXuVWYlUZkcYznOE6
         hxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205872; x=1784810672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0haKjxFEA+XqfWLiPeMGRklJhvkZG2bsdABvuKjaV0=;
        b=I9PXJjaeh1UjED7Hskq6GJgAO06fqyRkcYBMcU7pdkhDuqeLL1g5Q4AZFMEd2RD9T7
         2/15Bt74vkAvPSSAeDBDJfGa40nEL/Vd5E4xS0ABp82j1bayUvoYBGgKjJsTcnZjAUt2
         RdJIhmJvKSL1XshJcB9Qp0wOoFrS9gRrydB2dfVKGB2HL503TiIbCymWt7wW6uZgutSm
         ZNjPsBfjNQmlDpo19Myce3xbT4ZoDacgoKq3EBj5hKQTFPM90PyB74yuxXKwbLzLrNHE
         KBgH8oXTCvsyW756TYm9QHVROusSnbTX+6MgKF0khdoYVnsU+B2D+78r25vzPC14kz53
         yxxg==
X-Forwarded-Encrypted: i=1; AHgh+RovgZXqeiGbfees2wHlqdXVQsvMKvfEDl/5OTDIowclm0dQ+vWCEZNffC8XJ/qNF5oAWLirQNNIiHGpNImvOVct@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7mnfhVd8OQXKDrtTG4hbTIOJm1Uki/M06ciJIn4b2p/5aUXbj
	QFf9eLrKFQIY3fsyHQp3S6xS+5GA8YuSfKBYKdWUnlHhjkqTQ36iW0uSsCphJqIttOE=
X-Gm-Gg: AfdE7cmv+G8GrfiE+Z8jLs/KwcGspgqJfbm6QWCrtVBPoU5KbnCAngaGwLzclFZaoYw
	iPMfY+hADAu0Av+hWZvvF8Z34pkNJYycrT3E0w9djBDyl1GPKVKwWXCzL2U0jiTIW2lsB3vIl8N
	igK4tefJqq0dblkyiihSRnWCoqM3AWKPJsCqKcAPJHA5NuA+AjDCVWk4Lr86P/n56IsmVDKTmdF
	qR0LhFsScmkNFCnJ5OfMm9CTWOuz/H/nY4dY84qLHr3fVXl8TPGx75h+q4LGgmkw70ocoCxiwOC
	1g8+ZCbfCsav0Q5axRWI3d97sa8qHoVxY+ft/C4VuTbyZHgmSj2s54kiJ8ucv3syE2Mn8KqCfUv
	eLHuY4FI9U0R1JeZhFVM9EEsacs2QVlTzNjoYjh5ioC0tly8U5j4WWQsh8twlKFzEKhI2B0IKpv
	NJpadEbnSzYdNFxJJHP+iQD1RpiFvaOZ3llw==
X-Received: by 2002:a05:6a20:e615:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c3576c37f6mr12235735637.74.1784205871769;
        Thu, 16 Jul 2026 05:44:31 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:31 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 12/15] arm64: mm: avoid contpte A/D aggregation in fast-GUP
Date: Thu, 16 Jul 2026 20:41:47 +0800
Message-Id: <92fbae3247b4bf0d7989ba20a8763ecb836d0279.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_134438_312882_95E74416 
X-CRM114-Status: UNSURE (   9.31  )
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

fast-GUP only needs the PTE state for the current virtual address and
revalidates the raw PTE after pinning the page. It does not consume the
contpte block-wide accessed/dirty aggregation provided by the public
lockless getter.

Override the fast-GUP PTE helpers to use the raw PTE for the current
entry and raw revalidation. Keep the public ptep_get_lockless() semantics
unchanged for other lockless users.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/arm64/include/asm/pgtable.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 018781a1fcbee..d1e08dce9f7c5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1760,6 +1760,22 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 	return contpte_ptep_get_lockless(ptep);
 }
 
+#define gup_ptep_get_lockless gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = __ptep_get(ptep);
+
+	*rawp = pte;
+
+	return pte;
+}
+
+#define gup_ptep_revalidate gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(__ptep_get(ptep));
+}
+
 static inline void set_pte(pte_t *ptep, pte_t pte)
 {
 	/*
-- 
2.39.5


