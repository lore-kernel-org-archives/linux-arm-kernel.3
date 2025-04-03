Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616DDC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwVbis7FD5WGTE3kHS18ntG8BxtaZlcsMBrF4lyJnN0=; b=LSErJCWX5sPXI0GzKOaC4HPtuV
	2vxyB33e4bDLVl3TCfr25FHSMstWkutFWwNb0nYbOvU/YlJ2V+5W2q+J2dbmOxCcfi8CIBR5qwSL7
	0kDv4QDDm6xv+Xllvz9rbXEuakDTn83j3wwAPtKByUMDoFf/h07FawYBeEa1WIADPuva2UdkgE8N9
	BlP2Tyqsexz7IgPBI/XTsTwme3IhcbxmfCu9kfRMosSt5TPxNx+hhiOtXLsIVPl92zPoOvcAwtDCd
	Z/Q00jLJ/rN4g1CFbocYCFU4nRX7myIxdSeeqOGpH02c7yLlnTpw1T4EwoCWPaklD1xtY1MCcA60B
	LqV/bqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EDu-00000007x5c-2kO1;
	Thu, 03 Apr 2025 06:38:46 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EAL-00000007wES-0Sjv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:35:06 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30db1bc464dso4892101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 23:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743662103; x=1744266903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwVbis7FD5WGTE3kHS18ntG8BxtaZlcsMBrF4lyJnN0=;
        b=uxLSiQkYpvgRmG35KSjJbJwN/wbTLBHzeeTrm0jXZcp2DTFv3K30KQAHbMqN9+L+XQ
         wcTx91UKPdM7ZuXXugN7tQcYivzB9tPeu7100W4ckHYicM31m4fDQEvqWghmuHu2hw//
         HgsfsB/jymqzVIaWKqheApi/9NkHU9h3GFJrr+8NikZR9wv9XEIpku6FrkPWsdrxmqIO
         T4UAr+BSu2EKEKBhUg8utHp7NEIu0HGUJwoOIMSZBLXEWGmdNkhVzKp0gUf6b0JiGeS9
         eKhdFi2zJ3UrNWnkDGMI3c9qHTdW2wXB5+tYJL5HthhIma2jkDIOSy09xR3OXXcAQP6q
         cYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743662103; x=1744266903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwVbis7FD5WGTE3kHS18ntG8BxtaZlcsMBrF4lyJnN0=;
        b=eMdqVG+x8jA0qGQ1tQMfGmXuXwja/3+lYip28n0I/3EZR7MAjmX8S0irtlKCpOY8gf
         Kpj5QYKbuPVxO8FPCtiBC1ji8qTaz0Z5YYwur102W8zxz5iPkp2D0NYv0BIzmlCEQQ5+
         mmi8No1boL75Y1/E/t51J2HoNNBwGK1UBg7CA5W2NGoObQ9wyjoouO/lxfD10/tbzmUr
         ObAXkgrqk4MK49e688Rg6v3dmYlNhOGIBfmXEpARasuPN56TIKO+cna9jDidK7S1F7EC
         w0qxSj2wVHryS1b0m9eraANV4Mn1KkAJ3XtoxXIGk4LcRdmW4aaWlhKt8yJpvT2Xqxbb
         87uw==
X-Forwarded-Encrypted: i=1; AJvYcCV2gYJgQBIDMLF9t8G7oWHCPQirOIG8cS0tYHj926u0nWBSC/KJkltL6rPwKoKdD6Z+SOqTPMhg+Lzzkn8Hylwr@lists.infradead.org
X-Gm-Message-State: AOJu0YzPjLfRgTL2VNpWvTQhELob9MevPGWJtj36N/swcQbDkdbyPa9P
	XSljvYNoPjqSOUn+9cFSbrSa1jJncqb1YGuspZrWAtJKtryL03O/YbQRGo8pFeQJgoqe0nxagZp
	X9P4lGlA4K4f+kHpkaQLXYMk8dArSwnUQZEnJnKMTbrUcC/q4
X-Gm-Gg: ASbGncujZY76zaxlImKJSfIpu1Sj1yezEyau7QDvHQVqx3fMBP9KW46P8SnylQkAPTF
	jpuhKkOOd5EX6Udpky3jfxzZ8aBXCTqbdnvEnZjltmQX6JUWMWAesi3fYnJ33A0sn+HlDpC3uQK
	aI7ufTgHkmCSjcT4n4bdIc7tAsF/51G1Sajg9oQyTZo/QuQzjQZJOo1aloKDAWXjEbq/U=
X-Google-Smtp-Source: AGHT+IEPn2huBHKsqDAGWpve5sAjpBNBnpMsrd2sYo/j2hYHK0dJ1WibZs+8/GvHbHlhvGsJDnxEjzhVpbqKnYaGX7E=
X-Received: by 2002:a05:651c:144b:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30ef90cd023mr19356701fa.2.1743662103234; Wed, 02 Apr 2025
 23:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250403060836.2602361-1-mubin.sayyed@amd.com>
In-Reply-To: <20250403060836.2602361-1-mubin.sayyed@amd.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 08:34:52 +0200
X-Gm-Features: AQ5f1Jo8XE_rqZUxS52BXanujb5HYu0Iq_OMLm_FELFmKt0f3v36UDRWRst9x2c
Message-ID: <CAMRc=Mc2DKnc1AM2WSApZtwOKCFGNZ9WF6LzzkECaV91R5w-iQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: xilinx: Remove myself from maintainership
To: Mubin Sayyed <mubin.sayyed@amd.com>
Cc: dlemoal@kernel.org, cassel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linus.walleij@linaro.org, michal.simek@amd.com, 
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org, 
	radhey.shyam.pandey@amd.com, linux-ide@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, git@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_233505_427781_F363266D 
X-CRM114-Status: UNSURE (   9.92  )
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

On Thu, Apr 3, 2025 at 8:09=E2=80=AFAM Mubin Sayyed <mubin.sayyed@amd.com> =
wrote:
>
> As I am leaving AMD and will no longer be maintaining
> these platform drivers, so removing myself from maintainership.
>
> Signed-off-by: Mubin Sayyed <mubin.sayyed@amd.com>
> ---
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml        | 1 -
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml       | 1 -

For GPIO:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

>  Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.yaml   | 1 -
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml           | 1 -
>  Documentation/devicetree/bindings/usb/microchip,usb5744.yaml     | 1 -
>  Documentation/devicetree/bindings/usb/xlnx,usb2.yaml             | 1 -
>  6 files changed, 6 deletions(-)
>

