Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD881C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NbnZ3oa/RtGinQgKVF9pKDMVERXfqX9/LOk9QyatAs=; b=DT4hdaHwEQywV1zRt1BYCFe1Dg
	LC+L+/4MfID1zhIQ1K2uqdZ9r7B7Qj6rBkySmlj1wtqEVmyeEA8Q3xJX6QuhBA5CcKA/GzJ+wqNpM
	cBKpnYZaDsa7vzSAi+MjsNuvseqoxvsUp+MeizwkC17XMxgoc9WhCB1CR4Kj2tgabKEWIMC8sKmQN
	orXCCH648CJsfXEr32u6OxglPZW6Ry4OLjd3xyF3gc5XTAEVMOpYryR2swHjQYLNWN7wuZ9cxppW4
	bK4KGIdp062I0HXTOi2KRAyxpDKP8fciMVU+Z9oFmOp/A9uWyTJMOp2r7TlLqKdgkWfioAdoOliJz
	JzKArq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8lx-0000000GFru-181A;
	Wed, 12 Aug 2026 13:13:33 +0000
Received: from out-147.mta1.migadu.com ([2001:41d0:203:375::93] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8lu-0000000GFql-2twH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:13:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7NbnZ3oa/RtGinQgKVF9pKDMVERXfqX9/LOk9QyatAs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786540406; v=1; x=1787145206;
 b=lvuqJamfxASnuuzwCd7cyQM0Z5BLRyt9NrIJ6PnfMfQeHV8V1tlFXa/OVEAOtwC+ldnVtsL2
 8umyFKHZKediIRklOJJkjIYttu49vO8qZRUlvJ1hrvforo9t7IT7GIvVaCQ2QME+Ud+FA7BjGOX
 8riMOxU45MW5a/RdLt0POz/s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from linux.dev (54.71.19.239)
	by smtp.migadu.com with ESMTPS id ee06e5b49e57f9a5;
	Wed, 12 Aug 2026 13:13:26 +0000
Date: Wed, 12 Aug 2026 13:13:12 +0000
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huawei.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Message-ID: <anxxPkqbVgnikp6R@linux.dev>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
 <amjnf5gz0xP5PTSB@J2N7QTR9R3>
 <amn7cBQ-cqs2XlKV@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amn7cBQ-cqs2XlKV@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_061330_879755_71BFFB28 
X-CRM114-Status: GOOD (  12.38  )
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

On Wed, Jul 29, 2026 at 02:02:52PM +0000, Jose Fernandez (Anthropic) wrote:
> One idea I would like your opinion on is an in-range
> allocation preference for BPF trampolines, since execmem seems to
> have the shape for it on arm64 already.
[...]

Hi Mark,

Quick update on this, also for the others on the thread waiting on
the perf side. After some internal discussion we decided to try
adding CALL_OPS support on kCFI kernels directly, instead of the
in-range allocation above. The section argument Sami added to
-fpatchable-function-entry in clang 21 turns out to be enough to do
it with kernel changes only. We have it working as a local series and
I plan to send it as an RFC in the next couple of weeks. Mentioning
it now in case you are already looking at this or have thoughts
before then.

Thanks,
Jose

