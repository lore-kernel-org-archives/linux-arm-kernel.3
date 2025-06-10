Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7207C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 23:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5D/F70gQTGdjMN+qssGXLmmrNG9n18IpsjWCIpkM1N4=; b=UrmN8yK3hhO1G45t34baXCqGSz
	q/Xpgy7dYvQVaLMCp2zx5PDSlAl+oqmdSvi0W+Fn48WWZ03zAblSkMHEQNZ64nzZujFVxBs22dmWX
	xJ8qMhb6YS+gCkPubmpsE9iJBKEsp862SjhFpl70BdfNkRa4ninpd9Rd64RARqa6nT4U25BJxSOTs
	a+wuU57plJEAyJ/g2qUw3B41JLjlETq3OtK96Mv5x2JJYmWQWzu5rChjEa1tPgj2r8DMTMHIF55NF
	jgtyPH6JsymNFcpypbR0hui7cEnyzX/CKHQjmUbEpoPHjtrjyQ4P0JiHHDaNtvdLs6RC7Q+PFpSDM
	hn1TmTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8MW-00000008OA0-2VZd;
	Tue, 10 Jun 2025 23:26:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8KN-00000008O5V-2yRK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 23:24:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0A836154C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 23:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D723FC4CEED;
	Tue, 10 Jun 2025 23:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749597862;
	bh=4UsSX14k43cbBEcCcUrL+qqAqViHnY0h+wnCdlT3yMw=;
	h=Date:From:To:Subject:From;
	b=ngo2sLUt0q7y6q4/AcbHbBy9Ban0DKJPk5DRm4ZcwhrXmRBPZnmE0jvVDWzq1GkgP
	 VtGSc1L1U90tM4/vNTdm0DF+X/GANJDkqC8vnKloze4EDXXYyEPkbbrpNdEKFvfjUV
	 dAOi9fu3oy61K+hShq+sIkPsPGPIyDWac90MxFY930ZhLy52A2X57sBRxu/AoVKmar
	 TX5ZthSAX/QZqryt49YKczmGIDnGnC8kkKgoR+tadU0np9Z7bmlVhCfqgJin09R/1N
	 A/tFqEu7TOE2MjZmYaNt3zar9Rn4ZC9T587LTaUa1F5hCbYkUru10eWTl1QwnYv1RX
	 1ge6efpx/4H+g==
Date: Tue, 10 Jun 2025 16:24:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: bpf-restrict-fs fails to load without
 DYNAMIC_FTRACE_WITH_DIRECT_CALLS on arm64
Message-ID: <20250610232418.GA3544567@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi all,

I recently adjusted my kernel configuration for my arm64 systems that
boot Fedora to enable debug information so that BTF could be generated
so that systemd's bpf-restrict-fs program [1] can run, as it would show

  systemd[1]: bpf-restrict-fs: Failed to load BPF object: No such process

in the kernel log. After doing so though, I still get an error when the
program is loaded:

  systemd[1]: bpf-restrict-fs: Failed to link program; assuming BPF LSM is not available.

With Fedora's configuration from upstream, I see:

  systemd[1]: bpf-restrict-fs: LSM BPF program attached

I was able to figure out that enabling CONFIG_CFI_CLANG was the culprit
for the change in behavior but it does not appear to be the root cause,
as I can get the same error with GCC and the following diff (which
happens with CFI_CLANG because of the CALL_OPS dependency):

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..a55754e54cd8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -210,8 +210,8 @@ config ARM64
        select HAVE_DYNAMIC_FTRACE_WITH_ARGS \
                if (GCC_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS || \
                    CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS)
-       select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
-               if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_OPS
+       #select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
+       #       if DYNAMIC_FTRACE_WITH_ARGS && DYNAMIC_FTRACE_WITH_CALL_OPS
        select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
                if (DYNAMIC_FTRACE_WITH_ARGS && !CFI_CLANG && \
                    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))

which results in the following diff between the good and bad
configurations (and I already ruled out HID-BPF being involved here):

diff --git a/good-config b/bad-config
index 252f730..539e8fd 100644
--- a/good-config
+++ b/bad-config
@@ -4882,7 +4882,6 @@ CONFIG_HID_NTRIG=y
 #
 # HID-BPF support
 #
-CONFIG_HID_BPF=y
 # end of HID-BPF support

 CONFIG_I2C_HID=y
@@ -7534,7 +7533,6 @@ CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
 CONFIG_HAVE_FUNCTION_GRAPH_FREGS=y
 CONFIG_HAVE_FTRACE_GRAPH_FUNC=y
 CONFIG_HAVE_DYNAMIC_FTRACE=y
-CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
 CONFIG_HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS=y
 CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
 CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
@@ -7558,7 +7556,6 @@ CONFIG_FUNCTION_GRAPH_RETVAL=y
 # CONFIG_FUNCTION_GRAPH_RETADDR is not set
 CONFIG_FUNCTION_TRACE_ARGS=y
 CONFIG_DYNAMIC_FTRACE=y
-CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
 CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS=y
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
 CONFIG_FPROBE=y

Is this expected behavior or is there some other issue here? I have not
tried different kernel versions yet but I certainly can if it would be
worthwhile. If it is not expected, I am happy to provide any information
that would be helpful for narrowing this down or test patches. This is
reproducible for me in a Fedora VM in QEMU as well, if it makes
reproducing easy.

[1]: https://github.com/systemd/systemd/blob/abe149d669c68bbf2a8dd4fab325c7e715f1fd85/src/core/bpf-restrict-fs.c

Cheers,
Nathan

