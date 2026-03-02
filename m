Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8C6EA4E1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHcVaJeZaASbHbwHm/E1+El5SPuCCCpoiLHQK14U014=; b=bYW/UROjhwajZVhxjlBhAA9QHO
	izyul3RdxYYInbcHX+kdY4cjj1dolMU2nH/aNkltWLdKEEt1uB3rWsiyRUF1hPKhk5Gw2LTbgvIyV
	rR0hl9ADGZCbHk1HoXLlV3vw6HsgAH6P0JXbryAjLcVUe8BE04VDQs+NCeiGrZMdgX4V+tIuA+uLW
	lAMCZN5yEbLw/vhhrtohij1GTzlrb9pMLekAJqU8N5D3HOgzTdNNO+cu5S8+k1GuD3Mka4w2e6uXF
	84ngQ+2uDv6u+3rELXtU14VFhVd/VIAL8Blog0GqFhwCRTRapvfkGtXaG0BWRj+o2XxoTHaD4hTbN
	TsW4vJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4uc-0000000DJVz-3KjT;
	Mon, 02 Mar 2026 15:10:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4ub-0000000DJVO-3E8T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6480760008;
	Mon,  2 Mar 2026 15:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FC2C19423;
	Mon,  2 Mar 2026 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772464219;
	bh=Fo8AGgEEzophPRCLg2uWkd+i0mJGxmJxIyxa7Su84ho=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tb2tDcolb55tZqvQmfAaMmhbQ5a39mBkDUdVfODBy/jb7bN+6sJl3LoDenifihszL
	 W9hYruogmc8ellq52FKqN9YJnozp2dPjI2kcZQ1I3AZMdK8h+XlHfwa7h0et7/PErd
	 T4Jai7HRwUGSyNuu7raBEKQeCyxQ1X+8HVfvkV96pUAFpI2JxT3HFmqCX7H58C/3DV
	 ZpBeJOQwBVbBjtmKsdQRnTTWAw+WUsdUURdGX4YnOTAL51kkIdqgyBimvZ1qMB2HSK
	 ZrOmFE8qLDpy0ZWm1nekKktTUYeAk8ADwgPeP95GEENvd4hRnQJQPkcim8vJZk3bWt
	 5gMXNzay92m4Q==
Date: Mon, 2 Mar 2026 10:10:49 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Florent Revest
 <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>
Subject: Re: [PATCHv6 bpf-next 9/9] bpf,x86: Use single ftrace_ops for
 direct calls
Message-ID: <20260302101049.2614bca4@gandalf.local.home>
In-Reply-To: <aaVFeafZb76l9L0m@krava>
References: <20251230145010.103439-1-jolsa@kernel.org>
	<20251230145010.103439-10-jolsa@kernel.org>
	<1b58ffb2-92ae-433a-ba46-95294d6edea2@linux.dev>
	<aaIAoBZGkP7RQrvc@krava>
	<aaILlSuEgaYDq41r@krava>
	<20260228153921.19cd42a6@fedora>
	<aaVFeafZb76l9L0m@krava>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 2 Mar 2026 09:08:25 +0100
Jiri Olsa <olsajiri@gmail.com> wrote:

> > As there's nothing after the comment and before the end of the block.  
> 
> ok, will do.. the original changes:
> 
>   05dc5e9c1fe1 ("ftrace: Add update_ftrace_direct_add function")
>   8d2c1233f371 ("ftrace: Add update_ftrace_direct_del function")
> 
> went through bpf tree, so I'll send the fix the same way,
> please let me know otherwise

As long as I give a reviewed-by tag.

Thanks,

-- Steve

