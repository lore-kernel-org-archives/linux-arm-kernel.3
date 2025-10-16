Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDFBCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stG7Pv3NR5XN4u/WZsYTBN5iCP51FwvWX+zqChqTmuE=; b=ZlOMV5MSHONIDQSWMDiHscRm4u
	AtIkvalidCT5xiyVvSjA8UxX0zh2mwm/HahU8cW7nkUSX+sg0IL2VZbik+IG+54RE0O42I/+duq2S
	UzKNJBi9/etuFskRh1qBPm+YjxbTk39FutBWI/8ae6OOrRT8IPBSVXUdeAMwsOZ+XwSYOyUqpGr4U
	dGqOOHARtFqnhXvqHEFpOWLGfUYid7jMjOTIMzUsqMTr4SQA8OQciynY5nGSTRGt3Br0FLYs42nyl
	fOgfUXoUcFCmbYAu5QtfvIvSsaP3PNjsDhXkPY2l+TDFb7IAUxXshS3OY6QnC1iqy3EmfuQ+CImm0
	08mBhYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QEI-00000005G9Z-0FRH;
	Thu, 16 Oct 2025 15:49:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QEG-00000005G99-1a40;
	Thu, 16 Oct 2025 15:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2B4660444;
	Thu, 16 Oct 2025 15:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5BDC4CEF1;
	Thu, 16 Oct 2025 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760629763;
	bh=SA4GVw/nGNJf/qOm9uwEhfvgtPwILVcT7iMh4Nomboc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYon15nTC1mf/Qvey0ODWWWDCuKPTr+/B27xSXjLWRwifGlrhDcQOgJhEMNqsjziR
	 eDOiocYrPuTcMiBDfhqjwhqH9hA4sSLXWykN43T5M+Ix8ShIiM79qj+AJGvyo089PX
	 stOi4BAdKthV2JSsl7fMI1yYGo8J8o5uuKi2kihDTXySBmt0eIJajJLrWVbK7+0jGA
	 qzWWj00vhlfquMHu8Cdg4TiwBuaginpMBQHcctPHlbwBi42bVHU/M//wtdNHb3AEXf
	 ReNHOGVbu4I8xxDFWQXcYZtcer8mhUYow8CFKTXY+Y181eNS51IOOuYu5LidalJ0HF
	 AIpnRMtBHrx4w==
Date: Thu, 16 Oct 2025 08:49:20 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
Message-ID: <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
References: <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com>
 <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
 <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
 <CAMj1kXEs5=VRi_rJwgHUrQWos-27PBbr3c4fYnmkV8Ahi8HZgw@mail.gmail.com>
 <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
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

On Thu, Oct 16, 2025 at 04:52:20PM +0200, Ard Biesheuvel wrote:
> On Tue, 14 Oct 2025 at 18:47, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > The idea is that libstub code doesn't belong in vmlinux.o because it's
> > not a part of the kernel proper, and doesn't need to be validated or
> > modified by objtool for any reason.
> >
> 
> I don't see a reason to change this on architectures that a) do not
> use objtool and b) link the EFI stub into vmlinux. If LoongArch wants
> to change this, that is fine, but that still does not mean it needs to
> change on other architectures too.
> 
> EFI related boot errors are a nightmare to debug, and I will be the
> one getting the reports when this regresses arm64 on hardware that 2
> people on the planet have access to.

The idea was to have more consistency, so vmlinux.o never has libstub,
regardless of arch, but that's your call.

I'd still propose we keep the KBUILD_VMLINUX_LIBS_PRELINK mechanism to
allow other arches to opt in as needed.

And that variable might even be useful for other cases (x86 startup
code?)

-- 
Josh

