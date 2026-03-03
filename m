Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEFFEC1430
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y5Udud1w9el92nDGw3MAoHFspsRDspk+6XQIuYd3+8=; b=X/5OSS4lzNNbdXPJrY9QKcR/VV
	W13W7J6ZbXTpQVh5ueL+TkwySGsGqXnF5yytU1TPL1fEewYGrCJTVGJ7AyWFqq6ByI4oSomoT8edd
	E2tyifjddnOOSaNK44zvfHnoaqdkU2OwSrpDHn89/71a93vamyI6lePJy/Zhu2bk/AzQf3GOVM4W2
	7WCyEp1NpJWzF449C2lM0fX8SvaN3573QrZ881nCn81zpFoj0IPS81drO+Glab+dkfd/fBlQjnnQo
	YnxGY36cRXr+BetUs8sn0+xV7ZA2p1ZlRF/4MPOFwyBp/zp4WFElHrlsjPJqErM9j43Vv9q/5Dvq4
	brSbSCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPJH-0000000FBUS-3kEg;
	Tue, 03 Mar 2026 12:57:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPJE-0000000FBTh-3lMF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:57:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4E744452E
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Mar 2026 12:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A495C2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Mar 2026 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772542627;
	bh=2y5Udud1w9el92nDGw3MAoHFspsRDspk+6XQIuYd3+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Rh/xtQ2PfEdy9h+mFHmJQtMu9in4NIZz77vdXqFOxi2qJBdz4H/HKFOKLN4w+Bv3X
	 8mKx18Yob5aY1B3ewea3IYfRB+7cnC8rF99DsHn/8jkHZ9CUGY0in/KLfY79ubuMHZ
	 u6VKtGeCOKdSaPv0+BciddobJ1+cRxIng4YPDr2lBP7DLTQGITYLh45qQx1926uUYx
	 A4uCp/BQFfNepLtvcSv1TeIhfEG18Tqe3iV+z719ruEjW4ggTEkiiMG6txqxzAc4h4
	 lQ4joinhMpnlbuYyrZVY1P5SVn/n3xSkqSRZGoLiIX/D1bgXHx65GuF3qQF/FrdnNS
	 Uv68zIfofJ1BQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-386b553c70eso89810231fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 04:57:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdu+S8q9oY7CeQzlO4Y9jhKpa+uJ8v4zQTRMbuU+qjar8sUqG75ifnqhd3S9r6GyupYU7ZIk6+7nlMdkQ2YmAW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxswlr5wP6V/AX9Ju4YJ0Spr9fb1Rk/G8BedhMT5h126n1OpL9Z
	WTbBjkW/eErvLruXD4MczoNlRghxW1Il5WjvNwxNGvKA06xzmWlygtcwZPn1fzLh1725tx2V6uf
	ibMwzQw9pSiZLHuEk6CrGWl3CZFjqJd+M0tCgEtFguw==
X-Received: by 2002:a2e:be9b:0:b0:389:fcc6:4923 with SMTP id
 38308e7fff4ca-389ff36c676mr123347411fa.36.1772542625858; Tue, 03 Mar 2026
 04:57:05 -0800 (PST)
MIME-Version: 1.0
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com> <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
In-Reply-To: <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 3 Mar 2026 13:56:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=McCXg+YjSL2_tBW2G-oBwQn3UyLGu1HxZtrognoag_CHQ@mail.gmail.com>
X-Gm-Features: AaiRm52NOJdgTLTN2sMabKBu44N91ubF3l3v3ULSOW8VIGjX28hNaR8okhr4RNg
Message-ID: <CAMRc=McCXg+YjSL2_tBW2G-oBwQn3UyLGu1HxZtrognoag_CHQ@mail.gmail.com>
Subject: Re: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM
 locking and use DMA for register I/O
To: Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_045708_997064_2C3E3A14 
X-CRM114-Status: GOOD (  32.27  )
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

On Tue, Mar 3, 2026 at 1:44=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> > NOTE: Please note that even though this is version 11, I changed the
> > prefix to RFC as this is an entirely new approach resulting from
> > discussions under v9. I AM AWARE of the existing memory leaks in the
> > last patch of this series - I'm sending it because I want to first
> > discuss the approach and get a green light from Vinod as well as Mani
> > and Bjorn. Especially when it comes to communicating the address for th=
e
> > dummy rights from the client to the BAM driver.
> > /NOTE
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
> > dmaengine_slave_config().
> >
>
> Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver. I=
t looks
> neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs to =
perform
> a dummy write to an address in the client register space. So in this case=
, you
> can also use the previous metadata approach to pass the scratchpad regist=
er to
> the BAM driver from clients. The BAM driver can use this register to perf=
orm
> LOCK/UNLOCK.
>

I thought about reusing descriptor metadata but this is attached to
every descriptor created with dmaengine_prep_slave_sg() (as opposed to
doing it once with dmaengine_slave_config()). We would also still need
a custom struct in the existing BAM DMA header.

I'm fine with that. Vinod: could you please say if that's sound for
you and if so - I'll rework it and also fix the memory leaks by
reworking the cleanup path.

> It may sound like I'm suggesting a part of your previous design, but it f=
its the
> design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but it =
gets
> the scratchpad register address from the clients through the metadata onc=
e.
>

If that gets it upstream, then it's fine with me.

> It is very unfortunate that the IP doesn't accept '0' address for LOCK/UN=
LOCK or
> some of them cannot append LOCK/UNLOCK to the actual CMD descriptors pass=
ed from
> the clients. These would've made the code/design even more cleaner.
>

For sure but I double-checked this. :(

Bart

