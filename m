Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC84CD3441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 01:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUp9XSelBvHam5yKb7kd4Uyi0l9skDUn0FSAP36J340=; b=Vw+6BSWnKxHs06c8LWlPV//6ua
	qWOd/1Z+lkUb84iA4oS/hOMWGqiyrrPUwfg+DXSKdw7SQT5YIhLY/2280eBw2B/V6Y30WqF9kLZMF
	mC5YZERSXkBxRuJmUUSZat///u9DwSsxIcxC+O2x1SvPhQLjrMQl1bmbaL4NrkEtiH3grxL4bFfQj
	5SvJNDYjdNnlQZMtN/Qc4kiZEjejIpFX6sGKIkSkJ2J8shbtDS8vZ1F4aDio9Xh3ZsBUBo/ei9C/K
	SiFAgcG/IAHScbC7c+p1hEeihg1yki8EnYFN2rwff4Q/xbVLo1qAy7y9dNEAz6PdsUJQ1Rg3a7oGa
	8XWhWHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLpz-00000009hfS-3aQN;
	Thu, 13 Nov 2025 01:09:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLpy-00000009hf1-2XB5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Nov 2025 01:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HUp9XSelBvHam5yKb7kd4Uyi0l9skDUn0FSAP36J340=; b=FfftLiNswqlZQeLbNm12p9w3sx
	iObFgUqRPH0wV8SnV2zqAy37ZTHTKYkxQOfgSvh7yLgoRY7XOalVXHjujcrXsUGqwDytizie1p5aJ
	u5q6QMRCtLTUjvQiJAJ5yfOVw884taVG1XAtOCExeRQBeP+taSJpVrlSy5rOwPoLOE8Fy2wYAtL1e
	VfG+98luP24RocfFYAFsTw40i8xGrEM0TsSm8EkrRcWOtmp7Vqn88XCvC+B7NKLbvw6emjGwumFYy
	MRK5LPrSQ2Z/E+pwRn+JQrQgYkC7VA5qkFm7FjDD00ePmys0jsT9xyBVO8fp6v4zoOBb0ERRZorsI
	qB+WWVFw==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJKyF-0000000GjJ2-1OPF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 00:13:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso171879b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 17:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762996155; x=1763600955; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HUp9XSelBvHam5yKb7kd4Uyi0l9skDUn0FSAP36J340=;
        b=HEcq0w56cJ+Gb8xvOC6XmDw4MK+81x+7WDcPaTJZvEu8Xgyf2EQVHEzQwNhBoZhrOC
         ZjZzCRdWH8Vd77rD4wR9FLGAA4hybw8+LcfApkinBqkABOu+lZGQWsZSR5zBlcbbV1Go
         mzuBJuEyyMyF/KSAJ8lx6IGc988Zlr+8q4QtZ7KlegNdC2QZnEFCTY7EZtgeUP58TsNT
         4Tf5OnIQ+W600ltUmdi9Vg6A0utfdxBdX/npD1LL1DO/btByn5mjgs02oMTxvUEKDjDW
         vdJdDFzYJtWzjus5n2pGwac8BacSWntYOJVwPYV0cMPGblU6A6msMVhbPjYse422ExO6
         Nt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762996155; x=1763600955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUp9XSelBvHam5yKb7kd4Uyi0l9skDUn0FSAP36J340=;
        b=jjekv8ln0Lv3+o+ux3JB5RRK01Chfsghr21gUAf9LXuI6y1t8byv6Tiae+2THcYLmt
         Ucra2cxcBTtAWToQqsGMwGELsRS/ViT/pHBoo4yfoibTCuvylCN99URffbQCc1jg2q01
         g9BKaBsi6FHorpShg8rrXVclmaxRKHc3DflXB0VCth+uNlh0/nrDh2zcIWbVtOneqGZg
         wBfo9RUmsf6xH8rirsCSFqG9aD0QzKnuLQwP9nkrN4aotS00QDnpGIdQ4T8hJ9SqKlP6
         ivLeONemFZ9D/fxMQGpEp1eij7BJ8irok75OmTid06K8yEwr5w2dpFlr0n161YTCIQA9
         GOLA==
X-Forwarded-Encrypted: i=1; AJvYcCXBd5+fv89mTKA6Uf2boz1HCWDrTHV1n4vTrh4iV1r47Km/YRcI/cZMoryb426SDzl8GLekU9xnQVyyiXQryF/I@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3nTzS16W5EWKphFQSLL0P51j+BsFFjz34UIj//IbbScNY+tw2
	k3ab/hOqtqgYEkqAfkw9XxhMd6zH6vN+NqznbQOtK4DF6D/k3cjrTH+K
X-Gm-Gg: ASbGncvHVBtDbqgaeXzA/c3bikoFow4PCHc28feIefYteoMntfN8XnvlTVbso7nvUZP
	6PFTjDjiE7yTiD2u61JVSEOE/fuggP6pJT/OuLEBfBNhhUz20P5iOqnjlLdRkghha+aytV3sYzL
	OwEGC1hES6o8vpE761ujlen7nn5LC97lCgC2Vw0xiWlqa/kmC8DOCtCI8RfzPOS9SReFKoC8NJo
	aToBEWOv9QJjG+Hk5asg+R0hz9JJMInBekvo7OhpeXHDCt2WZo0jBPFEuz1/xDbCKcgN5FghMGI
	yZYCbGOPGIa/vbKHKqDXWuZe9cD5HDEBxfagXsHhbGniTtvpuqW6rvXytraC68heog2cgvsnNPZ
	+wy2pKmZPN6MBYzI3KsdxorMjlJAxRNf/jQEu3djEICNzYC8nzk3q
X-Google-Smtp-Source: AGHT+IG6mp0E78VSvu/3qqFMgI1T8YiQOF856a+2bF57H7GUKPTtbD8FuO+l8D99yBgWDvvJxeroug==
X-Received: by 2002:a05:6a20:7f92:b0:344:97a7:8c68 with SMTP id adf61e73a8af0-3590bb147d7mr5734286637.54.1762996154814;
        Wed, 12 Nov 2025 17:09:14 -0800 (PST)
Received: from geday ([2804:7f2:8082:3106::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927826dc9sm303318b3a.53.2025.11.12.17.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:09:14 -0800 (PST)
Date: Wed, 12 Nov 2025 22:09:03 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: =?utf-8?B?5byg54Oo?= <ye.zhang@rock-chips.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aRUvr0UggTYkkCZ_@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
 <aQ1c7ZDycxiOIy8Y@geday>
 <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
 <aRLEbfsmXnGwyigS@geday>
 <AGsAmwCFJj0ZQ4vKzrqC84rs.3.1762847224180.Hmail.ye.zhang@rock-chips.com>
 <aRQ_R90S8T82th45@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRQ_R90S8T82th45@geday>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_001352_398926_5B38F09D 
X-CRM114-Status: GOOD (  24.68  )
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

On Wed, Nov 12, 2025 at 05:03:32AM -0300, Geraldo Nascimento wrote:
> On Tue, Nov 11, 2025 at 03:47:04PM +0800, 张烨 wrote:
> > Hi Geraldo,
> > 
> > In standard GPIO operations, the typical practice is to set the output level first before configuring the direction as output. This approach helps avoid outputting an uncertain voltage level at the instant when the direction switches from input to output.
> 
> Thanks for the explanation Ye Zhang, it makes sense to me. It avoids the
> pin to not be floating so to speak. I kept hammering at this problem, by
> the way is PCIe PERST# side-band signal refusing to co-operate and
> failing PCIe initial link-training.
> 
> You're not going to like this:
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 47174eb3ba76..fea2c55992e8 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -183,11 +183,13 @@ static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
>  	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
>  	unsigned long flags;
>  
> +	rockchip_gpio_set_direction(gc, offset, true);
> +
>  	raw_spin_lock_irqsave(&bank->slock, flags);
>  	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
>  	raw_spin_unlock_irqrestore(&bank->slock, flags);
>  
> -	return 0;
> +	return rockchip_gpio_set_direction(gc, offset, false);
>  }
>  
>  static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)
> 
> By setting direction INPUT, then writing out, then setting OUTPUT again
> miraculously it doesn't fail initial link training, with no other
> changes that already have been rejected by PCI folks and Shawn Lin.

Hi Ye, Shawn,

Here's more contained workaround without resorting to clearing DDR to
INPUT for every GPIO:

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..1d89131ec6ac 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -315,7 +315,8 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 			    PCIE_CLIENT_CONFIG);
 
 	msleep(PCIE_T_PVPERL_MS);
-	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
+	gpiod_direction_input(rockchip->perst_gpio);
+	gpiod_direction_output(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
 
This results in working PCIe for me, pass initial link training.

I think I need to provide more details:

GPIO in question is GPIO0-12 / GPIO0-PB4. On RK3399PRO VMARC schematic
it's called PCIE_PERST#_3.3V and it's in the PMUIO1 domain.

Without workaround I have about 6 milliseconds, from driver probe and
parsing of DT that sets initial value 0 for GPIO, to deassert PERST#
by setting it high. Which is why just removing msleep(PCIE_T_PVPERL_MS)
produced working PCIe for me.

After the ~6 ms it becomes necessary to hack direction to input then
setting direction to output to properly deassert PERST# and proceed
with initial link training - which is why, again, hacking PERST# as
either open-drain with pull-up or open-source with pull-down worked:
gpiolib hacks that by setting direction INPUT.

Thanks,
Geraldo Nascimento

