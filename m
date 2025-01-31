Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3814BC02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAyBmC8BK8RqSQxjO0l92eUElKo+PkN36EJuLz3uhtk=; b=LN2uFxY7DI8fegRpB6+RUeTV+C
	rf9/Vqfna8DQ8AQfpJWh/pEE3O/OOzAytCpS+0aqzQJ68kSPO6x5x0IQBnoqhRvvpfue1WUfX+n3j
	+DVicQd2QWrRvfVJJD+5SMmymnhZ/r/rs25YOuWZLI2ocuHbj6YH1ORoVE3lGzhN3DrkZV3j+AR0J
	lWxXdeGPeazcCrjw336IGqB5BFqWwhfSwwAH4/1nSBgXDSxMahK7vR0pZXwDjFWRPN+cxfFjPkQzH
	Xc0V9U2w+6bwdPS1uwEwW6qur1G/5dwXXDgcMtTXuPOKiI9Sk1PK1jOhnoUopoSEbm7o/8p6r0orQ
	0IKe+8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtWA-0000000Auxd-1UDd;
	Fri, 31 Jan 2025 16:05:18 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtUq-0000000Aujf-2ck6;
	Fri, 31 Jan 2025 16:03:57 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5174db4e34eso1990165e0c.0;
        Fri, 31 Jan 2025 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738339435; x=1738944235; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAyBmC8BK8RqSQxjO0l92eUElKo+PkN36EJuLz3uhtk=;
        b=EjmZSJtPXUOKORdVKmRg1C/SHSR7Qw8opTF7NBOHshMojUCFBq3cvigZISVV7bGMS+
         k+D22B14+wtQTV/wu5SI6G5ND6XwKwtIXdaXN2iSX1njiJjozomFpYvUmM1c1IgHnneX
         ak8QcYHzku1hiZFbfBtHQAIVJtJsVeCPEtLqaBb94zQAPFb+PTp5ymFOwZ/LiO5BryDr
         XLEfQiU4RohG7iM6Kl6FHorrT9eWQv2NF0w2uQX/YxsAq6y7+LNJJhYgcruW3uNo/gew
         7WQsEA0qfhSh7UKRqsUhMpHJFRrVwJlDdeZ8M2ssVU91xkXGAGG+Bl3k+C08WeX9ciyu
         +j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738339435; x=1738944235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAyBmC8BK8RqSQxjO0l92eUElKo+PkN36EJuLz3uhtk=;
        b=Z5rGz9rmHwPcWt7Gv5376AjJRMEK5MyHqpL9WuCTQ7z8FHRtIMdP7lpiOGKnD5IxwT
         7tNV6hkU0embOrp5SuI5R/JOFhT/Ximh0ZzNyD+p8JmrTJ7NV/fox41mkvrNCU52jD9b
         iJk9gX6mLz2a9TnVjn0JUyRrzVn2XmS7rspCQCDqbw83HiEdl6mFz+Um7OCwFMP/mg6E
         s+knAdSD1s6mXHUXwEl+JYE3rh1+pBfApivByAs4xYEhpzgLG2uON+nq4b3WBzkiY4mo
         WCYW3k4eNaMHuu84sZaeI/naaxf09QnPVQTdY9FJIjaS6G50U2RSZ9ksd+2rekVh48OZ
         gWzw==
X-Forwarded-Encrypted: i=1; AJvYcCUTjtamKNSVZiSn7/SDTbPaum1Xa7K4kFjPyu6JF2RSBAekY4NWgmSloUOl0C69GJg6ojv1qr5n9zpLfMrlBsIx@lists.infradead.org, AJvYcCWBr/jsjkU10WQ0vYtLTvQeb3ugIxOysuvACezC7FDABzy2sgQCRXbtcsOAq9GbnRxKQiAtXsTHihs4Z2elPDFJPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvbfB6lJY8NYEH3vxHgyVn/SJa7DTBeaRmGj5RW2sHx8qfR7BB
	pYajntVN7olvzACvvA9WMJYllzRbwP7Zx0zR5k0MO9O8GHEkZiHOEoJDbLRAnR/iJkjQOs0m6mw
	Mvyp80MfrZPzyerTATf0ga5KqY0s=
X-Gm-Gg: ASbGncuQ3R2fjHvC0Wbgo9JK2x1GwXiKoRm6vrPp0sD0W2owq4mP19UStquzP6nymhb
	hEdGMXlwk4JaNacP7iKCjFtAK3EydD8xPE0LNP9VZLwNpJX2qG0qabSYjvWyUKRSv9KQNVd5jnA
	==
X-Google-Smtp-Source: AGHT+IGVYpJEqeRGvHRVFOu+mqGM1cy9fp5OorflsRPh0dKlcs/2Fk1DjrNBh82WBXeKvz6ZGvvqQhpFan+we0SyLFI=
X-Received: by 2002:a05:6122:2bd2:b0:517:e7b7:d04b with SMTP id
 71dfb90a1353d-51ebe66645fmr1897860e0c.5.1738339434912; Fri, 31 Jan 2025
 08:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20250120130119.671119-1-svarbanov@suse.de> <20250120130119.671119-6-svarbanov@suse.de>
In-Reply-To: <20250120130119.671119-6-svarbanov@suse.de>
From: Jim Quinlan <jim2101024@gmail.com>
Date: Fri, 31 Jan 2025 11:03:43 -0500
X-Gm-Features: AWEUYZli7pQbCxCkE2FzhKEzWWUvoQ8-B0Rzl4WvtuTu72KdBjpfuztyPC_Spuo
Message-ID: <CANCKTBvy=eqEbBjGTB9_=1J1dv3LP1pr48cTA3e=x4p_DTnVOQ@mail.gmail.com>
Subject: Re: [PATCH v5 -next 05/11] PCI: brcmstb: Expand inbound window size
 up to 64GB
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_080356_660307_EAE477AB 
X-CRM114-Status: GOOD (  15.44  )
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

On Mon, Jan 20, 2025 at 8:01=E2=80=AFAM Stanimir Varbanov <svarbanov@suse.d=
e> wrote:
>
> BCM2712 memory map can support up to 64GB of system memory, thus expand
> the inbound window size in calculation helper function.
>
> The change is save for the currently supported SoCs that has smaller
> inbound window sizes.
>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Jim Quinlan <james.quinlan@broadcom.com>

> ---
> v4 -> v5:
>  - No changes.
>
>  drivers/pci/controller/pcie-brcmstb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controll=
er/pcie-brcmstb.c
> index 48b2747d8c98..59190d8be0fb 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -304,8 +304,8 @@ static int brcm_pcie_encode_ibar_size(u64 size)
>         if (log2_in >=3D 12 && log2_in <=3D 15)
>                 /* Covers 4KB to 32KB (inclusive) */
>                 return (log2_in - 12) + 0x1c;
> -       else if (log2_in >=3D 16 && log2_in <=3D 35)
> -               /* Covers 64KB to 32GB, (inclusive) */
> +       else if (log2_in >=3D 16 && log2_in <=3D 36)
> +               /* Covers 64KB to 64GB, (inclusive) */
>                 return log2_in - 15;
>         /* Something is awry so disable */
>         return 0;
> --
> 2.47.0
>

