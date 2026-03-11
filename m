Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78FA104BECD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sd3DFFzURvrRtd/uLu+kEZf7PaltRkI1mM6rMDox2Uw=; b=QFeDnOgzK1k5i8dugnwfIeZgKv
	wtLQxVXdcuNNeUHloEh2uA/hxtoQPvFeuLmN9eLNN8ACscT60oKTKMfjwG4DtF5QAubz2+SwDSwOz
	NY2CywybHq7XxK+OnXTpwBexbPRmddVWfIqcJ6Gy+sDObsfxfB6emCJc6dwgPwOgaOpBHtRMfNTA8
	HMhfeGZwFhLDHdqRaJVcUmvJgQxLr8hWOmKBjihzXKX6tNdmUwUmnJwtuQg6XQHi6Fqe8i1dpSGeO
	qdWYy/zVNvErPD6bagVW/SOzCxVaESfePgK37Y7Pt8863m2+SzlrRXWf4FvmTSF/y8P5IlaWGThzv
	nLW8hSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Grs-0000000BRIf-3k2m;
	Wed, 11 Mar 2026 10:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Grq-0000000BRIL-1i2T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BAF144538
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C71DC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773225161;
	bh=RSDSTK7sEaAY8nIinSnQhpMyoUW6LnkFogAohb6WbUY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=svl1za/vttGiJkEjbioKb3KXiQ//LSe5/R5KHO8HDCqwXHmXa5S1bUBWInJRchJtE
	 toqz+x46XqtQBPPAKJZsmmBfwtFTkyjvdBDg7U35+slG/MAfya08BzK0Cjkv1eV9sN
	 scWq5Xg5pWdVGgYj7UfDjEbN7Bzki6PWUpQhUwIRt4cBi8c5ONSsmUl/lE3pdAjJNT
	 QCJrBfHJjB2+Fmg0P1jz89lU1ORKeV/9aZOUztobSRxVdEWosp0wEM9W/sD5rryvB4
	 MIBGTutUMv3ARaQbl3/22HVx90lhdCihEt+B3IeIjTwYsUlHR6mWouIjMPEcWJviZ8
	 ixpZCbJFDqK7g==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a3fd333eeso6936371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:32:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/YypuPJmMemOOfD0lrVzalJ3ytc0DymgP1pvHhe1KAR79p1imFFXIFGmip9u96MAPYzxW1dbbIpKn2w/LBszc@lists.infradead.org
X-Gm-Message-State: AOJu0YyGvfIVEvJXIOQ/QS1wbmoiVTI/cNWxib3s2YQ5mm3M7BVm0j96
	lx0U5zBJJ1ifYHAKU+V/q+mkE0qxExYGnZfPvTEfFCYJdmMUKe+0GT7cElLk740LCuuIj5a0mXh
	mu5YWvgsuW1zktTlLhDWP9PyvCqJyLZi8Ya1EsQKZtQ==
X-Received: by 2002:a05:651c:19a9:b0:387:14c6:53e3 with SMTP id
 38308e7fff4ca-38a67ea3ad5mr7169861fa.0.1773225159634; Wed, 11 Mar 2026
 03:32:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 03:32:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Mar 2026 03:32:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <abE9RQfGN6Ycns1B@linaro.org>
MIME-Version: 1.0
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-5-398f37f26ef0@oss.qualcomm.com> <abE9RQfGN6Ycns1B@linaro.org>
Date: Wed, 11 Mar 2026 03:32:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeSfFyVYSJHzHvuynRR3TWRz04tyiOy1JvqyHP0aQKPOA@mail.gmail.com>
X-Gm-Features: AaiRm508xMUuB-wSkC9iLovtxoWoaeYCiA8Dr5gqw5VbtTTRXMZ5IKSgQiGjyZY
Message-ID: <CAMRc=MeSfFyVYSJHzHvuynRR3TWRz04tyiOy1JvqyHP0aQKPOA@mail.gmail.com>
Subject: Re: [PATCH v12 05/12] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_033242_487916_8D294E4A 
X-CRM114-Status: GOOD (  25.14  )
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

On Wed, Mar 11, 2026 at 11:00=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> I'm not entirely sure if this actually guarantees waiting with the
> unlock until the transaction is "done", for two reasons:
>
>  1. &bchan->vc.desc_issued looks like a "TODO" list for descriptors we
>     haven't fully managed to squeeze into the BAM FIFO yet. It doesn't
>     tell you which descriptors have been consumed and finished
>     processing inside the FIFO.
>
>     Consider e.g. the following case: The client has issued a number of
>     descriptors, they all fit into the FIFO. The first descriptor has a
>     callback assigned, so we ask the BAM to send us an interrupt when it
>     has been consumed. We get the interrupt for the first descriptor and
>     process_channel_irqs() marks it as completed, the rest of the
>     descriptors are still pending. &bchan->vc.desc_issued is empty, so
>     you queue the unlock command before the rest of the descriptors have
>     finished.
>

Thanks for looking into it. Good catch, I think you're right.

>  2. From reading the BAM chapter in the APQ8016E TRM I get the
>     impression that by default an interrupt for a descriptor just tells
>     you that the descriptor was consumed by the BAM (and forwarded to
>     the peripheral). If you want to guarantee that the transaction is
>     actually done on the peripheral side before allowing writes into
>     config registers, you would need to set the NWD (Notify When Done)
>     bit (aka DMA_PREP_FENCE) on the last descriptor before the unlock
>     command.
>
>     NWD seems to stall descriptor processing until the peripheral
>     signals completion, so this might allow you to immediately queue the
>     unlock command like in v11. The downside is that you would need to
>     make assumptions about the set of commands submitted by the client
>     again... The downstream driver seems to set NWD on the data
>     descriptor immediately before the UNLOCK command [1].
>

If what we have in the queue is:

  [DATA] [DATA] [DATA] [CMD]

And we want to extend it with LOCK/UNLOCK like so:

  [LOCK] [DATA] [DATA] [DATA] [CMD] [UNLOCK]

Should the NWD go with the last DATA descriptor or the last descriptor peri=
od
whether data or command?

It's, again, not very clear from reading tha part.

Bart

>     The chapter in the APQ8016E TRM kind of contradicts itself
>     sometimes, but there is this sentence for example: "On the data
>     descriptor preceding command descriptor, NWD bit must be asserted in
>     order to assure that all the data has been transferred and the
>     peripheral is ready to be re-configured."
>
> Thanks,
> Stephan
>
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/qcom/opensource/se=
curemsm-kernel/-/blob/fa55a96773d3fbfcd96beb2965efcaaae5697816/crypto-qti/q=
ce50.c#L5361-5362

