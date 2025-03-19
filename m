Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED54C36001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 22:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUxWXDa9ytbv19apr/wdE+fuqjbBVyBbD75QFQarPJs=; b=Zdx8v+9BVpzimfm6vp25rq+keY
	+IBCPViB5YNlz7fqrhfrRYitWrwNF6GqtvYpuFTTutZ0fH+n821Gn7n+5c+Erl8FUyxDdgi0l9d3D
	W25Z8iEyv+QdqbAxMfV4FbqP339k4dlasehCzrgSEreHPCChpozCTCp6p1CATQF/3nnC9f38B29Bu
	TFo+us+PyDt8YKfwf9PrXlBEy/4SCU+52UaVAVJ7dkPRlb1Yr3lt0ZTFdyd7MPimONZBay+t9+nzW
	ZOOI+Bmbq+UWaBaostj2qyMFktQfl1VhXQT5kU75wdiTUft1aWj8iARQk385yZhc/imNlc+aKf/aD
	zmDurv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv22h-0000000AJ2e-3pWG;
	Wed, 19 Mar 2025 22:37:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv210-0000000AIrE-2OMt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 22:35:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4C9F40C24;
	Wed, 19 Mar 2025 22:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD031C4CEE4;
	Wed, 19 Mar 2025 22:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742423758;
	bh=t9LrwQm4+WnBdqI7kdntfnIZkPemuCuJkq5GcZA0rEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2nVXPF7Az9vWUVSb2Pgi6VDuTdIxF/TzuQHVblnN8JkeUZgmyFDWXgRwXrBwl0o+
	 685eZQ+jtppKo7Xbv7paVc20Rjb3YYsrHNudGj6ti/QCVh/1O0GufxADLENwZqoGjk
	 7zwUTTLqBf0C4Z+RvDMMaItk3Vx4lgfQ5fTTkGbnNsF4RAoFLDYk4Juz4vtXzpW6Jh
	 KNOHmY2lfA/Gyyv7wbhRrWzTVfYtgnlrMPtgHfYXb0lZjBIktjK44Qb0xtMBm/wgTi
	 TuSk2gEOjLIP3UHSVV4epJ8C9wpSY/qz66PzjvXk4DAXoRSVai11y5wMWJQKOhpsn3
	 qfrD03uMGqc8A==
Date: Wed, 19 Mar 2025 15:35:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, indu.bhagat@oracle.com, 
	puranjay@kernel.org, wnliu@google.com, irogers@google.com, joe.lawrence@redhat.com, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <yrqgoc66te54tuffkrc74clsosiid2giw3gpc3kd3ddl4662tb@kiqh3ncfxwnl>
References: <20250319213707.1784775-1-song@kernel.org>
 <20250319213707.1784775-2-song@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250319213707.1784775-2-song@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_153558_627273_5E3B0DC1 
X-CRM114-Status: UNSURE (   9.30  )
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

On Wed, Mar 19, 2025 at 02:37:06PM -0700, Song Liu wrote:
> +noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
> +			void *cookie, struct task_struct *task)
> +{
> +	struct kunwind_consume_entry_data data = {
> +		.consume_entry = consume_entry,
> +		.cookie = cookie,
> +	};
> +	int ret;
> +
> +	ret = kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, NULL, true);
> +	if (ret == -ENOENT)
> +		ret = 0;

Is this check redundant with the -ENOENT check in do_kunwind() which
already converts ret to zero?

-- 
Josh

