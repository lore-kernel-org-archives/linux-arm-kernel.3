Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8C1D41C3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocxfd2riU5l6RNdagWaPymuHyCDM3y1Y0L0w/bDOMGU=; b=wv+2xe/CxO5/PAb5ARO3U6CyhQ
	tvnu7Sx/3RrhaRK/6hLmyzbm5iWb9aoHZg8sswGGqG8exU2nhW+xRAEV0mXaKDlBFW3nvFQjMIe/D
	qbKh1p8H4i2q8MBl3iRWu8ddp9GZzg8MZz40hEZoq3hjyVMoqgOYn6WDoXTF9zJ7BefOXFIT64EYP
	3/rv3Yk3c7+rNJcMsUqFxjTgLGcuEdLiIP89R/0j76e1JYTtudNQruQ7quzINuqfgK/X+LevP9VMs
	yilGkuOKlYW0gXlAGtk0bDOBQ7EU8c2WlbOcEWagkEsX/yPpJ3ewrxhSaW2kxR1LI1JGsGi4iQ3ZH
	rtUDax0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGr-0000000Ggoh-07gy;
	Thu, 11 Dec 2025 14:03:53 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGn-0000000Ggmg-3S09
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:03:50 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-450c9057988so59668b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461828; x=1766066628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocxfd2riU5l6RNdagWaPymuHyCDM3y1Y0L0w/bDOMGU=;
        b=XJ5VJ3KU7UJzgvbv9ouKAu81a5qSfMZDXxSuzVZUx8v9AXRdxJfMvixm6dKFQ6p0Tc
         HqiXpoR5C7s7Pl49h5QIhFxFp1xYeg3SPk8QmlMOX4apSY8tm94HSPx0ndcAh4qjb8/B
         sgNApgBDzqO07wC8MiNxfRMKgiJCaH6HkAeLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461828; x=1766066628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocxfd2riU5l6RNdagWaPymuHyCDM3y1Y0L0w/bDOMGU=;
        b=vxSH7zwme5btSYNh6Hzl8tgP+o6cnojVVgqTFVk6iG4C9Ro8MIax/ZLhv3oUD3FV2u
         C0HXLOJ3wS9jumVAAcGAmbHJ01gORRF5puck40bztSmKVKeGYFkyay1pToW3kCk76C95
         IFdxwcg377C7d+o3xC6q03SMcIU+SFrVhTmKpecxsVibiqHrjONZ+VQbyIrw9htG8EhC
         mShRQ972z9JqLQtbHd1WvqrwpjSryptUuz2P7ofILPYSABFzKHHY37PwvMt0eKSINMNf
         VV5Rhx4wniQerRrTpC0uEtIa1TWxh1AP45C7dsY5HiqhgDPs0QY/TZBCfwl59VNVTSk/
         tltg==
X-Gm-Message-State: AOJu0Yy9fcw2qC3ZiTAY2LBbHFYdisEugNrS0e3jk6lb3fO7eLLhwdys
	z1dNgem8dJM39K86aFdJNugSJFYqhCB32wXfl7ivktQ++LsUjyBNz0Zvyg8/zg+s1H9PjwJ5o+9
	EMpw=
X-Gm-Gg: AY/fxX5gnvdq3vY1GGyTfkSkvRoBfbM5ysKpFnm8PsGS0/LhSC1g3OvKQC4JrOUUAxC
	M87FOfQoRBgs9ay/cM0hagzzqw2+fiwIcvnvhJ0fglyfOG7DloxjswPQQM58VYp//wDLIP+Igaf
	m6rdBoqZOOBHEQpMAx8yhNRNnchGmMftCrrrberUmoyNFATHk643uNZGtYPrvy+cGswHNfa8pfx
	00SqLDPbAn3DyNZNntwkAHpkV+KirsxSYb/IHB4iooCQgWi9O78aj/i1fLQioHwqPiulBu71WLE
	Up+3v2ZC3oEgJ+XQ0eEZXT0/CIR16LqL8lH+ixE/OTbpwiLnvoRLmIsL8bNBLElJ1kJc/3LclQA
	H4odPxgly3Jr7mamyOqMp7R/Ck0OXJROcAtD6O7wKTA3bqwTdpQ7pnY43IZ8ojhwQEWr5fC/f7T
	DZksNr
X-Google-Smtp-Source: AGHT+IHtuzi/39tczpLCYlwV1m0CpQpVxWVqkNMlvivSc8jFvfBYvWlon4SeWF8dguVxgleSft/DYA==
X-Received: by 2002:a05:6808:bc2:b0:44d:b8d3:3214 with SMTP id 5614622812f47-45586581c02mr2763469b6e.3.1765461828234;
        Thu, 11 Dec 2025 06:03:48 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:47 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/6] kbuild: Support a MAKE_FIT_FLAGS environment variable
Date: Thu, 11 Dec 2025 07:03:01 -0700
Message-ID: <20251211140309.1910613-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211140309.1910613-1-sjg@chromium.org>
References: <20251211140309.1910613-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060349_862017_6D804C41 
X-CRM114-Status: GOOD (  13.61  )
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

In some cases it is useful to be able to pass additional flags to the
make_fit.py script. For example, since ramdisks are typically large,
passing -E to use external data can be helpful.

Add a new MAKE_FIT_FLAGS variable for this.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v7:
- Add a new patch with the MAKE_FIT_FLAGS change

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..a5641a6538b1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -400,7 +400,7 @@ FIT_COMPRESSION ?= gzip
 
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
-- 
2.43.0


