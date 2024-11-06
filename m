Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16262D29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCr20x8z8sRkhTPvZqrUzLvN/Ib1WmukL+yzAP4ZNi0=; b=fWhjQEKyySSYVQHMNN42A58fqb
	O11yG88m9jZXZEIq7BSr2G3eEOzvDC4BadK3rHKV2A1Xs2ZXtqsxj6iGBUS37VBuoUKhWPSuM2Kyx
	P4mpdLWyn9E91+/FLzFsCkf5Tjj05KmR4/FN5Aw/2t1vG4p7l7J1hKkGt+RHU86PkHvFYIkhqz0gN
	ex6AMhYI/D/izlZZEUzrJfRiGpvKncowG9JQao26/C4uKs2LUaJNcq2lc/3ZmhYiGqjOGNOVSC3UV
	h3Jbq/7wnH12n4UyojKQX908oTNypzgjj7+Yrls4htb7sjobtXzPWwoJ6flqoovj80pn/JWS7CcsV
	ud/RmBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8p2P-00000004zu2-34Nc;
	Wed, 06 Nov 2024 23:02:09 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8p0f-00000004zgC-4Bt4;
	Wed, 06 Nov 2024 23:00:23 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-84fb1225a89so103151241.2;
        Wed, 06 Nov 2024 15:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730934020; x=1731538820; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCr20x8z8sRkhTPvZqrUzLvN/Ib1WmukL+yzAP4ZNi0=;
        b=ME6SmqLjiiWPDWbbETp0mu1XebWCAiosmvKQgR6FXUJLyhaM9iXNzkFLK1bWrTez4p
         5vp4hwPUJXJzrtdaVwNRVVZGy+J15pvjg+7Yy2tA7QgoJOqO1N+u8zuoj/eJXQNdlDTC
         VdQDcTr5lwuDw3wcliF45OYc8GzmmoxvRnnbk/ULS2OKHxQGo629Qg04yhsKa2DEFy3R
         oa8KsuRPblPv7hvIfsi5dUb30vqxV/IFpaMd+xFCWHUA2KpyEHUwMiYXLI+dS6xFGD4q
         fb9R2PGDH+7fgxZkqLfzMfEYIyIlwFTL+puM8UtWbxgxDg1s+M2qUTPXXW8Qb80oJqrI
         2U4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730934020; x=1731538820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCr20x8z8sRkhTPvZqrUzLvN/Ib1WmukL+yzAP4ZNi0=;
        b=ue6i5eObz94Um514zIQwWq1arMRFlJvZtggBGJvafrX7XAM+3Z0QvxBTTzi6ky0rJd
         1mAnhRU8yGspTnMa7UqkYubjqohYZPNRGUNcvRRI8YUQw28w/6bi+LE2HkRNplN4vUXs
         WIwXnR7CuP8mVvCdcjVIiJJf8O7C+5vC3HaCBidQZk7qhXeuOiRh0sJwPfKqc40eW45h
         DV5B7A6xexu6zodksx418SzHf13QiscameJ931RlZCY8TtkwsGwjQnuw9UZ8f84y4tQc
         gwYBMdwaNiLpCa1k9qMivXep6+FXMTCSAQR9nJFpN7Rfrjbghm+SdhnP3z/ygqXMvCB/
         2GQg==
X-Forwarded-Encrypted: i=1; AJvYcCX6+CwkD9+TcEO3Egm6QIsJtPtgAVa2qq96YeUej74eYCL+LfprMogyKrBDYzvZRNj9/NhDNj1zdM1565Nxpfs=@lists.infradead.org, AJvYcCXtMKp/5sKdoDfrpyIoWkJN7ptc+glqzEHIRYIKqFo+3OXzS8jSMimCY7Qp5jrDcLvm9pRoncyqozX04shq/XAm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4dcsjyxQZyeeDo6ZTkpjwLEp3V4EeL+qF4xZKgDTsWitixvpA
	tO8KGy7+aFGrVKWuwFRXVjAZqGkfLWEsuVha7tv82o1oQqaQQahpMurdGG2Ld2d+Ummr6nyGf4R
	uUcG7NxZ8MP/g+uXgJRh1/LIFbms=
X-Google-Smtp-Source: AGHT+IFo1RR/AdVhpssmUpxzpPIge7KofwhVYW5Ad3uzitsFg+8Ea84XoncezE1UFB6bQpJj6zNAhVjXGdNO8YtEVEY=
X-Received: by 2002:a05:6102:cd2:b0:4a5:ada5:7b27 with SMTP id
 ada2fe7eead31-4a8cfb4c602mr40754597137.9.1730934019692; Wed, 06 Nov 2024
 15:00:19 -0800 (PST)
MIME-Version: 1.0
References: <aca00bd672ee576ad96d279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org>
 <20241105213339.GA1487624@bhelgaas>
In-Reply-To: <20241105213339.GA1487624@bhelgaas>
From: Jim Quinlan <jim2101024@gmail.com>
Date: Wed, 6 Nov 2024 18:00:08 -0500
Message-ID: <CANCKTBuxKA8JdfYMCcGS=CpyuXGiLz1NdereCjqo-_2Er3Pfww@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, linux-mediatek@lists.infradead.org, 
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, nbd@nbd.name, 
	dd@embedd.com, upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
	Jim Quinlan <james.quinlan@broadcom.com>, 
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_150022_068636_A65E46D0 
X-CRM114-Status: GOOD (  22.10  )
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

On Tue, Nov 5, 2024 at 4:33=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> [+cc Jim, Krishna, Vidya, Shashank]
>
> On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > PCIe controller driver.
>
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
>
> > +#define PCIE_EQ_PRESET_01_REG                0x100
> > +#define PCIE_VAL_LN0_DOWNSTREAM              GENMASK(6, 0)
> > +#define PCIE_VAL_LN0_UPSTREAM                GENMASK(14, 8)
> > +#define PCIE_VAL_LN1_DOWNSTREAM              GENMASK(22, 16)
> > +#define PCIE_VAL_LN1_UPSTREAM                GENMASK(30, 24)
> > ...
>
> > +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > +{
> > ...
>
> > +     val =3D FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> > +           FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> > +           FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> > +           FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> > +     writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);

Not sure it is worth the trouble to define fields.  In fact, you are
already combining fields (rec+trans) so why not go further and just
write each lane as a u16?
>
> This looks like it might be for the Lane Equalization Control
> registers (PCIe r6.0, sec 7.7.3.4)?
>
> I would expect those values (0x47, 0x41) to be related to the platform
> design, so maybe not completely determined by the SoC itself?  Jim and
> Krishna have been working on DT schema for the equalization values,
> which seems like the right place for them:
>
> https://lore.kernel.org/linux-pci/20241018182247.41130-2-james.quinlan@br=
oadcom.com/
> https://lore.kernel.org/r/77d3a1a9-c22d-0fd3-5942-91b9a3d74a43@quicinc.co=
m
>
> Maybe that would be applicable here as well?  It would at least be
> nice to use a common #define for the Lane Equalization Control
> register offset from the capability base.

FWIW, these registers are HwInit/RO.  In our (Broadcom) case we have
to write them using an internal  register block that is not visible in
the config space.  In other words, we do not use the cap offset.

Regards,
Jim
Broadcom STB/CM
>
> Although I see that no such #define exists in pci_regs.h, so I guess
> there's nothing to do here yet.
>
> The only users of equalization settings I could find so far are:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/pci/controller/dwc/pcie-tegra194.c?id=3Dv6.11#n832
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/pci/controller/dwc/pcie-qcom-common.c?id=3Dv6.12-rc1#n11
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/pci/controller/pcie-mediatek-gen3.c?id=3Dv6.12-rc1#n909
>
> Bjorn
>

