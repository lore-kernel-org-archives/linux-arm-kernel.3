Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD10C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LV3SY2EwFIN9MVVGnq1S2+QMD2WUzdffJmfnCXZtj9k=; b=AScH5J/eVHD14uf9NSu6kzIkto
	bTQUpAc25Pp4uwL3oPeAYMD8oAXId/29x3PAcJN0Kkl9aXaie8elkYtAY1H1UOeyJjVRflU3wyfpI
	9FP982VeMslbwxdRDaLlfyVtxoftCBHc4e2Iqik9rRt4PnPbRDD4IeHjO3lHmYM9T5hFLHNQfi4wM
	cSe6iyu4wza5+NSR/SH+Zc+ANpgDh9IWYHPqvCj1OF4OVmZUqIjS+fayDF0ZtjNLxVp0lkjbfLkwJ
	m3C1GmDQqDB+oLt3kvv3oXF3AVhWNGPjn/xX5JkJDNr6Q2vxMHgBU5D7OjQDsXMDCeRsEEB/aXEuK
	n4ENs0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAgM-0000000FeGT-3SiH;
	Thu, 05 Jun 2025 13:30:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAY9-0000000FcFZ-2XFW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:22:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-234d366e5f2so12189145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129749; x=1749734549; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LV3SY2EwFIN9MVVGnq1S2+QMD2WUzdffJmfnCXZtj9k=;
        b=IDzPhbqW50wIR0vdYgSu7R50fFXByC2LDPSSaaFHTJj9bQ9YVlppgx+QyBNR6b1/ze
         4tkQ27kB0jTVl/loeeLl6t3twTuX2UfIYApthjeYvwR95X9+Ns99ORfdTz1VOFB0/MSr
         hCGeWWUimiUkAw3zp0/U5Qhx7S8g2nw/VCIqIup7ZsoLN2Rgm4XoxtzrqnOgCbatcvvK
         FKvKCzN2YFukJq4MctLitR/RXcqTmO80LBM9kUCt4j9y21VryqezQ9pfgNbN4Dj2Y1OC
         0s7HzEziaSIXxZYmL4Kw+YxTxdi5zD56XulMOJJcleD//yTTVk9xGkR3VDB3QLzkvJ3f
         h3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129749; x=1749734549;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LV3SY2EwFIN9MVVGnq1S2+QMD2WUzdffJmfnCXZtj9k=;
        b=BRUnp9Bzpmkq1A1lgRtl8so5G74liiFeQWzlRr8g6HCTQRuaXXPTqTgD2FgruRQ0UR
         VXd3C6ITJDJLO73gW2nEScV1K6f55u6NTLqzQ2M3H/nDNsUQMreN6KXTPNHjN+0pTC2O
         zeaBz+uucgvq8MI6sQouZ6w/lHXEAbtkLPJoV6ZTYMZiUjAQ4tnSwWUpp7qaM9Iavm8n
         mtAQ2hjfko8X3BWg4YjMKIR/ix5AWwl6ANqRyN7LaBJ6mXgTMcr7VDD9V+xqRLWK6M2g
         vBIqNqcBd35eWCwaG4FXH4bD2vJn2FP/8fTyyMQ/eUTrj/uX3hbPBmcjiYJhJrsX1s5y
         Q/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVuknWa3eeyuCg4v+PqUPoxFNVagiW2rToYJGh/K54FbQs/iEw2ZzHHEAghUpFNlMcI2IesGc8MbsTTbO6lK45r@lists.infradead.org
X-Gm-Message-State: AOJu0YwxpCqSS65cUJPKCh5OqiRLQT8c3XINpQ5eMpi4DegGcPNNJwxw
	EyCu9lO7+eak8nXR+ZkQ7C+J9IOtXsff9uE3xyK2kcZh3/u65Q9wp/uf0jheyOlVCA==
X-Gm-Gg: ASbGncvYZ1akXEshVQMmOCHfwO6/04K40ZcRY/C0LJs6douTHFMff/cuH9WAdQCvWcq
	ai4TyNlRZl/ZSDDSNg8U6ZHf60SYYhURfc1cp2z0aT92Z8cexH9HUDaxVTs7dffM54pboolAZYt
	E5tBlg/TiLrsFpEa48iye/+XW24hsDvK1XAlS+RKG9pA55wM/n9kJKElvdq7w1kTmPMnQ7O4JMO
	kIWXmdvS5En2wJ2x+tVljKBYj6tODCuGZaPsbcapVUVkkWU4qobhjpUaOB5lxSxsOgFwKK9iHVr
	5Z8yd93GpyE9Ix8dKU9qpmAaTafKpXWbchXIRjfEai685+/cAYYPimQrOnIptLj00K/JsVgqdAn
	X3kaWyw==
X-Google-Smtp-Source: AGHT+IFEBRSheUsMgn6DbcDEdV5Hlv1VHBEQineqLpLn6Kld/K5JudvAtaK8XUU4yswu66c9Km4KIw==
X-Received: by 2002:a17:902:d48c:b0:234:d292:be83 with SMTP id d9443c01a7336-235e1016969mr104503775ad.10.1749129748735;
        Thu, 05 Jun 2025 06:22:28 -0700 (PDT)
Received: from thinkpad ([120.60.50.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd8e2dsm119379115ad.56.2025.06.05.06.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:22:28 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:52:21 +0530
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
Message-ID: <fgd5dlxthuvjfszidyvcxn4wb37k5hgixvar4wbgofee6knkpi@4xldvqn6x6tr>
References: <rrtrcwajj4vjvbqzosskdnroqnijzaafncgckoh2dlk3c4njvs@twop3vyidmh7>
 <20250604184445.GA567382@bhelgaas>
 <aEGNefEgf56P-mBM@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEGNefEgf56P-mBM@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_062229_645672_38BDEDB1 
X-CRM114-Status: GOOD (  25.13  )
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

On Thu, Jun 05, 2025 at 02:28:41PM +0200, Niklas Cassel wrote:
> On Wed, Jun 04, 2025 at 01:44:45PM -0500, Bjorn Helgaas wrote:
> > On Wed, Jun 04, 2025 at 10:40:09PM +0530, Manivannan Sadhasivam wrote:
> > 
> > > > If we add a 100 ms sleep after wait_for_link(), then I suggest that we
> > > > also reduce LINK_WAIT_SLEEP_MS to something shorter.
> > > 
> > > No. The 900ms sleep is to make sure that we wait 1s before erroring out
> > > assuming that the device is not present. This is mandated by the spec. So
> > > irrespective of the delay we add *after* link up, we should try to detect the
> > > link up for ~1s.
> > 
> > I think it would be sensible for dw_pcie_wait_for_link() to check for
> > link up more frequently, i.e., reduce LINK_WAIT_SLEEP_MS and increase
> > LINK_WAIT_MAX_RETRIES.
> > 
> > If LINK_WAIT_SLEEP_MS * LINK_WAIT_MAX_RETRIES is for the 1.0s
> > mentioned in sec 6.6.1, seems like maybe we should make a generic
> > #define for it so we could include the spec reference and use it
> > across all drivers.  And resolve the question of 900ms vs 1000ms.
> 
> Like Bjorn mentioned, when I wrote reduce LINK_WAIT_SLEEP_MS,
> I simply meant that we should poll for link up more frequently.
> 

Sorry, I couldn't decipher it.

> But yes, if we reduce LINK_WAIT_SLEEP_MS we should bump
> LINK_WAIT_MAX_RETRIES to not change the current max wait time.
> 

I agree. And I like the idea of having a generic define which Bjorn suggested
for the wait delay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

