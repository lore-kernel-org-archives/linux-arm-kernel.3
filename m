Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD1FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FF54yqkuvwX1pBRnFH8QcIU5TxlTBf1rKceF/MbIVBs=; b=XC8S0WPHhvQU/YL0DNO9ILVoRC
	hvUhnx52jIHCGaV2eUqO4fn/7sGbUSPbL+Oz7RZQdU/CQme7o/PdzaI1HI1hGFJhp09s/ke1zA6KK
	da5v1fwq9XtdqjVEMPBU96OfTVnmTEWFz03EgB/wm0/CpW/dq325ZlPn3WP6f4zvKnVRbJ2odvl77
	Qm1kd/6HTHg7pcRch3+ZeimT6LxQYDxpKZ24bPNptop2I/ved/tiavrmYJVMiNWADW2S6Opqmt5oC
	ws8/pqyVHt6k+4Fyqu+GxArF1rg06dljxaAL2xknB8QQX3UOW4dThSPOz3NYxN3KR06uiF4kh25DV
	N8YJxIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmypX-00000000fyN-2TBj;
	Tue, 25 Feb 2025 17:34:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyWU-00000000ZR7-1UHa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:15:11 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2fc20e0f0ceso9061340a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 09:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740503709; x=1741108509; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FF54yqkuvwX1pBRnFH8QcIU5TxlTBf1rKceF/MbIVBs=;
        b=ogLapSbiBW2a7yIoYaoylnejCvL6CbT0naPqn7+CfzwGuE6ib1yj20xZpHvc+kpNJ3
         /ROYFfHI9pDwizwNVHzqC319ha+9pmOQIUnCpmnkkR15QMVdzWBlwyQoFVBmxUTn6brH
         3JdUtJN4z7WsEhs853TZRLmndnAYb6FwAT1fLD8SB3se/hCDJ4Lkucityq0PsV/9cU46
         YB+/fhp2krHkl3uqVTTopen+fQWjyerG0zcQOte0jOaA1gEQSIwQ0h+0kiYvHKWmNqUO
         WyxusQsPQHjvJHSFohjuYtk4TqqQs7Gc4KfwfL2E39HIV8L/Fea1IAEclW28F0gP9O3X
         KlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740503709; x=1741108509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FF54yqkuvwX1pBRnFH8QcIU5TxlTBf1rKceF/MbIVBs=;
        b=R1iuYCFIAfaRZ6fmMfH+710a60ndohes9K9cZpA8a6jU8b99tVsyr2BQSYW49lfWmM
         P3wSG2vqZpinvDa5RVqKrEhKaX+gFF34Nm/j6oieQX2HhrJPS2T2nyWfTAv86tXSVw9i
         yA6A+H/v7Ltmr0ln+J4uA9tPbWGVBnllriCv4vjhjkMYPD+WQWex1beXtxuoc1RIvdCg
         JYWHpHoyYOR8OLCrOG/jmfdEFKOMBySez/k2ctV91CAZh8bE9nk3S7SkbpitWf5VDyZg
         7ZF0Vr+G8iaZD0NOnby/MQrJdTRicwcCBKhJO+y26q6XPQewxdQq9bitzF0B2WAc8aa2
         J4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe0u4ZRTd1SJfDEcaC/9d924RrFx8YK9SxKoa4uGiqSzVZeuqr9+9keIF9riJhLqt8HjdKXKTYzQdLuNdno+UV@lists.infradead.org
X-Gm-Message-State: AOJu0YyfF9r1bfbuwC2U/rhSIxOXsBkRL0P9lo9rcTcvOqQJrGyBaT8B
	S/72NV8DJAQjQHPLoihSDE57gTos/Bt7WK7DuomQdY/6sk6fyCTVOYcYbcU+Pg==
X-Gm-Gg: ASbGncvudeVpkMQbnmSjZfF5ytpN9y87lA2h5DGlrF6EnURfhtPJZSbgNRs6yMvgkgg
	0J++/b+L7glsny+Fw44RWBj0UxQMw7aehQc2sZSaJ8AM0rAwsIuCcErj6oY8c/WBnXDvHIu1ZKl
	WcqlhLSIXuirPhPcpOsVwtR1Xk/av+/vaemmgHJwknoFRV+mcjZpywpeR8nAd1S1LlHoii138H2
	dp9lmtUMVniXkw7Ol6r3gpgS3lZBGbnIh/ne4XYthFPRVZLljFnALiGriKjlps4PXMbj6qr7l60
	JhYnGRSDPDXKH3mHICkuPY4oaIxvtPSanBIj
X-Google-Smtp-Source: AGHT+IFbyIk/t2FBVqbowzwmc33Cu/Xhw0HHnO9qzMEv+9/uViTPYk/jm8Aw+qCax7VxnPMgSI0asg==
X-Received: by 2002:a17:90b:3506:b0:2ee:dcf6:1c77 with SMTP id 98e67ed59e1d1-2fe7e33b210mr241444a91.16.1740503708928;
        Tue, 25 Feb 2025 09:15:08 -0800 (PST)
Received: from thinkpad ([120.60.68.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceae302e7sm8889686a91.0.2025.02.25.09.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:15:08 -0800 (PST)
Date: Tue, 25 Feb 2025 22:45:01 +0530
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
Message-ID: <20250225171501.ahjmawunnpyc7wwa@thinkpad>
References: <CGME20250221132011epcas5p4dea1e9ae5c09afaabcd1822f3a7d15c5@epcas5p4.samsung.com>
 <20250221131548.59616-1-shradha.t@samsung.com>
 <Z7yniizCTdBvUBI0@ryzen>
 <20250225082835.dl4yleybs3emyboq@thinkpad>
 <Z73VLYudJVPkdbGN@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z73VLYudJVPkdbGN@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_091510_392982_026D99E7 
X-CRM114-Status: GOOD (  45.74  )
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

On Tue, Feb 25, 2025 at 03:35:25PM +0100, Niklas Cassel wrote:
> On Tue, Feb 25, 2025 at 01:58:35PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 24, 2025 at 06:08:26PM +0100, Niklas Cassel wrote:
> > > Hello Shradha,
> > > 
> > > On Fri, Feb 21, 2025 at 06:45:43PM +0530, Shradha Todi wrote:
> > > > DesignWare controller provides a vendor specific extended capability
> > > > called RASDES as an IP feature. This extended capability  provides
> > > > hardware information like:
> > > >  - Debug registers to know the state of the link or controller. 
> > > >  - Error injection mechanisms to inject various PCIe errors including
> > > >    sequence number, CRC
> > > >  - Statistical counters to know how many times a particular event
> > > >    occurred
> > > > 
> > > > However, in Linux we do not have any generic or custom support to be
> > > > able to use this feature in an efficient manner. This is the reason we
> > > > are proposing this framework. Debug and bring up time of high-speed IPs
> > > > are highly dependent on costlier hardware analyzers and this solution
> > > > will in some ways help to reduce the HW analyzer usage.
> > > > 
> > > > The debugfs entries can be used to get information about underlying
> > > > hardware and can be shared with user space. Separate debugfs entries has
> > > > been created to cater to all the DES hooks provided by the controller.
> > > > The debugfs entries interacts with the RASDES registers in the required
> > > > sequence and provides the meaningful data to the user. This eases the
> > > > effort to understand and use the register information for debugging.
> > > > 
> > > > This series creates a generic debugfs framework for DesignWare PCIe
> > > > controllers where other debug features apart from RASDES can also be
> > > > added as and when required.
> > > > 
> > > > v7:
> > > >     - Moved the patches to make finding VSEC IDs common from Mani's patchset [1]
> > > >       into this series to remove dependancy as discussed
> > > >     - Addressed style related change requests from v6
> > > 
> > > I tested this series, and one thing that I noticed:
> > > 
> > > # for f in /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/counter_enable; do echo 1 > $f; done
> > > 
> > > # grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Disabled
> > > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/ctl_skp_os_parity_err/counter_enable:Counter Disabled
> > > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/deskew_uncompleted_err/counter_enable:Counter Disabled
> > > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/framing_err_in_l0/counter_enable:Counter Disabled
> > > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/margin_crc_parity_err/counter_enable:Counter Disabled
> > > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_1st/counter_enable:Counter Disabled
> > > /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/retimer_parity_err_2nd/counter_enable:Counter Disabled
> > > 
> > > that there are some events that cannot be enabled when testing on my platform,
> > > rk3588, perhaps this is because my version of the DWC IP does not have these
> > > events.
> > > 
> > > (Because all the other events can be enabled successfully:
> > > # grep "" /sys/kernel/debug/dwc_pcie_a40000000.pcie/rasdes_event_counter/*/* | grep Enabled | wc -l
> > > 29
> > > )
> > > 
> > > 
> > > So the question is, how do we want to handle that?
> > >
> > 
> > This is a really good question.
> >  
> > > E.g. counter_enable_write() could theoretically read back the
> > > dw_pcie_readl_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG);
> > > register after doing the
> > > ww_pcie_writel_dbi(pci, rinfo->ras_cap_offset + RAS_DES_EVENT_COUNTER_CTRL_REG, val);
> > > 
> > > to actually check if it could enable the event.
> > > 
> > > If counter_enable_write() could not enable the specific event, should it
> > > perhaps return a failure to user space?
> > > 
> > 
> > Yes, it would be appropriate to return -EOPNOTSUPP in that case. But I'd like to
> > merge this series asap. So this patch can come on top of this series.
> 
> I agree that returning an error is probably the nicest thing.
> 
> However, this series has been picked up already :)
> 
> Is there anyone who volunteers on implementing the proposed feature?
> 

I did and submitted the fix [1].

> If you have time, it would be interesting to see if you see the same behavior
> on QCOM SoCs. (Assuming that your DWC PCIe controller does not implement all
> events that Samsung DWC PCIe controller does.)
> 

Yeah, I observed the same behavior on the Qcom platform, though only 2 counters
were not supported. But I also noticed a null ptr dereference due to refclk
dependency, so submitted a fix for that also.

- Mani

[1] https://lore.kernel.org/linux-pci/20250225171239.19574-1-manivannan.sadhasivam@linaro.org/

-- 
மணிவண்ணன் சதாசிவம்

