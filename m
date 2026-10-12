Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77E6CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVDh4BcUbgvIW1O8+CoyCzwwqxHQNia8D9+ovujPztQ=; b=LiedSYJpZ9RkCLIv+CKW5MnV7x
	wnLndsTy864ReHcHZ/Z8ik17Mw8aWCewyxt+G2fb7AdiwXiLMiOikrBpMmiSu0L5D166Vdcbb/1g8
	JLJ0Q0+A1P5nVRvgDU0GBpfdCzy+38plhsZSylh64igfBix1ZStQiOrfsVXx/UBR7vt903ozf/k/8
	evEWKZrlvEklpcAkRUV1VhW8IVmnoPXQpkKbI8Efvf5aDpQ9V60wSMHGVNMd9qjN8Y3K+2JQO7cSZ
	N3L3BtME3g7R9RrFsP+xWuG6oVC248yvnoJ98Ok1C2aBuR0jl3m0ZKfphQzkMk5qvroNeXNX3wqIS
	DQFdzDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHIE-0000000AiZe-2Ult;
	Mon, 12 Oct 2026 14:46:22 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHIC-0000000AiZ5-2OQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:46:21 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-53397554beaso21887371cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791816378; x=1792421178; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVDh4BcUbgvIW1O8+CoyCzwwqxHQNia8D9+ovujPztQ=;
        b=Hh1ywStwlFD8DKY/jH59A7V16nQdOp17kojHAaB3AQgp73TDwTL556whXeC7C3vHu/
         peqaBT3Tf2XIbbmfFvn99Q/9KjGBrk6fWKzdUWfylG5tAwmkctOkWDLPihztQqlvmBsP
         YXe3XT0Q+gy+Z6hx1vHX2MKtJzNGPK5pw/pza3s6+ZYAC842pBVWwRvbdL+AyADsWo8v
         s+V53NVoVgQZZdx5aFrHR+IWheOA3lMJigi7+ugpK6fB3CP3PXzSHUu7gtsBP1wBJ8ev
         BjYqg4qfRAEZTmysDlAZscaHmZ1YS9ssN2m0L0XK6TUYKrfg+34ioWK3WUmbFFZPUa63
         y+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816378; x=1792421178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kVDh4BcUbgvIW1O8+CoyCzwwqxHQNia8D9+ovujPztQ=;
        b=tf/72E+mNVsT2QWbNA6kmLqcmC9H4euO+/GGsCCFfANvFrkZkMEs+4Jp/xao0XrSpb
         PSXXMWV+aKKlvnVi5FlhWe9p7hczy9Mosr3FSnJY0oa6MZZrPs+FTgcfgFTqq8mdTR7V
         1zLVlXp1Qcd1QfVJTlSvd1RAWXtdIiisC7B5+J/nqQZ83bDfOuHERuDMNQK3w4Pzct2A
         9JQwkQHRh/jo9fmBcuTnvUILNWH3ctCdTjw5/vxhVZ3yrsJxsO9mMQ9QGIiQ2k4EohNt
         pF4dTVlZviENwTFFfUcQClcbxeyzg5/PJAAjo95yvC3D2XDrvQoi8d+2Xw5vr6Nxodrh
         y2Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzzLFPqm4qY5mJxFvdVf5/BHa92Ga5jseBxFnf+L9KZJhqM2jJ4cNA87Mtub1ha6IG1xicjSDgswXsD+Scbytv9@lists.infradead.org
X-Gm-Message-State: AFq9FYJMv1yFjlONy3clZvOIPpfTIljdBwwj7E8xc9r9usoasqkvgQb/
	lqBJmKyIm/hgcjsj0cAP4Z52q0bX1AGecrXiuhJKuHfuLoDWHgpvsrhInLniRsKsOkw=
X-Gm-Gg: AYBFou1hMOihIp9VUCTRW7Dy9epRbniAErWlhdfe7YaxR6OMItejxXkp/Qa4aFVX27F
	UBLHACkA3I62mal9V6fcIbi1f408caD+NCAvcp0bMwJl2L58xZQFYT6mQVrxrC1g1I/cBFaVDNS
	RovGhco22Z51rrrsdwNd4+082aTjE+PVXkJgUtGEcZ7U/dKIohVE3Bd7D/97BGS1W6nhLijM7b0
	7DIJPPF6vpHSUgRQzABOhFLMcechZheAwjHFj/uW91neuJMRUUr4+X4Mj0gjK+0SyvGgPKxMERM
	8o/2gP9V+MhT325NWTvRi/YWuBV6UeYjMfiakjvqKNNlZ77ytw06K+dE3AUQ2cGvKQWMnBAA90n
	l41XeuJBG0cM5vxkU4OOIbTmznts9AG+gZ1qTuI8NMT7MXAfctmi77nbht6iLwQvCbpwWFSeG4t
	zaPC2sMo+FLlPhnujs5yu1Buxm8LpbA3oB/fod+PCg4cCbkC4uFYrxJYP10UdHp76nBk7C8DkN6
	lG7POSj62bfOkRtNWH4ndYzF1Eyj1hHhVm/KuNP9rrx6LXGX/eIBvt8
X-Received: by 2002:a05:622a:2487:b0:535:1134:91b with SMTP id d75a77b69052e-5359faead4bmr160454661cf.14.1791816378499;
        Mon, 12 Oct 2026 07:46:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535e652f3c7sm3157041cf.26.2026.10.12.07.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:46:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGHI8-00000006SW2-2nlk;
	Mon, 12 Oct 2026 11:46:16 -0300
Date: Mon, 12 Oct 2026 11:46:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 2/6] dma-buf: Add get_phys() to describe a physical
 run
Message-ID: <20261012144616.GF14213@ziepe.ca>
References: <a04f17cc-f59a-4240-81c8-29776eee3a2e@amd.com>
 <20261005132046.30025-1-griffoul@gmail.com>
 <f0077cec-10fe-400a-b229-f7434e297364@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0077cec-10fe-400a-b229-f7434e297364@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_074620_620124_FB427D72 
X-CRM114-Status: GOOD (  19.88  )
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

On Mon, Oct 05, 2026 at 04:53:34PM +0200, Christian König wrote:
> > KVM gets its frames through the KVM-private guest_memfd provider
> > interface from David's series. iommufd gets them through a private
> > interface with the exporter, as it already does for vfio-pci. The new
> > version adds a small registry in iommufd for that, which replaces the
> > symbol_get() of the sample in David's series. The dma-buf is then only
> > the handle and the existing revoke.
> 
> Yeah that approach sounds totally sane to me.
> 
> We have drivers which stuff all kind of resources, not just memory,
> into a DMA-buf. That ranges from MMIO BARs to trigger FW operations
> (doorbells) over full HW blocks (ordered appends, global wave sync
> etc...) where two or more applications need to share which one is
> used.
> 
> That you then have a exporter private interface is for accessing
> this is perfectly ok.
> 
> The problem you are facing here is more that this is not limited to
> one driver/module but multiple ones and you don't want module inter
> dependencies because of the symbols.
> 
> So symbol_get() is probably the right thing to do as long as we
> don't have something like weak symbols or similar.

I don't want to keep expanding this hack in iommufd. If dmabuf is to
be used then dmabuf needs to provide a pluggable way to fill the
iommu_domain that many exporters can plug into. I don't want to
hardwire every exporter into iommufd, that makes no sense.

The existing arrangement is to motivate solving this problem
generically, not something to be expanded on.

Jason

