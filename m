Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57A6FD3762
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 14:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9jg3LVlUdrt/5saKoO+nhMQWQOQ3FaMpJSoPoujSvM=; b=y3yz1W5unIOZXoZJoE5HLkXxgv
	i1LSWySVqr0YqxJx+6KrIghFAW0FMLYn/M1smyhOEnEswhohjHHGWlr7/HHEjecF18eFtZpUUoQlj
	2dG66jPx+hsn2HpsL6bHwQLWXwwbyML4Kkr+lb0Ocb2JlT4pxBrQ48dPq7ErIPwT8XkYj3aILUmrt
	R9XngAFDwYxJcuYMtnVVv9c0JVkoAOzM+j3MshohFD20k+xLvBnl1JUHMc9Mtnp1y+LE0iYIQFzvj
	vosjz/fWrw86Jma9iSRvWUTAu8ew/kIFhKUnkAvUen5rvCRjJqkHAf/eZYPmHAUIWqHX6uzRCBJ6s
	/+SNwANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFbm-00000004AZG-29GX;
	Wed, 25 Feb 2026 14:11:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFbj-00000004AYt-2p0Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 14:11:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b884a84e622so1042665866b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 06:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772028676; cv=none;
        d=google.com; s=arc-20240605;
        b=NhNBUf8GYjH86cdWL0WAzlpIKItVYoqrukVABEH+lBMk8jOuvU6i2doochHgl54qbB
         NeRq4iP2+45++/uJlDkYRzMMI1yUsA8GOWDlypmWVg0W7wKpCLPgZTUT/jUua4b14UEc
         ySn0H6Yd7AFnB0YTa2QZTxLGDs0u13qYqx2ANGKxsituatVYCU5ato+Bl4hbVZ86u4Ck
         2KN2bQD83uBgIH4aVJOUozy3c/QJED0iqraGmIRqxBc6bu6fJjwRXq1dnGMLn4vXqnmL
         7FCw4z8nXU04ojWAZf1YDwiZ6I9cpXGhNuU8pzehBnmEiV7sry14pi3B5zDPCTvlKVoT
         JYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L9jg3LVlUdrt/5saKoO+nhMQWQOQ3FaMpJSoPoujSvM=;
        fh=txVC8/ml37KfRe1i2B211dO+4NK6dpiQQ0uGu0jsOZc=;
        b=f9G6TR70QWiXzY9bZys+f0buZKItNukWX7uoZXDE62DrrEl2l4olxQ0JtfbecEb3vG
         Jo64GTowiYxnYG97sycXvm6xm0oqcjF5A0J9d7rS8S4i436By3Cp5ECElXWo6HMrn2IH
         sKURCrIp6XqTFn4D0/SVcbweVSIiuhKaEb195v7HmUWjYRbj1g6U2kL1uWSl3DPhr3hZ
         40+AawJbLRtJzGkLyiQTXk3SFB0f1NIhhFj94Q2AP6oU33ty72VtirSRhkZvwiN0B2mN
         4FJ1f4nDm9mcZxZYxC02r6sqYRwzOLpn13GLv6dMthVKVH/qpV26viROujsScvs65qV7
         qBhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772028676; x=1772633476; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L9jg3LVlUdrt/5saKoO+nhMQWQOQ3FaMpJSoPoujSvM=;
        b=KApyOkJIrZYQXydVBZPA2uRg/JJXXR0iD3kTBJ3O5LWRgIJrXl3WEoVyl0crXMIqzt
         8r5yz5NJStQOPYlX0KtdrRXzNC/gx1xBFMZRos3oT1QROLlfWXO2t+lAK0JP0ifl1UPN
         88uQ3DqusZ1W0G514a7LM+UxCGpJdKR1/fkPtcSM4Ti4RlNfwkaT0IPoKanQK/mKNp8J
         USkCouOmfomJ8yHEV2G931honC7AiTVdpZls9WwZLP0TUZ898BreV20wujegp+9+Hy5d
         GFHFN1rWmh8QPp9BFaLKcQtk8CbaQPDvHVLFQXrUcAsX3K7Osh8kdwMkSBpt62bLzC0C
         IdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772028676; x=1772633476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9jg3LVlUdrt/5saKoO+nhMQWQOQ3FaMpJSoPoujSvM=;
        b=VnTsDva5y7t0+yoJ6/4FjHFu6a3ZQYt9PmRPMGpVEYCvy8+D0Dcn9/t8ybD3ekwHIb
         AzcyiHFaN11+xDDKQ1DfB0PrB2XeqyKs4V20N16l9TK+4kuWgE1Gg5sRS23KKzFBzD2g
         XMOVPEDJ/Rv11zJGKwmk/HH+cFuOMsunWHIpe3wvDmpFni+PE2I0eULn8ItZFY09cH1s
         J6RDV/2FXXoLRCeF2DzeSwM4vGCxGOrQd4twzqcUPhduLUi/swqJjnKHQsf+fG/RVzx2
         OIJI/nN2kEAkGnJt1QkhXpz9DKotGEvN7cEf8JN79peyamCek7ksA6y02JkSEGjcXLN7
         UBmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxswj0m90nxTL0NJStl/dOC4DS+ysMXB02BQ/Z6Krh2sygM42+KGkisxeMaaQAXghxhYuxJ5KsnegcxuXov827@lists.infradead.org
X-Gm-Message-State: AOJu0Yws3nPLVoVSwutTDJJpLOr6X3ZfJI0WSncf3z9sUlNq41Vs3IIN
	NynFtjCEhjjdAcnypC3Vb2mnLWFJvPUerwkVmF7nNzN+vKl3ujKaqT6bWPZjjaF8ODpafq5L3NM
	7nXQ+CNGk7Ng1hmWSIH5DCkoKiihLw20=
X-Gm-Gg: ATEYQzyKDP2XiRb03hsMuckMprF2l0RnRZzKV3M2iW0dodhVnehGkKS4g4lM415K1fr
	OTmau0dbRXYvsZfmifjxirOcdFODEH4xk+MLgZRGRSeA//KnqqA4GJ8Ja5pKrh1TFuCW1fpbmyU
	arhqYyTNU6PoB6JBc7ObOUTW+O5qwmC80CtjGFQ1bk63OkHaMuXymgL+gk2rRMGCifeNo0H6Fcx
	k42EUTSp7Xe/3klN1VGxIbnGVTs0uPIf6CSKYkGHZjsSDmiH1/w/asbQEddre5kJijtNzTgowyt
	XvyP1Rc=
X-Received: by 2002:a17:907:1b1c:b0:b8e:d260:cb20 with SMTP id
 a640c23a62f3a-b9081a09c97mr1077231966b.18.1772028675957; Wed, 25 Feb 2026
 06:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20260129022910.3942028-1-onlywig@gmail.com> <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89> <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
 <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810>
In-Reply-To: <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810>
From: Wig Cheng <onlywig@gmail.com>
Date: Wed, 25 Feb 2026 22:11:02 +0800
X-Gm-Features: AaiRm503W-bxJ6qYfmScp36dL07me8fXiI8oeeybDFZb9ZdLCMZhOZ9palVel14
Message-ID: <CAPStFe6sFCo2-+9ataPBy9pvEUo_uZ5G7XNA_8jH+sF6=FNOpw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, shawnguo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zaq14760@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_061119_729942_E7923EF7 
X-CRM114-Status: UNSURE (   8.58  )
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

>
> arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: display@0 (mayqueen,pixpaper): spi-max-frequency: 5000000 is greater than the maximum of 1000000
>         from schema $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml
>
> Does 1000000 work for spi-max-frequency? or need update binding doc?
>

Both 1MHz and 5MHz work on i.MX93. I chose 5MHz for better refresh
performance, which is within the LPSPI3 controller's capabilities.
The 1MHz limit in the binding is a conservative generic value I think.

Thanks,
Wig

