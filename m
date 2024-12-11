Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45379E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUFybBHAtKBg9XAbRfnlqLJtUAS0jaNbKaZp0A764TQ=; b=dOxOrPjztP9abui1U2+/Ycl/vb
	LrnDRuW0vuvB4e6D20SjPmVjmr9M4d+IJ+tDywXqAxfZR0/QVyCG7OzJs+Vlk440BauYC3fsEXBdR
	9zjqE8mjVZiFEwWV1+zcUT3hJQPpKzlUMx1M72Vtn8nd6X8BxnDfAU8lEviJxVb70d3esYxnjKJRo
	OZHjNQFjHML7jXDa/UW6xPEfj/Bq0INExHCnz7xDQF+JuBjckuzuyvWwLpzUa5qDvNUmEtPrY9LKB
	IRs9oDvhfDm/9KmTvbVNleaVgVANscJrgf4B0golVzqSqvGGPlBKUf1iOm01FfBXNBY9sK2hYjvYL
	IVAmrpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIoq-0000000EN6s-2KHI;
	Wed, 11 Dec 2024 09:15:44 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLInm-0000000EMvH-2vnW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:14:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166651f752so25956555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 01:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733908478; x=1734513278; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUFybBHAtKBg9XAbRfnlqLJtUAS0jaNbKaZp0A764TQ=;
        b=E9CWPIr1H56COkvSzdYSDHjBW0uOSD2JqOjEeXUNYO/QjUxvAhfjZQa5QKLsrFGQvY
         hd8nV935cIUvKlUucXbn5HRuCRLwU7MWFtoXm349BppiZ+eFzxMHAYOpSuv6RJl3HSln
         HrwiFo77qMn9pEZka62KBSGPMYiu9j4EeSPc5XR8aIrj2MC0Yjt+YCwHDDAGzEOUDKn7
         B3+A1ZM973VOEuZtLPWNiBfaShQWcE9teM90wnBmsGv9hEYBZvrqr3sl3PnCO5m9apF6
         aDWSZStyyO/bbgpGj5XcBnpQ1yEW0DmpNr7+OeGWjoEQdWVMQD0DvMDCR9qw7wZnnPLE
         EIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733908478; x=1734513278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUFybBHAtKBg9XAbRfnlqLJtUAS0jaNbKaZp0A764TQ=;
        b=agFwHaLx2VgvD0igG7tvJAPoz/zMh3bDbZXl8r536rqtc2F1hAD/+hPog4Pj4+iYvH
         HjC++3OElSge65hoL6h6LahmSPo0H9nD62Fq/YOfULtb4fxydAIsMO5Ai0ZD43nV50M0
         Tx5B6eTHdSoxUYzAzLK/nhVI+3mmsI2rLnB/Mnwpo/kD+5Z3aRRj0ZRZYbRaqmD/t7CY
         MLUgj9h37VKaHxVGzOQmJsZKQENhV+nAJ1OvoqEj41wZPrLsB/sr29vWnAMXD8b/gH1m
         NxZbdAMQ2MqY4lHHYTwzn9/g2H1rae3qnwQVEcu5CLzmd1qgRE+pFxDQPitX/S4xifrj
         1hkA==
X-Forwarded-Encrypted: i=1; AJvYcCXJBz2F80epK6Pe2Ck55B1iEpPlr3cfl/CEQRmVHu0Lhu8mVYPld5OjYS91oyUtMqL0uWotImenFzqsd9O+fg9/@lists.infradead.org
X-Gm-Message-State: AOJu0YzG4kilYiuP886x3dPP4aUijxAaPN5qeNJVKmhe6k3YskZ8Y36l
	o3ggglAx9j8NWmyY+4w3a6O52R+1JnTJpfAsXR9WQG/pt3FrjP7Jv5yj4ktB2g==
X-Gm-Gg: ASbGncvLgqCDi/hdNd84oDcGtMsMHFbOjs/mUqf7+uT/Gewvlcff3zgdiUm7mqmzIU6
	h5LVPo7oEga85Qc1Pyrb/zuiE6lS2gNpSf2e6Ob8Jo5hDvQhE5ilW0gF418qoL49L4yzq/szKqE
	5qn/5da78UF9qyJvoP6+cFzG5NTEpCOeL+TRxngdKPlL+FYIHBZoZgbVk7RIKovFWyrVxMCYAwp
	HQjvQpFZp653aGmtZsdycljZNMUgbyBLdFWtuX50KK9s6TugntL/o9eA5XF84Q=
X-Google-Smtp-Source: AGHT+IE7knwn48LdhJslFzK1Zi2TZQ4t5PfbLv5V67ShOU5zUeOc6EVVuqUeQ7tRigEaD2ORk66xQw==
X-Received: by 2002:a17:903:1d2:b0:20c:9936:f0ab with SMTP id d9443c01a7336-21778696456mr33767495ad.47.1733908477842;
        Wed, 11 Dec 2024 01:14:37 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2164252350dsm54976385ad.43.2024.12.11.01.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 01:14:37 -0800 (PST)
Date: Wed, 11 Dec 2024 14:44:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, vigneshr@ti.com, s-vadapalli@ti.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, theo.lebrun@bootlin.com,
	thomas.petazzoni@bootlin.com, kwilczynski@kernel.org,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	gregory.clement@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH] PCI: j721e: In j721e_pcie_suspend_noirq() check
 reset_gpio before to use it
Message-ID: <20241211091421.4empou7mbm35ynxq@thinkpad>
References: <20241210154256.GA3242512@bhelgaas>
 <6c7cb07c-af9e-4f69-84df-2b59a57e4182@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c7cb07c-af9e-4f69-84df-2b59a57e4182@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_011438_761526_683F8966 
X-CRM114-Status: GOOD (  25.44  )
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

On Wed, Dec 11, 2024 at 09:59:30AM +0100, Thomas Richard wrote:
> On 12/10/24 16:42, Bjorn Helgaas wrote:
> > On Mon, Dec 09, 2024 at 12:23:21PM +0100, Thomas Richard wrote:
> >> The reset_gpio is optional, so in j721e_pcie_suspend_noirq() check if it is
> >> not NULL before to use it.
> > 
> > If you have occasion to post a v2, update subject to:
> > 
> >   PCI: j721e: Check reset_gpio for NULL before using it
> > 
> > s/before to use it/before using it/
> > 
> > Did you trip over a NULL pointer dereference here?  Or maybe found via
> > inspection?
> 
> By inspection
> 
> > 
> > It looks like gpiod_set_value_cansleep(desc) *should* be a no-op if
> > desc is NULL, based on this comment [1]:
> > 
> >  * This descriptor validation needs to be inserted verbatim into each
> >  * function taking a descriptor, so we need to use a preprocessor
> >  * macro to avoid endless duplication. If the desc is NULL it is an
> >  * optional GPIO and calls should just bail out.
> > 
> > and the fact that the VALIDATE_DESC_VOID() macro looks like it would
> > return early in that case.
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpiolib.c?id=v6.12#n2316
> 
> Oh yes you're right.
> In fact, the if statement in probe() and resume_noirq() is for msleep(),
> not really for gpiod_set_value_cansleep().
> 
> So this patch is useless.
> 

Yes. Almost all of the GPIO APIs accepting desc (except few) use VALIDATE_DESC()
to check for NULL descriptor. So explicit check is not needed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

