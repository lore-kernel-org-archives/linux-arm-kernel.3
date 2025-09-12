Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F68ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/qUTD8uROnoCtAqaX/Ri9iIJ3aP0OlkHXH5AZacDoiM=; b=WZIDmyE7QztAquZxZ2BwW4mtor
	aA+k54IsIscugD2fvdjDbJlSNtZJ88BFE9kJteF4P77rOJ7u+LMLPGVbhU9UZ9VcLvcIXpmQdZPEI
	KjxoCR+MxyTC5CYRUU+PD86IFzEG6U+KzbLOH8uwjVebsVZ4y5FNu1SSp5XrBDv5Tl56xpXuXu6GU
	8I6xzeVjiIkkbOjZm9nt7N1jyGI0kmR9ElE2p4KXok1a2UOF6QArq7uGDPiwR4S6rt/MUhHtbopbn
	hqMF1+mkbqTBkroik6fEpLcl8C2VcypZyBZfM7OxsXDhCyonUVNbzzAqwYheDCYadc9MnVppXRk70
	Rb+eZ47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4nm-00000009uP5-3YdB;
	Fri, 12 Sep 2025 14:31:02 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4nj-00000009uLG-0m9l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:31:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-336cdca64e6so13958811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757687456; x=1758292256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qUTD8uROnoCtAqaX/Ri9iIJ3aP0OlkHXH5AZacDoiM=;
        b=H8SUt9XoI7An36iW59ROP/cN3mKoWnhkznguRDVtxU/Fz5uU4KyzgcOgxj3OKNUulx
         nqFBBtJ2r3dDVtBP+Hpa2y5s9Vzzn756vNvhDj8M9ugworOciIQTo63Sf2hfQBn1ov+k
         uscIAnosYqWbtOqLXEYaYhg3Wg1geJ/N/PxHlK5VnFi233uaEmk/Rech/6PohqDJZXN+
         oOC2b7QbboyvPVpU7GbZLAwUVZSJWLeaMeY2cfAhwwOvIjKgmqRZxd1eDvpopgfzt/0/
         6stAgCX4OdbTyFEbcLIRTZc7l3+N6kS0Skfh9yNrLo6plzSHhZNpMF/MJoC7tvyaue7f
         jl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687456; x=1758292256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qUTD8uROnoCtAqaX/Ri9iIJ3aP0OlkHXH5AZacDoiM=;
        b=TV5bYQhYlC2qxc4oGVAd8fSHu5DPWDU4RlHuibKb/c/QUJ+BqSNVoenErTjwtWtAVl
         gnXI4RZ3wwKsfhBg++GLpYJa3bm9T0CbrOVJKHr6v1nUAquJ2nNDFVTZWdJ/hj4WTBR8
         5eF4rUp671dZJmmjeNfJoTMgy8ChBMatYauHuoEd8Y8iAVX4VyhCnSxB8jRLWjf70uFc
         SNSeIOR9uXOR1wqySnSUI9YsGH7g5V5gWQTJeYgo1RVfvXJssiRUJRgWIGZYfFL64+3P
         sSL0AfUK/zfq8j61SmtPswTcEdWljQQ1c4KlMOR3OFqT9Cd9mBg6LLKcJOMCSlxfQdPJ
         xFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEhhlqhwSOj3ksk34xmZJvvNRFJWujUsOmi8IOHpVfxt4lwEpxQgYyb+mYNKW4LiytT2LMNyYkuo77PSSh2B/B@lists.infradead.org
X-Gm-Message-State: AOJu0YyWCwD5R8lfy6sxU3t6gUAAkSpfn4E57hNlY4yEJvSlzwAhpYH9
	ABiOK8CepfU9OPKe/4VukXiMf91I1xt0Ft+qYLzL15RovGJYbj3s5jwZWhrP+RP8Ri4=
X-Gm-Gg: ASbGncv1l0tw8gOhXnsYfghfZKgMrIrk2Ma5+90FSAmpBXj/cfXvnUVymIPyDzi8sfX
	j9I8/wQTybBhsBacuVSNIMNiXgKj3dGJO5czzRqN8nx8MjKGwBs71DXrWBc9rAY49sA5t1QzFN8
	gqgMVy0SdqbQAAsAxOtHIRvSChwUWEDhDKoVf0xJO8zAoZew3YmLGgW5/CJ0fJ/ItZaGi4O66J8
	mO5tXduhmCFjZ3ywp8VXesxAw5QwZRnq4bz/sT7vcxpfr8Bsk8EJpvQpK1dYWfeJpqiyNtvd4/l
	J6SH4ISO5OFdc33yJLFkzPnJFTK78+b3FQgf6Er4BbtizQasp8AP1OHSG/I4jOirYDr8Af78mRs
	7OMdCFi5jIId7B+c9JNPvbWl0LxF2rf1jo/W8X5dYCTGg4/aGX4+/s/7kGB7+ijqknw==
X-Google-Smtp-Source: AGHT+IEVbatrp/SxHPXDJ7XzOlydV9X5r4NdpCXVehaL+u52W8sQ2+DoFuN3K9k4u9FvHmP6U/Ibmg==
X-Received: by 2002:a2e:bea6:0:b0:335:4d0e:9493 with SMTP id 38308e7fff4ca-3513fc380f1mr9860391fa.28.1757687455991;
        Fri, 12 Sep 2025 07:30:55 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1c6ca914sm8495711fa.67.2025.09.12.07.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:30:55 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 4/4] ARM: rockchip: remove REGULATOR conditional to PM
Date: Fri, 12 Sep 2025 17:30:36 +0300
Message-ID: <20250912143036.2844523-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_073059_229015_E5B6F04E 
X-CRM114-Status: GOOD (  11.36  )
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

PM is explicitly enabled in lines just below so
REGULATOR can be too.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 arch/arm/mach-rockchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-rockchip/Kconfig b/arch/arm/mach-rockchip/Kconfig
index b7855cc665e94..c90193dd39283 100644
--- a/arch/arm/mach-rockchip/Kconfig
+++ b/arch/arm/mach-rockchip/Kconfig
@@ -13,7 +13,7 @@ config ARCH_ROCKCHIP
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select DW_APB_TIMER_OF
-	select REGULATOR if PM
+	select REGULATOR
 	select ROCKCHIP_TIMER
 	select ARM_GLOBAL_TIMER
 	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
-- 
2.34.1


