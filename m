Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7054FE63CAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKeOq2jFRMMZAmsowpJB7BeSZMKyFH8q3I75Rg2q8pM=; b=a/vqIVlFLLduTp4I1dXtWXSrSe
	tZ2YpULyJk3qZdOxuH+5VuEX74TYKohBKQK0aUX0eV2mJB/HvVC9BRITSdCYIHiaCpQK9LvXnBwwC
	j1QAJXAD1vAYuK6L4zqr+ONcv40M7M1kmfCyQYPJNwdoEjQ5aCGlBcMXseiR1CL7QXWrB5m1Yqs+e
	zxI1dC7tQ1X0V6aE+XZKy+wGL+oz5LSmYsKbIglHyOMm8sqCVVaJGKCK62itDasAzz93v8AS3vHZ0
	nAs4fya5kTnHQSyPtx7WdzUUaLPD6nZ5PRsdofrfB+OJXsMLViO8iu4bSAZ5f5hfdATFI8GnXz0mc
	YpgD9Y3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3AG-0000000BJv1-42VO;
	Sun, 25 Jan 2026 16:40:40 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3AF-0000000BJuX-03Px
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:40:40 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2a7a94c6d4fso17285735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359238; x=1769964038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKeOq2jFRMMZAmsowpJB7BeSZMKyFH8q3I75Rg2q8pM=;
        b=fmwtzHV77UDofQPWKdK+Xjc/NNdHJVLSsjvfT+FrDaajm/SZepf0sKQxgl4OQB64Xp
         KjVMjcDaSnrtBv2Ln6Fl5eAnPa1fTLKjOhMao+dfZKvCqwYqAIqbgrjjsnkqBWXUiLiH
         a/c77KkzHWHYEqidtQWApGavzxAIG9vwnf27HvVy7zkCzd2ahO8d9beY6n187nas/cHu
         mK2pD26qjgD9ESbOPrNLcC3vuIHEnai6IwgbKutToPENPDqeMvMND4ixVdgRBGAcU8HW
         K8qPlF+gE4fQ2SwaMAmKX3W7SbOJ8uQ6Ebx5zBIBT3ygER0oRXN732pyF28ShJH9JibW
         0PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359238; x=1769964038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKeOq2jFRMMZAmsowpJB7BeSZMKyFH8q3I75Rg2q8pM=;
        b=ugXvUIzN3oYHTyfHa4P1DqfnvffMXrZ30GPO6OSS+fLv3MPL6DJIVVd2MldGi5qFnU
         +72MfFwud/6/bsg7VedeY7WgMbqgAA6cqxkOjApjKL2urxtdG6FTsp347RSuN4wWe4FN
         LRwUsUEpdWIcfrcb33h4AlCUhW8SnvxSa6ymabZQh1zjDKPpPqxBwSDPlh0hOKR5o8sf
         WW/kwA1ExGZhZWtxmTQM3Nc3PTLToVb0jNqrzKqBw7CVXWsa/wI4EgsB3FJqdl3Yy+ni
         48PYaeWpMF3Qm0VQxE/9LDc/1QieFy3mGjCxFbAE6vBQyLkqE1Z/4oZilJTQ4ygrCiku
         0edQ==
X-Gm-Message-State: AOJu0YwVwntweD9JrHTIHTFGuHd9VMAw/0yJRvN3lmZfVbC9/6Z+62Kx
	rMNnoc5zXK0PwZyik51Gdvu+9Ie38LFB/IZ6Cc+I9ulWJNKCBiW/iVEL
X-Gm-Gg: AZuq6aIixO3c/Ec7hU+XtOWvTU2ISBxfCvxYoAjfwCA/x8Ky0Qyai7SZInG3QCNA/J8
	NkwNt29y7uuvauljL1m/SYEpy2DvSyczRrdLBHr8XmzpJoXav86iZke3g3GM9n5Cbqk947pqcK9
	5F16pbxtL7YmI2d4sxDLbx6wfWV67d5AONVVgjrbLEMRm+kTq5lpecQcN4QdMnyY7jgPyjvuCCh
	J3AVjZNVI4UpaQamU8CN3KqD1b0EfcuzdnlfMujWc5IQuyArs2gXXiTs+qz9LWrR+MFpPgdlOcf
	1TU5GTscwJCM9EfuAibw6m/I4QG3eyGfXaNBU+cvgeAoXqdWum/BaZUX1mhdh7rmESmyCJgTpi5
	OueSkW+kSdViHfYuYrENxnYF4F9SnXYmFBqTFFsnkPBWplNuLOsIs5dNLnaZC4nW8bovwZ7KZf1
	90FszH5NXjOT6YK+qwBHNQ8coilZJQtoJG3cY5XRj0eg==
X-Received: by 2002:a17:903:2a87:b0:2a0:941a:6b08 with SMTP id d9443c01a7336-2a845257d1amr16198705ad.21.1769359238064;
        Sun, 25 Jan 2026 08:40:38 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:40:37 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 1/9] ARM: assembler: add save argument to enable_irq macro
Date: Mon, 26 Jan 2026 00:40:08 +0800
Message-ID: <20260125164016.331257-2-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084039_098970_0A0AF520 
X-CRM114-Status: GOOD (  10.58  )
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

Preparing for subsequent commits, nothing changes on vmlinux.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/include/asm/assembler.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/assembler.h b/arch/arm/include/asm/assembler.h
index d33c1e24e00b..69fbe8de66ef 100644
--- a/arch/arm/include/asm/assembler.h
+++ b/arch/arm/include/asm/assembler.h
@@ -155,8 +155,8 @@ THUMB(	fpreg	.req	r7	)
 	asm_trace_hardirqs_off \save
 	.endm
 
-	.macro enable_irq
-	asm_trace_hardirqs_on
+	.macro enable_irq, save = 1
+	asm_trace_hardirqs_on save = \save
 	enable_irq_notrace
 	.endm
 /*
-- 
2.51.0


