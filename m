Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EA5C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0Lf7W9bQWXXAkTM40dnJ+uKraq0dPHGV+hXAWhTfnE=; b=sX9pl6avGf6GG4s25cqYdadnJu
	yq3yNHq1g+JlVJ4jCnUo6Tp27RL+6Lu0zqzAd44RjjaQOUpXE08JlVGvQI69haNVq5RJq03oP9QXK
	6jmlUOoRA9G5EZk6UEDG9RdPu+TWcHz2QYnlddyYosz3GBsPZd54Xg2Gas5M+n4uW/cLA4XZ2/gPy
	kBqXlnC2VqNET6CPo6HucaH8T/PAjpta4YtRAq4z1iouFASDxfE3un4vypG6OExmbINcGzBrirHnl
	+CzLYPdaEfg1CxZk0+ww7RW3+5zdjlew800WLdWnrXsERjNE5ECyybr3IcbCV1iyc4unFq6TCX5nm
	zytgIuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3L6e-0000000EpfS-2woV;
	Fri, 11 Apr 2025 20:36:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3L31-0000000Ep8W-2t8e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 20:32:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 285C4439D4;
	Fri, 11 Apr 2025 20:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744403540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0Lf7W9bQWXXAkTM40dnJ+uKraq0dPHGV+hXAWhTfnE=;
	b=VpzGMXts8vgeVU0Ddi28PFbkrr/1n86d1hEvDDcle5wS5M0lcVaWSGqTxCtPLuPev9r/Tx
	E2ORWC9W6nXSL8Y18Wo/dJEmtwBjAQT0DAPcPgEC6ihScWncCoiKeKZ1H+y7Jr9SiVrTAY
	LhaDvIx9k7Fku99th6Vtjs4eoHgyeZleFXOszZbgeSoDGiHw52wkOusp3dz5Oo3lR+OpEC
	RUvZgfKfzXSwDwmgolZgjTWZtlIOvpsBZv8yzn9ma4AxcVQaiLEsbgi2imv8inV7yEU55Q
	HQX9Pzt0vzhuue/BtlfvqOoZumlBd3DBNUQfA4S7DnePLIztKZtYJrTopLvZHQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Fri, 11 Apr 2025 22:32:10 +0200
Subject: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
In-Reply-To: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
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
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhorucdlvgeurffhucfhohhunhgurghtihhonhdmuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeljeektefffeevleegkeelhfethffgieegudevffejheelieeffeejtddujeegueenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepshgufhesfhhomhhitghhvghvrdhmvgdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopeiguhhkuhhohhgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehjohhlshgrsehkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmhihkohhlrghlsehfsgdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_133223_918553_8E5F3CB1 
X-CRM114-Status: GOOD (  15.95  )
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

In order to properly JIT the trampolines needed to attach BPF programs
to functions, some architectures like ARM64 need to know about the
alignment needed for the function arguments. Such alignment can
generally be deduced from the argument size, but that's not completely
true for composite types. In the specific case of ARM64, the AAPCS64 ABI
defines that a composite type which needs to be passed through stack
must be aligned on the maximum between 8 and the largest alignment
constraint of its first-level members. So the JIT compiler needs more
information about the arguments to make sure to generate code that
respects those alignment constraints.

For struct arguments, add information about the size of the largest
first-level member in the struct btf_func_model to allow the JIT
compiler to guess the needed alignment. The information is quite
specific, but it allows to keep arch-specific concerns (ie: guessing the
final needed alignment for an argument) isolated in each JIT compiler.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 include/linux/bpf.h |  1 +
 kernel/bpf/btf.c    | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 3f0cc89c0622cb1a097999afb78c17102593b6bb..8b34dcf60a0ce09228ff761b962ab67b6a3e2263 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1106,6 +1106,7 @@ struct btf_func_model {
 	u8 nr_args;
 	u8 arg_size[MAX_BPF_FUNC_ARGS];
 	u8 arg_flags[MAX_BPF_FUNC_ARGS];
+	u8 arg_largest_member_size[MAX_BPF_FUNC_ARGS];
 };
 
 /* Restore arguments before returning from trampoline to let original function
diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 16ba36f34dfab7531babf5753cab9f368cddefa3..5d40911ec90210086a6175d569abb6e52d75ad17 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -7318,6 +7318,29 @@ static int __get_type_size(struct btf *btf, u32 btf_id,
 	return -EINVAL;
 }
 
+static u8 __get_largest_member_size(struct btf *btf, const struct btf_type *t)
+{
+	const struct btf_member *member;
+	const struct btf_type *mtype;
+	u8 largest_member_size = 0;
+	int i;
+
+	if (!__btf_type_is_struct(t))
+		return largest_member_size;
+
+	for_each_member(i, t, member) {
+		mtype = btf_type_by_id(btf, member->type);
+		while (mtype && btf_type_is_modifier(mtype))
+			mtype = btf_type_by_id(btf, mtype->type);
+		if (!mtype)
+			return -EINVAL;
+		if (mtype->size > largest_member_size)
+			largest_member_size = mtype->size;
+	}
+
+	return largest_member_size;
+}
+
 static u8 __get_type_fmodel_flags(const struct btf_type *t)
 {
 	u8 flags = 0;
@@ -7396,6 +7419,8 @@ int btf_distill_func_proto(struct bpf_verifier_log *log,
 		}
 		m->arg_size[i] = ret;
 		m->arg_flags[i] = __get_type_fmodel_flags(t);
+		m->arg_largest_member_size[i] =
+			__get_largest_member_size(btf, t);
 	}
 	m->nr_args = nargs;
 	return 0;

-- 
2.49.0


