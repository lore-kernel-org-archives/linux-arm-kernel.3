Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3825C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KMvv0TAm7AUFg0zF7mpWH4qMZsMiovoNEigxpXVTyQg=; b=dTsifDI2HVj7Vz
	/2/vPttUieNqvi84MG4r9nO1V5fhJEm9DD9Wl/PohaUEXv5oYDVxK0Tdp7GYqM7FJkQD/NvKJtQMW
	Qf1zW75yF8t0g0aXUqYfY5+32tWhz2lvBbx2509bfL1UELeCwtUb8qtcmnD29c1N1inQa15KakdmV
	48DD0149eYfySqlad1IRZ0byOjZyhCx1EZS1+AuXP3Xq5QUPSNcC3UjuwDi7H6LMK9iZOUmVI+D/M
	HHqZllxNu0jcJfn06v3CWzrqw52xiaxcRZvTnWmcsIUSyI20ll0S1aRRG+HkFK4DsHcfYIXKExT6h
	uNT2xVkm6cyj7s/1waRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZS75-00000008JUx-2oeF;
	Wed, 09 Jul 2025 10:33:20 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQIm-00000007zKd-3pk4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:37:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70C6941C7D;
	Wed,  9 Jul 2025 08:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752050232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KMvv0TAm7AUFg0zF7mpWH4qMZsMiovoNEigxpXVTyQg=;
	b=Jl1vqhvLD0hPkq6x3gZ3bA6IXyiBYcTaqty0Maa0/2gNGcSeQricKhdJMyM+7oMGyjVhvH
	HhMq9n74n0oGW2OowAf3eY6ebe+j85d/o6Uv+gPbnPmsSINpqyx2P/nOdKy33Qklgdp+Df
	PuwYbpGucry6Xs9NrYE0poFCRBWwtHGJERHAYypmC4/l9mXaVLxF5bLMa7hyXS8noucqln
	r+9E3tjK1Pd/MsF88Ox3RGxJ6ZgkDl1nj+CRjCRJWX2LPWu0LNSwayEOh/09r414/3kzjy
	gmuGs7+vAEZf5tHP4NqJkpzB2dpnBcmuEO0ZVUZZrHiA+vpGXydhxgKyssL2YA==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Subject: [PATCH 0/2] bpf, arm64: relax constraint in BPF JIT compiler
Date: Wed, 09 Jul 2025 10:36:54 +0200
Message-Id: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACYqbmgC/x3MSQqAMAxA0atI1hZqcYheRaQUGzXiRCoiiHe3u
 HyL/x8IJEwBmuQBoYsD71tElibQT24bSbGPBqNNoSuNysla5lZocbed+bT9vh6KELEu88qjNxD
 TQ2jg+9+23ft+ARVwTmYAAAA=
X-Change-ID: 20250708-arm64_relax_jit_comp-e8889647d8d2
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>
Cc: ebpf@linuxfoundation.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeuuefggeeiuedutdeghffhtefguefffeelledttdfgjeejueeggeeugfdugfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemhegvsgeimeduvddtudemrghfugeimeeffhgssgemrggutdekmeekfhelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmeehvggsieemuddvtddumegrfhguieemfehfsggsmegrugdtkeemkehfleeipdhhvghloheplgduledvrdduieekrddurdegjegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopehkphhsihhnghhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhog
 hgvrghrsghogidrnhgvthdprhgtphhtthhopehihhhorhdrshholhhoughrrghisehlihhnuhigrdguvghvpdhrtghpthhtohepvggsphhfsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehpuhhrrghnjhgrhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_013717_447663_40232F49 
X-CRM114-Status: GOOD (  11.12  )
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

Hello,
this series follows up on the one introducing 9+ args for tracing
programs [1]. It has been observed with this series that there are cases
for which we can not identify accurately the location of the target
function arguments to prepare correctly the corresponding BPF
trampoline. This is the case for example if:
- the function consumes a struct variable _by value_
- it is passed on the stack (no more register available for it)
- it has some __packed__ or __aligned(X)__ attribute

As a consequence, a small restrictive check has been added to the ARM64
side, highlighting that other arch supporting 9+ args in BPF trampolines
are already suffering from the same issue.  After a bit of discussions
and attempts, the chosen solution is, rather than applying the same
constraint to all JIT compilers, to prevent such function from being
encoded at all in BTF info([2]). As the pahole side is closed to be
integrated, we can now remove the restrictive check from kernel side.
 
[1] https://lore.kernel.org/bpf/20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com/
[2] https://lore.kernel.org/bpf/20250707-btf_skip_structs_on_stack-v3-0-29569e086c12@bootlin.com/

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Alexis Lothoré (eBPF Foundation) (2):
      bpf, arm64: remove structs on stack constraint
      selftests/bpf: enable tracing_struct tests for arm64

 arch/arm64/net/bpf_jit_comp.c                | 5 -----
 tools/testing/selftests/bpf/DENYLIST.aarch64 | 1 -
 2 files changed, 6 deletions(-)
---
base-commit: 8da1e37fc84868b50ba6a7cdf082aa3b0d11e006
change-id: 20250708-arm64_relax_jit_comp-e8889647d8d2

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


