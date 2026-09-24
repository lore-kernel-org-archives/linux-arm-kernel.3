Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A024BC982FD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 05:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=; b=VVjupocnnk5njFTOqS0tuh87Gf
	YmbIWTgS5I5B/CMsJDYXYGEX6Qgu2aqnMzwfU5uyjZELNOKj0bMsZ8eHF7hLJjZK6fN8lI57ErUu4
	JzBbXbfNyQRvWY8ujogIxqaqc7BX/yjPGGy2VcdnqezsC+KH55ZtG5ADwMb+pAtA8fn5jzi9UiH3I
	i7bXgi8FAh9hzxJsHswYvBW0ohwO/BB9QynV6g+hapAukFR9PVDoIrLEDjjpexWHdIfrITFkVv1Rq
	aiF/WkEthPhtmhrvQXHLvfWwtJtcwsJlZTkfsGLY18G9wqru81deut6td2jl8r20RCbgk2dIwEuAK
	wH09eZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9by0-0000000A2hS-0gxx;
	Thu, 24 Sep 2026 05:25:56 +0000
Received: from mail-ej2-x06.google.com ([2a00:1450:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9bxx-0000000A2h5-0eXQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 05:25:54 +0000
Received: by mail-ej2-x06.google.com with SMTP id a640c23a62f3a-c293a9e09b9so79469566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 22:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790227551; cv=none;
        d=google.com; s=arc-20260327;
        b=P8dCJJWDLRCjWedRW9Dn3OodjqX8A0puDYOOi7azj6j4hKf2sjk7ARbEpZ/6LsLKGl
         AYOQ2aVmohe+DE0SmAeWHNONJtbELuGZWDaEZwKcIkpOAPTveqVkb/czjvifsG5iE/kw
         DouXjfHz97aGL4YmDnyI/aKZ7njQJfnvAfvDqKzWvEe9P7E2Bgdu6KbI910IXhH87RMF
         TnZ/K0j9B2GXLQL3tIHYNVKrrV1zzP+YsjpnJQUvkt32D/iAjI+Fh1oz7Qvl7kh6MGRr
         P7ZYtGeqT1zLuv4NLP928Dc2ZOdGape8ISRN8XI8MZMdwrSBWaywP0PzOxfpl2Zp4NK2
         mUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        fh=srt3d2ls74YWcPE9sgXejVJ4A/nuCgHiYDpQt+iekEY=;
        b=Q9a+QIFUQYwNyo987XM6BlXyuYTpeLTDcTWao7tQgPuBmhboCX8JEB1w8aG1fBEXm9
         zt+HPH0gm+9h86Uvs6Xn7bWvXstdduBwxivNpvL+C2qHhCWC1jjTPPcyp5BKzC2UR7J/
         r6f98ttBYe4nNuT5Aw+tN2qLmpgriaBxflki9DzW4Ve30v1Tul9xuW+OpH682Y887Zk7
         tpiEr8rf7waGf0+7wMfdWUJxQylxP4Rk230Uyst7a+st7UZFySmdSpn+2Hqs9bn6SEqF
         qdkbWH7Un/hu7knTSUYbLIAx3PFWvN/TrH6j/sYo35pPBhSB1s9r4zEZaNe/3iugZwog
         Ci5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790227551; x=1790832351; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=eS1IehlEyLVasmRtFzeLIjHBZOElrMGoNeiLBVZvIeEUqZ0lbY9NTHM1efE4tbo7Zy
         qH9GOSJscyTuS51+CecxaY09ELNuIlYmOJ9YGTvtGcDBsAEoPTKzJ1GCh/UKJEIAa3xp
         FnpQ2P8yY03XwH3iIFIqebYL5H35b7DkYfl9sC9NMTJTZWnHl24aTxSV9+x3y10s+FqR
         as+1hnmKoK+gIJQoCodiGlqnqasC3p/c3VgrirJUBgl3m1DiWitquwkpf4wM9SBRYZcH
         p7932FB3kb3umusV+ZxFtLW+WLPRuCG8EuYsCMtQaG7Gl9AQnJOmBzgLdcwvN8hPPg23
         OsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790227551; x=1790832351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLK2OLpM2SSUMWDkd3Stq5jPo4JHnnMF6dp1t7NnhKU=;
        b=u3kgyzkOqF95fOnFU8z2Kolu5GJRozb3QHuBMyQtqlnhrM6QX968E9isfgXcfSLGAa
         413TIdTd8O4MzUp1QRwLy8osnv+7mrHMHsu16VQluRERW3JKZr8v/jic7FyX04ulCFF1
         NwMTfgmyERCkXCsmmcV7SECbUAn8oM5SKYx+EclQymtq1f6i60WabJxSrUXF1Uli7ORx
         QxGoq0K8K/XQOTb2NW9+HFU/gkXfefRd3IjrEQfxKJjUC5hCScWv/1RoPJFTw72H7vyD
         OiwzyyRNq+6+JQvpgouFBqosa1lv+SHywPmBgEQu9MqGIx/IVX3eQiRO0vuTwf4wx3LM
         tw3A==
X-Forwarded-Encrypted: i=1; AKwUvByM3QbUp5Xwh2XFrrVW0ch0Q15DpDau5LUMRbQmkS+GI5xkM9NAdDaBkJq5fBQpagLW02IC0foe0xKzJN4CRERp@lists.infradead.org
X-Gm-Message-State: AFuF++noVd3BJmTz9/zO8oP98dODHpsps+1w/kFTjx7s4NgAbcV15eN0
	0rEhxp2og348PL6a8Ma6Iq9H5ECfigCLmjfxj5/Du7s7uBHwJnpNL8jNGihDVP6PDf4LW4FHr1s
	AAtkL35GrzPRt09ZUTtj9RbBPSO298/o=
X-Gm-Gg: AYBFou1pg+dMGs/vDCycn/VPG1GjAPJlNd0gtRpkaVNxHhSlcTrW3Djc8XMr3oeOrRA
	I8bR3cQ+GsD0cS2AWyJablCIqJSchDnp59/jqe9Iiscocz6Qud12QO4mlkXQY0A7hG3IBggU0q/
	+B7gAy/izQl/usyhUFRvoBBRxbcFx+yFET4eU+Djct21gGrdyZrnKJxRmica9gGpw9hui8NoNyD
	XC0NgDuEugPcTuxch7UUAIzi3NmnMOFjDZeBPDpBZ376og/5SKv2CO9u+lyGp7nVMup/iygeSI3
	yO6xSKSqMsVUiAfFq6XCt+slbb2Okhh7rN0dFpZ4yklxvMyfYhlVrlqPSQ==
X-Received: by 2002:a17:906:c14f:b0:c2a:8b27:325c with SMTP id
 a640c23a62f3a-c2ac24c6f74mr93439666b.24.1790227550909; Wed, 23 Sep 2026
 22:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com> <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
In-Reply-To: <ca67076e-3877-49ca-8c67-a6dc1b70e667@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:25:38 +0800
X-Gm-Features: AclHuK__h_lDVDtTJPJ1hE5XUrq-ElYVbuKeNXUkTTzBjP1E-2gaCgXFCmYTLow
Message-ID: <CALj3r0he_NrY61dWo_ib+rj4msXZsRbBJ5f20xGEou0BfOWg5g@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Cochran <richardcochran@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_222553_216380_B05E697F 
X-CRM114-Status: GOOD (  17.44  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=
=91=A8=E5=9B=9B 02:35=E5=86=99=E9=81=93=EF=BC=9A
>
> > Non-existent MMDs
> > -----------------
> > Returning 0xffff on reads and silently discarding writes is what a
> > floating bus / unimplemented feature looks like, so I agree with that
> > direction. My pcs-xpcs-rk does the same.
>
> Did you read 802.3?
>
>   45.2:
>
>   If a device supports the MDIO interface it shall respond to all
>   possible register addresses for the device and return a value of
>   zero for undefined and unsupported registers. Writes to undefined
>   registers and read-only registers shall have no effect. The
>   operation of an MMD shall not be affected by writes to reserved and
>   unsupported register bits, and such register bits shall return a
>   value of zero when read.
>
> This is what i was commenting about in my review, returning EOPNOTSUPP
> is not correct according to the standard.
>
>         Andrew

I hadn't gone back to 45.2 when I wrote that, so fair enough on the
standard. For what it's worth, pcs-xpcs already treats 0 and 0xff as
the "no device" values in the identity path, so the glue follows that
convention rather than inventing a new one.

Sorry for that.
Coia

