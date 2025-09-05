Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFC0CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKzZoc8Umv6xQWKFcUwWWf5jE4zJpv0sM5wnP0ecOkA=; b=RLZLKs9vdkIQDvs7PhbAkaBvYn
	CnipY5rBIc0G6g/xcEwwrZKUP70jqkZruWclENH3Tk2Gjih+/cVII+3R81+8PdQ1dOZBqgCFWEsir
	k8uLEWb0vaVhRi3oOIKkRJuHDKEv1y/j2W0sEXTcmn8WPM7M5Ab/Oit+fn2lHhNHTW0jVc+m/ljzb
	o5o2JZRKEdLFg+D65nKIGYzNEPWZmejcH8GTjhqxnQ/BAC8P7f3KQ7fu0R8yTz2KNmNwkpk+6LwDH
	45wAAspQ4MhfftOrGPEaZ5HOoc68fsRhadK21pN757zmO5IUJ4bte2u6JCvajW5lIKmHzI87k7vk/
	xrzws6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVD-00000005Qwi-0zsf;
	Sat, 06 Sep 2025 00:09:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZ4Z-000000031j2-3jnU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:13:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50D7660208;
	Fri,  5 Sep 2025 16:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4FEC4CEF1;
	Fri,  5 Sep 2025 16:13:56 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	samitolvanen@google.com,
	song@kernel.org,
	ardb@kernel.org,
	dylanbhatch@google.com,
	panfan <panfan@qti.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	kdong@qti.qualcomm.com,
	haijianc@qti.qualcomm.com
Subject: Re: [PATCH v2] arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE
Date: Fri,  5 Sep 2025 17:13:50 +0100
Message-ID: <175708881849.3546185.8607701618216308416.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905032236.3220885-1-panfan@qti.qualcomm.com>
References: <20250905032236.3220885-1-panfan@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 04 Sep 2025 20:22:36 -0700, panfan wrote:
> On arm64, it has been possible for a module's sections to be placed more
> than 128M away from each other since commit:
> 
>   commit 3e35d303ab7d ("arm64: module: rework module VA range selection")
> 
> Due to this, an ftrace callsite in a module's .init.text section can be
> out of branch range for the module's ftrace PLT entry (in the module's
> .text section). Any attempt to enable tracing of that callsite will
> result in a BRK being patched into the callsite, resulting in a fatal
> exception when the callsite is later executed.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: ftrace: fix unreachable PLT for ftrace_caller in init_module with CONFIG_DYNAMIC_FTRACE
      https://git.kernel.org/arm64/c/a7ed7b9d0ebb

-- 
Catalin


