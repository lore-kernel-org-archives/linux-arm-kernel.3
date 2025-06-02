Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48502C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGO9sUY+r7vqr6gLOI6qlkiYKXTKtTQAWLD2mIokncE=; b=utL20P38defvOM
	Ge1oycEurv3JEtmDB25vZVQrEXUfPt5aeWZkMP5gCCVmDBLAclIVUKjZy1yWXFJ/7ZFJA6Ct6OM1O
	jjwzQTymfa8kfHTEhbMapD7JEN73+C6K98tAtFzOVKnz1fZtJgWwhqA3T/BuFl0YzH8NoFMDZzOr/
	xiNNrRIulE5iqV/CaHuUGT0WIrBmVvU8M6ee/ovWuXTIIDi1NguAwgj2kwRH66J2fI5fWQtyqmAYU
	PCVK21Lr3z9/vt+vLuPapzby8k528FkmzYIHN2HYclIzW5BnyKdmTxNbp+0t9I7qMgtXNxuW7VHDx
	TyflkALcNhCpVmoBumJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2GR-00000007AwN-3SMf;
	Mon, 02 Jun 2025 10:19:31 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM2EE-00000007AlG-3AqY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 10:17:16 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5532a30ac45so4267771e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748859432; x=1749464232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGO9sUY+r7vqr6gLOI6qlkiYKXTKtTQAWLD2mIokncE=;
        b=hZrdMThebhl3Xy1UFa/lqmgm/DQd4OhrteoCfJzXZj9JLoQEv8GUpQGZg0A/MNSyOO
         epz0Ijjli0T/b8gh8uN5DRDRh/qhUUvr2a+wBFbyhHDLPHVrch+2f3fMn8gRqPI2aZoP
         kq9Ap6VOpWw/F33NH/q3dw9mtS7Zz6XZGIsf1xK/Mzk7cgjc+woG3M+Dm9V8LAgRbNcc
         BTYux+B4PaExAZkFc/axuJ0qWCSwYjAwC7LqzE/NnZjXYnThJdIdkM6Qh+OPRK0EK2lw
         Z+0f3Cwv2hYXhK/2/caNY/zEMEE62v8Rqkhm41yWkNoxHb8UOQrNBtKsqxisVGWGt10h
         LzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859432; x=1749464232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGO9sUY+r7vqr6gLOI6qlkiYKXTKtTQAWLD2mIokncE=;
        b=E6I649AuZ4eY3DXbFoRmMMgYWfVq35UHfMfOj/hjCPvaniqAsU2T9WWwCDRCuntPnN
         nFRjz0CvoRUmWSSjrydltTNob+zaLWqqVTmTLP7bgkCBGScpZ2e+IftfbgwJtk0DbhBi
         60kHiEDyeObwJDvTDKFSGgSrlvdp9fPAlTkt7pbm3/FXxVMO7gdEq2Ypo5GDloLXjUgt
         kbROIvdrl1PmzSe5zl+Fj0Xdt42ItIDCROxA0R9l3BkzUSHu/TsyaIb0Y8tnjwbyzkGx
         YkZe4iPUTzlN/ZoZIlI3CnJGPuTVPiLwjBv6QojYB9NDxQEXdBHT1vcAUl1+0oWs/oEG
         +XWg==
X-Gm-Message-State: AOJu0Yz1/munBGA68w7Hc5hirAibVLj/FteutHJpyyuQ63WR/rZhE3G/
	idhprUScrnr4uUvfblUslRBZPmaUJK4uBe3JkSKCGt9KGzgkBMi6zBf4pTTYsdTZf9UCFFy1oW7
	iWcYnI1x2kmZlEl0t37opZBjtqoGSYvEG1FcJSVbEdw==
X-Gm-Gg: ASbGnctQSYcf7xtGQ9vQoShBOxAnBC0ln0sA3sE+mSNMz9xD6Lx/scHBe+jYg6e5dj8
	30iRQCLpS3TZ5L5oX+SuKDEraXQOz+jKv4OUUpsk04BEZFVU1WTj7cpGpcvHnPDYOR1M/mIIZcq
	/ndjIF1bmbJ9XbAjGqTE2lr3/6g4dkRmMRtNhUZ04XtWWfGi4a74gJZ8DHxuHMYwpP
X-Google-Smtp-Source: AGHT+IE2ScFlgSOO/jzGpylrUkqPYvdmuNlMMD0/AntL/Q/1ICr4QgrhpUxX3vIEoEkKGY8aofftc7B/+e+Cne9Hayk=
X-Received: by 2002:a05:6512:1108:b0:553:2927:9864 with SMTP id
 2adb3069b0e04-5533ba23ab1mr3564157e87.6.1748859432178; Mon, 02 Jun 2025
 03:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 12:17:01 +0200
X-Gm-Features: AX0GCFsfGl-iahXc2ZEy1lSOQx3uH8u4YrEEg6MXx4A4twZNi28c07s79G74fwQ
Message-ID: <CAMRc=MckQhB4diiWc+Rtk84PtwaKqr34At3heT0vyAgJ9VA7Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_031714_900349_85FDE7F3 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, May 31, 2025 at 12:55=E2=80=AFAM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Add the ability to enable optional slot clock into the pwrctrl driver.
> This is used to enable slot clock in split-clock topologies, where the
> PCIe host/controller supply and PCIe slot supply are not provided by
> the same clock. The PCIe host/controller clock should be described in
> the controller node as the controller clock, while the slot clock should
> be described in controller bridge/slot subnode.
>
> Example DT snippet:
> &pcicontroller {
>     clocks =3D <&clk_dif 0>;             /* PCIe controller clock */
>
>     pci@0,0 {
>         #address-cells =3D <3>;
>         #size-cells =3D <2>;
>         reg =3D <0x0 0x0 0x0 0x0 0x0>;
>         compatible =3D "pciclass,0604";
>         device_type =3D "pci";
>         clocks =3D <&clk_dif 1>;         /* PCIe slot clock */
>         vpcie3v3-supply =3D <&reg_3p3v>;
>         ranges;
>     };
> };
>
> Example clock topology:
>  ____________                    ____________
> |  PCIe host |                  | PCIe slot  |
> |            |                  |            |
> |    PCIe RX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>PCI=
e TX    |
> |    PCIe TX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>PCI=
e RX    |
> |            |                  |            |
> |   PCIe CLK<|=3D=3D=3D=3D=3D=3D..  ..=3D=3D=3D=3D=3D=3D|>PCIe CLK   |
> '------------'      ||  ||      '------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|=3D=3D=3D=3D=3D=3D''  ||
> |   CLK DIF1<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
>
> Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

