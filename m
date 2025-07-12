Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C06FC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKgGfotXYydNQpTmp9EldXAQ8RrwqhRJUaEpLQizexw=; b=1ITndDYy6MV8yYlNnFxxGaVwBb
	mChVAkETujvx8vr+wZprsIZ7hwG229TlMP5Ej5AAG2oOpBwl4xX+qZnwfkxIn9QPYCQTpFdIXjYkB
	ZRd7NquF3j7k3aSxMbrZIn6am8GwhYrvsNgF/8O2QtzPP8lufFp0SScMvYILASpnAMJMDgC0G7zxZ
	zdX/mmpFqpanC/iVcXweOHFMv0pzkGLh82If5v9UWloVI8vf3tT6mo5qWrOjozFTIz+IgM+7g8b/8
	UasDB4zLksgSbdIRZlVgORQP4UqD2zh5pC/ht65WIB+Y9EFzyDuuVURGfzx+0uOFLbtJ5jMh1s2Mj
	ku4X5wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaall-0000000GhDC-1Swj;
	Sat, 12 Jul 2025 14:00:01 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaahG-0000000GgqB-2Lgz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 13:55:23 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-236377f00a1so27992295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752328522; x=1752933322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKgGfotXYydNQpTmp9EldXAQ8RrwqhRJUaEpLQizexw=;
        b=W19KKI7bUP6qgg9DH3RnuEJBgvz4egjyYB2yAtzAZyA5TA285pkwR2sUkDDlO2HgMu
         1lQwDNXHs819kcWDiTjmlC9J0IhZqUgpwRI6gddZ5ENPJx/U4EWYDHub/lsHKUNNdEJ4
         RWcmOnH4O7RubW5/QFPY2P7W/xZdAlYoXWJbadg/V3fDyrJ2sJSrQvgJ3TQVNOhvG74u
         SciNyxtS4CCwN90Xu++ajxJMVoWubUVN0St0JlEe3qWtj/J+pbsgWnni/GNUKnbdKsES
         Mh90zSH+QYz1btaOnq8bGi/3sIhxXzsF/+GCef4c6rDuOzH4YIwOWoHUaIZ8wVoiJPsf
         UenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752328522; x=1752933322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKgGfotXYydNQpTmp9EldXAQ8RrwqhRJUaEpLQizexw=;
        b=OTww9Zt74ooXRNf1gq3ScfUrGjcu5X/Ip0pA4RhQ2Bz7jembnynBXO0CqMajsA1ioz
         4DZeM8siy2t5A5HLiRpTh9566vTlTaPqu/nPLBXsB/8VMqoUHdzxs8EXxSLGA8Ln71c1
         hN6xRu6MHMU16AfesUjUk40wMG0L3LRs9Cf9/M6p57ASdRt29LpPy4SZk0jkcLqmhekC
         FokOkOhYL/enduA17kfp0k+CkZmqAh80sOH2Aea0ilsHjBKklhg/x7yTQhk/MaiWxHeH
         HdBLUmzSxnCh7kzcVhJ1b4Zvxl9s2B9FhQYHa/m3F2trkTNOS0yo8O0m6iSEV00xhmZR
         jj0A==
X-Forwarded-Encrypted: i=1; AJvYcCVJhVTPdgRWFR6MtR790bel2vJO8CcfiJcinopZ8KjRRMtUDfK8XKlkylU7UzTpZx1gb0m3dgljyNG81+19/AHj@lists.infradead.org
X-Gm-Message-State: AOJu0YzvBJ2pPwuiIcSNLVv6MXWaWfevSJYdeH4JJbrhqudAmiJHjvTn
	m6YNNOjYkRGnjNhQjfHltXQtqFpTriLJdXPNUq0XycNkI1kIkM4/lKw4
X-Gm-Gg: ASbGncskosaZVP4qa4Pxt4BBertPwJv4pIYk1JWwR3hXU2WmrLnjtCSTiXs+BoDMZ6M
	72pxJhxEuowccLKzRuAUxiyAFNjQwh5ICCD9a6vd9g1cwBlqOVsDhWh2yYIt5e86CWJkFHMR2At
	WMRamcGH38g+w7B9T2bKEOiCToToXOowMcJCeAQPKBs3LBxmNUUbka/PuJLa6IlcQYHqYnstMG8
	Um+zvMZUj/W+yZKykkS/tTuuWz6PVt2sFWmbEFeS+6rMqQdu4oRUxDPQAgKqbs4+BiuKYpwNKJO
	Qc7xe+UpU0SgOIQX7ritppToxm4gZXZUYStbE9bclwWZzrlFZQGiMNL92fjT1czlSRI/iWWvytx
	YCYC7AEVGAD/AF6naHiPOGF61QxALDpcjG/QI
X-Google-Smtp-Source: AGHT+IH6HY+p7Hp/Yk/auxux6EFH/0htf4yyEg33W/v6Shc5j9xmPAHiObaFWd+rVZyTMTg5E1r2zw==
X-Received: by 2002:a17:903:fa7:b0:234:11f9:a72b with SMTP id d9443c01a7336-23dede96972mr84775955ad.50.1752328521616;
        Sat, 12 Jul 2025 06:55:21 -0700 (PDT)
Received: from daerolee-Swift-SF316-51.. ([49.142.96.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43227acsm65559485ad.124.2025.07.12.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:55:20 -0700 (PDT)
From: daeroro <skseofh@gmail.com>
X-Google-Original-From: daeroro <skseofh@naver.com>
To: will@kernel.org
Cc: alexandru.elisei@arm.com,
	james.morse@arm.com,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	sebastianene@google.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com
Subject: [QUESTION] KVM: arm64: Handle FFA_MEM_LEND calls from the host
Date: Sat, 12 Jul 2025 22:55:13 +0900
Message-Id: <20250712135513.608609-1-skseofh@naver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523101828.7328-9-will@kernel.org>
References: <20230523101828.7328-9-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_065522_597446_DF9D6A31 
X-CRM114-Status: UNSURE (   8.16  )
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

> Handle FFA_MEM_LEND calls from the host by treating them identically to
> FFA_MEM_SHARE calls for the purposes of the host stage-2 page-table, but
> forwarding on the original request to EL3.

Hello Will,
I have a question about your patch.

Does treating FFA_MEM_LEND as identical to FFA_MEM_SHARE imply that the host
can still access the memory even after it has been 'lent'?

