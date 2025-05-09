Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165F3C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTLAwJfpzTnDn2tZfb8KpMGtzN7vq08hC8THCvjwurw=; b=trERKSMBuvroJAEyYXllwtuHuY
	cOiw2UGGrFY7eW40/3YBo2x1EUTkO/oMqIdHf2yePgD+Kx2odt6D4vbGoPDr6u9iiho0kjtL7V3Ja
	jM/UMzTEPDUTdznNSR4V30CrCKg2YMCi7qvQBvTPIaDtTxK+O0NAgPVxaD0Yx7XDEJu4v4QLAuMIh
	DWsznptqnMFfRLRxvdBNSiGiro3S8KS8+6pz7Nwr30Gfk3ecbfWWERjausDaXhqRRs+a0N+S+vHLq
	3SeX9y7kErSU1XJGITIkn9CttEqWzXRt37wjA9LeVl+28kxaZr2y4LZ37AgGgBkPqJsZR6oPO/Dz9
	C9Svawpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIlc-00000002rqG-21AJ;
	Fri, 09 May 2025 08:07:36 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIS1-00000002nnD-3AP7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:47:22 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b20027d9ac0so812861a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 00:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776841; x=1747381641; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTLAwJfpzTnDn2tZfb8KpMGtzN7vq08hC8THCvjwurw=;
        b=B66193OvxSdLgm6lnAbR1YkLxaZGphHgknamb9euXV1m5DkDNLcAotoYeZsa1s6lho
         BBWgDR0c9pgWz+5zHwY4QHT8f7zz+QnjlY5+pqnGCqKNkKrXcg+RbFobNAh6jyQ4yvKK
         WeDSexNFDRE2o2HuxHiLJS89kbz3JXMzR5H9wzFVJLYOw6aIbNScVgtl/QUf0vY1Jouh
         gNf+VElolBEbQDX0XaZhOmdYrBB87+ush3iVJElDw56dzkx/tG19IOjNnTcrwsPW9Qbl
         VF1jPa/+NcxLjpNqHSnu3jc9ohfKO9ranANxwtazq46XrZiCfodTDQhtxHrovHlhQQby
         lgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776841; x=1747381641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTLAwJfpzTnDn2tZfb8KpMGtzN7vq08hC8THCvjwurw=;
        b=n4HC1CLLR4fMdWf8cfUG+So9n5WYCXQNuNaAOeRTzp6o9aR1lAqTHNmSkgZhjnh5D1
         cGxaohau4XIqT65AiCkx73o8ndoVgb9IfsMOPFaHhCuPCs6ku0ANhCGKgrc27bYew4g+
         Ic61BtOZxbuGLyfe2d9HBRIuVpFNGXNI1DcCX8E4KDPAKcT+/5VXemN7iEXMgihzTUai
         6kfXcF/vUgnXtVdqTRFfLOFwQvoTi1dEtUe2e4ilKO1SFjdO1838JDF1atV2RJrcCN59
         yLQsr5av5dM2bxTEyxAlgKfbJEGbDQzJIosKY1/Na0/XIUWs1MMOquOysfkqAgCYTL5K
         FlSA==
X-Forwarded-Encrypted: i=1; AJvYcCXIVj4vCEAnmym23h59TLgPPM9blbHh8IjLYz1EyiY28BO5zXN/F/PbQ7yJlHAUb6qjubrUMDVcMil0TlVkvFt+@lists.infradead.org
X-Gm-Message-State: AOJu0YwhAfU4gIZJAjmhGBYX/08EBcLYKkGglrdDAUshT7NqBHrqE8PU
	oLjF3nHW8mJfwsbrzE5fTq2JAAoFfP4tlH+WLu/YRJF/GmAKBsSk10ab7W1DaVq9S+qwmJ3e4i9
	1hVMCutaWKX4MS9TUCQ==
X-Google-Smtp-Source: AGHT+IEztQLwT7ajncZsBNt/V8Xiws9Mgn93m4FZrCV2u6FrzGGzzz/PUz6yE5EWUGsiWeksHLXg/JFNc4GUnrxd
X-Received: from pgmw23.prod.google.com ([2002:a63:9357:0:b0:b23:6a88:a54f])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9004:b0:1f5:55b7:1bb2 with SMTP id adf61e73a8af0-215ababa2afmr3522816637.6.1746776840848;
 Fri, 09 May 2025 00:47:20 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:32 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-15-changyuanl@google.com>
Subject: [PATCH v8 14/17] x86/Kconfig: enable kexec handover for 64 bits
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_004721_808385_37A6A785 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Alexander Graf <graf@amazon.com>

Add ARCH_SUPPORTS_KEXEC_HANDOVER for 64 bits to allow enabling of
KEXEC_HANDOVER configuration option.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6b..d1fb81ffdaafa 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2029,6 +2029,9 @@ config ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool X86_64
+
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
-- 
2.49.0.1015.ga840276032-goog


