Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C22D2ECF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZxxqnCyjXCPpNtZk5aA58abDH5T+E1BOx9dRDLt+qc=; b=Fbv2iCz1rBtNTtSaBAtYJVdDJk
	rrb41Vhzur3jiKvp/yy7XWITatcVcSxA30VfOszSdUz9LbuubGHb5KsYJbigNFw+xtUfwBShvbhe6
	OQS+ZPs2mkz2nWjSbDYSjIRRKS5Le/aUHthNhXWYAKswZdq3bqLrF9Yr1TNaLbA0vQnWYAe0xQyC/
	TxX0ApO2wkY4QfLskEmoOZNAgtkQ3yYXcOJVytqkFlNHouFRJ4UIHFZkQBhKnghqcCCtGx4oWrw1k
	jFQEobmzGaDwaiKa5Bq6bTxYT4Hv+WGbwKyGU93qowSv3RPzeuKMBu3rBVS+jd2couBuJbyORo3Nt
	jBLRsBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwyq-00000002uUR-3Me8;
	Mon, 19 Jan 2026 21:40:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwyj-00000002uTJ-4ALX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 21:40:07 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0bae9aca3so31083035ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 13:40:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768858805; cv=none;
        d=google.com; s=arc-20240605;
        b=e3Vir3ZR+T1rBeerJGCcnaI4k1z4KXvF7blNPftTWA7vL+HItfPxWVg+Q2jP7LI8va
         +F1Mzwdc+1gUXt9+0j3eyILAedF1gBBiWwVC02qqTTIS5MbyWE+aIXbwZiniyjkWI9d/
         G2gitI0LYLGYADPbMwAi3Jsqq8I1RKGY+r05GLSIZF/3riaakllk+5KBX3j2R78gFt3M
         ngM8A336NO79SGo7h7RTuBAv+KA/Ca/CtQR4BZECyFdoai16VUza3dlRkepcrykjDtxR
         cFtp5K5RQwDZjcSOQ/G+TwOUERIo7cgoD//s+EL8zgwK0goiX/EYE+W0VjoCEkEjJEp1
         dOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZxxqnCyjXCPpNtZk5aA58abDH5T+E1BOx9dRDLt+qc=;
        fh=mGWIFW5IO0NHxwLEp6DLZTkfLLcBbCXfeHqv9fZjoB0=;
        b=DNnc7tFVu318KJAOkFXfp5/x26PRDZdl6AAqg9secScq/3YZkvrU7PNXDLt4DqrtO2
         tbriP9ngm8hJT0OhF8L0TamVwFEcbTKQcsIcZUPLF6taGpfIN/46KX2be4++0pD3T5fO
         xKZAnzXDe95ZCQPgtJYICMZB3uWBVYgh3VFamB51sWZkZdR4bVBomkGYZb8GiKIOYwy8
         jO+L8HlFK/cWpoFa+PMoHpFgye+Q97bffQuBK2Uua2ixpAwrtcgyFh+ifN2lUNfZyFuc
         7uKuyTSsTHYH+y1GWtJyVUrnHjyLjzLJwfRUA+QKEt9ZvPncVrEDpylzADXm95EjM+5N
         IiIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768858805; x=1769463605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZxxqnCyjXCPpNtZk5aA58abDH5T+E1BOx9dRDLt+qc=;
        b=iq68Tc01Mvo/r7pFJyjQT2xX7H3f7FzueKVQ9wEskg7jSTdZx4EcivLojGHqSeTvlj
         cmCS2qoCaWStp0k2iwahQFdtQiuispjoQAE4ztNzHbPn3KV7Egg5xSsdyFw2zzi+GQnM
         Y4XCKQkxza4CBZnhf45oW797Slo18d427xaQ/id6BmaAt1LNwHWj0kEm9qDQch7z+yf7
         n2KrTVc1Ra/rbCaU7wUZlK+iNv/X5JaqZDl0Qp4KkYyGumn7aOdsSjTkTQBfId503zgr
         IgZCBgYwXtojP1r4Hc3VkGMGME56tM4t7J7NiPUlMPp7tvHRmOFs7+o2bPGqz1WIDndu
         f9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768858805; x=1769463605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZxxqnCyjXCPpNtZk5aA58abDH5T+E1BOx9dRDLt+qc=;
        b=JzyGSuWrc0LTwajl/dPuWTRHKhf86L8/MjAJWtM8aRPDNRJmwRzS1k42VgcjqXViPz
         7946uuCnlg+IqYQvJMgnYkVVirlAfMjh+dDG2EyqGVPgBADf99zkiddHrKNaEh+7qRG9
         NTwIcDk4txEarzPdydhmF8DQYsjyjiGY//sOAdLHR0fTdOk5GnPbAeiD+AharmeKxR4U
         kbU8UJjp5ivTdDQPK8ZVujQvjztqiYihsPps/btuNXDHi3nqMlXO0bXhBxqueHIpJLz3
         zfvZSUcAMkCdoRZpsDyzgwPLjounfaWmGujMMGeyXMkkl8GLSd9HI7hSgLrwYEExIsUs
         zk6g==
X-Forwarded-Encrypted: i=1; AJvYcCV2xHf+MJq/Z8+bMT2A9DCOxmNnurbtq/hOYS3Af0jgDSMAUjdKaj1XcROJlcjmrC7eOcABaDDe4BuU6z4qofUS@lists.infradead.org
X-Gm-Message-State: AOJu0YyifzXN2ZFbHYKRI+SMgVg5n7IwzE4Onx5GJl6qCNKYXqzg4hPM
	2T/Erdu9hEXr5JwlQpPsj6CGsZeW5QWqoerMCLTNjMb2/P/CxWuuqWlSv1sRHWI/KjI9gqgmt+e
	IkTRJ01JT6SsJRAD/4ZAghHZnKs3Dwwgt0apb
X-Gm-Gg: AZuq6aL+LgrZ6P69b+NebaMZWA99KthsMRYks3FZt+jssPXloP67oLHHpH+hgG9yjKT
	J+/zGGKFeLYQc/TN/j1NNqHFHYDg+ghfXEUIgp+mUaNb8w5DTpDsZeHXcsgEt4xWL6nBiB+7IUe
	yICOWnpHy0PFS9FATw+fYihJwX+razJ9Ql5uLvcS2Vk7Xs9t7aOrYhdS6+8Y0qpFLWjCGvSPB33
	/Hv9CDz4BrfBlQrBkkzr1YRqiJlDnszkA6Ghu9AHWVEvoPXBy40y9VtJ0/rte3TTtp2Ts0PKaeb
	fex4uePeS66cfkmNzup+2bd4k3O1
X-Received: by 2002:a17:903:40ca:b0:295:290d:4afa with SMTP id
 d9443c01a7336-2a71753755cmr110427715ad.23.1768858804795; Mon, 19 Jan 2026
 13:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20260116023900.2036657-1-nick@khadas.com>
In-Reply-To: <20260116023900.2036657-1-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jan 2026 22:39:53 +0100
X-Gm-Features: AZwV_Qgat7I5RJwyS0qYSlAnRBAN4jc1vt4piOLxALOTFSnVgB2ZAhHU5wXVsak
Message-ID: <CAFBinCAeNcKW_dK+1LD7U_+JkcozxmMw9J4oGUt1=OcvJ95dFQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_134006_056083_E0D13B4B 
X-CRM114-Status: GOOD (  10.57  )
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

Hi Nick,

thanks for your patches - it's great to see Khadas VIM1S support
growing upstream :-)

On Fri, Jan 16, 2026 at 3:39=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
[...]
> +&sdio {
> +       status =3D "okay";
> +       pinctrl-0 =3D <&sdio_pins>;
> +       pinctrl-1 =3D <&sdio_clk_gate_pins>;
> +       pinctrl-names =3D "default", "clk-gate";
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       bus-width =3D <4>;
> +       cap-sd-highspeed;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       max-frequency =3D <50000000>;
> +       non-removable;
> +       disable-wp;
> +
> +       amlogic,dram-access-quirk;
Have you tried without this property? To my knowledge only early G12A
and G12B SoCs required this.
The mode enabled by this property limits the SDIO throughput. So it
should only be used if the silicon requires this.

> +       no-sd;
> +       no-mmc;
> +       mmc-pwrseq =3D <&sdio_pwrseq>;
> +       vmmc-supply =3D <&vddao_3v3>;
> +       vqmmc-supply =3D <&vddio_ao1v8>;
I'm missing:
  clocks =3D <&sdio_32k>;
  clock-names =3D "lpo";

> +       brcmf: wifi@1 {
> +               reg =3D <1>;
> +               compatible =3D "brcm,bcm4329-fmac";
Is AP6256 using a bcm43456 chip? If so then this should be (according
to Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml):
   compatible =3D "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";


Best regards,
Martin

