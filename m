Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFB9CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AP/U3cPeU0fXOEAiHxHazm6k88v5P4k80O8mHj3UmM=; b=Au0Xh2WbhnVDw0ZWK3AhFVqKri
	JSHTx/oqewyu4ZxwpAVLxLIr0uwfMeUBly1UkruonQAcoclY5yoBbs8YC+/IQvb6ZuI2HjERaOYeP
	Cle9sNyMHqq+YbE6CM1fMDeKUelT9kzPeAgyaDaRlbf4i9Rx3LUUxKogENGXHzK28aGWRcy3Yz8DO
	FyN8F9aqbfekO3bB0lHpiIjBbXJI22WwpPfS8BCOrKMCD/hGK1eRO3+024CrSRD8wip59iR29Oaea
	URaffWqp/0Cc3eFrhqysLX8qGB/bPpdh/sXIuBPkYHOxGYR/qkmHD2fGgztD502BAw2Tn4p87gVxs
	yvJhZgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6b7-0000000GfRd-1vNM;
	Thu, 04 Jun 2026 11:50:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6b5-0000000GfRV-3cyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 11:50:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 450C844626
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Jun 2026 11:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0071F00899
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Jun 2026 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780573851;
	bh=+AP/U3cPeU0fXOEAiHxHazm6k88v5P4k80O8mHj3UmM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gTa53yJV3FNKREqub3QPIdJdIBpiqctfla9UV9JKkXPKWxEGfDkIQGwtIbrwOVEqN
	 6WUPv32i6BvWBnugDJsvR0knou13vTeL+0tk6S2on+t5TVox8/U7gzRhhksbVI+CDS
	 DXBwwMvHmfdHMs3AaYmyrqMsscl1JRvo17pC0WJN7BTevi805aE/nsJ8ZlPQFMdpmu
	 szHsdO6T4b5MpCHi7GvCmN6haPkT45wpzJs9dJIjcgyWtCVlm3ZSPES/ITluPyJx6m
	 J4vpo+0RaYOmuw8lJTYIaqn0csIPQUuyzgt8xlbtd+n+faRoZB1D+erw6WnEMC3FTC
	 6D5/6Dz4A+9+w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39666ac91a2so17705681fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 04:50:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/xnQmyJM7LPYw9a40QZdhCOHhmB15nd2izLpbDRU9Y1sv9H4n6vyJ59bzoD8zC1chulcf7gFwFSepthpziMzCC@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/s5IINjEyfERgSb9hAcsy8qRwTKzhpYIoY3MBmp9CcUbpbIZ
	ulW4kehLZryzkRuykOeO0L74FzpbWhaiQhhv58q83qtZcQqaGPOIuVA0qzTdk8Oc6moSPrht+qk
	TZQFUQU+fwoZ+vaVwfCgpe11ZyJd7PiJhXonD7fY7zw==
X-Received: by 2002:a05:651c:242:b0:38b:dd55:b71 with SMTP id
 38308e7fff4ca-396bbb2b99dmr9083771fa.20.1780573849639; Thu, 04 Jun 2026
 04:50:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 04:50:48 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 04:50:48 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aiFScCW_NEY3CsEf@vaman>
MIME-Version: 1.0
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
 <ah8G_ajPS1KhgPP_@linaro.org> <aiFScCW_NEY3CsEf@vaman>
Date: Thu, 4 Jun 2026 04:50:48 -0700
X-Gmail-Original-Message-ID: <CAMRc=McYB+S1LmqRJbWKirMGqwJHZCTWj6KnB6Z8qUsYQWBqkw@mail.gmail.com>
X-Gm-Features: AVHnY4ItlnHzBWkZf26uoYFprN5coNBr4vZZe2XdpgFnq6HAZyN9LACZLu6Trcg
Message-ID: <CAMRc=McYB+S1LmqRJbWKirMGqwJHZCTWj6KnB6Z8qUsYQWBqkw@mail.gmail.com>
Subject: Re: [PATCH v19 00/14] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
To: Vinod Koul <vkoul@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Md Sadre Alam <mdalam@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
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

On Thu, 4 Jun 2026 12:24:48 +0200, Vinod Koul <vkoul@kernel.org> said:
> On 02-06-26, 18:38, Stephan Gerhold wrote:
>> On Tue, May 26, 2026 at 03:10:48PM +0200, Bartosz Golaszewski wrote:
>> > I feel like I fell into the trap of trying to address pre-existing
>> > issues reported by sashiko and in the process provoking more reports so
>> > let this be the last iteration where I do this. Vinod can we get this
>> > queued for v7.2 now and iron out any previously existing problems in
>> > tree?
>>
>> Thanks a lot for working on fixing all these issues!
>>
>> I agree there is no point addressing all the "pre-existing issues"
>> pointed out by Sashiko, but have you looked through the other comments
>> for new issues pointed out for your patches?
>
> I hope Bart and Qualcomm can fix these driver issues as well
>>
>> Out of curiosity, I was looking a bit at the comments for [PATCH v19
>> 06/14] dmaengine: qcom: bam_dma: add support for BAM locking [1]. There
>> are 8 open comments there (Critical: 1, High: 6 and Medium: 1). From a
>> quick look I would say most of these could be valid. The critical one
>> about the usage of dma_cookie_assign() sounds a bit concerning to me, if
>> it is true we would be basically breaking parts of the dmaengine API for
>> consumers by inserting the lock descriptor in front of everything else.
>
> Yes this seems to be a valid one. Attaching another descriptor for lock
> does not sound right to me, as in this case causes descriptor to be
> marked 'done' prematurely.
>

Yes, I have a fix for this queued.

> Honestly, I am not quite happy with the way lock is being handled here.
> I would hope we can have some better suggestions. Adding a descriptor
> for lock does not look right to me. We are adding odd hardware/firmware
> behaviour on engine apis.
>
> I had earlier suggested to lock always or lock only for hw/sw versions
> supported inside the driver, that might be simplist solution without the
> complexity added here
>

I'm not sure what you mean here. Several iterations ago it was deferred to
consumer drivers. Mani objected and Bjorn and you agreed. I reworked it to move
the locking logic into the DMA driver as requested.

Bart

