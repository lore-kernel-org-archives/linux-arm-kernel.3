Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E500AC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 10:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHN+uDsSXaJTkD0laSVsn0A5Nrq0eTHXt3UKaa7Mqnc=; b=mK/gMOvzg/nMQ1Oaus6m+8+xZl
	ihIybRE7DuXkrYz2UmOr/yYye8RDgUBtG5738GBvX+UPKkUg6hbmArwUwM4xWtkG3CqUMYGxoG+dR
	os6Gkf4veT13ZcCMT0JJercQRnrcc57xXTxkTg7dMX+UKbLr5tfJKKihcK6F3NlZAdUWJKqncmSl9
	nD8mSLt5uwoE+aINMZQJz3iNumkxF6BItlIBcPX64dyY6nvkBc/9tg2kYb/jSIDnUT39lDcbuFiyn
	BynYT8u601+6WwV2AC8bxBD1b5YH6AC1N5H+SNBf8HK4Wn1bCitK46PDwgTdoe03L45vcBtiMnDrx
	MhLawOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrIh-0000000ARj5-2E0V;
	Tue, 27 May 2025 10:12:51 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJrCL-0000000AR2n-0mPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 10:06:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CDE71FD77;
	Tue, 27 May 2025 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748340375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AHN+uDsSXaJTkD0laSVsn0A5Nrq0eTHXt3UKaa7Mqnc=;
	b=nYrmYq/+92zawj6+lX9PdBhCrVDmQ1u+KN1e/25bQ/jqN1TV7Litbr5z7PhU3HApE33vW4
	TT/ZyzJjsCYILkLI5EyQJXBWK1JuYCvlU0b0dj7p8JsZ9w7Puj4Mnx5/Hilyr7dcHN8dYJ
	XZBgLIKewusiawvMz1lOz9pGHufISFZ3Efza9UOhoOqayEpGP/alVN+CB7apFpOEUa6t/y
	B8D12jzYjagNp2sF+XfPk8YYm3CgK5MQb5yQ5jnSJtSyl9NYCb7dhNoAi6GhZIRRySXsUQ
	U0MT2SiHeG/9V4zteRFnDfViSuVbHXshR9o+5rnsUUcfaRH89JrNrwiVfn6qqw==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Tue, 27 May 2025 12:06:04 +0200
Subject: [PATCH bpf-next v3 2/2] selftests/bpf: enable many-args tests for
 arm64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250527-many_args_arm64-v3-2-3faf7bb8e4a2@bootlin.com>
References: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
In-Reply-To: <20250527-many_args_arm64-v3-0-3faf7bb8e4a2@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddtleculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejkeetffefveelgeeklefhtefhgfeigeduveffjeehleeifeefjedtudejgeeunecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmeguieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemugeihedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgrohhluhhosehgohhoghhlvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 ehsughfsehfohhmihgthhgvvhdrmhgvpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjohhlshgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehpuhhrrghnjhgrhieskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_030617_352702_EA5C4E46 
X-CRM114-Status: UNSURE (   8.28  )
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

Now that support for up to 12 args is enabled for tracing programs on
ARM64, enable the existing tests for this feature on this architecture.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Changes in v2:
- keep tracing struct tests disabled, as structs passed on stack are not
  handled by the new revision
---
 tools/testing/selftests/bpf/DENYLIST.aarch64 | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/DENYLIST.aarch64 b/tools/testing/selftests/bpf/DENYLIST.aarch64
index 6d8feda27ce9de07d77d6e384666082923e3dc76..12e99c0277a8cbf9e63e8f6d3a108c8a1208407b 100644
--- a/tools/testing/selftests/bpf/DENYLIST.aarch64
+++ b/tools/testing/selftests/bpf/DENYLIST.aarch64
@@ -1,3 +1 @@
-fentry_test/fentry_many_args                     # fentry_many_args:FAIL:fentry_many_args_attach unexpected error: -524
-fexit_test/fexit_many_args                       # fexit_many_args:FAIL:fexit_many_args_attach unexpected error: -524
 tracing_struct/struct_many_args                  # struct_many_args:FAIL:tracing_struct_many_args__attach unexpected error: -524

-- 
2.49.0


