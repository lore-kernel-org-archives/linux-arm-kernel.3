Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699101093163
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 00:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmO+t93uysIUQnRasphSpij7YbHaR8RBQm7HKwGHz58=; b=NnhMrStFUupNvC+Vi+dTHQuFzz
	iSbg1ei0m5NTOBKO4IFRCs9/YHNoC89DyFxjEeFBMc7iXcemrs7UTp4i3jzdrqjqZbx8m2bAdaAJ8
	S2I6+GiGbXgm7nH7vUrA4iE5lkHad+9nLVgU10MTv0MqKYmgciWVOKET+C/FAeVaJGQdqdwNxtT/X
	8JhBlXzpyeBQaJ5aLvnbla2XBpAMxl7EwcYmFrTAPyQw0Ew3eAtbiVBpAxcuqq/6Qh6qOsog74ybk
	RZuKoRIOC54QkeWEUKsH6HrRXmms0Ym++MAvDLAzC3ldkBu47dMZiz7IKKkR8yfrtNna3jbxDlPPY
	eGTRJ9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3NkH-0000000BqB5-1MfO;
	Fri, 20 Mar 2026 00:29:45 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3NkF-0000000BqAf-27dc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 00:29:44 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b8f97c626aaso237563166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773966581; cv=none;
        d=google.com; s=arc-20240605;
        b=VdvbqySgI8wGFWA5casaT4DxWKdIeKa4PzCz6plY1dM25V4aJLw5G7PX5kFbag3l+O
         Stkkry3w4M4kUgj42IbNFnm3OcHyESGWoCdnYv8EcNukeBameg0MwqFj5NWUJo3oHDrK
         0BZq4MwvYhLZJ2We+Ls6romPqlz/iHYqRfG4IdViGIYn1GKAiO9Sr8XmJikwz8s8YAwr
         yLFgnToKqjyPRMjYfR2rIxBZhwETt8TUFARvVnCaeupKwosc2x4+AEubAI0XkCP0ZSzX
         l0ilo/bt4hsP6XHn2vRPGnaZ9/5PbXD9ZNgZs+VtVYLkx0G8nvepsHjzjRFdtF9oySR8
         CQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmO+t93uysIUQnRasphSpij7YbHaR8RBQm7HKwGHz58=;
        fh=AyCDoeEZpDhTbPFAxbhXDa8aVJaCN1MEyZHCg2eHJqo=;
        b=QGLTU2CWxnmwYti3EE5hpRg4dcIjoYQ0rorS0PKhPvLHbTZZg/xmYGvYAKs1Kd4mmR
         QwOKd7eJ3vTZ0MGct/CNDlf1FwxGBe1cXwm9i7O/c0Z68+nVrz0VfLlJxkqcIp7BPuw2
         J4Mm0t+4gnsRiuiypPqOVHP62SJbUf51XZW/lBUZEu4PtCm+4kiOqoTskgfu5KkCQgJA
         1jlxaSew4sWOxxGzn9PiUKzKv85KUS3sIIRmy4qTb9xMiC1u6k6difTyNWaihSd8H/PU
         D0qewFdPtC9GLDnfB1JC61/k8LZJgByTfDFkKU2CQlgZAGJBpdR69WrDDWejtCC5n0ot
         DMdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773966581; x=1774571381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmO+t93uysIUQnRasphSpij7YbHaR8RBQm7HKwGHz58=;
        b=h60Xf9+JXS9ULiG5fsTYDgOCS7rmD+o7e50zTeB0/7Y2CIcxzXoYsDSPbb7PnzA37c
         TOgS9CfPu9a1uusoebkVQVOzvSt84ImmDDKvri5n911C1A005BHOoohFgk3aPn1misn7
         zQ2kRSsJVBsdTAuJFW7T0xSrWnMBu0sHyfw/pkykfdwGd1q7S/ma0oCHEJUPeBwNJCZ9
         vMrKKjaMwS3vFi6aMeWICvlQYyyrFuCCmlVlH8qDPIH0b+cEuI/QG5gwM5QaMdhMyFEH
         vPZkOJ/zz0m3AHrxiM+faG9vNsZFT3N0+QwRne8iboqsI4Rz32XJcNC9vpLY0c6j2ikr
         ct+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966581; x=1774571381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mmO+t93uysIUQnRasphSpij7YbHaR8RBQm7HKwGHz58=;
        b=cZZ5f33LyFR3PlbMbfPA7Bv8pKmaX0YMmQ2q7+W+/FIbS/r8Rbl6mLkslWNGAEk8Hv
         z8iylf44sMaAo3qrxyYoxhbxwk6+ZL9g3rz+09+NWreMPtpjVN5Z2l8VY4dPx7ENMC1K
         USyKCL/ctC3vsvxD2iygB9m5IEArRxibmfUiO2aCtjPlgf8xEwZ3PgdsiPL6NBiIWeNU
         FgEFnmFSQiBlVjrTWlSgN3tU2q+SnhF89YInxjAZ62S9AMY7qcqKZkzEaREMZASUkdDH
         HUfyGoPog+fTK4qZJ9JAn3RURK5fV3VNsW0GbWZNwgv/mni1asXibsxLImCzEQkjz5ci
         XVBg==
X-Forwarded-Encrypted: i=1; AJvYcCWF9LOK6RBiSkaeWHBwi+MXKXhDXQeDBreyQbB18KTS88tTtjb6uqouLyOrq7I01+tm+KZ9lkgZS8XuJnE7yi0j@lists.infradead.org
X-Gm-Message-State: AOJu0YwIiYBCOoluWb7mTOL95I9NcKH65ltFiF1OTJNaG0K1ncay7PQU
	5Q62EhAXVsrO0CeyqseR7AaIDYS9kLsH/Qxc4jebprrPOr5aN7+tpzI0eGuTJTETCP54Y9vQJib
	VbthPyZ9mNzdklqfU7BzDdlcOWgIqtJs=
X-Gm-Gg: ATEYQzxSYdRIKz+sTcOCVtJuyab/ubcklyH85GL3L8C2An7iCNbqzGHmevBiuoWRDAJ
	EXVCymxUy6jlSZowtsJELYAo/qi+z4qgyL50e7rl+9dL/6CIrpwwrh/H5QJu1xYnF6QdMxp20uV
	X5q+heR45heCJxxNbW9bh6SA5grdvoa5Ov4GacpwVKY5KOWcsW82nIY2aBQRIS1kmlycWt1QEOk
	x5dswEFf6siqQXzPjIGoVyJIMHDmWRRupJsoSxTX6UW3in1n7bAQmAKUAAXOeZIE2Gz9Sjyuj6K
	fN8614yBry349FkgXe62BDSgzWDYL80LA8Ngma+g8g+/pVPVyJdgQQKeqhhJ/itCi9eZqE+PuOS
	Z5HlSNg==
X-Received: by 2002:a17:907:158a:b0:b98:2c44:6631 with SMTP id
 a640c23a62f3a-b982f21dc70mr52496266b.14.1773966580568; Thu, 19 Mar 2026
 17:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260319035324.269905-1-rosenp@gmail.com> <20260319035324.269905-5-rosenp@gmail.com>
In-Reply-To: <20260319035324.269905-5-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 19 Mar 2026 17:29:29 -0700
X-Gm-Features: AaiRm52y_H768PUYbKYHVrWJJ0cq-GGpc2lSjEGUNMPhbPJYWHIKZIGgwgV5x3g
Message-ID: <CAKxU2N8Vb3D0oEGPzOqvwsXSVLhJtxh=5xrd6qq-Yj2X8Rt5Rw@mail.gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: BCM5301X: EA9200: add wifi definitions
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_172943_581865_7F2F6953 
X-CRM114-Status: GOOD (  14.94  )
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

On Wed, Mar 18, 2026 at 8:53=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> brcm,ccode-map and ieee80211-freq-limit are needed to be specified on
> some of them for proper operation.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch=
/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> index 617fb55bc52f..7b1363aa1144 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
> @@ -93,6 +93,56 @@ led-3 {
>         };
>  };
>
> +&pcie_bridge0 {
> +       pcie@0,0 {
> +               device_type =3D "pci';
> +               reg =3D <0x0000 0 0 0 0>;
> +               bus-range =3D <0x01 0xff>;
> +
> +               #address-cells =3D <3>;
> +               #size-cells =3D <2>;
> +               ranges;
> +
> +               pcie@1,0 {
> +                       device_type =3D "pci';
There are typos here. "pci' vs "pci". Should I resend?
> +                       reg =3D <0x800 0 0 0 0>;
> +
> +                       #address-cells =3D <3>;
> +                       #size-cells =3D <2>;
> +
> +                       wifi@0,0 {
> +                               compatible =3D "brcm,bcm4366-fmac", "brcm=
,bcm4329-fmac";
> +                               reg =3D <0x0000 0 0 0 0>;
> +                               ieee80211-freq-limit =3D <5170000 5250000=
>;
> +                               brcm,ccode-map =3D "JP-JP-78", "US-Q2-86"=
;
> +                       };
> +               };
> +
> +               pcie@2,0 {
> +                       device_type =3D "pci';
> +                       reg =3D <0x1000 0 0 0 0>;
> +
> +                       #address-cells =3D <3>;
> +                       #size-cells =3D <2>;
> +
> +                       wifi@0,0 {
> +                               compatible =3D "brcm,bcm4366-fmac", "brcm=
,bcm4329-fmac";
> +                               reg =3D <0x0000 0 0 0 0>;
> +                               brcm,ccode-map =3D "JP-JP-78", "US-Q2-86"=
;
> +                       };
> +               };
> +       };
> +};
> +
> +&pcie_bridge1 {
> +       wifi@0,0 {
> +               compatible =3D "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
> +               reg =3D <0x0000 0 0 0 0>;
> +               ieee80211-freq-limit =3D <5735000 5835000>;
> +               brcm,ccode-map =3D "JP-JP-78", "US-Q2-86";
> +       };
> +};
> +
>  &usb3_phy {
>         status =3D "okay";
>  };
> --
> 2.53.0
>

