Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B1CC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=; b=fd9SBS6Ikw7NRyxbVx2J0azbXD
	s1fK6CSVns3msDkOsvE078L7hCpfHyi6BP+eX7ba0M3RMwwyj6B0Xpwb6I0WTFPEmX41Gsj9QR+u6
	lVl+dtmVM1IXn5mAAH8+0OFCKGZZKvX8sNFQayVSJs1bWH2kpaRQs0dzvpasOMOwt41bywQ03UIDW
	723wdNbdlbLu+KwsJMUiSwdKjWsbaR9DbGqODhkmfRUa1nsCFFqfF5i1GMGAi8h1QwshWjqlxbT5V
	mgw+8LrcwcI0b4nGSlxlBZkHUj1XQToHeCJYNInKcgysYcN0GcxQuGznfbi3mCPKEcQ9TpZ3y71ll
	iaNJeC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpUkd-0000000B6ZC-1pTj;
	Thu, 30 Jul 2026 17:40:59 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpUkb-0000000B6Yf-0ynp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 17:40:58 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso654219241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 10:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433255; cv=none;
        d=google.com; s=arc-20260327;
        b=SdjED+Zy4MInGBSvrJaeHELXhA2TPXVt6JxBnrjXg/MEc2Swe4aoTGPJBfpoyGRJCr
         PHCkSv4drbtvB2W4a6+ZQr1Edf73jgAr5+FH5/100+JrYC+HnA9tqoZMYQJTOkA9gBkG
         llaadaT5lVOb+KoKeFyMwg6Cw/vSC9+v+dnywXtBiJfHMuETnOqHq0nfKEY7pC4tuL7j
         0YbdvJiIU35q70/Dz8GXKWD/TjwwQne0qa4+hkOV2vhVLrTGeqHrl0Kool+IjcZLRs/g
         XHI0M0myhSVfCdOG2o2+6y8zDOKA0sefX37ldTBv31oT5pdLVBnxYaBtCXnERJ4ltEvk
         Ximw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        fh=1PWgfqiPtsZhzvwasMR4SzxQlzHDeN9X/ELQmrbBMVA=;
        b=Kxo7OWkIzoIHlYM1yShml8DpJ8kcjj9o8w4hv57QU52gbKUQCLIAFHpenrDlVNnAnk
         psD9tUIfoD6SiwZiEpLYlQZXJ6OsyZqssq72K8xciacdf+eCeJttXEopUak0dAJWfPHr
         oMZ7rekq7G/mYOpC3lpMoXkYBK+QQyvRNkMZzF7MacqQLNYhIkdkwOIHsghozd6zxw0J
         w0quUpYUjOCcpy/ot4yR9sRnNGTf3blu5PJDxe+UjpwauOrWugE3YI4VDVKuPVwOUZTf
         AzvBM1+oaJejxhJDxrsy1CmskrtRDDhBGka7hGL8W46R9tmEO+MRW1TX3BlEQEGJuRbF
         UoFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433255; x=1786038055; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        b=d36mw/ag3Mk0JZszHkaTJhToBfd3XS3zCWSV12ZE0lsSXb/4EIuxM4ktyG1ih8sZWg
         HXyGxCY6DLh916HIwwFlhne45rTevuz+yO6BlWVkIy8CS/x5UTnw/fPPuvEq5j4zct3G
         QhTAjPF4ctpLzaDw5BFcHhz9D+BTDi2+XF8uRUHlMW299XfeX2uqurQpgrAQ2Jsh3gga
         Gn+U1HWtDlGi8oxvEWTq6te2L5WQqZpB5uK1s7T6leXBcsDYzInhJKvHFF0kPuAGa/xS
         Wy96OKBssSf/84X3qus9HrmFy5Ep9jm4pPY0ARTxR18DLpaxZBW3VvxTyKfIc7EUD1NT
         hHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433255; x=1786038055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l9LIQKYBUdfDAfZJWrxo5rGoFcd84Hh3LANLGG2Bw6o=;
        b=ir6gZj7VkGB0p3iJTx7TNjMA7xzjgMrtEmox7EEFytcfoXd5mmB2YCsaxdY3W+SHlF
         E0F4e4FTj25waFjEG1DN28igkb5vsN9HWn+szCAo+5nVRyLuSqDu1/aJ7HbABj+0IvRp
         OUbcqlehRFQZMNn/W6cxlis2yq//3zWLuaem1OkSlEOxSxi1TIPJpRuaAJQOimPyQ0GC
         Bjis+0CKVR5lap4xUzLTuMu/OmJFt8j5txl+MFM6maXHyJGl9uIj6GDHXJ1KMoJdOkOo
         SHWpCK3w62JIbNTRL37KeidzA8M5h79IiRpDX19J3ANiWzV3AvqP6KAhT5cHDnK+XpXs
         XKsw==
X-Forwarded-Encrypted: i=1; AHgh+RoeZFRgNbK3VAWsFnxcvz18gxjc0bJeTqYiMfTLnf7fTcrtyudObmmBhQAuel1FpMjlMmLUichr5rUoePCM9hn/@lists.infradead.org
X-Gm-Message-State: AOJu0YwYF67P/TblLc7fn1zffU5fTUbUScffaFfdVhvanTGqZJqmIRl3
	iitgoCDPrN3XUgzzruTsYH6UtA7LD5lSXZyzkr3toHjTKNNgE1Z7HUSBcRrcA+7gf17kxdpJQFk
	4ZLzX/DsnxA/asbco/tACft97dIvWQJk=
X-Gm-Gg: AR+sD10sp5ODWDJZEszkW58e5OT5DwEKvhXeI5OYm+kDBOr1vPFDj5iAdotoCsZF7A+
	vg2Bt0G1uR4YieSsj2/whAsRf8OuXV5+hmYunDq3IwHySp1hDp1174hv4KZpPCfnsWgD+zvAmRp
	CNd7zVh0iQfd5GQBq8/yCcmpf9hIyNNM6vLdACBkQYfLKspa967oviG1aNAxXbhKG0SeDXHncbA
	es6u68dQ6WEA4l1lpX96UAkDWyIABn8m7cJL+RtHAC8mWQyPrS4Fnvn7kPbWKSwXC1j/l5ExDtM
	Jp6E+s+QFMHrnN7I24u0SUSnskBXpeCgtwYLl/ctzqcndB7uatMUp6cpYJ/oy1XVXB4tadxuhHR
	Nuw==
X-Received: by 2002:a67:f584:0:b0:738:8b5c:a41a with SMTP id
 ada2fe7eead31-7582b0ed85bmr442473137.18.1785433255276; Thu, 30 Jul 2026
 10:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <20260722172356.2509190-1-juanmanuellopezcarrillo@gmail.com> <20260723002319.2793cdaf@ryzen.lan>
In-Reply-To: <20260723002319.2793cdaf@ryzen.lan>
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Thu, 30 Jul 2026 19:40:44 +0200
X-Gm-Features: AUfX_mzRjI-xu9REGBWM4Xyou0Hlcet9mWJBwP9-yY6cbvyclNHGRhHVoQ_g3AU
Message-ID: <CA+c=wxVB-cEncgBE12S2YgXhL7DVgRyg12_4jJ-CjxzBjK62kw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_104057_282127_81AF73EB 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Andre,

> There is more to enabling Ethernet on the box, though, right? The
> EMAC25M pin needs to be configured correctly - not even sure that
> works cleanly with mainline? And what are the delay values that work
> for you?

Right, the withstand fix alone isn't enough. Three things were needed to
get GMAC1 up on the OPi 4A:

1) The PJ pinmux. Mainline's rgmii1 group was missing PJ10, which left
   one RX signal unmapped, so I got rx_packets=0. The BSP muxes the full
   PJ0..PJ15 (16 pins) as function "gmac1" (mux 5); with all 16 mapped,
   RX comes alive. I don't mux any separate/dedicated 25 MHz clock-out
   pin beyond that gmac1 group, and the link is rock solid, so on this
   board the PHY's 25 MHz reference isn't provided by an extra SoC pin.

2) RGMII clock delays. The board has a Motorcomm YT8531 PHY:
     - phy-mode          = "rgmii-rxid"
     - PHY node          : rx-internal-delay-ps = 1900  (YT8531
RXC_DLY_EN, ~1.9ns)
     - MAC syscon        : tx-internal-delay-ps = 100
                           rx-internal-delay-ps = 0
   That combo gives a stable 1 Gbps / full-duplex link, 0% packet loss.

3) Your withstand encoding fix. Before it, the PJ bank was driven at 1.8V
   while the receiver sat in 3.3V mode, so RX was effectively deaf. With
   your patch RX reads correctly.

All of the above is validated on my board (2026-07-08): link up at
1 Gbps/full, ping 0% loss over a sustained transfer.

Thanks again for the withstand fix - glad the POW_MOD_SEL patch helped
connect the dots.

Cheers,
Juan

