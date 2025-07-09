Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F11C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5P8A90l1y12Vp7M4Bmnp36AiCOYYzQNBrh1FfXK/1E=; b=FPB1Unggi9N6jLJpHK3/RNanR4
	/DsZpoXChUx8dOq6eV3uw26czZcqbIrtkphtJEM7RMqcFZZv2w/IyxJn2BoKCyfQuxfBqMrpsJ3Vt
	FkK/dX9X3a23O4mnzCkzv9tT1uCMqPYTNLOmOL+tTuKskyHc5ezKhWX3+G67mmNiFewwdU68jX+yb
	MrzizYplHHDHv5QagxiwECLXysO/HJNqBYnm9t+VlD0dD2UA8eoGlOA+Ym+8rCpkZulotPRvsO4qn
	aFk8+iJWadwD40qMfyehmjENMVdv/odVRCMhmVeFunl4sCTG6qN6CeKi5hAR3skHh8vlicTB8q5WD
	7RDpys3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSBg-00000008KLF-2zTh;
	Wed, 09 Jul 2025 10:38:04 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQIn-00000007zLH-2JsM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:37:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD30742DFF;
	Wed,  9 Jul 2025 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752050234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5P8A90l1y12Vp7M4Bmnp36AiCOYYzQNBrh1FfXK/1E=;
	b=TjKCJY6lX5CKK8PpiMwCcNpCXR104xGzI3YtVayIzqFmu8k1i1CGUT1i0pPwC70wJxiPd6
	GS5bB6tiuQ51t9UqdRKNj6TU7zsKX2Tqa7GbZUVwwoHEisl9ArShi6tL7CItPfP/Qj8eI/
	5sUUYTIQm9HH9slEBcli6xMlMk2zlgDH9LcQDk3h2iCoC5wtYPbDyNPePw5QSsfAoD0I5P
	TDajvD8bDH9wNXdph4XsQ8ZnpZ2Is9i6hQLHyrViq/xLwefmR3rc8Oi7y6TVtCt5MsLTCT
	eNyjQ6rqkbLU6sdyKr6GOFEMlQ8LCquJKpOsYmfb9YOmMlmtiwpW6Tphzc7Tmw==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Wed, 09 Jul 2025 10:36:55 +0200
Subject: [PATCH 1/2] bpf, arm64: remove structs on stack constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-arm64_relax_jit_comp-v1-1-3850fe189092@bootlin.com>
References: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
In-Reply-To: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteejvdeftdduueeihfeuhfevgfevhedttdeuveeuheefveffudekleekhfeljeffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeekgedvkeemhegvsgeimeduvddtudemrghfugeimeeffhgssgemrggutdekmeekfhelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmeehvggsieemuddvtddumegrfhguieemfehfsggsmegrugdtkeemkehfleeipdhhvghloheplgduledvrdduieekrddurdegjegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvjedprhgtphhtthhopehkphhsihhnghhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvt
 hdprhgtphhtthhopehihhhorhdrshholhhoughrrghisehlihhnuhigrdguvghvpdhrtghpthhtohepvggsphhfsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehpuhhrrghnjhgrhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_013717_769526_1B062C19 
X-CRM114-Status: GOOD (  13.84  )
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

While introducing support for 9+ arguments for tracing programs on
ARM64, commit 9014cf56f13d ("bpf, arm64: Support up to 12 function
arguments") has also introduced a constraint preventing BPF trampolines
from being generated if the target function consumes a struct argument
passed on stack, because of uncertainties around the exact struct
location: if the struct has been marked as packed or with a custom
alignment, this info is not reflected in BTF data, and so generated
tracing trampolines could read the target function arguments at wrong
offsets.

This issue is not specific to ARM64: there has been an attempt (see [1])
to bring the same constraint to other architectures JIT compilers. But
discussions following this attempt led to the move of this constraint
out of the kernel (see [2]): instead of preventing the kernel from
generating trampolines for those functions consuming structs on stack,
it is simpler to just make sure that those functions with uncertain
struct arguments location are not encoded in BTF information, and so
that one can not even attempt to attach a tracing program to such
function. The task is then deferred to pahole (see [3]).

Now that the constraint is handled by pahole, remove it from the arm64
JIT compiler to keep it simple.

[1] https://lore.kernel.org/bpf/20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com/
[2] https://lore.kernel.org/bpf/CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH3y1K6x5bWcL-5pg@mail.gmail.com/
[3] https://lore.kernel.org/bpf/20250707-btf_skip_structs_on_stack-v3-0-29569e086c12@bootlin.com/

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 arch/arm64/net/bpf_jit_comp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index b6c42b5c96688251ea24f5e771fa1effff896541..89b1b8c248c62e09cec61e13318d45b59006dce1 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2240,11 +2240,6 @@ static int calc_arg_aux(const struct btf_func_model *m,
 
 	/* the rest arguments are passed through stack */
 	for (; i < m->nr_args; i++) {
-		/* We can not know for sure about exact alignment needs for
-		 * struct passed on stack, so deny those
-		 */
-		if (m->arg_flags[i] & BTF_FMODEL_STRUCT_ARG)
-			return -ENOTSUPP;
 		stack_slots = (m->arg_size[i] + 7) / 8;
 		a->bstack_for_args += stack_slots * 8;
 		a->ostack_for_args = a->ostack_for_args + stack_slots * 8;

-- 
2.50.0


