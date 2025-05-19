Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E7DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6baiB+VhScKnBJFcGjroRlH3n+JmifYkI1E83/dxc7w=; b=rYCwPbS2KYzQ6eeckO1fsBNH/K
	6m/IvM+dlAV/DY7YJhmnsxOUBwcyzvNFz1ecKtILl/H8ARbXC3c+XDmwGeJ4fBhTBEV2LI02hSq9f
	OBwOGM28IFblU/QsRpKnkwTgcpalc8QOKdXKx2dLiW5SZezIovGZhT/e/k4t+jnAAxrvKXCrRzVjD
	64BADvRWqS9pwF0ghr2HgJqOuVDMUEJnAVTkDC7qrUDHMdhrs5SHcHpGn1TzU3G9BY2C3Q4OTvg+Z
	M2rzE2Ez+WftWA7ldu96ayxOGULVgJOllJwE83q3grGNb5ZYKL8S9myVAtusWNBndqLF0012aiz+z
	gonW6fNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzML-000000096Zy-3WLD;
	Mon, 19 May 2025 12:12:45 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzK0-000000096Gd-1wmx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:10:22 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso799598766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 05:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747656618; x=1748261418; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6baiB+VhScKnBJFcGjroRlH3n+JmifYkI1E83/dxc7w=;
        b=DCLdnbfALANyocZoXA6nqCmpug4Nvut7ixIh6T4EbsL6kbZktWANZjiKqEc/0IDjKO
         QCLGdfkv+lzEos7vEgskQvr2xNWt3g5zc9IfVBZnZ1n4/0bArvju5XKjECdl+OnJnpjs
         /IVp9edoh4SacH6PP8sFLe3gc0f9NJLX0du11gZKSq2C3P753ha6hShlGqCHqcBVncsN
         zI9Nq7Gd0TjXwGTEr0x4Jo23+KwWs0hpqUMpcTeGC+iEqXJAyu9hAHUHMt9dJ7+qxqcn
         gdOGp0XAw7xJKYWNqFukn3cDJjkEB44+bSvhYZ8FruGy8kvJcDZWCKfxIlzlMA26exvZ
         cxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656618; x=1748261418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6baiB+VhScKnBJFcGjroRlH3n+JmifYkI1E83/dxc7w=;
        b=EPSZHxgjxAR09BWrclBLiHNtZFCMySduvn8NVbfwLvRIt1nTQip+BFncvNZBd6NBxS
         J/stOJcDQfDePC2xMpl0J6U360Y1noJ4Wuug3L6/ysJawU4Lirm6wipqWLIpyrJPbRHU
         xENfXx15ZBm7wJnqc9dd2haJaXRDFO7Nm7q+rFSgWA1/anW6BEwzKhfKTbbKuXZVAxdn
         YIYKHCTKUg9w4yLwnkOm+jFFZoE7kvAHQJYS8g0TfRaaSrme5b/8rzCaCewx/7QP1yNn
         02Ny/Vbpng9eZxJasN4ft5TjN7cavUUH3dz02afw4chN6dRphpkTzjDZuhZtNoUFoxGI
         +rMA==
X-Forwarded-Encrypted: i=1; AJvYcCUBNbRFHdqKV+moAv+fZVdFrIohoVuRZ/tAb4qRwhlxiYdyAPSY5C1rbzZro48rcciI2PnkH0aqS/4t8K2oAbkD@lists.infradead.org
X-Gm-Message-State: AOJu0YwxkOPN7fBkxFRqRBolc/v82A4Ld5E6RNMQ19vG5I7Ps1RoZCqW
	0mq+t1ERo9M4sC0bJoGnEsWN252YtBGxJMBiD9JTB/z6KFYJr9oU+8/49i/wgrDoCA==
X-Gm-Gg: ASbGncu4TnRUsZmeCG2cXGDz5VhZeqYgtPsQEmT/ucXQEBAYqGV3qqNohDEnfOoK2jo
	bZTUnHhbiA+7dBp3f00hFBOtH3Gm+UOaWN+EKYjrtX9h7cjogbOePZ/6Sn+VgWDnLS6HyfaOJvr
	7QQfJST22wEiHbKKzmUHA7wG19KrVzM9+V3oYIqr2wtOBtCF/BPpkl/qe1r5utr3BE2USXoO9pw
	BFRkNS4SkkuW3/Qfe7dCYcuvce1W+QUzVDZrQRzE6ZP370YFLnFKNBEHKaPFbW7cSYfaTukTzJ4
	h6CUloYjb0QKfqPrsseUUzQ1B+fLRHQxscdg/HBhoHNyKhpA1KmxW8wbVCx9tRp/C3SuIrb3wqQ
	Owh1W6Wk+bHiikL72zfheOXC+M0Vw7hOU3Q==
X-Google-Smtp-Source: AGHT+IHpTwdnK5YFZhkdVK9LBLESGLHcc/FhT6MMJ8mFqjOpeOo+JiJr1fFrHlhNHE5cLqHy2HqRNQ==
X-Received: by 2002:a17:907:7f16:b0:ad5:5210:749c with SMTP id a640c23a62f3a-ad5521075fbmr644487766b.22.1747656618307;
        Mon, 19 May 2025 05:10:18 -0700 (PDT)
Received: from thinkpad (host-87-20-215-169.retail.telecomitalia.it. [87.20.215.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e80asm580893166b.2.2025.05.19.05.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 05:10:17 -0700 (PDT)
Date: Mon, 19 May 2025 13:10:16 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Laszlo Fiat <laszlo.fiat@proton.me>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krishna chaitanya chundru <quic_krichai@quicinc.com>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Hans Zhang <18255117159@163.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <jbl77lwvxvjeeaed5jiavv3nwfctjqpuhvbzha2fucsdgoulss@u6xjrckk4so3>
References: <20250506073934.433176-6-cassel@kernel.org>
 <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7>
 <aCNSBqWM-HM2vX7K@ryzen>
 <fCMPjWu_crgW5GkH4DJd17WBjnCAsb363N9N_h6ld1i8NqNNGR9PTpQWAO9-kwv4DUL6um48dwP0GJ8GmdL4uQf-WniBepwuxTEhjmbBnug=@proton.me>
 <aCcMrtTus-QTNNiu@ryzen>
 <5l0eAX7zaDMDMp1vJhvB9MVKXSPn3Ra0ZiP5e2q1E4rwmADBB6MlREZO9cuD_zvclAOhhBE0-NFthVbOajeSCfYjchT-83OgLbjclOgx3T4=@proton.me>
 <aCr9cYhtcBJZ-9Fj@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCr9cYhtcBJZ-9Fj@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051020_502992_3C8E769E 
X-CRM114-Status: GOOD (  24.46  )
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

On Mon, May 19, 2025 at 11:44:17AM +0200, Niklas Cassel wrote:
> On Fri, May 16, 2025 at 06:48:59PM +0000, Laszlo Fiat wrote:
> > 
> > I have compiled a vanilla 6.12.28, that booted fine, as expeced. Then compiled a  version with the patch directly above.
> > 
> > >  We expect the link to come up, but that you will not be able to mount rootfs.
> > >  
> > 
> > That is exactly what happened. 
> > 
> > >  If that is the case, we are certain that the this patch series is 100% needed
> > >  for your device to have the same functional behavior as before.
> > 
> > That is the case.
> 
> Laszlo,
> 
> Thank you for verifying!
> 
> > 
> > Bye,
> > 
> > Laszlo Fiat 
> 
> Mani, Krzysztof,
> 
> It does indeed seem like the reason for this regression is that this weird
> NVMe drive requires some additional time after link up to be ready.
> 
> This series does re-add a similar delay, but in the 'link up' IRQ thread,
> so even with this series, things are nicer than before (where we had an
> unconditional delay after starting the link).
> 
> Do you require any additional changes?
> 

No. Sorry for the delay in getting back. I was at Linaro Connect last week and
had to take some vacation for the first half of this week.

It is fine with me to add the delay only in the Rockchip platform where the
issue was reported (next time please mention the issue that triggered the series
in the cover letter). But I do not want to add the same in Qcom platform as the
delay is not strictly required as per the spec (if I understood it properly).

So I'll merge rest of the 3 patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

