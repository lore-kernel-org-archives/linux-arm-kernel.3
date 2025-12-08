Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCF7D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 15:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koYXwoTEJsoPLyEPiz9nEdjQYdWChY6O9/DUrMalYaU=; b=rlyOHoZVbAMgRuQQOjdaAuviFm
	Y9DNIJh5nsqXBY1PE9ER2n7F/k6YmisetC06mb5HOyQ55UyTgGx8vm5Qn3zTM6X8R3DMPpNQvMcXx
	oPD9pJhBVLuS4kif9OWowfiVf44WJiVO/+/W1fHzQtTkSEurpmudBX5Anu02SMc9zMbqPwXqo8ZCJ
	HDYafbimeHSTS/CMorbfN2F8tYXsy9Cruu40Cc6M/CMqNDZZkJqXoMr5t2g5UVHr45CD6ySCkmtSy
	H/eEUedqpmszpcZm4l/iXtOmBOInHWlv/eFftJei25iI8LHUbguP1RVru9FAcVdf7H5QR7tSoi2kK
	ESunMwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScpk-0000000DDrY-0BFp;
	Mon, 08 Dec 2025 15:07:28 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScpg-0000000DDqc-3BI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 15:07:26 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-641e9422473so3773836d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 07:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765206443; x=1765811243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koYXwoTEJsoPLyEPiz9nEdjQYdWChY6O9/DUrMalYaU=;
        b=aTzePrtzQqPtSNTqRBZcwpr0pXIvsKLpON+pryfpI2miTWQdz9Ib6yxY1USVSGduuf
         ZjZFPthblEIGNPTGS+iZDoUEdxtbUN7X8/KGL8NRFdIB+OiQdAhavV2NdoRCgQWT8+nR
         H0eIPoTWvIhParqEZF9tXSvWhx36D0AmMCrBqXqz49Oux8xOCsBv+NjD1j8i8BXbkID5
         TNmK8x+RSmhry5YyapMCvgH52d5+2Ed2PP0VFV5Q7xBDITmPk6bwj8ZltI4DLyWWt+ql
         T5dRbdQcS+S5o23huSNHo86bgsd2YuOkgRt9ogST2KlelAHxJ7Rt2kTSrtKEDU7dlhwH
         tnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765206443; x=1765811243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=koYXwoTEJsoPLyEPiz9nEdjQYdWChY6O9/DUrMalYaU=;
        b=tUZ1NIG4FMJxazdLoI0HEIUmPpjjk/t+YYhm0YDK1NgHqV9gYpQQMX5wZbBm1oacDA
         UdphmyNPVjvHSc6XdWnKvy+3KXo1w3pmJtl979fpcFrRHiG0TK60fgx5VG0WQ3+GiojL
         WcYoqjAzoACAR40rkbbxVoQyzI1D3Hx/jYnllytfbZJWxYe4AT3FCVryz45gJNOJJ/Ot
         bQ01cPLISy350ulIznR0QvayROAFm2XbVsx16z37ZdSjoFIQHtaFwqm6+dasacwJoLjI
         tfl+3emTuD6VELGM/rZCu2v0BfZbcFd2wmiMQjSbAwMTp6X4+dFAobqmkLBeqVVCAbJu
         KDSg==
X-Forwarded-Encrypted: i=1; AJvYcCVHI37xbuTv6aqZ8CGkeS+LlQaJPoZssQbgGtSYatO425vJIMAU7B39MwqTNoayx4OMSWtvY40W/OL4fSgEFtLZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+UN9doaarrqVcmTR13UutIliRudsBkzvt8Gqf9rdqOLzQv5Vu
	D0O1tVOdbF3AkvxrEnu2Wm1u5BA8fVLDyLHI/Cjk6snEXd4HhiN8JJo/CNP+k5DU34EzZHqAZf3
	Gb3MNj/biMkk3OeokezMTl9TyX3AhvLw=
X-Gm-Gg: ASbGncsrVvaBPYretfjqhNRVqlNAx26IxeupTNxPIIM7uYSfp+KDYxwPV8vOWcd//zJ
	kK+cw0T1pX1JKaZ2Pvzin66ts0R3MMc1SyfsJiJxx8UIobsyNm/pcNICt0RsDNesDt0dOhP+L8p
	6Z7uJbbgyG50SxYLbfikHPyee0yziRMHPIvJ1CtxApLvw+FjWi9iSVRl34XAZp/LS0odkxQEVRd
	3j5OvpsA6rWzFyNBbSrxb9fHzU3JPpSvHrxjoGZQDvkWamGXEyGn3lUYQ89vit2cBC+ni3kpg==
X-Google-Smtp-Source: AGHT+IGYRXraUxNnTs25uPKI9qFKKJh9msu75YD1kNeHN+uqbvLo7zPFytcHo2xWkyYJWdyrK6Tt95u9MkZVGc/NOaA=
X-Received: by 2002:a05:690c:46c1:b0:78c:24d2:8e46 with SMTP id
 00721157ae682-78c33b641a6mr128823087b3.23.1765206442917; Mon, 08 Dec 2025
 07:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20251207123447.93233-1-madhurkumar004@gmail.com>
In-Reply-To: <20251207123447.93233-1-madhurkumar004@gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 8 Dec 2025 16:07:11 +0100
X-Gm-Features: AQt7F2pKE5CQRUA_xL32Yk7vUOwJ69Im78h8OWjd5vaMan4AvHfoEZP3-zr1coc
Message-ID: <CAOiHx=n8osZ=b=MVNsxAKEtxDvNgt1ESohLNMWoz43c9RwNfOA@mail.gmail.com>
Subject: Re: [PATCH] drivers: net: wireless: Replace deprecated PCI function
To: Madhur Kumar <madhurkumar004@gmail.com>
Cc: nbd@nbd.name, lorenzo@kernel.or, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.co, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_070724_807934_45C2670B 
X-CRM114-Status: GOOD (  15.05  )
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

Hi,

On Sun, Dec 7, 2025 at 1:35=E2=80=AFPM Madhur Kumar <madhurkumar004@gmail.c=
om> wrote:
>
> pcim_iomap_table() and pcim_iomap_regions() have been
> deprecated.
> Replace them with pcim_iomap_region().

The patch subject is wrong, please read
https://wireless.docs.kernel.org/en/latest/en/developers/documentation/subm=
ittingpatches.html

>
> Signed-off-by: Madhur Kumar <madhurkumar004@gmail.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index ec9686183251..5a82c3bf471f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -284,10 +284,6 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 return ret;
>
> -       ret =3D pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> -       if (ret)
> -               return ret;
> -
>         pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>         if (!(cmd & PCI_COMMAND_MEMORY)) {
>                 cmd |=3D PCI_COMMAND_MEMORY;
> @@ -325,7 +321,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>         dev->fw_features =3D features;
>         dev->hif_ops =3D &mt7921_pcie_ops;
>         dev->irq_map =3D &irq_map;
> -       mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
> +       mt76_mmio_init(&dev->mt76, pcim_iomap_region(pdev, 0, pci_name(pd=
ev)));

You are effectively removing the error checking by directly passing
the result of pcim_iomap_region() to mt76_mmio_init(). You need to
first make sure that pcim_iomap_region() succeeded.

Best regards,
Jonas

