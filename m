Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3774CFA44E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LgyTGB3pqM8nd2tlaCQUWlInWbsb/ECPLI+TMKap3wE=; b=jtZtVHXfwaaVaWotn5p0qJkR0L
	Q0AICCRxb2AfdcurElfKrepxxQjeuIJkMUugE5kVSrxpm12STCJdE0zJm6541Lg5CBzyW9JnS2rwG
	9MxG9ZU9DVl7AYuCCkTFEEY+41A3nXKSUkoPLl71eYmutsOJqMREauYpDRnQfIM+lVDTCYGHwGlmy
	HshUXK9Hk2qRR1I4mVh2iVV1yOWbyYME/LRvlbFe/yljtyn9TdMS2Jh8NFHCZij4UqBwerfzfYfoG
	KAa0po7Nbg9ZBB9lnlLe3GCLwTIfAd3mq0ySeCy4blyQBoF3NT7yROZnOiSs7GIiBdD780NM6fHeX
	ecdxepUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e1c-0000000F6Rn-3YNn;
	Wed, 23 Oct 2024 16:15:56 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dFz-0000000ExHZ-2VQd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:26:45 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e355f1ff4bso122981997b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729697201; x=1730302001; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LgyTGB3pqM8nd2tlaCQUWlInWbsb/ECPLI+TMKap3wE=;
        b=gmAJnPPpJJK4s/Ke+hjSgEkgYJcrNJJEUMveHc3n8oSo1UlT+4VyUfbDzMCpPJxQWy
         0vGUpSetw/jK0B69TW3YrjqMD9WEsXkvl2RqCmoN06PHHD/VtPjjKkw52/ohGOcL9nkq
         kPGgEwGQdac54E1W0E2n/dGkHB4mknii1c5w6z0aNesN5ds18ucJnOwFtuiohyn5w3K2
         DCm1lGp96LTRGEQFh9Iwk7sg8ENygIiwyf30D2EFY2PWMlUvAqUx5JIaM/wgFmGvpAr5
         +yPFlSVra3ZmLxReGGS/cfXfRk5tee30teGQkENp6+VTfY0jrLq/mPsYWFOhAJpjp+Sq
         wZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697201; x=1730302001;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgyTGB3pqM8nd2tlaCQUWlInWbsb/ECPLI+TMKap3wE=;
        b=E8yqYOs+G1jnVTHpQMradV3SWcjfcXcxtCDhYAa9IQnhPKdgalOV7pr+p0BO0+z2BD
         HkJ6vZvDkCQ4oqxxrkvNvNTkDn2Be/LN+3wQGXDTUIMHBCZzRd2ADmE082DtV/eg2qeU
         BDtc5euOtlsEfmDbw6bLfEJFG1+LdAGTireGbwWQYnhFpblnDFFeZSwmB6bPDCuywkZa
         H8NxMRcIPx1Zw6z2/tsGmegQbTP4jWUrg064HnHOSjz+73BRXe01Qbu9mqZA9uW0QUCz
         w/5NL1sKIbT5ywaCddNVWUyyd4rbL+WIIsZ9DgSTiQNRZ4Pd2DVkiXtLR4YDqmAUKYJd
         Er7g==
X-Forwarded-Encrypted: i=1; AJvYcCUNHF0b6x0iTo6ff9wwq39z/gXarsuMoxV4beFBvzFS+BDT4zOcUXG8MMFjj92fLpVMgdbXk1ptjU5Cf0SXzyPT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/iOTOUXJncgHi70jVLTsyFm+n4yI18AD0+npC0QEqR26gRzcK
	CnvNyDJflVzCQda8CKqOQjMKgZEHTweFmrbjC7eydeQ0wLynqJSuEvNfhPLH6VO3XEwxKErS1/y
	vagxuOQ==
X-Google-Smtp-Source: AGHT+IGZLylUFfRaeoUChkh5zta51HqScos57+PeLEawa/Zj6Vb0Z2er1q5qfJlHjZXBZG3OR/irola46j3M
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:11b:3898:ac11:fac1])
 (user=rananta job=sendgmr) by 2002:a25:b21f:0:b0:e2b:d28f:bf28 with SMTP id
 3f1490d57ef6-e2e3a5fa7a4mr5506276.2.1729697201237; Wed, 23 Oct 2024 08:26:41
 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:26:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Message-ID: <20241023152638.3317648-1-rananta@google.com>
Subject: [kvm-unit-tests PATCH v2 0/4] Fix arm64 clang errors on fpu tests
From: Raghavendra Rao Ananta <rananta@google.com>
To: Subhasish Ghosh <subhasish.ghosh@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Andrew Jones <andrew.jones@linux.dev>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Raghavendra Rao Anata <rananta@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_082643_663638_C1310F4B 
X-CRM114-Status: UNSURE (   8.12  )
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

When compiled with clang for arm64, some build errors were observed
along the fpu code. Moreover, data aborts were seen while running
the arm/fpu test due to misconfigured input/output args in the inline
assembly.

The series tries to address these issues.

v2:
 - Fix build errors for newer clang versions that push 'q' registers out
   of scope under '-mgeneral-regs-only'. (Andrew)

v1:
https://lore.kernel.org/all/20241022004710.1888067-1-rananta@google.com/

- Raghavendra

Raghavendra Rao Ananta (4):
  arm: Fix clang error in sve_vl()
  arm: fpu: Convert 'q' registers to 'v' to satisfy clang
  arm: fpu: Add '.arch_extension fp' to fpu macros
  arm: fpu: Fix the input/output args for inline asm in fpu.c

 arm/fpu.c                 | 52 ++++++++++++++++++++-------------------
 lib/arm64/asm/processor.h |  2 +-
 2 files changed, 28 insertions(+), 26 deletions(-)


base-commit: f246b16099478a916eab37b9bd1eb07c743a67d5
-- 
2.47.0.105.g07ac214952-goog


