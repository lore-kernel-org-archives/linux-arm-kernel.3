Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0DDC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 17:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=; b=xxL4ZP4LRod5yzgZ31ydbmtnTB
	nJUOba2io7cXaLSXHMh+ZaT4bT0Dy0KRWbDre5Rvs/MLq/BVKELS0s2beaKcBEebUoQr+vtlpSGh5
	iHYQG7VMoY7NWCdRobg4SDxrQnL+iQOTMSeCsTQbsPJoGR3G48bbtFgexh0T0OkzPlm3Qu6vzv0gD
	heNl/+x6lFGCZ7SV+i9sCRpvneCtZ10XGmDz4Y9DC3MVNyx0JDf9BJ58bYkzwEIscS3Y4DabdtmJz
	1MmFFNlR1se//uWEms17Mq2/gmT29IcB0n6YQ8Fh/SULtsfA6n6Lfku+2xHjfkhycybvWA21OJYBD
	iq9IeUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAW5d-0000000Ffut-0QT4;
	Sat, 26 Sep 2026 17:21:33 +0000
Received: from mail-ed2-x25.google.com ([2a00:1450:4864:33::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAW5a-0000000FfuX-2C7t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 17:21:31 +0000
Received: by mail-ed2-x25.google.com with SMTP id 4fb4d7f45d1cf-6aaf1149da7so135929a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 10:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790443288; cv=none;
        d=google.com; s=arc-20260327;
        b=OX/Dc1KQClllstZ9WwZ5HDzxpW9a+rThqncjSVuS/mftlwHdFZkl4aqTelc4afYjUz
         XHMjK1hBH8F/f3nihWFHf7mtPZWe5EbmJebtcV/ecc06S5BGM5XR0VkOxK1f71SuFZ4m
         JWnVtcLS19LrqFZ7P/09utbcBnVZm6HpWl/7+5eTEzBY25S2T3iBll9x3jd3ACa5sfbz
         XkxCL2Zc3J60oO2ptJRRahTf/qhsaG2joewHfNvJqXYfyyv1csZdrb0GVJkT1hJEXyVo
         /d3x/5ozEVQ6HElIlsdq8YSJVy+UCh3dlRs8cmqZLYmBQy5N5HoDAMMK6gKys7iyOo3z
         8w8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        fh=Z6RdooJk7SBk4NuA2H+V+kflsyZjJRhuaDdpA1vq5kI=;
        b=VDHPtO8DsIHGEdkQoLjVIc7cGRI+nl1+xp3lSxDaeMGH0hF79Ns0NKuDcZj6OwuDV/
         nLKezvnwkPJ+YLaYKMR8osfOYYw4gATryaTvAod2e/ej+F4eKlSnuaQT/A6TzZjizpuj
         SK6RTZVdHngEFonozu7hpncFC9WD+O9cIjGbArPAEe6hVbaIGOGKfFp5vujWFS9shJ7T
         R8NSIlrJ4RKUbwGVVvItpHPyR9ZW6f1G+8+LFvz4Xm2COhlvts+mVGEL82FBVfDIQsAe
         v6jdPArpiuLk8bP7ESEW2+i02dVD0yKg7rEsQE9JuFQ5bDvMWXOMygVw2TC4bHWBnUMM
         LaMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790443288; x=1791048088; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=PAagmnq4mW8Epm233FwI9igS4eBcy/XpaShKL+JCLkeJH3YCF4SxZQ4MVghICgcDpG
         rC9GFOIzKBtFgprq/oEPl+8Tt1JyhOZc/KuNynzaUN3kLd5VCI8m2zE+4GEIcpzdwoAt
         /fr5wp4LjKaRNxW6nc9V7be24RfTmU9OMZP6uqx/I/HCi02bhtQJj1lh7c3zS7/eHlgf
         +/y9NTvjtQk05kTPBmXxS8kc94cynbF46BINikizhng1hWAosaP/a7lCj4QwQ8oCEiki
         y/2fmYywc5udLJzPve/+FnXmHC12XlQ+mQfRRdbS5nFkQDovN8e0Bb8FK8tjdmBrruq8
         46QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790443288; x=1791048088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=o4J/dO5uEhtzCKEmn0df4+G49g0RyKlRso757/Wu+cF0YdL5Oe25CRLZV0p7KuiZ4+
         qCpCxSHRv2PCJH53HhAyvKHyzLJNHMiRkLS23Q+uSYxdqReFtRjz3UxRi6z3OTNvIjHY
         kjKTMe2gTnJ7u2L7TbH3DmHO7tZVtY7FVf5A1bzynm6jCVjLzbviQXvriOEfHZQoYWYK
         SCD2dwV5WCyoUjtdMhaChkagdCIgc2ARbKho7XuFVMe6pwrWNuI81fqVEtpdhaE1HDuw
         7LKNuqnMk2ifhmhF6i9/oBNYeb+wc8cntFMA7NSzBxFkN0ym+EuDpD7FUBv7+4Kf3CuL
         jwGA==
X-Forwarded-Encrypted: i=1; AKwUvBw4IVUckQ+OgxznBYZqSuzW+I1/H4UiUdGd/koVwifx2bdKpyHJ4Kh5XQ/ZxGz7CetbgYiF7X5vOkSwyX5H8MsR@lists.infradead.org
X-Gm-Message-State: AFq9FYJDlLVTQ+n7dcWwHkYiCNoGyMYOTxQu6zwYTQJd3Gh6GX5ujqlG
	kqTyOal1P3uu/ubP9pcgvf6H+d6tnSt/zkDyuyd5psJGMsLWWoB1IG+59hhLCtu4ZniNZajouYD
	3OrHftA+1Iab+vHW/vQ6LBgpapmD1JB0=
X-Gm-Gg: AYBFou1jrHznoOKX7DGQloJ/GSMJYTmKDjCwxPqX1AY8oDrrhROrfFSbbbcT64W4kgV
	vmFScUpw5GzYa2aeDZ/j/QRn0/akKAt7S72LkW1GA+YSStnuIK9QNthULENSOcM12nh3PujTSeC
	KZ9qhJL+otO/CLTj9YLNrK84dqxMlOoJciofMqxI2ZIJOz9hz/Mpcup75K4WyeDIj7MIYWd1cKN
	3zTvA927EaiAftOuEfpn6vSlmfLAgRi3YQVFRWWQGiMYZZ853VtdADxhaQEsCOuIQpTT6RG95Qz
	zir12EXgBHWDn7Y5MlxKuwSDJUiIvJ8her/Aki0ExHuBu+OQ4Wm1JUFEvi6mfUyyCmERqb1VBMS
	3rVoYw1MCcKY=
X-Received: by 2002:a05:6402:13ca:b0:6aa:13d6:888f with SMTP id
 4fb4d7f45d1cf-6aae1fa590cmr5300101a12.1.1790443287630; Sat, 26 Sep 2026
 10:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
In-Reply-To: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 27 Sep 2026 01:21:16 +0800
X-Gm-Features: AclHuK_oi-zKoshtXCuOOr3CsOX0yKq1NGgpk2U78md_ZK4k1diCt_1GHatAQ2s
Message-ID: <CAAo+4rUpf=e+rVKR4FhTOuGb+xGx+yTz7KOZbrRc29ErgznuCQ@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_102130_602221_D32360E5 
X-CRM114-Status: GOOD (  20.48  )
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

On Sun, Sep 27, 2026 at 1:10=E2=80=AFAM Nguyen Minh Tien
<tien.nguyenminh@embeddedlinux.blog> wrote:
>
> From: Chengfeng Ye <dg573847474@gmail.com>
>
> As &sdev->lock is taken by the tasklet sun6i_dma_tasklet() in softirq
> context, other users of the lock in process context should disable
> interrupts, otherwise the tasklet can preempt a holder of the lock on
> the same CPU and deadlock. sun6i_dma_terminate_all() and
> sun6i_dma_pause() take it without disabling interrupts.
>
> This was found by an experimental static analysis tool for irq-related
> deadlocks. Lockdep reports it too on an Allwinner T113, where the lock
> is also taken inside the HARDIRQ-safe vc->lock:
>
>   [  299.389380] WARNING: possible irq lock inversion dependency detected
>   [  299.411196] c7109568 (&sdc->lock){+.-.}-{3:3}, at: sun6i_dma_termina=
te_all+0x40/0x2c4
>   [  299.419137] but this lock was taken by another, HARDIRQ-safe lock in=
 the past:
>   [  299.426398]  (&vc->lock){-.-.}-{3:3}
>
> Use spin_lock_irqsave() in both places, as
> sun6i_dma_free_chan_resources() already does.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 =
DMA controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> [tien: rebased, added the lockdep report from a T113, Fixes and Cc stable=
]
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
> I ran into this on a MangoPi MQ-Dual (Allwinner T113-S3): with lockdep
> on, stopping dmatest set off the report above in
> sun6i_dma_terminate_all(), and a small test module set it off in
> sun6i_dma_pause(). While looking for a fix I found Chengfeng's v2 from
> 2023. It never got a review and no longer applies, so I rebased it on
> dmaengine next and added the lockdep report, a Fixes tag and Cc stable.
> Chengfeng, I hope you don't mind me picking it up.
>
> With it, lockdep stays quiet on both paths on 7.3-rc4, and dmatest on
> four channels passes while another channel is paused, resumed and
> terminated in a loop.


Not at all, thanks for picking this three-year-old patch up and
testing it on hardware. I=E2=80=99m glad to see the patch can move forward.

Best regards,
Chengfeng

