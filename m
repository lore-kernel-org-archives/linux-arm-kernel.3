Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33614C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vClHeog58KNqWH8CCWBc/ZspAK1VXs4jFJuykhl903U=; b=Sr4z1kL/xcFPm+oaMyRQu1pTgv
	YOK89cx0p7au291qt2Y+bGe7ML6Wn2HD8brUq375zTIBjQh6wJKz900y2zpIKxVjwDkWaRabxlVup
	VJj4DOUBGa45YCImZBYIvX5O3u/i9etW0s19ReOJYL+SUvxTPLl/EaNWBA74vvUkTxrqtmYjNLmay
	viMkCk5Ya+vIiI/2vABiimuXJW2AJVlOVXIoiHPzoOcFAjrAoJi/hKwPTZrNRvL0LXiydtD358eQ6
	hx8Ol7UJJ7PfPrTcepu7ecunu/n5PLHAvi4ngTemnbVyiGG7vV4b5D2PDoltMS9n3AU1wxy8dByw2
	yp7HJiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGkP-0000000GgKi-3cTg;
	Thu, 16 Jul 2026 07:43:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGkO-0000000GgKY-1NB6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 07:43:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDC9843C8B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B554B1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784187787;
	bh=vClHeog58KNqWH8CCWBc/ZspAK1VXs4jFJuykhl903U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GKvlLjtigec06rS4zHMLnidYeHW74IQ4uSCnp0hcH1K/O2C3GQDf3Q7fg24nHNU2A
	 A1WEo5w5u/YwtkWERLdLHscDGFED0JTEYBup+wz4dWIzRuhfDLXi9jvMyEl6+dM2cI
	 +lU43pEiPZ2HZeY1xziYypsiej0SdJuAAoPU64gSltHwKwJJ9d3yEXLmBTW4Un/Zn0
	 87uHk9TQuQbHVn4Io0AnCuqOhZheuEC9iWnZbkFQBdO1gjYXTuwRb5ENItRaWTHjXz
	 NKlVugm5FhmvKa1Yc7FK14JbY3T1BCS2CemvjYVFqhpj5y4MPBd/aAozyKAEbu9e7D
	 4zgS2Gz5WKdhA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso7062345e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 00:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpd+y8xBgE47PNkbQZeqFmP43CndQcxXtLSevHczcPr60PsYDa4t/k+i2525VtjI8UgrYtgZGNTPSJO6bL6hGOt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/iq9DcccrXPeHjWPO7F437UG86DREwhbfEMiM73kxPQ+6u1rV
	Jp6mngt7elFWEXvE+WiELMjsK+yT6iwPU1kmwk5mYwCp8tfXs9mSNlF9DaByZOXTLW1h2DlCyk6
	H4f/Af+0U4QJ7S0RsIBwKcs8SZaW94cICO227RXlOWQ==
X-Received: by 2002:a05:6512:131f:b0:5ae:b130:1e1 with SMTP id
 2adb3069b0e04-5b15d78ec38mr1636875e87.28.1784187786412; Thu, 16 Jul 2026
 00:43:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 00:43:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 00:43:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <alewA9ubkYKHpnuj@linaro.org>
MIME-Version: 1.0
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
 <alYGGu7_3G6mJAzQ@linaro.org> <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
 <alepDnRJmRLbFGRQ@vaman> <alewA9ubkYKHpnuj@linaro.org>
Date: Thu, 16 Jul 2026 00:43:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>
X-Gm-Features: AUfX_mzRskw0QsuLe9nseN2xcUB6TP8BPyj9JPMV-mxeetGr6n2mWyZ5pOfIYHc
Message-ID: <CAMRc=McZK1=S2SFgpCjtHSRecY0SiQWbBqsUxGX1w4229s2yKg@mail.gmail.com>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM locking
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Udit Tiwari <quic_utiwari@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, 
	Andy Gross <agross@codeaurora.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 15 Jul 2026 18:06:27 +0200, Stephan Gerhold
<stephan.gerhold@linaro.org> said:
> On Wed, Jul 15, 2026 at 09:06:46PM +0530, Vinod Koul wrote:
>> On 15-07-26, 14:43, Bartosz Golaszewski wrote:
>> > On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
>

...

> I would avoid using struct dma_slave_config->dst_addr (like in v11) [1]
> though, since it's more a "address to dummy register" now than the
> actual dst_addr of the peripheral. That's why I suggested
> struct dma_slave_config->peripheral_config.

As in:

struct bam_dma_peripheral_config {
	phys_addr_t scratchpad_addr;
};

struct dma_slave_config cfg = { .peripheral_config = &scratchpad_addr };

?

Bart

