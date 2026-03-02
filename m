Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46651E9B365
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIzeWSS2d7D55M9xJSTRKzQMZy+TBoWrazPcmwvzxPk=; b=y9+nmxegm+fj5cY1j//j9uBgoI
	5HADw0vqCujus+mKo/Un8HyOswvs24y/m77VKJCD2HCT/nwC18+JWktkKSl4m9AiF3jWFBLI8j61L
	pfuqcv089ghQfcviUiBjYPIWhD/EBgioWuorZHzyOKsvXFL5uXy7Kcl04Dg4W4YIgJLpMDvlZ0hvv
	3fUqU7CZ28VsgrcxGGbsp6t38XXz5F6JM1QLgcF8izkNZ4UAOVWV67kaHzLNPaRBXstOkqI+YlNKs
	zbaR74b8YGxzVsS23IMpC2GJ5r0z744jAzxYt+x71UTnMkwXrg2AJ9O624HNKv1phbYFI9+FlP7Dr
	aeFVtSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1mS-0000000CrYR-1QPs;
	Mon, 02 Mar 2026 11:49:44 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1mQ-0000000CrXe-075Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:49:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ab39b111b9so20714535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:49:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452180; cv=none;
        d=google.com; s=arc-20240605;
        b=Puu1pf5w2HDXOpmXC2cz2taHZBkh0tr9abKCu5OpaN/CIV8avBKMikATJNLo1AUUX6
         4rcBOI9DfLExQxhvknlI4a9CJK5PzAtdJNJ6xrgeptMmwVXrLUm0PiO7Gf+LdLfNgwGh
         0F2QrvT9Corim8NX6zUdMCKDQ3NPRjpaNNkFxb2J0+15OjZKuELfbvlcSyY52j8U2f6Z
         IvfGiqI2P+oI37jNa47FLruOPPxEjJFO7mAPQHY3oFukMgQnSH7699s88mlbHTLWiuSj
         gnA8NjHQFGwpcOu0RsOFRcE2G2G7GccLr2/GSFcSQkleBOt2zu0t32C0i9h9wXhSEhgP
         A8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uIzeWSS2d7D55M9xJSTRKzQMZy+TBoWrazPcmwvzxPk=;
        fh=m7pPepXlEi6Va6pWDjfscGnsccN/AAcd9qHActGg9Ew=;
        b=APNquOylTV1tR05r2ze23QGSBsFMD/P9LzlW3g63zSFuvoGsBC2CDyeqnSktU+H0oc
         oKab0odUSXLuT47nIVlVtK0I3qsHgVtktQymUu24bOLiwtBVsPoOa03XGOmXhUMw6tU5
         iP2NYf2/sJfWLlSaV3cZpBThyaYJyIFXV86eCUVG7aWRLcBbMEl7VAO0CxdJJjRVIUFC
         vKJ0ZZ62vC2PIUiWlaEZQL2fz/YeSg9hOXeV/EdOLB/wlUrm9lobt0NbLbQFyVqrj05U
         IGxZTPenOaudwQvSk8n/I+9Ac/rjbZNKEl5ThgOTpGteGG5QH/vGv4v9a/kbRf4EqFvA
         9AWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452180; x=1773056980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIzeWSS2d7D55M9xJSTRKzQMZy+TBoWrazPcmwvzxPk=;
        b=ZaenMxDoEdnEfKwE5lbVEt7NGD1Bt0Xu21bAGi+DZIaUNuOWc4ijYAgfqc7CyAyrtc
         m76YBH69AK2I5Em4gINpxUt8GF0KG2g2OiqA3KOKRVpn2QKw9Hljh47f3G5lAjPL4Gkc
         gjL7Bj/dPxavqCO0BU7N+GX3W8su9yK4FSc+Gqc/BeDS8lPS8n+zzYYRdnQG8p9oBQLi
         zEmH1DnM51pqJkufRU+4lrCqHhJM8Dm7DwPGwX8wsH4V4SDXLGVr9YyOGtDsFOUhWLJt
         eFjHQYe1YBeJv2Nf1OEgteHACsL/wI7N1E77SjHmiQ+wldz2jq370coHEqEGamOI5//1
         FN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452180; x=1773056980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uIzeWSS2d7D55M9xJSTRKzQMZy+TBoWrazPcmwvzxPk=;
        b=eoj2OkoWZoNF7BuVkfKoi0VfLEUx34OLE+1MvKBKJ/A3mOwCPDIzwCgDR+8xd2O3FR
         B1/tWvF3jxHRB4EZZY4zl7DxdDZi7xyreG0KIhWg9sPHz9m/ApNt9k+z5VrQ0lk7olNA
         puLx/da1ya/eUxxnp5g2HEG5QqA+iQT9ySS+uA7/VmJOa4aXiSouULbj1u72VfsJTvjJ
         Q/F8g1ZPmcIWkt+5+T4YWEqzswajwZlwOyINOGBf3lu/ZLn2CaRC9sEBQgI+kULTwJXv
         8kpDh9nhFZKuMVV81DJMhSu6a5+PM0V+253ur3rt8al6XQI5KcSwRE3892daR5UZXjW2
         yabQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmPktn11yhmKhZgUq/03lDxL4BUmXYme5UvG5eCAHykYTqT+Uit7i9Sg30Urf0IiycKr5oY9P4xS6Ble93xFDH@lists.infradead.org
X-Gm-Message-State: AOJu0YwqJgL89oz+J95S0aTuZIZCc/Rol/0ybjAJl/S0Odvt0M+kg0yI
	BjQHPScoc/+JYns9yDe0K+gzDekyW4lSIqWxi+Mu2pYSf5FjI8sQFH2h10Dbo+lXypei3jm+I2C
	yIccQ3CMmiPGLaBQEHtVEPbWkdSmdsLc=
X-Gm-Gg: ATEYQzws9rr3IU7QAhCEoSuCxBfcZ1mzWSoJdiXPvh1K6L8zIyUmw9zWWYvz2dbU4Ws
	HWyeDtZNVcFT+B20qBvR362yBH0fPK22l2klINDseiaa+ZXxmWfBDGxrXuIH0vjo2FHODgpz2yc
	LXL7emkiCgpPGz+ycHCtekwLC9+JX5DsQGEMnMhmzOrNTocfXMuq4yr1BrdIjuKDcL0hjEYfOlR
	+B9MTl28GZ5xOa4naxXe9eorkTWWOCXR/ux3+dZ9e1gfmuOKBITdiw2eUBQAchYSL3joRCOtorO
	QzF0yOjnF9ETR651xiD0vv+LycCsGf8zaETp7NNJ
X-Received: by 2002:a17:902:d48d:b0:2ae:3e43:4673 with SMTP id
 d9443c01a7336-2ae3e434cc0mr72292735ad.1.1772452180549; Mon, 02 Mar 2026
 03:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20260228063750.701887-1-nick@khadas.com> <20260228063750.701887-2-nick@khadas.com>
In-Reply-To: <20260228063750.701887-2-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 12:49:29 +0100
X-Gm-Features: AaiRm512qnGuhMk_kVkiofPglNgQBsBrV9Icn_fbpH3P2ZQt1NNOt_MmTM6m1d4
Message-ID: <CAFBinCAKwF2q7oE+MAvWGO6_Wx20_PVUKVQ=FnjMdZmDBYkJ5Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: amlogic: meson-s4: add UART_A node
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_034942_099711_132922F2 
X-CRM114-Status: GOOD (  10.14  )
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

On Sat, Feb 28, 2026 at 7:38=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
>
> Add the UART_A node and its related pinctrl definitions to the
> Meson S4 SoC dtsi.
>
> The pinctrl groups are split into basic tx/rx and flow control (cts/rts)
> to allow board-level flexibility.
>
> This interface is typically used for Bluetooth communication on
> boards like the Khadas VIM1S.
>
> Signed-off-by: Nick Xie <nick@khadas.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

