Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2B0FF886C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 22:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Cyj2TV01gDjGv2Qg+a8xU+h37PniT2qMjOcQZGYusE=; b=nkAyS5C14bz7k86xYp/biWqjqQ
	3zVOBrNPmuwfBe9YrsUJyGW1S2+dvg83dafGvvku0oI7ter6nRXbTd2T4DoohgFvM8rtf/6NFOWyu
	FFIpkODnLGBqXJI75SAspaBeYQ3pER1tqeXT/EL0KHIx98xjgRV6j7jxa6A14YzT34ak/CRcoMKpE
	mOLGUdhelJzDAChTrZL/gTiu9LyVUBqK6pcvxwNcs92MZtDLL6CTGDRIEBF2Loz/GvI7s+vnXxZ0n
	mqZB+HeSEA5EH4q/bwdxghF8vvhhetNxi2dnKJMvX/rC4FbDvrhZZYLJhoOzWzVr7iXQb0ljqJjs7
	UyIXHMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHr3Y-00000002ZgS-34EX;
	Tue, 28 Apr 2026 22:37:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHr3W-00000002Zfh-00Zt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 22:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0BD3C40A1F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 22:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E206FC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777415844;
	bh=Y5K9w/dAWAPxr/f/0fJNiVHGZlLP5vvzBFKMA1ar/TM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bfTQ+HXhoQZyBuQUpX1wqfOxOhp+HZM7k5crduptcGxm5s2Sa27/SlOtYuOOnZMay
	 HPCjZkxjdqmNTm0yYsLBOAtYzZZRxkJD+vvcxaRy9VUqjkD1KWOlKZn+wnFBvd2mTj
	 v6Py1rthsHuqc1/ByyGCOzCnnmfUw2T0II6YUBSAoJwZ7xoO8/oRoO0DKASYoDMlKc
	 mQwuMh0QkzzRcA3tnXaggX2OCntOF1+gHObgMsG1NOhEEJE4MleQ4p+uU1vWZmizvx
	 /vg+jc1uhx+h+WylCZLvFrfgEoDak0lnHKw+hEynBwsfGdrDIFBn1uyVgcLtUtmsRh
	 mA2UZSGLDQdeg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3922b35e69cso29346891fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 15:37:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IOVWUExhC7k1QI1mIo8FM1jxeFPBYZ2oSC0t2sAwbCsZnV17hTrJO/wQSyo7AV4xIiolGMFjyIqVx3pSQOhgk@lists.infradead.org
X-Gm-Message-State: AOJu0YxqLfaZN052e2TtcGiyI5+hAZLRs9M1HdFpVI35vjEBwSOdeKvU
	is6dRMH2NE+JVK3g6WQR1l+ByAZU7ESZl+q5/rFDXHdVNjkhDACF89c5zKt0UnnDbfojKq7tc+G
	bAM2T/rdzl0Ms53PqYJvZ1Q4cB8NLTPs=
X-Received: by 2002:a05:6512:39cc:b0:5a2:b0ba:7169 with SMTP id
 2adb3069b0e04-5a74661b75fmr2060251e87.38.1777415843678; Tue, 28 Apr 2026
 15:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
 <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com> <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
In-Reply-To: <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 29 Apr 2026 00:37:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkT+P4=uU2s20_iRJ4URYxUTodT=10FaqBnbv4nQChdUA@mail.gmail.com>
X-Gm-Features: AVHnY4JWtwnhp2akHdjilA7irIIkpOgifByCgOYtH_Pc8x94YSONShmddM6F4S0
Message-ID: <CAD++jLkT+P4=uU2s20_iRJ4URYxUTodT=10FaqBnbv4nQChdUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_153726_082976_1DDEA41F 
X-CRM114-Status: GOOD (  18.33  )
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

On Tue, Apr 28, 2026 at 6:28=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 28/04/2026 14:06, Krzysztof Kozlowski wrote:
> > On 27/04/2026 22:18, Linus Walleij wrote:
> >>>
> >>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bi=
t
> >>>    platforms, which are already enabled on qcom_defconfig.
> >>>
> >>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm6=
4
> >>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
> >>>    time and feels logical, because if one selects ARCH_QCOM then
> >>>    probably by default wants to build test it entirely.  Kernels with
> >>>    COMPILE_TEST are not supposed to be used for booting.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> >>
> >> Way better like this.
> >> Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > I think this should rather go through your tree, because new drivers ar=
e
> > coming and some other changes from me might be touching similar lines.
> > Well, defconfig also might be changed in parallel, so obviously someone
> > will need to handle conflicts.
>
> I'll rebase on recent patches you applied.

OK then, let's try that! Maybe I should just split out all the early Qualco=
mm
stuff we merged into an immutable branch if something starts to cobble
up later?

Yours,
Linus Walleij

