Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF3EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82gDKALWw0Ekg/l8MKhauenkjup0NAxqqSYjA8q5Flo=; b=s8Q+CyneW+A8VjmnlJ37PhXh+K
	pWLlS2z6WLccpvlfGkY5pMwamtOv4J6nQzE8sY/eSATLTidSGGdCSwHEDSPvsJRa9CtC9qmWd/xl7
	CtN00+aRD9Wf3PFu0kxsD8SAAiTQhB+FPtVcbKy0LW/QG2d5e2bjo6oEVUmnVDw8nMyTmSJJtlioD
	mp0/CzdFmQ6Gtg4PX8Oyn9tVgPTgtrdOgtRPAjwUWu8kWDn9sukk4872cQow2vMQSMfF/oVn2Evls
	xtuF2eAUr8hOi5VxvbZGH2DPeLupY2KAo+NghXpzx+vkUP94GVv3wGs1e7H6/JeptAwFdqkR/Rjvp
	EkqOfUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDnW-0000000AY7r-1I55;
	Mon, 16 Dec 2024 16:18:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDmP-0000000AXvw-08l2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:17:10 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-728ec840a8aso4597613b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 08:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734365828; x=1734970628; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=82gDKALWw0Ekg/l8MKhauenkjup0NAxqqSYjA8q5Flo=;
        b=EV4jF6jdwbw47bTpq209W9pR4v29QtZKaBcus+kmDN+WKh8fpssmaHmYtDYw/mngc7
         YScNHCtgJYJz2ZOE2TxaAzB+X/Wtk2Lg+nzqsEYSvo7V2koV2fAtP59T1e/Epp+VUcnc
         Av7UHMHgx4MtHe6StbPgyVTpyl4SwGr/p1xRYfQR0LwxHWd+fJ7uepocTN0FVdMaBcMc
         TqdTVC5zsRyzhub5rQw9J1WkC7hzEyPwRbciV9OB7sY9DFKumyArFqwxwOKOfTmSzJ6I
         ERl/8tvwqVHYvtT0j65P0UFcqCiDAH23ELl2W9M2CT0tPcPlFvL4SmjwKjvxcn2Tm/sX
         xmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734365828; x=1734970628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82gDKALWw0Ekg/l8MKhauenkjup0NAxqqSYjA8q5Flo=;
        b=CsDknV9J4pj9H6ED37kiE3S6DNe+t4YBUUWmYlfSnpmwziLi0WtOAICtVEGAldeHWz
         PIbzjVXVMOdQfZHqNnPUARw47TZ4bzzWn5HtxO9DAP3evqtQ+oT/U0muV8UVF7zG2Woo
         ApUzOMSPW1c7etHNl6qYrIteFJvgl1FCKclBuTi0XcB3zuL8nKeIFdzA6/xIQFoHAA/4
         X1tPd/LdLt1+K5sqpU7Jpo2HS4ITS461Jrqg3+2j+RZItczmAurk30u5MijzVVeeQh4/
         qYPiEJrGTEPHZhIr+dib4z+AhtyTwEze+NGxOLdHuON4EcE2oweqHE795ThOcyjv6rts
         mpTw==
X-Forwarded-Encrypted: i=1; AJvYcCXuPgOpymjw4rNNGQX4zbiXl/UDvrP3U6UWA7YmKJWIASgVMFTDZJEhHyXckTqUE4I66WRFkWc1T7ygBhuApmqk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3dAkTcl+gmYZTtIPajydlexvjQ3xvZMzvobRQ/PRzlgToob52
	ZaQVxMTl5HYoMdU0UoMfj4BISnfFIbXdzeRBAAhXqiluN4sFW9Rwr0Qrf1+ZCw==
X-Gm-Gg: ASbGncvOKSPl11QU9T1O5HE7QagFRZsthn/RkEF7OvcSmk5UbthX9zbNg8U4PqPU+DC
	UnnXHbT8HSRN2+G9Qhn0A++eJktPnqHZCE0LcOZB62w9Yrdxhhl0106LWG02dWoIuGY++YiD2E+
	tKiOS15EOeyKW9eO9X0dSx+VURy/A6V9TYwWsez5gQT9TCiTFE07evMDR1zhlw4ODcK1O64UuJ6
	BwygZFCl4hh/BHacyVAO0sR3lRUYrAqtKRk7VFzRkJRCMUVlcM269Zmn4wZBVJDsB3k
X-Google-Smtp-Source: AGHT+IGvG6qXEoCqCkROvX+b6dhtMyqPUbkI3UVWtmJgHt1xZMsm2fyfByqDiqxFQpxzhlW12Qg/Wg==
X-Received: by 2002:a05:6a00:3688:b0:729:35b:542e with SMTP id d2e1a72fcca58-7290c25a4bcmr16844563b3a.16.1734365827870;
        Mon, 16 Dec 2024 08:17:07 -0800 (PST)
Received: from thinkpad ([120.56.200.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bb3a6dsm4925657b3a.136.2024.12.16.08.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:17:07 -0800 (PST)
Date: Mon, 16 Dec 2024 21:47:00 +0530
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
Message-ID: <20241216161700.dtldi7fari6kafrr@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
 <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
 <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_081709_084476_EC2906DF 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, Dec 16, 2024 at 11:02:07AM +0100, Christian Bruel wrote:
> Hi Manivanna,
> 
> On 12/3/24 16:22, Manivannan Sadhasivam wrote:
> > On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
> > 
> > [...]
> > 
> > > +static int stm32_pcie_start_link(struct dw_pcie *pci)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > +	int ret;
> > > +
> > > +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
> > > +		dev_dbg(pci->dev, "Link is already enabled\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	ret = stm32_pcie_enable_link(pci);
> > > +	if (ret) {
> > > +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
> > > +		return ret;
> > > +	}
> > 
> > How the REFCLK is supplied to the endpoint? From host or generated locally?
> 
> From Host only, we don't support the separated clock model.
> 

OK. So even without refclk you are still able to access the controller
registers? So the controller CSRs should be accessible by separate local clock I
believe.

Anyhow, please add this limitation (refclk dependency from host) in commit
message.

[...]

> > > +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
> > 
> > Hmm, so PHY mode is common for both endpoint and host?
> 
> Yes it is. We need to init the phy here because it is a clock source for the
> PCIe core clk
> 

Clock source? Is it coming directly to PCIe or through RCC? There is no direct
clock representation from PHY to PCIe in DT binding.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

