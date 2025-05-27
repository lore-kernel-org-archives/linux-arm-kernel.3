Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8718BC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g9PY5sgRf+wMjq44Tp5gP3wPRWLLrFsYXl9Qe4W89/8=; b=Esas0drVTxjrq7
	vl9g/U8LREJAAKMwnWy1UUCEaJv3mixfUMhlmnX1ArPbrDtHmXFyonNoEAY63OatVSGsl06VHCbkR
	7ML0DikzJdb0kswSdfonfBd0EcHdm/rRfYISuB+58lX9MKGAomX0MCRHe/Megk07L0o2NCXGV2qs6
	H7SGkeWYugBt9VlZ75H5fSYVnd8bNsupYd5f90DPwKVMFhman0nPtFVD5+4E8gRv9Z4ydFGQNxj17
	WiGMuYNltG9KykI5sk1j3Jg5qxjEfgFi3DWGlQK8b3J0oO+cyws7+rMbaQ5Vhp1b9DXk2B3dUg1rx
	me+YSm3+MEueDmmxDGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrEU-0000000ARGs-0bTu;
	Tue, 27 May 2025 10:08:30 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrCJ-0000000AR2S-11RI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 10:06:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 547541F4F3;
	Tue, 27 May 2025 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748340372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g9PY5sgRf+wMjq44Tp5gP3wPRWLLrFsYXl9Qe4W89/8=;
	b=Bx7+1hACUM/l0dpn7ADyoDeEiJgnyCojm2ckjd2rLGz4sHPgSV+8BOqtujc6ZSOmauoltf
	wPDRDKIltW+UxzHoS4vCbrDiK0BnTIwuOTDoDdyZ9KW4HvXQykXMx8I8b/rBW2H0gi2mNi
	/6hytZKephHFIGTaHc6lp1NL/ZyW3vZLPWOTWsJvH6fHB4p1ah9LgCw+OWUfzTQ0qd52SY
	SSz/58CjswdgrlIkAVtUCbW7eKKuv6/05ykABOLaaTt1PR0qxuXqMd5J66RF0WnPnRVTyy
	pPgH4rplsyn4BHirsCmeLE1YF/esr153Zte7Ddn1D2HGshb31UToOaqmZ/ZeyA==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [PATCH bpf-next v3 0/2] bpf, arm64: support up to 12 arguments
Date: Tue, 27 May 2025 12:06:02 +0200
Message-Id: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIqONWgC/2XNTQrDIBAF4KsU17XoaP666j1KKSaOidBo0BASQ
 u5ecVNKNgOPx/tmJxGDxUjul50EXGy03qUgrhfSDcr1SK1OmQCDggEwOiq3vVXoYzpjKWndalH
 JCstG1iStpoDGrll8knYy1OE6k1dqBhtnH7b8auG5z6rk/KQunDLKlACDFQjR4KP1fv5Yd+v8m
 LUFfkIBcBYgCbpURrdNZ2re/AvHcXwBRufAvfwAAAA=
X-Change-ID: 20250220-many_args_arm64-8bd3747e6948
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Florent Revest <revest@chromium.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
 Xu Kuohai <xukuohai@huawei.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddtleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefvdelledtfeekudelvdekvdeuffduieevkedviedtgeefueehgfdvuedthfeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemugeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmeguieehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrgholhhuohesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnr
 dgtohhmpdhrtghpthhtohepshgufhesfhhomhhitghhvghvrdhmvgdprhgtphhtthhopegsphhfsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhholhhsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphhurhgrnhhjrgihsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_030615_755817_C501AFF2 
X-CRM114-Status: GOOD (  13.14  )
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

this is the v2 of the many args series for arm64, being itself a revival
of Xu Kuhoai's work to enable larger arguments count for BPF programs on
ARM64 ([1]).

The discussions in v1 shed some light on some issues around specific
cases, for example with functions passing struct on stack with custom
packing/alignment attributes: those cases can not be properly detected
with the current BTF info. So this new revision aims to separate
concerns with a simpler implementation, just accepting additional args
on stack if we can make sure about the alignment constraints (and so,
refusing attachment to functions passing structs on stacks). I then
checked if the specific alignment constraints could be checked with
larger scalar types rather than structs, but it appears that this use
case is in fact rejected at the verifier level (see a9b59159d338 ("bpf:
Do not allow btf_ctx_access with __int128 types")). So in the end the
specific alignment corner cases raised in [1] can not really happen in
the kernel in its current state. This new revision still brings support
for the standard cases as a first step, it will then be possible to
iterate on top of it to add the more specific cases like struct passed
on stack and larger types.

[1] https://lore.kernel.org/all/20230917150752.69612-1-xukuohai@huaweicloud.com/#t

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Changes in v3:
- switch back -EOPNOTSUPP to -ENOTSUPP
- fix comment style
- group intializations for arg_aux
- remove some unneeded round_up
- Link to v2: https://lore.kernel.org/r/20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com

Changes in v2:
- remove alignment computation from btf.c
- deduce alignment constraints directly in jit compiler for simple types
- deny attachment to functions with "corner-cases" arguments (ie:
  structs on stack)
- remove custom tests, as the corresponding use cases are locked either
  by the JIT comp or the verifier
- drop RFC
- Link to v1: https://lore.kernel.org/r/20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com

---
Alexis Lothoré (eBPF Foundation) (1):
      selftests/bpf: enable many-args tests for arm64

Xu Kuohai (1):
      bpf, arm64: Support up to 12 function arguments

 arch/arm64/net/bpf_jit_comp.c                | 225 ++++++++++++++++++++-------
 tools/testing/selftests/bpf/DENYLIST.aarch64 |   2 -
 2 files changed, 171 insertions(+), 56 deletions(-)
---
base-commit: 9435138c069117cd59a4912b5ea2ae44cc2c5ffa
change-id: 20250220-many_args_arm64-8bd3747e6948

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


