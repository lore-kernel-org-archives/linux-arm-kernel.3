Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECDBC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/S958YOMlhVQ7k/sBYXzKtRPZtkLW00iEhxye/aYjI=; b=yDwCsvLAdV7GR4BS/d2UKswN08
	ey/9m3x5j5HQSLIsRh93mnP21QgwE9eMZBLOgt13XdkxlIlz2Hmk/w12WTVm0NB/goyO0mFM9z59f
	TyK4yCQ26AKqYkhcQuVFXzCY+VVKGhQOy5G15zWI+6YE03CPHhvEY9UWZtUhg52oY+YOg5raJFB5o
	chF2xxbaSiAniqkYwrKpRlAmem0Vf9xaCiwNQ7I9gKkl2mBUfzwer4tJmQktWRxtE3lcwUkuYJTr4
	moPz8ylzR/kgytMZEp9B7X7Tw6vgBWs6Du8inV9z2NkgCmucmHwWNnioU50qOO025zP5zrG1NoGMs
	jMa7dpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfGO-0000000F7z4-3Hbx;
	Mon, 24 Feb 2025 20:41:16 +0000
Received: from mx-rz-1.rrze.uni-erlangen.de ([2001:638:a000:1025::14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfCO-0000000F7Aj-2Vj3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:37:10 +0000
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Z1swK6N5Qz8sf8;
	Mon, 24 Feb 2025 21:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1740429410; bh=F/S958YOMlhVQ7k/sBYXzKtRPZtkLW00iEhxye/aYjI=;
	h=From:To:Subject:Date:From:To:CC:Subject;
	b=vyO/2lLDV7YmJ95EcxyIQzm6VxPPn+6u23J5ahuZwtvnglNTInOQM9BX0nmExTOEj
	 1kRgCFC4b9fVU3KOGjAoNQFYcvp8GE2WCbj5MRC3qZRiZStBU9cyDS5E9gnalGmKut
	 4YHRU/43AzjwQfRmjfVxuiZNR3d70jgvtNdeyOn8oHlSDkREjyNtooY/olmmy28N34
	 u2Nt3OfpjeuaNlSbwTdHcmv4sI6kYEXQbh7reD5jxA8/bwuHozaqgQKlIQ4p0Un2Tv
	 NxpQ/gv/FctztFtW+Oli9gOZVnJsQwSLXszWQbt0U3O2wu6KRjgGXpaQLKULESlfgq
	 tfMlyxhsDO8IQ==
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:362e:e00:55a6:11d5:2473:17a9
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:362e:e00:55a6:11d5:2473:17a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19DNN372IgUoIrOkF5n39zT+AvlBGfTs7U=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Z1swG4xPzz8slb;
	Mon, 24 Feb 2025 21:36:46 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 0/9] bpf: Mitigate Spectre v1 using speculation barriers
Date: Mon, 24 Feb 2025 21:36:10 +0100
Message-ID: <20250224203619.594724-1-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_123709_074940_1627250E 
X-CRM114-Status: UNSURE (   8.09  )
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

This improves the expressiveness of unprivileged BPF by inserting
speculation barriers instead of rejcting the programs.

The approach was presented at LPC'24:
  https://lpc.events/event/18/contributions/1954/ ("Mitigating
  Spectre-PHT using Speculation Barriers in Linux eBPF")
and RAID'24:
  https://arxiv.org/pdf/2405.00078 ("VeriFence: Lightweight and Precise
  Spectre Defenses for Untrusted Linux Kernel Extensions")

Goal of this RFC is to get feedback on the approach and the structuring
into commits.

TODOs to be fixed for final version:
* actually emit arm64 barrier
* fix unexpected_load_success from test_progs for "bpf: Fall back to nospec for sanitization-failures"
* use bpf-next as base commit

Luis Gerhorst (9):
  bpf/arm64: Unset bypass_spec_v4() instead of ignoring BPF_NOSPEC
  bpf: Refactor do_check() if/else into do_check_insn()
  bpf: Return EFAULT on misconfigurations
  bpf: Return EFAULT on internal errors
  bpf: Fall back to nospec if v1 verification fails
  bpf: Allow nospec-protected var-offset stack access
  bpf: Refactor push_stack to return error code
  bpf: Fall back to nospec for sanitization-failures
  bpf: Cut speculative path verification short

 arch/arm64/net/bpf_jit_comp.c                 |  10 +-
 include/linux/bpf.h                           |  14 +-
 include/linux/bpf_verifier.h                  |   3 +-
 kernel/bpf/core.c                             |  17 +-
 kernel/bpf/verifier.c                         | 832 ++++++++++--------
 .../selftests/bpf/progs/verifier_and.c        |   3 +-
 .../selftests/bpf/progs/verifier_bounds.c     |  30 +-
 .../selftests/bpf/progs/verifier_movsx.c      |   6 +-
 .../selftests/bpf/progs/verifier_unpriv.c     |   3 +-
 .../bpf/progs/verifier_value_ptr_arith.c      |  11 +-
 10 files changed, 520 insertions(+), 409 deletions(-)


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.48.1


