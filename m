Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2455DCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HghvxS1xRodxk3iuqAce0Tjg7zGIVOVO9oCwG/XgrI=; b=0j/72yFkDEYRjEYDWR+m+fYB7p
	RK6n26NpYpTDfMhurELafUvy+m0Rga0+4FaAt6AqpGPpnOvn1NtBs+i60wvqLNaJ4Z6dDRnR8V0mY
	J0gttubtmskdHjgJC0yXORsXH9Dn1q6hPlwVYMdhwCKHMQayrgCqrD3UApqwqnqlGzxyFmYRo49Pu
	dBuk2Zd0Lvgs4cYydxWNThmPPgxNaGsSFmZC4iFsvV3GgcbE52wzr9lWHox5sxBit1A8Ke9LvI80n
	d6QqjwrTtqvTiATebhQ2H/pGmYDvPQcZmL3aQOoZJxk6yGbC5YQGOQForZc9FUNGnO5+od6gYLK1e
	PguFaRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBy3D-00000006tpN-2DNS;
	Thu, 23 Oct 2025 16:20:31 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBy3B-00000006toh-0frh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 16:20:30 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so698928a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761236428; x=1761841228; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HghvxS1xRodxk3iuqAce0Tjg7zGIVOVO9oCwG/XgrI=;
        b=Ez4rhJgn5viJ8p35w+jEVGdTy8z60FG66Nx2J3xuBYr5BS02wNSp6P4y7KWBUbFS2d
         X0nkksWqSNIqr3Lv5c0p4xTiiMcqWbAt9me55IkU+4mFDNqkb1iWk8j4eNfAPyvypPMS
         affCeiE+Z6IHez0+IGZjbuqcDdwafAHSaQKKj67CNGg7i/lZ1wAk/l6nqmYMB+YPm9LZ
         xQN9zFCd6zAlToetUlEnBqVI1e9G15hC5Az+WJpL7jgJq7dsEOKxYHDWCFsLShGgrwOh
         fRVjsa/hf4sZShZtd+TmOcf0+5GrLfw7uT5zYS1l2MYr5F8Uk6qqUL/ubJCvydm38CgC
         rLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761236428; x=1761841228;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HghvxS1xRodxk3iuqAce0Tjg7zGIVOVO9oCwG/XgrI=;
        b=tltqjkiveN7WoD0rJ4maSR8mzFeWZQI/Iiifajg3AIA84U0bESz5rTib/HpGmnGjdb
         GOdrJ+N32ltb1VdVPQo7YQKqiXPKQn46ONofr/zRENSER5GqXSbp5Dnnvx732mMkNym/
         s/jNFrac9OjkHtUaPnkI+G9vz8J27nJ6eNGAjBwOwYEGl/4xgtmB1hG3DL9cII4Cj5fA
         Jsdoapn6tnAiwqfnERh/sBduxh3dmMLgvuCofbDBBDkJ9JD51gxL+7pIq5HP6t9yiNfo
         B/zgArjH7UnhHyEeS/8TgST5ERWN6ON364arDwFN7io/f3PBtHDHDOmz/mGUgHgZgkFe
         aEIA==
X-Forwarded-Encrypted: i=1; AJvYcCUeYYl1+zOQs1Uh6lbU8f3Wy1qRngSehP/CLg1/n60Z7R4fwm7JxtgvuNPjCVveJPnnctKsZqizNrtKC5+YzNBU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9cV2OiBSHo5FIMUy9Dg1mHlZwCA0qG55uuYKyFVz39CJtzpzT
	ddw0NaQPmc/eaRdMOZFwzyhL0N9hD5bG1864XwtCOWccaO9y9F6He7JD
X-Gm-Gg: ASbGncvXzen5CvpTHWwcN3xFV7e8HhNBMKyxHgAGWJSecSnocRcae0bGbDk4vfFzFtQ
	R1W172E3Ak96bx/PUTwmpbel7vvsdB1E9zV5QSE3BjPkPG3racErEBmbcnZsmmpW6bWp846W+L/
	F4vrwGcI4l8uOskkdPD+8mtzPKFSKCb8YSHUoFmFJdFXUCkiM5ZS8zJjwufXFYPWXC9HnegRMkP
	2SOhnSW33OhT9CWVuYjSwdNXYeZLByUh7Kqh0FBiY647hXk3gqRMq5YJN+/CS8dKo+/KxNDlcxy
	EjsRfnJcX5y3AJZQI76sxOlOXNvzNzysgtgetx/OAYDAkkrwRku15HtX1nyhPKcz04HAk4Fp90X
	omxrW8uOAjthWVFxZ/BJR2RaCyIMBFQcYacH+aO5o+MBRD+mubGhHzD7mRA6+0VMobMjm3Z6ESK
	r/W/XkdTVFUHU=
X-Google-Smtp-Source: AGHT+IHlUzfF7dHw4WGoKEoZ4jVJxoqhGoMs+gcob4/KvqVdTBlT8jxUGxfuE0lfhSJNSazy1WfT1A==
X-Received: by 2002:a17:903:1112:b0:269:7c21:f3f8 with SMTP id d9443c01a7336-2946e117f30mr44006555ad.39.1761236428006;
        Thu, 23 Oct 2025 09:20:28 -0700 (PDT)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddecb0esm28047245ad.35.2025.10.23.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 09:20:27 -0700 (PDT)
Date: Thu, 23 Oct 2025 13:20:22 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
Message-ID: <bicmfrrmkdmqqtfmdmsctpkmt3kxcxrxrgdv2a4cma42om2xb7@5kkybhdapn27>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
 <cacc9439-2cf0-42bd-b6c5-13d1e75642d8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cacc9439-2cf0-42bd-b6c5-13d1e75642d8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_092029_199271_DA2E255A 
X-CRM114-Status: GOOD (  13.68  )
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

Hi Krzysztof, 

On Thu, Oct 23, 2025 at 02:22:40PM +0200, Krzysztof Kozlowski wrote:
> On 23/10/2025 14:19, João Paulo Gonçalves wrote:
> > From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > 
> > Enable the necessary missing configs for the i.MX95 to boot and also
> > have Ethernet working:
> > 
> > * CONFIG_NXP_ENETC4 for the network controller driver
> > * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
> 
> 
> These do not carry any IMX95 compatibles, so I have doubts you described
> the issue correctly. You claim that SoC needs them, not the board.
> 
> > * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
> 
> 
> BTW standard comment applies - explain which upstream boards have all these.

There are already some boards that need these configs, for example, the
NXP i.MX95 19x19 EVK. For booting, the only one needed is
CONFIG_PINCTRL_IMX_SCMI for the scmi_iomuxc pinctrl driver. Regarding
the other configs, they enable Ethernet and PCIe for now. All configs
are on imx95.dtsi.

I will prepare a v2 rephrasing the commit message.

Best Regards,
João Paulo Gonçalves

