Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF9DC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 10:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+r7J1xhws6aDU6U1m+dl2K9Zh5x/cHIxtpt6U5qcUxs=; b=mI23cuEmnS6UTH
	vPGpFdrhUL86g+FFEvS67S7liO9YjwIsWJ1uRwfFBym9Xlqt1HkEjGw5mi+XBv8K3MoCoEPUS+Aj0
	SWjXxfF70c/WYL3gd3Hrs8yCZAwehBAaWWd+bVcsSPrurddoJX36egUrLkPKmzHScGlnisfAYwtxw
	v28R4lWBPmrCUMd3fa/hylvt912aw9r7rkkzQdhhLl+r1hgiXY0DWujuqsqaK6LUeU/QDH5iUouZ7
	G+dOxX9BtNUdBc/cu6HM047sbjLzoHk8HldXMNVd9lvw3NYno8lrG1lU5jkH/VXNUCIJpPoggQ1QZ
	jo3xUQD5vwIR8jwehCDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2zK-00000000fVF-14Px;
	Thu, 22 May 2025 10:17:22 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2xE-00000000ezo-0uNc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 10:15:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 561DC1FCEF;
	Thu, 22 May 2025 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747908907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+r7J1xhws6aDU6U1m+dl2K9Zh5x/cHIxtpt6U5qcUxs=;
	b=U5kiFUO6++yJX3ypo91Fl4X7mUP9Sa/hCyWHKJxXAIUJzA0hGe62i5QjAtxHTC6hJPwQMh
	Dmq8nNbv5+Z3TZ2mPxAdW0inOfamKXXS7C2FYZI4fPj/x7mdEl4JcsTBZ0838/iER0w19a
	ww9BPo34dIJzU8eDf9PnZFPG2v0PnK+xzdCTUHpGDn2Xk1mUNVlNEPsI2baCp7PVgoGiwQ
	5LNcZ5y0XduQoK9iu424EtwDNWvJeCiVO+QZq/QC9dpmdUPib1y77bZ99FZ197rJnS9pyU
	sZynPQuN1Sk6Q/fPeeQ6LsWxxhG0Pwa3QSJeLVvB3GmmnZmoC4pc55wsamiOdg==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [PATCH bpf-next v2 0/2] bpf, arm64: support up to 12 arguments
Date: Thu, 22 May 2025 12:14:39 +0200
Message-Id: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA/5LmgC/2WNywqDMBREf0XuuinJTeqjq/5HkRL1qoGaSBJEE
 f+9IdtuBg7DnDkhkDcU4Fmc4GkzwTibAG8F9LO2EzEzJAbk+OCInC3aHh/tp5BiKRWru0FWqqK
 yUTWk1eppNHs2vqFbR2Zpj9CmZjYhOn/kq03kPluVEH/WTTDOuJY4UoVSNvTqnItfY++9W6C9r
 usHhr1ZJ7oAAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffedvleeltdefkeduledvkedvueffudeiveekvdeitdegfeeuhefgvdeutdfhueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtohepjhholhhsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhpshhinhhghheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihdrtghomhdprhgtphhtthhopegvsghpfheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_031512_423394_9D92C797 
X-CRM114-Status: GOOD (  12.79  )
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

 arch/arm64/net/bpf_jit_comp.c                | 234 ++++++++++++++++++++-------
 tools/testing/selftests/bpf/DENYLIST.aarch64 |   2 -
 2 files changed, 180 insertions(+), 56 deletions(-)
---
base-commit: 9435138c069117cd59a4912b5ea2ae44cc2c5ffa
change-id: 20250220-many_args_arm64-8bd3747e6948

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


