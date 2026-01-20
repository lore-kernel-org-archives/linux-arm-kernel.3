Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD9D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 07:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/AcdJHOfbL98COErVKQfn92HC1scPShYwrkryDi5Tc=; b=PwYk6fiPqV8qDcT4IJQnmQX+Hy
	sSCWlldh/2RfRQAoHtZKDh21K5/LzR2fXNkzb6ZyEYlJZG3i/o4V2XmZekCdv2sEo+uBsgOHGKvVp
	rlSng+7QKQMWW6t6IcoJrMN/G0YRH2mg+gaKh5blBkFxSgF5+wA6bP2LDliZuPEdjXeNE75ztWTlJ
	p3ecypvEis2ZDgxZ8E6onquFyzAd1xF6ybGVpfniZxzCXWieelWnThSwXN2K71VgBzkBBxwefis5P
	XH2vMo0EbdJkTv0qJXj64Rc9yjmmqnEV3lw6GXOp81AYc67gix/kkUOQBjHfRB97SmEe2O6l+KntT
	FDqn0jYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5vv-00000003KVe-02u7;
	Tue, 20 Jan 2026 07:13:47 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi5vs-00000003KV5-3kRp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 07:13:46 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5029af2b4bcso21600681cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 23:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768893223; cv=none;
        d=google.com; s=arc-20240605;
        b=ao007VZnygJZiSTJpwxozvtvWuvtS4KFk2AQ/8ctuUMSgpA2ZtG9En0zgkGbDjpA/O
         Y8JSZS7F9rg2RJa+N48yPWkYcebZj+RXWXxdgK8Aza2Sqfp9MrCA1rLIkCljOuVSgcgM
         EVCcRYyn0ApbW8n6gVmz6BYbDMyLYgBYEJWaoYgWBSJAXARTLQRn1Vjrunbcoi6i9mFM
         DFSIyo/X2s8jHVJIEsS4J6IJCgegwhdWhAzr/4JnaUTZtnJsQA4geMCADmHxRuvxx7Y1
         A6HYEtHwPZzp6dl9GMDhHHHEql5sQs3bAzJUflVwLeAlTZTtMSpFSiptXn+8H/sx1sD7
         gTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m/AcdJHOfbL98COErVKQfn92HC1scPShYwrkryDi5Tc=;
        fh=nSBkQ32AAHubNgewaXKUYBL+NjEvxeKnSUfyIMTnWFE=;
        b=GAZBPOBG3vtF7elmqT2cCyUJbl3a5mNPzSVbZkIXeaGIJWqD1+FgB7TybdR0HZ4GPD
         ykmkcsOSi1Vt5eP4THRXy0dC1rlf7sL2rfY5puOC7WnBg5j52fIvfF9icMJPlbQBdvbO
         bLDtvA/1R6ikftaWk7geNiHRJ+L+godfZqgNmMQRvokND61/RjNFwc8Os4+viTV9yrRL
         TMTIPeF0lw73V2bqd7pxTlVleJEtv3uVUK5KSzf5JgVCTQbAQsqZwbPz0VkU1aT1IctI
         +3snBP/HgBSBFN1E9Fy3h0V0QCroffV+2f2Z8GA2Y7HNkhqe2N7+u2gaRMx/Feokm5x4
         yRJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768893223; x=1769498023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/AcdJHOfbL98COErVKQfn92HC1scPShYwrkryDi5Tc=;
        b=OVpNuK6XEm5H5/NW20h8dWrvdx7aLlkFwlslzleHhUXknx4eFpwJS9/ayfdTQ+GBPc
         cyEs2RJ0k6S43F2vDBm8xgne9qsR+oQVlCNAQJ/dsu+NkAeld5ccsePCnlvoK3IkCkJw
         tBsKJrjSh73NNEOz7xP2wvXzCQXANflWthHsuvWc07ahUfthQ/9FfrdEjr7kmFDCfUed
         G8NnrLI7O63DO63IPv8/32J/EDHPHqRskPNSYPjx5uzG8BJ2ZvQLDM09HtIFWvt9sNId
         OhezcfoVTGZDfpeh1/t+XpksWTiSA9H4U4SruZLNulll3+uSRXQJhG4PWQPqoDo7fFv0
         wPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893223; x=1769498023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/AcdJHOfbL98COErVKQfn92HC1scPShYwrkryDi5Tc=;
        b=CIzhJ9C0bfY7TlIQXARNrLXix080e1DxUCD4uZ32WgIftERO5/z8o65e9otIGfxnoQ
         6kVPBs58t8iS4kJyW+TZZ9bhxkzysvxPKvXhxZBYvzH7pm6tCydKs4Vo9TgaM+PSPbs6
         plgXtBgkyLpaDVdc5ehXNNsYDLzNYGyOr0wya95oa5zyzsjsoa6kvwaKOn+yEcMFs/L0
         eQh/hywMXm74bYIHHX5s/tb2naEvupxH6AVZK36xxTyDzBS5wYHl1CcaxpINmFDuDP6+
         FhefmScxH4YKEBd6H70+6qimh1pEYvbtqIaABe4TXFhyhoxrG5GsbrfHYeQhcR4PHl+i
         8YjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0XAxlhnJyygyRFW4YeJ/5PbBMWNZ/Ga6NtN/H9N57djxa3e4oKf2XEqSJi0Y4hvk4oqTFSqtTn2DU8CwC4SAE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmk7feMNX+Gig33i2BtBa4mbF6jZEsYXZ5f8NL8ZjtWrLFaGr3
	rCofWriY8MY12/tVhe/4TPh/tUHmc9yy5lAdg1UZ8b1RDWcveSt6714cO29KfJXzCYlwQpPA/dD
	SZP7QIt5tFy8NClIP6RFJsiNHaQuKZGw=
X-Gm-Gg: AY/fxX5JyjtaMYwaljTQY+qP6Oz8PgtTbGM2KJ9t8c2yyTxEoT8+c4mARoNKafum/Hi
	69w8OWUfrZUJBZQehxMskTX+A7iuSdFY+QCnXvaRQFP2KO9SINHcG/zciet+47ju4Q/nUi1yq4b
	670MCbHlMKBMEBnCI/sKFCC3eQi7X444dYv6lA3CKz12+E+fiU91Sejo5Ae7+N4XuGf5E1RtRxK
	7f0+cahN5XgQ7/+4/Z9NUJHlc8JPGB7mQGfpH3pekFB+g97VAZJ8BHWAiUOvxKcR/HTqUrHLtUm
	FUA/uGtZrrZU8TtQ6kQp+Y2Cf8k=
X-Received: by 2002:a05:622a:489:b0:4f1:ba0b:90 with SMTP id
 d75a77b69052e-502d82775d1mr8090231cf.8.1768893223391; Mon, 19 Jan 2026
 23:13:43 -0800 (PST)
MIME-Version: 1.0
References: <20260119-ufs-rst-v1-1-c8e96493948c@gmail.com> <6479d7b8-7712-4181-9c82-0021da94d1a8@rock-chips.com>
In-Reply-To: <6479d7b8-7712-4181-9c82-0021da94d1a8@rock-chips.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 20 Jan 2026 11:13:34 +0400
X-Gm-Features: AZwV_Qg9xEnym6d1IbZ761hDP0MCCZD2sOIi6gJCnx0Dbz6NZzcnmt6Sl_0hXVI
Message-ID: <CABjd4Yx_2NPkY7U6U8XL_89uK20j7S3e4px1Cbp+JbF3FavjyQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_231344_986042_34635B0C 
X-CRM114-Status: GOOD (  26.97  )
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

On Tue, Jan 20, 2026 at 5:39=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> =E5=9C=A8 2026/01/19 =E6=98=9F=E6=9C=9F=E4=B8=80 17:22, Alexey Charkov =
=E5=86=99=E9=81=93:
> > Rockchip RK3576 UFS controller uses a dedicated pin to reset the connec=
ted
> > UFS device, which can operate either in a hardware controlled mode or a=
s a
> > GPIO pin.
> >
>
> It's the only one 1.2V IO could be used on RK3576 to reset ufs devices,
> except ufs refclk. So it's a dedicated pin for sure if using ufs, that's
> why we put it into rk3576.dtsi.
>
> > Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> > hardware controlled mode if it uses UFS to load the next boot stage.
> >
>
> ROM code could be specific, but the linux/loader driver is compatible=EF=
=BC=8C
> so for the coming SoCs, with more 1.2V IO could be used, it's more
> flexible to use gpio-based instead of hardware controlled(of course,
> move reset pinctrl settings into board dts).

Thanks Shawn, both of the above is very helpful context - I think I'll
mention it in my next version of the U-boot patch series where this
discussion first surfaced.

> > Given that existing bindings (and rk3576.dtsi) expect a GPIO-controlled
> > device reset, request the required pin config explicitly.
> >
> > This doesn't appear to affect Linux, but it does affect U-boot:
> >
>
> IIUC, it's more or less a fix for loader, more precisely U-boot here?
> I'm not entirely certain about the handling here, is it standard
> convention to add a fixes tag in this context?

Device trees are treated somewhat independently of Linux driver code,
even though they follow the same development cycle. I believe that
broader policy is that both bindings and device tree sources should
equally cater to different codebases that use them, so a potential
issue outside the Linux kernel warrants a fix. Perhaps Rob, Krzysztof
and Conor are best positioned to confirm this or not.

In this particular case, the fact that the GPIO descriptor is defined
in rk3576.dtsi, but the respective pin configuration is not, leaves
ambiguity in the hardware description, which different codebases might
resolve differently (and not necessarily correctly for the hardware).
So there is a benefit in backporting the change which explicitly
resolves the ambiguity.

Best regards,
Alexey

