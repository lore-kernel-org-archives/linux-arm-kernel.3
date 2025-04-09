Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BB6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+/H0ybkUq7HVu5uBj7V7TDncclF2UN1EMmyx3scUCw=; b=MNCJUOZ2QoNSvGT3dJwwi5IWw0
	Wcae8eAYBh+JxLzw8RWPZya4ZShFWC1BR3TK0dTW9TxWwDfnF7sXrti3E8yKBX66BGqDlGlTzq/Tv
	zDVMv4RzEBe20HnuDHLuvTQTQFyDnZH+DRhH5G7fVTAtUQkmPe2cc5NfWTwzY9TSnrZTxdUDKXDLI
	85WS5B6nKm1pJChBkHZNVqv1ZXgrkuqjOnAwUvaROu50qjR9ZDDhPAdH9rm8PQWsWwYU3Wjzq+KOu
	wBjKWO0hJmqspIorLk2yzgDV7bginXt1rzrU9u32ebGW16Q7bHZg0F3t7uOs9itkD3TYIf2id5Z9A
	7Ulsveqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Yyt-000000080U4-3Eps;
	Wed, 09 Apr 2025 17:12:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YjH-00000007xX2-01Un
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:56:48 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22401f4d35aso82126705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 09:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744217806; x=1744822606; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+/H0ybkUq7HVu5uBj7V7TDncclF2UN1EMmyx3scUCw=;
        b=jnSdPnXX+D6R7M/OrGEnXN7Gdan85E9etvfEEw86kIauhtX834mMNbfKeZRumn/iDX
         HIbHxDymY9xUh1eDXIP3OHYbw6L1liAagDMt5Uzue6IWlvYmpKGcpOw5/uept+71z6yQ
         dFob8dGsMVzeb+lPpzeSa9MHIBQPh0hUZaMSsAH6bHum/Bt8XMsQN6LIeotgWZ4+EFCE
         /r328PSp84AuHm8UmYBEp4e47XdS3UGKmIKBWeGhiMIw57Zb9W42pEaHjQEu3Uim9G9B
         WWe4cF5LIhtE0z+Ix5xhWwfRroKPUfKFTs198kVc3aHFhA8GQ7qQr4S4y8UrM5hsYl9X
         aaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217806; x=1744822606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+/H0ybkUq7HVu5uBj7V7TDncclF2UN1EMmyx3scUCw=;
        b=J2I2yu1GlKWY7jApjNzio6koD4OSQENmq37WnvvdjCvIg4qcSLwehgB4u6io6mkEf+
         UCdrUQNJIV65rU8txhz12qqp/ttUl7YQXcki5YzFe07VpyPCDGy+N1ZLYlEuQhhJ3qOw
         lwVeS622A0nsS/Yjqn5gN2bwkexkCW356Mj1xb1+aJ1luBML7I4WznwzsLkW0/RHb81z
         q9wJ4O7urJWK+l/1ICil2BbRgZ1BfdUmtwh6fFK9JIiwKxrnIbGkywUntJwwMcMKBoag
         c9xnqmTiy0pN6Jx0aLj71pHUue3ZSoq/AqthbF2kjs1EKXOwLxOtcoXIHt2oxpkoH8Gt
         NhfA==
X-Forwarded-Encrypted: i=1; AJvYcCUDnwOIg7Mh/ZRS2lUZgNJn7GSXh6e/NlofNJnZZ0B5qBfHfaJBHtgW3tfPmv+U/qBysJOWz4jcFNIsW2zwLE4j@lists.infradead.org
X-Gm-Message-State: AOJu0YzOwqqYQffNz6NOnpFlIs5mDM5uaQC1y4CCz8CTDQBNQ7g709vq
	G1nENdZuGfa4oApLD5r/u1Q/PBkCTfPkQP4jY9Rtld7e3d3IZ8g8KhlH7I8fVA==
X-Gm-Gg: ASbGncuatZQElO2anD65OEY1a6fMSyLNaXNKm21ywdBCB/BuW+sbJj5n3652R3UDFmM
	UwoksBaQ7EPbDnrjDm8+TrnapEDFQOIUWhAtVD+847UfP4t4kqSFxDHAU/Cwf5ol/gFJgYoyzQg
	6PhKnYcfEn7bx3fp4zHock3wi7F1/67ULT/N5sJq/S8I4+cl8bcf0foOgJNuJZd6fYA1Vu+f2s7
	rFpAO3n3iVR6cll8fYjlgf47SYL6Z/CO6xiiblQ4QxMNIdh7rszDbWCI+zVhQZej3DrHYfNIloo
	ZHiteo8TBVnFINx6SsTROku2bf7AO6fqtAI300ySUGaysKALORw=
X-Google-Smtp-Source: AGHT+IFz5w1COIo2PYC62wmrQx0adK5Tc3rBe8Psp1oZp/1xQGb6NWLXzX+rUW4TKFX3JOsAMmmtsQ==
X-Received: by 2002:a17:903:1787:b0:224:1220:7f40 with SMTP id d9443c01a7336-22ac298441fmr50556105ad.3.1744217806079;
        Wed, 09 Apr 2025 09:56:46 -0700 (PDT)
Received: from thinkpad ([120.56.198.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cda517sm14384085ad.250.2025.04.09.09.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:56:45 -0700 (PDT)
Date: Wed, 9 Apr 2025 22:26:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, vigneshr@ti.com, 
	kishon@kernel.org, wojciech.jasko-EXT@continental-corporation.com, 
	thomas.richard@bootlin.com, bwawrzyn@cisco.com, linux-pci@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com, dlemoal@kernel.org
Subject: Re: [PATCH 3/4] PCI: cadence-ep: Introduce cdns_pcie_ep_disable
 helper for cleanup
Message-ID: <itmjxj5kuy7cloeplhwqxyumcx7rrzvdudxilg6fswrtxqcl7l@oa2uvswe2ups>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <20250307103128.3287497-4-s-vadapalli@ti.com>
 <20250318080304.jsmrxqil6pn74nzh@thinkpad>
 <20250318081239.rvbk3rqud7wcj5pj@uda0492258>
 <20250319103217.aaoxpzk2baqna5vc@thinkpad>
 <Z-vN8_-HJ0K1-1mH@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-vN8_-HJ0K1-1mH@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_095647_050103_D71576E6 
X-CRM114-Status: GOOD (  22.21  )
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

On Tue, Apr 01, 2025 at 01:28:51PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Wed, Mar 19, 2025 at 04:02:17PM +0530, Manivannan Sadhasivam wrote:
> > > 
> > > While I don't intend to justify dropping pci_epc_deinit_notify() in the
> > > cleanup path, I wanted to check if this should be added to
> > > dw_pcie_ep_deinit() as well. Or is it the case that dw_pcie_ep_deinit()
> > > is different from cdns_pcie_ep_disable()? Please let me know.
> > > 
> > 
> > Reason why it was not added to dw_pcie_ep_deinit() because, deinit_notify() is
> > supposed to be called while performing the resource cleanup with active refclk.
> > 
> > Some plaforms (Tegra, Qcom) depend on refclk from host. So if deinit_notify() is
> > called when there is no refclk, it will crash the endpoint SoC. But since
> > cadence endpoint platforms seem to generate their own refclk, you can call
> > deinit_notify() during deinit phase.
> > 
> > That said, I noticed some issues in the DWC cleanup path while checking the code
> > now. Will submit fixes for them.
> 
> Could you please elaborate quickly what issues you found?
> 

(1)

dw_pcie_ep_deinit()
	-> dw_pcie_ep_cleanup()
		-> dw_pcie_edma_remove()

But dw_pcie_ep_init() is not calling dw_pcie_edma_detect(). It is called by
dw_pcie_ep_init_registers(). So dw_pcie_ep_init() and dw_pcie_ep_deinit() not
symmetrical.

(2)

We are not calling pci_epc_deinit_notify() in non-PREST# supported controller
drivers. I think this could be fixed by moving it inside dw_pcie_ep_cleanup().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

