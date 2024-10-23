Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F98CFA44F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTpDcLprhbUi5YHe62ZQ4u0o+/QxbhbJTnRiVU+yROI=; b=NUyG4KJWSBf2s+OQ7gnMAGvHnB
	ezIqAmquznzQYvb6vUJaMj7evYyCQ3T7yfswPU6LhvI+IZ8Cz22suP45oaz3iF9NqV18l1J5w5EYv
	VBVvbG3uZhc0dOv6HxExoQJWYeiFCUUpg7sFTqWQe4dw60IzWqZi+c9xXuOXj9biLcELrqYST3tGG
	BhUYASfNwNl9HecMBRA0HJM4mOVJ5xvmbm4WMHL2zwwW9cUGOrLs0vF8V7/dYwo/U4pG6LtQ6I6Jl
	Z81Cx4aC2XR2GRHuNOOuqjOTeBa3RrZW2wgn8OPnfSgomZ6teP0WH65eWUAJdsqmadKMwCBhrwC/6
	huoN3xTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e36-0000000F6ZS-2iGn;
	Wed, 23 Oct 2024 16:17:28 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dG0-0000000ExHt-1olE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:26:45 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e5bdb9244eso95316007b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729697203; x=1730302003; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTpDcLprhbUi5YHe62ZQ4u0o+/QxbhbJTnRiVU+yROI=;
        b=a4ed1REiwFZ2uQRRNX3qO22MjB4h+YxnRV0VBra4G0lrEqMlxB9m27lAPjnSgkMQYz
         BI49zr5lucNHuIHQItdIAZy9uKDcfVaMk1kK+UgCWjHSkSpph421blcKVxu+0FxIbpcF
         eEtQ3lBg41zx55JQRVPvMJWYFV7KL0Z4fd1jrHyew3nU8sWcu7tLWRsfvO/1xSxAgWPs
         hy4KxIuk10T3ikM+uB0eUDaBs5lejSdmqXhr+FzWLggILMCFaFwOLzg3J/UtQ+S+M46z
         QgKRFa2mh+I+I9pcRdB68sETRe85IZWhj3TMgWw5aD8tck0ZTzaWzyG0k73Ok6O4TXR6
         IRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697203; x=1730302003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTpDcLprhbUi5YHe62ZQ4u0o+/QxbhbJTnRiVU+yROI=;
        b=DcjTaPeLMa0XQuWtT5mzLUKVeFyh4TXrNHFvWB/m8EktlGRAEEfk/4aUC9LdCFKF0k
         JypdDyjac8iJJwA00qO6mny4XYEA1IzHRUyYZKv5pdS2YRBAb2h8CRYCoxu6MHpfI/od
         RjUa9cKUY1NIyuR8rBlbNt/W6AMWKrSk9jVYmk7+jd8NOi1XTP/sIHou0Zmcrm2t9xDB
         1U/bLH5f2HMRWtn2HZVzHXuCGjE3l6eePA3/t34+ow9AgeM6N9FAWBsEpHaqFYAKevDp
         IqZflQXkPQiJrOGTFK7pafg6+b6S5bQH1wP8lRZQgiejZsYX7+QINXFHrGCCK27eLX5H
         RNzw==
X-Forwarded-Encrypted: i=1; AJvYcCVauGkbZdf3gtsqZziCk3zrQ+9qTlkdLRCsPdyV5i3MoSZbpCFQfZTeNr4kKGOkN0xjWGexx8ZwnDqhO3+4SA0h@lists.infradead.org
X-Gm-Message-State: AOJu0YysmhXMZRQQO1YI3cbv8VGQjs8OrhIISs5btdTVRTEK3a/eSecj
	o6pcUpZOjLc7BRP8KAUbDf4VJyZAVmfTJSlaLb7JEJ7FsPvVHcEWZTVixsbdnb2R9NYQfJc/bZx
	mDkQGqg==
X-Google-Smtp-Source: AGHT+IGyKD6tDsN1UOGbK0zHzy2EM8WTJ3RRqhXskaDYZzY4RpWhowWcPc5+5VKKdGJS9/5Go7f2MraDRssJ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a25:8e87:0:b0:e1d:912e:9350 with SMTP id
 3f1490d57ef6-e2e3a6bc055mr2784276.6.1729697202285; Wed, 23 Oct 2024 08:26:42
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:26:35 +0000
In-Reply-To: <20241023152638.3317648-1-rananta@google.com>
Mime-Version: 1.0
References: <20241023152638.3317648-1-rananta@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023152638.3317648-2-rananta@google.com>
Subject: [kvm-unit-tests PATCH v2 1/4] arm: Fix clang error in sve_vl()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Subhasish Ghosh <subhasish.ghosh@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Andrew Jones <andrew.jones@linux.dev>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_082644_492453_171C2B61 
X-CRM114-Status: GOOD (  11.67  )
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

Fix the following clang error in sve_vl():

In file included from arm/selftest.c:16:
kvm-unit-tests/lib/asm/processor.h:163:16:
error: value size does not match register size specified by the
constraint and modifier [-Werror,-Wasm-operand-widths]
                     : "=r" (vl));
                             ^
kvm-unit-tests/lib/asm/processor.h:162:14:
note: use constraint modifier "w"
                     "rdvl %0, #8"
                           ^~
                           %w0
1 error generated.

Fixes: d47d370c8f ("arm: Add test for FPU/SIMD context save/restore")
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 lib/arm64/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index b28d41fd..e261e74d 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -159,7 +159,7 @@ static inline int sve_vl(void)
 	int vl;
 
 	asm volatile(".arch_extension sve\n"
-		     "rdvl %0, #8"
+		     "rdvl %w0, #8"
 		     : "=r" (vl));
 
 	return vl;
-- 
2.47.0.105.g07ac214952-goog


