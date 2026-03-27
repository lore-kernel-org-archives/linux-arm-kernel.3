Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E62A10BA437
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=; b=wOt1IkMz5a3SAlVxtP7hkBYr8I
	n/NOYpewHVfsCmCLb88KRDZFbMa+oTMiFlJvZoYbjSPVhSQ6pwKPM31h9T07dBIqDhO9WKhkrLhBl
	ivmuzdXbBx/33KGORrGh9Yec4sKV6ua09vH4c0BkUCmCqi+2CChlDw2zsmgErSmUndmeOPq73O7Qx
	FxjRSPwVFhP6UDdz40leiO/Mp952Um8xiZGKaqHufq7AATlDpt2PDhEv/vh1giutloTpVjQx7GeyN
	Pw6GOFSYMJYnHj70EPE0EomUVku8/mZy0GdlAjmqyE7+KQZ+v0rn0Je/XAcetXF7UWSf9K4VYhPEK
	lGF/JeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w628E-00000006vI7-2pin;
	Fri, 27 Mar 2026 08:01:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627s-00000006v7l-3Ke0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=; b=ZR2kAfA6DeEPpVOs8xU4BVrm8v
	a6SKAHk1F31LiiR3IkPtBMviOAJaEzT1F+UHWmyuWr1++qTRe629wZklvD5wmrARKkzTLCJt7eiDf
	6lMW8R8oa1/7h/u5mdBIk6k2CVoNihR+37GUzT4ZbnaE0vb8B209K7xrNqMBTNV4ajv4PCuCPoJQk
	aPMfaeperZvnf4cW1LNJeG8i9aKAb38yO3CZoiFLf74lYrpdBkMX6WTM/l6e7KiLkjMAL66e9e1vq
	CMZkroIzt3z+y+clWWcs4boAokz2tE7qa5jCku1OvnC3GttjBXcni95LO8QW+/Y+Tzq7YcuGFfkVz
	QSa34uPA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627o-00000009vKZ-2Hi6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:01:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so20543815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598459; x=1775203259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=;
        b=Plu77CUATJP79Ph8b81mGg7OgnaCJkWtBA9YAOSwPfvgXuxaBBIM4Y3YXte/6jzHf7
         tPEYpR0Ir0tZOTAQMJaISfny0kw6CwwemVOwc88En1IkiBzf7D7fsCwgojcl8xZG1JoJ
         jcaT1kl1u20A5S3YG/vaCsF+AT2g+rreodbFvo7t36/tIa6/Cd/M30OZDc7WcFQPRz94
         0BjNQpMf+l9/lwtSFmMqzk6DDVLpp66X7Vpl120wUtUMiOpZ6uCCWtYYlhXbU1SzOu6v
         jnBjjD0WOkg8GWHWZNFbnQRkqS/4285wBN45dk7PfCBDx5Yq5bYynzVp6hmoYCI0tsnQ
         kmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598459; x=1775203259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlVyZgwbk35jZ7E4LjSb7Hh9QtkNRjrn39+Y58oA5YM=;
        b=p8kpIo/bbo5ZluTiRTFBVHQA6xW02NFetnCu2Z+QD7DFWWktWttLb/xDE+lRjjRt3o
         QToGrOvQ88iRFir80CS/Vi1skNNFiGTDqQXG2YXMjhgeZddnzyEKol12fZ4W/OZWhpkC
         OOsgW33NI/jl403Qf6ZeSJiV2HfqV/l0lyogRr4+i8981938NHCFltjJ9ehexb1TC9Ew
         YZUqYOV2Wqk6WwDFjZ5PH+dHyYTjOsIGn7pDItC/aT+6y666YpffRNWf7ybaZCtrA+H7
         6pdWrq56sJai7CjTSVFZ9A/PVOHaA+ULFnXHewkNhD1MH+7WZ4v010YIC7FlPwYovz0p
         P5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUqGwtALv1sAFwhuc1UzLRQDe0GoqMi5HkG/SpwZxdgmVG8kYrghbRQh5/WEi0Z3wk+anikdSQqJ3XppG8h+Gch@lists.infradead.org
X-Gm-Message-State: AOJu0Yxffa4kXHW56PDf5o8ZaH5GpF8q7Y9Cbp8MUKlrBkOTEIwgYO/L
	lCPpGjG51bpVBj2zl/RnUfBLQyzCKLz/Gsy9B/AT4YwNv/rO/+61IUsxpVsDLz5O4YE=
X-Gm-Gg: ATEYQzyLz3MKsls+NzljEofuC9Dmu4SEngMBIjFu2K2X7lbGz+KbUIhkpNY8zvHyqrV
	r32IUpJE0WKZfkIw4aUUeyBUPHj0sVd3YEWL4MuFf3lofYWeKg0A3NI/gdUhDCrYN9IH4vQN2eK
	ckGvc5WuN5QzL2aDtJ7wa6dzjSk9mtOKE65f/e5TPOM9/6mQieN7aMMLs4No5YMCLaaEBTR6gXT
	3NlI8gkVgPwXNxPry7sqGSn8OfW5lbgFjjA++1kSHCGSIKt+WlOcZdR0QrF1eI4d2uKuiNaLmEx
	vbluC3Le56A+HyDWSKScL3Ds+IrKUM/xGxdQRTpEoiceUfVsgzeS2WZleNkenxwvh336UNMeqlk
	TNL0T9aKMpFCZKvhNhhqm9C2CigPIi2FIZ2JWkcwapa4Qpq5My7jPn+5QSRWTcq4S0v35VHf2Va
	WGpKRh5cy4wvZ9j6PCUCB4IW/P7e0IWSt74jjeGeYY
X-Received: by 2002:a05:600c:5304:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-48727d67a43mr23844745e9.6.1774598458837;
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] module, riscv: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:03 +0100
Message-ID: <20260327080023.861105-5-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080100_892262_E134B35D 
X-CRM114-Status: GOOD (  10.76  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Force sh_addr=0 for all riscv-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/riscv/include/asm/module.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
index 1075beae1ac6..9ced27c8ccb6 100644
--- a/arch/riscv/include/asm/module.lds.h
+++ b/arch/riscv/include/asm/module.lds.h
@@ -2,8 +2,8 @@
 /* Copyright (C) 2017 Andes Technology Corporation */
 #ifdef CONFIG_MODULE_SECTIONS
 SECTIONS {
-	.plt : { BYTE(0) }
-	.got : { BYTE(0) }
-	.got.plt : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.got 0 : { BYTE(0) }
+	.got.plt 0 : { BYTE(0) }
 }
 #endif
-- 
2.53.0


