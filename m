Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47C9C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CIBZE6KgWtHZM48TAyKomWUpshgbZruN/nT+wM0z3cY=; b=zIIl6y62rXmTWqqdc+vM2yJlpq
	+Ibh1OKTw7ND9qUI2FKa+OlKRl/V8s9Rc0gukPhzx/VDX1oHnlfYC8yonNTzTUr0sz8vV4rQ5hRAP
	ruKInjhwKj3iZ+rPMcpUvepN9q/3X0vB7CPxXM0r39cyom8wNAgzITcv7hzx/pmN0ryBkdRtXBrsj
	Ko1agSxUmLW9FTNzNvlxRKuAZyJL17/Xb0gSoyNAEwUyYXNqWxK59bazCN+2slUqrmrLTAGOuIPvX
	Uo+C8kM4b2oxNZ5Dw53LggURcRpOmfRbDO+jy3LEXLOW+MOOufc6RdhKYvUMvp2nT2+ObRNfP/Vbg
	32tLQtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzwP-0000000HVzf-2eGK;
	Sat, 22 Mar 2025 14:35:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvzuj-0000000HVou-1hH1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 14:33:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-224019ad9edso73528875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Mar 2025 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742654008; x=1743258808; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIBZE6KgWtHZM48TAyKomWUpshgbZruN/nT+wM0z3cY=;
        b=O6PXSzqvwJyLxi/FEs6PMf/45q5qaajqf5smLKlJ8uNLk+kXeDyyY5hWEHCkxI7O8H
         yio5LTJF+b7CzMwdBtbB/GaFZQ/j2YMU2kctAmchXYxpsip+wAGEH64aGb08Jq/tEaxC
         sRTKN2WZleCmzT7TkMpv3NOvf3H9uXoezZx+VVUJd4QcIli/lkVNh2ZF1OGIL/eN+QSI
         MfXek/btarrAVkM9DA80Z/+ofJjxf2oor5BgJsZ9nndg6JKrduv0AHLkWP5fzASDReNo
         ONmpm60ylr9XbnmBM1CeTDfjxqtSgACFoqCXvMA1oMWINSZUSTZ/tVdwDedQX4/Rcil0
         qDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742654008; x=1743258808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIBZE6KgWtHZM48TAyKomWUpshgbZruN/nT+wM0z3cY=;
        b=vqULZ6HVe441jKPSuY7jRXO18COX5QA/NWXASjip7z2cl1x2p+RSXfK0j5yr+A/bpy
         msEpYeYxqvMd+jTGLPtGNMMEa83D6xMOUT855I51MHrzdBaKNLcXdZVFuvfSgNA52e5c
         3OPjhl/Z3hABnSngS8Acfp5FC/hFCBwyfd3JY3Ubd375QvTqiRbuURcN9ck17HSVtHGf
         p2tDPwQrOMl82R5NyEvX2AUnGNge00X0E6xUu+4FW/UHgetF6L1HiqbEYb7zpM7hXSAY
         qEZqtKI3nO+gqQCTaDuFk1RXirXYuD8iZusSbSUHPvzynSZdLSeZJGHHxo4nUvL6VIsw
         bivQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKXqwYEBkF6LklcpFM/BFHVKz7zjIY8YolSxEFDa6jiBGi68XFNTJBhbVrNgWlZpdezPBUxTrjPAHyFJmhUCbx@lists.infradead.org
X-Gm-Message-State: AOJu0Yym9cOW21+VE5WMPfTKdZH8EV1YLnW5gjesxiVS8lklBdV4s1/V
	0lFuPyw5QszG2ghm5IXwuGcn+JhoSCRLzQtQ3GFvK2R32MCOkpkK
X-Gm-Gg: ASbGncuRNx9aas76G352cKSl9msAc1Fs+51+l1fvg3zCAX5GKQC0fMlhkhEIpDDREIl
	vP8QGF3vAGe35QpLtlhE9tYnp1FEPzEo+Ez3FopP+QohcpUl5Vdx9ezn/nyhxxZSORLfwc3rt6p
	xF10+UdHkhkSAb1MJ9BBC9AbaqRUD9eUqupO9WCWc4ICJZCOIfwEiR4HLiNPa/WDUSRTslbmfo0
	S2ud31vcL2Y7SOBt3HynuDDiEG1cYPboB7Xw2d0STaxbVP8R+c42Dj3etjgfVdiLT2gS5kcFODZ
	Zg88wO6XamAhGBgIQi0bmtRRvcgUP2zj2sBTrPcO/y+Xt+s9iBcSIwCZYJ61WXV/ZPqe
X-Google-Smtp-Source: AGHT+IFuGDrvHo87gSkJ3AgKg7PRhGZxToZM2+HRB79B6clNvtT7xfbYzfwMUOphtPaGeqwrjNJHSw==
X-Received: by 2002:a17:903:320e:b0:224:1294:1d24 with SMTP id d9443c01a7336-22780c51260mr108189625ad.3.1742654008346;
        Sat, 22 Mar 2025 07:33:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4c3a6sm36082255ad.92.2025.03.22.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 07:33:27 -0700 (PDT)
Date: Sat, 22 Mar 2025 07:33:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Vinicius Peixoto <vpeixoto@lkcamp.dev>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v2 08/12] lib/crc_kunit.c: add KUnit test suite for CRC
 library functions
Message-ID: <389b899f-893c-4855-9e30-d8920a5d6f91@roeck-us.net>
References: <20241202012056.209768-1-ebiggers@kernel.org>
 <20241202012056.209768-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202012056.209768-9-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_073329_445378_9D844ACA 
X-CRM114-Status: GOOD (  17.36  )
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

Hi,

On Sun, Dec 01, 2024 at 05:20:52PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a KUnit test suite for the crc16, crc_t10dif, crc32_le, crc32_be,
> crc32c, and crc64_be library functions.  It avoids code duplication by
> sharing most logic among all CRC variants.  The test suite includes:
> 
> - Differential fuzz test of each CRC function against a simple
>   bit-at-a-time reference implementation.
> - Test for CRC combination, when implemented by a CRC variant.
> - Optional benchmark of each CRC function with various data lengths.
> 
> This is intended as a replacement for crc32test and crc16_kunit, as well
> as a new test for CRC variants which didn't previously have a test.
> 
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Vinicius Peixoto <vpeixoto@lkcamp.dev>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
...
> +
> +		nosimd = rand32() % 8 == 0;
> +
> +		/*
> +		 * Compute the CRC, and verify that it equals the CRC computed
> +		 * by a simple bit-at-a-time reference implementation.
> +		 */
> +		expected_crc = crc_ref(v, init_crc, &test_buffer[offset], len);
> +		if (nosimd)
> +			local_irq_disable();
> +		actual_crc = v->func(init_crc, &test_buffer[offset], len);
> +		if (nosimd)
> +			local_irq_enable();

This triggers a traceback on some arm systems.

[    7.810000]     ok 2 crc16_benchmark # SKIP not enabled
[    7.810000] ------------[ cut here ]------------
[    7.810000] WARNING: CPU: 0 PID: 1145 at kernel/softirq.c:369 __local_bh_enable_ip+0x118/0x194
[    7.810000] Modules linked in:
[    7.810000] CPU: 0 UID: 0 PID: 1145 Comm: kunit_try_catch Tainted: G                 N 6.14.0-rc7-00196-g88d324e69ea9 #1
[    7.810000] Tainted: [N]=TEST
[    7.810000] Hardware name: NPCM7XX Chip family
[    7.810000] Call trace:
[    7.810000]  unwind_backtrace from show_stack+0x10/0x14
[    7.810000]  show_stack from dump_stack_lvl+0x7c/0xac
[    7.810000]  dump_stack_lvl from __warn+0x7c/0x1b8
[    7.810000]  __warn from warn_slowpath_fmt+0x19c/0x1a4
[    7.810000]  warn_slowpath_fmt from __local_bh_enable_ip+0x118/0x194
[    7.810000]  __local_bh_enable_ip from crc_t10dif_arch+0xd4/0xe8
[    7.810000]  crc_t10dif_arch from crc_t10dif_wrapper+0x14/0x1c
[    7.810000]  crc_t10dif_wrapper from crc_main_test+0x178/0x360
[    7.810000]  crc_main_test from kunit_try_run_case+0x78/0x1e0
[    7.810000]  kunit_try_run_case from kunit_generic_run_threadfn_adapter+0x1c/0x34
[    7.810000]  kunit_generic_run_threadfn_adapter from kthread+0x118/0x254
[    7.810000]  kthread from ret_from_fork+0x14/0x28
[    7.810000] Exception stack(0xe3651fb0 to 0xe3651ff8)
[    7.810000] 1fa0:                                     00000000 00000000 00000000 00000000
[    7.810000] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    7.810000] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    7.810000] irq event stamp: 29
[    7.810000] hardirqs last  enabled at (27): [<c037875c>] __local_bh_enable_ip+0xb4/0x194
[    7.810000] hardirqs last disabled at (28): [<c0b09684>] crc_main_test+0x2e4/0x360
[    7.810000] softirqs last  enabled at (26): [<c032a3ac>] kernel_neon_end+0x0/0x1c
[    7.810000] softirqs last disabled at (29): [<c032a3c8>] kernel_neon_begin+0x0/0x70
[    7.810000] ---[ end trace 0000000000000000 ]---
[    8.050000]     # crc_t10dif_test: pass:1 fail:0 skip:0 total:1

kernel_neon_end() calls local_bh_enable() which apparently conflicts with
the local_irq_disable() in above code.

Guenter

