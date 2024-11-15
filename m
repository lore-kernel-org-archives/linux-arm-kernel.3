Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D935D6DDEA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ILDIer/VdnO4PCxnFUOdUhwVXpx5x90E484WMCOHrc=; b=0s1XF3zYcBojKoeljmR9qb0WsJ
	XgkiN/c3do7yatv1a5xyIP5SkH+ZOiKaUoBmUjH0VBCYhiEj+EQusWG8NIFTrer7JbGvLToqnkaAd
	hSrmFWWhjyUf6a+0yctGItGtgleRUgOIP3mK9PoAfcnVwg5racl0Kt2MB7nFqI93+1sjxOWVvGVn5
	tWDWTJ0WBvqBZuvjjCn6FKJ5zCcTTxC5+7IZWJPeAfmneIdApVT3nBes1wHQO3la4LJ9nMDGQ9XQa
	hTE3KsXmfe+Tf0yX57i3QhhLDmA1iuiNnwL5oLtq5F3cVaiV666y9qpPmFO5x5tur1SeH8vK7h9mR
	gf3ABJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsni-00000002DqK-3BBG;
	Fri, 15 Nov 2024 09:39:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsml-00000002Dfo-0E3S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 09:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C1BAA425A0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 09:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CE5C4CECF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 09:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731663517;
	bh=YYysRYtvQy0q1YE+IIP4G0gf6yUYEBbUKM9dwLw5Bz0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PtOT+johD0tVKtFfOlApjzryQDn1WiS0VEuHho4gSR0m8+W5Nma2ZTz//AmQTORGr
	 IZFjZIEMMp0yp0+48qtcYHIR/G/f+RGkernXs2WUKXVHmTdV/as3lxPPot3iHhSdDE
	 L1djOrp+9S2pPNRmZGee33CjO5PCQkC5fzO9hyG0wCANMlg5VQVNss83LbwzXAq5pB
	 HQHpAQibo2XqDxuQVVdDkVdyh5r3nqt2JH6o+mZOd7PB3uxozUoTWkXtR1bmwSEd0G
	 SkTOt350LPyw8cJEQcUs4qPgC+OlFR2LwkVFipTWIXyAiobdpVcL3kzc9HAWZiu7BM
	 fBjau7QYImIdA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da4fd084dso1586599e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 01:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMw39WDw6SP/sYzj0/kc1R1JuFCFAXJl+HRVOLlrZ7hfAv3IW4nSecnFdMZPPneL6M0LUdTOvWiXGVvcdBx1ev@lists.infradead.org
X-Gm-Message-State: AOJu0YwO/aqMw1yBxRf2uqK1nHnozkVVzophmYrxqTE6vuxLu3Umfabn
	jShAcKnfnn/0ssOkdLRdyj4gcJFsyotsUnF2rF7GKR858JAxxIRtHwT2o+YsHdOhEdFUB26HZlI
	VfPSi0S3SUanBmlKfHohlg2Eqxic=
X-Google-Smtp-Source: AGHT+IH73d+9THQbzwUoYsoeCx3epRujR0P8MgqQvHPDtQGZ9qZm/e6/fnvhYd36ViCB2QWThdX1O5NPm1HMbThelho=
X-Received: by 2002:ac2:5449:0:b0:53d:abc4:820f with SMTP id
 2adb3069b0e04-53dabc48279mr403956e87.6.1731663516323; Fri, 15 Nov 2024
 01:38:36 -0800 (PST)
MIME-Version: 1.0
References: <20241115093456.7310-1-zhujun2@cmss.chinamobile.com>
In-Reply-To: <20241115093456.7310-1-zhujun2@cmss.chinamobile.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 15 Nov 2024 10:38:25 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGgLp3vWd8jqN=NaB=YkqQgdFvoP_u-Kkt20NPjodLQ6g@mail.gmail.com>
Message-ID: <CAMj1kXGgLp3vWd8jqN=NaB=YkqQgdFvoP_u-Kkt20NPjodLQ6g@mail.gmail.com>
Subject: Re: [PATCH] arm64: asm: Fix the cacography in pgtable.h
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: catalin.marinas@arm.com, will@kernel.org, peterx@redhat.com, 
	joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_013839_154673_C6D9AA95 
X-CRM114-Status: GOOD (  18.09  )
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

On Fri, 15 Nov 2024 at 10:35, Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:
>
> The word 'trasferring' is wrong, so fix it.
>
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Please stop using the word 'cacography' - just use 'typo' or 'spelling'


> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index c329ea061dc9..4a5acf522c82 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1338,7 +1338,7 @@ static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
>  }
>
>  /*
> - * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
> + * __ptep_set_wrprotect - mark read-only while transferring potential hardware
>   * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
>   */
>  static inline void __ptep_set_wrprotect(struct mm_struct *mm,
> --
> 2.17.1
>
>
>

