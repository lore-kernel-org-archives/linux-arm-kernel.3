Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF60CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5XqWRuALq+1KPuNnLLJTpIo8i27168N3j9dyvRLwpM=; b=4Uk1nmUtcHstL8kyHzlOWc3/Xd
	2fSxAapLkAGCX5v4TPvGh0HKqxjULSZmltl4Rbtmv7vsyWcrDYFdY635Seg0+LsG8i2YOPNd4Lw1+
	r7QeEO9hhmCT/IlfJWpjsjfxfxksigWducHtF7CYgh0A9GutnoEN3oEyGdw9y7dPI/1XcOdRn52VT
	uPAbKE7/udME3djnJ/mb6MQGTeonzGaeqzCcwFMB9YyKXJOjslFpa3dbPieEOSLbklxWD+DRCkS+I
	k0/psRm7L4QPxUxRBg4kRo/Sg0gMcU5XF67zIEGI8BOjXHRUQ/h5twr5p3/UU+mp5JE8dnxep++H3
	K0xCKVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnIl-0000000CC6K-10Tj;
	Tue, 13 May 2025 10:55:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnGQ-0000000CBqG-3HTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:53:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so3445415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133613; x=1747738413; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5XqWRuALq+1KPuNnLLJTpIo8i27168N3j9dyvRLwpM=;
        b=kAFMHMZd3IXolOawFUyZDC2Vx0Hmj7AHqBSsIZTYtxRpKqYK2LeiFYFLIrxXLSWO1l
         QrdZve0A7PMSdgPsWuxPrbUsICxv3WwQODDAoEzYZbGrQB/NEDbJCke6syAa8LqbhCke
         qftf+HSaiwH7RWKyC94cRnm70Ge11qK1g49es1yhHtiHHe/7CotiUEh79wX+X5gMn/AE
         GnGz4zUUYK3LWwJMWBjQAdWc9lPwZ1/L9SW41UaM0lxCs8CBoU5yDIvdcOrXSHzqyTUu
         Iam20HzxEiKgaorzOPoaN0ZnGhakcfPruWaefL9xWYQw5GJjhm8X8miSbQ160qGhcTr5
         o1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133613; x=1747738413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5XqWRuALq+1KPuNnLLJTpIo8i27168N3j9dyvRLwpM=;
        b=TqF4aD/4IjoqXexTwJ4qWDA1sjGj4E82yKiaFnee0jI3psRuSxVCFrnCVBMk4PlkI/
         YE+Y5gSRFO7NxwnEfmVkBpkQ4sdnAA4fK5X+1gV1Cx3Gh6EVkhtWzH16kXX3Q3MBuFrH
         ALf402djD9zgBYMV6OKpom1ZFaAEyy2YwogMtRMcizYG1siW6CvpyY8um6zq5bdxfs52
         sDD5uhrT0PJuMQIgfhydtEopr1VW8W7w6TlNfuQzc26nabcNWTb+o+9F6+l9kVQeWRbX
         9AtBNPzcMQPSvb1L4cNoigZaBjcrm5VjavdGSWoDQcPx9WCr/s2sLYyJSqEIrr9TBKcm
         2Lkg==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZPU60474M0Q1uZbl8V22k7hGVDTIOVPRh8r+YUaNGV6wCY23aERvgqa9AIQ1WKQ4sERGEbSCzvWJSXkH3IlH@lists.infradead.org
X-Gm-Message-State: AOJu0YxKrgB4TZQ4v69301vxrXepBjguKFfTc65EYnhau3x5VP1j0ID4
	4Hg9GxF7LoTTXFM1zBY51Gm/8Bzv0+mFSXAt7b5hB99X4Pq3APDXauGLY5CC9w==
X-Gm-Gg: ASbGncuVkY19jPsq6hke53gA6TlRnmeJP43NpJs5YogIUXNkh9Dq58nUQF7dKooRg9A
	lcoFpm/7QBe1tjd2/4m6DsR/jNZEx4l9XZcWa9H8qNwmswAROjMnZPhQPnP8nLfPBEKzD80Z++L
	fHJ0SYwxqcC4UE12uoXUdtuwTooT4SOqnpY0TEzLxlO3Ho6n/p/M+MQ14+XbbN1WJ9E/RXVdUWb
	F7NxPg8Gn7ntc8gsLz1hwuYvBJCVVLJXRe/8481Z3O3X1LkCv3qEKl1Xics2EsyaXAU3GMr97IB
	ROhG2VRVQOt2QATtHhP3Wpi7qwF9aiIUFvl4NGZ2huPaVF7LLdPAu8X8Xg1Ls6sqZB4d5FSXGk3
	ovs5Yn54cJ6gvyA==
X-Google-Smtp-Source: AGHT+IF4m8noQnB4eGSySi2oqV3PlKbLI8UICKwhBvvGk/TXUW4E0JigYf7vcXqZztR8zC1h2uVMZw==
X-Received: by 2002:a05:600c:34d5:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-442d6dd21bfmr124187975e9.23.1747133612718;
        Tue, 13 May 2025 03:53:32 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df5ecsm161692715e9.9.2025.05.13.03.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:53:32 -0700 (PDT)
Date: Tue, 13 May 2025 11:53:29 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Laszlo Fiat <laszlo.fiat@proton.me>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7>
References: <20250506073934.433176-6-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506073934.433176-6-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_035334_821627_54817183 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, May 06, 2025 at 09:39:35AM +0200, Niklas Cassel wrote:
> Hello there,
> 
> Commit 8d3bf19f1b58 ("PCI: dwc: Don't wait for link up if driver can detect
> Link Up event") added support for DWC to not wait for link up before
> enumerating the bus. However, we cannot simply enumerate the bus after
> receiving a Link Up IRQ, we still need to wait PCIE_T_RRS_READY_MS time
> to allow a device to become ready after deasserting PERST. To avoid
> bringing back an conditional delay during probe, perform the wait in the
> threaded IRQ handler instead.
> 

This wait time is a grey area in the spec tbh. If the Readiness Notification
(RN) is not supported, then the spec suggests waiting 1s for the device to
become 'configuration ready'. That's why we have the 1s delay in dwc driver.

Also, it has the below in r6.0, sec 6.6.1:

```
* On the completion of Link Training (entering the DL_Active state, see §
Section 3.2 ), a component must be able to receive and process TLPs and DLLPs.
* Following exit from a Conventional Reset of a device, within 1.0 s the device
must be able to receive a Configuration Request and return a Successful
Completion if the Request is valid. This period is independent of how quickly
Link training completes. If Readiness Notifications mechanisms are used (see
§ Section 6.22 .), this period may be shorter.
```

As per the first note, once link training is completed, the device should be
ready to accept configuration requests from the host. So no delay should be
required.

But the second note says that the 1s delay is independent of how quickly the
link training completes. This essentially contradicts with the above point.

So I think it is not required to add delay after completing the LTSSM, unless
someone sees any issue.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

