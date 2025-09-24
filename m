Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BAFCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEKqMMl9gq8XJP5yzSG6Ur1oeXw00042GkxtizM3cxI=; b=siRwaUjAzZQM6wZHDaRjI6FR2K
	8pgBTUyN/iMerWlqmIZMvTYb80CzPIVP16V/VN0HvRzydiMyyWgSUfk9UYhauLgk4GqzZVWhHP4rY
	40Gltmwqd1bAPcHTPXx58VGFSnnBDy1onEmpkVxhiBIwDqbZz2/TeJan32+lOOfL7nXATIINl6Q8g
	wDmfomzE1jHmgqemX7exY/4QnxEXVglNL/TextVVpIKfWC5fqcI+prry0eZwOxzv5aNxEOh3fU+bt
	u1HKSqcMcN/05fv4KjruFTg5VDE/ONVRtWOUORUbrzkp1xpTiGYS5KJlRnX1wK1bcQrBumOwhLUTU
	94eTbaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R5N-000000013Tv-1K0a;
	Wed, 24 Sep 2025 15:07:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R5K-000000013RD-2zag
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96B03444C6;
	Wed, 24 Sep 2025 15:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBD6C4CEE7;
	Wed, 24 Sep 2025 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758726429;
	bh=vEKqMMl9gq8XJP5yzSG6Ur1oeXw00042GkxtizM3cxI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AvwKr/ByVG4DL2HwzUaIEii1G/oWO7ClDo+CrZTerZ/8rqpViaibrrCDDE1OSE1/E
	 VgMXBW5nZ3u4s6Q2Kta8kZkuOZ/VrjOF8OmaeLFWZSuxamkGg54L3//JfcElrKAfVc
	 2nq8eKsDtm+WFqwhsK3bLIfTGDuMNqXkH0SbWR6nRZKTqw2c1JHf66xOkCC2w3ZfgT
	 +odci2AcUG+EFTDSi8Pi49gJlaOAx15LdEM1hXP2E9Uda83BlzTSsrX7YCaQyLJ83L
	 +K2cx7b+uqh5nR3gH7J8YYfHNEElizWcnphtPKZ7ULmYeCEclmtjmPZsdxEnEpg4qa
	 07Cn8LyXOawlA==
Date: Wed, 24 Sep 2025 11:07:03 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>
Subject: Re: [PATCH 2/9] ftrace: Add register_ftrace_direct_hash function
Message-ID: <20250924110703.2a0ced1b@batman.local.home>
In-Reply-To: <aNQCDwYcG0Qo00Vg@krava>
References: <20250923215147.1571952-1-jolsa@kernel.org>
	<20250923215147.1571952-3-jolsa@kernel.org>
	<20250924050415.4aefcb91@batman.local.home>
	<aNQCDwYcG0Qo00Vg@krava>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_080710_776958_AF1A4680 
X-CRM114-Status: UNSURE (   9.64  )
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

On Wed, 24 Sep 2025 16:37:03 +0200
Jiri Olsa <olsajiri@gmail.com> wrote:

> I have bpf changes using this that I did not post yet, but even with that
> there's probably no reason to export this.. will remove

I'm interested in seeing these patches, as the ftrace hashes were
supposed to be opaque from other parts of the kernel.

-- Steve

