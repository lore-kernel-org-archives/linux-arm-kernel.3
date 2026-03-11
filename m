Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF71BFD064F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqJVCEF9evLSw9CGf9v4iGyJ+/vqb8/nhU/YNtIqzkw=; b=WhqXkMvEkS/lh5cfLUszZIQoO2
	lWHuFaPPp917+oifKyqjHRSVTeEx4MMcfIseoWFI3wtnC19eYhPW3WM/HBtW3j+90uXXlPX+EfpAI
	SWO2E7HHWvsLUiXE8nI4y8gVlzd9/3/RoXUw90x3AZ1BHdLzZo95ObLcoDhuT0vP4BLqLorukwDTs
	3UpMubbJItIil79FxazrqZNK8XU3r9GR0+yPaMHdlp4P7+tPv7fu0c2GhQsorzyTutp5vhBHHhcIz
	iCKK59U4eRZ9kBPLgNFxhXPSHENoe9IADA3Vdz0ZwcyPPBNK5Sbp1sIoZ+58ZtYn1+e4alXtRhNut
	oJEIrjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EaZ-0000000B7U1-3mpt;
	Wed, 11 Mar 2026 08:06:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EaY-0000000B7TN-06JX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:06:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4853aec185aso27923745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773216400; x=1773821200; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QqJVCEF9evLSw9CGf9v4iGyJ+/vqb8/nhU/YNtIqzkw=;
        b=TLL2xKBCUs+CQkd6bTyJ+QHF0nq6nkwr3ewYpJt77T/KGikJWLDA18l46aiRX42AAt
         YI4H2NRQXXbQKUBe+6iNBOjVbDZIQUCnzzk9+k7ZoV81vbqlNP907rjQ1mMU59b/dXfr
         51n8N/eIXt3P9feJUUG/VCmAvv9NLU4k4saCvs7K8fhIYepyQxCW1W9Bh4OEfGH2MWRV
         aaVHIqZTrePX1loRf6GAVs39p1tNmrNt/7iyP5LVuzjF/ZLMy/P8no/kivtrrIyh4Fm8
         hjvtGFO4xzRrSvcZ1kYzDe2L5IvLiyPE7LEQKUGw5xqqUGBnWoVSX2GgQNzEIFapITrq
         2r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216400; x=1773821200;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqJVCEF9evLSw9CGf9v4iGyJ+/vqb8/nhU/YNtIqzkw=;
        b=GP73tFUpDogjukUYYnsS4/awPWsfcBAXyo9pgM9355cfYayKcxn+uORPzbGLK7ngg0
         mukJ/Vjk59RkiRKJVAy6y6GQ2eoexVVcmiv2reOMrBLU/NEZ5RdB+Br8Aps3DJlTDXvA
         VCOGIR6w8zYdfHtq82nMF4pP83KSn3ZPACy8RbD3HZAZMfxxU+BfPUV/ClcEWBXRtjK/
         LDpi+R75VC4Rgh1731YsFB357yur6NFjbZx/D3OefyC26VKq8xvwDyWwyMfp8WQkKe6o
         Y2dh87OZgLsAUgW8ouQfSH0pPokhi1/PSNWcGQ1YjCgZ01eWfjlLvGd5EyfG2hmyXk4r
         XVRg==
X-Forwarded-Encrypted: i=1; AJvYcCVztDaP/Iv6/Fi0jVUau85zrsKOkv7IS1ouzCMuB+CT/268eT3y+zIwQQK77HZVvUwCW2U33L89NcoA1zL55noh@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3a7zuEEtn8dWwkBCkWiPf4elHl/cIPLvv1yTryk8eLcONkM2
	c8rRWsvzTr2eJF59yt3r67V4MWXk7aZiE8y39bpITXrq2SIqVypizl1AUa2zvqXvOSc=
X-Gm-Gg: ATEYQzz8aGRH/sEK15mF7fDLIB6wWZeScBE2njpJ/ml3EP8098xPXBWYuXd55RqlVTr
	OEbzJjjvgV9JlLXqtXVhrrv1QDnkdQzjhZiwm+I82DbmzaSYvQT9y67Gu/shicHZQQyhNQLXx8C
	wYa4PJoPdxEcBDeKPl6IXhNTHwXjPr8CvcDA9JcOXVB367tZzQ8Jg0Go8yjyGFGkU4M70ZVIT14
	A3wxeSxRhOWTInXe/VdwfjFGMwBPUsZUqfN+xkz1d4/sBjRfG6aQiKb3PwmHR6S2C9Gk9Mj5O1E
	2/yzzMImcmYej/iBJBDOR2+FzUjPI6+zFgaG03ud2Dm7hCgC+Y8OKw6SK89JvTBH9qaw7j1SLB6
	RvB796gUJek9+3CYmDFnq3P2tK1XpaZv8oUMDbJ/zRbYKRCAgHhQVXyFUfUI+qJ9/ITD3rCEIs0
	U8cBKhy5PoYYpMOCrsSpqp/6T2KSuq/W6PU5Cr2+KTmSiGGQ==
X-Received: by 2002:a05:600c:1f10:b0:485:3f58:da6 with SMTP id 5b1f17b1804b1-4854b0a55efmr29718895e9.2.1773216399585;
        Wed, 11 Mar 2026 01:06:39 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:1c2c:7aff:fe45:362e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b66ffe2sm30730665e9.13.2026.03.11.01.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 01:06:39 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:06:34 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v12 00/12] crypto/dmaengine: qce: introduce BAM locking
 and use DMA for register I/O
Message-ID: <abEiiqKrn62Y_s1t@linaro.org>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdzjY2UJ3uSUgCabCLqWJcpaVq5eSx3-Ph-AZXcBf-JTw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_010642_085961_D9E9F21E 
X-CRM114-Status: GOOD (  21.41  )
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

On Wed, Mar 11, 2026 at 09:03:37AM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 10, 2026 at 4:44 PM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > This iteration is built on top of the v11 RFC with remaining issues
> > fixed and the mechanism for communicating the scratchpad address from
> > clients to the BAM driver changed from slave config to descriptor
> > metadata.
> >
> > However: during stress-testing I noticed that sometimes a transaction
> > would end with an error. The engine was indicating that a write/read to
> > the config registers was performed while the engine was busy (bit 17 of
> > the STATUS register was set). It turns out that we must not just
> > unconditionally append the UNLOCK descriptor to the "issued" queue, we
> > must wait for the transaction to end before we queue it so this version
> > takes this into account and queues the UNLOCK descriptor from the
> > workqueue.
> >
> > With this all stress tests and benchmarks from cryptsetup work fine.
> >
> 
> Mani, Stephan: sorry, I forgot to update the cover letter to Cc you.
> Doing it now here.
> 
> Stephan: I tried to use READ command but it would crash on sm8650, so
> I went with WRITE. :(
> 

No worries, thanks for testing this!

Stephan

