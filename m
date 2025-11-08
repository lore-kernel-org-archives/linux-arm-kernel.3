Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D9ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=; b=OeWaBvpSrF1+qz/9rUcmqTm4Xg
	Geg/ueRjoXgjw+cWehYKR3zk+3u6QqyEvIcvHFNxaWXSl5x2WVCrxpMkX1fSGLIlQoupbUdVIHXj0
	9HxtIGu0KYMAXXdkMwyclKokyz4jZxLQwMclfLdthaYeP68QVpcX+MR1aQpPC68WBeQmSnZyEeaqs
	jd9duFBn2H7C7TQgPA+s+NCYCDB4f9aTQYTGfetaeaW93vGxrMI9QcVBiPQxiOiorsTUqFMfY7gEQ
	d7e28CdyZ5ljMUXpQ1QRchwxUpjV5f+yfiMYLCp45IQQ6rHmroqeOvRjo6dsBB7ds7y0njbcqkCoM
	Hed6Jp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi6I-0000000379h-3tcb;
	Sat, 08 Nov 2025 12:31:26 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi6G-0000000377z-0z5t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 12:31:25 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3436a97f092so886258a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 04:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605083; x=1763209883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=fIf3w2bVAq5YPmJUA5shFinG41AWqtA8AJ+wOdu6FDdFKb4bFzCoRSv2zscTXlHI9P
         uyA69YFj5QM78PX3FsfqYpO4eVCCzv/jBnJRPVfScrom5RNjPdjn7t7rvTTRu/23y/HP
         UDhdReVDcHcamhCKS2saDgsyiM59bxAH1aVL2Yyh94YEqAkavPusUmK7YR/3xS6LK0Ot
         9s1rt+1mVPIXRhMpoT2g3PPMcyauZVOIRXJb/X7luStQhiD4q057CkEp3dHZf/k0iAkn
         3Q37nk51SLy4BXqEQ8NMO3C2wQvi2v2bz22iDsiTg+DaJimCBId47SsQb147ipow31m4
         e+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605083; x=1763209883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=H14gPQBgaP3UDifKfXz83R9QmxXDdHs9RiSJ0RatwxQNu00AOUEuMyOwt/qJAGdbc0
         hQQ2ATGD9VNx+osEbTfee/79BYP3w0UNzr16hReXp/77+aFUyuQKGEGOB1wByBtVXEap
         NkBwd6Gjw+PYg4bA7GolLflh3UkjCL6pCDoIQ9o+bf33MA0h6k3hPOYSQWLV4VAJawfi
         vGSMWUTruCzXMREyQcBjH62ReYQu7x7OxrAmtxKzLP2vKSyCKUcM6wTb4OV3nmC3dad2
         y7kx+zO4Ai4sSnJvuskXkH2pKmKrehS238qdiNfEueaUSfvVxOeQKK74/b3vS66uxhqc
         FEzw==
X-Forwarded-Encrypted: i=1; AJvYcCXrj8KJWILTp7FP5rd6Bjp08w7cr9IH7kYdNPaOK40EZEw7rpMboHFTIpjTofI4wOWJWkEz+v/sX/T0JnlDVlSi@lists.infradead.org
X-Gm-Message-State: AOJu0YwcvHAUmReaiGuqhFRZ8+Viu5SR+QEksEf7LXLFx2SK7nwUqwFV
	f5pFYcz/kVcAffNbf3LQ7Rzx9OX6520BBppZELEqwuH72Wv/DXHCwU0lF5ZcaFntXI2Zv8fC99A
	Gfs8OE3QMJQlWj8YgVxh1PHwjGyGrbwo=
X-Gm-Gg: ASbGnctp3rKfyoNkM8BioTcdjQCnXfXxXj2Dr+82Fd2hUfvCT6r0fUUUP8+CLVdeVBu
	tcFl3wrCZi5c/JDDY9g/gWpIuh9qcJ/xE2mHKssSChKcZNVLpIP4NoTsjlFG36PbgDcCrUdS7MQ
	0FRR1Y5ax7Kfs5ZBHuT9Z9DiNCE8dSRlmvxO2McBYCLeJ9d4noitke+Q+8+Cn2vhev9CZhgkyeU
	ynuniVi4Hw7U8G6/wRHXXo64F53aeUy7KR+nN8QWnH6m9md6yir3eXKB2EB+k1KHJJJAN9viyFM
	JF6ukWk2mlvfp695shoM+VScU+H2F4+adT4b9A==
X-Google-Smtp-Source: AGHT+IHx494bsoHJaju4RengP4iXpGRFmMQLliiMWy2Q89R/cSWBMiB3q+hcgQyoomcv+0z0cS+rAooMlyw+VCTekJU=
X-Received: by 2002:a17:902:f791:b0:297:dfc8:8fd with SMTP id
 d9443c01a7336-297e571236dmr29139155ad.51.1762605083407; Sat, 08 Nov 2025
 04:31:23 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:31:12 +0100
X-Gm-Features: AWmQ_bn_kIDv-pwz4dNwmzBqCanYs2atUFgMMshyNEi0RKuzPdaQ1v4towlIcoM
Message-ID: <CAFBinCBp1x3KWe-5mWoGwFEVxEoSKhTXKYfGgNKS-eDsbW8X+A@mail.gmail.com>
Subject: Re: [PATCH net-next 09/16] net: stmmac: meson8b: use stmmac_get_phy_intf_sel()
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
X-CRM114-CacheID: sfid-20251108_043124_279256_4BADE8B3 
X-CRM114-Status: UNSURE (   8.99  )
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
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

