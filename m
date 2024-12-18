Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE83E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy1Hv7f5NOQcxmlYyzPB31q6qHS+YkVM6o+GdftYtbY=; b=uJl5Ht5FVmPVLqZXR5IHmYC4B7
	lqpEJvPwpuOKvLNu5GKWkgDHnGpA6Gt1Erw4HOruwaVd/BZ9CV5NN23d8PSexxv+m4R+z3OFjRtS9
	D6lZzOjpyPts3bT/keULp2NnliW6CUzrUDxf/4iwjavLLuJ4v3d5KwD3OmWdeUTREmr8G+fBEP/s3
	Z98UWDBabFHGAFJbhwFXeLtGT/BkZjmLgsfj1mGno0Mhs+NIgS3PTv+Y4oyLoHgZxSJN7LXALSazz
	uNIezrk3hvCxUHhmbaxyExO42FdFy5OSa7LCPxms7fKVGLoT1eF2cHeDeV5Rw60Y7ZRLFWZuzd3PG
	hsI5NiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrEp-0000000GFWQ-2dW2;
	Wed, 18 Dec 2024 10:25:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNq2t-0000000G1U5-2Hqk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:08:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-728e81257bfso5120801b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734512923; x=1735117723; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wy1Hv7f5NOQcxmlYyzPB31q6qHS+YkVM6o+GdftYtbY=;
        b=t/gLXuozPU+lS0wzx/bxluKuEtGo20GvHVeMmzPQwLATXNhQWJ9tntK++HeHQxF9FI
         8KRvEWI7XzXTspGXaOF3F1Qphn7G22ho45KpNPSpklb6xbmnlSUs43XBtzreksRYHXOf
         INIhfw+DHN7BJ59khMnx535sAC8cbDInBBYR2CiouAlb7gqRV3aFAHbMl+IOVoUPVq6f
         e4AGAH6zkrnJIJMTC1Nh5ZJZatuvBkxAVrE9xi9OOdoyoSmkyoX4lli0/82xLbIFxIsq
         3c2Le0pJmg1Ekd7Ghcw7rjv14Uj/6/LUtQTSsBbLr+L2oylQA3jLqliUoK4OozOGfUpx
         aQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734512923; x=1735117723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wy1Hv7f5NOQcxmlYyzPB31q6qHS+YkVM6o+GdftYtbY=;
        b=jnshdlXvZ1MqpzXva27GBC2s9KI4O9Z2UL6HAY/EexY3U8DNqD6XODsdHgGc+Nv9yd
         SQcJIIB6DsAMHP3o7z9VXlk3LY7FsKuAwr/3/2RR+hyFnHcLVw4DXZqfzL5GOsKxDsTp
         jTmQykq7nWwpMpySK7l4vTP/IR8WtMSlROnNab8ENsgm/d/yd7atF1gsU96W/PmlV3nR
         HudtpUXvLLUfvXNR8e9O+LlFc7yBCK6PmRrzKGXG53os+N55KHL8bsG7G5oR27ZRdRBO
         PMZSO6KihUdveESIWnT/I04kolhFfus2P/OkXv8PIkuCQ8ZwNcz4ij+9XZOAFlxycpcM
         dsgg==
X-Forwarded-Encrypted: i=1; AJvYcCVhvBC99jHQfD9Na2qswsfnqw5jYROHiIzAHS72lKqbriua+kjwFNwfllWckRmXxnWr8acV4KJsj5BNdVKqTd9P@lists.infradead.org
X-Gm-Message-State: AOJu0YwF9A+RxZb4gYh1UlUa+AkwK/o+uuQIlHUc3zFef9NW8ttRr34e
	pAltDdjicdCZKoOGNy0FNuftrSUVXHFdBjIEPg5c9ac34l48fTswt5uKQHJ9Ug==
X-Gm-Gg: ASbGnctTEMLh1XtULJ6seaxRHF9noG7DV169Oz4CtmG+QbEYOsC7IiWg8dc48LiR7lk
	SV0QDUxAxJtD66R4ORawea4bNmNYdiZIg4XYrjMD1/ei+L2QNSgD1eqXTUyzAwK1AvjT0MyqEsj
	R0/x3tNwAk9Zkhdp+QD411pqf7i9nXRTflaFVuj5b79vL5jksQocphdxPjZ54eZh1lM5q0Ym0/2
	NSdEiXr9j/LDPBqHj9/a3nS06keD77cHTIRWAVywLvbnaM+m5WX/AHGrVbjn0ikuCuH
X-Google-Smtp-Source: AGHT+IG37gQZUixcAS2wt6FAy35zDXkREGTgBmnLoB7E2HkZAUyQek0tK+EgYpBTTg5mZeTEdfkKVA==
X-Received: by 2002:a05:6a21:9002:b0:1e1:b28e:a148 with SMTP id adf61e73a8af0-1e5b45ffc3dmr3602999637.5.1734512922868;
        Wed, 18 Dec 2024 01:08:42 -0800 (PST)
Received: from thinkpad ([117.193.214.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad749sm7997622b3a.138.2024.12.18.01.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:08:42 -0800 (PST)
Date: Wed, 18 Dec 2024 14:38:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint support for
 STM32MP25
Message-ID: <20241218090834.bz5htywl3sjbzq6w@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
 <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
 <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
 <20241216161700.dtldi7fari6kafrr@thinkpad>
 <fdc487c4-cbdc-45ac-a79f-aff2b8ccafcc@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdc487c4-cbdc-45ac-a79f-aff2b8ccafcc@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010843_590194_177ACB57 
X-CRM114-Status: GOOD (  23.86  )
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

On Tue, Dec 17, 2024 at 10:48:43AM +0100, Christian Bruel wrote:
> 
> 
> On 12/16/24 17:17, Manivannan Sadhasivam wrote:
> > On Mon, Dec 16, 2024 at 11:02:07AM +0100, Christian Bruel wrote:
> > > Hi Manivanna,
> > > 
> > > On 12/3/24 16:22, Manivannan Sadhasivam wrote:
> > > > On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
> > > > 
> > > > [...]
> > > > 
> > > > > +static int stm32_pcie_start_link(struct dw_pcie *pci)
> > > > > +{
> > > > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > > > +	int ret;
> > > > > +
> > > > > +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
> > > > > +		dev_dbg(pci->dev, "Link is already enabled\n");
> > > > > +		return 0;
> > > > > +	}
> > > > > +
> > > > > +	ret = stm32_pcie_enable_link(pci);
> > > > > +	if (ret) {
> > > > > +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > 
> > > > How the REFCLK is supplied to the endpoint? From host or generated locally?
> > > 
> > >  From Host only, we don't support the separated clock model.
> > > 
> > 
> > OK. So even without refclk you are still able to access the controller
> > registers? So the controller CSRs should be accessible by separate local clock I
> > believe.
> > 
> > Anyhow, please add this limitation (refclk dependency from host) in commit
> > message.
> > 
> > [...]
> > 
> > > > > +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
> > > > 
> > > > Hmm, so PHY mode is common for both endpoint and host?
> > > 
> > > Yes it is. We need to init the phy here because it is a clock source for the
> > > PCIe core clk
> > > 
> > 
> > Clock source? Is it coming directly to PCIe or through RCC? There is no direct
> > clock representation from PHY to PCIe in DT binding.
> 
> The core_clk is generated directly by the PLL in the COMBOPHY, gated by the
> RCC
> 

In that case, phy should be the clock provider to RCC and PCIe should get the
gated clock it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

