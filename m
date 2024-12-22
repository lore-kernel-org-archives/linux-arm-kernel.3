Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077E0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFhKn5TumItblZr+eQzLDEEKMdJqIvr95GEz6QTXuVk=; b=yFtGvvNa4S+1df
	6aPGzaw3dYsBimBjwYUtFVkwmi0iF6LmLoZ8IeQ1E9zVYg3FKnCtzE6kzKJDz5+ENCM/jIfMF7SZ1
	uND3zWUfS7BoPGmChpoGFVj9y4Lg6/fDr5XXSx4q8zj1Ep3t08Fa1OjsjFyJ92vj1X7Ce9/+YPLE+
	9FjPKDvSoHl0QhTLpgOkG1VjhfUc8YhfZKfbCWZwXORS61n2MUn3BgPJksXBChefBFOmHDZlbkbXM
	YEp66uda87ZqhTxmdyQKNANoaUiBGf/ZwCQjWZurPFb+MJwCQuApmDMMcc41FrL52qvu+502o2fqV
	QsPq4ddBele4EYN4hksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPoz-00000008bKR-2trZ;
	Sun, 22 Dec 2024 17:32:53 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPcg-00000008Zzu-43sM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:20:12 +0000
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so131924639f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734888007; x=1735492807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFhKn5TumItblZr+eQzLDEEKMdJqIvr95GEz6QTXuVk=;
        b=kQgg8d5zg47c9LCWSQer3PbDEyL8lyMNSFPndagFge7I5KHixVW+gcdofHvmSYMkA3
         1O9/ZES6tN9oRK0OVHt3LwL5YzjMUjPZ+VrdNO39aC7Z/tEWU4U+oAhKLxy7jIxJcYGk
         3ni7O7LGfz+DA1OFnnmPr1X1K321G/9B8TRzjoj7Ttr/K+kJ+eT/5iPh64CWjpwQK7QL
         12gnQLHmSewtqBvzfEDWEm06tKjClpMeeOZHCsQEXWyRSGmKwNX/FocBhNbXCqdkiN2G
         kseHZqS9JTYD8A+ixtmW+iR+cDT4Zc6WgNr7gNGyQZb8/D1KcQyysU01poJck8m0Vvja
         blIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKEvfElRIaMfI17WYjoG31pxtfrKyhH1IMwvoNxihVRWsZJ+My3QCcM2h+X8A94xBntWxWq0J/dVhZqTGS0U1c@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt/C5txMGfpIEOR0hNEsCVpnyk+h8fetuYG/VkZAi2bvUrHJ4x
	JlFrmGVZcnjLf4dTEtmqyJZu5OAw3HSUn7iNjb+35fiDThXnmcBvSd7KS6NZ1MM=
X-Gm-Gg: ASbGncul7aZ8MYI8s/JTKeUzWScUO7bcwYHZo7L+Cj8SIgHgRQCRgyRpupUTBMwNHXO
	2IVbcwWO3hsOqpR5vEE17UqytuwHm1rHtBGqDWHIzTIU7SE5AsfSJItC8j3xtOW+Ty2kIBIWLX9
	2OrtvUTzynBWpSHQaUxniFGjg3K+Qqp0EuV1pfRB1GXsyN+NPSZ1npK0u+BAFl+c7FWITaMeg5w
	7eYIh0oqN3v943qBmzizbGZqSgky9xYZ3yfM4xfRPSEoWsYjBRgYcxlvodRbA+ETNdum2g6qkLX
	JWuEOrkbiQ==
X-Google-Smtp-Source: AGHT+IEvI5C3NnC24DEnlrv875qyBwqTnwVrBIaNJeMb49lLoEaO4Ji0LA58KJ9d/r9snuLKelkIeQ==
X-Received: by 2002:a05:6602:3a86:b0:844:2ef3:a95a with SMTP id ca18e2360f4ac-84988d25967mr1536751439f.7.1734888007126;
        Sun, 22 Dec 2024 09:20:07 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1deed2sm1775942173.135.2024.12.22.09.20.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:20:06 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-84435dbda4bso161791439f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:20:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCyncDpYUxKjyivtdmO/VCNK2DjCftTayas2BUh5W4ohkd3woyFQIaIiqk0M/4eKa9IybK6HTYwWxeHs/8swTH@lists.infradead.org
X-Received: by 2002:a6b:7f0b:0:b0:841:9225:1f56 with SMTP id
 ca18e2360f4ac-849887107d6mr1158827839f.3.1734888005725; Sun, 22 Dec 2024
 09:20:05 -0800 (PST)
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com> <20241220120038.3137248-3-pbrobinson@gmail.com>
In-Reply-To: <20241220120038.3137248-3-pbrobinson@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:19:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v67re8kjHzmPQ1z6Jrvz4x5TBK+hD=DOxtGNTOFOJKAhvg@mail.gmail.com>
Message-ID: <CAGb2v67re8kjHzmPQ1z6Jrvz4x5TBK+hD=DOxtGNTOFOJKAhvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_092011_013266_203872BC 
X-CRM114-Status: GOOD (  17.37  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2024 at 8:00=E2=80=AFPM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> This adds all the pin mappings on the WiFi/BT header on
> the SoPine baseboard/A64-LTS. They're disabled by default
> as the modules don't ship by default. This includes, where
> they haven't been already, UART1 for BT and mmc1 for WiFi.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> index be2347c8f267..752d2aae8465 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
> @@ -42,6 +42,11 @@ reg_vcc1v8: vcc1v8 {
>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <1800000>;
>         };
> +
> +       wifi_pwrseq: pwrseq {
> +               compatible =3D "mmc-pwrseq-simple";
> +               reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +       };
>  };
>
>  &ac_power_supply {
> @@ -103,6 +108,17 @@ ext_rgmii_phy: ethernet-phy@1 {
>         };
>  };
>
> +/* On Wifi/BT connector */
> +&mmc1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&mmc1_pins>;
> +       vmmc-supply =3D <&reg_dldo4>;
> +       vqmmc-supply =3D <&reg_eldo1>;
> +       mmc-pwrseq =3D <&wifi_pwrseq>;
> +       bus-width =3D <4>;
> +       non-removable;

Same here, please explicitly set 'status =3D "disabled"' like what
you are doing with uart1 below.

ChenYu

> +};
> +
>  &mmc2 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&mmc2_pins>;
> @@ -175,6 +191,14 @@ &uart0 {
>         status =3D "okay";
>  };
>
> +/* On Wifi/BT connector, with RTS/CTS */
> +&uart1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +       uart-has-rtscts;
> +       status =3D "disabled";
> +};
> +
>  /* On Pi-2 connector */
>  &uart2 {
>         pinctrl-names =3D "default";
> --
> 2.47.1
>
>

