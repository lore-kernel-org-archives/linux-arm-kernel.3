Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC68CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jb5QGemEzr2Ow1OIBgpTeZj0Wu1VSG29ghYR1AhhT1E=; b=2DcKDTI3NXCE3nQucLuPQQOIJf
	b4MdDFekqXqNMqNfYa/+JK6ZMbHy4CuZMOgJGi1LSwp7gLDML6HrokrvOs12AOur1jUhEd4aMrMVW
	6xjKvjIjG6a/cM+b4H2BkZADh3KU4S6lBOdlgH+GFI+y1G5cEAQjzI05GrQOxs59KiqH52A5lm5p+
	6RcTXZdJsbYxxV+5RPPy2nMu3aj0ap2bGJRX0Z0AYwI7tag3rYhlUQNQ53hlX5eFYmmRcp7RMfEVC
	NYIEiFeCXXy6dO6SlckAh9wTlizkoa07bjXWyF37byTYIKrhEl22o+uUgPGz8b9xBCMPx+7SPE2XA
	rPlSnF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKG0-00000004ghJ-0kul;
	Wed, 27 May 2026 19:49:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKFo-00000004gg6-3ESa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 19:49:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24C81605A0;
	Wed, 27 May 2026 19:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4661F00ACF;
	Wed, 27 May 2026 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911363;
	bh=Jb5QGemEzr2Ow1OIBgpTeZj0Wu1VSG29ghYR1AhhT1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mzeo38cohRcK7fyckwGGR2eKTLeVuZOhfsYenQX832D3pQhjRz2Pai4Af2GAPGRYS
	 8KmSnp57fZ1Ohqr3r+I+A7SkbdlCubw9Ja/dwXR0m4m3m8tKA8pvxbe4Pg9TA/fLcG
	 LL+pQxFIneGiRNuu2piqmX5yxr+8AKt0nsuWhfVtq7mPoM0uSb+bLKcxRdzYXbvhrV
	 zGWnCJn9gUxYc6d6PrmlLoeZ9n9YhVKkgEnSB38NtDjmAZCZltQV0KGllbKEV/s7H0
	 dCV8Rg3ezHMaYyutbbegHc9WG+j4ZGVg2lN20WfuKnriFqmfH7oTap+awPz+rHYftZ
	 dOK/6eMt1YhHA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	yangfeng@kylinos.cn,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	jolsa@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	Gyokhan Kochmarla <gyokhan@amazon.de>
Subject: Re: [PATCH 6.12] tracing: Fix the bug where bpf_get_stackid returns -EFAULT on the ARM64
Date: Wed, 27 May 2026 15:49:01 -0400
Message-ID: <20260527-agent5-item009-tracing@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526192012.76223-1-gyokhan@amazon.de>
References: <20260526192012.76223-1-gyokhan@amazon.de>
MIME-Version: 1.0
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

> commit fd2f74f8f3d3c1a524637caf5bead9757fae4332 upstream.
>
> When using bpf_program__attach_kprobe_multi_opts on ARM64 to hook a BPF program
> that contains the bpf_get_stackid function, the BPF program fails
> to obtain the stack trace and returns -EFAULT.

Queued for 6.12.y, thanks.

--
Thanks,
Sasha

