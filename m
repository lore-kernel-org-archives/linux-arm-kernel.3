Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B07C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG7DiFK2AkiQJxlm6ywiTGbJgNucHDn6Zq82S4v139g=; b=p7eSfDoGhsLN4dfKxNBgSDm13u
	mQ6ef1K6jIMSunHlL43P4cVKBZk81O9LoMvO14JG7p1gsaYm7UmsaLmJlyBWigMjZY2ng+ZEdFwi6
	QUOqhOteDnTByvFVYqI9ROS2mAFkAvqkpayEQdplt1dkhKf76wFRlKEKLjctUsflaWdxMLnkqqsYr
	7Y57kr7sAfzHRYcu+/5ZSSJykSdnbNf2NFTvT4C/xpWVmtM+pWsVUXXobjJOhyANePTGeJSi83sT1
	imZCBs50+4L/+d+e5VuRO4OmYBZNHocJvWDjRifrfOeptBKW46URzWbuW20ojrIrKy6A7wcwbC1BH
	1ChNUXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJaD-0000000H3KV-2KbX;
	Thu, 16 Jul 2026 10:44:49 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJaB-0000000H3JK-01FU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:44:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1802477f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784198685; x=1784803485; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bG7DiFK2AkiQJxlm6ywiTGbJgNucHDn6Zq82S4v139g=;
        b=IdwrBTMJpn5C7PxBPQOCx2tD4UBZB22GIAxaOPrHeHlz8PH+T4ErXRAnnibSSC/Oj8
         iYmd1aP/8z9Z1LLLr+DLKBF//x/9KfSkSobsbDtp5YwOUhUwDVks5S4KGCGiLnob8pBf
         hpJaQ24emtLlEtGjK6WWVkjeu6YFr0Aa0Eio7HpyP3khyXpx/2FcEZvqOwRDYTKqOEuL
         g47ld/+ovGx1Q/L8i92AeuMtAo+4EeW3HLOKfL5cNHS2iw87D62ff2qEOdcB74Dshu7t
         BbEDBEXVof6787unLAjxg461MHT86dnSIR8uD3iMJTw2YBCNo7RCn53O1dJAixNr4fHy
         Kj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198685; x=1784803485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bG7DiFK2AkiQJxlm6ywiTGbJgNucHDn6Zq82S4v139g=;
        b=U5duWlw/ZptP/qjQdxn+ge0kHWTvoehByPDl7EoxtSPdz2b7okkpa/iP9dNysT/759
         IMmTmZwfc/c7+IqjXEKAhv+1+j9jVezr2noP+IbPinXpcGLxDtsxz+8DYsqI1bUVrZzi
         F6Apawh6c2IlZfM1wA1t31TDUT0SeDXcHdIpAN+UvGPKbTpqruKnGn6cgIcMnMB8iMln
         LmCvipBeF9gc56o87GvOPhYgV9994/QqtLzGc8z5mQ+vVUpD4taHTQsxJT/E7Nit5GB+
         4wo+avnuUdd1JVHJDDGKK3dO22x48dtHVGUusiHyOAnS7kaRQEOrgzOrslrTC0BPqN0M
         w0Kg==
X-Forwarded-Encrypted: i=1; AHgh+RqWH4v64gb404Ed1hGouQpL0YU+9yau51g+v461GulIi9c7tIE+ILPTKDJ7QVoBALX6L5zGumvpg8cV0dvYc2z3@lists.infradead.org
X-Gm-Message-State: AOJu0YxbrzYLhuqM0VBgEQtQsksXlq/IRTTWbjk5zBu2+paaZsOkfgDs
	8DuAEpiyWbEwq7PtVnI0cbRLeZnAMKHe4xcKyT9C/k/cJx81/TvBrPboCFPFkZ3NRDA=
X-Gm-Gg: AfdE7ckONn7RJ6jDdcBdVu0f8Z/5xky5NRZY0TSIG9jS7C1zeageASZoPCbvpI9zHMu
	AyF9u0cQKrzuSycv7lgKRrKJ1HUF9zWB6LgsWFYwHyr5ofkxRUaPkDxac7ueGb1vvSMYrkLoNk8
	AxsDWED53IoLL0XmlJK9opDXmlctzxFIevIPaBI44oMX36JObcbj2MLS36cBJDBpwoCSGxnESXu
	fZINP7KYbK2dEItSnS96XDwFci71mg3GvGrr4QzC4RCBEVTJYnAWZ0Nrbnjhx4znv7XYKuhAJGA
	jFQUhlmQIB0tM9E710Ps/aZSND6DfNcut51AfYGHOy1QavAy7M6PXbUslyC+VmynnfdZIoW46Iu
	ffegD423rPWXMGO9nVeuJJ1do61FGALp5XM2g1ZBL1NomxcrpEaP1+dQ0KDdUUMJaDTcNJ+bSGk
	B7oB4sbf+H4rQAEg==
X-Received: by 2002:a05:6000:310d:b0:477:6da:1b6f with SMTP id ffacd0b85a97d-47f2dc9c5b1mr23909548f8f.23.1784198684979;
        Thu, 16 Jul 2026 03:44:44 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:a01c:aecf:c14b:e17e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm23851143f8f.29.2026.07.16.03.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:44:44 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:44:39 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <ali2F4dDuLRWJsfi@linaro.org>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
 <alYGGu7_3G6mJAzQ@linaro.org>
 <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
 <alepDnRJmRLbFGRQ@vaman>
 <alewA9ubkYKHpnuj@linaro.org>
 <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_034447_073452_95CE7317 
X-CRM114-Status: GOOD (  15.17  )
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

On Thu, Jul 16, 2026 at 12:43:04AM -0700, Bartosz Golaszewski wrote:
> On Wed, 15 Jul 2026 18:06:27 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Wed, Jul 15, 2026 at 09:06:46PM +0530, Vinod Koul wrote:
> >> On 15-07-26, 14:43, Bartosz Golaszewski wrote:
> >> > On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
> >
> 
> ...
> 
> > I would avoid using struct dma_slave_config->dst_addr (like in v11) [1]
> > though, since it's more a "address to dummy register" now than the
> > actual dst_addr of the peripheral. That's why I suggested
> > struct dma_slave_config->peripheral_config.
> 
> As in:
> 
> struct bam_dma_peripheral_config {
> 	phys_addr_t scratchpad_addr;
> };
> 
> struct dma_slave_config cfg = { .peripheral_config = &scratchpad_addr };
> 
> ?
> 

I think you have the same thought in mind, but there are a little bit
too many odd typos in your example to give you a simple "yes". :-)
(Why assign &scratchpad_addr to .peripheral_config and not the struct?)

While at it, perhaps we could rename scratchpad_addr to have something
with "lock" in the name, to make it clearer what it is used for?
(lock_scratchpad_addr? lock_dummy_register? lock_scratch_register?)

Thanks,
Stephan

