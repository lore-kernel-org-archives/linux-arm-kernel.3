Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CF9F436A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGzzQs2uZZdZYND8MnY8Zz4KYy2T9nTawA/A8pPTQ04=; b=WwwYVZtzK0peP3fjOR+o7mXMCc
	GRTRckdchBzGFFRMSPr7Wfm/ONBx1yChAkAH+FFe2aBaGL70CbpUywKC+7WUaHG1uQChRFvtkRR8H
	zpJxQJDOZpHgAvBwOdBz4MExTY8uzXdwKBH12cnTprZ7U5KWVwS15fuf9/iqxEZs9soQq5t7eTvtV
	cS+quzCGtgxo7gFmjrkIj6XImqV5QqAAbBANBZY0RltFTQ3cjauwyIb7cfdxhVK2SCn3iZYDoN2kc
	JLcSkj6Y8/08h1Z0HNwPHGIv4GCSptAZbXu0FG9lDYLudCy9zunsu2a+i04seHKSKVg+wLhJwrHFw
	t2dGY0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjzz-000000047kW-2jrz;
	Fri, 17 Apr 2026 14:16:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDjzx-000000047k5-0Jas
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:16:46 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-671d60ef9c6so967600a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 07:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776435402; cv=none;
        d=google.com; s=arc-20240605;
        b=aPgRuAYZOA/1TGx9vjItfE4Y56ZyyvU6nr5Hxa8ndbA+eGLWng0EXdwHcVMTFdJK1M
         bUbLzwWbOdXm2GrXeEr80ykgggqdmxQwWNjRxcoK7VjgFdbrVvPoybAY6+sqjPcoWFTx
         Pf4h2a31M5xaE4Y42HWQNbQSn0W+W6MeXayX/Qz3bYPjK7bp34tBcpKzSvOh0Lg2fETZ
         0/98qPLMf9V4WPIm1gVAgY5NfqmjozbYUaBGyMh1Wr3dVZUVBARk7i3dFISDqGntNr5v
         ue2fxucdZL+BXcg1cM/mYyb0zGlGz6sBbaPQiEt8Woj5KkKd6Dj/in5p+CNz2CfI3+Ob
         Ehdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UGzzQs2uZZdZYND8MnY8Zz4KYy2T9nTawA/A8pPTQ04=;
        fh=LqbfzFHYEhj6rmeyUS8UinEEdo+GmHyVTpn21SYhcv0=;
        b=QhuwS4aFd27GN1DQz9vf4EgFNfBTY6getokARVcQMpaa4CgWT9shsBmuzIBa7FU5Ce
         oCxVCedHn/QrZtC/aI+EfPi4pRM3+uu5uOKVHI5P1Hh/9Of+JoUOK43tunzsez4TQJSB
         IfF1j8/yVh3lGSX9r6H3MM+jdX3OgQ9JwL5uYIaYWBqVogEFJPVuuOnTBtl+djIlYCHb
         Dc99j5TAw2v6E3goXe/4XiBcsCxgfF/ITlafAsWv45c4Zmp74nU2Sp640kZ8jKaky9Nw
         OoTvxKiGplL77yeSlIHpvPJAVbyKe3cRqPupIUQ1ksHibVnYWWn8vVZf1IUnRUxp+vWH
         zdzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776435402; x=1777040202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGzzQs2uZZdZYND8MnY8Zz4KYy2T9nTawA/A8pPTQ04=;
        b=U6VQT7CCUhSF0OYn4Nu7cvOtXF/wHMTJEKBpxVBwBHKWBoDfy8ZL4No2i1/j4Kpr3D
         pNIlystqVqL+jKcY1x+rt3pv24NWOqTgoDLYb3rsKFQ2gseIqCtec+v+ylJy5tBVc3Zo
         WrK0/mdGVuXS8srLwTbnbS7j/NiRKnRzttQKUNIIDBImQQM7sIme4s6c4lq+yGYp79+v
         RkUBC0BUToGrFTPE1nyTyvLTgbwrmFGyoM9ubcOt5WweFjeDtsJfQRuBAWaZCYuXrk2o
         dSXbSPDut9DoTSL6pBoDHJEIqAzga3TelxusSgdBwgt9n/HEOKplK4fUDcNYpeXVbpXZ
         R7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776435402; x=1777040202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UGzzQs2uZZdZYND8MnY8Zz4KYy2T9nTawA/A8pPTQ04=;
        b=b7mI0JJK0ZHVmsBW/KLNtkp338P6IjVsxTd5bdAxmv937jRDF0GUZlUK92rjySfSs5
         JOu39Rc6yVQ1NKXOzee4jtnmsgAW9OPK5uwvPL9QDp7pXT7xUTZLUPAm1wLIwWT176MO
         H7H2CczzqGWgfjrfEaQF1BOdruA8HhiCW+BqP/1VEgrkHxNnwczNZw9FMYJBOdDD452Y
         4WfzL61NBiruBimvY78ZV+8ws2mqBAHsni16fptGUSlMXAD63Y+xc/gaf/D94fmLYZ37
         KStfS+ohHQ1xy/Bz8hAxgoQ7gFHi1F0Gzcf6AkP7Ev+66G8pQrBqn8ESnh1mTzZaw0c0
         m6DA==
X-Forwarded-Encrypted: i=1; AFNElJ9U8hmBDbI3bexYguaWy/0Vn3coaqgZtunfede0/7N9s5LsDky7Wq9PaAVW4Jeoj9g2mw0iOv3ydBh1kFCtBmIJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDVDL3rAtuPq2pjbF+yzuMFwbhY9R4ARCdnlzb1/A0QDjPHLIL
	cy9y2ePeWxwAo9asWc5Baz2PUmtzrIjy91YfDb/NXPVECSc3FdwmKeEh2aaPyGKVyD9yArd5PDY
	yUjmTvcgdNJHjQ0hr/bgOkkMVgYl35DA=
X-Gm-Gg: AeBDiesni96+SHiH3NPwHkZCWUSGOKNLc5yUUfK54HTk0TNvUEIOsC7mYBhGKgVfjET
	NV56biu6s6dy6CFiV0+wMx2DPNOKD/LA51c/d9/QHNbnrvK9nJfKKbnBInsOzctRewS/T0CMxnI
	9eN9vIqWub4Zx6Nv0adH282gE2rA/SEfLg2Sj3iXHT0hw4p4VznwXq0yz+BJ10P7Rs7N/7QxQw0
	zNuMl5U1EepFpYdjcLJUpUSuzsDW2j1BlS0SQAmRx8l0CJiUYlnzqWXzNkRKs1CY/nORreig8ei
	PehGqzmb8qBe0LuHGl/EKZrwqDFL97Mdyw==
X-Received: by 2002:a05:6402:35c6:b0:66f:9480:c1e6 with SMTP id
 4fb4d7f45d1cf-672bfed996dmr1742162a12.26.1776435401576; Fri, 17 Apr 2026
 07:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260417103004.3552500-1-puranjay@kernel.org> <0e7bf7fc588d9c45349a7b5b7b7a86504bf39069d9b7a043b53138604547f267@mail.kernel.org>
In-Reply-To: <0e7bf7fc588d9c45349a7b5b7b7a86504bf39069d9b7a043b53138604547f267@mail.kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 17 Apr 2026 15:16:27 +0100
X-Gm-Features: AQROBzAEa93FzLfWVDmPW8ghL64r6d2f8zAAX9cm4hvIEfOffFG3de6w0DRmHAA
Message-ID: <CANk7y0g9V2uK=162OMN3gwDZ1161nd+pRXZWDEt=2VOybO2M6g@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf, arm32: Reject BPF_PSEUDO_CALL in the JIT
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jre@pengutronix.de, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, 
	linux@armlinux.org.uk, kernel@pengutronix.de, martin.lau@kernel.org, 
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_071645_150457_2A315450 
X-CRM114-Status: GOOD (  11.06  )
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

On Fri, Apr 17, 2026 at 12:17=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > Fixes: 1c2a088a6626 ("bpf: x64: add JIT support for multi-function prog=
rams")
>
> Is this the correct Fixes tag? That commit only modified x64 JIT code
> and BPF core infrastructure for BPF-to-BPF calls - it never touched
> arch/arm/net/bpf_jit_32.c.
>
> The actual bug was introduced by commit 39c13c204bb1 ("arm: eBPF JIT
> compiler") from August 2017, which added the ARM32 eBPF JIT with
> BPF_CALL handling but failed to reject BPF_PSEUDO_CALL. The code has
> been incorrectly computing function addresses as 'func =3D __bpf_call_bas=
e
> + imm' for BPF_PSEUDO_CALL since the ARM32 JIT was first introduced.
>
> Suggested: Fixes: 39c13c204bb1 ("arm: eBPF JIT compiler")

I knew Claude would say this!

39c13c204bb1 ("arm: eBPF JIT compiler")  came before BPF_PSEUDO_CALL
was introduced, so the bug was introduced when jit_subprogs() was
added.
The fixes tag in the patch is correct!

