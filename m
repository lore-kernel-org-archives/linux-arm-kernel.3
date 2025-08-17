Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD98CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 05:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=; b=O+NLN1E72bv8U80MNtw3i7zQKj
	UEZ789aT2feKZjNQxoWGlpwgz/F9qMYmtBNA8NBxX9UEcWE1IE32rnD/VRotphJ+CDbY8OaTEiO+s
	g32d06Wxi4/dNeozq6RuvhpiABJ6l1bcf8MH/qJyrHkljAJi7Q8VKHapmS83KUomf55t2GhgHIOfy
	6eYZQ3eXwmF8GmLlT7rasoEb9GxeIs48knYM+/CGIWUr9hJZ1nERTAAAyPHedZYUU9BKCMBE6v7Nr
	ODvy7JJw/a5Sxfl6huI5N2lgV8d9NCSXRMGF7zlznJAqkOhxOP8MCS8IyzQjCCrwh6zLihDY7ApYw
	G3jJD9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unW4c-00000005NTE-0Mk1;
	Sun, 17 Aug 2025 05:36:54 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unVuH-00000005MlV-2gs8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 05:26:14 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b47174beb13so2305807a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 Aug 2025 22:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755408373; x=1756013173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=;
        b=YNHIJMg4keSTR2yIV9+gYEgMTTygRRnGOem78n2USByb3bbUKacOC8ihk9uFnU/04P
         LJ3HZZP5105cxgMhdcNeQvw7Sw86boN2u7Pf82hg36zl02vEXtNXIsmbnTzRDQOSU5EJ
         i1PkaYkv4fAXwLLcLSV0+7gJBILwkGP8+F5FOBmtXNguPL4DmaTE1ylYwIVGrpEEfKQ6
         BVFveh++3Nl8Cw5BT6X04nv0FjeRtjtS7qA46W3rqHcmol6IskA+JP16f7cHW32CIbwN
         vaIfclKjBhFHKhYCoIViHzMYTpD4NwW4QzFDe7McJciL2fjmqFodBtTQ+wsmnA1bV5sD
         J8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755408373; x=1756013173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=;
        b=lwmmdvCZHwzN3JbhgGbGFzBdJm0Eg2BCEwqkvP0W0+lTHm7+qMqr0A7gIbi0hQkptc
         s9Z1SZ3vf47hsKWbT5mCOs08IVH7qnLdq6Jf0tQqyRFqP9xEeobCDD31X/a7mxD2golE
         zTJXaGShk1Iecw1mIC/UPyGjzG5XsLIsWvONdwNnem0MJhT7iDpuhiJT006MrZyvx/Bf
         BqZ97tFOz4HjM7DfSF24G/jvSsJYQMB0FumrpgmmuyuWmrA3zLqIgyBM/UnPq6MnfBq/
         qb/PQh5pzA2nv/7BQ4iIUp3eAvvVRH1/QMeDB3qddrspr89kK43Jdv5u0Algt5lwKfwI
         sCVw==
X-Gm-Message-State: AOJu0Yxc7xgcUS69H7AAC9B+MpylSUW+937LI+WPkdbeULg7h+cMpiVk
	sdVGPEPD/Mzt+Gy24GQFzsINeiSzMTIXB5DW3HiwzEaL/WqqV7g0OuER
X-Gm-Gg: ASbGnctnuBBUaywPgT3CUcoiAOhu4RCrQJlJiv7XP1s6qppyi1CWlZf/urzU3exD++g
	XF+/QAZTudml3o+A/cy/Gt8qzWmLmuV7lfDlfl2TnwpvMDiC/n8xJx0ZcVYAa5fkSsE4iVlPXq2
	FOrCktz/Sfu6OZS296VsoqU6nOmiEzaYfWQl2GrX9r0weAonZA16W9n6cPfbRh4KZDytOR3HsE/
	3nCFfS/pT/ZtEGuF8FiyXrdEdQXwTmLUjXNbUcAWqQRIGClEUteTVNdnKtpmq2gp7uAxEWIGDXS
	Fl2mAjs1r6VOfZPqLdVsTVWqi0IJZjW3ICLAtIuad1Pfu2PX5ed1SZDGpaa6u/3AakD9CVxm7ea
	wcW5y2dH+4Fh3Ox6JwxLGT9hZEy5PYEtOrMROa8DMureydRt35OMh
X-Google-Smtp-Source: AGHT+IHdjmdWMdhWhx9c/Dnojz/XQXDrYT7Ob/K203nbXSW0BK9VyArE/pQuc2DTFfK490Vyj7q1Qw==
X-Received: by 2002:a17:902:cf03:b0:23f:fde7:efef with SMTP id d9443c01a7336-2446d8c5ae8mr112386625ad.30.1755408372801;
        Sat, 16 Aug 2025 22:26:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d592448sm47417625ad.161.2025.08.16.22.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:26:12 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 2/3] kselftest/arm64: Supress warning and improve readability
Date: Sat, 16 Aug 2025 22:25:51 -0700
Message-Id: <20250817052552.8953-3-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250817052552.8953-1-vivekyadav1207731111@gmail.com>
References: <20250817052552.8953-1-vivekyadav1207731111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_222613_683623_5DE75337 
X-CRM114-Status: GOOD (  13.86  )
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

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

The comment was correct, but `checkpatch` script flagged it with a warning
as shown in the output section. The comment is slightly modified
to improve readability, which also suppresses the warning.

```
[command]
	./script/checkpatch.pl --strict -f tools/testing/selftests/arm64/fp/fp-stress.c

[output]
	WARNING: Possible repeated word: 'on'
```

Fixes: 98102a2cb7860 : kselftest/arm64: Hold fp-stress children until they're all spawned.

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 74e23208b94c..3a0ae96cf909 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -105,8 +105,8 @@ static void child_start(struct child_data *child, const char *program)
 
 		/*
 		 * Read from the startup pipe, there should be no data
-		 * and we should block until it is closed.  We just
-		 * carry on on error since this isn't super critical.
+		 * and we should block until it is closed. We just
+		 * carry-on on error since this isn't super critical.
 		 */
 		ret = read(3, &i, sizeof(i));
 		if (ret < 0)
-- 
2.25.1


