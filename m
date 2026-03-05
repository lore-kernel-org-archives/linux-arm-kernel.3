Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2D2F3D31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yx4AyhOAgyJue9ackXDxB6qNVZ3mjjFPXiVKLeWDVo0=; b=gTLz3fODsOUenv9fybzqwUs20z
	LbNZc/vgUkfywKiag5bv5uf8N+Zt9wjfqoALWsQskrbaOp9ZTJBrSQFdzBOXlIrzOQ73KDwYG6AFS
	A6fr2YKczrdk4I2D5SkDPaEalrh8smM/+DGe6d0GxB7zRaK031kxx51KZ7YSzcmfxr8RmSLXCOCOJ
	gdNcoPuK/BhJRGupVS0YhceMsCJkDLHN+6T7KIyb+BfDkZthvNpOXvsmc0bFBFcSQiINifQMFYQyt
	3KoGZWCd0+aZfIiHSJ1ZWSU+lYY8320mepkA5FnITlmYXhwAmAfaXjliGlf1DIp+Qe6eDyyI8WYHv
	Md1ofVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBNL-00000002C2T-0B7c;
	Thu, 05 Mar 2026 16:16:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBNI-00000002C1A-28f4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:16:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48371119eacso97877795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772727391; x=1773332191; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yx4AyhOAgyJue9ackXDxB6qNVZ3mjjFPXiVKLeWDVo0=;
        b=y7gLpJY9zoUZAZB2zOLUwj22kaNNsDFC244JzVT9OjFqHey6LZL2isUjIR0dOyElNY
         EUNt4qgGxYWBN3nHqzBSliuMNyHd9alj9QxwV1qSIRvdxc4xDOGqyoxk5Yr208XbJL9t
         0eiOwIxrsaEN9qQkZ9GTgbl5HlggYl/RGXottd3e+4rhM/MB9EWWvmY/nw7lbsj2cLDq
         rfrdbIAQo7X1CtMQksGH4L/j1GhE8cM0yztSZIdIySY7eW7SoQYFwl4tuoXPq6GsEVF3
         m5cgEgs7i/gKqHPWtVY3O+7LbDMTtthN5ejZmvm5lsZ8I9baXv/XC6FljrNvgWMuUnLz
         gN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727391; x=1773332191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx4AyhOAgyJue9ackXDxB6qNVZ3mjjFPXiVKLeWDVo0=;
        b=DyTM1h9YBxZ9PlYCaLQGgIDeMj3cOO9dgj5iOomF2p3u1jK+lZmIKg47OzYh5nltwU
         rEFg1IVMf2NgMZkqDplwV30tvF2IVQ7Ipr0lu2eiIPaqzTBR8giQ+D5E5U5LUhPYZeMz
         6HVBDV1LiCLweP36Xt0Yhl3/JL8KkaziP7EvnpAPIujlu/zP1nXwO5PGE8zBIy3+h1NB
         /IVoDyY1/yjfMM+2fkfFH/NARrrn8/+/s/Sngepv8eQ8FM03BSBmTc+ZmtwPmDJYqXJ8
         VbzcL2XztMH8jUwUZCPmkaM/CjD/FptshQWT0bnTkQBgpI8n/BFJ9oq+6beSjgz1fYg2
         A6PA==
X-Forwarded-Encrypted: i=1; AJvYcCUifO0GbZ/Lmu7FYCJsFBcvmof8kCuec4YEtgrTG6v8zyFpphFycizdqXbVxl+zpr6JEg7HZO6gIqEAtPoOseAN@lists.infradead.org
X-Gm-Message-State: AOJu0YxfRG1MDLOjpmUn9KGAgIXJGONFn8VNvQg613Ktx5gJih4Cx1m7
	JgjCT4lJegoVYtDsb5EhT2N4HVNik1CjNIbqp92OsTijpUR39me/N2w9FZb5fBHL0yI=
X-Gm-Gg: ATEYQzy+WMWG760YTY8SfJ2J9bsXQShEu+wAiqAGAj8hmS35Rliv+LipfIMfutpqIep
	9aXfz+DQ0FTRhzjdNNPhbLvma2lK/z4CeK1ue6KjgPez8zc7cmcdiZ4kDooiI8gpcqSovD7dWCG
	XdPvnH4czVFRCe68TC+CGRyAZyJbMCi6dJ3t5Myc5fg94rpQZP1B908my4da569tkZ8FoXoOVCc
	hwMo1jHEQ7XDeQ46hoN781WQ/vEammx4WS3fjKXL11Z/5EiYSEPcl96+f0uvL5dmfQqk2FW0xNH
	vSBXqd0BLyP7ny4jgQelw5zf+pPsukqWm+WhEK4EUdKOfkz8j0zp24Mrd4/XYSmzwVkXjtYzxmm
	yiwvcPlAWXXUzzx4PR+lgUUMVf08NujM4YQedo+lO/YfZzTWY75ZAP96lIj5yJeULLVSMIs80Ib
	p5MQVxTNeU9kVtA97JO5FEZ9a7jgpC
X-Received: by 2002:a05:600c:1f13:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-485198bab53mr105777125e9.34.1772727390462;
        Thu, 05 Mar 2026 08:16:30 -0800 (PST)
Received: from linaro.org ([77.64.146.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8d64dbsm55344325e9.3.2026.03.05.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:16:29 -0800 (PST)
Date: Thu, 5 Mar 2026 17:15:43 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
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
Message-ID: <aamsL4uh58Fv5een@linaro.org>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
 <scr5qvxa7f7k22pms4c6k5gwiky7lhssrw6qryfngexlek44g2@rayinnnwqgbt>
 <aalwMwN3qMlzrql5@linaro.org>
 <CAMRc=MfjknN1AYF_NPLzR0YbdWuoET25D9o0zsvx56VN+u59HQ@mail.gmail.com>
 <aamIf8JethKzLW93@linaro.org>
 <CAMRc=Mf=NjCqf0eqmM800Q3MEUC48V_DZ3ts6+4=qMCtrbvzzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mf=NjCqf0eqmM800Q3MEUC48V_DZ3ts6+4=qMCtrbvzzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_081632_626124_B5F8A648 
X-CRM114-Status: GOOD (  70.08  )
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

On Thu, Mar 05, 2026 at 02:54:02PM +0100, Bartosz Golaszewski wrote:
> On Thu, Mar 5, 2026 at 2:43 PM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Thu, Mar 05, 2026 at 02:10:55PM +0100, Bartosz Golaszewski wrote:
> > > On Thu, Mar 5, 2026 at 1:00 PM Stephan Gerhold
> > > <stephan.gerhold@linaro.org> wrote:
> > > >
> > > > On Tue, Mar 03, 2026 at 06:13:56PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Mon, Mar 02, 2026 at 04:57:13PM +0100, Bartosz Golaszewski wrote:
> > > > > > NOTE: Please note that even though this is version 11, I changed the
> > > > > > prefix to RFC as this is an entirely new approach resulting from
> > > > > > discussions under v9. I AM AWARE of the existing memory leaks in the
> > > > > > last patch of this series - I'm sending it because I want to first
> > > > > > discuss the approach and get a green light from Vinod as well as Mani
> > > > > > and Bjorn. Especially when it comes to communicating the address for the
> > > > > > dummy rights from the client to the BAM driver.
> > > > > > /NOTE
> > > > > >
> > > > > > Currently the QCE crypto driver accesses the crypto engine registers
> > > > > > directly via CPU. Trust Zone may perform crypto operations simultaneously
> > > > > > resulting in a race condition. To remedy that, let's introduce support
> > > > > > for BAM locking/unlocking to the driver. The BAM driver will now wrap
> > > > > > any existing issued descriptor chains with additional descriptors
> > > > > > performing the locking when the client starts the transaction
> > > > > > (dmaengine_issue_pending()). The client wanting to profit from locking
> > > > > > needs to switch to performing register I/O over DMA and communicate the
> > > > > > address to which to perform the dummy writes via a call to
> > > > > > dmaengine_slave_config().
> > > > > >
> > > > >
> > > > > Thanks for moving the LOCK/UNLOCK bits out of client to the BAM driver. It looks
> > > > > neat now. I understand the limitation that for LOCK/UNLOCK, BAM needs to perform
> > > > > a dummy write to an address in the client register space. So in this case, you
> > > > > can also use the previous metadata approach to pass the scratchpad register to
> > > > > the BAM driver from clients. The BAM driver can use this register to perform
> > > > > LOCK/UNLOCK.
> > > > >
> > > > > It may sound like I'm suggesting a part of your previous design, but it fits the
> > > > > design more cleanly IMO. The BAM performs LOCK/UNLOCK on its own, but it gets
> > > > > the scratchpad register address from the clients through the metadata once.
> > > > >
> > > > > It is very unfortunate that the IP doesn't accept '0' address for LOCK/UNLOCK or
> > > > > some of them cannot append LOCK/UNLOCK to the actual CMD descriptors passed from
> > > > > the clients. These would've made the code/design even more cleaner.
> > > > >
> > > >
> > > > I was staring at the downstream drivers for QCE (qce50.c?) [1] for a bit
> > > > and my impression is that they manage to get along without dummy writes.
> > > > It's a big mess, but it looks like they always have some commands
> > > > (depending on the crypto operation) that they are sending anyway and
> > > > they just assign the LOCK/UNLOCK flag to the command descriptor of that.
> > > >
> > > > It is similar for the second relevant user of the LOCK/UNLOCK flags, the
> > > > QPIC NAND driver (msm_qpic_nand.c in downstream [2], qcom_nandc.c in
> > > > mainline), it is assigned as part of the register programming sequence
> > > > instead of using a dummy write. In addition, the UNLOCK flag is
> > > > sometimes assigned to a READ command descriptor rather than a WRITE.
> > > >
> > > > @Bartosz: Can we get by without doing any dummy writes?
> > > > If not, would a dummy read perhaps be less intrusive than a dummy write?
> > > >
> > >
> > > The HPG says that the LOCK/UNLOCK flag *must* be set on a command
> > > descriptor, not a data descriptor. For a simple encryption we will
> > > typically have a data descriptor and a command descriptor with
> > > register writes. So we need a command descriptor in front of the data
> > > and - while we could technically set the UNLOCK bit on the subsequent
> > > command descriptor - it's unclear from the HPG whether it will unlock
> > > before or after processing the command descriptor with the UNLOCK bit
> > > set. Hence the additional command descriptor at the end.
> > >
> >
> > I won't pretend that I actually understand what the downstream QCE
> > driver is doing, but e.g. qce_ablk_cipher_req() in the qce50.c I linked
> > looks like they just put the command descriptor with all the register
> > writes first and then the data second (followed by another command
> > descriptor for cleanup/unlocking). Is it actually required to put the
> > data first?
> >
> 
> Well, now you're getting into the philosophical issue of imposing
> requirements on the client which seemed to be the main point of
> contention in earlier versions. If you start requiring the client to
> put the DMA operations in a certain order (and it's not based on any
> HW requirement but rather on how the DMA driver is implemented) then
> how is it better than having the client just drive the locking
> altogether like pre v11? We won't get away without at least some
> requirements - like the client doing register I/O over DMA or
> providing the scratchpad address - but I think just wrapping the
> existing queue with additional descriptors in a way transparent to
> consumers is better in this case. And as I said: the HPG doesn't
> explicitly say that it unlocks the pipe *after* the descriptor with
> the unlock bit is processed. Doesn't even hint at what real the
> ordering is.
> 

Yes, I think the transparent approach here is reasonable given the
design of the Linux DMA engine API. Since Mani commented "It is very
unfortunate that the IP doesn't [...]" I mainly wanted to point out that
this is probably because the main use cases the HW designers had in mind
don't strictly require use of a dummy descriptor. The comment about the
dummy descriptors might be more of a side note than an actual
recommendation to implement it that way (otherwise, the downstream
drivers would likely use the dummy descriptor approach as well).

> > > The HPG also only mentions a write command and says nothing about a
> > > read. In any case: that's the least of the problems as switching to
> > > read doesn't solve the issue of passing the address of the scratchpad
> > > register.
> >
> > True.
> >
> > >
> > > So while some of this *may* just work, I would prefer to stick to what
> > > documentation says *will* work. :)
> > >
> >
> > Well, the question is if there is always a dummy register that can be
> > safely written (without causing any side effects). This will be always
> > just based on experiments, since the concept of a dummy write doesn't
> > seem to exist downstream (and I assume the documentation doesn't suggest
> > a specific register to use either).
> >
> 
> You'd think so but the HPG actually does use the word "dummy" to
> describe the write operation with lock/unlock bits set. Though it does
> not recommend any particular register to do it.
> 

I guess the documentation I'm looking at (8.7.3.4 BAM operation in the
public APQ8016E TRM) might be an excerpt from some older version of the
BAM HPG. Is also has a note about "dummy" command descriptors:

  "NOTE: Pipe locking and unlocking should appear only in
   command-descriptor. In case a lock is required on a data descriptor
   this can be implemented by a dummy command descriptor with
   lock/unlock bit asserted preceding/following the data descriptor."

This one doesn't make any difference between READ and WRITE command
descriptors (and both are documented in the chapter).

Personally, I would prefer using a read over a write if possible. Unless
you can confirm that the register used for the dummy write is actually
read-only *and* write-ignore, writing to the register is essentially
undefined behavior. It will probably do the right thing on most
platforms, but there could also be one out there where writing to the
register triggers an error or potentially even silently ends up writing
into another register. Register logic can be fun in practice, commit
e9a48ea4d90b ("irqchip/qcom-pdc: Workaround hardware register bug on
X1E80100") [1] is a good example of that. :')

Thanks,
Stephan

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e9a48ea4d90be251e0d057d41665745caccb0351

