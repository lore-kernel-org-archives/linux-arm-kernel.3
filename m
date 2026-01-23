Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475AED72342
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXGvfifUGGdbkeGMJB3zrIxoZOWdsw1/3iZd6E2rnU0=; b=3fwnFU42xjguC4pL0YJUPgR7kD
	kPw1MTvfWfahDg0zO7RvFYPa/iK/D33/EtYXZp7UGsbNq5ncxgdj9Bfdn9GYI+iZHBUpr7nxeZdaD
	uLvYiyyfTxOt/WsrdHiRcALk9c2pHKT0/lldkdsuJUEHZfU/Lrqwdozc7tgQRHZ2eClXapWTwpVMx
	LERKCEbKl6Q8Nhh5cMPhWm/iXwHmSet9yZm394ls6nsgZjCJetrnzTtBfkIwQ4yzSHCVq4BytTsB2
	HNHC7VjgSDjoiEAjI9awhVBGqqqwjGshstVYYYZRFSMbPEcl7ZshOZqR2+ZsBe4whR3JzzqhGwhl9
	kPwsUveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBaE-00000008N8m-1jpQ;
	Fri, 23 Jan 2026 07:27:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBaD-00000008N8g-1KAd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 07:27:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7244360134
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 07:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D49C19425
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769153272;
	bh=RXGvfifUGGdbkeGMJB3zrIxoZOWdsw1/3iZd6E2rnU0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rH1W40B6oidW9/oBs4Qo7S+7xiRwZ8afe73+jgLjvsPZ9qZeybrCQDrKPU1CBt8z9
	 0fFyfdouVALqznWFq4rzfIBhPIajl58WGepRkGU5bOKZ/0fJD83GfIeo5V5j/k1Y+N
	 FRB4RnzCIQfPpjr5f95ZEVRwYMCly54xPb4uvroIM5CclTihiAAojIrVp+LjhwF8Gb
	 pQLFc3yjktkzvMoGYfAiU8yJ24B4+TXoKoUTqdjv/6A8pQKe4c50fTFsiqOpA5+jP3
	 TcJTrtMO/fD0VMbNj20+7c27cKJsxxlYhQlqKypMCiI08s7liGn6X+ZjJ24JipKTmt
	 LXKJIRFC7ojtQ==
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82311f4070cso584291b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 23:27:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9FN/XYmej5vsWSPInnZg3e3prhSeEiEhMFhJe3C1YdlTPZHSbFDTQhDMcL8wTAa2LF5RdwGkMvtIA/6N4IuTb@lists.infradead.org
X-Gm-Message-State: AOJu0YyEfB/aQoucSEKEPutcUuglriL2oyOz/KJ8K3Dqytc6v5QuKEcK
	T5a/GsQG0X0qY3qqRwG+X2BBzTPp1N/jDN4lpG1HCFLxWSUt5oKDGsHds4M17SixGde2KpEMBQu
	kZPONczIO3+X7f3NSorXqou4EJYE4XL4=
X-Received: by 2002:a05:6300:4049:b0:35d:d477:a7f9 with SMTP id
 adf61e73a8af0-38e6ffb5ba4mr2021429637.12.1769153271678; Thu, 22 Jan 2026
 23:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20260119164747.1402434-6-ardb+git@google.com> <20260119164747.1402434-10-ardb+git@google.com>
 <47fdacc6-1928-4d77-8024-28133daac0f4@arm.com>
In-Reply-To: <47fdacc6-1928-4d77-8024-28133daac0f4@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 23 Jan 2026 08:27:40 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEDXnf7RpXp4nf7fy-0=8f54q=7MgGJm7L4W3FQwnZfwg@mail.gmail.com>
X-Gm-Features: AZwV_QjJC3CioIVYzZbmreiPemXfBBTbJkHb4YiUEcuLZmtHTtkUxg_lwRec8ow
Message-ID: <CAMj1kXEDXnf7RpXp4nf7fy-0=8f54q=7MgGJm7L4W3FQwnZfwg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: Unmap kernel data/bss entirely from the linear map
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Ryan Roberts <ryan.roberts@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 23 Jan 2026 at 07:52, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 19/01/26 10:17 PM, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The linear aliases of the kernel text and rodata are mapped read-only as
> > well. Given that the contents of these regions are mostly identical to
> > the version in the loadable image, mapping them read-only is a
> > reasonable hardening measure.
> >
> > Data and bss, however, are now also mapped read-only but the contents of
> > these regions are more likely to contain data that we'd rather not leak.
> > So let's unmap these entirely in the linear map when the kernel is
> > running normally.
> >
> > Only when going into hibernation or waking up from it do these regions
> > need to be mapped, so take care of this using a PM notifier.
>
> Just curious - why do we need them mapped while going into or coming back
> from the hibernation ?
>

Because the kernel image is preserved/restored via the linear map. For
some reason, it appears to be sufficient for this mapping to be
read-only but unmapping it entirely results in failures to resume from
hibernation.

