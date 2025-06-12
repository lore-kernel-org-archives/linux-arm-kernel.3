Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D42C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZp6NLAAymLxr2GaTsVRzfsMH8Fkg+WcA/XsAzEoyLE=; b=z7OcOPahpXJXBYQPwrNah8vjYz
	TN9hvHSt9GY8c7sAoBdj1RjIiJhCXeFae4NokvjmpbyRjKTpk0hECfI1L7R0J+WZFqQVYClUfHZKR
	rl4RIAA6kzOysju8vcyMTuXxGbG0cWxg1KzRqSmza9RB+ismX4Ya+szBD8b4mh4ou7C0+Y69/bjem
	ACoP+W2HcJvmV3sYHJ4gv51VrI7fReWKg7UVnSI5umn1wFGsFCzHFwRELX3m9crjKHQddz9A8n8Zm
	Fk00vEQL/oBqJAJ7Hm9U46iHQclUQkW2CZ23XhzEiJnqq2Ere1qsyIQKpAhe1m4aPQ/t3lRAiK0/L
	WGIxZQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDg-0000000EwnL-01Dj;
	Fri, 13 Jun 2025 00:24:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkfJ-0000000Dw5O-3bNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:20:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50FD343FC2;
	Thu, 12 Jun 2025 16:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B66C4CEEE;
	Thu, 12 Jun 2025 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749745233;
	bh=X+UdTHXDFMte+vwvhwJwB2Z7tZ1dV9rcTCoM9SVT0hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPyJ2dWsJbyzqBHD0PMyl8dK0RPs99sGSg01vkmm8hOgV86bNu+pxGug0oIm/y81b
	 jOGoS8UxKiTofeJqilG6Z7djN3h1/Ly3QvOEBlE7VbcP30TF31xEakvNu3FlvgKhlk
	 hHcOIs0/WnVPw+shOtZsK23BdENywcy3flnjnJ67xsr/eKIGYZ53F2Gm7lwV0bXzIe
	 NXPaT6szRw06eFc982fGx7qpmGYpicxKDbE+CSQo7a21SXHThms78ptWkh2iit4Wgf
	 NfXudkexdO2dQtpCvDDuW41+cG9sIrY6UAuzq3vkOD+NndlGjT2hNwRvHScZm/k13l
	 00aPjaTYzYQtw==
Date: Thu, 12 Jun 2025 17:20:28 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <20250612162027.GA13202@willie-the-truck>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
 <aErokN0vKT3urlmA@arm.com>
 <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_092033_913756_4ED5E4D7 
X-CRM114-Status: GOOD (  22.76  )
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

On Thu, Jun 12, 2025 at 03:51:19PM +0100, Mark Brown wrote:
> On Thu, Jun 12, 2025 at 03:47:44PM +0100, Catalin Marinas wrote:
> > On Thu, Jun 12, 2025 at 12:40:42PM +0100, Mark Brown wrote:
> > > On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:
> 
> > > > Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> > > > when we need to free the shadow stack on this path. On the exit_mm()
> > > > path for example we have mmput() -> exit_mmap() that takes care of
> > > > unmapping everything. Similarly on the exec_mmap() path.
> 
> > > We need that one to clean up the GCS for threads that had it allocated
> > > for compatibility, you can see the leak that results without it easily
> > > with the glibc testsuite (or anything else that does threads, the glibc
> > > tests just spot it).  Most of the checking for arch_release_task_struct()
> > > is verifying that deactivate_mm() is guaranteed to be called eveywhere
> > > it's relevant, I need to page that back in.
> 
> > Makes sense. I think we should only keep gcs_free() in one place,
> > ideally deactivate_mm() as that's more related to mm rather than the
> > task_struct.
> 
> Yes, me too - I just need to double check.

Having looking a little at the code, I think that
arch_release_task_struct() might be better than deactivate_mm(). The
latter takes an 'mm' parameter which we ignore but I think happens to
be 'current->mm'and so things work. Given that, and that we don't do any
GCS management on the activate_mm() path, freeing the GCS in the
task-centric functions makes more sense to me.

Will

