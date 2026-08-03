Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78268C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=; b=F6KCo0peOOgB2QNIWTbiIr3oAZ
	Aa6RaXH+qryI+mBZkt51ZTjAExlXlAMVN4J0ooy0ivvXNdexjuLn4KSUA/wBZQkxBdSqSc67mZacL
	gK+R96OiCkdQMq73gTWDqhEFVtanwDxtdIoGEBwUw5CLyrqT6j/yHDRgzUBxXLSZMyKb1P95+83EM
	W50xcTx4242fdRc/RGP+NpXPY97W9Hhq3qe2ksuoiNtp/VeiPrOiR29T7jE3K7uynmIU5oUf9/tRd
	lCVMxPU3aySZN4Ep2IxSzgNYUoIUaZIap5Wvq3BAgdZZPct5ZYfpLBY1LUWLC3hd7eUtuZ6oDbQmj
	+TgBTtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqv2h-0000000HayT-3zCH;
	Mon, 03 Aug 2026 15:57:31 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqv2e-0000000HaxA-3RCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:57:30 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so683768241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:57:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785772647; cv=none;
        d=google.com; s=arc-20260327;
        b=CzhJGrUeNfvmD8FzTw8TExnXp/xIC7aryH0a4cjnxYUgkHrL3W2dEoTODzDmxlFBA9
         gwrRhln7HvJBoL31NnluJNPr2cBsFaasyhM2dmfWQyL6awnZJg2UCWPONQyO2gffdsU1
         SnbJBppvJPyEX8zCBsDgiUnd55FiJA9hilh+avxPM+/4vBvwbcKTRjolDsyXZr5/kPck
         comn1yTLNqFfxmxojCPpJ9GUM+97qJkfqA9uR7AMYOpdzxNn64hQI7OE9YIu9pUmv24r
         hzqz8NI53RtTjSsZVWoFzMRvtOf7Egl1got+7mIoaiLJHoAgglIlEZQ8yaa/ycTx4svU
         jPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        fh=4BlAQaDGWAV4U7Y84HXplPtS/0B5qJAQZqnat5Jgkq0=;
        b=BoM15MueCMUFpOkCio/hVwLOljMpFZ0hpqzN6b4zv5uBEuy/zKIcCV+RSF9PBfIeMl
         B9NBEXm9mBw2if1EmwkUejxToAiAtc2bhZixfXlLsqWm4+YAUOEs1xSSGkFUI9vK+ydL
         NvwuQJgkvFCS+PEHn/pnEOvJrbhBWubsnstmcovrJVfu1IywwS2xukpswUi3ZFUrvXVX
         +0QCGCniJmN5ahTAYp57P0tuWIA6Z4WiGb6t7PWrcMT+aVQTASDHCin0jJAe/m/6V51e
         KBFxz6k9y0loUNtpr9p0IwfyU7rXQEvSgJzB256z6u793SmwTQOlGE/R+pIGXV3x3PJn
         u2PQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785772647; x=1786377447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=SLJAtiF9jdiNvEm/Trj6xN+SA+qnr11CHe8jBq1stSQjihSXQ4ZwZwnT9jRrWiwCc4
         uyvsrPzN3xoQMYx5Hf1mhKH+lYipfkFgn4Od9bdxXA3hKaoOSNFG9kh9PC2Gr5WCe968
         JCRZGcjW1pzc7ZKh+91twPmRY8QAaHBuYHaBlt56d45Ls7xK7UO7YImx2jhXjOb0r3ua
         WQ4b20gFfZNCkVzE5+1rMb2YcMBLFeBDTW4164K+wAkszYUB0bl6jbfNw3gLr0vLTwBo
         C0FoKoCuf82k/Jfidt47OKkG3vif+NkBH2+5WOSy9vQ3SN5klqzMC8lV8Q4FlzwRK+l5
         hlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772647; x=1786377447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0JlmS2gNslt5buGhuv7J6Rqxg7nw4cpe34TAqatS1E=;
        b=LkDlJDvWlfYRoWXnd+BsU5KyoaYJ0r7VStcskKgsZ9+80VQ1jRY+i6nvxHrVeAWQVF
         +fOvHuLjiKZz+V0/T9mdmdk0gg5UgsXPQ8Ocgh1rrZD4MlpUAa8Lg1cxsAub3rEMisOd
         6QuGged+e4BY2kwL1jBVOfdmAh6PHZTXJJY6RIM7izbIUCCY/SdVFPYKXzTw1AVUqFBf
         fnPM32Xng/xtHbJu5+yeY/VX23C5cTiuvE9zcriku20G4vf6y7Py7kBPLzQtyftJAqWB
         2DBS5gZDzECU7Se3ggktvtAtDop+RWG3qyvqdcM6R9bamy8ukBWrxtFzfTK/aDBtdSQU
         JJlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpKoTtShAgZykUr6ae8+Ner9RJRYUudLVhoKTbG0Eeboh0/GwWiECCfXoZIW7+arozalEARJUog4uFKJW2QFr0z@lists.infradead.org
X-Gm-Message-State: AOJu0YwYVlnGpr4z6es92H/tkiZjWwVPf5Y6BuDL9X/w2r8+ReQspe0m
	m71OKUSJ7I3RJbmLS1Uoruz3iZiRdu+J+CXLknUgw7J217deEz30bQdiaMj+wSJHGDbiQhw1BCP
	74w1OQNXOaM48FoRtZ2/sa/xGQYE5Vr8=
X-Gm-Gg: AR+sD13+itp3e8SziGnEKG5GxJOKx9mMdlCRKRQ/K/opzIGmrZ7T0KOzHTGwwC84M7l
	3UYOCkjpskAyKhPDZ+wNRhHPbg1hGN0zTfcYfnZSXJHWDKbDieJdC94lH+ek9vhjAFjsWK5IgRI
	EM3c8tgm3GmqpSr0CxHn9YHTNSENFP0d6c6U+B6U9O2FLD5ZFSgBZbnBDBJLWtOPpPhtn4Ao2Kr
	6KZtR2Mx6MkuI/i7RRBScoWfkgQajwtxuytmr8ra3NnaWlkQDSSVEGnYtrM4EwLK/5hMZ3eR5Rp
	j041i+cVAD6N3krs61T5Rsvo4zDd67Aw0fH3nqOfDGfV1zmVITfbpWyZPjizs8AStdxbBSP73eW
	PLicCKCzcInyV1CFb+J7BWIDq1Zm7+cJouLVwB2e/DK+AgtGOkg/tMDmdOJrTLV24h0MquMYrWQ
	K0FSuNwqoSzw5z2yUfxAN/vGuWpPwO8QSGWlQQ
X-Received: by 2002:a05:6102:3ec1:b0:740:177:f357 with SMTP id
 ada2fe7eead31-75b21b5cddamr7901767137.6.1785772647108; Mon, 03 Aug 2026
 08:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com> <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
In-Reply-To: <aaec8809-8218-4412-a60d-931406dbf287@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 09:57:15 -0600
X-Gm-Features: AUfX_myOaFTmy1w_XsU_xICVSFiXSt1enMYBuh0WDNCP9gRZxCQ8cKkbteQKJ94
Message-ID: <CADvTj4qCYjQHOQn1jRTHNNL=xeX6z3Dgc-PLwOBUvX34AU6cuA@mail.gmail.com>
Subject: Re: [PATCH 00/21] net: phy: add X-Powers AC200/AC300 EPHY support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_085728_876233_C9438ABA 
X-CRM114-Status: GOOD (  34.18  )
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

On Mon, Aug 3, 2026 at 7:26=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi James,
>
> thanks for sending this to the list, but as Andrew already mentioned:
> this is quite a beast, and would need to be broken down.
> Jernej and I created some patches just for the AC200 PHY on the H6,
> which Jernej recently revived, and IIUC, wanted to send to the list.
> This would probably be a more workable route: start easy, then add
> support for more SoCs (H616 depends on the WIP PWM driver) and more
> variants (AC300) later.

Well, I wanted to validate that the overall driver design is suitable for
the H616 which has to support both PHY variants at runtime effectively
since that is the most complex use case, I also don't have a H6 board
to test with myself at the moment. I think being able to see a more
complete implementation like this is helpful as it can better inform how
we can tie the different control interfaces to the link PHY in a way that
works for the more complex H616 case.

> Which also brings me to some attribution questions: If I understand
> correctly, this has been written mostly by some LLM? I think you would
> need at least to disclose that, if not even add an official tag?

Some patches were, sure, my understanding is that it's not required to
explicitly call that out but I can add more info if that helps, this was
tested/validated using a heavily automated hardware in the loop
testbench setup on an AC200 and AC300 variant H616 board.

> Also I wonder how this relates to the patches floating around for a
> while already: https://github.com/jernejsk/linux-1/commits/ac200-v4.
> This branch is relatively new, but the ac200-v3 branch for instance is
> much older.

Yeah, parts of this are loosely based off of some existing patches that
were floating around like those, although it has diverged quite a bit as
well since this series is designed to handle both phy variants.

I guess I should link to some of the earlier work in the cover letter?

> On 8/3/26 07:14, James Hilliard wrote:
> > The Allwinner H616/H618 secondary EMAC is commonly connected to a Fast
> > Ethernet PHY in an X-Powers AC200 or AC300 companion package.  The two
> > packages expose the same link PHY ID and largely compatible link-side
> > registers, but require different control paths before those registers c=
an
> > be accessed: AC200 is initialized through its I2C MFD, while AC300 uses=
 a
> > non-PHY Clause 22 control endpoint.
> >
> > Some H616-family products were shipped with either package under the sa=
me
> > board identity.  For those systems, this series uses a SID NVMEM field =
to
> > select the control provider at run time.  With CONFIG_OF_DYNAMIC, the l=
ink
> > PHY enables only the selected fail-needs-probe provider, so an AC300 bo=
ard
>
> Just to bring that shallow discussion we had on IRC to the list: I
> wonder if this is the right solution? Alternatively I was wondering if
> just patching the DT in U-Boot would simplify things, and also help
> other DT users like *BSD or U-Boot (proper) itself, to not boil the
> ocean, but just allowing them to follow a standard DT description.

This can be used either way, CONFIG_OF_DYNAMIC isn't a hard
dependency with this design, aside from adding CONFIG_OF_DYNAMIC
support for mdio the dynamic enablement of the correct phy control
drivers is relatively simple with this architecture.

