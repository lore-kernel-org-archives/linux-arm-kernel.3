Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF5CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/T/RdXiN7bhTsikP7tDXhBU6HaNdabK8ZTbQ4skuK0=; b=dmfiflX5Hynwr4eFpE4Vh9UOYn
	lPVvKDGIafOfUv5XPTKkXMNDUO4MoH38hSLWap/rXdll/ZLJ9VMxz0oWjttnWushnoioOZfucpefa
	LH/uBRBQv+RcA725A7q9HPsCnnGcQdOWHrjUULDxsE3raDGET/O8ih9k8Bb9hQdHYYgZwhemMwQh9
	VivSsUpN6IMAfYt/fr9zsOSjmNqsUJvnhMMFV9WL4iQ7MP1wQhyFoDX5pzsOXRJOgNkfWZ/0wmkde
	xOoszi3caAtB2HkTY2mp1MnF5GoGdnSlNXqNC65yvFwYbFvEskWl13pEdE6ehmn3+N0RL900W/DQM
	q6CIzJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTj0v-00000009kYJ-1sFo;
	Sun, 31 May 2026 16:27:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTj0t-00000009kXx-1VQM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 16:27:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B91040A28
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157121F008A0
	for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780244866;
	bh=b/T/RdXiN7bhTsikP7tDXhBU6HaNdabK8ZTbQ4skuK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Vbou+zIiA3Mr4kpYeiYJTqi2gIfmOZkK11YoGOHJXJolFeVAEfBS1YmHpT2wbl7E4
	 1TtFyx5TF2YuygGadxrQcJ1BbSDjThQNgIQTDV+k7mbJnCEVnmCp/WdYdPgTqysu3r
	 iMc/SXEPVkZBePzOusjof6PMTt34N5mN/BWjlITLi6GWFVDZrYjjZMV3nyOz0eZh0H
	 nSY9BsHNYDHM9flWN3Wyu66qytrnINpASR4KeaMgIHf179bUlLCtBEgwXjc2B1+jsG
	 pI0eIsJ5J4yCzh+imQOSoXBDCyq6QOJRceCoO6RwRvc+V1+Aw4d5g0j4MWmuAfjJGI
	 iJoGujrTk1fCg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa66893e9fso712198e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 09:27:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8oyep3TH8BTnBfBb4QWgBrMrMvu+YlzuYYvvbr4E1f24s5jiCVoQHsai93Yl3TCudXw4Vd9TD5xwZ2tQn2ml9E@lists.infradead.org
X-Gm-Message-State: AOJu0YzdDL6OQKhFrpuFboRwnYh9ujWUvv0PJGlcxoeopj37S9AkiQy2
	42SkX6gYZYRfZjJAC06RE88GeAWUNo8ThTzgLASk9JeTAAUBvKq0SfmhCV8HakKcnytAGfrsqSH
	6Eb1qpGfdwpcYvfEWrPlbhpGZRQwMdIh698p+W15S2A==
X-Received: by 2002:a05:6512:800d:10b0:5a8:fca6:a537 with SMTP id
 2adb3069b0e04-5aa608ff3d8mr1341020e87.22.1780244864645; Sun, 31 May 2026
 09:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com> <20260529162251.GB2706@sol>
In-Reply-To: <20260529162251.GB2706@sol>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Sun, 31 May 2026 18:27:32 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdJ5GN_Lbi9PeCoW=fNnjCz-WAq66TSa8f=fZGOHFZ41Q@mail.gmail.com>
X-Gm-Features: AVHnY4KA4mut6jG-LIp_D5JMZD7phc05G5rBuCgHgHRyzFVSAKUzF_CQJazrdyg
Message-ID: <CAMRc=MdJ5GN_Lbi9PeCoW=fNnjCz-WAq66TSa8f=fZGOHFZ41Q@mail.gmail.com>
Subject: Re: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_092747_442301_771922AE 
X-CRM114-Status: GOOD (  37.55  )
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

On Fri, May 29, 2026 at 6:24=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, May 26, 2026 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
> > I feel like I fell into the trap of trying to address pre-existing
> > issues reported by sashiko and in the process provoking more reports so
> > let this be the last iteration where I do this. Vinod can we get this
> > queued for v7.2 now and iron out any previously existing problems in
> > tree?
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
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> None of these fixes are Cc'ed to stable, so stable kernels will remain
> vulnerable to these race conditions.
>
> Shouldn't this be preceded by a patch, Cc'ed to stable, that marks the
> driver as BROKEN?  As discussed in the other thread
> (https://lore.kernel.org/linux-crypto/20260515-shikra_qcrypto-v1-0-80f07b=
345c29@oss.qualcomm.com/T/#u),
> none of the current functionality of this driver is actually useful in
> Linux.  It's just been causing problems.
>

I don't believe any of it should be backported. This is not a
regression, multiple EEs were never supported, so it's a new feature.
Also: backporting of over 500 diff lines across two subsystems doesn't
sound like a good idea to me.

On the other hand, if marking the driver as BROKEN for the time being
allows for a faster pace of queuing any changes to it, then I'm for
it. Let's unmark it once we fix it.

Bart

