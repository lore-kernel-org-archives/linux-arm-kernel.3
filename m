Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE255C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pkh4hhvitVpN0mKPmW0tH5YxKInmBYciLZFphhKj924=; b=Dmix5ce4YCuMLBHQDdLgN4J/Y1
	0R2Ja6Pa9GMmpHL5qTCxlsyfRjgj4Pnr52XNPJbqd9dDUpWRGel/NcyvuLP+pMCY+4akCAoWfIcka
	f/Nb2lisChgI1GJwp0iEvtL4a9te5aUrgutBMri2Nc8otqDZFn+M4RT5x7rH+muV6oTa5bT/cL0NB
	zijkcGB1GSiqvcPQv8wbbxbZvGLtZqBE4xvYSnLVeuIX3yOXK8i/hZ+LlU7ZG7NVFZrdQR0y1cMDc
	763mdfzUZNQ6Y2yiAQSc7MMJYiGTXF0WNZ8UTV3L6MJAK/7+GWoaNNiER1dl3m+Cn7kMnPz2jKSU/
	BwSeutMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndKW-00000007QTC-0D7V;
	Thu, 27 Feb 2025 12:49:32 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnciT-00000007IuT-1Jyr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:10:14 +0000
Received: from pobox.suse.cz (unknown [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E94921179;
	Thu, 27 Feb 2025 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1740658210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pkh4hhvitVpN0mKPmW0tH5YxKInmBYciLZFphhKj924=;
	b=ip1Jz9IurwcOjzrHThzL3ETYe0y+abQ5eqK8IserEG6735aAbxFFnWlupVdUXOy+68ORds
	64sI995sqxExnQr92i6ZUDtqB82nigpXMfQIXwHXA1XOcwHYwp8b/3LW8oK2d6z2AVSryM
	yidfOTKEG5p8RLIwPbzY/wqQ9sOsHNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1740658210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pkh4hhvitVpN0mKPmW0tH5YxKInmBYciLZFphhKj924=;
	b=C7QCxcA51Gxrg6/yfdUJBm5QkTqTsKbY0IeIvcuSXc+YTJN9EynkZUmYBh5PTjxbe07otZ
	e9owObibSiKc5FBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1740658210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pkh4hhvitVpN0mKPmW0tH5YxKInmBYciLZFphhKj924=;
	b=ip1Jz9IurwcOjzrHThzL3ETYe0y+abQ5eqK8IserEG6735aAbxFFnWlupVdUXOy+68ORds
	64sI995sqxExnQr92i6ZUDtqB82nigpXMfQIXwHXA1XOcwHYwp8b/3LW8oK2d6z2AVSryM
	yidfOTKEG5p8RLIwPbzY/wqQ9sOsHNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1740658210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pkh4hhvitVpN0mKPmW0tH5YxKInmBYciLZFphhKj924=;
	b=C7QCxcA51Gxrg6/yfdUJBm5QkTqTsKbY0IeIvcuSXc+YTJN9EynkZUmYBh5PTjxbe07otZ
	e9owObibSiKc5FBw==
Date: Thu, 27 Feb 2025 13:10:10 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Weinan Liu <wnliu@google.com>
cc: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
    Indu Bhagat <indu.bhagat@oracle.com>, 
    Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
    roman.gushchin@linux.dev, Will Deacon <will@kernel.org>, 
    Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
    linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
    joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
    "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>, 
    Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Subject: Re: [PATCH 7/8] arm64: Define TIF_PATCH_PENDING for livepatch
In-Reply-To: <20250127213310.2496133-8-wnliu@google.com>
Message-ID: <alpine.LSU.2.21.2502271308390.25291@pobox.suse.cz>
References: <20250127213310.2496133-1-wnliu@google.com> <20250127213310.2496133-8-wnliu@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.950];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kernel.org,goodmis.org,oracle.com,infradead.org,arm.com,linux.dev,google.com,vger.kernel.org,redhat.com,lists.infradead.org,linux.microsoft.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_041013_497791_9C5D7DAD 
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

Hi,

> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index b260ddc4d3e9..b537af333b42 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -8,6 +8,7 @@
>  #include <linux/context_tracking.h>
>  #include <linux/kasan.h>
>  #include <linux/linkage.h>
> +#include <linux/livepatch.h>
>  #include <linux/lockdep.h>
>  #include <linux/ptrace.h>
>  #include <linux/resume_user_mode.h>
> @@ -144,6 +145,9 @@ static void do_notify_resume(struct pt_regs *regs, unsigned long thread_flags)
>  				       (void __user *)NULL, current);
>  		}
>  
> +		if (thread_flags & _TIF_PATCH_PENDING)
> +			klp_update_patch_state(current);
> +
>  		if (thread_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>  			do_signal(regs);

Just a remark so that it is recorded. Once arm64 is moved to generic 
entry infra, the hunk will not be needed.

Regards,
Miroslav

