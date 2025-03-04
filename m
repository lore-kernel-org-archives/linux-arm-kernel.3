Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9CDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXtflJVWFreoh2RfRDMWyYTeNxkucDM+/OLgGz1etxI=; b=pOoovBTSh3rZSicGeXsntK5Sd1
	a33uWScvPd5HU64/7e/wFdpWh19eWxE8f4qzt0TkCZooi/Orc1QGsZXTQPIp8JvG3JSoOZ5geQZvh
	AtMp9N+VPZJen2JlrVZnoHkzGbWOfJb8BFCSR/+9HGviKvwxIzH9vnA+mFIFRp6pagXyw1PzTD5Zq
	Q+4nW9/qhvDtEpZkdeFaSZGAlqvEtbMaQCnXJwvnKXPTiG//FocYKORYNKnCaE/ctsHpNT33E02oj
	4hTUbfIdYe666cHIxv0RHu17kZfRnCUHV6kFgxXyKhxbDCevFn8S48iwx1Cl9O7akkqcRR2if6jFO
	DPzHqVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUtN-00000005NIz-1OwR;
	Tue, 04 Mar 2025 16:13:13 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTtl-000000058V4-04Vi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:09:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22339936bbfso85437565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741100972; x=1741705772; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXtflJVWFreoh2RfRDMWyYTeNxkucDM+/OLgGz1etxI=;
        b=PIJFhJaMq5+t1xmFiRxKFkCNivZrOG5kX1ppMiHMVsRaLDYv/JP6ciAHW+HdRoeRSd
         XNr9S96A7jT3DSnX6YLiVyvV9NpqSqaf25aqr8auy/oasiOYXgyepqYj2dn7b4KcSrOU
         bdH+ycADGM6fCN/I1A3w/Joq4lxEYOd5RoI6bK589WzG0dwuTxIv0AJApWK2sMVbEU4A
         mm2m3YbeeToQSzzj+edeXlzsctfVr4wrM9IrSojwDj2YhkAYWvqUdceyr5z1yqTg2U2s
         FyPOI5yV6g3xeSaF/hH3Cz7wabQNaTSgURV7ih9j1ytMm+VMNkEblGUDW3dwFj/TmA2i
         KpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100972; x=1741705772;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXtflJVWFreoh2RfRDMWyYTeNxkucDM+/OLgGz1etxI=;
        b=Y/XgB4s4KzxTAfYZmleZUJWfR8yNMBtdbLM8zrc1DkFZ1W4bZXuO/ImznT7SbDAgFe
         JWRrnMEBUOKiefLxnJ8KdAJbimpLxIecwfd990uKJGm2gR24kx+vWLNMPN3SfoCyzRm6
         GS6uicMoY1826vbh4+4D5o7UvSkbhlFn5n6kdCNtA/XnGrziSB2vWYQ7tyZEdf/oOG6K
         nJqT4A8ggfzHwqYpOy31bfPHwDq9Zubhbfg3itTbPWEHj1+b5l346Vxz6giBBmk0IsPF
         hninSRjBaxfy2bmvq+Sxp5KGXn0oIQiRh6zSTIfeaa5uZctvbisaGhOxG7aU9glfAL9u
         UvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyWRnvJXGY/PV8/Gkj1QMDAnHvnif0pkFIrxCAmJum/gs3SFywGTyx5V/tls1MxtMmrbnjqBsRcXJCQcruB7CN@lists.infradead.org
X-Gm-Message-State: AOJu0YyQbGPO2yYwdkP5tWbqhGukHNexU9ZgBkClLbtkbJwB3LlGemMa
	OeYo2qsHJJPf3V6ZIhMagMwEvQSHzwX81Y8t5EXkjAFB6OqhJcBo8HKcpvTcJA==
X-Gm-Gg: ASbGncsyj3K1fnyU2tAxULRfLvuuebUvn4m9BIWBCzHQhXi0ynLOrOEdwDhey1zsUqz
	DI3M797eVVynnnHay/vuljCTFsvkvIozVVtW3XBm3qPM1sOyfLCpAKkasVZSESYbeeLXM7QxewE
	GEscQ6Fou5H4FPz9/YPDwPk2UipYb6ggvjl7Utn6IIdLnTsTqWOJ8zwthrRYkX8aQqFYEJWZRvO
	vRCeJxxeK+l98tGREcL2ooxj3kdxchLcMhKwRDbGlDCD/OSgzZmOBI5YNssr+XZ+OWWtO7DUJdy
	ExskSwmI6j757bL/BnxQn7vbSt0rCZfQNUpmDky3js8zDLl1dp2k0vc=
X-Google-Smtp-Source: AGHT+IHH3kAeBAzG7ggYHAxEuKnNP4t+N+bzoJzUJ161LlHrI1a78f2EZCVwmMROqGLsC4q+42HbGQ==
X-Received: by 2002:a05:6a20:4310:b0:1ee:c8e7:203c with SMTP id adf61e73a8af0-1f2f4d2edf8mr31762576637.24.1741100972347;
        Tue, 04 Mar 2025 07:09:32 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1a49esm10249081a12.17.2025.03.04.07.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:09:31 -0800 (PST)
Date: Tue, 4 Mar 2025 20:39:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] PCI: brcmstb: Make two changes in MDIO register
 fields
Message-ID: <20250304150924.a6ygwzca3lwgpt7h@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-8-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-8-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070933_074093_8E8ACC4A 
X-CRM114-Status: GOOD (  21.94  )
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

On Fri, Feb 14, 2025 at 12:39:35PM -0500, Jim Quinlan wrote:
> The HW team has decided to "tighten" some field definitions in the MDIO
> packet format.  Fortunately these two changes may be made in a backwards
> compatible manner.
> 
> The CMD field used to be 12 bits and now is one.  This change is backwards
> compatible because the field's starting bit position is unchanged and the
> only commands we've used have values 0 and 1.
> 
> The PORT field's width has been changed from four to five bits.  When
> written, the new bit is not contiguous with the other four.  Fortunately,
> this change is backwards compatible because we have never used anything
> other than 0 for the port field's value.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-brcmstb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 923ac1a03f85..cb897d4b2579 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -175,8 +175,9 @@
>  #define MDIO_PORT0			0x0
>  #define MDIO_DATA_MASK			0x7fffffff
>  #define MDIO_PORT_MASK			0xf0000
> +#define MDIO_PORT_EXT_MASK		0x200000
>  #define MDIO_REGAD_MASK			0xffff
> -#define MDIO_CMD_MASK			0xfff00000
> +#define MDIO_CMD_MASK			0x00100000
>  #define MDIO_CMD_READ			0x1
>  #define MDIO_CMD_WRITE			0x0
>  #define MDIO_DATA_DONE_MASK		0x80000000
> @@ -327,6 +328,7 @@ static u32 brcm_pcie_mdio_form_pkt(int port, int regad, int cmd)
>  {
>  	u32 pkt = 0;
>  
> +	pkt |= FIELD_PREP(MDIO_PORT_EXT_MASK, port >> 4);
>  	pkt |= FIELD_PREP(MDIO_PORT_MASK, port);
>  	pkt |= FIELD_PREP(MDIO_REGAD_MASK, regad);
>  	pkt |= FIELD_PREP(MDIO_CMD_MASK, cmd);
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

