Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C4ACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6rbKBgmKTQtWUUeEbXSUWDvuJjTtNqK/XhptsEjZldg=; b=WNjD3VAAU+xlxWKDR+jk9Wu5i0
	BdkQ8KanBLDxm+iJfRdAmt7qt5H4JFNo7bdu1bv/L6LLIf7Q8i5Zawgdsb8rMIjgJQ3s1gpHawpyq
	TEyYlWqbCk8fyBR4yPGvkKQ8QjcF1tmkPpz5X6rkTXem0HaZQ8aliEmc/Y4wpukdNjbVzwuIQ1JCF
	bD/Kb7K5toCdNoVTVAgyi+4kiJidkb7OrMJORXn7d4fUZIiAdQq0Mq4dnsLJuFmnca4Z6Rxe2Vg1S
	h9goyApArnPLqEwiGUGOoWTSH081p8ICEWnYbp9HYG2yISkeLim6/Sbw+jdRoP03bRggWTZjQBa8T
	+DLvKg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL30O-0000000GXBF-3pxM;
	Mon, 17 Nov 2025 17:27:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL30L-0000000GXAc-1OSa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 17:27:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-297d4ac44fbso41312625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 09:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400424; x=1764005224; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rbKBgmKTQtWUUeEbXSUWDvuJjTtNqK/XhptsEjZldg=;
        b=R6BV3xSkI2FlDby9CT2k3La+hZTwzoVnBicqOieE1sdeB0aZ4kJiq91Yv125sNvWFq
         kw4rlS36X886+9iaN0cXko2IFMUB2gkdTETr+vJMT3yY6X2og6OXeE4dBRLd6t3fU/hf
         0KfdFfhEorGql8cpUCBK9YuRcLKgbKTtwvmZcbG3xwBtvRWW5UAO4NDy1F70V2KImznw
         MOsxv81I7RMQEeHXvihjYPLwM0NmUBQdR3fknrL6qZE3f6xehalHQZ7R/8JXvisUiLsJ
         BxrclO4mLCmIVyvi9MV4ulFk+cp88GdnyQnjTublkJsujIu7DVjBaeKyHTn8Bvgr7dOP
         Xwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400424; x=1764005224;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rbKBgmKTQtWUUeEbXSUWDvuJjTtNqK/XhptsEjZldg=;
        b=LJRvdkC4ovnqxqPLS9gCdPE7b16/1+usxf+RjezZ+IOSJm+XCu1ioxvl3EHqoRZaCS
         buNXx7+p51bTew4fR9Q/JUTJ5ZMijIAoeqaRltHFyvCHsyiVFPHUX5mcNwP9/QNuSaCz
         gz0q1GnK3QxXvD9oTDc+HkdTf0VM0jL9EU1D+z9M1E4RNDozFM1a1QTQUckoQQoMD4ed
         NXKgxP5Hjliq6DzNlbYz5klVZ1kbovxVM2HluXPslGcW/Qf6vbmHW/5rBVk0eL2aeT3+
         20dR5Zl9SJKQ2qafMSSzhlkcX9CSJLbRV9hx+9AJ6XdVlYHmSRcDJ3kKlHvFY8Eo8H3C
         JKzw==
X-Forwarded-Encrypted: i=1; AJvYcCXqyekkDMAP6N3QQl57/osR/Z9vcuIWEcUV+nBwsSr4YDJtppIXfQsHNer8B4G+Ig4AWkFvQoRFQBq6B6zk4+0x@lists.infradead.org
X-Gm-Message-State: AOJu0YyIzycRkch3hucIc1eDKRpJ7UOwX4wNcooj03t+HjJ2JT/CXcxY
	S/ccvcVEcbpRHYrPw69sDNchb1FmAK+tzzMlBDEKbKJKSfiC7BI0RAy6DaocA1NvEMoS/w6FJrq
	afZyIWz0=
X-Gm-Gg: ASbGncsQ6dNbj1TzzHJd8+SzZejYIELk/zt/y8FELSu5Bb5zNF1nW2EWsAXLtA2BYVa
	PIThKFCSRsJaNh+CxFaGn/8EEZ79yMXkRw2ywJWzMdFa9AwoxqG2qUkwvoD5LjL2ujCK+sT4a+y
	aZJFET8VnBBwu0h8gUpjjQoQfRf+Mnaoj9tJlE2k42Lex4ncK/Glb9wd80feC1dQm6qSbV4WZu6
	6mUk41dTQt28fSXPKXgfBM9us/Zy0y1dS2H6E4VXLx+7pAexhj7a1oaJVH3p42IQ0fJFKzVxcWP
	C8p/9DuWjhGEMDfLnFPLQQdkR3Ff1kpIUW6HiToY04lflsuksXCkcTWMXpQTWgnaboYcpmwjTRh
	Tj8uZKBpyKEqtX7M22vFCG1V2zAdh4FK4njXvoQ80XWkvL7LeaA5GAbguqNplG/wWrTOKOhO30A
	==
X-Google-Smtp-Source: AGHT+IFA0UUsyMIJqov1zn7h2UMQsI01nWNIxprKp+P66lGVB1wQy6f1ak+AtImwdL+V+x6WJmuOzQ==
X-Received: by 2002:a17:903:191:b0:294:fc13:7e8c with SMTP id d9443c01a7336-299f552c33emr1059985ad.13.1763400424299;
        Mon, 17 Nov 2025 09:27:04 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29864b00fc9sm121055215ad.40.2025.11.17.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:27:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: omap: updates for v6.19
Date: Mon, 17 Nov 2025 09:27:03 -0800
Message-ID: <7h7bvolgd4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_092705_478698_4F4C510F 
X-CRM114-Status: UNSURE (   7.84  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/soc-signed

for you to fetch changes up to ae18c465b3ae0879a023b4a89c032064afb78234:

  ARM: OMAP2+: Fix falg->flag typo in omap_smc2() (2025-11-04 14:47:46 -0800)

----------------------------------------------------------------
ARM: OMAP2+: Fix falg->flag typo in omap_smc2()

----------------------------------------------------------------
Ali Khan (1):
      ARM: OMAP2+: Fix falg->flag typo in omap_smc2()

 arch/arm/mach-omap2/omap-secure.h | 2 +-
 arch/arm/mach-omap2/omap-smc.S    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

