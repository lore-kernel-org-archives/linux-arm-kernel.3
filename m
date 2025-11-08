Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0A2CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=; b=U0gEZgxF0GNcPVnKY+mCs4wCJ0
	jPrVQnbWlqfmRuT/gvS/cHr5N5uXUCiX3mTXco3xPs/U2+yF5pGOxy1LfuGI0xeGT8jej7s1Hee1B
	QympMclRv/kv0xmidwlivW0sl7EjQxsUnHkIJRAAXQVrrL+1G/WzEKTjrd5Tbo0PzpthtPft89Xrx
	4pl3AdYuYKsJlFYoe4Jsx292ugTgHO+bImc4oeJq7NXEowica7O1PwQD96z2CNKYYANG+1W+rzpK1
	I/sUxu+07seWZAMI1fwZ+34QmbmHDZZW68N27yUdMBMxVotl31V5asirbgPlq+VU1FUqzzvv2ETV9
	5Np6s3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi63-0000000372V-19k8;
	Sat, 08 Nov 2025 12:31:11 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi60-0000000370o-0wLA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 12:31:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b9f1d0126e6so1021965a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 04:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605067; x=1763209867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=X4Dr+pkbxK6mPAb21GwdJxmUq4lxC+WL176LO/GZFBG+yIgj3/vnS8NBxI8bpKutwh
         t+EN8YVBdnLUnj+3c+QNDdlMIeJPOCoqJEDWYdfqG8qePxyHp2xYKozcNAP1G78xVANB
         k6UbxZnSoAP6PXkx3w/y6Yyo+rwS76SDrFb2F9wqU+dJXYfEXMRt8bhaOJ9G9F0SsCXL
         FtFqFilwD3IeInkrbfcbnnefruC8M3EOK4AWmvhukMwZLQL++asEkcL9xEFyw+xAZCwO
         KhEjAr69GIHnGBcZY9mBnuUiUxezqOD4mODgNAqwYQXq95lqWyvxp5pBJWi0JQtl5cn/
         2qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605067; x=1763209867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=efWQGwsXmTrx5EWU6gVLHuOxNxZx+sPP+1TMVhHSwLFgpS2D8BaL5ohnChbSeOH0q5
         oVQEwe763Vb1K8onHXXpwf8Jsk6y0hfn+QAoi7TblYAoAipC54B4A6nIAV/6Q8e3wN+z
         cQH4oqRyYka/L+jBEK5sk9D1GSuUdrVOCNdHVjYbcJrRjZhQIrwBqmngsD/izVQgnCJi
         U1HRkIf+C/CuAlsJ3m8Fn4iX0dSyw+EidOK1CSnT1gqhChJH0xYHipzhXC4nwVUN6ufD
         0Es+e9ppZBS4IAuEpDqS1LWKR8CL59uV9tjDH0LBrqiVfUTjvKnmmaHQHefrs6ID2A0c
         loVw==
X-Forwarded-Encrypted: i=1; AJvYcCV0BvZyu5PvgNCwtTkZO0ejZWgdVNp0ApT3LoZWHu15vhBoOkpApn6drDdokYoBy/3iyOurj1GBPDJ0+wM4i0X3@lists.infradead.org
X-Gm-Message-State: AOJu0YzKo+d5hX055EtAKmz8C2K1xKGEyzDMoT1ZqJnEcFBDwMGETrCR
	9EFV1u3+kvhJG4hifNh3Kj3niLhCh5Y7zaoDpJ4tdxpe6QkuLHs+WBT22ytCUFB0gP+EELvZgHX
	w0rAChhq4uB/igbY6XeKtpTBpT9+cQdE=
X-Gm-Gg: ASbGncvp5n6MnV1cgEXsboZEVm89CS1D0xk93bbeoSTtph8Hj7LC47vT36QYJY4WEqC
	mvIC6al1sSx/8H0zBgutI9jubn0PVCwxZSorffUbmKC8sYWi0Lq3is3KY5MPclcIkdtI83qJrjj
	SvXZg8yrIvdaObu9vMeoFYp+Qmm8Zk9I1jfQDiRoaEFuvADYrKzBamoBYA7YdptntuTCsKCik7z
	t5OoEiK3F17VDMGXz7k8+CkafPAusHYGKNmqLwwIxfTYDtfV6+kzZmye6qbQPhXcj3sNtv1+m8z
	D3TiUzR1N2+hMLVN
X-Google-Smtp-Source: AGHT+IEuHvgMZMmDRNRPAfeOAymHEAn1hYvpEGWDduP2LeVblYn4NjcSRVQL/UdeJaq1Z4u9o2SDmDIZmKAPg0jARQs=
X-Received: by 2002:a17:903:3804:b0:295:5898:ff5c with SMTP id
 d9443c01a7336-297e1e3429emr34741885ad.16.1762605067406; Sat, 08 Nov 2025
 04:31:07 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:56 +0100
X-Gm-Features: AWmQ_bkQCCCHuH8ylnNhyHhFQTUKFqSEN4LNOb9Me0YP6OYeddbK-4LWE8Q83H4
Message-ID: <CAFBinCDf4rHs-Q1ZVo_WqF1r8_aLJ745B0tG+=6NpmbBOe2c9A@mail.gmail.com>
Subject: Re: [PATCH net-next 08/16] net: stmmac: meson8b: use phy_intf_sel directly
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_043108_339529_1009B990 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

On Fri, Nov 7, 2025 at 3:29=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Rearrange meson_axg_set_phy_mode() to use phy_intf_sel directly,
> converting it to the register field for meson8b_dwmac_mask_bits().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

