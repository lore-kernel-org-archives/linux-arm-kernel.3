Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFE2C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmLwI+8qpgC/kNOEZ2bmyU9DgSQDRKLrj7ylcHY7B/A=; b=lc4fHXiWoAEAp4b7tayBcxvHKN
	sGWWrwrBBshJX0xEdBKXbRmbUOBeS7zCn3nQRoPzAG1CfTksFs/4HZqiJ9xSf91V6qjIKJFiosQEN
	OWecrLnu/XQj2r/lrgf001QJkIqyg131Wv0MJ71q0acPUheQVixbblqnsK2953hu1f2snU+NMYpnf
	d6OPUO13NUv6CCKcsZCA8BQydHh8ubemRNsUrb7uqirTC8D9pmC403RzvG43P9E+eTV3X3Yv1j3Af
	+7dumGRd5Z8D8KFrU7ncZAZwGkJa9zaYOPM41s//Js34ZBNhdU2t+zEHutEvpqTIEu07IlbLXIMU0
	Z8fpSERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RW9-00000001joN-3hck;
	Fri, 04 Sep 2026 10:51:33 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RW8-00000001jnV-15aF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:51:33 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso746307a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519091; x=1789123891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmLwI+8qpgC/kNOEZ2bmyU9DgSQDRKLrj7ylcHY7B/A=;
        b=kyRXK6tfF7XtQPuuZrv+h/4NPe7mcVxPPZEn28fhWBWgk20RggV96teb1i/XXR2Xgs
         xneE6R+y9WzyFbYDXyo/cXTbz1afODCWyPi+Vr7CZzzS7FT0w0dwUzVnnTJFgs3vVAtR
         F7138LkN/uuEr+XUggH7jBCt/EY86A+5R6IqQx3VXQnSYNT4Q2ltaSAk9qSMIu/rU65+
         wehCJyWTc+8/wEE5DPqmXFTjzvs39AjK7lc2BcPBHRndMgv5bokS+MAXqb+7GQdbpzhy
         q8QLi/F4rHBJlkpBItX6f6uBPKi9NzH5V75AiBUgdUonQcLeCwc+SUQ7lABpPTBnTVgT
         1fpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519091; x=1789123891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmLwI+8qpgC/kNOEZ2bmyU9DgSQDRKLrj7ylcHY7B/A=;
        b=N6LD5KSVk7CiKm1iyZxMGd3iRckt6BcSZiU1rgylkaIrD2mDWqnNwm07K8AGRk79Fm
         qgfdszsgcyDDtVTI2DUmkNYlfUrdnZfb29J3T3aUKFZpy+iU+1BPjKsrwcGyapwoReCl
         EB3Iarmk/jmqeiI7RoKTqfTN8UOb7AIYLMR2K7XcIPSgA0A7RwK/P7UGLbbjRxpSTCvH
         a73YEyzXT4i1dqSKOxDYgkwgYwCbEer0iXpRZuhQHDCAng63Pyk3prW5My8ffKdoiklG
         mNXZd2FKTYCCM2MGOkRofxVp5jmBkjXikLjdnzz2zGEYYyq+KcgdRBv9fQG9VaKUdrrx
         jepQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5RQq56I4k7BrAKZJMZgUOl8sw0dl8e+/62bdNRWv5t5uafdOBRXQ7zsxcfiw1Dk8bR1ygCMGnh6gz05vP3f//@lists.infradead.org
X-Gm-Message-State: AFuF++mPKJ/6BWIYPllcPNPWGKOYape2IIAlD3rk4x3T8JHRzj9sebUs
	Gg3lmEecdbrlDiINuJ1eZl4I2GkV3SKvVO9iX1AYdTb0qpA/wTvj6D5B
X-Gm-Gg: AYBFou0nIFxTv6cmR8VqsCrEjtsvKFwppkGWPNYfnf5mH6iW0JqEG01hnduW00hFdHf
	aJnkM0vc/iyRrmAKf4Olky8p6UPgzVgNESHJoRsi1yofPc7ILZrGGyj1VbNqxif5ZwL7UpTXx16
	l0ehXNFa9u1P68+pFB5nw8QnuemHHT9345qIL8JdafoRorc1AYg1rJ6wAMX6fltLUBu+WZivi1D
	ZPP2O7nzLeUst+vpB+9cOgXP6EiAwBsluwi+w+8eYwIXQjTAXIRh/3S8Lr9KsUjyI9fjE5lTfBY
	kC/qnW078ANjguvAQvuGXfp0yquGKRRvtxWUDDddosFODD5eOieez768MY6n0Y7yUBTRx30lUZO
	LsLNAxdzBJdJRMsuhaHplI4RHzRGnSxpj9PYt91fPF4Z8EcFhht1TY6Ogl5XbQNHU4kOzlajANz
	TtPJTOjXIEEK9lOAsufgwW0/9NW0DzcGaCMoGGTq7eOudaTtn7Zv8N5if78a5Sbg7wTNNlwpLzU
	RuylUKvp9IGWMBofVbr43WM6A==
X-Received: by 2002:a17:90b:1c07:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39b2617ed8bmr8372452a91.9.1788519091308;
        Fri, 04 Sep 2026 03:51:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befdefcsm5031484eec.29.2026.09.04.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:51:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/4] selftests: arm64: fix typo "hander" in comment
Date: Fri,  4 Sep 2026 16:21:09 +0530
Message-ID: <20260904105114.29474-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904105114.29474-1-hemanth.selam@gmail.com>
References: <20260904105114.29474-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_035132_300316_449AAE86 
X-CRM114-Status: GOOD (  13.61  )
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

Correct "hander" to "handler", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 .../arm64/signal/testcases/fake_sigreturn_sve_change_vl.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
index e1ccf8f85a70..bcef280582ed 100644
--- a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
+++ b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2021 ARM Limited
  *
- * Attempt to change the SVE vector length in a signal hander, this is not
+ * Attempt to change the SVE vector length in a signal handler, this is not
  * supported and is expected to segfault.
  */
 
-- 
2.48.1


