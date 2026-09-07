Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83522C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dSkZ75+revt0e4KyfnrpcrTujkH4yPeuqSBvDGGLspk=; b=x5qxyoJdMqU/QSSdUxWBytC+0r
	PHIolGExUKIqEpsT7O+UaeA3NeiOFKGRDCXY812/+j3eFE9mRkHRtJvKYp6lfdy5LZS8eMMUMSoZ/
	qJjQ2OfymnectUX6B4y+74/RIAPawVbVyYd3IRfa4BLqNgMTPkxp42jeeDxTr4V5EhiWtrTEJASpm
	MdSUC/6Mc34AEEcDDbmutPesOn9MgmE2JfvRcfGmWv8xMYlm9MxxOAMWmG3Cu5MHr7xuunk5rCuFR
	SKv8Xp6kN9TchGytddpHv3YNEIdaRVz8vm32U8vXpj75KDtiOqBpq6nuEU/X/97VH8qLkVQGwOdzV
	+6G3pQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RKf-00000005slO-3C1T;
	Mon, 07 Sep 2026 04:51:49 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RKc-00000005ski-4BR0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:51:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so1992348a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756706; x=1789361506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSkZ75+revt0e4KyfnrpcrTujkH4yPeuqSBvDGGLspk=;
        b=dO2QPagTmrLMVffnZo3S8tW5Ubw/xIxViU9/giE4xSD0VJLydhalckwCjXJDVQTp1L
         rXSVC6Au7FzVVE6ee4PKV9O1L/4a4J5PXSD6iPQdoIfNuccPWAG3fG3AdTTaj/lKcSQA
         MbPDR7fTJm1LCu7ms7Ie7iBXnosrqs9ZHm1JcPfUMQ1vpHyn79zZKe/NP3aXCTK0qCPE
         jb0WcNgfbYrakkWmFMyG1NRDsTGCUUKuK3dT02CL/yzUl6KwkPn5Jk9t0aZbXx2XUhcB
         l56H/QtSQQ01BRJBkbxfV9IkQx1qj611o5UcTae5uVBF0a3xY0HjOZCzwiig+Lqjtgpo
         9O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756706; x=1789361506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSkZ75+revt0e4KyfnrpcrTujkH4yPeuqSBvDGGLspk=;
        b=YbO58o8GzHD0jOHKVwLxkJTb3xIiNa8z8+TO7HxIbU+FIZxGUqaLn/cT1Mp3mxZKwd
         CdB1LpxcTQxI3PvzAEUa77ap33vCmKKtVga6fORrM0Ik/x/o8g/xs4PpmEqV17irRL/s
         J6epT78X4ID6FParO+9oxbxRd5zeGZF54hyS+A+b4wql4rPT/IQ8siLX7bKkVFiCjxYl
         GeXAY/PeABCqGIq/756QrCfxlAzRL1ewyUWtREZr1jPcm/lGVY7dlgo/v/7+hBA6wOZY
         xBj/cfv9Bmj2ua5Lf3Psma+tDLuB2vg7Hh8atxKF0nw8rSNJqk/hcBtSOAMdofsqgD3k
         RkVA==
X-Forwarded-Encrypted: i=1; AKwUvBwkD3MSUx5qEq1iahZeATjUB6xbxtLbCMPDZmL0O6zyB6/tfWabH2yjtMjnyoxekALKBRxQ7gZ9DyjIbZEz5ZoS@lists.infradead.org
X-Gm-Message-State: AFuF++mjBHsocXzMEgUSitMbQRWvNq8TnMSYoZzrcG/Sq6VjjsGMo8gF
	keEg42MlXL8/3jrHfDfYj1tmxeX77V5o0oKzi5X9CTLylYi/Cqousj8d
X-Gm-Gg: AYBFou0oLCLsIPlei2yNf/G9lpci+TO8nIAbLLHQcweTgNb23GTdXb4aIZggJ4OH6rq
	5qNa9T2ZEP44N87U+CKC2x1cUmcv6JVycX0p8wBAGbhH6Y8FokXG0QwIDtHsRC1reKS/dFZlkio
	m/HU6XVPpnF5Gz6itl/lc9Nk2ChZcCx/OJ1j73T64NM9kabiBX20QvyyTYr31ULrrzgvP7j+szc
	Fevwig6DRRo+px/6yfYBUVSVxVOuJCdsZlQpXDeOJhfSK0ATv0eE4zi3b+SCeus61JHtbORwtev
	CMXuxJSKUF7E+L1qQrkaoywpQ5vP8KnGj7hKBT1LFLyYdDkPcganpyHIgvITPm5yZCXFvhrr0OI
	RQbhyY0D/GQpMPY1o5pkVbmuL13i5Q8ZRzmZ6NoDJI/F3DD/ZZjlf+FnjZ/npex9GLzQNXLUeiZ
	bGjKJO1lkHJ+rLoSikv2n8gkpM8oLuNIfGt9KmcLCwcacg/E3euABF5u8iDVSwJhi7YiYfkLLyf
	vDqClkB2WoxCw==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr30192034a91.14.1788756706071;
        Sun, 06 Sep 2026 21:51:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm21979675c88.14.2026.09.06.21.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:51:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Puranjay Mohan <puranjay@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 0/7] bpf: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 10:21:28 +0530
Message-ID: <20260907045135.13317-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_215147_038921_971B368F 
X-CRM114-Status: UNSURE (   8.24  )
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

This is v2 of the spelling fixes for this tree.

Changes since v1:
Subject prefixes corrected: 'selftests: bpf:' becomes 'selftests/bpf:'
and the tools/lib patch becomes 'libbpf:', as the CI bot suggested.

Only comments change; no code is touched.

 arch/arm/net/bpf_jit_32.c                                    | 2 +-
 arch/powerpc/net/bpf_jit_comp32.c                            | 2 +-
 arch/powerpc/net/bpf_jit_comp64.c                            | 4 ++--
 arch/sparc/net/bpf_jit_asm_32.S                              | 2 +-
 include/linux/filter.h                                       | 4 ++--
 kernel/bpf/reuseport_array.c                                 | 2 +-
 kernel/bpf/stream.c                                          | 2 +-
 tools/lib/bpf/btf.c                                          | 4 ++--
 tools/lib/bpf/usdt.c                                         | 2 +-
 tools/testing/selftests/bpf/libarena/src/asan.bpf.c          | 2 +-
 tools/testing/selftests/bpf/prog_tests/lwt_seg6local.c       | 2 +-
 tools/testing/selftests/bpf/prog_tests/task_local_data.h     | 2 +-
 tools/testing/selftests/bpf/progs/freplace_unreliable_prog.c | 2 +-
 tools/testing/selftests/bpf/progs/iters.c                    | 2 +-
 tools/testing/selftests/bpf/progs/verifier_var_off.c         | 2 +-
 15 files changed, 18 insertions(+), 18 deletions(-)


