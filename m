Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A7CC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbEoHeWa1iXbv+CJsuBzx8OY0CDSunFEVpuvSAPhmGU=; b=WCPGpq27omysEkhMR8Bm/X+p0x
	+drIjJfm7kFpkS7sM4CXYz1NYnoXJ/j5GfI3lKGytF3WOI+LkyQNXK7nNyk84gh/NrYrz6/1ELtek
	L15byB6JOQ7tns5P87Zq+cyHK3I4OQ+hmnVzTpEG7y35snbDbdDmukviFvwFyZa0Cq6iefvvQrFHy
	85hYhogCTS6KbGQlYnk7oPRB0bdPLPJd+mjXU0RCCoAHXLoAsQ0Q4h7vIQwEe29fNw5oYYsOekZKR
	Jdlp3x9tphbVXMY+v9x9LKgkuk+W8gUBy2seRj/gtpBeSJxU8iMIo49SI3C9kL8OLfvXBPAXe4RPO
	8hb7Jgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnKe-0000000ECTe-0szr;
	Tue, 11 Aug 2026 14:19:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnKd-0000000ECTV-1fXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:19:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D01EB40DDF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 14:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9E91F00A3D;
	Tue, 11 Aug 2026 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786457994;
	bh=HbEoHeWa1iXbv+CJsuBzx8OY0CDSunFEVpuvSAPhmGU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VAL3NnWr4vD7qt7VGFKNxRnFzje/ffHpkSssI67BzAEI6IPyJFXDzHcCCyjI2Ht3n
	 LEE8HrSS0M2eTQJd3FT/fIrTnzrtLSPQGR4eUnaYauubjmxs95MgMaifp4YzOyuCTT
	 1146Odr5ZpH9o5q5XZLhfP8n39Twi5J2181RdJddSSif/dOw/DvNXEeXFxrg5i1JBx
	 2urg1xF8pdtp5Uwa1QhmL1XUVqtBXREjr1uLUDFezTTMq31qmrWbzcazxgqQPdDpVm
	 3UwaZTH0hx51/O7sa08twvQY9ixynLPByb9Y/uKx+qZ7MD0QyZsX/h5fhx4PjhgHo5
	 3r3cSrG0FAhoA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id DDE631980047;
	Tue, 11 Aug 2026 10:19:52 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 11 Aug 2026 10:19:52 -0400
X-ME-Sender: <xms:hy97agUHHqV19OU-0ggNLhbT4KEg7xujY_RCzu2EE1k7U7x0SA3TYQ>
    <xme:hy97avZOQvL6tMG1ln9ohh1NjtNf-9FA_E7p1k-hTOsUIzam9VtNWsC9l4WAZExEw
    ysOl30wYEvMz9oDF9Kk3EKJ01qGNK4Ub-NA-jS3Bn9-YatwDbsJzA>
X-ME-Proxy-Cause: dmFkZTE9VSS85hDKObpVcqPkq+33i6ZXW5fVUmYbaU57hGElAJcK+GHLt6B/EQSqfeZrx5
    Q/ode+btOhPbFNAdyaT3DsQWNimOmiaFKmTUQtWe/kYCuKs6ApVUrCs5uFyNz9pdqwdfW1
    rd8vllQY1Lymp6SIqWfrj3Xm9t/ErLKGHiBxJNvn2AkkU2X8/rrKjLk2Oo4U0nultql5Wt
    SE0fH2j1uQYRGtc9+ZWibx9Z/w0suyUbs/FfYCWhnBxMbYKVbPy1ad8W6zb2SlJ0GgWD2A
    t1dp3GloUHUCE2cxugLFj+b70RJmFEhNSrYTHC/uwtF367cNHf3CdfvrFlNy6ZnMDmlLDe
    QosOPqu3JcJBWh2M4deiatVk3DWdpV4PlwKzvmkXPxhVQcf6eEtHFdJWnh0fjyqTUcPOUH
    1iwTwMOX9Y74xBrGIbQJrxscrmCPvhY1dTQZ35E58fzw14AYOITJliZzgrzY+KstXKQf6B
    HMRaOyl+duaEGH2DRjAOba4dha/XmaEW6aOuEx4uS73u8f2Nm0rJ6tygG26rUeoYs/vFfw
    x+HqNu/078HyCyTzaK5aDOzsJvCPNiG2mwoda2IHkE5bGFCnMrFo3WoBSF2pGNlx7mehZz
    k7SyIQ1nCuO0PKf2hu9P0FqY5+kkPGjdGErmbf1lfSLMsH51MzOH7vZ7wcoQ
X-ME-Proxy: <xmx:iC97aleBQM6ylMrXz56SKmyPnOkg_v2ZGeEkoathlEIO3QZXgz20Yw>
    <xmx:iC97auqJdcLuHFOJeApf3ivkGKhSjUDlUVqE2hLZGJUkmh2oVFX25g>
    <xmx:iC97aiAIl_1fytnqzwx2_pzoKRR56KeGN3svFOPKXJTQktUD9iNfsA>
    <xmx:iC97ajYcSAPXSMOLdo1m9Egk-D5C7OGQgRKJqQf2a1gL557w09snYg>
    <xmx:iC97at4Z56eUTRiC2vN_0L2CEhaEffJsvNbFBdURFHwDflW8CJonukf1>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3954AF8006A; Tue, 11 Aug 2026 10:19:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 16:19:30 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "gus bourg" <gus@bourg.net>
Message-Id: <a8d2176a-193f-4ce0-b014-90f3c2ac62c8@app.fastmail.com>
In-Reply-To: <20260811140430.22832-1-will@kernel.org>
References: <20260811140430.22832-1-will@kernel.org>
Subject: Re: [PATCH] arm64/efi: Avoid voluntary preemption with efi_mm installed
Content-Type: text/plain
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



On Tue, 11 Aug 2026, at 16:04, Will Deacon wrote:
> Gus reports a bad kernel memory access when using software PAN
> (CONFIG_ARM64_SW_TTBR0_PAN=y) on a machine with support for EFI runtime
> services:
>
>   Unable to handle kernel access to user memory outside uaccess routines
>     at virtual address 00000000f322ff30
>   Mem abort info:
>     ESR = 0x0000000096000004
>     FSC = 0x04: level 0 translation fault
>   Internal error: Oops: 0000000096000004 [#1]  SMP
>   Workqueue: efi_rts_wq efi_call_rts
>   pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : efi_call_rts+0xd8/0x288
>   Call trace:
>    efi_call_rts+0xd8/0x288 (P)
>    process_one_work+0x178/0x4f8
>    worker_thread+0x194/0x328
>
> This is because the fpsimd context management code called from
> __efi_fpsimd_begin() can preempt voluntarily, returning later to the EFI
> code with an incorrect value for TTBR0_EL1 thanks to the deferred mm
> switching used by the software PAN implementation.
>
> Since EFI runtime services cannot preempt voluntarily and because the
> fpsimd switching code does not rely on the TTBR0_EL1 mappings, simply
> reorder the fpsimd switch so that it occurs before we change the
> page-table.
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Reported-by: Gus Bourg <gus@bourg.net>
> Tested-by: Gus Bourg <gus@bourg.net>
> Fixes: a5baf582f4c0 ("arm64/efi: Call EFI runtime services without 
> disabling preemption")
> Link: 
> https://lore.kernel.org/all/20260806000144.3388823-1-gus@bourg.net/
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

