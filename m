Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B615EC98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=; b=3WSEJV8/l5Q2NgrczTflU2NG3j
	U6Uaqm1Z7Aqmc5gCQYFXNyXEhRdkLvcfqxBzXoMgWN1BuUGRzVWnmSa7qgzgVC57o1yaE3SA9WQx+
	30J3eyaiUmUyvT+79p5lKsKnujLGyaGYZnoAN6GrGtEFhpGkS66gkfS+wUSyexUTb8no/7l8CAkz+
	HHLh5CORSq6dNdGnFi9OqPy7TxRiptNMv3tBBwWamVzC/I0cUKYnb7O0a5XdDYnmQqjXUQ+r6Ubs7
	UN7EK9zTwdqlEvQPcnvXJ4tVEzGUw8CxvJRjCuD4uhFKhJk+E6J1arCwBhbvcfV31a7CCnNkhUqd/
	xlYxJGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fDR-0000000AVQi-2nM4;
	Thu, 24 Sep 2026 08:54:05 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fDO-0000000AVQ8-2Ka3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:54:04 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912df756so13791285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790240041; x=1790844841; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=I+VBrlhkPNmcCu/YmzDY3dY98U+58B4vOczSPpjk8YhKVX1KEiJU+W+sZf2HBYmzF6
         TX3YQcLwHrhKi9rHy74FUfkUmuIVhlLdKH10Q1V4pkQYVKe2WyQd+FiHidrC5/mzBqzM
         0bXMxNOCZvXowhWXTfgNh0iwcnX3a9cyqOXwUtMWni5W3Se+wxjwN9x5fDElLQ+cU5JA
         /JS4Mu2sYKYJgWjXf+kzIPHk4eTve1qBGb07xaLMavQCly31kwdydsCo7DNwHPLt1fzh
         4vTnwaNDtQwvzK70uI5GwhdGK3s2t2VtbrIPzgM0cS20NOvZXwVuw+Ww03qS6ebfDQj8
         AbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240041; x=1790844841;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=qNvJ9R+3KG5oy3DJ1LRxtJ8Ms9Dgni1sB4meWaVeLCMwkNfFbX6kIBKgdxdUWr8/1d
         HkkZJiMhQsIXGDdXvXWy4UE8kD6KpJiiQWcGnOSSjeLzObIIWScVh6VNwrj1u3BlWo6A
         u53wUcRUaVzB9bawQjy/9YX6oiCa+F/Rab/O/FrZHOLls/aJeVRUmTpu4C4/UBjvAqIf
         FPx0hHCUftEh8JRmBCNOQPpQXsrGZaE2TCJDZQoNbQbcFqlkzY7FEjpjQQLRaVOLzZai
         JqZjmZ1mEzIluhuPEPhurj4qq+Z6eM+WshMm5N0o0laXlcG8Is1+FMfKuPoarTYZ1HWC
         /MnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwelZfRDhEWIeA2uLJCJ1Zg5ZJZHIgO6hchSafxKTFvWHYiuo1jTzqkoyuPQ6FnKo+JLaU6vobJ6HD0kt+HbnK2@lists.infradead.org
X-Gm-Message-State: AFuF++m2R1mlIOekCicKI+k9ef1L0mMJKkTxIiIchHVCliZ6PNcil+Qu
	rEoGt2oxwNYBeBjg6OhaoBtiRNGrGbs15tGK9zQFZ7Izh2jUCxeiFU29O+r8fIGR5MM=
X-Gm-Gg: AYBFou1nFXR/aAG2YQupgiULoCNC++5HnLd6k7tzITKBEmKvLtQU6Cn9y8D3oE1LsfN
	AHdpEkx2rXZpT9MfYErlHTfbTblH9x2oAJZg0/xkVll3DQkxGGoIEJ7fND+sfF3wo1Fl463ws5y
	NrhbARU+Ll/G3+nXM5uxCqQXmRRhp69zBrvNXFJJT3tb0VTLH2w9LwyiHUguvm6ZWuua5W3Lxbh
	q/+yEx7ggdFVg/lwNpUYNjnFDxFPPWvkUxXL0hQnnKy7qUoS9qkILegxd25w1vEnt0zATKuFnds
	zmiEvmmsIR+sE9GT/5uLB0SUwhlvP0yTeHXEO1N5qsanEp16S3Cz746jOhzqWU6W3w5J0SeQLQf
	bW538H2HYL01Wfp2H8fhaMlolcNbU3U4f8cmc+r8IxYiJKoS+FHFAcnemWUaIKR18BGVY+cIpfb
	syysCQHSW/+tI384m67BGsdq3qXRhlcRG4g/Q/CHlKI+ejFK7tXAl8zulhTk9AENZ416cHs0f0y
	t6rR75FHfNzmmgTlg==
X-Received: by 2002:a05:600c:8b22:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fe66d81fbmr28966805e9.16.1790240040664;
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm64643045e9.3.2026.09.24.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: sun55i: Make the delay
 step configurable
In-Reply-To: <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-3-15735155a789@baylibre.com>
 <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
Date: Thu, 24 Sep 2026 10:53:59 +0200
Message-ID: <1j4iff9gig.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_015402_614681_F31C4819 
X-CRM114-Status: GOOD (  12.66  )
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

On jeu. 24 sept. 2026 at 04:30, Andrew Lunn <andrew@lunn.ch> wrote:

>> +	 * Correcting them would break the DT ABI of the published DTs.
>> +	 */
>> +	.txdly_step_ps = 100,
>> +	.rxdly_step_ps = 100,
>
> Could you be a bit more specific about what published means?

DTs like those ones:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts?h=v7.3-rc4#n88
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts?h=v7.3-rc4#n87
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts?h=v7.3-rc4#n106

On A523/T527, only gmac1 is supported by the driver addressed in this
series. gmac0 is another (dwmac) driver.

If I take the 1st example

&gmac1 {
	phy-mode = "rgmii-id";
	phy-handle = <&ext_rgmii1_phy>;
	phy-supply = <&reg_cldo4>;

	tx-internal-delay-ps = <300>;
	rx-internal-delay-ps = <400>;

	status = "okay";
};

If the information we've got about the A523 delay steps are correct, the
actual values would be:
* tx: 540ps
* rx: 2120ps

So I suppose in this case, the phy-mode is more likely to be rgmii-txid,
isn't it ?

>
>       Andrew

-- 
Jerome

