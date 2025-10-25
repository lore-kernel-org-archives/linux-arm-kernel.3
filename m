Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2B9CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SI4944tmBFmU7KoVih1y0isAHqVxAR8yUSqEtfDae0=; b=ZpU0WPn4ch0cHjZdwIzKDKZ0Tw
	huWblSAiwn7gn7r+U1Z+d4tw4Z7kY0JOuwEyHAztUkdNJFbfwt5Yj50YOeu9f7qOlMGJgpRaKj+kM
	aautgfFRqWpfvVpV1Xc5L4H7IkSGYGbXzrygWtfRqCj9xkXyTJK5y3Y+tlz/wMOrhOKu2Egw7IKJs
	fAGLOhzEnoxz82tbU2NDriiFV94YokBdp12EPJjqGJ0i2zMP5DhDPIN16i8a3SYY1Ek82Eh8pxOPu
	LL+nDR7URYolVSa5XzwuY028nRA4186f7yNvfbiSVuKgR/mzLiViB3yw50zRri96FGG6RT49twQdo
	qAsw5exQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCz-0000000BX1i-23Hr;
	Sat, 25 Oct 2025 16:33:37 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCn-0000000BWpZ-2cbF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:26 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-87be45cba29so28812796d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410004; x=1762014804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SI4944tmBFmU7KoVih1y0isAHqVxAR8yUSqEtfDae0=;
        b=Yj5Z4Ysn6DdTO4B+PBJpv3+KliCo2pS2pFD50ktJQcSUNQQ71bDiUrmKHox9xKQsol
         ll4QL8AN6k8iwP6kq4oh9aYt8kqnjmU1xETDp56UKIc1DoAChYc2mr2iOggghE7jBFHN
         JjuzwdEVJfYxhd/Vxbj4qG7Ar7kyMllOaFQWCdiTchb9Yh5z3fWAH48yKUxlj8Bl8lhF
         toewzmxSNwZZrI0gj1umBaM2aHMLnBAMQQafR3EvpHPjw68uOQMAEIAMjToHyYkbzr1R
         O+UKRb22ILtOyyJ4F3GE+goS37+BtueXhWUGN2MerCQ2xsFwa2lDIdCS7SD7GAKsJCJ9
         Vlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410004; x=1762014804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SI4944tmBFmU7KoVih1y0isAHqVxAR8yUSqEtfDae0=;
        b=tjy2UtCUN+osnnlCpx0UMHGDTD2vJAXL2y9CoQWPO9d3z5ukkB7MDQbSRtNgQjFIPy
         xBGz3lz8hNj/A7WmuR7VcxTkNFDFlhaAdU4wLSCIctrLzHav3M8EcUO7VtS/2XFnKgWb
         z+yFp2yAsvjtNqY4nm3Gh+9vKCK8bQxAwrBrVUyL0y4XB0BaraT6o7USJIQaGDU3sKqh
         1mB3PWhJ37TujutMnBvpOk0yWy9CQu8snf2+XpmQ2fC1OlftEY//0/7H8i1QizzxRWRC
         kBNsu0A+FVLvxQqs6ZgTC94ERE5QEh9x43YSo9vHWyeb/sQzKlMQlUTtdu6eTH0aYz+4
         anOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUjWAiQyP6AYgwJhIRBnI0exkIOLOZzK9vVCXVJlThLU6ArkR6ZpnSAKcon2wqJl0i0TbkWOUuFy+CawabHaiE@lists.infradead.org
X-Gm-Message-State: AOJu0YxFwjsouBRxAy//FA0a1cacEUZ5zUMB9MxnNFBQy7V60BEEC2F/
	HA8LuQlFmwEnE6BWk3c8rQYa+RdyIYnm/FZzLLlqHM15+Z4YICsLeLvF
X-Gm-Gg: ASbGncu1u4tbwSH7H+dHyEkY1Fd+QGHiB2k89S+/swY+F2YGap9auSB8BL1tFx6nXJS
	LB+JGx44iXkHPsSC97O6yjMGDNXMVbTpNp4hVaM5XRLDg9/SPXbeilLrYgco8plvmqqHsxzz4y7
	ly8hZCUQo0aVIvhSHG5938la2Qz4u+KvqdSd4Xr5Ulh1++Nnq4s3mNtzVjfRT3gQ47x3CuqFV+V
	RULtXL2TnXyuDjdS4/B1kT3vfCCAa3f1ECxp/7wfzLDXrKFM8ZUVYWCV7xvdkUDMU8Kb7Npwvi1
	+vj3PenKeXr6NQ2IR1AoJRvy1+madd7EZXinRW6aKQU3unnr2cLwipRwMRw2oTfmy7OmREq0Tki
	j+RLJ3qTU2flfdvzcqCGPeEsCq0EJSy/27hTi0F0jCUSt2FbjCCu1nNlsmoqjR7tM8nfcvQYKzi
	wEOQmDwko=
X-Google-Smtp-Source: AGHT+IH+pYoj7JDrVlr9V1K521EK2v4HXmacCPBcsmD1pov0NzWw0TEKhAqqwTmJ6pEikmRZLBQ+vQ==
X-Received: by 2002:ad4:5ec8:0:b0:87d:cbb9:5459 with SMTP id 6a1803df08f44-87dcbb968bamr327845146d6.40.1761410004528;
        Sat, 25 Oct 2025 09:33:24 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48d91a2sm16538466d6.17.2025.10.25.09.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:24 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haren Myneni <haren@us.ibm.com>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 14/21] lib: 842: don't use GENMASK_ULL()
Date: Sat, 25 Oct 2025 12:32:56 -0400
Message-ID: <20251025163305.306787-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093325_671146_AD00F92C 
X-CRM114-Status: GOOD (  11.26  )
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

GENMASK_ULL(high, low) notation is confusing. FIRST_BITS_ULL() is more
appropriate.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 lib/842/842_compress.c   | 2 +-
 lib/842/842_decompress.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/842/842_compress.c b/lib/842/842_compress.c
index 055356508d97..83b68c85904f 100644
--- a/lib/842/842_compress.c
+++ b/lib/842/842_compress.c
@@ -161,7 +161,7 @@ static int __split_add_bits(struct sw842_param *p, u64 d, u8 n, u8 s)
 	ret = add_bits(p, d >> s, n - s);
 	if (ret)
 		return ret;
-	return add_bits(p, d & GENMASK_ULL(s - 1, 0), s);
+	return add_bits(p, d & FIRST_BITS_ULL(s), s);
 }
 
 static int add_bits(struct sw842_param *p, u64 d, u8 n)
diff --git a/lib/842/842_decompress.c b/lib/842/842_decompress.c
index 582085ef8b49..0520f20f4121 100644
--- a/lib/842/842_decompress.c
+++ b/lib/842/842_decompress.c
@@ -115,7 +115,7 @@ static int next_bits(struct sw842_param *p, u64 *d, u8 n)
 	else
 		*d = be64_to_cpu(get_unaligned((__be64 *)in)) >> (64 - bits);
 
-	*d &= GENMASK_ULL(n - 1, 0);
+	*d &= FIRST_BITS_ULL(n);
 
 	p->bit += n;
 
-- 
2.43.0


