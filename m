Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9881FFF4956
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lD2Z6zQIgevKi2IqTHqInMxXV0jeIeXVIIwGCfGmDSU=; b=Shn5fMNprXkhurk8lFaP7yFd+S
	WYqsY4jqj8XSao+cI1Ex5T9SsMv0F8LJFASnh+92h2x7EwZGvODjVsUlZOop0GEQ/rGODF8hoXNkD
	J3GklxbOeRAqAAX5lh8xEO6i0IIM4CDijI56VLzOzVWitb5Dw/1JjHA5e3C+MtSCuKQo3HoZkiQRn
	4WORKAoC1Legfce5CxDqfVhdSEicW/pfX2gxGaUSS8wZB7iF1HeM9SYhwYM5wTdJYWZ5mwU6QjM2N
	V4SGAoey3LeHrqwZWWQAgbJ/LTPyAGhcJxahwhxDXnW6V4XHG2p1MKI37YDm9CrS3BySslUiNdJ02
	IbZ68ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Mv-0000000AmoM-2oSI;
	Mon, 30 Mar 2026 07:49:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Ms-0000000Amnz-3fPn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77B1844523
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E29C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774856940;
	bh=lD2Z6zQIgevKi2IqTHqInMxXV0jeIeXVIIwGCfGmDSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kf+NQfW6DdHb+ZdGOOxI66nekPvZ1tzokGCWXtUurIGyRdYRJL1CKQkzf5u3ByNwV
	 ANh/jdCwHDpbELE6GzHv0jIG4u0x4pi5ZHEVM9L5lu/A4ijVABN5c2iYxLdGBqSQ4u
	 Qrz5RiC2/+/hdjDDWIiWDjmb6ADBS0V2gFjbCU8Ur4QY9FLtJl5Cyo7dn5UQ3WOSfa
	 9cRNCj3T4O9BsG1Pm6RgTACFucHUzU89MMsde5HgzDACeDjpY3PD0u5dYw2eCL9EFA
	 fmMGrO59NYDrNhHRlxhXgqbxsTsDuwhQiaIyczRh0cQHsHi6PX7e2xN+h4recSULVJ
	 nwJC44BpFaE3Q==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38b3ee785a5so34714041fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 00:49:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWlHCqTXJKqeVkqI5RrwxVtRV3PbaVL/2OnjKJJ3Yh/qtUuMWVwRgYTb4t4WKCboHOm7RAhN2eMrOP1D0r3dii@lists.infradead.org
X-Gm-Message-State: AOJu0YxfSUYHMrACUNnUCaf3ZfpnCtPS5ZVnx1Mhz/5k6GVbZnYFKmsP
	6nFZMJAd+DQ4QBjF8H0GDg/m3nRIWYXmpznQZb41/nXZTxGgI8lABokL6uX3loHo1P4ekdnOkfM
	JpZgfina7aIJgg3Oc/kYvBZNQG4xoGJQzhblkPNokZQ==
X-Received: by 2002:a2e:8a87:0:b0:38b:f838:dcd0 with SMTP id
 38308e7fff4ca-38c756d2050mr31367251fa.3.1774856938701; Mon, 30 Mar 2026
 00:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 30 Mar 2026 09:48:47 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mek-OrzG5B6cJnz0ZVRn1paUYVdgf67LAJC_GKCzfU6qg@mail.gmail.com>
X-Gm-Features: AQROBzDctCw49nI4ZpKxOYPIv3NwI9Us8xjc3cHh8fG92eva9b9SctdyfBh_Ryc
Message-ID: <CAMRc=Mek-OrzG5B6cJnz0ZVRn1paUYVdgf67LAJC_GKCzfU6qg@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_004902_955097_7315F69D 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, Mar 23, 2026 at 4:17=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This iteration is quite similar to v12 but uses the BAM's NWD bit on
> data descriptors as suggested by Stephan. To that end, there are some
> more changes like reversing the order of command and data descriptors
> queuedy by the QCE driver.
>
> Currently the QCE crypto driver accesses the crypto engine registers
> directly via CPU. Trust Zone may perform crypto operations simultaneously
> resulting in a race condition. To remedy that, let's introduce support
> for BAM locking/unlocking to the driver. The BAM driver will now wrap
> any existing issued descriptor chains with additional descriptors
> performing the locking when the client starts the transaction
> (dmaengine_issue_pending()). The client wanting to profit from locking
> needs to switch to performing register I/O over DMA and communicate the
> address to which to perform the dummy writes via a call to
> dmaengine_desc_attach_metadata().
>
> In the specific case of the BAM DMA this translates to sending command
> descriptors performing dummy writes with the relevant flags set. The BAM
> will then lock all other pipes not related to the current pipe group, and
> keep handling the current pipe only until it sees the the unlock bit.
>

Hi Vinod et al!

Any chance of this making v7.1? Stephan, Mani: any objections to the
current approach?

Bart

