Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07936C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aR9R9rWW9lEHBtHD1X7oe8tDfOcExVaxQWxI0iwWpw=; b=rTAZUcr1djJu/xF/dygDxcJ6+P
	jxcdjCWIN2GpMaS/ub1kguAJxQLuefz4miILtYyjbYcHZsp6CBsproUMZyU56eK4r338gSSyRGOk8
	xjelAC/DbwbpSV3ohgBE7C0Kp7jBjygNA7sCmNHA2sjICeI2uxLLWV/sEfkd1ydeyqoTqAFHPhLVy
	fMIPeGsaphfvjwVUthkKkM9Bc7a65Ln3z50p8Wl0CiDY8emAkshaXfHGsLQ+/yegTwmymY1wngjOE
	0iokMVeuZT512wjUvz4VqNpUP4cL1DLP8tIlaYT5Z2Cy6kRxFmin7PkVL5fx7Jxb7owXCIPFo//nE
	fOVzaM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnvJ-00000002Q2J-2HNh;
	Thu, 09 Jul 2026 12:32:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnvH-00000002Q2B-3v5A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90BB943B63
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 12:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7839B1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Jul 2026 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783600331;
	bh=4aR9R9rWW9lEHBtHD1X7oe8tDfOcExVaxQWxI0iwWpw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SO0DVmruKzGhRCEDUhvR08+VaUPO+EXfcFiEUq4/kCU65mP7IoJMaFZlkS29qL85z
	 jJqVr+be51s9PC+n6LxjenfQicQBWU32x3EIrjs7o/hMtZB2cOSXQFXBPVWyZA37s+
	 oKn8SU8hXX0zXwTCgFwdn7WykFJ0ofTRsbWH7aBSz65+B1qiEIpHw5b8/h2JIoeVpm
	 EORHEOYRb6ulLk49aBGhA5mNE6BpjbffZ6cO/hT199i4VW+7qhIazzFa1Qeeg5rVGs
	 0Tlrpw2m9NyIusahdzqvKHIIMwUyY5lxR3fLthjVU6h87fT5qGJS4DpYLy8E+bmBQg
	 4R7ZRsOUP/47Q==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c7895ce05so15454671fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 05:32:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoA7/xpg7XfwysME2qqLgZg1WKQ7fUn7ykurVgtc7zMgdKdAwDOSZEtMUesFi/jwPsB7TziMLClBwdIiNpeKo3c@lists.infradead.org
X-Gm-Message-State: AOJu0YxuOYcanTjOnBhTEOeRcuhGwrC6MgXI+gc7uYcS3WP/dsoVL67c
	nuzCkvdNVZYTsoVBTptQUfISsnByE2XvnTrJYp7OZGbyP67KLbjGPwVbyzdz4aw/QtS6t+vliB0
	Oye3lyOTZ06/CFSNiKqHMhSF8aWoHk8CpicXQQ6Z+rw==
X-Received: by 2002:a05:651c:a09:b0:39a:d7f7:9823 with SMTP id
 38308e7fff4ca-39c798813b4mr15252851fa.17.1783600329964; Thu, 09 Jul 2026
 05:32:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 05:32:08 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Jul 2026 05:32:08 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ak4_vsdef9MJd1Yv@linaro.org>
MIME-Version: 1.0
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
 <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com> <ak4_vsdef9MJd1Yv@linaro.org>
Date: Thu, 9 Jul 2026 05:32:08 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me93OOyk5gzqD2kSEbR=SNXbOC7azsqc14BLVirnkEmjg@mail.gmail.com>
X-Gm-Features: AVVi8Cee9x38eRLPwnHC8PzzhrHOdP202SPN2_gv8BvqViABwY4y57pWiMje_Lg
Message-ID: <CAMRc=Me93OOyk5gzqD2kSEbR=SNXbOC7azsqc14BLVirnkEmjg@mail.gmail.com>
Subject: Re: [PATCH v20 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, 
	Andy Gross <agross@codeaurora.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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

On Wed, 8 Jul 2026 14:17:51 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
> On Mon, Jun 29, 2026 at 12:01:08PM +0200, Bartosz Golaszewski wrote:
>>
>> @@ -1064,9 +1220,23 @@ static void bam_start_dma(struct bam_chan *bchan)
>>
>>  	lockdep_assert_held(&bchan->vc.lock);
>>
>> +	vd = vchan_next_desc(&bchan->vc);
>>  	if (!vd)
>>  		return;
>>
>> +	/*
>> +	 * Wrap the issued work with a LOCK/UNLOCK pair exactly once, at the
>> +	 * start of a fresh sequence and only when there is real work to lock
>> +	 * around. On a re-entry after a full FIFO, we see the BAM is locked
>> +	 * and must not add another pair we simply continue loading the
>> +	 * remainder of the same locked sequence.
>> +	 */
>> +	if (!bchan->bam_locked) {
>> +		ret = bam_setup_pipe_lock(bchan);
>> +		if (ret == 0 && bchan->bam_locked)
>> +			vd = vchan_next_desc(&bchan->vc);
>> +	}
>
> I *suspect* though that Sashiko is right about the new race condition
> here if new descriptors are queued while the hardware is busy processing
> a locked sequence.
>
> https://sashiko.dev/#/patchset/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05%40oss.qualcomm.com?part=6
>
> Any idea how to fix this?
>

We could move the bam_clocked clearing from the IRQ handler into
bam_start_dma(), right after the UNLOCK descriptor is committed to the FIFO.
Basically track the state at queue-time, not at interrupt time. Once we commit
the UNLOCK, the locked range of descriptors is "sealed". If there's more work,
we'd call bam_setup_pipe_lock() again with a new "sealed" range surrounded
by LOCK/UNLOCK.

Bart

