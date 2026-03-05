Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A2F30946
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISJ9IeJb4bdYq8e9zGFzYpxXmxiQlQWQQQm3BHAO9ac=; b=rfSqY77OEbS31O9DqoR/V0Agrx
	ROKTZHAiy7UgASf9d825qxp56804ecyrGgjyyh6ZMWiNtMXhdl64puSlSQpn7cI9kspfim1qjK79H
	YRnDnHe1McbhCV1ZzJDKV1+lshgXMDQFMupdzS4hpzWfxcKi7yaogJ9uyZtOs3N1qDwoZ3W15eSUX
	wc8gSw1mRgAjGXGfqM8SIdxmyrGY7N3mHT0LhfYq3+5PCFOWNioAAy54kON5UHb23QEXyZ2nPOM+w
	TjzN39DzUWOsQo8CJAh3EYXN7vFNXKSjSaLpBremKMI3bOoQBa2STnQKIfe8CL6otDM9wZ+NqzDjP
	ZAn+hCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Tu-00000001rJa-41Sh;
	Thu, 05 Mar 2026 13:11:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Tt-00000001rJG-1AA2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:11:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7263E61340
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 13:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B70C116C6
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Mar 2026 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772716268;
	bh=ISJ9IeJb4bdYq8e9zGFzYpxXmxiQlQWQQQm3BHAO9ac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G9tX/hM7Mw5zGuhmFHkyyRDc++MrZfNxmP/ZNpmTsla4iANpe9h6kxmyvipqjVzAz
	 Je4rF+N2HacpqEUtA56nQtcW1Htkr75+BA+vYEBrXZ0N0EhwNnymUo/bk0Yb2nmnJI
	 6At5t1N+ZbugQP602yqM+0ekCuw5r/LjlLyjizp7gjfUKgG9DbIFhqJ5snjfsbc7qL
	 tRdXzb1bCUDZ+74i3CHKIzvC2Qvcl0Pbqfwm7DRHg9NWxMR797L8CIY5ZgcM1SXhW3
	 gdQRt7gvL13nfQWGsJz8VdZ6LjcxwV1aDfNTS9fN+gdaJEhCSsx11FW798ngQVwGtG
	 1h6WZhARdxABQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a2e62b893so20924081fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:11:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtF/ol7AmsjoJuBA6RQF6VqF70lKM7lJ1jGm/TgSjbDs7VbTFNYrNvDQBFNrafoaeCi9PqsdSmbhmuEYjqAJeL@lists.infradead.org
X-Gm-Message-State: AOJu0YwuhmFXXQhsswUi7ZfzjA7/f2tR2chc7J+RCjR7qEDb24ZmznbA
	X5Es5eExPLOaEkYGxW4nKRTpf9Q65SJMmxn/IYFHtyW9z78PhOZB84TjsLIIW53JDjkailVk986
	eyCwqv1dt81SNRGaDWM2FNPv7/y7pqQoQV83LtH0f7Q==
X-Received: by 2002:a2e:22c4:0:b0:383:7f85:8eef with SMTP id
 38308e7fff4ca-38a2c7c74e6mr37197791fa.29.1772716266754; Thu, 05 Mar 2026
 05:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt> <aalwMwN3qMlzrql5@linaro.org>
In-Reply-To: <aalwMwN3qMlzrql5@linaro.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 5 Mar 2026 14:10:55 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
X-Gm-Features: AaiRm53riIL1Ev5aiOi4LeHVM1opButAi-QDELWr9rH7US3VnOIMoqa9uDUU7UY
Message-ID: <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
Subject: Re: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM
 locking and use DMA for register I/O
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Mar 5, 2026 at 1:00=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Tue, Mar 03, 2026 at 06:13:56PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> > > NOTE: Please note that even though this is version 11, I changed the
> > > prefix to RFC as this is an entirely new approach resulting from
> > > discussions under v9. I AM AWARE of the existing memory leaks in the
> > > last patch of this series - I'm sending it because I want to first
> > > discuss the approach and get a green light from Vinod as well as Mani
> > > and Bjorn. Especially when it comes to communicating the address for =
the
> > > dummy rights from the client to the BAM driver.
> > > /NOTE
> > >
> > > Currently the QCE crypto driver accesses the crypto engine registers
> > > directly via CPU. Trust Zone may perform crypto operations simultaneo=
usly
> > > resulting in a race condition. To remedy that, let's introduce suppor=
t
> > > for BAM locking/unlocking to the driver. The BAM driver will now wrap
> > > any existing issued descriptor chains with additional descriptors
> > > performing the locking when the client starts the transaction
> > > (dmaengine_issue_pending()). The client wanting to profit from lockin=
g
> > > needs to switch to performing register I/O over DMA and communicate t=
he
> > > address to which to perform the dummy writes via a call to
> > > dmaengine_slave_config().
> > >
> >
> > Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver.=
 It looks
> > neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs t=
o perform
> > a dummy write to an address in the client register space. So in this ca=
se, you
> > can also use the previous metadata approach to pass the scratchpad regi=
ster to
> > the BAM driver from clients. The BAM driver can use this register to pe=
rform
> > LOCK/UNLOCK.
> >
> > It may sound like I'm suggesting a part of your previous design, but it=
 fits the
> > design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but i=
t gets
> > the scratchpad register address from the clients through the metadata o=
nce.
> >
> > It is very unfortunate that the IP doesn't accept '0' address for LOCK/=
UNLOCK or
> > some of them cannot append LOCK/UNLOCK to the actual CMD descriptors pa=
ssed from
> > the clients. These would've made the code/design even more cleaner.
> >
>
> I was staring at the downstream drivers for QCE (qce50.c?) [1] for a bit
> and my impression is that they manage to get along without dummy writes.
> It's a big mess, but it looks like they always have some commands
> (depending on the crypto operation) that they are sending anyway and
> they just assign the LOCK/UNLOCK flag to the command descriptor of that.
>
> It is similar for the second relevant user of the LOCK/UNLOCK flags, the
> QPIC NAND driver (msm_qpic_nand.c in downstream [2], qcom_nandc.c in
> mainline), it is assigned as part of the register programming sequence
> instead of using a dummy write. In addition, the UNLOCK flag is
> sometimes assigned to a READ command descriptor rather than a WRITE.
>
> @Bartosz: Can we get by without doing any dummy writes?
> If not, would a dummy read perhaps be less intrusive than a dummy write?
>

The HPG says that the LOCK/UNLOCK flag *must* be set on a command
descriptor, not a data descriptor. For a simple encryption we will
typically have a data descriptor and a command descriptor with
register writes. So we need a command descriptor in front of the data
and - while we could technically set the UNLOCK bit on the subsequent
command descriptor - it's unclear from the HPG whether it will unlock
before or after processing the command descriptor with the UNLOCK bit
set. Hence the additional command descriptor at the end.

The HPG also only mentions a write command and says nothing about a
read. In any case: that's the least of the problems as switching to
read doesn't solve the issue of passing the address of the scratchpad
register.

So while some of this *may* just work, I would prefer to stick to what
documentation says *will* work. :)

Bartosz

