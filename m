Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8909CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 05:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkVWF0ngwpu5gjmUkFjpcBqAffFGeLSngYlAxMCWNV0=; b=E378eV3lxubP4dK7aLakZn4fZr
	QDrVkd7EnB1cZv80acAUZKI+59BytXX8h1YiwzQ7R53hm+5wLpv8tXOgJ08HNtPTDIT0WBewpj0pu
	FDmMvTMoQt7hf7/m6kBCQJZWsmd6CRedlZkXbM4u+xSYWUkXBJ4gbvZRYd0VriW0zTyeyTSPdx6Kz
	UlhiuJxooyIs4iwIM9G3vhAjggNuxuY8RUiAzd/4WYMpyNne7LeVwXn+qQfmFxUvRWJAHGM3Ti2dX
	yKo7qMH49MVD+4aZRyrSFbMCpaBrhi4s4JE7VHnACY6ZKBBzg14pRu8Gzn8uZyyR/ABkrsiV46c1v
	Q7hj+KoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9zrO-00000009a2L-3SEt;
	Sat, 18 Oct 2025 05:52:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9zrM-00000009a1a-0MVY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 05:52:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b40f11a1027so482724266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 22:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760766726; x=1761371526; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkVWF0ngwpu5gjmUkFjpcBqAffFGeLSngYlAxMCWNV0=;
        b=iu48dSjBltVMX2WjszzZFiyUPfJkCDFTTg6gfHPR/NMpWppaPCsqezC7CB1mEfmjT5
         EuMyLKn8qXklwVtVKg8HIpf7jwarxmXWGTeuXz7WvoukA+hKCEYqOtaBd4yGzK9jNU7t
         Wvrh2u6qrwBaocOM5dj/H6Z6s+g/PwHtq6IvQBhZgS68Wrj0xT11fSzC7Wz9dQbEel2U
         mKqZHAOoAwvVsYFXXiznJjSFgKmCyMX4UJ4Vcyzey0+USCcN68Qh7XL4fjj7ERo2v27g
         9PJXNuas31ZdXNzqLTC/h7qGM7/PL+glA4iFiR3JQt78meQfnnkEMGWhDHMzsnbRbKnn
         EkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760766726; x=1761371526;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkVWF0ngwpu5gjmUkFjpcBqAffFGeLSngYlAxMCWNV0=;
        b=XONFVjbBxSj4mwzHOgEMkB0xH1VvsQAOT/zmYqedYzi8YpGikUJfpq3PHOvG4uzZzo
         TPvK8r9D2+4vpNtB1z/nnvjmSj/9Wb4IT4LJZARnzBd+unlvqNs1T0WRVqnpBQ/FY+tl
         6CQJPkJqqJC04rAwLKqn2FUKTREZO7q4PTioIdp66h5o6Va6s7VAv/WzpQeS7U5zwrZr
         qvWOESmfgHEqMRBfOwcSMJmRGr8asiOFIUXIlyQK1mGexgfw9bHQhJm9oaBsXMiL5nQ7
         LoCj31bxtnPtStntVI/2uaC19rvrU3ZGYAQdqPut8U8DZq4JH7Aeof9S66sQnETJomdP
         nqOA==
X-Forwarded-Encrypted: i=1; AJvYcCVf9wJJhHSXpLE0yHzeyTpofrBOon3mjJh8L2KmXXo7aFiKtlXbQnl10XI14g6IygeILUcPb9AcZFnWRfbHXOok@lists.infradead.org
X-Gm-Message-State: AOJu0YwVATwLzFDn3+cWYbrG/rRuMFMabowO3RyxfnY8T/QvN/arbwvO
	a6MDn9NzpncotHqhgvNerz453GcpFQBelSBcalLzsPL/cS7LGF8YI/pkYQTtSxcQAtoB6GQWoRa
	sz9dOLa8GODV++VA87Lg8fY+4qOYzg+w=
X-Gm-Gg: ASbGncsOtxdsgBR1syEnIabgwuAMbn399NyBy6kIIfnPPYO6l8xejajukI9ZbR4qNis
	fgMqv949IhEQByBVLnCS0YYDdxDbsrKlmeG81vT2weyB2OQDPQkQGvxLzJXqLTVmV5KwlDJ2AXC
	P/Bwou5Wq/nb0k37+8RS9pAyTcMT7Sm9hWlv5wZZ9WocEdpYuRzLYNyayovqG58flMMELEsXAzj
	8u0VfEvfMgKy+zxPtPNVdjKl3tVlvv8e3/WE3Cfn1JMsRiYnt08aMEUcik=
X-Google-Smtp-Source: AGHT+IHuqMvBUAMmL2+i6khAnSMhUO84EZpiF6pSY+Ggw9UrirqcHM0DEhpRmnuNAVMZheRxglA2Cg7yTmFpgfufuzs=
X-Received: by 2002:a17:907:980f:b0:b3c:3c8e:189d with SMTP id
 a640c23a62f3a-b6474b37113mr708732666b.32.1760766725511; Fri, 17 Oct 2025
 22:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250905112736.6401-1-linux.amoon@gmail.com>
In-Reply-To: <20250905112736.6401-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 18 Oct 2025 11:21:49 +0530
X-Gm-Features: AS18NWDdHdJKGAdSzak2dkZBd_DEUB1KqNHSK63I8rxE-Co_iHsMbvelUCu7ZEc
Message-ID: <CANAwSgSYvTJ=8hv_BrrF1v7u3hq5AB_BSfT7wj0-LQF87dQMUQ@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: dw-rockchip: Simplify regulator setup with devm_regulator_get_enable_optional()
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_225208_159675_66F6396A 
X-CRM114-Status: GOOD (  14.01  )
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

Hi All,

On Fri, 5 Sept 2025 at 16:57, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Replace manual get/enable logic with devm_regulator_get_enable_optional()
> to reduce boilerplate and improve error handling. This devm helper ensures
> the regulator is enabled during probe and automatically disabled on driver
> removal. Dropping the vpcie3v3 struct member eliminates redundant state
> tracking, resulting in cleaner and more maintainable code.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 23 +++++--------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
>
If we compile the kernel with phy and regulator as modules,
I observe this message.

[   25.473960][   T55] platform 3c0800000.pcie: deferred probe
pending: platform: supplier regulator-vcc3v3-pcie not ready
[   25.474071][   T55] platform fe0a0000.hdmi: deferred probe pending:
platform: wait for supplier /i2c@fdd40000/pmic@20/regulators/LDO_REG9
[   25.474124][   T55] platform regulator-vcc5v0-usb-otg: deferred
probe pending: reg-fixed-voltage: can't get GPIO
[   25.474171][   T55] platform fdc20000.syscon:io-domains: deferred
probe pending: platform: wait for supplier
/i2c@fdd40000/pmic@20/regulators/SWITCH_REG1
[   25.474218][   T55] platform cpufreq-dt: deferred probe pending:
(reason unknown)
[   25.474264][   T55] platform regulator-vcc3v3-pcie: deferred probe
pending: reg-fixed-voltage: can't get GPIO
[   25.474343][   T55] rockchip-pm-domain
fdd90000.power-management:power-controller: Timed out. Forcing
sync_state()
[   37.744968][ T2415] psi: inconsistent task state!
task=2280:(udev-worker) cpu=1 psi_flags=4 clear=0 set=4
[   37.849725][   T50] fan53555-regulator 3-001c: FAN53555 Option[12]
Rev[15] Detected!
[   37.990008][ T2216] SCSI subsystem initialized

Thanks
-Anand

