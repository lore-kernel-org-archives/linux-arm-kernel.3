Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11531C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=; b=lGvQbsegSCI3QcDKcYT6BNhuJx
	mazzyfeyIFDVRwMaWd/ICVLshWV9RS1zMz7+jOPAPjdHVXN1yp+Ox3NUwgVMD2i4OJcnAZ8IeDjqt
	eC8Rj+/cOfqyJu16Li8Vh0XcGWB28MmzTQaTdGWnNG9OZZynT/Ehxkuv8s7hzdxThMQR/Q7PPkaw5
	0CYYCBzBBUUTqhomI+UTLHiLOrBZtDTBz41CPVmgl/2hDtdnAEG4DD0bai4Kbfj6oUrLpOn84hSfB
	5yV8ITUNgr3pSyGJyOPobnKlS4o6YeKtb2yG0q9qLQQekz5QoeP2CsqbJBAxW5+b9FqKEQnsGyG9a
	f4s/JNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBynw-000000080ij-0VvZ;
	Mon, 05 May 2025 16:36:32 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySv-00000007wSe-3cVg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:14:51 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736aaeed234so4114816b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746461689; x=1747066489; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=hc1SoMqKbgG9EpqO7vDLl0eFJ89XMtzxvTLOaQm+/8z2jf+nB+kOEtyNA+2PBc2j0V
         n570K3zfHgcJC9PoKaweXxNs5zxTQ1CoYNoN8uEyqB3YZxzFa/wzXO/bd6QkG/m9YONC
         w5LYsz54Jpxo8WzrRNQaRbM4pAHUK/VyxhPri0LhgFmNL8OJmDLYjlR14D3elBC0UVKA
         3G7h1CQNqqJyK+k05x8GAvQLct1/Zh9VrYiZoeAzOcOBBXvLGubGjWrevFgrN0FJuY2X
         2sbkE8BZ0xtv0H8PPMUv8jF5Wu/MngZX3xG46mxaTJqUkxdvX03VKZZe7MTAkSPGh9w1
         bbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461689; x=1747066489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=kpt6dmV/B/FhsVJX6tWqkwcFWLRFrsj97OadWSY/ZRMyP3WKnWTk474qtl8N8mjVXO
         v9CkEu9ZTvwP5M/nGdyczuMXB5H2iVRME5pO3+/JkV1/0l15oTUeSnbgpFj3O1NyF8Sf
         pEvjCwMoZWugEE4wQiVphkyyuQkBj2otQA9rQDNbJZNj3OK62BVEIo1u+eC4dOeahuwu
         eMCMdQRkYer1g+r4GU/mAs2roSB9PcJSIHkgVv0AtcEQYiYdmi6HW//gOQLg3rWWnbi0
         JSsn2gT0XipRaG/tfkIBRV0Ck3it/nWecxQ5Q/KTfhAoaqz8dv4iZ3l4qayL5+dwxSlj
         YmhA==
X-Forwarded-Encrypted: i=1; AJvYcCXkPUq7rbkBSi8Na2ebYISXzCQh9l2jwV4aLl0AZ8UZE/T8/5puN1joJAndTLEtFTw5nPqnfNBR+dD2CBl+8vGH@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/wwb/RiyQWVoWX9Umifp/nu7nRswTA1YTWD5WqZJWMtBKECS
	LPtmr4ZGGDB5uhFo0Kvud7OOY/bg2B+SwG80DbrULZdzLh0ol9B8Ca4zhLzFuw==
X-Gm-Gg: ASbGnct/m6gGVzjtfhh1+NJovjQ+SuaKgpTXudbMr+QVSv06Hyz+vhGLpPV22q8CYI8
	aLf5NwxR6dCSqME4KVkzyKl2S9BYj+M8KqACsh7nwPiasLdcBnmX6gNdhZ/X66ify6YG6vZ+lS1
	tAkPRxpMt5bcVSzzDwhC4oeEK3BYHwepxoU21DkGEvgG822xMvpSlKCePseAieFEemTMyC4C01Q
	vr8wAjv4uV7hvj1IVL+YWxCb63D8J+r2XwZhZXiEWajs068/ZMdbW42pCUjoHuV5Oh7N0BTQlfs
	syE3jqp8rSJzVst5GBYNEldnY1WPPyjq7Qa+V7r+X3SNsPkkbOI=
X-Google-Smtp-Source: AGHT+IGDlihVIhUXhK0fIymH88F2X8FV0rkQuFidNrc3Roi5FkXvbM1MtssO/KpT/pJrJT2EqnO02g==
X-Received: by 2002:a05:6a00:9095:b0:732:5164:3cc with SMTP id d2e1a72fcca58-7406f17ac90mr10027660b3a.19.1746461688655;
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Received: from thinkpad ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a1c09sm6964138b3a.168.2025.05.05.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Date: Mon, 5 May 2025 21:44:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <tflie6ncttih5jxn5xg3zvktidqv5jaqsnsuryy56qfq7pghxd@ippj4lhsdqme>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <aBjTpglI5_P2Q3Aa@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBjTpglI5_P2Q3Aa@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_091449_918848_23B2E06B 
X-CRM114-Status: GOOD (  24.07  )
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

On Mon, May 05, 2025 at 05:05:10PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Thu, Apr 17, 2025 at 10:46:31PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > @@ -1571,6 +1652,9 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> >  		pci_unlock_rescan_remove();
> >  
> >  		qcom_pcie_icc_opp_update(pcie);
> > +	} else if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> > +		dev_dbg(dev, "Received Link down event\n");
> > +		pci_host_handle_link_down(pp->bridge);
> >  	} else {
> >  		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
> >  			      status);
> 
> From debugging an unrelated problem, I noticed that dw-rockchip can
> sometimes have both "link up" bit and "hot reset or link down" bit set
> at the same time, when reading the status register.
> 

That's a good catch. It is quite possible that both fields could be set at once,
so 'if..else' is indeed a bad idea.

> Perhaps the link went down very quickly and then was established again
> by the time the threaded IRQ handler gets to run.
> 
> Your code seems to do an if + else if.
> 
> Without knowing how the events work for your platforms, I would guess
> that it should also be possible to have multiple events set.
> 

I agree.

> 
> In you code, if both LINK UP and hot reset/link down are set,
> I would assume that you driver will not do the right thing.
> 
> Perhaps you want to swap the order? So that link down is handled first,
> and then link up is handled. (If you convert to "if + if "instead of
> "if + else if" that is.)
> 

Makes sense. I'll incorporate this change in v5, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

