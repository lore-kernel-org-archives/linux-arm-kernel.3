Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A85BC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/psGtim6qYd78+PihMTMNmgRMTiPXj9RR2qxzIsxV0=; b=E6olo46O+FzVaY+IYmO9krODla
	O5Yrj9h36NKBTQ7fgP0pQ4l8Hhd9E600Qx16T7wvNOopsAnYiGG0YP0OY1GZBqPUiVb5pnZrdEfJq
	J6gqfZkVUMVugvnrDcK6QaNwzgfar/NAU8+hOiCOP92wu1DIyrAhDmNBmniueSZhflYWV9S94oijv
	6R1JxAl58V/G2BNLHuF08FD/xt4Bs2Hn60b7v7xWSuTSiOfgzWlEROv+5R1hTl01Fa3gJHKrl51I2
	7pE91d1ZE93yQBh/x1fm7xYmBbZ/AxST3sMP4sRQdScWlLfr7FPAAZEhCcRI+riKMDbULL+4KP2JG
	q6TQ9nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrf9-0000000DrpL-23su;
	Wed, 04 Jun 2025 17:12:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrd3-0000000Drb4-1tkt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:10:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74267c68c11so158824b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749057016; x=1749661816; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/psGtim6qYd78+PihMTMNmgRMTiPXj9RR2qxzIsxV0=;
        b=rQHEptYvw4g77nXrvuLDgaKCV72COV6rw/2pcQOhqK1XgCjpRb3M0stSHuelaQsxwK
         o+TddEPuBINPrDH2W/qvGR7Sit8MpraedA12q3wgcwv3kU4ilBxDIp0Bg4WgzpRkYuTE
         zrBDJRRaf6v+YYLGvNgHOWsRvamrrnyQxjSG9lFvfqXBoWTQJsb/P8axS3Oy1J0OEM/2
         8G8Hqkdbi8yREf1p1g+heRGuIQNvGrxToyRjglj0zn4ZCHbUKtBl3ziudREdKRlR2zZs
         23aGnu26033ViEn7+4sSf4q7j62xZPwZhfflGjbEf0kr55XENQCqhQCvzB4wag+ze792
         YLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057016; x=1749661816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/psGtim6qYd78+PihMTMNmgRMTiPXj9RR2qxzIsxV0=;
        b=oLNF/y/kpM2meNDw1xdgwPWt1RlLEaZooeH69iHrXhcfni1kjBcgk4EK1Phfav1Gs1
         0aW5UMMPBzqRaSCQVCA4eUqdF6DvIt7yiVaVzDSjiu54aKzxJd1IW0Cjb5H42fmYeItO
         9E78B/MYJxIOJYpX3W00udOC46uljq6izO1cBo+xS226cj55VSqLn/Owyi6S5wOiL9L+
         T8uypSEQ94K+tEmozaZyFObWF5SGXH65mDCEz+6uAypHHwDOsaZexqVBDBXbWLdhojQp
         bq0W90pUSgQPM0dPHkwL/lvbjqVp+3psAD0Q7jApWsl1r9tz5zOZzTzK5cpksKONlW0G
         dKxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkjljkYnJVUX+6laiCFOQ7sDjh7akbD4zzXC2/bjmPN8zLLMmUnrTyb+T6+0w4/HxtCxOQTZI8XT81Lyr08k5L@lists.infradead.org
X-Gm-Message-State: AOJu0Yzucg0Hc9tWKNDzJ/p+xz2ZGl0rUqIg1gZ8uWzqpeZsnD6zOakd
	MWFUqygc7sDykO0JYfSmDesMk8oH2L0egkxpgYZAt9wMl9AWNJIDV5zUMLVgCujDwg==
X-Gm-Gg: ASbGncsWc5RakRCA8GeaporkalcMLbzy3QBixRsZCkvaMfDNSHVGq3/UHkDPy5btibR
	vfZ4PEgu+6X7RrXJDXiOZJmYYiw8Rz0AKOlNOix3V5hstHcVgP0+R928NWH0n9iZEv+Cvp8BtIC
	cs8DEjtHQR0LPrcsNPxy+YDPdMRbf5URKWMycJP0oSv5RGrK1xgjY8Nrl9/Cu6C/2kIgSEqH7uy
	aXqysiQV2hK81NB8VfNrcIy4QGAZ7Oj0S1WgORXC5qgtgi65G96zmdUZB5W/p75pGLZSGdXE5Hj
	DfRTPIsaqqgrqBEbZD0B03fDUoyp4QsixapaHnxWuFm7nvvGd3M8kPlyxq5Hew==
X-Google-Smtp-Source: AGHT+IEOw6il7mDOYzfg80Vp5UmC2qNm3ax6rT9gftYx3483bHLkDut/HlymS/lHemQQjcW6U7fWaA==
X-Received: by 2002:a05:6a00:1823:b0:746:2591:e531 with SMTP id d2e1a72fcca58-7480b4974dfmr5191876b3a.12.1749057015947;
        Wed, 04 Jun 2025 10:10:15 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcfa0csm11731132b3a.131.2025.06.04.10.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:10:15 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:40:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Laszlo Fiat <laszlo.fiat@proton.me>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <rrtrcwajj4vjvbqzosskdnroqnijzaafncgckoh2dlk3c4njvs@twop3vyidmh7>
References: <aD8Bz4CkdnAd8Col@ryzen>
 <20250603181250.GA473171@bhelgaas>
 <aEAwxFysCgdJCD54@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEAwxFysCgdJCD54@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_101017_512334_92E1BFA8 
X-CRM114-Status: GOOD (  39.26  )
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

On Wed, Jun 04, 2025 at 01:40:52PM +0200, Niklas Cassel wrote:
> On Tue, Jun 03, 2025 at 01:12:50PM -0500, Bjorn Helgaas wrote:
> > 
> > Hmmm, sorry, I misinterpreted both 1/4 and 2/4.  I read them as "add
> > this delay so the PLEXTOR device works", but in fact, I think in both
> > cases, the delay is actually to enforce the PCIe r6.0, sec 6.6.1,
> > requirement for software to wait 100ms before issuing a config
> > request, and the fact that it makes PLEXTOR work is a side effect of
> > that.
> 
> Well, the Plextor NVMe drive used to work with previous kernels,
> but regressed.
> 
> But yes, the delay was added to enforce "PCIe r6.0, sec 6.6.1"
> requirement for software to wait 100ms, which once again makes
> the Plextor NVMe drive work.
> 
> 
> > 
> > The beginning of that 100ms delay is "exit from Conventional Reset"
> > (ports that support <= 5.0 GT/s) or "link training completes" (ports
> > that support > 5.0 GT/s).
> > 
> > I think we lack that 100ms delay in dwc drivers in general.  The only
> > generic dwc delay is in dw_pcie_host_init() via the LINK_WAIT_SLEEP_MS
> > in dw_pcie_wait_for_link(), but that doesn't count because it's
> > *before* the link comes up.  We have to wait 100ms *after* exiting
> > Conventional Reset or completing link training.
> 
> In dw_pcie_wait_for_link(), in the first iteration of the loop, the link
> will never be up (because the link was just started),
> dw_pcie_wait_for_link() will then sleep for LINK_WAIT_SLEEP_MS (90 ms),
> before trying again.
> 
> Most likely the link training took way less than 100 ms, so most of those
> 90 ms will probably be after link training has completed.
> 
> That is most likely why Plextor worked on older kernels (which does not
> use the link up IRQ).
> 
> If we add a 100 ms sleep after wait_for_link(), then I suggest that we
> also reduce LINK_WAIT_SLEEP_MS to something shorter.
> 

No. The 900ms sleep is to make sure that we wait 1s before erroring out
assuming that the device is not present. This is mandated by the spec. So
irrespective of the delay we add *after* link up, we should try to detect the
link up for ~1s.

And for adding the delay, it should be done after the check for retry count:

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index b3615d125942..92eb661babeb 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -700,6 +700,8 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
                return -ETIMEDOUT;
        }
 
+       msleep(PCIE_T_RRS_READY_MS);
+
        offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
        val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);

> 
> > 
> > We don't know when the exit from Conventional Reset was, but it was
> > certainly before the link came up.  In the absence of a timestamp for
> > exit from reset, starting the wait after link-up is probably the best
> > we can do.  This could be either after dw_pcie_wait_for_link() finds
> > the link up or when we handle the link-up interrupt.
> > 
> > Patches 1 and 2 would fix the link-up interrupt case.  I think we need
> > another patch for the dwc core for dw_pcie_wait_for_link().
> 
> I agree, sounds like a plan.
> 
> 
> > 
> > I wish I'd had time to spend on this and include patches 1 and 2, but
> > we're up against the merge window wire and I'll be out the end of this
> > week, so I think they'll have to wait.  It seems like something we can
> > still justify for v6.16 though.
> 
> I think it sounds good to target this as fixes for v6.16.
> 

Yeah. Atleast patch 1 is fixing a regression, so it should be included for
v6.16.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

