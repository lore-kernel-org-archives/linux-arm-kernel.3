Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B182DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg/Ie/7b7qgWKuC0VaavvDFjCiYtgIOuaIEl9tofAzE=; b=IVEk+WmFV8tRDB+F/ijcay12Vg
	/iv/hf8p8E7TN1DIXMWcLBBge6w/d08YSa7KwFgyhHRN7TNdR90o7eSUmcaPBTMlCabB6yo9hukkB
	aCKwhjPy62I7lciMKSKXkVNUozfnazyRyOV14gZxtQKOSKcgRCneOFKnYl0uji2b5CjZ5wJfIHLZG
	DYXvxgj+9gJtJ9sKgKyEGK0Z6pyAo77WW7Q3APUq+a1yVy8dAELBHpSN3sZlySpTl6nrpv0Iz/lMb
	jHH1Y6rjk3wn8LMpuvkTj47rzhMKhYtkzphSZE//Od6t0fUvhvAfoRmeBn93ABakLQ7CXKExX464G
	ZvkYDfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62Y-00000004NcZ-2jPW;
	Fri, 10 Jul 2026 07:52:54 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62U-00000004NZ9-3QBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:51 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso835276a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669970; x=1784274770; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rg/Ie/7b7qgWKuC0VaavvDFjCiYtgIOuaIEl9tofAzE=;
        b=FUc928xElAbrEY0pHVu+k+vAvYRR2B5VsRwL32t0wlGAJb8aNsK0mlxMLJUDhfqMFm
         q52iwALax5gxc0naTObMOIT/8CIPfV51YT+8h9ypl2iOuR5dECtVvp4rpT+Kq9KnlzSS
         NaYgqTXx3cvPmhnSUyXV8DeWXWCm2nEYxQmEEQl+glxy5YCLIgKTAz9LDwkHm84VHy2W
         26FzVHjYN8DK9nOdukDjt+3BunEK/G3GyD0vb/4EWpjWrLQV+LfJHjxmp0iQeycNoEG0
         RaGHo91S+F1ltpVFFx3ZQQTf6v7F+y9pXWs9grn0fzz1qOILKCNzuUuDpI2AkPKyBe18
         zuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669970; x=1784274770;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rg/Ie/7b7qgWKuC0VaavvDFjCiYtgIOuaIEl9tofAzE=;
        b=jpGakYu2agAcWjQzWR4jSvUkd+JuouTRZOciOCNunGe8pZWAVI2qKny6NAxQzgN8/P
         J+GcFFZGiIWvPvejpaKLDK5qxKJQ7BXlST0kDgkyzzydIOVYGnJZ65Khwiwd7nJrLOhW
         ifZ396v0V4kQqalCrblO/XfaU7H5GuW80fZ+RHUzzlmptp/LuB3PB3nk1gnnbyIzZIeY
         WlheAJap7Ri4M7NDlT/gEmtDQLRy1PPEvXKRYmpRTQleKnNAviPOiEPKkCkfuKZ/fyl3
         yEPc4DXcnCTEBh7DKD5mfmdq/r57JKKOxXrBTiOGTXJH6uqkDPD9zxd8pimVs9PPt9Nw
         KfoA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9qKQQ4F3nyqjMGzkUFB1kIMhIxUceNmP6RQt/h/lc//dL3GBaMsqBWnVnumUzT7p/Dy26LB+cHoigk7X11eb9@lists.infradead.org
X-Gm-Message-State: AOJu0YwXBY8IuaxA09ZDcsu1srGgWL/XjF5kbHcRRTv55rygRKrQzS+4
	COy6KtC4Z/EY3QoRmBrJs7JjQ8MYV8TnCNe0N8J1UC9tYQ5cZmtg10Q0
X-Gm-Gg: AfdE7cmxjplDcr4rRCDCL1RoWL76Oe/7S1dahG1dK8wrJKbjWgpKFenS9SCul2tLL71
	mLMwlMkDs/26Kz5d2hwTb74BbWF/DqIJZXqUD4z9Ebn8q4OhLiMw/Xd4rj6MqBhz/TWgLb5Ty5E
	VgGfIu/O89d1v0S8fgzX3nXiXrJgSO+fRnOhAWYXBGpZH3mbKsXylmMMssfVUS7y0TBshkmX+JK
	8ae3ghG3zkkpoMMIq0M/B46LAVIAzbNuiAxoDP1cTCJbtlwWxuNLE/ZLCjYW9WVQaon2wap7Lb7
	Q5wfDj+HgsjBMktn3J2RyR6ktQA357ls/EVjPuU9JymbdHhksRn/QzTJy3L07Sf97vL6rpfywYj
	tWSq+Y0hCS3Xpg0Y2dkT8Plf5kqBDhL+ssgr/FL/WhTBDd/utb+ktzJqKIN4ItgN8kEHi7UGADn
	zomLto8BQgFkgVm5P6xFXP6aOS6IPeBNrpaTWZf8FJlpamvnIIQr8=
X-Received: by 2002:a05:6a21:7018:b0:3c0:278c:6a31 with SMTP id adf61e73a8af0-3c0bcf16417mr11875813637.11.1783669969796;
        Fri, 10 Jul 2026 00:52:49 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:49 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 5/8] riscv/runtime-const: Introduce
 runtime_const_mask_32()
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Darren Hart <dvhart@infradead.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Jisheng Zhang <jszhang@kernel.org>
In-Reply-To: <20260630045531.3939-6-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-6-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995930.1208691.2993932866462893112.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=4236;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=9p4KOQc1NA7flV+LCDS3yU/hvIyMCPN4SrCd+V/TQfs=;
 b=F/QGuANRjQCatrmX5WvWw/8bzNn749xVtEASOBTvIfRlhzbACPiXU+b9sdtK9qiaZEF/txk+I
 Ahbuf6kQMDPASKMUgAUa9R1xTJatFeJ22eP5BSrccd2Hke4cw9LtrXi
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005250_866542_CE8C3505 
X-CRM114-Status: GOOD (  25.88  )
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

On Tue, 30 Jun 2026 04:55:28 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
> 
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. Since all the current use-cases
> are of the form GENMASK(n, 0), with n > 0, following sequence:

I really appreciate you spending the time to do this, thank you!

>
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index 1ce02605d2e4..dbf96c937dbb 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -262,6 +279,33 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
> [ ... skip 24 lines ... ]
> +	BUG_ON(!val || width > 31 || (GENMASK(width - 1, 0) != val));
> +
> +	__runtime_fixup_shift(where, 32 - width);
> +	__runtime_fixup_shift(where + 4, 32 - width);
> +}
> +

It would be "optimal" to use an andi when the mask is <=11 bits since
andi can fit an 11 bit mask. What you have is good enough but I'll leave
my stab at doing the andi patching here in case you want to apply it.

From 9e5527aaddd464783af795aacdb6d094e11cc31e Mon Sep 17 00:00:00 2001
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Thu, 9 Jul 2026 23:18:09 -0700
Subject: [PATCH] riscv: Optimize __runtime_fixup_mask for masks with <= 11
 bits

---
 arch/riscv/include/asm/insn.h          |  2 ++
 arch/riscv/include/asm/runtime-const.h | 29 ++++++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..0a34cd7305d0 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -141,6 +141,7 @@
 #define RVG_OPCODE_JALR		0x67
 #define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
+#define RVG_OPCODE_ANDI		0x13
 #define RVG_SYSTEM_CSR_OFF	20
 #define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)

@@ -175,6 +176,7 @@
 #define RVG_FUNCT3_BGE		0x5
 #define RVG_FUNCT3_BLTU		0x6
 #define RVG_FUNCT3_BGEU		0x7
+#define RVG_FUNCT3_ANDI		0x7

 /* parts of funct3 code for C extension*/
 #define RVC_FUNCT3_C_BEQZ	0x6
diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
index dbf96c937dbb..24a9b13081f7 100644
--- a/arch/riscv/include/asm/runtime-const.h
+++ b/arch/riscv/include/asm/runtime-const.h
@@ -9,6 +9,7 @@
 #include <asm/asm.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
+#include <asm/insn.h>
 #include <asm/insn-def.h>
 #include <linux/memory.h>
 #include <asm/text-patching.h>
@@ -302,8 +303,32 @@ static inline void __runtime_fixup_mask(void *where, unsigned long val)
 	 */
 	BUG_ON(!val || width > 31 || (GENMASK(width - 1, 0) != val));

-	__runtime_fixup_shift(where, 32 - width);
-	__runtime_fixup_shift(where + 4, 32 - width);
+	/*
+	 * A riscv 'andi' instruction can fit an 11 bit immediate, so the mask
+	 * can be directly applied. Otherwise fall back to SRLI + SLLI.
+	 */
+	if (width < 11) {
+		__le16 *parcel = where;
+		u32 insn;
+		__le32 res, nop;
+
+		insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
+
+		/* Replace the slli/slliw with an andi */
+		insn &= 0x000fcf80;
+		insn |= val << 20 | RV_ENCODE_FUNCT3(ANDI) | RVG_OPCODE_ANDI;
+
+		res = cpu_to_le32(insn);
+		/* Replace the srli/srliw with a nop */
+		nop = cpu_to_le32(RISCV_INSN_NOP4);
+		mutex_lock(&text_mutex);
+		patch_text_nosync(where, &res, sizeof(insn));
+		patch_text_nosync(where + 4, &nop, sizeof(insn));
+		mutex_unlock(&text_mutex);
+	} else {
+		__runtime_fixup_shift(where, 32 - width);
+		__runtime_fixup_shift(where + 4, 32 - width);
+	}
 }

 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
--
2.54.0


I would prefer including this, but I am happy to approve this
regardless.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


