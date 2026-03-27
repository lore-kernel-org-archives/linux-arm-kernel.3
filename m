Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA84C10BA436
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=; b=mj9Ab+UCUf7atZapEElZ7ALyS8
	Xo78WUA4I3VTAlVqutaekdjCpFqKbM3W+s1nyWTZHStDURkha5xq5fUxbaKg1PlP3PAit5GynZqnK
	B8KuWV0bjoHmNK5zHvVtxBsUtSqr3nQdZYQ1kSwppUSUtBlVrSzG+frh9jLrElXlUYCQPCFvfBSXr
	RiI4p/YFHM7o/2Q1TZnGZ2wUwwHGIrX3BnGF5OjFfOq/v88brMouplL+TdhREOWEPZq4fh0OMgZeJ
	TTAkdOskk/P7Xn4CdWNRqH4FL//uzg2tFtUOAY1gNk1+FePmbyed9pxFfVrbHGHdFMwODm1WYc0bD
	GPEyOfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6286-00000006vDy-0B9I;
	Fri, 27 Mar 2026 08:01:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627q-00000006v6a-3pSZ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=; b=MnJcC7Kadwv2FpmlZypP1I43Mv
	auQ4g+MskYmwWxdJGCU2FMSGSbm3n4M4n+37QZCRYVgNmMLkKwwbI3jHq+bgzy8LVCwFvRKviU4jY
	WcT8UWtMEE6iQcAWEZbFUIcAD12/kegN5gWZokw0NN8PoEzSi7Co9YNymAAlRm0W7fFE1KNtdmdva
	SxkSpVuzqVc5zdi710e3Hx6yfBye5Qg0gDOu3q0JdcW9msFi7G50Cab2PeWENlzZPq9jv3Fs3hORp
	JClnbK589ryfjP0CYBgy0oSOdeNCXRU7uuaqv/m2xSIMxdDbKh2GlWiBXq0bg7WfCqySru+9VCMQy
	W5sW9KXA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627m-00000009vJW-3dIc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:01:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so13316305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598457; x=1775203257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=;
        b=R8vpvREXpOegdvPk0p3ntkRkpjAiEtowxWe1Oa0FZv8EIvhUBrrBPb+9T1P3RTBvIn
         sqp9PC6mp62zJrhA73ycM6iLmIJci0AFCzDTQA0JXrCMu5MFQA88Jb0irhBVS1YnW9Nf
         lNq2437FNG6OpY5SebRrT/6GSbhqpZXJLQ4yW6k777hdoGChyy2jdpu8IAkEMsGUsYIG
         NWGnt/yFNHh+5ZaQuSJ+L++y76Fi3ud4CR5pUsttd/9qfD5/2m2+x5ZKxpWUO21jWSOD
         Eu51iwVKLR2FsDPdZsPQBwUq3/jQBwsLfPvefETk1NUh0piwJLpgqanidG40vO4qt9zF
         L49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598457; x=1775203257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=;
        b=VxKVdtn7pJcEHNsuzQb587xCPVoktJ676wQheySZga3YZ5XzI8BU9h4yExL3BlCtsO
         dO5DvfHCEBHzUmlbjSWRteXYj5ixag4paweJNjHSrbvK/y8eziNiwbxHPPwT8YlK3+s8
         zN9mzBtGN7f/vf8lpVuie/gLjfz/Cp70mW39raC40mLbAPv0EgtCZz8nn0ugwuhYticI
         jNyaNnqvBffTt+JWEIvn9PsJD5atBRqyitXDO9PS1NJpudS/k3BohM9oRbzqJLOQHyVb
         3vLa8v15GLBVHprfjOIxxNI29My1mwlEKnn6ISWMs8OoZMUnYKAfjIhkaCAn7XmpHgtO
         Nu/A==
X-Forwarded-Encrypted: i=1; AJvYcCXiIXxxZpe7yKkTbgOZGo7YWb1k/w6cFSBeHcmhSJ0HKVAnj1/t9a0U0iszw21NixE0W5bE1rmKnp6XnjVVek7j@lists.infradead.org
X-Gm-Message-State: AOJu0YyKbnxaOLtbYotvnYl8NRh9fJMhOsRFXSzA2GWL9fwgYuC3QrWB
	rPjy/fg4iABPaVRwYZMegoppExgz6lYVjmbNm1cGBxdAPncoCCn/o+cEpLoYpf9CS7M=
X-Gm-Gg: ATEYQzwAQV7dtQaPlmtcfilZqYKsIJmQrFtdfjPsOpxijJyUdWHY5PN+tcynuDD8Y6o
	CMaMiMgSJYJznluB+UteWfiCtsgrmsjc5OwUuT62uYxGy5TDemC9DTasjqHICQxxrXo6zjGa12S
	Asnokx8NP/STVxmUrBTMhQziMinuh+ORb93FT2o3D/MIjJ1GCbUm3vFNs1XGWXog/+vOEN/dhOA
	hpguvfAEf7yNlKl0mlcg4n5ZWpBMtCiUd2YoMPavMq9vLEGL/bGSXfHVyPpEwA+uMFlc+99Ut7U
	A91YHPyTch1as7cdX4O4q5TffzW9Ia9v2uiG3DA8ic4+EUWoGZ0bLqMSi/gWVWmwrclR6p4V+f+
	RgXokolmJ6zUyJsDQwCj/xCtvLopgG5OVcjB2gypn0ARSvJ5xZT0305dJ+vevjtM1prYH2bLuOl
	A2J7zFEzs7rlfbWUDue75DYJicKxVMP1WEEmRGDeq8
X-Received: by 2002:a05:600c:828a:b0:487:338:b4df with SMTP id 5b1f17b1804b1-48727d8818cmr22261095e9.15.1774598457203;
        Fri, 27 Mar 2026 01:00:57 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
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
Subject: [PATCH 2/4] module, arm64: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:01 +0100
Message-ID: <20260327080023.861105-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080059_300212_B24D80ED 
X-CRM114-Status: GOOD (  14.73  )
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

Force sh_addr=0 for all arm64-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
Note that the definition of .text.hot hasn't matched any input sections
since commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
related macros"), and even before that with CONFIG_LTO_CLANG=y.

The preceding comment also explains that the directive is necessary to
merge section groups. However, this approach seems suboptimal. A better
method would be to link modules using --force-group-allocation to retain
only one copy of each group.

I plan to look at this separately.
---
 arch/arm64/include/asm/module.lds.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index fb944b46846d..0b3aacd22c59 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -14,7 +14,7 @@ SECTIONS {
 	 * directive to force them into a single section and silence the
 	 * warning.
 	 */
-	.text.hot : { *(.text.hot) }
+	.text.hot 0 : { *(.text.hot) }
 #endif
 
 #ifdef CONFIG_UNWIND_TABLES
@@ -22,6 +22,6 @@ SECTIONS {
 	 * Currently, we only use unwind info at module load time, so we can
 	 * put it into the .init allocation.
 	 */
-	.init.eh_frame : { *(.eh_frame) }
+	.init.eh_frame 0 : { *(.eh_frame) }
 #endif
 }
-- 
2.53.0


