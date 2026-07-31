Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B05C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFkTo+n5O4m7NjE25jNyk98XEGUqbdgL1J/Xn4sF+G0=; b=u3KyeZueE22AqJpyp8IpYQrkF+
	TQrTViTj8OtU33KEF2xROMyf52zIpKrWxxdHbrE7DMKM21yf89U1857s0/P+OFbhoVlK7UHle8yGx
	pbSFfi6vH86YNAJZKeBWFRU1gX3R1dgrPR+0aqNzNyN50KanjfIa1SJ/KhXNsqHq2QQ4lq/5YYvtq
	Vns5NM2iMpdQVvrshAHX+rP2wz616QFK/nWhY796oQk3oDr51Tx4hYzI/QJxxkukI+q9Z34Yrc9BO
	C8mFpbd3a3evC35nhqwS8nUuEQiRbbw4B7SXDfoiHn1ppGRECsMkD7Cg5fBtXTdgbHOsR8Bw54ZW6
	IrxwvxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphtF-0000000BzDO-0Yv8;
	Fri, 31 Jul 2026 07:42:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphtD-0000000BzDH-1TmK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 07:42:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74A4D600AD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB241F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785483762;
	bh=wFkTo+n5O4m7NjE25jNyk98XEGUqbdgL1J/Xn4sF+G0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GPOdMUpWpRCsdYchKDzcpFf1VW/A0Io4/Vmcn+c40JGVt55/EZsuVH7fdnCEDd0mU
	 LFGvAkKLnhaG0Caa37n2ZUPgq2BKIGzpA3+PdTMWSxvGkjjBajJnWS2ho5niyhowZm
	 muR+MMM8cp/RriF5SYAFvDgcJUzBbHd4jOB479Ag99IUQ3qON1n/PyPcHwZsOGzBnt
	 kYQ2+wq5D5He/n87nFUy1bzFRvj1Z9McYTbDMgNXKMor46YZxgCLtRNLdBbcHi9Ng7
	 HzqBIcPpC6rxx86W1OP0UHLC23CsOXBxJIUUa3T8y3KxIAV8sKqLgaYbq/ASTBYm2o
	 /IQd8j7kKy25Q==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so547552e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 00:42:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQyAr6m93lIPODahLDAenjJQhOfz9fxvA5e6k4Yzsl8CZMdiE25sfEZ/1EFi1Gxi8gXqAW75XHXX6wUJCWRlcW@lists.infradead.org
X-Gm-Message-State: AOJu0YwIi7yVXwMEYs+DQOto097ySuuSinl+znOfjVuVYfRgbr82NRNk
	4qrtkbHyHDRAQsNfDECLLcP8eiiZEuFFfjNYL2txQJ07xEXlVZ2sKN4lxwvBDytZYYgqMiS/huv
	eREHtz7WtDrGs3Tv+I1c9IoMAi/NRO8okqSC1hcP06g==
X-Received: by 2002:a05:6512:1191:b0:5ae:bb19:1864 with SMTP id
 2adb3069b0e04-5b2e1fd6ad2mr298883e87.21.1785483760958; Fri, 31 Jul 2026
 00:42:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 00:42:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jul 2026 00:42:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260731050838.158825-1-ebiggers@kernel.org>
MIME-Version: 1.0
References: <20260731050838.158825-1-ebiggers@kernel.org>
Date: Fri, 31 Jul 2026 00:42:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeBzj9xqTP09rnVBQFPqSj-TDt5U8mtr8vN7NDJk-tY6A@mail.gmail.com>
X-Gm-Features: AUfX_my6wmZYiP2QRVhE1TA08-SLamheFCyXF2KVAELztKTqkEap1AuyWBDa-_w
Message-ID: <CAMRc=MeBzj9xqTP09rnVBQFPqSj-TDt5U8mtr8vN7NDJk-tY6A@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>
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

On Fri, 31 Jul 2026 07:08:38 +0200, Eric Biggers <ebiggers@kernel.org> said:
> None of the algorithms the QCE driver registers with the crypto API are
> even close to being useful.  They're massively outperformed by the
> CPU-based crypto (even actually using far more CPU cycles than the
> CPU-based crypto, due to the massive driver overhead), don't provide any
> security benefits over the CPU-based crypto, and have various other
> issues.  They're also unrelated to the Inline Crypto Engine which works
> far better and is what is actually being used these days.
>
> Due to the major performance problems people experienced when
> accidentally using this driver, the algorithms were already demoted to
> below the priority of ARMv8 CE in the crypto API several years ago.
> Regardless of priority, these algorithms also aren't compatible with the
> most common uses of in-kernel crypto; for example, they don't support
> dm-crypt because they allocate memory, and they don't support IPsec
> since they take a mutex which isn't compatible with softirq context.
>
> It's time to move on and just drop this obsolete functionality entirely.
>
> However, the driver does serve one purpose which is to bind to the
> devicetree node and allow the interconnects to scale down (though even
> that part is broken, as it holds static interconnect bandwidth votes).
>
> Thus, clear out the crypto functionality, leaving just a stub driver
> that drops the interconnection bandwidth votes to zero.
>
> Tested on the SM8650 HDK.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---

I'll be on vacation for most of August so my lack of responses won't mean I
no longer care, only that I'm disconnected. Let me just leave this here for
completness:

Nacked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I don't understand why the push to fast track the removal of this driver now,
when there's clearly an effort to get it fixed from the vendor itself. I've
also never seen a driver for an IP on a supported platform being removed from
mainline linux.

Thanks,
Bartosz

