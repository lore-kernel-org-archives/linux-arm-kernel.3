Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC84CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuV33l73kgCfxMXZpX+G6jMpAhtpEBO72ZuYilyuWkY=; b=a4IzGMux/aV3+h+yB3D4rPKy+i
	X3110Nmea5pRN5agkZNf9X6aPGrECUD/GR1RAz67ufg9TKaFWgs0uJLvXXlaDvLNFXX5e6sxLNyMk
	OqhMPsU1D+w5PsFHeD1jlQPfcCAx1IWcWbmBasEnZO3BtiFaBbrKVquK1aMFKhkxPCPfocAnbhEFF
	0Xz1NfD1Wsrdebqax8eTQk12DDOCPlAqQGWrEuFwlY+seINSpCtgX9QxrimFfcor89cn/JZGbcmki
	Z4zlwmCOTUu0d2pm1gG1UOM3ay2yeq9I+M0tSOjx7LGwwZgk8zMv3fZvRvKPbxxf2588nQtVYsEip
	LXzYc5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBJU-000000080qk-0cjH;
	Thu, 01 Oct 2026 07:34:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBJS-000000080qa-37AN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:34:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8138A4478E
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F6C1F00900
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790840082;
	bh=kuV33l73kgCfxMXZpX+G6jMpAhtpEBO72ZuYilyuWkY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=QfyM4xSRlKStaeo/bShD69v/jI3OoLIt9RIlKAxFj08Dl+wLGEQBSqAvQhCoRjKGk
	 LoKxGHq+CxrS9V2uPd4C5LVxuMTeyD/4DL9PTaaXXBcaF2qhNh1u33Mb0Tmft89/y4
	 JK540dc3kMHcoBdpmpzys4aF4Nkaa0kf2vhA6a8+g5l0P2qVUnQsbNT5YoHFfupbRo
	 3LUkl77zt0THmf0rxul77MMD9Mzv5USAhLR7J4SHkujvTjrVFs1pOrtS9bS9hk3jHW
	 gyZ/cyJI1HqruFwWPwC6FAOzyMxVeGrl5UkQeiFG5RTWufhU4paN7KN7JEuBJimpfG
	 4GtqckmA4KRMQ==
Received: by mail-lr2-f27.google.com with SMTP id 38308e7fff4ca-3a76a5a5d4cso21075531fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByyEmasOuD9B86OhI62xMeZDC73Fv0dsKDFSuGi1HzbEc57QJ/z/Nl6svWii6BEYmmJJYtV12KwJRNcDlAM6ulN@lists.infradead.org
X-Gm-Message-State: AFq9FYI+ugPFbRACDxyEy40sdDPNGen9yesrhoZFOCVtJpiS3+be24N+
	HZmx93FECJUuwdCB9fF7D0YJyMswPsd59oEB+dDvoVy4w6f6FlMCD3uNkaOSWY4kbFEd3izsy9r
	bU3+0WQCGDTmrEEs7M1ty9dQ55n+jvzrtq+BVv1Dqww==
X-Received: by 2002:a2e:b8ce:0:b0:3a6:6aad:be45 with SMTP id
 38308e7fff4ca-3a779206b12mr11576161fa.10.1790840081040; Thu, 01 Oct 2026
 00:34:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:34:39 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:34:39 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com> <20260723-qcom-qce-cmd-descr-v24-1-4f87bb4d9938@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:34:39 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mc9O-wgeWGNgEW45p5YumdkBwKf7_Zkrgw1=r3Pn8QTPQ@mail.gmail.com>
X-Gm-Features: AclHuK9Cfoeox9K-SbC3OnT5eZecFWUtZX-vzEsZcBWrrPHwk34664gyCfLJNQY
Message-ID: <CAMRc=Mc9O-wgeWGNgEW45p5YumdkBwKf7_Zkrgw1=r3Pn8QTPQ@mail.gmail.com>
Subject: Re: [PATCH v24 01/14] dmaengine: constify struct dma_descriptor_metadata_ops
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Vinod Koul <vkoul@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>
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

On Thu, 23 Jul 2026 19:09:07 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> There's no reason for the instances of this struct to be modifiable.
> Constify the pointer in struct dma_async_tx_descriptor and all drivers
> currently using it.
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Vinod: this patch is independent from the rest of the series and the BAM DMA
rework. Could youtake it for v7.4 as I won't respin the rest of the series
before we get the QCE fixes in anyway?

Bart

