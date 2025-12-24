Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32826E74917
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6LC33FrBHnFwijckLFQe8PlcMlhWZbaNpDq7Z3k5U4=; b=kbrAUQ7d0ZgNLnn3FXraKqdy/w
	oYbJ3sJrLzwe1XkiOfnTrTf7HyvFqlNBL0659/F5yWFTKaXxctNXuBtJdq/ZJiPAzVj8ypcwhV7U0
	rwwo0VmqtlE8cG+5RS4HvkuSpv8YSDVd26O9qqASFPwNDb2Fp/JzW9gox9uz60RRblthe1k62Op1z
	1snJqmPlTW9tppMTuJO3/EYZbjwrvRmJVNiqJ9/ZuWFgYjjUXHG34JuJos5dgwvuTVuQuAiQKth2a
	HjJuwJKxqxHsiZD3HHLVbKU8bpzb6z4az8Bjbn7o4+SshOZTPiVQL8iZI9RRTqBSBbqAxIfYyg+rH
	ysfYsZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHGl-0000000GQPV-2PTU;
	Wed, 24 Dec 2025 05:18:43 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYHGi-0000000GQOj-1hkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 05:18:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64d2c50f0d6so4628872a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 21:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766553518; x=1767158318; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u6LC33FrBHnFwijckLFQe8PlcMlhWZbaNpDq7Z3k5U4=;
        b=WUPy5kTDXDg4zXBAYz6d5MJDGRIQLbmmtgWRzinrVn0wt09L0yPFsZOZKuboVpReIB
         JsLf5u83t5uyleRh3QZphz5aRgrAaFFioFXSirok10LNL31C+y19UjpG4E9Knb0MYyDm
         nf8ayhYHb7WVvGuQ2ZMyr7JNnIJfBEVew5zDwmzWsk6Im9Dp7aO/HEj+Mf8qW3znaJot
         SYFp7CYCjS5ICeQ5wE9qXOGMIHyUftTZyeB6fMebS2KK9pFPn63/2D1n4qbkr6y23kX/
         /g/F+ZAp1O1RFJtJpc4JWH3liP9+dDTEMth16gcEFX0xM3ojwdkpVVMigTqBX04C3RUV
         EQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766553518; x=1767158318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6LC33FrBHnFwijckLFQe8PlcMlhWZbaNpDq7Z3k5U4=;
        b=wMT2Zz3dqYuA+TnIg31BGiVRNChjijSCQNAGj5znaKqVXL7sh+i5Jxz52AQSJ/OIbp
         z7KMSddOMGVmgx6LtrR3sN5s5vMlSQ2KwnyIK+gBWv97D4+SUYaWm+JxrY0zCle+G0b6
         zG4Y4wHFE+5eHfywyRD6IednpWoWA49Dpx42fv7tKJQN8wX2mZ+fIi7yQddpnPj4AQRF
         gNbEfK5R7e6ZIXmMcuikRD6ij/K2+DmmoLX3BUo8uUNxq4wYbZnJ41MDHgtVdWJgtcue
         i6o75KGmYoBHOSYThSiVGjBxeybvI3/j95V6hcbhq4jMCEM3LJZo3jCqDGK8NM6qVVGq
         bEvg==
X-Forwarded-Encrypted: i=1; AJvYcCUpsb6ChADWne8tLLTYFcHM+1nQfFBYxFa1zqVXS3wZySOrdut/WfgGYDzI8Vg5CL+32Repot5mMHqHklw3uQQe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/s+P65ye/LeIoO3vlOzv/2NvwcvpzvugD5SxmXQ4PlWjuhU2b
	sEqLJ/ZauVKG6N5zLsFbbjS+DV+XCRYhZvLsVxnX4hxNsD4e+hCUS/M6a3smKTWjIhcoM4UhpKQ
	n5rJrINSFKr5/rQj77Q4a/a7wsifbGl8=
X-Gm-Gg: AY/fxX7ZKKoMMkZcOXHBNYbkvWyh+jAneFg8GBNQ8F19AoxeQR3BWT6D6UNDZJwGG/J
	X7bbF27l294mIwMG6+MZu4I8x0i8MBd3aNveXcVBOL0cnIXFIcKq5hLQRca7V/y1Mx72c0P7MjD
	rEGUD9dmcpluXgE4m155AFZmN2dhsyMpDkFgA5XyRQzk7KlXf34k2/FBGhGh1UTJy+RF1gGcOG8
	y6OP5701VYpW4EiKCuRr7pJEzw5oQJi+QZgUuhAhNzI2NUt5acCPrORALbrwD1qVBc=
X-Google-Smtp-Source: AGHT+IE5dtPIKyU8ptUI2hkdMI7fwbMdU7esjAJmTvjiO17a7ITetL6IcJCGHQwxARRvQd0qeb1vLtgPofOSuLa2c5M=
X-Received: by 2002:a05:6402:5188:b0:64b:572e:6ba5 with SMTP id
 4fb4d7f45d1cf-64b8e93c0dbmr15294044a12.4.1766553517792; Tue, 23 Dec 2025
 21:18:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763415705.git.geraldogabriel@gmail.com> <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
In-Reply-To: <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 24 Dec 2025 10:48:20 +0530
X-Gm-Features: AQt7F2pedp4R-xyN_-ijj3Fu8brq9lijlFOC48RK9mmQXfW6wy7VvzSVIN4mKhs
Message-ID: <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Jonker <jbx6244@gmail.com>, Dragan Simic <dsimic@manjaro.org>, 
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_211840_467299_EB44EE64 
X-CRM114-Status: GOOD (  22.64  )
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

Hi Geraldo,

On Tue, 18 Nov 2025 at 03:17, Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Shawn Lin from Rockchip has reiterated that there may be danger in using
> their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT change
> from the default and drive at 2.5 GT/s only, even if the DT
> max-link-speed property is invalid or inexistent.
>
> This change is corroborated by RK3399 official datasheet [1], which
> says maximum link speed for this platform is 2.5 GT/s.
>
> [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
>
To accurately determine the operating speed, we can leverage the
PCIE_CLIENT_BASIC_STATUS0/1 fields.
This provides a dynamic mechanism to resolve the issue.

[1] https://github.com/torvalds/linux/blob/master/drivers/pci/controller/pcie-rockchip-ep.c#L533-L595

Thanks
-Anand

> Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> index 0f88da378805..992ccf4b139e 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -66,8 +66,14 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
>         }
>
>         rockchip->link_gen = of_pci_get_max_link_speed(node);
> -       if (rockchip->link_gen < 0 || rockchip->link_gen > 2)
> -               rockchip->link_gen = 2;
> +       if (rockchip->link_gen < 0 || rockchip->link_gen > 2) {
> +               rockchip->link_gen = 1;
> +               dev_warn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
> +       }
> +       else if (rockchip->link_gen == 2) {
> +               rockchip->link_gen = 1;
> +               dev_warn(dev, "5.0 GT/s is dangerous, set to 2.5 GT/s\n");
> +       }
>
>         for (i = 0; i < ROCKCHIP_NUM_PM_RSTS; i++)
>                 rockchip->pm_rsts[i].id = rockchip_pci_pm_rsts[i];
> --
> 2.49.0
>
>

