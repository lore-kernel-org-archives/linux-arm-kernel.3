Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6D9D1CA15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 04:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scJvZT2Bp+kcd/IoGZ1ogwNGrXZa1xnJU5qHOxNFIJQ=; b=vVigUmBxh11cBvlgY5S7Hf4FAJ
	o5OU+ZFE3/QUOTT+S9bh92ndbvdOpkbmlRenM17Nttd/DJKHjzCKYwRpefZnuRiunvOhJ93NHBXnr
	ZWRfH9z0wH93cz7e3iGGroC3r2GTQfZQ9k6I+olTn/asL5A6SJPLKO8h77Jxyz0o70B4UifVOvDCV
	ssaFQS9itvKScYeCl1xeJCpAGdpUomabAGwyV+uDELP+oKsGBHUJWc/tk3vRwQ0Ql2bjVkrj8/W36
	YsDGL3l1FgcVJIGgwug39Kmo2GMl7x1KIYQQBStATw9BHlUBlU6ODptnvQhmHkVb0VxEtdkBoxulM
	gSEEQjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Aw0-0000000FqTZ-09AA;
	Tue, 05 Nov 2024 04:12:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8AuC-0000000FqHI-1Oy5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 04:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=scJvZT2Bp+kcd/IoGZ1ogwNGrXZa1xnJU5qHOxNFIJQ=; b=Mhs3gJCHp93clhvbnAtNdHeFk8
	lcSwihPAQPZjvjwIIndcdY0YbYRVRS73BQKaPRJQG4+aD0m7NxMhQP7tmviCFEfjobWpmbGJpsw2L
	y9JIjuJlupcf6wVbA8ASV+jxnU7eOJVmLj/BoIVqZG1LpDFFJrCanhyTPhyGlsqJeK5XA7Eds3EIt
	eDerYmXcy/UH8D+oZwT6KP7etia9mRBmPd2EFIpsFJg9ni08rEP0copV3PsIQ5cW7Q7JMGpqVUlSs
	rzNIf1jWeogXWcX1KHz0m69rGbk8nZl7gPtTD2qk/9pnhNPVPs2oMK45Jt+mAhdmSxBL4kBUVg+UY
	y3Btba6g==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Atw-0000000BfAq-2rth
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 04:10:59 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2dcf4b153so3601954a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 20:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1730779840; x=1731384640; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=scJvZT2Bp+kcd/IoGZ1ogwNGrXZa1xnJU5qHOxNFIJQ=;
        b=e5DC1qLUtzF+882FPU9D8Nsl0o1XL1U0GZ/Kl7hgG30HFP70vZvVV8+JkL/r53o2FA
         gBXAzu+nZvjKlK53In++eLs/uFEfxsMx8yisGX1QaITpUAXgi2kj1LMxb+P5xVEPFE0l
         fg1KSN5h+/E0uKw8HE03gfAWQ471/7R3bJ8wzu00o6r/4+nxpcHqvkT0fAf30/0IKrAL
         vIpqgWUtL/dWDcKrFSylzEO6ItNXUGB0qgzKyPSuYEk/sFjawlyOWo+YNERXDTNRh6bE
         FCwKU22got2zPcc4gKqNLSHI9Syq6IK4n/WfX1zEUtZcfn3oayutGBrjdv+cf/pVh3hM
         3kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730779840; x=1731384640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scJvZT2Bp+kcd/IoGZ1ogwNGrXZa1xnJU5qHOxNFIJQ=;
        b=kghi5ZbMUxSNrM28qIdtLHKD/2fAXxO8zfN3dY0l7oMY/eBhf5FIBdmOSkypUvg054
         /E8/CufWceZ7CWhyJwYBsivRg2Yh0DnDeaMnIY1kU/uSwMX4hF5l//4+ODOFk/JI1vWt
         PZOn47fn61EJ3jfZ6T1VXuy86k4Eedjttewqcgv5/zWLLvAMllr5Dgbw2xyYwy+thtWp
         CJM5ubm0FlLaDwsgGg2bjLNWk2IBBFWZT1D5ZoYkOy6I2KUhUCMgkL2I9ozV/erzVmWE
         HVs57rCXc5TH8ZDfoCl1uwbxGtX0TzPlngY7142tMZeu+NsKmiV4htRq8TLH5kks5Ged
         2Mog==
X-Forwarded-Encrypted: i=1; AJvYcCWYesQvwgNuJeUp6xWLw9jgX6QZ6+2DHEP3Ux/B7h79pLEhfgYiWI9NixnJnLymgHpnwhNBPg4m97N/M0w5yt2s@lists.infradead.org
X-Gm-Message-State: AOJu0YxaDhkiowUszeXu4C8HLk10XvwOwRcAFTEsm7wFru2ZD6MbgYJp
	G8jEfm0HcxZIKxtY67KKpbaLT67OXilGsGoodc809Tf2n4er+hM3Da+KFFYa1kZezATo7kmPs1U
	gnhdMOSuD9ExZz7RvrxvjMMKxrrqSuDpFuXhs5A==
X-Google-Smtp-Source: AGHT+IGScUy3G6UR8gz6wvjEudlraQqlt5Uia9jokVx/2PFVMQBmpLwbRPnyko1K4A9eB9MF28vFRoIVwNeA/WAajBQ=
X-Received: by 2002:a17:90a:6446:b0:2e2:b46f:d92a with SMTP id
 98e67ed59e1d1-2e92ce50e2emr23868289a91.14.1730779839807; Mon, 04 Nov 2024
 20:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
 <20241104092220.2268805-2-naresh.solanki@9elements.com> <ac9698862598f0d09d35872d0e091537f822fbcd.camel@codeconstruct.com.au>
In-Reply-To: <ac9698862598f0d09d35872d0e091537f822fbcd.camel@codeconstruct.com.au>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 5 Nov 2024 09:40:28 +0530
Message-ID: <CABqG17j8RhFpNV+nJ=nLY8+uO_XXjbN55+Ce8op=6Dj5Z=_WOA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: sbp1: IBM sbp1 BMC board
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jdelvare@suse.com, 
	linux@roeck-us.net, sylv@sylv.io, linux-hwmon@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_041050_804575_648D934B 
X-CRM114-Status: GOOD (  17.71  )
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

Hi Andrew,

On Tue, 5 Nov 2024 at 06:03, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Mon, 2024-11-04 at 14:52 +0530, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Add a device tree for IBM sbp1 BMC board which is based on AST2600
> > SOC.
> >
> > sbp1 baseboard has:
> > - support for up to four Sapphire Rapids sockets having 16 DIMMS
> > each.
> >   - 240 core/480 threads at maximum
> > - 32x CPU PCIe slots
> > - 2x M.2 PCH PCIe slots
> > - Dual 200Gbit/s NIC
> > - SPI TPM
> >
> > Added the following:
> > - Indication LEDs
> > - I2C mux & GPIO controller, pin assignments,
> > - Thermister,
> > - Voltage regulator
> > - EEPROM/VPD
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> >
> > ---
> > Changes in V6:
> > - Verified all regulators warning resolved.
>
> How did you verify this? Testing the patches locally, I see:
>
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu2@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu1@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu3@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: regulator@5f: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: pvccinfaon-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>    +/home/andrew/src/kernel.org/linux/origin/build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: mp2973-pvccin-pvccfa-cpu0@58: 'regulators' does not match any of the regexes: 'pinctrl-[0-9]+'
>    +       from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
>
> From a spot check, the warnings seem legitimate. Did you send the right
> patches?
Just checked again. They are resolved. But I guess the dtbinding patch
for the above warning are merged in hwmon-next branch & not in dt/next

Regards,
Naresh
>
> Andrew

