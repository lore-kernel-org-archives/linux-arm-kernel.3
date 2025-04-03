Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EC1C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D5lR/rBMuVOIoUwLH4/co+le8IOHRMi1RqbQlc2/Z8Y=; b=baz8IsXWXfHeVwlRdmUqTMTidG
	jXiPIAyB2V7SNk1Je18pNAg0uQddhv4Rbsqyinh7Zd8YzJGzZkivWThlxpwAC93r+GjbUhXc4tb3h
	j9QMw4aYuwcZjfoJEf36/8KsZAepD6xk2Zl9fTx804xgT71pU6zKWoKvvdDAH7aY3AYM7jl56AMSx
	Ozdnzk5EGQV+9hBvMUJSP0rhyhpwpWjW8Ul3lUt16l7uacLGLOcdkuxiY2qfyLnydmGXLlDyRbnPW
	aGI8QSGXBUv0mBpv0aiuJ3LTkgvvaCKNs16Fvx5p4HvmrRpAx9ZqgqVZBzyyG1am4rwt7yRCfBxKD
	Wr+deklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u08F6-00000007UEA-43oQ;
	Thu, 03 Apr 2025 00:15:36 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u088M-00000007TKn-1fPL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 00:08:39 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso551574a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 17:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743638917; x=1744243717; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D5lR/rBMuVOIoUwLH4/co+le8IOHRMi1RqbQlc2/Z8Y=;
        b=4QtnyygiiA6h4Umm0N670XyK0rivngUaTahLBUjuo/pswQm/Fn3nvvQsYCq7zJyLbR
         Z+IJmk1fHx0Sf0Z0Ehoku6HwGTWVzEOw4UY5Vb2LRr9KvyxJtRYi4Ke8g5BjP6Xeisly
         pdTIIAFApNOKrJtVyKh3mjtypL+u4eGd9ZvwieQ2Kx0ZsImnBZKZ+h6fO6CrNZozAstx
         nQ2WcNjKnsBq4dmP3N5tT9p7Bbchgg+omQSmJwYE2yoYP5u+n5vsudUu4GK+CTXJ+EwH
         rUji1HooTMbeVut3ErltLS7wjYgiID09V3XRLEOq7oz9SeXGEwirblSNtLGViS4t9GL+
         aGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743638917; x=1744243717;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5lR/rBMuVOIoUwLH4/co+le8IOHRMi1RqbQlc2/Z8Y=;
        b=rhC2dVHu1M6g30n1ixJwHIEgHqyDc9WDCdmRjgLs6hqEsiUGIsvlqCatAnaIG5OA5f
         CqAO+ZLN2fMZxg48lsk7kS+sX9RQiCXJd56187827sv3vQU+jaXER7pMklqL1ID5O7R4
         aneCQvWNtrnLt17rH0uKamuaIm/rAThYyQIi5rjHWaTlFZh4nLF7+nupRAIW3bBuVd7y
         T25rPfNxH4NyTx4aMUL0+HLFJPP64Rr3ZI2LM+8S9gi8sbisB0PDVGTEK8iYBVSNlb00
         9a/QBQPAxro0WRuLOf0oNg7xMfX1Z6MH3jZGpXwmU6WD5h2CcF7fAec2szqWC/ESvM3H
         g0rg==
X-Forwarded-Encrypted: i=1; AJvYcCWN00mGEcTuFsyV4zM1qCGURpsqM9Sao3YH22WXAeBj2Els5umdOjdBcpSfaur/rK1WSFDETPml5f7PHbzSqSAt@lists.infradead.org
X-Gm-Message-State: AOJu0YwV+vmLoawZzcynQ+PfzgD0eiita5dgekgS5mS4isAo7t4N4q3D
	lE+bCwpEA9S1JiXrXtVbJYJyK8Sg/7WPtQntgxEd41goob5HsTa2Cw8wunWJ32P5wA==
X-Google-Smtp-Source: AGHT+IHuAOxtXzCgPBrdp5bAmlVDtunUBAbbk6Zek1hc3Rqn5Vy7UfRbt6b5OUG2vQgJn7Pm/udst/k=
X-Received: from pjbsi7.prod.google.com ([2002:a17:90b:5287:b0:2fc:2e92:6cf])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b50:b0:301:1bce:c258
 with SMTP id 98e67ed59e1d1-3053215e7femr21514740a91.22.1743638916776; Wed, 02
 Apr 2025 17:08:36 -0700 (PDT)
Date: Wed,  2 Apr 2025 17:06:58 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403000703.2584581-1-pcc@google.com>
Subject: [PATCH v5 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_170838_450235_5F1EEBF8 
X-CRM114-Status: GOOD (  10.12  )
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

This series fixes an issue where strscpy() would sometimes trigger
a false positive KASAN report with MTE.

v5:
- add test for unreadable first byte of strscpy() source

v4:
- clarify commit message
- improve comment

v3:
- simplify test case

Peter Collingbourne (1):
  string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
  kasan: Add strscpy() test to trigger tag fault on arm64

 lib/string.c            | 13 ++++++++++---
 mm/kasan/kasan_test_c.c | 20 ++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog


