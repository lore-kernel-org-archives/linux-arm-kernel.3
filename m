Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4468EC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evNZMhqkj1ttyktAM6FNCpZ80KvQoIj6HuNmJYBDqp4=; b=Lg1h8GFLC+3rQzrlHROI+3otIK
	DNPaPBTWm7hkJasXIE7QJkCpmvudRKucVv9VreMjjZaZkqPUYucjhQmBKAobZBbvkXXVLvFE41x97
	D/EpwkeSS+NO+O5C8tq6zdNSNV//c+49YefpR5Pkbgwdi99IOcZf4rRwAjH7RgXD3EtpQrJBBr/CC
	HkQ8eilOwHYicgrNf9Vu7C98wR3A9uNspn0R8yNanazX1coHwhz5VRNvJSp8zMq8jqbVcrXk8jHyq
	8N6g3BDACXsCON5qDJLOvvwZ07oHDeheL0Q8vrVsEbHLRq86W8iyFDxIGnjLjuvvqfSVZt+jJKNty
	l/UNRTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqkW-00000008fon-0Tcw;
	Wed, 19 Mar 2025 10:34:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqim-00000008fXk-36sw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 10:32:26 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2264aefc45dso13317535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742380344; x=1742985144; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evNZMhqkj1ttyktAM6FNCpZ80KvQoIj6HuNmJYBDqp4=;
        b=fOj83u+bkgCpq+Mq8Bz1q0/GskKmAZXz6aNYP39ZbZXIe0ZljHdoa/Ji1om4bu2Pqm
         7HtEwPpaCgvz/rHFmIsEUmM8xYpWr9oTvOgdQiJIMvBKaA+GxgXC+0oYOuzj/Vq/4iLp
         1ZStsjouVXEnzEXuFREICeHSiEqyQZOyQj7m7BQG3xb/cbj3hO46SyRC0c6qSEjindFE
         Vbfo5XOEk7QlP0T70ijnglKtuetEbMcz3zn516z+Qb5gY1MF88Isv8wk7+XRf16v16yf
         IV5CZTEVJZ8tw1HGZAxD12vzypMvIShzLGuW2EG487BvdgxHs3/zN2n1xFcgQ7zG+TBG
         wlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380344; x=1742985144;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evNZMhqkj1ttyktAM6FNCpZ80KvQoIj6HuNmJYBDqp4=;
        b=JUO9juzK+JfsyaqHY2ZWT0prAQWtWFq8R2qX5SCXZ6/hwNFon+n5fLafbsZWEZiBBb
         qw9xrgU6YPA1lBmj6inkqYuuN4XlN4h0z256q8zPlunM/j1oUbjEdWexsj+5uvnAXJoc
         v87v8noPWsrZVPyUi5YMBLSG0RF+boFzeXItLgEHZJfXrZwKvg/dq3aMZt3WdXJVSTFb
         dZFI+xquD5X6zKrCOaZTpIS3aIzrt3yhpMbogNQ4SWCCrXl37moJOzfV2JQJMyoECUxm
         mPy4u/RWaI5puT/UyUAcvv4SNnuRf1Ygjdu/xfm+6KuU15Pzg3Kr7AuHTrbzl7I9z+uC
         WABQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEx2DhIxvAMRS/vCrWLT0TIWW/d3vOrcfEuMjhn04rl2Pt5J3Vlhb3YOH4HyLN+1Ln7vnyFy3KMj82LWPX6qGm@lists.infradead.org
X-Gm-Message-State: AOJu0YxtqvTByBN/xXCHceFAhCv690sipOX3xvYxZDRS9vVy7ZYDz5DR
	4ojP82RPtVn/zvE3CuLzOoZmxg2CxRnKRtj4jQHIsrpYh4f3XwGF8EBfICvlxQ==
X-Gm-Gg: ASbGncthhFcS1ebeUnZVWx7RapS4a01h2WBfmECzkqcGctfvRtwnt8ubt44Rt6G/Y23
	RZfH9hg0wgU9wnuJJ7ylLIuP8HyCgi19q1RhUU/kKwT2iAtWtlZMSqaCYlXgdaBssIh6BxuPmiT
	dvRKV+U3f74OHX9ufg89nBzSyZVHUsi++rzB5Tqou7p4jvu1LDEVRAQNZXGSjl8wE6k7h12MeBU
	x7QojL3/ncf2j9gSOmvTNa69swpoBb896MHdBvpXJtesgesCs8LPyXcOajT7GGnVRbsLLOgOt80
	HVFdDxn7ArKfgemoU72EH1/qhqdNK3rv7EcBuzwtbOpoz8xHaNeyjGw=
X-Google-Smtp-Source: AGHT+IEP6MgbdWZWJAzv7d+SZahNfAT+u7CepjEY9PXUCqNZUa5QkB79CIbo0WUj8WbyfNiS2xiL0w==
X-Received: by 2002:a17:903:2287:b0:224:1074:63a2 with SMTP id d9443c01a7336-22649cb2f7fmr35461815ad.43.1742380343853;
        Wed, 19 Mar 2025 03:32:23 -0700 (PDT)
Received: from thinkpad ([120.60.70.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6c8dsm110467105ad.156.2025.03.19.03.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:32:23 -0700 (PDT)
Date: Wed, 19 Mar 2025 16:02:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, vigneshr@ti.com, kishon@kernel.org,
	cassel@kernel.org, wojciech.jasko-EXT@continental-corporation.com,
	thomas.richard@bootlin.com, bwawrzyn@cisco.com,
	linux-pci@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <20250319103217.aaoxpzk2baqna5vc@thinkpad>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-4-s-vadapalli@ti.com>
 <20250318080304.jsmrxqil6pn74nzh@thinkpad>
 <20250318081239.rvbk3rqud7wcj5pj@uda0492258>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318081239.rvbk3rqud7wcj5pj@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_033224_868752_4FDAE50A 
X-CRM114-Status: GOOD (  28.08  )
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

On Tue, Mar 18, 2025 at 01:42:39PM +0530, Siddharth Vadapalli wrote:
> On Tue, Mar 18, 2025 at 01:33:04PM +0530, Manivannan Sadhasivam wrote:
> 
> Hello Mani,
> 
> > On Fri, Mar 07, 2025 at 04:01:27PM +0530, Siddharth Vadapalli wrote:
> > > Introduce the helper function cdns_pcie_ep_disable() which will undo the
> > > configuration performed by cdns_pcie_ep_setup(). Also, export it for use
> > > by the existing callers of cdns_pcie_ep_setup(), thereby allowing them
> > > to cleanup on their exit path.
> > > 
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > ---
> > >  drivers/pci/controller/cadence/pcie-cadence-ep.c | 10 ++++++++++
> > >  drivers/pci/controller/cadence/pcie-cadence.h    |  5 +++++
> > >  2 files changed, 15 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > > index eeb2afdd223e..85bec57fa5d9 100644
> > > --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > > +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> > > @@ -646,6 +646,16 @@ static const struct pci_epc_ops cdns_pcie_epc_ops = {
> > >  	.get_features	= cdns_pcie_ep_get_features,
> > >  };
> > >  
> > > +void cdns_pcie_ep_disable(struct cdns_pcie_ep *ep)
> > > +{
> > > +	struct device *dev = ep->pcie.dev;
> > > +	struct pci_epc *epc = to_pci_epc(dev);
> > > +
> > 
> > pci_epc_deinit_notify()
> 
> I had initially planned to add this, but I noticed that it is not
> invoked by dw_pcie_ep_deinit() within
> drivers/pci/controller/dwc/pcie-designware-ep.c
> Since cdns_pcie_ep_disable() is similar to dw_pcie_ep_deinit(), I
> decided to drop it. Current callers of pci_epc_deinit_notify() are:
> drivers/pci/controller/dwc/pcie-qcom-ep.c
> drivers/pci/controller/dwc/pcie-tegra194.c
> while there are many more users of dw_pcie_ep_deinit() that don't invoke
> pci_epc_deinit_notify().
> 
> While I don't intend to justify dropping pci_epc_deinit_notify() in the
> cleanup path, I wanted to check if this should be added to
> dw_pcie_ep_deinit() as well. Or is it the case that dw_pcie_ep_deinit()
> is different from cdns_pcie_ep_disable()? Please let me know.
> 

Reason why it was not added to dw_pcie_ep_deinit() because, deinit_notify() is
supposed to be called while performing the resource cleanup with active refclk.

Some plaforms (Tegra, Qcom) depend on refclk from host. So if deinit_notify() is
called when there is no refclk, it will crash the endpoint SoC. But since
cadence endpoint platforms seem to generate their own refclk, you can call
deinit_notify() during deinit phase.

That said, I noticed some issues in the DWC cleanup path while checking the code
now. Will submit fixes for them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

