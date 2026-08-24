Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8531FC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65NP61gKnJpo0qnqpfFXMm215YvFjmk0/dMgC3HflCE=; b=j7zN73rcVqW8hJeFOiomv44bqe
	u3pbPOU9i5jx+vCIbJWN0RMI1zf5ifywP7c80NhWPxoeABrUx4tijD0ILKQV48VvBgRI+1175W4jd
	mjwuyRKJaJxh0zFs/lsSuk7Y+9Ll+T762mc4is8wZ3NZQaNypPpoQqx069ycRzn3LlOs37GQPzV22
	mVqfIoqoG7oE46dn8EfVSrL+3TehPcheTo3A96DyBy5St/cvRc7/Hm+DlItCY8VguSUiDuFHZBA8S
	QKFc/NIyF6dFqKiq4ZRNDloOgn8v0Wb2M345T+RbcLAOSSq5wk+xphMxtEHCDEs+iTbnMwMqmSUkC
	4AD9RTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZtx-0000000HHzN-0Q6X;
	Mon, 24 Aug 2026 19:00:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZtu-0000000HHwo-2bYX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:00:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-472326ca506so2017899f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787598004; x=1788202804; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65NP61gKnJpo0qnqpfFXMm215YvFjmk0/dMgC3HflCE=;
        b=SX85ccOxbtMoZkNoJP5g/rO6D7hc9JRNnDuiNEAb5VwPTvTCXAAooEffkDHcFb1swF
         DURe66mR44oICTAH0Hl02snUFrL2X+rPRPntW5EtFn063Y99H6f8TOGpHOvfwngRl7wM
         zd3wPQG0xI0yF++6RQrdDYgAtkdh6xGr5bL+SGmtSxkNTvd+rM1wEmyYjoNb+mSu9cWT
         yw60nVMme+HysV0BishKqaSzAy62rR1q9yM1G75tqFIrnYvI6oEMN8MxKU9oMa6N5cZe
         eCBjdKVhKPJPx8UBDkhCiK0YJSZaJWspV5ZdETyGpTzspiCoK031Gg0saYQbEezvcDiH
         Ftyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787598004; x=1788202804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=65NP61gKnJpo0qnqpfFXMm215YvFjmk0/dMgC3HflCE=;
        b=l/xj6n+KXmBkiK7OBzyaBeeVMx+5tc8hJV1p9iKCJzT97UCX5lXSW4SMlkWXu70FF1
         +7DvNGdSzQErCzOo33asHZ1jhFkStZjfgeb0l6Vu/vQGKg0Abl7CT4T8OUfM222mTUn7
         xMCSRl0P3K/fiohBT9Yaahaj/mx07dl4FSc09AMGBCrVKbRln/Yhm7IT3oGeXYChCn7P
         jTDXVcCu3GjEwsOQyiK215A1LscD/0CunbGkT5l7ov+i74yzqHUYOXia+09HYF6Z9nES
         TuNUCcT4/L6sulF/W7TQ3XmzLN93NZcCps2FvVfSz/y+PtP2dXSgWqkYOC+G1FNDx1N9
         FQ6w==
X-Forwarded-Encrypted: i=1; AHgh+RrT2CmzYBD/Oi1cg6loZYshjCTwP8Rj/nx/CsvTxMaqibLglMVsRisz/G5g/M/u1mw9hqSXAhQwJkrcuVV18fEu@lists.infradead.org
X-Gm-Message-State: AFuF++m7sBqixL1V2bvruDjIoL3eYWAZdYb6yJNjvAVdLpOsVQCTFNEi
	1H+RcruK6Zj/B8tBGwwmtJw7yEFIsRAyKiyPsGoBficm/B5zt/XWrvvW
X-Gm-Gg: AR+sD10A075Pz005D/roBMsSXV6H6k6z0ff5KkkKoRf1lC5AXHW3NMHPXFKUd74put1
	JFc+Xs5kLqa7VV4GzfbALscSKH4s0453GZDV0XNpn/ftqJgiDnIx34zhgVV+1DX/564n5BpPbUw
	01zQNOHyafFgP9NYN2hyw1UE+vkMmeAAbYB4WbwITv4FPnuNnjSpEPWSrapG6PCZqW8dVcTfcsa
	sh819Deg8uRFXHG+k+VZFgHOqQ/qxvFgp06iiNa4XSijoXPfjjmrMQn/ofXzxh829o8X7e7cM8f
	JSIorm8bt1rUSAQg0yr98gfsBZg+cSl+yys+uReVZrQaoD2Gk/z09QLrUespbj4z7QbA8MF7j/r
	XnfVbw1NaMW+PnL0prOKPem1mxVcXoTd510EktTfi3ehLNgjUr1r/2WmcX2oRx1IHqrmqmH1hre
	mJMMJvRX4B9tNRI12gqM00/8IOwfSmqcYepBGLi+Hmdv0XQJ++DfsPUa4P97lkuaJ8qOoXo+GHn
	FhIzW2HY445AoVBIGwCIhpi58gBbZJiQHWZa9HKI/bhx4BtEVKyiFVsKw8duQdBfXJ0
X-Received: by 2002:a05:6000:400c:b0:481:5bce:44b3 with SMTP id ffacd0b85a97d-482c0ba22e3mr37716386f8f.16.1787598004049;
        Mon, 24 Aug 2026 12:00:04 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm8813534f8f.22.2026.08.24.12.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 12:00:03 -0700 (PDT)
Message-ID: <928e0a09-edd0-4f1d-ac6b-c225b4cd6fab@gmail.com>
Date: Mon, 24 Aug 2026 20:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
To: Marc Zyngier <maz@kernel.org>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com,
 linux@armlinux.org.uk, tglx@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, bcm-kernel-feedback-list@broadcom.com,
 radu@rendec.net, kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, arnd@arndb.de, sudeep.holla@kernel.org,
 mark.rutland@arm.com, lpieralisi@kernel.org
References: <20260823180832.1246363-1-julianbraha@gmail.com>
 <87cxv7o62i.wl-maz@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <87cxv7o62i.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_120006_692275_24C6098E 
X-CRM114-Status: GOOD (  14.35  )
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

Hi Marc,

On 8/24/26 17:07, Marc Zyngier wrote:
> On Sun, 23 Aug 2026 19:08:32 +0100,
> Julian Braha <julianbraha@gmail.com> wrote:
>>
>> ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
>> dependency, ARM_PSCI_FW, is met. However, ARM_PSCI_FW is always enabled on
>> for arm64, and the GICv3 driver only uses HAVE_ARM_SMCCC_DISCOVERY to
>> identify the NVIDIA T241, which is arm64 anyway.
>>
>> Also adds fallbacks for callers to avoid needing #ifdef guards when
>> HAVE_ARM_SMCCC_DISCOVERY is disabled (32bit arm).
> 
> What does this 'Also' tell you? That this part is in the wrong patch.
> 
> This should be split in two different patches, fixing different
> problems.  One to allow graceful fallback of the SMCCC_DISCOVERY stuff
> when it isn't selected, and another to only force the selection of
> that option on arm64 when GICv3 is selected.
> 

Thank you for reviewing, will split out these changes.

- Julian Braha


