Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F08C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ax2GIMqI2oJHn6HgwhTWHhHEkIAyr6Rp1OTrqHHWbE=; b=QvuEDji8SUVp5AOsLz4RHPhJqy
	HmbnzEAJhzKkTXWdpYuW7+4Z5kalXn1X12t/aEHHY2OvbCqhtjB9tuJrdtIf647TANUHaf0JXY2Hx
	rl4gKWxMCmoNFDyg6z3bnWbAMTp5A1Z2J4AJchgIAzno5OUBEl7DAXpzr1lek0l03DpV5TOMQhm2l
	DIiBPIakoorNYQ+Ro7fXwvaylIPhTwYjGH1MbNoDcKXVxTIGlylgDXjpR4KCWuW27yMz5Zh0cAbAB
	YYzX7AqKcXgD8HK1Wg+WXhnQVoefxCouNE6nbrxonNhb9mtlV7GLcnLlA1ZiWN6588AT9IzUW6CGm
	q33RfHgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQve-0000000C089-3TGd;
	Mon, 10 Aug 2026 14:24:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQvb-0000000C07E-2wep
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:24:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cfff5f88dbso29962905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371875; x=1786976675; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5ax2GIMqI2oJHn6HgwhTWHhHEkIAyr6Rp1OTrqHHWbE=;
        b=huUKxKx30/IBIMHizw+FVPg4M6+TqXHqiKexrYBVBMqgwlDlB2dMPUCdDlkG1o6tBx
         B/cEh7t7+I0a781uSAHEcA2MA4x0Orw6jxFYGnrIIw9ZqeT1T1u3Ekw3kI2tLrySwVkn
         gnuhgAl9uuF3wTuga3Hw9MxwehVGGxpi1lMadzbQNIU+ynmS7n+mSlqmXWc5iKhUxfIk
         1lLdofUlFKvRedd9462qFjc1Rs1ve2zgqhtwcvWDLFJt5jXu5cOXxYcWkap6t+5LyopU
         nwRnejJ6HYngOdmigFjIRJfDVlazF/4J0KF5Ijal6Qf6w3WkMYwpEWQLZx9/daXmathf
         5i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371875; x=1786976675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ax2GIMqI2oJHn6HgwhTWHhHEkIAyr6Rp1OTrqHHWbE=;
        b=l/IIlZYifJcozygLIJbo4yKnbliiPk7+nuCo2ICiPr/WCQEZJjWWy0N9t0S5lpcRfI
         spjg7QjnNn8bTpnMkTPBRkYXiNyQPWyUZCdVHjDJ0uo3lalaw3VFhHxeLo/+WFjn+NMb
         ccUmSHmQzfbardFXYgmXG6qCVaLbUbuMFJhCSnDPm7qbCwBKlWmYWFUCubYDMT3Wc8NP
         bWSuBu93oV019N9KVye6gJvOqvRhMbnwxT5vTCgcPNHeGQGaRF/0mqQZLZ+mvsWnTg4p
         v/PSRf9C9Z6SII3f3Ga2pxq/3oSRqaftRWLSSvWu9sFI2gUImCR9fwWJYoNErX0ndQA/
         VK+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq3Mxwb9pQ827MuzUTrk6ntKefaJ5oL6Bz69ZvCFnR8rnA93yLeqyR9lf5SmFJhj5HBkMfGaHMjpGOuW9MFn4HF@lists.infradead.org
X-Gm-Message-State: AOJu0YxLfWr8YqZYc6v17Gt+oFVUFqKT91gJnQFhXR7WBWiSOEe28Zs0
	nvAqcRN+V8Mk+0Qw8gOT8dHAnLYSDfpZztYyPYO42LYfDLDkVyPPJx6o
X-Gm-Gg: AR+sD12F1PvuLHexdtKbGSfoXGP8ZgohqjaQALzsUNaDhTfrSdg809vXTKQwja+cXLL
	KuMjEuBWFbNRj4acgDQLya0IvuqTtKRJa+NxkBOwXdAcp/MxcA6l4GYFV3o1s0F4ZwyaYwImpuc
	8wQaXpivXR7+LyN00Z4TocX06GEy/IN5y/KZfx/RAf5Fe/0VZvKQNk3c+CExKt2EWcYwwzDyH/E
	Q8xCSHR3uBlq1K6/VnQA8rBwgrbTAKqTfj7YwHqxX1V8qEqTMMoeUUV5LkS1MkRMUtphGhvtlSG
	RTM3Dy87B7KxbJzpSk3+pE+5rNgKyf7D3M3ZqyFVRtIEz//SUFXcwvw/2BU7l0ZmK+lco0Xy90s
	EmmuwjMvCO6zr0OMy7rt6HgKYGMlwnGr5Ej8F2c1SuPUv6y4NeXbsFM75sP57nDUH2NLx8KKxl+
	gIOVvPQEqFEUbmsrC0/pv3cMjDUbX8UOsnAxU+h3GnWChdrVAPpGJcu8gNWyE0P4BwBLdmwxaUW
	A==
X-Received: by 2002:a05:6a21:7308:b0:3c3:a1e6:a626 with SMTP id adf61e73a8af0-3cc1a3f1658mr2809036637.32.1786371874643;
        Mon, 10 Aug 2026 07:24:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3d1sm46551457eec.2.2026.08.10.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:24:33 -0700 (PDT)
Date: Mon, 10 Aug 2026 07:24:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
Message-ID: <01283c69-d5ca-42b0-a75d-6ebb07fee46a@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
 <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
 <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
 <CAABR9nFcitFyS_xZUkreHWp822iVsoEg6ONFwU9JwPaBqm2MTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nFcitFyS_xZUkreHWp822iVsoEg6ONFwU9JwPaBqm2MTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072435_748536_718619D3 
X-CRM114-Status: GOOD (  20.80  )
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

On Mon, Aug 10, 2026 at 04:45:07PM +0700, Bui Duc Phuc wrote:
> Hi Guenter,
> 
> 
> Thank you for your feedback.
> 
> > >>> +                     return irq;
> > >>>                if (irq > 0) {
> > >>
> > >> This if () is no longer needed.
> > >>
> > >
> > > If we remove the if (irq > 0) check, irq can be -ENXIO and would be
> > > passed to devm_request_irq().
> > > I see that the irq argument of devm_request_irq() is an unsigned int.
> > > Would it be safe to pass -ENXIO to it in this case?
> > >
> > No, sorry, I was wrong.
> >
> 
> So this means there are no issues with this patch.
> Patches 2 and 3 have already been applied by you.
> I will temporarily resend only patch 1:
> " watchdog: qcom: Propagate errors from optional IRQ lookup "
> 
Correct. Note that gmail may swallow this reply, claiming that it is spam.

Guenter

