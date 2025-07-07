Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEBCC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgefRmwWFnLKksEjR/mE3fDGyeNnfCLVBN4aw7Do+mU=; b=cJOMxSALBEd+dQe0XkS2gj/IOp
	nXVwcmwoxKN65VzGVDPtNYh1i89w716pL9KdujfvrQRoi7F3RvJVuwkj3AI0OcAOVBlSI8hRXqmqY
	I2VRmJgVCDEqMqOj3MZ8GPAPCrpgbQlFRzxGO4FLRKOT6cOtOLeGXjd9u4JurYJ3P4Zi3jDpAodq9
	4G9/5iwearesE65FpTwQnem7JJMEWtAw3ysQbWp+ebc3fBR++JNGjmc/tmfJeWyfnFvJrzvBEK6K5
	7rlA4LANjMut2n+c9YYJbzAIPN6gcQQIOm9E1oruWl+OEV2DzzPraEKckI8FLiws3UvzDk0IjfYv2
	6RFIc8sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuvk-00000003kqW-1ZrS;
	Mon, 07 Jul 2025 23:07:24 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYutP-00000003keg-13Kz;
	Mon, 07 Jul 2025 23:05:00 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4a9b09ba106so23928371cf.2;
        Mon, 07 Jul 2025 16:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751929498; x=1752534298; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AgefRmwWFnLKksEjR/mE3fDGyeNnfCLVBN4aw7Do+mU=;
        b=ZL9w1Wm9f5URnB7uycLDf/LMiL3LiiidrocMIOm/FsS0QJ/eGtVFFEC+5mhMeTboRW
         wKX6Oa0xXvPcQhLwMxwewlhNpZwHrOlZ5cRL+jrSrueERyn6d57DzVRBmfMGEDivJnEA
         3uRH+Bbcj6nP7z76QDBSWlGSFFlbA+rPT5JvV2f4KXpAE6j7bQqLlEo3xr/kAyvzS7ns
         d8F2WqnyYW2os9FxGgLqGifxQ9BDxC3GEwM/oZsWqi8XZXe5xtL3ZAqb6OMU9MRIJHQq
         dUH4lWZuY8asG7L4kwb55JYALkHLeiim5N/Oa5hS6x/iV8T95p6MsItPhNUZ/Tuf1zVA
         2Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751929498; x=1752534298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgefRmwWFnLKksEjR/mE3fDGyeNnfCLVBN4aw7Do+mU=;
        b=VhbDCzojWS1jtJZ5f8zZqWwyI8HgdrCy6dIcy/RwsHRapNErESnomdc5yxj5UHgyMz
         spFBV4GbqCbyPqpW4hNCmJHBcc68q2K7qV5Y+Wq0ykeIz1zD0S/UjxIxuq0k9R5L+v4E
         wc1xz6yoYqMpIE4rH281DxQBNFeDRLDpz3C+k8Vj1qxYqOEKcMZkXnxYGIHtxHQu7LBh
         zbR9jgqeCMdc7nJQZLC074dTO5dIoV/93M+SZpNJaRzE4ve9ABEsmp042Q+Hqdye5o7G
         Q21ZitaOXkmO04jMLSOXF4cSqx+z9YxJ/nvndcQ5/71zXvw+xTCtvmO/gciCwsh/9qHt
         AI1w==
X-Forwarded-Encrypted: i=1; AJvYcCUxcE5TreO/njHQAOM7ILOGPZPE1ZUDQDKgt2/jMiqrJnnuMJCm1m/inLlhE1zB1b7mYo8XIytiVhzffy2K67Q3@lists.infradead.org, AJvYcCWe130z3tsZ6KL5sWGldfuWBh+tkLqbqOiE2eTqt2WN1tNQblnRG/nf/yjQ6DdfP9FrqiccMwXqP225@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoj6uQ7LnwyW5UjQzxaQUag8iwHQRsKs5yCukwLyZnf0W7IK3k
	O7YR+40owEoCV0C70U+jBKMdBgZGfI6txWwfp1RkRK9gUCPa+o3sk9Uq
X-Gm-Gg: ASbGncs7Pd9RMXd86CnHlDvtrXPMnUqVMCkyO0x5iLp2bs0JXcmmQrHGJa4yyv14sXl
	a6X+hs6QesyF6htZYZM2ALI3vJ11mo4dfGSbeOJw0Qaj6H35ncuGybTttvadZz4tqCAJCyGDQ/E
	YgWNJWfRdOXH/Qf7r4nqnYltL4Afo3ja9O/nmnFu8cdl6TF9BYJxeFa8h4mfl1x/3LGEP9Q5duo
	DqqROoo/4T9n17AoLe9fYnzC2NZ2tSbsKZFpaOf6OGxPy+lVxZkFMiKC9Gxv+2i9NE5Ygq5ejfI
	q95RsUBZYE8xO+fYu0J7/OmmkguXRzytR3Cv00kT/0Xt3NkEk4owyNq3rIP0
X-Google-Smtp-Source: AGHT+IEt38/qMtWKaR5SjIM0klOgkEeJMtKfunHHkkfEhSFc7UanZ5qQT5SVRGp91gGzCD3coMx+HA==
X-Received: by 2002:a05:622a:255:b0:4a5:8387:8b9f with SMTP id d75a77b69052e-4a99647dcebmr219861971cf.15.1751929497497;
        Mon, 07 Jul 2025 16:04:57 -0700 (PDT)
Received: from geday ([2804:7f2:800b:a5e6::dead:c001])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949fbe79sm71274421cf.31.2025.07.07.16.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:04:56 -0700 (PDT)
Date: Mon, 7 Jul 2025 20:04:45 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v9 1/4] PCI: rockchip: Use standard PCIe defines
Message-ID: <aGxSjb17kz2--_Sf@geday>
References: <e81700ef4b49f584bc8834bfb07b6d8995fc1f42.1751322015.git.geraldogabriel@gmail.com>
 <20250707222210.GA2114615@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707222210.GA2114615@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_160459_290941_12CB0D3B 
X-CRM114-Status: GOOD (  13.08  )
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

On Mon, Jul 07, 2025 at 05:22:10PM -0500, Bjorn Helgaas wrote:
> On Mon, Jun 30, 2025 at 07:24:41PM -0300, Geraldo Nascimento wrote:
> > Current code uses custom-defined register offsets and bitfields for
> > standard PCIe registers. Change to using standard PCIe defines. Since
> > we are now using standard PCIe defines, drop unused custom-defined ones,
> > which are now referenced from offset at added Capabilities Register.
> 
> > @@ -278,10 +278,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
> >  		power = power / 10;
> >  	}
> >  
> > -	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCR);
> > -	status |= (power << PCIE_RC_CONFIG_DCR_CSPL_SHIFT) |
> > -		  (scale << PCIE_RC_CONFIG_DCR_CPLS_SHIFT);
> > -	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
> > +	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
> > +	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
> > +	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);
> 
> Added #include <linux/bitfield.h> for this:
> 
>   CC      drivers/pci/controller/pcie-rockchip-host.o
> drivers/pci/controller/pcie-rockchip-host.c: In function ‘rockchip_pcie_set_power_limit’:
> drivers/pci/controller/pcie-rockchip-host.c:272:24: error: implicit declaration of function ‘FIELD_MAX’ [-Werror=implicit-function-declaration]
>   272 |         while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
>       |                        ^~~~~~~~~
> drivers/pci/controller/pcie-rockchip-host.c:282:19: error: implicit declaration of function ‘FIELD_PREP’ [-Werror=implicit-function-declaration]
>   282 |         status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
>       |                   ^~~~~~~~~~
>

Hi Bjorn,

Ugh, what a miss! Thank you for taking care of this!

Geraldo Nascimento

