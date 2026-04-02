Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC5FD6AAF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uPvnhmls11jZMJXidvzLVFFEk2TWAWWR3yks90JsY8=; b=yfZPfbSfa82TyGpcSXChL7krtA
	4/8ux3kMt3UT5dpaV5T6sLnfYd4HuaNZOqg8eOUse8SsjMOOzS7LekUiSnYxdImI/SqYH/TA41q7s
	0KYydSP64qXUclfiORupgKGZp6CSrz9SHE8N78vWT1tgNJ3+y1PXBkzGnenttQ4Y39DGbMuv4L3YS
	UCqh5ErwQLBRgvZ3fTgp6Qwh15dpqvSFEuF1vKe6xKeaqz4UZtFPQY/lZzBbuwHWtQAcC8mAmtJsL
	cxUrJ1Z4rUS7u1h3NKsL2/2PTDYwtuqbYMezLtkBNQ9amP1JWoVIlSwUVvXyHCxHSvk3SDcqHy66U
	stxVzc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8M1H-00000000bUU-0Qkt;
	Thu, 02 Apr 2026 17:39:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8M1D-00000000bU3-3T31
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:39:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486b9675d36so9755205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775151586; cv=none;
        d=google.com; s=arc-20240605;
        b=QsDXn7wfqrWncJUqvxTuABW4M+EnvqRomP6Zeri50b+rRNNIOX2ahQhLcwMf7JQ4IX
         KeNrquAqTo1uG0tzdU4uRHSpxwmIVj6pMme+GTWuWBUa3RGJ6OEnDWd3zBEXvvMHhgqC
         6vXGrHdbv9fV62pTFseseZMZS+sxkbBN4gk55MjmeF3K8Rg1I+9sJ99TRaSFCZgvw0ko
         KgEhqAbIY2cWpuLBkX0ICJxIg1Eh7susmoBcazAeSmBc3hSRM+XnitFnHEZ4ClxeuMkR
         8su5ZEwnVaSeAqEgi2iQHECp+hTrLm16UPghXMjvzuVMK+2EDP6E2qa9pHsvGWkeCtdh
         C1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uPvnhmls11jZMJXidvzLVFFEk2TWAWWR3yks90JsY8=;
        fh=ieK2B2A4OrwSMT9QOe9Gxu6qufxJ/gvMzvLzhvPkflY=;
        b=juYHkqJL29BidRBnwGJjgOgob8B5IcTzyrNvyV5piB2rKfdfUeWIzM8u2JK885uMGf
         JIbsyWORXjz3QyQF7GBwvhD+Ex39H0ydntTl9dBj9mFUmNGQkv0hQMU99NXql2B5zFXB
         MCIxFYqzWEXa4g0xJ1SMcCwUFyaEsW6MY6MNW2K1rOrdHM1v5nGA6XxMXm1mRHh+31/R
         KcKxitqX6kWPT4EQYR+X+BeVOnh4gwvEaIX6AgCE0AbkES/FxAvSk6N21C4dhXZTWNca
         9nH8IEQrx+9wd/xBGhabRmcM663lFwoXVpd2o3bXF+a+1ogSrVFRQyYd7WZkL0VYmjIv
         d6hQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775151586; x=1775756386; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uPvnhmls11jZMJXidvzLVFFEk2TWAWWR3yks90JsY8=;
        b=TVq4U0YiJQ5ai0OtUYoA2X2RFNt0GG0vk27tDe+iDO8NOpzzJ1GdVT4bkxTVZXgMGW
         J5mOaq1MzZY0795+3yH/mDGHysTFzRqA1aiCrLjKhpjooTvzjr3WG/VhmByEdN9cRpys
         zQuQc+1B/KmGMoLjAAaTn5Rx0dobaUyH6PzXd5pM9FMZNaG5gVQvQprdYy5CZyvRydyu
         vsUedqDtm0eQREaLPy5zDb7fhlm0DPxk5uZdhNIWbhga0hX1RvhMgRQaM2c564NnuPYk
         FaH3wGaAPffFtI90/XqdpzOsSS9tStd/mDZgeuLw77VwT8OZd7pDlB3U88FT+zrGULoP
         oV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775151586; x=1775756386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uPvnhmls11jZMJXidvzLVFFEk2TWAWWR3yks90JsY8=;
        b=iZr7Wj81MKkWtkqoG19YWJ8GZdSn2rMQBRcx7jE77K1Yk0VCgpI3qBhVscWBIJR45E
         r7epPnbshHHxotrfhgjm+vNsoEBcVPAzm6AIqIrHwmImYu7ZuDLER4lKDRO5RdZqbrqf
         HcVpsNajhRvqtoxXjq1Do2jk0loOCJdZqj0dsD6O+co3diQZMP6p+YTbG4d+1cDI4QPW
         fVp8xBwkEV+lrN3krrvvNd/PSYfaKdhymIYVc0P59FTBWYAyk6p1awezSOQ819RQKe7R
         jXYzRNlzrPt4yuLt6vgbtEYWU58ne2XBXEh2i9dClt84IYqAFk9nwrjMoKR94nxpPkvS
         alrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUepGWaPBqAh174BLcuyfHS3BoD74UjiO0PkRgU0aULTFQGb7kqJuh/l5fzOnGs5TN+pFXWBI5BWhdFtb/Fp8Jm@lists.infradead.org
X-Gm-Message-State: AOJu0YzgvzbtHo9/5GPAdcg9eDFa9b29YX8z40DkPE+C3aRb5J4v+nXq
	pwl5lycK0+LkRzPZ3PBR8+CRNH66NEv82/HqDbjywJOZLt7F6LN0p7LYv2y15hwzQmH6517sKI2
	6hmIh6ms7IvSNuYN6Dc0Hfku63m6jkng=
X-Gm-Gg: ATEYQzwOEw7vhrYlAAwZG4s0KofTldRVAAbU1O+Kcr3osu5I3aZFEBGcahuRNELhUyL
	1or2RDgGL09CCPTRt8bWK4YINsBBT0mnWHYTDhRNBaEX6lhuaJ2lhE42LHbJ56LHqdDF0oDQRfY
	gXqNElOT007eF7Y5cfeYeTTFasvwFkRJmoyE8k8zp8g0eyHwg0XFBCMEVyz1gVziCfAPpFqq0uh
	tqSuCOruoCa9QRF5forxTjA7fVHeU38PVtNC6BWWDjB2ZpS2wxND6G9hQ2rcswPsDX5EoNMnwHu
	G7un/9LDqzSNwuFy6CaAJLhGgIlwrUWGKxoCcWP3
X-Received: by 2002:a05:600c:68a:b0:488:90ac:8f8d with SMTP id
 5b1f17b1804b1-48890ac90fcmr32178355e9.16.1775151585540; Thu, 02 Apr 2026
 10:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260401041929.12392-1-CFSworks@gmail.com> <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
In-Reply-To: <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Thu, 2 Apr 2026 10:39:32 -0700
X-Gm-Features: AQROBzDUcpqQpe24gMH4zeWd5eqMpRIPwUS0ch-pgokIhwXtjepCY0luOnTMD-k
Message-ID: <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com>
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory pressure
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_103947_882786_22A65423 
X-CRM114-Status: GOOD (  15.16  )
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

On Thu, Apr 2, 2026 at 10:16=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> I've tested this on my Jetson Xavier platform. One of the issues I've
> had is that running iperf3 results in the receive side stalling because
> it runs out of descriptors. However, despite the receive ring
> eventually being re-filled and the hardware appropriately prodded, it
> steadfastly refuses to restart, despite the descriptors having been
> updated.

Hi Russell,

Just to make sure I understand correctly: before my patches, you've
been observing this problem on Xavier for a while (no interrupts, ring
goes dry); with my patches, the ring is refilled, but the dwmac5
doesn't resume DMA. (Ah, just saw your follow-up email.)

> Any ideas?

Off the top of my head, my hypothesis is that dwmac5 has an additional
tripwire when the receive DMA is exhausted, and the
stmmac_set_rx_tail_ptr()/stmmac_enable_dma_reception() at the end of
stmmac_rx_refill() aren't sufficient to wake it back up.

I think this is new to dwmac5, because my RK3588 (dwmac4.20 iirc)
happily resumes after the same condition.

You gave a lot of info; thanks! I'll try to scrape up some
documentation on dwmac5 to see if there's something more
stmmac_rx_refill() ought to be doing. I think I have a Xavier NX
around here somewhere, I'll see if I can repro the problem.

Cheers,
Sam

