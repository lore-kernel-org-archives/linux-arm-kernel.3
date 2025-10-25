Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65447CCF9ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GldqH8fEtUrzkHne1rF5BgiofNp7hGD1Vw1w37mqgw=; b=aoiThRGXfygFpB8XCDc8xWp0n2
	3t/WZPcsSFcNGWvd37yAf1l5hUKOrFrJF3d3JpburcEcdV4epSJHlP6RZh4r7OFEQnEhIv4UEd+Ww
	sGbZfhH2eqLPaSJWmlGSTirVYd+W4eyZ3MPOnA6zfYrjkaSVTbzWyrq9jwCgaNagt48clCbGxNxep
	qwcZYm5jDSKoIiJCXIptY1WDpFSxyTI1DIQ3EfVFLhsyaR6Tlymuv7SvRthKPt44CoUPZGDEsb7Xr
	nY+dPKFM8WsjY3wLeQdL+YwHS5VlWNqTyHlArL2MkglU+dYfPqpgjVdeEkV6OC52ksuiuMO6Idd7q
	Ne2Mlfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChD0-0000000BX3p-2gUc;
	Sat, 25 Oct 2025 16:33:38 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCu-0000000BWwg-3qto
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:34 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so33009886d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410011; x=1762014811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GldqH8fEtUrzkHne1rF5BgiofNp7hGD1Vw1w37mqgw=;
        b=MyY4gcWRStqyKosjPifHZ8+cGqoudQOss2IliPAMaWnY7Mpxr37mhQEhXeq/3Mt1F2
         HFl09e9hU+lynfl0h8J8JyqyCjnlY+aWUHwJ16vEJiQLYWDOj1Tb7NiEVfWlvy5L2jSP
         ZX00QefRjGGdmMhAYkGeS14E23lQ3s6l9UF1RDOb64A6ATEdSAIGzojuybUvYpLtsnva
         8gzI4vsUrFWrCninddppXVOFGXx7xoZdacz0FbuWjOTmcuOfW3RLvRT4aHGxygbNp0WS
         tZX5D1m1Ee/qIkPjQpR+vnJcp3lPUxpwRZ55QBHOgou9N80l0NNTeWpnqTe3p4csUvWD
         xFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410011; x=1762014811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GldqH8fEtUrzkHne1rF5BgiofNp7hGD1Vw1w37mqgw=;
        b=o4K7O1WnB3709e18nQvg3f3SbDm4WUjZGKYI3k7XUkhCxbU7mLkn3obq9lHLNIenGs
         wySoScILHSXhw8ZHw57hnt0IMY0x7MjNw8To1Yvbi+Z3jkqYoAXME1Qy3PXIVVljqdkt
         GHhUJcGr+lFBUdVfUEKzQ8lFXfj1P9fn3WO9NBkRXkCJCTQ8gvvvXLGI1QDwUZ3db6FW
         RUvBJnqcXmjZrfhOfdIiX0mmEU0V/JYa79kV2B/KwBLsFKuBxcZ3Lc8liPJsVGmNXq5x
         RRoYw4r3T7hHdxZNEqFEw4lCw5BK2fKYiOS6ina/Jtq6cdDX/2TciVUUWa8+J9PfkEeB
         uKDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF6ow5oaiKyIAepQA61SoQ9OApcas8EZ+ktE1ymYj/9fNypK993635Hgx+TN9fxLwqjafjXxeK2GVl8DrvaHFx@lists.infradead.org
X-Gm-Message-State: AOJu0YzEMLyer0ru+1jquMBsFLqszDxpfctOJW3pq1/wriYdlFBcUrI4
	e2Cbb+UmQaODetoZEDAwsGvesoBIjJ+1ztuIP/KbPXVZOaKOjNwM2oH8
X-Gm-Gg: ASbGncvK9Zo9lsZvbhNRgeeaUHrYVYqy4yUEToTKWTUgEUoOOc1RBF3WK3pCuNE0PnZ
	9zzRpRQdwb3HFYKTY9yciXsBmcqPLeNfkpNDkd1NJWrRoELijU7/NJapn75SE2NQrd8SRpH7ccA
	k/IFEm0krs4Aq1zWeuDKeY9PZmrBTQPAQn+KOJmKJtBUh74kMa2iyuD8+b2cM8ocv5Ee2gscr5F
	2+eGWdGT8hmRsEuTctvF+okiZHdu3WtILamL83wUFZldToYTWqwGqgyP7pjmlCR1+CfWvxqEIk2
	F+/Bre1w7LQAarCmCx4SWUwo/toGPkpYJ//1Z2qnwhbHPXDnRd9JdRu5FBqaQJDy2Dpe7PxclBf
	+2LeeyQdgZDXX+AE09XkGxvNibl8l6JXZaHT4WnHfVEFcfSDhX1HKeICBTWP9CLODwlKow+HyGN
	ZVy5RozxM=
X-Google-Smtp-Source: AGHT+IF5C8Vr5mRwg1oABB1oICMMdDXxfhjBtJc4JAfiQSgZg7djSzMhTj3NDF8UyFf8e6ttXMnqDg==
X-Received: by 2002:ad4:5d67:0:b0:78f:48ef:d8c with SMTP id 6a1803df08f44-87fb40f481emr83956716d6.22.1761410011494;
        Sat, 25 Oct 2025 09:33:31 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48a7467sm16284746d6.5.2025.10.25.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:30 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 17/21] mm: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:32:59 -0400
Message-ID: <20251025163305.306787-10-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093333_002353_442DA734 
X-CRM114-Status: GOOD (  11.89  )
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

GENMASK(high, low) notation is confusing. FIRST_BITS() is more
appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 mm/debug_vm_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 830107b6dd08..b722dc3c091b 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -40,7 +40,7 @@
  * expectations that are being validated here. All future changes in here
  * or the documentation need to be in sync.
  */
-#define RANDOM_NZVALUE	GENMASK(7, 0)
+#define RANDOM_NZVALUE	FIRST_BITS(8)
 
 struct pgtable_debug_args {
 	struct mm_struct	*mm;
-- 
2.43.0


