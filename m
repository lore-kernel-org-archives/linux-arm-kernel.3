Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29553C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 01:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vuYeE7vh3UMCu+MTHlQBRo2PiTav7f60VIzBYttr9w0=; b=Phvh8fGwtbLAu729H9i92IuUBv
	1zceSNaGT4dkLuJumKVZjB7CiMHA6FkauYALI1XC1kMJc6r+MrOaW2aTHzeD7mbGJmHrNcRIxycfc
	wlqxzdwieq779lQdxZy6e8SRI/pMH3s21Al8i/fEU3014sMXJmEwJqwE4JsmL5Be9U07VQraWoK7H
	S85ReCokXFOSinjIeGC4vD23YSJ2DkhOVf3VtUYhBfMylumST6RWB8qvVTHSsulvB9v2qwIUhI3bV
	eJwaSxCvox7DlLuVpX3Pb2DyAgaokE2MPCUN0HdueF8miEHgIQ9LU0+6trxmPV4XDIJgSqy3a++gB
	/fUVFu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3PPc-0000000FE1B-2M4T;
	Sat, 12 Apr 2025 01:12:00 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3PNn-0000000FDpZ-2cIH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 01:10:08 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-af8a4410816so2116023a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744420206; x=1745025006; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vuYeE7vh3UMCu+MTHlQBRo2PiTav7f60VIzBYttr9w0=;
        b=C30lYVPZd/+rTtykauVMuz/K9I9VTosVukoPOKUT9ngmwVDbqwGQSeUvEIJdeZ1nkK
         4t0ps1YCHmiDxFiXsg/3oDOEMEIKGqrR+PMfTSFbwDc5Ap3Xdk6EM4HuIlqZFXo9opF8
         HySTWaMk4rcIRTo9kMqc9g1v2DLDeKOagsyAcQkDqeZ5hnMEHyjmLnCpYVbhW+XBH9Fy
         RuZEQknYceK5k5frQC6v4veAVDoyoWKKnjIG79GiTMLledmrbNG9tQF972tbHUUXnP0Q
         V8F24JgCYmlaXpNqE3mOmIUf35JDJcQBnFXgiaaITV57sAurYggzcAUpFmYzdHue6VeB
         A9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744420206; x=1745025006;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vuYeE7vh3UMCu+MTHlQBRo2PiTav7f60VIzBYttr9w0=;
        b=exlWKvZJGePjIvE7FA4l6FX3vfFm8q5r0RV/CBB8HHk+aLDNLztM7FH2QeMmkeCO0X
         v6woSwvraUh6U+rSl7jQXupa6ojzalqlhgJe29a+Jy1/Xy71y5qxp1b8JRji4Mp2NyDq
         AKgadvwbdMPllYW7V4i73GlL3AQ7XC6JNjVMLuXT4+n3ZtV6X/8M7aHhPk6qUz8x6OKP
         xjxjMZrHHXm4Z7K9n8t4eBugtOmmCXbeazKwnSIfLuFNwtrE4bGUW3YqBbYbcWDX7fbB
         ewqw/+dkr+7UbdNhSv2veviRpRweA6na5kGxlOnOC0M7xSkuuKa2G/9T5e3n0CFziMz4
         dSsA==
X-Gm-Message-State: AOJu0YwZY1O+af+g8cPKM0ud8Z8UOP175BwBQ5rqecCM0T6OEun6H9Y+
	JTNQ3lf0OC0Cu+pyVMNdsRaEvk4Ew8zktIVmyAKm0UrNnOdDT+M4SyCbP6YXbPjpF97G8AVs6Zl
	0oBsl75K/UhzC40zcqkhlZA==
X-Google-Smtp-Source: AGHT+IHmybOBIwMVUHalKCMt11/fiZVTPLdyyMCAY62wKgSwsLPSM/VaRP6Diq3+UC83cC2e+Wnl9kvoKav//2b1MQ==
X-Received: from pfbgj26.prod.google.com ([2002:a05:6a00:841a:b0:736:3d80:7076])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ea0b:b0:220:f795:5f14 with SMTP id d9443c01a7336-22bea4bcf70mr71598855ad.27.1744420205676;
 Fri, 11 Apr 2025 18:10:05 -0700 (PDT)
Date: Sat, 12 Apr 2025 01:09:37 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412010940.1686376-1-dylanbhatch@google.com>
Subject: [PATCH v2 0/2] arm64/module: Enable late module relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_181007_663824_465138D2 
X-CRM114-Status: UNSURE (   9.26  )
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

Late relocations (after the module is initially loaded) are needed when
livepatches change module code. This is supported by x86, ppc, and s390.
This series borrows the x86 methodology to reach the same level of
suuport on arm64.

Dylan Hatch (2):
  arm64: patching: Rename aarch64_insn_copy to text_poke.
  arm64/module: Use text-poke API for late relocations.

 arch/arm64/include/asm/text-patching.h |   2 +-
 arch/arm64/kernel/module.c             | 129 ++++++++++++++++---------
 arch/arm64/kernel/patching.c           |  12 +--
 arch/arm64/net/bpf_jit_comp.c          |   2 +-
 4 files changed, 91 insertions(+), 54 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog


