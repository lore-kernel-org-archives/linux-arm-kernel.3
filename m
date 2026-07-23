Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6ADC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2EBRvjl4THMhyqlpfuX6DTQgfmPpqpfKHZum4qGV80=; b=Pr0Uexx/BqeBbDQzNOp2yebWdg
	CXl27sKa+SwiRIKu9OmVgn07/IQRFFT9aiX3/rZG8MSqAXxLqyfDnPabJTVi9ke9SbtSrLOD8fKgB
	+F9HoptLGixE4PztGpXHXYTNRMPF9nVZwi3ftvnWUTtjg0lvImJuHbRp5YRKnqVl6Tu33QSiceJAi
	bjmmD09Iu3qE9X0ZheGSnkgA8sBd9jndnv06AXdSDJ/ZuuwkLwOWBnfKId8yTSwT6rPU4OtCtcOrB
	CADwfx4QAVHkDEYOEya2m3SaKEM9PR276gc3k6s0Fs6YbGwKdNa2WS7ktqM+pJ5EObRgy9VSiybkF
	sRXoWVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp2N-0000000Dlwl-26GL;
	Thu, 23 Jul 2026 08:44:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmp2M-0000000Dlwd-2yhZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 08:44:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48B6043B57
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4631F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784796254;
	bh=j2EBRvjl4THMhyqlpfuX6DTQgfmPpqpfKHZum4qGV80=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AF2H0Ivxkn/L+1ybDUv7MML9W8QcujyElf5e09Llo5YxQnfu0FoCb4rraYIwSyDc0
	 6hAu+dnmkpUdotPlZZOSTDSqKzcBNXcC2XIO2yIgM7AY5CxgHlIHocSq6g8HG++9pB
	 CPIFVh5yWFVkD2B7kmcEEHexB66hXrb/YY5UH8GbvdUpbJ808i/E4J4eth7FhmyRCC
	 y0pJA6iayLWo1+s/q9goJvyQIqNIvLbGgFBvoMnH+em4qvTH4STv32eYposTC0W3Xx
	 keUGtzAPyjXYiGAUYkS09WK4pj6KL4UCjiETehDL5poDC2+GfrmbZIltkjxcCtBmjM
	 y++nxkZeL+W5w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c74c469e8so2552201fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 01:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZ5ZJCSv4fcx1uZefYxAOb+lJEBIDItGavzXdZms5lU40Z6Yl9DfBQsxFSmfONHQImKrndEa3zMxSUhUsu5IIC@lists.infradead.org
X-Gm-Message-State: AOJu0YyHhJxDEas3H8aesfM1RGhb19foTyBcWXslMpmpLw3G4g961Ddy
	o8pCSzpIPaHzTjzXN/w2oH/M1qmb6FgOdpil6i8/ofqf0GaYk0cRlze6ITUWyoCuzV9KLvlzx4t
	J2c4LdOCcl3nRYN/FL0NsnS6dnW9qcR4e9bPI1qZWHQ==
X-Received: by 2002:a2e:b8d5:0:b0:39c:8124:93b3 with SMTP id
 38308e7fff4ca-39f07bcfce0mr4681721fa.9.1784796246084; Thu, 23 Jul 2026
 01:44:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 01:44:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 01:44:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <amDuqoRBg5qGafi2@linaro.org>
MIME-Version: 1.0
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org> <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
 <amC7_M-HjVZ3sQuT@linaro.org> <CAMRc=MdnSyPmbK0skMx686=wSe52nnuWgCNJ0uSoKs_=HyAq-Q@mail.gmail.com>
 <amDRxPkdvbA-iVer@linaro.org> <CAMRc=Me523xQbfJvML9taJ-fR128SJurJS4eX9N9E9WtHF5W5Q@mail.gmail.com>
 <amDuqoRBg5qGafi2@linaro.org>
Date: Thu, 23 Jul 2026 01:44:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=McJBVkCT+rFToY-Sn+nrLy-Sb8otz1NYWkQj1J-4-RK-A@mail.gmail.com>
X-Gm-Features: AUfX_mwJQKKrlt_uOHiEXNJho9ROwjpR_PSftHZZM5GhDPu9qwbx9QpVEO72mS0
Message-ID: <CAMRc=McJBVkCT+rFToY-Sn+nrLy-Sb8otz1NYWkQj1J-4-RK-A@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sashiko-reviews@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
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

On Wed, 22 Jul 2026 18:24:10 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
>
> FWIW, I couldn't stop myself trying to finish my "write lock descriptors
> directly into FIFO" idea, once I started I was curious how it would turn
> out. I think it's actually quite elegant, the loop in bam_start_dma() is
> wrapped with LOCK and UNLOCK, later process_channel_irqs() looks at the
> FIFO again and just skips over these descriptors. lock_ce is allocated
> once at channel creation time, no other allocations are needed. (Could
> probably move lock_ce allocation to slave_config() so it's allocated
> only when locking is configured for a channel).
>
> See diff below. It doesn't crash badly in a quick test, but didn't check
> in detail if the locking is actually working correctly. :')
>
> I'm okay with whatever is "free of known races" and works with the use
> cases we have, so use/adapt whatever you like best.
>
> If you want to use this, feel free to add
> Co-developed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>
> Good luck! :D
>

Oh, neat! Thanks, I may use some of that. And that makes you have a stake in
this series now. :)

Bartosz

