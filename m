Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB64CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usSAH/zbQ3G5tLZiA2+d+MT/Qfb+4vnxy3JL5VPNyG4=; b=RomyGTMUMn12JN7FnLsjkmqN8+
	DSh3MO3Mybp0Fx1FQ4HDonjdPbL4f6eYC826+a9J0CPy4+UKsit/kaKIyIijlvRWPAQmvigCAtPUU
	YiXchkThgLVDRaYSRpBFRAUcq3JpyPg9o5LY5z5GAq6Gs3iZQayalNvpe8MJP5VIuyftaCySzAMW+
	hWaN24DJd6aQN40LBiopewjLcnwIaIW0KH8PyV5Mxxbz3IzAIzLlhqQ6Oy9YO9g5IJYQsQVn7H5Ll
	3sNO46iVrTpPU/uASr4W1Z5gOB7O8RfqjQ78ofVaf05ag+/1pqKHlbfbZAODUblQtLQits8ujpHV8
	zl4S8VNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubyK-00000006q0D-3CEo;
	Tue, 18 Mar 2025 18:47:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tubwd-00000006pkC-3tFg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 18:45:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E3FF5C5929;
	Tue, 18 Mar 2025 18:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1F4C4CEF3;
	Tue, 18 Mar 2025 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742323542;
	bh=n+PUy+yopYknWroJKoiUzm5LTEE1VxdaPvpJQi/jNwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3SC6WWDV15A2K2efve0VqxxDLf0xP6wH/IFBx9zD4fq5jCClG86D5pFmrdUtd7q3
	 ZPX7jUZx5Dz/ayPCQsyXyVnhbaBZ/CLHTLlb/O8YgvdzSMjiTL7Xq5jviMlmEUI+e4
	 e0p8pUQatcGeicbTO0IvDr22XfuZ0aFE+wlQPmPaB/9ymzT+oHwpPTB6l3SJVk3lus
	 WY3s1IUzlCZ8bLFYccLqdtLUL4v92bSd93MulspnauZBwoSMuOJuKyqYZkYYwuBeah
	 rJdirlmWrZUSvxrkWkwRmV9hhrJPPx42U4lhWyvMOhBIYaAiIL+1euGSohYUPdONPB
	 qa9OJGULvLtZg==
Date: Tue, 18 Mar 2025 11:45:40 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, indu.bhagat@oracle.com, 
	puranjay@kernel.org, wnliu@google.com, irogers@google.com, joe.lawrence@redhat.com, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
References: <20250308012742.3208215-1-song@kernel.org>
 <20250308012742.3208215-2-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308012742.3208215-2-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_114544_005047_3C86C6B6 
X-CRM114-Status: GOOD (  11.74  )
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

On Fri, Mar 07, 2025 at 05:27:41PM -0800, Song Liu wrote:
> With proper exception boundary detection, it is possible to implment
> arch_stack_walk_reliable without sframe.
> 
> Note that, arch_stack_walk_reliable does not guarantee getting reliable
> stack in all scenarios. Instead, it can reliably detect when the stack
> trace is not reliable, which is enough to provide reliable livepatching.
> 
> This version has been inspired by Weinan Liu's patch [1].
> 
> [1] https://lore.kernel.org/live-patching/20250127213310.2496133-7-wnliu@google.com/
> Signed-off-by: Song Liu <song@kernel.org>

This looks incomplete.  The reliable unwinder needs to be extra
paranoid.  There are several already-checked-for errors in the unwinder
that don't actually set the unreliable bit.

There are likely other failure modes it should also be checking for.
For example I don't see where it confirms that the unwind completed to
the end of the stack (which is typically at a certain offset).

See for example all the error conditions in the x86 version of
arch_stack_walk_reliable() and in arch/x86/kernel/unwind_frame.c.

-- 
Josh

