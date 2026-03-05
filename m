Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9402AEF9014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grtuVtzx4dqYeuDSNsG3zL/G5fmjx189tw7ngaV+0gc=; b=ilMVXooFfOkUbcr3IYLmZ6CqBw
	ixNPexsQyMj0HD0jMFrVjVFLCLf949YvPDN024Ez3RV/FZASiahuwswbZceXrqsmD37GFO9HK6uWD
	TGm4Uz2yoztUp6KOURYrv94MM9D+q7FTAuE0N1zOxtmB+vOp0KUtrcR8hqhyMQHx/lmkmAY7KelaU
	6ZT5n5MTIgaWMRN1cv2JkeigOSFP2qNglMLCQHnitOZwOu4TPmqe41YL4pE1lFW5Z5WD7v0LF8Ibv
	Rcd+p51Ci4u0vCos8teiHxjsBnsxKP4p9Ddzv/rv8qfIXhTOoyE1PBfdYkhNsup9iQ2/qZP7p9i1n
	ccWdH2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8zR-00000001tYr-0Eh0;
	Thu, 05 Mar 2026 13:43:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8zN-00000001tYU-2zpM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:43:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4837584120eso61194815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 05:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772718219; x=1773323019; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=grtuVtzx4dqYeuDSNsG3zL/G5fmjx189tw7ngaV+0gc=;
        b=i0ilAuzmVynjBr0oTYhYqpaq/ebICIwACm4FylbDrIIox79BVKWl5/KLf84aVYWl2w
         /LnClSeGiRl8UCbKfYcVuTqNrc4AVqYAivROpYOeOnmdcOIaM0HWmRK1sQrZBM1GHap+
         c7JAVz6SPiFDFgEbj/8TaB58ySWsam3gEQzAr8nQPKEH7EE4Ra2RuqDW9nnQQ7RJdn1w
         Nq4bCNXloJ4TeKb1KNfZ7PHHlc+Cor8KrE4ijmWiU9LeoCPeeF6GUauQBcPRt695V9bN
         9Bw7nR10jwls/MwSrj7PmV5IkgH/V50kW7sJewX9/v/PB5V3IrcEDD8jqKkAQmDZiCL2
         GkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718219; x=1773323019;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grtuVtzx4dqYeuDSNsG3zL/G5fmjx189tw7ngaV+0gc=;
        b=izBZqVti6cxHGMW1QkGR+t2SMc45/6IPjvMNjrx/TxIeHSTNUxqebGbThGrSD15s5A
         p8vz9Mls5+LBWbhOVAOLw7VBNnbo0kmjX/hNTUw9eGseyfSZze4EcmK/haTIiDcYUxl9
         X61KKMSEbqrypAxBd4dv5oaWJ9fI+30fYI+b6AwDn/4O7Zd8JhSNNlBWfpYCYQ+YmDj4
         s6sR9mjkkK+O5l5zU8GYGRmLDbc0KEmGfLLR35FfBRUSuy4XSyDkTTDtziPi9oUEt8J0
         dudWA6CC4cGSKS9hgkJwrm7u8k26VXAu1gEywX+GPodnQei2Kn4SW5mmaJ7dQXIIN+IB
         QyOA==
X-Forwarded-Encrypted: i=1; AJvYcCVMtDQbVFM+qlPLZ/tnjYd6vY8BEZYNFPXPQj3EWWt9RlBd9urUDfcCg/iGoQv1nEnXGL/B+P8acZhcj0E/LsVs@lists.infradead.org
X-Gm-Message-State: AOJu0YwAfNqJDPfFVZVntsx/zpqxxWtrsSKplO5mjbL6aRilRU7lD9wQ
	2zP2pDnUcQsMoZ082SI4DFvmBrEaxlTgXw0wuF/HV3scgWRJ847vs5mAnBECXC1ZnIA=
X-Gm-Gg: ATEYQzzE1Q+yopSBPeUtWmWP4UFN2+pmL4qWXjY2Hyo/xRayYAtNyjz63Y0sjOUtJjq
	pZLs3f16BAMThVxI/Jm7+3QNAPDzMkL5q0XZUFa7XQt/Pw5WuhmRRsDIP6AJ9lvihfJ9Y7lWNtr
	FmOJf5z7fMSqhV6mMcH3JqYx0WvSEdhDJi9D7dTS7vM+w6dwb7M8qSCEUXvuk7/Ft1e60fp1cFm
	c5Pbs2W7xxboWPQWHnjMUY6T82u8HRLy2+AlxZc05Sb38lpqLaVwYE+EnRmACRL4zyoLcTD2V2H
	NM41E+UgWeqggfO3ZoAt5ZyPzZm1tHZWiH3K1Q4GQLNES2QDlY+dNt85of9xMqwEMl3E0t4CR2G
	HkemMVKDveX+O9P6b7TCR8ndujHplNdWESkiqZxoI1y+LUCQ7ffxdVognO52K4fsA0MxWKYdYi+
	ueWNDAptbgsTY4+ZPuXNkyk/UdFKM7c6ZGD4s=
X-Received: by 2002:a05:600c:8b5c:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48519871622mr110409665e9.17.1772718219395;
        Thu, 05 Mar 2026 05:43:39 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaea1sm35241535e9.10.2026.03.05.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:43:38 -0800 (PST)
Date: Thu, 5 Mar 2026 14:43:27 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RFC v11 00/12] crypto/dmaengine: qce: introduce BAM
 locking and use DMA for register I/O
Message-ID: <aamIf8JethKzLW93@linaro.org>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
 <aalwMwN3qMlzrql5@linaro.org>
 <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_054341_823252_9CE66E29 
X-CRM114-Status: GOOD (  49.90  )
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

On Thu, Mar 05, 2026 at 02:10:55PM +0100, Bartosz Golaszewski wrote:
> On Thu, Mar 5, 2026 at 1:00 PM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Tue, Mar 03, 2026 at 06:13:56PM +0530, Manivannan Sadhasivam wrote:
> > > On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> > > > NOTE: Please note that even though this is version 11, I changed the
> > > > prefix to RFC as this is an entirely new approach resulting from
> > > > discussions under v9. I AM AWARE of the existing memory leaks in the
> > > > last patch of this series - I'm sending it because I want to first
> > > > discuss the approach and get a green light from Vinod as well as Mani
> > > > and Bjorn. Especially when it comes to communicating the address for the
> > > > dummy rights from the client to the BAM driver.
> > > > /NOTE
> > > >
> > > > Currently the QCE crypto driver accesses the crypto engine registers
> > > > directly via CPU. Trust Zone may perform crypto operations simultaneously
> > > > resulting in a race condition. To remedy that, let's introduce support
> > > > for BAM locking/unlocking to the driver. The BAM driver will now wrap
> > > > any existing issued descriptor chains with additional descriptors
> > > > performing the locking when the client starts the transaction
> > > > (dmaengine_issue_pending()). The client wanting to profit from locking
> > > > needs to switch to performing register I/O over DMA and communicate the
> > > > address to which to perform the dummy writes via a call to
> > > > dmaengine_slave_config().
> > > >
> > >
> > > Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver. It looks
> > > neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs to perform
> > > a dummy write to an address in the client register space. So in this case, you
> > > can also use the previous metadata approach to pass the scratchpad register to
> > > the BAM driver from clients. The BAM driver can use this register to perform
> > > LOCK/UNLOCK.
> > >
> > > It may sound like I'm suggesting a part of your previous design, but it fits the
> > > design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but it gets
> > > the scratchpad register address from the clients through the metadata once.
> > >
> > > It is very unfortunate that the IP doesn't accept '0' address for LOCK/UNLOCK or
> > > some of them cannot append LOCK/UNLOCK to the actual CMD descriptors passed from
> > > the clients. These would've made the code/design even more cleaner.
> > >
> >
> > I was staring at the downstream drivers for QCE (qce50.c?) [1] for a bit
> > and my impression is that they manage to get along without dummy writes.
> > It's a big mess, but it looks like they always have some commands
> > (depending on the crypto operation) that they are sending anyway and
> > they just assign the LOCK/UNLOCK flag to the command descriptor of that.
> >
> > It is similar for the second relevant user of the LOCK/UNLOCK flags, the
> > QPIC NAND driver (msm_qpic_nand.c in downstream [2], qcom_nandc.c in
> > mainline), it is assigned as part of the register programming sequence
> > instead of using a dummy write. In addition, the UNLOCK flag is
> > sometimes assigned to a READ command descriptor rather than a WRITE.
> >
> > @Bartosz: Can we get by without doing any dummy writes?
> > If not, would a dummy read perhaps be less intrusive than a dummy write?
> >
> 
> The HPG says that the LOCK/UNLOCK flag *must* be set on a command
> descriptor, not a data descriptor. For a simple encryption we will
> typically have a data descriptor and a command descriptor with
> register writes. So we need a command descriptor in front of the data
> and - while we could technically set the UNLOCK bit on the subsequent
> command descriptor - it's unclear from the HPG whether it will unlock
> before or after processing the command descriptor with the UNLOCK bit
> set. Hence the additional command descriptor at the end.
>

I won't pretend that I actually understand what the downstream QCE
driver is doing, but e.g. qce_ablk_cipher_req() in the qce50.c I linked
looks like they just put the command descriptor with all the register
writes first and then the data second (followed by another command
descriptor for cleanup/unlocking). Is it actually required to put the
data first?

> The HPG also only mentions a write command and says nothing about a
> read. In any case: that's the least of the problems as switching to
> read doesn't solve the issue of passing the address of the scratchpad
> register.

True.

> 
> So while some of this *may* just work, I would prefer to stick to what
> documentation says *will* work. :)
> 

Well, the question is if there is always a dummy register that can be
safely written (without causing any side effects). This will be always
just based on experiments, since the concept of a dummy write doesn't
seem to exist downstream (and I assume the documentation doesn't suggest
a specific register to use either).

NAND_VERSION (0xf08) might work for qcom_nandc.c (which might be the
only other relevant user of the BAM locking functionality...).

Thanks,
Stephan

