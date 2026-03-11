Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9B11062868
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJze5/pXmPew2sfHMpjfcTTl4xqaN7GKbsQ4t36q17Q=; b=frQZF4u0fWJfY1H1jOSzL5rADZ
	RSIIoG9evNhdi4R8bwdNtg8wFucXnOeyBqIJosJ22zxwhMillc24jEqmL30ouQQm5atC13NyxchqV
	l52K1T1ysqValUgp0AjjfOWgV52/xv4lLysdi629WB5W78rrdebzkWLfaiuO//oDfg+VdjZPegaMI
	qM0e6DDVIyB7FiLtgnD8XPwHnZaLmWGrX7UwowfPinAm0ATw7Hhn/vnt8TUP7hFLPkakoLO1ntcol
	15x5Hb0F3D0v7gr3aldePQ06psFCR7vxYgPIbU/ckIpdzr5RCo9pkJRL0sy5Ow6fXZLiea9c+q9Xh
	bHDUG+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Hgu-0000000BUTf-35ry;
	Wed, 11 Mar 2026 11:25:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Hgr-0000000BUTK-3sG1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:25:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so5410898f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 04:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773228324; x=1773833124; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CJze5/pXmPew2sfHMpjfcTTl4xqaN7GKbsQ4t36q17Q=;
        b=SBDqe7hJuXFsbXfOIcVQGR2Bev7+MKJypHueiOyvKBJrhTrf0ZNkxU/7G4h9pKCyC3
         3mJ0YoDgTlTp7WTvcwlPpawHJ6KfZi+JmE94zdmS2IzFPm9dsZ30UIDf8RlhCWbjFGP1
         GN6NGqK2DIiRfvIUTEuGjhZ2yAWpHCaAdUumvjBSacAXN+efL0mKCJtSEi8P6blzdLFy
         ZPe4FJLRmgzaWDwAMGPb2tYY/PhKSASByLP0V1GGjOHhYUZsadUgDhJ0gj81AGz2zMwM
         KgXjlQ3DQdUBFRgWesY3GcGGd/MKuDm42K9GjVaqxJ04qRgtpzEm728lFTgzsTOOrxMf
         uScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773228324; x=1773833124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJze5/pXmPew2sfHMpjfcTTl4xqaN7GKbsQ4t36q17Q=;
        b=s/adH7lWtmES/SjNSBKlKPmrjUgROUAcOvRFKm/Sc/SXSlLXz4VmONcqM9rUW77ipF
         mz8Nv/DigJk7nqsRqvH3BE9lFZmdeO1CGw8gC7jmGPMGFzGSMr2VucB/ile+HfnBHtib
         TIxK7CgiYiFIl4JyNGOK/hp/ELNNFUCQw/B+Yr1P5y0VZfbNbT5uz1CiI2rMMomIoGP7
         jcLEu28i7uFJZFOTpR9ZtTGwfymuRavFIeq3f3hT0XPZhk0F0FjR0HrGHpSzZVifh57h
         LAQdjAVf17ws4tT3GMivW59AsYj/uYQXO+teKvR9DalFZX8wusMl3t89VdPu1qgPKyIN
         rSbA==
X-Forwarded-Encrypted: i=1; AJvYcCUZymEGa6FQWvw47g8JTG3jatw6YAaMN1XtaqCNQEMIm/7POLve68vUL6tuqii/o3sk5l9jxFOZPJ7y2s+qH1NF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg5+0xaMVnG5cvkGIW7PcbZblZN4zpa5Q4Rs148lflIpuaPJM4
	bKNBm8WWocPIT9cowzaSyGpqzST8cmR6qhDb5BHSS2yGw58S0R8ZzwsJNb1gTt0ol9Q=
X-Gm-Gg: ATEYQzygO80brZSSVJenJoOEnanka7NwNrZopClMs8Bi7Hzw6CeCN1MtVDRP1eqrqjY
	jklUykO69mt/nd90xmCwQR+LdKktR5VY8f89+wLnwupI6x2xwwMmbsUUDPXXYMmNHiwkwgGH0BE
	ZL9i8GZ84xGesTeX4n1hyKFPo9+EKAcExWokA3YOeONrLVp23x1rL/imuNzZJ9U+zF6WbWRSEN/
	4o54pWFOu7So23gg8Q2Tw+tTU34iNOWMmfL4i0bOjeowCVc9QXS4xuXbDwistc9ikdK0oFe3xb/
	+mTIAq5BbedzOIK5x4HMzemdW2j6rQKuMQPuYlYcELAKQjKvevu30GjTXMYkMctpZnKgRdNE8pa
	et7Jdvddkjg22IxLgvHbkMwFUHAL7MPdwDMF9o3GcC0b0yT4TH2T/fam6Tk0iZtEnl/hdAs3P5/
	pqjM/2XQPrie/jYy8YGAnxPDYgzJpbtuu6aAYqj8cQsJCNqA==
X-Received: by 2002:a5d:5d0b:0:b0:439:b79d:b9a5 with SMTP id ffacd0b85a97d-439f8431382mr4099695f8f.37.1773228323834;
        Wed, 11 Mar 2026 04:25:23 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81f1318sm6682078f8f.21.2026.03.11.04.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:25:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:25:07 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v12 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <abFRE1qHgP-SYWZL@linaro.org>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-5-398f37f26ef0@oss.qualcomm.com>
 <abE9RQfGN6Ycns1B@linaro.org>
 <CAMRc=MeSfFyVYSJHzHvuynRR3TWRz04tyiOy1JvqyHP0aQKPOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeSfFyVYSJHzHvuynRR3TWRz04tyiOy1JvqyHP0aQKPOA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_042526_022379_C6E3010C 
X-CRM114-Status: GOOD (  36.38  )
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

On Wed, Mar 11, 2026 at 03:32:38AM -0700, Bartosz Golaszewski wrote:
> On Wed, Mar 11, 2026 at 11:00 AM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > I'm not entirely sure if this actually guarantees waiting with the
> > unlock until the transaction is "done", for two reasons:
> >
> >  1. &bchan->vc.desc_issued looks like a "TODO" list for descriptors we
> >     haven't fully managed to squeeze into the BAM FIFO yet. It doesn't
> >     tell you which descriptors have been consumed and finished
> >     processing inside the FIFO.
> >
> >     Consider e.g. the following case: The client has issued a number of
> >     descriptors, they all fit into the FIFO. The first descriptor has a
> >     callback assigned, so we ask the BAM to send us an interrupt when it
> >     has been consumed. We get the interrupt for the first descriptor and
> >     process_channel_irqs() marks it as completed, the rest of the
> >     descriptors are still pending. &bchan->vc.desc_issued is empty, so
> >     you queue the unlock command before the rest of the descriptors have
> >     finished.
> >
> 
> Thanks for looking into it. Good catch, I think you're right.
> 
> >  2. From reading the BAM chapter in the APQ8016E TRM I get the
> >     impression that by default an interrupt for a descriptor just tells
> >     you that the descriptor was consumed by the BAM (and forwarded to
> >     the peripheral). If you want to guarantee that the transaction is
> >     actually done on the peripheral side before allowing writes into
> >     config registers, you would need to set the NWD (Notify When Done)
> >     bit (aka DMA_PREP_FENCE) on the last descriptor before the unlock
> >     command.
> >
> >     NWD seems to stall descriptor processing until the peripheral
> >     signals completion, so this might allow you to immediately queue the
> >     unlock command like in v11. The downside is that you would need to
> >     make assumptions about the set of commands submitted by the client
> >     again... The downstream driver seems to set NWD on the data
> >     descriptor immediately before the UNLOCK command [1].
> >
> 
> If what we have in the queue is:
> 
>   [DATA] [DATA] [DATA] [CMD]
> 
> And we want to extend it with LOCK/UNLOCK like so:
> 
>   [LOCK] [DATA] [DATA] [DATA] [CMD] [UNLOCK]
> 
> Should the NWD go with the last DATA descriptor or the last descriptor period
> whether data or command?
> 
> It's, again, not very clear from reading tha part.
> 

I'm not sure, my impression is that the exact behavior of NWD is quite
specific to the actual peripheral (i.e. QCE, QPIC NAND, etc). In the
downstream drivers:

 - QCE seems to add NWD to the last data descriptor before the UNLOCK
   (as I wrote, it seems to queue command descriptors before data).

 - QPIC NAND has a dedicated "cmd" pipe that doesn't get any data
   descriptors, it specifies NWD always for the EXEC_CMD register write,
   which isn't even the last descriptor. This is also done in mainline
   already (see NAND_BAM_NWD in qcom_write_reg_dma() [1]).

It is possible that NWD works only when attached to certain descriptors
(when there is an actual operation running that gets completed by a
certain descriptor), so we might not be able to simply add NWD to the
last descriptor. :/

I suppose you could argue that "make sure engine does not get
re-configured while busy" is a requirement of QCE and not BAM, so
perhaps it would be easiest and safest if you just add DMA_PREP_FENCE to
the right descriptor inside the QCE driver. qcom_nandc has that already.

Thanks,
Stephan

[1]: https://elixir.bootlin.com/linux/v7.0-rc3/source/drivers/mtd/nand/qpic_common.c#L484

