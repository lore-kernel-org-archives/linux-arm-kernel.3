Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203A0CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 07:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKWbOxAiXPYVDwgg9WjzqUlR8fPwmHv5+VQjFfr5yI0=; b=Q+riF0ovhGZTEXksiPUK2c+c3n
	oq5tq12mMyPpooJ1xSFAkZJ4d28Oyp1PPWqUXh7MCionLB1OAf4gq/hrxv4MScskpyx13u/zQ1fgo
	TRaKkwdigt7I5LfpwHsap5o0gUTX///7w1NtjvHdg1PZ3HdnsKyXgDswooycJNKT/oy3RrvsAs92T
	rep0LcQiRdLENSH8o/3B92tzy5mRBkoMc/y5xfU5lM52T0uXdp5bBFvi2Cc/Pm7DEC6ZzxB8Kt/IG
	4gjasgT3X2/h+o1sRsqbD2uWamMGqMHT+fHMhffnL9nFtlnp0XAPmM6zKx66LGRsh8Gv6ng7yc49Q
	xui7HWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLDy-0000000CdD5-2XCU;
	Mon, 11 May 2026 07:38:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLDw-0000000CdCH-05Pf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 07:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08F484439E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA62C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778485122;
	bh=oKWbOxAiXPYVDwgg9WjzqUlR8fPwmHv5+VQjFfr5yI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WjLwr3MPJNAiC9kWB+V/4OLn47GVE1CPqQa1BWWpbxKiybzSl3mJfD+9GYPdDjDQ4
	 1LDjS76dhu64DFS+BSubz3rPJRN93CMzZDp28LXdGR7jsvLmabxE7StGHBptsjHoxb
	 4WEOHj8m7sHMYyg27OKdoeqwxUk58SonMzR/Nd+Kksc/fnQ2aYgmHQkvexbFFKf+0S
	 ygFoHlwEzyS+qdVAGVDi3fPR1VSfgrV2JGKUHZj3YGIJdDiVDpf99D4Ua4p1HReohe
	 reYM+ArzQ5ChM7T0OVUm07/YbXeaMnlQ3QR3V0rDVWGH9hf2TG7RyltL5aTknwFMLS
	 t4VWRJYK+GFnA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39380e79936so50099061fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 00:38:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8PytezF/7PauipCNYcY0nTcAXqyWGGq8ejsGXzw9UuAxqoF0RojHAw3MFx9RYuok59tm3965hsUCjzpvrVP2Dx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf8ortUI2myrK1xxzBk09EE2HXkOrqJhlyFfkPV/7j0QfuarC5
	DvKRrah+d7OHw+aD3GNtsntHHvuBH9VytfRPhEhsr2QIwEtRPczvmQmOXAbx1VkibYXpjNf/8NI
	HpYb/7VAJld6sBj/yzsdF1ulpUKmx0Z+ae3kMEfVq0g==
X-Received: by 2002:a2e:9853:0:b0:38e:4810:4f36 with SMTP id
 38308e7fff4ca-393c40fd736mr63972081fa.9.1778485121444; Mon, 11 May 2026
 00:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com> <ditrkd5jcxlx7onykxh6n3qhyoclfngmpp277y4t4qwc4vswoo@5os4o5lumidn>
In-Reply-To: <ditrkd5jcxlx7onykxh6n3qhyoclfngmpp277y4t4qwc4vswoo@5os4o5lumidn>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 09:38:29 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf4q7med1_hpzFevBb8uUi_dat_Q9JD5a2ou+d+ZbgYbA@mail.gmail.com>
X-Gm-Features: AVHnY4J_9uo20Had1fL2AwvuspbaVqC_LSQpt6q0tyhkVlN13cDmk8AlgDDAB5U
Message-ID: <CAMRc=Mf4q7med1_hpzFevBb8uUi_dat_Q9JD5a2ou+d+ZbgYbA@mail.gmail.com>
Subject: Re: [PATCH v16 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_003844_097792_2E7FC1A9 
X-CRM114-Status: GOOD (  30.52  )
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

On Thu, May 7, 2026 at 11:55=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Mon, Apr 27, 2026 at 11:15:33AM +0200, Bartosz Golaszewski wrote:
> > This missed the v7.1 cycle so let's try to get it in for v7.2.
> >
> > Merging strategy: there are build-time dependencies between the crypto
> > and DMA patches so the best approach is for Vinod to create an immutabl=
e
> > branch with the DMA part pulled in by the crypto tree.
> >
> > This iteration continues to build on top of v12 but uses the BAM's NWD
> > bit on data descriptors as suggested by Stephan. To that end, there are
> > some more changes like reversing the order of command and data
> > descriptors queuedy by the QCE driver.
> >
> > Currently the QCE crypto driver accesses the crypto engine registers
> > directly via CPU. Trust Zone may perform crypto operations simultaneous=
ly
> > resulting in a race condition. To remedy that, let's introduce support
> > for BAM locking/unlocking to the driver. The BAM driver will now wrap
> > any existing issued descriptor chains with additional descriptors
> > performing the locking when the client starts the transaction
> > (dmaengine_issue_pending()). The client wanting to profit from locking
> > needs to switch to performing register I/O over DMA and communicate the
> > address to which to perform the dummy writes via a call to
> > dmaengine_desc_attach_metadata().
> >
> > In the specific case of the BAM DMA this translates to sending command
> > descriptors performing dummy writes with the relevant flags set. The BA=
M
> > will then lock all other pipes not related to the current pipe group, a=
nd
> > keep handling the current pipe only until it sees the the unlock bit.
> >
> > In order for the locking to work correctly, we also need to switch to
> > using DMA for all register I/O.
> >
> > On top of this, the series contains some additional tweaks and
> > refactoring.
> >
> > The goal of this is not to improve the performance but to prepare the
> > driver for supporting decryption into secure buffers in the future.
> >
> > Tested with tcrypt.ko, kcapi and cryptsetup.
> >
> > Shout out to Daniel and Udit from Qualcomm for helping me out with some
> > DMA issues we encountered.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> For the whole series,
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>
> Thanks for incorporating all the comments, Bart!
>
> - Mani
>

Vinod: Can you please queue patches 1-5 on an immutable branch for
v7.2 and provide it to Herbert to queue the following crypto patches?

Thanks,
Bartosz

