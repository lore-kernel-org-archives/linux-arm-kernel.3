Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA307C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQhuTT3keTFG3C8+wYIEtpMC3dYXL5RKzFQ+SXkD8fQ=; b=IXe7tWYYjP+2+yq419AjNnhiWJ
	ZWGBGI1wN7114UbkH2NJURexHqlDN/Sl0V6S+uqwGggF74fLi5/v50DI1ldx6ZF2qLVDC/QS96df8
	LMZGg+Q+0hvipwsTS7sygnh4D0HLnzRUSM8c3SdoAnGNTkMsrpTw1P5Si5nw1X86FUgpzb7kmJ5Bv
	OIUSyI+94ubTT55pczdYdlZljNyyQb12LTCcyD0LSRJghKeUsclsgoJ+ajJElZkMiD3wvGdmQhmKM
	iDZRE1WrBaYhKAIA7ENc53Tmk35N2MPqqwkLCGTDFHQGzbcFrBzYVptWxCIAn7lG5Y+p+RhKhbWYM
	QgRBXg/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqKX-0000000GNwP-3g3g;
	Tue, 25 Feb 2025 08:30:17 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqJ1-0000000GNn6-1ZKm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 08:28:44 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220e6028214so114838925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 00:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740472122; x=1741076922; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQhuTT3keTFG3C8+wYIEtpMC3dYXL5RKzFQ+SXkD8fQ=;
        b=HYOzIQvyA7QBiqG4n5hNGDo1EZafBWUCnoPs9R53aqXszRLzh9IpormUd8PgnFGV/M
         SJ0w+cXJPyUmasbVV3XZ+84GpVnDmc8bzWq93Tj+EsjoQz0dfAkfrZL00TdAd6DSxdeO
         w2VFViOTMxGQCJcCs3hcbqASz12hq1tklGrrcYCXt78tM7FlDgpSlpbG5kfsK5Lhwgb1
         G/yl1c4UoxZoPYMdxDrme3C8Xv2KRB+BrDFD0toHmiZ2mWcot+Vfm/wxlwNlBc//OI3a
         o5a/VfTe1hJdBoUQSIRTVzV75jBfADaWf12ZvP1XItD7A1aURXIgJwkiHxCbKTQE128y
         bWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740472122; x=1741076922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQhuTT3keTFG3C8+wYIEtpMC3dYXL5RKzFQ+SXkD8fQ=;
        b=dxVY9+EnWdmJnd72QBf97gf8HokVwlA5emqOaGrzPuROn5sZqlf6z/Q+boivbVwBTf
         N5OoCq0fI7KN2URrSADy2E6eBdcpzA82cAAwhL+3eD2A2Y22hmcgdUMgKR2Tx8UQJp4N
         4tbiuSUTSVqOvJLaqIHna4OofU57fCW6Zm7ovIj9R7JjxN9yvzmUEVNjks8KLJZywV/U
         NxBpVMrToGT88sVctlgx90PvOICFCnTRlm/4vAcs0m3ZFVw8oK85JZ11b9QRX8u3zOVK
         piBFpbIyqPr1TAZU1I6VBp4gU71mQCqeLL5RGqGbA4nvU7P5a7or96TNwW04UgBht3r3
         i7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTU/FA1MZzS6maUbqftBcgqF6f3J4//iHXTcwTFQii3PWa6xkF/fQ6NJWJL/FTUqwrm3wkPKWjrEJBeXXelb3y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw12y/X+U2sezMYVxkXz2V/70VdfZ+gdtWF4AEavY1ogOq+kbkr
	JYIyqS7Bf4X+DUsMMZpJXJpTacKiOxXiTeBU7RuTaDETuhvdDfWPpN1iANfJcA==
X-Gm-Gg: ASbGncuXQ0uWXfWhY2EN7/m/Iox9M5g8Q/urBXg11pt//HYOA1uXWDHigPzESWUNiWS
	cp+2dg9dIcpT+Fe4easFG1cSyylXc/MEWZBbU7vm2lCJtPVz7SY7k06gE8KUMLaIAYBij3P3C9+
	FwdieANsuYlmT43p9YS1lHCCDi+UUnC0jqw9Uy3ZMBMAaZsThnzpT2UN0yqCBYFvmmMZquUfcIx
	l7sek3qV3qVKd1gThqSiK+U0lo+qHZyZXTyIUIiFH8ugh7wns3J1HAde/ZAxaqrYvjCU9qpxbR5
	+00hSVltiNEoJRRB/muYpT9Qymx6NOLv9Q9u
X-Google-Smtp-Source: AGHT+IHEpwYAv8u3qb59FV+xDfGctwCas/kzce4Z4IGvei21yGE+B1pj/P69NtHMGX6VmXsFeRHsJg==
X-Received: by 2002:a17:903:1c1:b0:216:3466:7414 with SMTP id d9443c01a7336-221a0025b25mr313420375ad.44.1740472122399;
        Tue, 25 Feb 2025 00:28:42 -0800 (PST)
Received: from thinkpad ([36.255.17.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0b7790sm8728625ad.254.2025.02.25.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 00:28:41 -0800 (PST)
Date: Tue, 25 Feb 2025 13:58:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	fan.ni@samsung.com, nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 0/5] Add support for debugfs based RAS DES feature in
 PCIe DW
Message-ID: <20250225082835.dl4yleybs3emyboq@thinkpad>
References: <CGME20250221132011epcas5p4dea1e9ae5c09afaabcd1822f3a7d15c5@epcas5p4.samsung.com>
 <20250221131548.59616-1-shradha.t@samsung.com>
 <Z7yniizCTdBvUBI0@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7yniizCTdBvUBI0@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_002843_423296_9721C912 
X-CRM114-Status: GOOD (  34.71  )
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

On Mon, Feb 24, 2025 at 06:08:26PM +0100, Niklas Cassel wrote:
> Hello Shradha,
> 
> On Fri, Feb 21, 2025 at 06:45:43PM +0530, Shradha Todi wrote:
> > DesignWare controller provides a vendor specific extended capability
> > called RASDES as an IP feature. This extended capability  provides
> > hardware information like:
> >  - Debug registers to know the state of the link or controller. 
> >  - Error injection mechanisms to inject various PCIe errors including
> >    sequence number, CRC
> >  - Statistical counters to know how many times a particular event
> >    occurred
> > 
> > However, in Linux we do not have any generic or custom support to be
> > able to use this feature in an efficient manner. This is the reason we
> > are proposing this framework. Debug and bring up time of high-speed IPs
> > are highly dependent on costlier hardware analyzers and this solution
> > will in some ways help to reduce the HW analyzer usage.
> > 
> > The debugfs entries can be used to get information about underlying
> > hardware and can be shared with user space. Separate debugfs entries has
> > been created to cater to all the DES hooks provided by the controller.
> > The debugfs entries interacts with the RASDES registers in the required
> > sequence and provides the meaningful data to the user. This eases the
> > effort to understand and use the register information for debugging.
> > 
> > This series creates a generic debugfs framework for DesignWare PCIe
> > controllers where other debug features apart from RASDES can also be
> > added as and when required.
> > 
> > v7:
> >     - Moved the patches to make finding VSEC IDs common from Mani's patchset [1]
> >       into this series to remove dependancy as discussed
> >     - Addressed style related change requests from v6
> 
> I tested this series, and one thing that I noticed:
> 
> # for f in /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/counter_enable; do echo 1 > $f; done
> 
> # grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Disabled
> /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/ctl_skp_os_parity_err/counter_enable:Counter Disabled
> /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/deskew_uncompleted_err/counter_enable:Counter Disabled
> /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/framing_err_in_l0/counter_enable:Counter Disabled
> /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/margin_crc_parity_err/counter_enable:Counter Disabled
> /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_1st/counter_enable:Counter Disabled
> /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_2nd/counter_enable:Counter Disabled
> 
> that there are some events that cannot be enabled when testing on my platform,
> rk3588, perhaps this is because my version of the DWC IP does not have these
> events.
> 
> (Because all the other events can be enabled successfully:
> # grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Enabled | wc -l
> 29
> )
> 
> 
> So the question is, how do we want to handle that?
>

This is a really good question.
 
> E.g. counter_enable_write() could theoretically read back the
> dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG);
> register after doing the
> ww_pcie_writel_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG, val);
> 
> to actually check if it could enable the event.
> 
> If counter_enable_write() could not enable the specific event, should it
> perhaps return a failure to user space?
> 

Yes, it would be appropriate to return -EOPNOTSUPP in that case. But I'd like to
merge this series asap. So this patch can come on top of this series.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

