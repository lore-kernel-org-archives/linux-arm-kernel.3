Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C0D4A609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 09:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kE97FQFptYMK9vhs3k1ZWJYJHvuV6FL1bLt8wQQXeXk=; b=WgIAQMEfOTv1VTXJgsf7p4oRjU
	R5G/Hb8dzxiD7unUrp/Koi6dSm3OoFgN0z2s/5gKFGZEjl5uskr/0k//1POMaP8lfGPtlg07LGE/l
	ONo7WABK31VAW2YeL4zMWFB5zzwUiEqbBNkX/E8GrZ5EOe1olzL88uSnJ8agf3jnOgVlfd/ktJrU8
	LpEMAlYaK5WMA3+3uagWgJYUNkiv0UfDdzGPFqXCbCKx0pAB4+2dWZq4sgQhbK4w+YbyqanYfOHB4
	m1P/Gcr+Hn2Bgn7KEwmDrsCiAodyGVxsK7dfa6UcMiRUTcDplkelVjeQAEluWeXH4I+GAwC0NB8S6
	3b4Hi6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggAt-0000000Draa-270T;
	Fri, 16 Jan 2026 09:31:23 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggAr-0000000DraG-0Jnp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 09:31:22 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso2057804eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 01:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768555880; x=1769160680; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE97FQFptYMK9vhs3k1ZWJYJHvuV6FL1bLt8wQQXeXk=;
        b=Dn/0iNPzml6Z3x0FRY1HGZkVfUy1N53odU1lwf4SZrRfriLzuSL20DtzZqMNv73hMr
         mSoNdX1/eqzYd5e4taUTNiAU7sOSQ2H2mvZ7+O0ko/ELVX9AeJKgQceLoqAs5vx3BBgA
         69ob7baybfmrkxb3q8k497S7SB5NFaq2s7wSpJDEQPmNVkrobHOudaqb1AH1KYmVlfb3
         ETG09ccebOMTkxjyG90Wr8Sz1fSuzrHouHcfVVHuJBRLCGUHadHLV8gJAy0V1rTrAHRp
         f7TA+eHSkxZCd/1/LyZ4dvsdFc9rAGJAAqImlQKXPc10CCrUR2SD7g3rTHo/FzK+gxlw
         G8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768555880; x=1769160680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kE97FQFptYMK9vhs3k1ZWJYJHvuV6FL1bLt8wQQXeXk=;
        b=QlPfip1g3n0CPSGVqO2BmJBWDSHWKgZeGJIJBWFKocvspU97g5t89SZXS9joPZHTBJ
         7OBZ5K2257JnNQk4E8D9radrLIMzRR+IGiFJw5eS8QeQtqKvsotVvIGTppFvasfEeWs7
         BZMbewzq1hsVEdzZlsn5Ryg9IK9/czDbgELKMyC+9bkyzqXpX2jrdLH/jSQBIDbYFceZ
         y123tcmXcVYF5VF8SVTRb05RFWutCtq1O2F3JwWOfIg9tB8COM62f3S5EDIXFG2HywO2
         c2yHe3KlJAwSYBFEDRTuXOY/0VzGJ4rn7+fOGTGFBT4RGbrE/s3JOYs3NgD9FIWqb+cD
         akYw==
X-Forwarded-Encrypted: i=1; AJvYcCXbpfeWaoUqrxIbpxqmMm5YUbnbUBpbzlRVhUZUEjdiNFO9SK82R1tHDQzxiogoqXJsD5WDgRYZOo0DnggOy/gw@lists.infradead.org
X-Gm-Message-State: AOJu0YypnVSib5svT1Fq+dPTeqYG9V2t8GtR057cENoH9vas1FsBPd8O
	z1g33JDt0WH3KNbipaDugOLxTAjkktbKGzr2fx5ILvlothajYcKQhQbNRJQKfVwzfQyedAe19Cd
	uY2SKDtvYNuCISbP4WnTHkZKlhQSpr2Y=
X-Gm-Gg: AY/fxX5IpZ90QsgBlT5RCSpGDiFn/xrwZGmPT5TJupenyPo7AuXA6/ciBZKL3zRXNuR
	8r2Y4dSeKDN4M2AU6ztJOM4yw8oG5Pl5womlwe3zbLmsmCwg1+KCqrmrZyX4GJllIHrLrm43J8S
	0kJYJjkq3yxDhvhmL3prmmDk3aoLcDZgJDRX2CRmRIGkXXoZAAyxjIj2SFt6pd3SDuQj477GDHC
	BlGdqyo/CR0JrEUiCYALnVwlz0NErcLGFKf6Vmnv5CJUrvpEWNPTipQ3K32MHV3MWDVtYeDxz7U
	YV5ZBv3UhzRxqqjKAnpHgED6nV1Kz9FXG6jE+KKtcmAIe0rdLCmq+4RgHPg2L8xCMzniG7WZ5Pc
	O9DHgfLlGTj527syuT+2M
X-Received: by 2002:a05:7022:1e01:b0:11b:d6f2:a6d6 with SMTP id
 a92af1059eb24-1244b36efefmr2110118c88.34.1768555879884; Fri, 16 Jan 2026
 01:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com> <20260116-imx91s-frdm-v3-2-98671de64925@nxp.com>
In-Reply-To: <20260116-imx91s-frdm-v3-2-98671de64925@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 Jan 2026 11:33:59 +0200
X-Gm-Features: AZwV_QjLNUqqgYctbRDffJUiJuH_tW04Q23rVvRNxKu0gJcAkwrTYmAk7h08eJ8
Message-ID: <CAEnQRZDtE+0gDxAnu9vWGhj3rYEv6CmMNjQLWnKu=ud9Yo9XcQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board support
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_013121_119172_7827D802 
X-CRM114-Status: UNSURE (   9.81  )
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

On Fri, Jan 16, 2026 at 5:45=E2=80=AFAM Yanan Yang <yanan.yang@nxp.com> wro=
te:
>
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>

<snip>


> +       sound-mqs {
> +               compatible =3D "fsl,imx6sx-sdb-mqs", "fsl,imx-audio-mqs";

There is little sense to have compatible =3D ""fsl,imx6sx-sdb-mqs". Just
use

compatible =3D "fsl,imx-audio-mqs";

Move model property after compatible as per already existing code practice.

