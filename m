Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4C1CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELdBCMU5f7/O4ZMIta9o4UVKjIIZnw/X5SSJeT3GM90=; b=pZBo9zcXAHGGq9s6AZbDNt6uTR
	ByoMx6a7ETec9xazr0yZWMT5CNJL7SAl0IMY9NIzDas5izti25yC3KyUiho0XRPT4eevqJNGK9D7P
	00jYObM4kqH9jW+UlveiNGi7D/LYMPIQK3aGHi1LiNJjOnDVgM1uNHSpv5O7kWcIiTPqLefepqC+C
	O93+yziQELUDQPAD/5ufv5qAygxiZ/0/zLtG8L3lHIiyW7K6LpvNKSLh3PNHKLLuIsl/UGqUPXNnO
	dQWDf6b0RfV/Ajqs4HP+zEuKBbEkFgAS7k8MPr/IDHqNJelSdv1VSDfmcN7tslUMBwxVwdUYrc0nx
	IXLN122w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBH2-000000080Cu-2XeN;
	Thu, 01 Oct 2026 07:32:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBH1-000000080CR-0UMB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD1F943684
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815801F0089F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839930;
	bh=ELdBCMU5f7/O4ZMIta9o4UVKjIIZnw/X5SSJeT3GM90=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=m9ED6XoyFU6f6NSxPdVX7ZgGtbARjsD/CvfZD8tuhOkiZ6dKnPRKSRSktb3gLidmc
	 VPbCeYi2IKHwWOv9a94mqT6hb1QyGGIuQBER4nXjiOTZRozsX037c2spwbLmYAMdft
	 hSocy81uy0QFI/ZtDOvX28+07QuujnXHssLX3bpIUqE7ULrFoS3pV03E333y7RCNzK
	 HsH5YwqLVDE8Ag8eULAvrQkln7YBVbnRdOZn5XnVa80W1ViRxENJZnXfTYVrjFagcy
	 G3vUUO2AFJbwfAf2/N1XRAUG8lpRgJF09f4ryfCh5u+wg5DjSHuu95Tq7PJHOpKRZi
	 qrKAsvE+hguKQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42966d5fso788309e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:32:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx1MZUhRhiqIJebk5E3H8UxxWxNXpGxYqiJX3++UjLWqZtU4n5ajx8sG9fYOC8NlCBeWwVoe5KOsvUggLbprkWu@lists.infradead.org
X-Gm-Message-State: AFq9FYLgXAV004/bkAHhI0F7BBlUSwi1vDWE4qQPMRy+hg8sBAjbhQdg
	vidwH9IPyhoz+Wrd3UJij23M5D7JqGOmELTiUzBTofXJ6sAEXIaHMQksxBhyruUwms3gqWreFrN
	+ZKuluaj5edgWVgmZyrN8hoaAkBkXtttrPu0/evt51g==
X-Received: by 2002:ac2:42d0:0:b0:5b8:f97f:7a22 with SMTP id
 2adb3069b0e04-5ba405ec7a1mr1161789e87.54.1790839929167; Thu, 01 Oct 2026
 00:32:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:32:07 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:32:07 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260930163334.60b4a88c@kernel.org>
MIME-Version: 1.0
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
 <20260923-qcom-sa8255p-emac-v15-1-e82f33720737@oss.qualcomm.com> <20260930163334.60b4a88c@kernel.org>
Date: Thu, 1 Oct 2026 10:32:07 +0300
X-Gmail-Original-Message-ID: <CAMRc=MeUx2iHf8-d9yjZZ=n7VaG_GROvO2dW-bxavAS+XbGMFg@mail.gmail.com>
X-Gm-Features: AclHuK8P_ZwjJ__3SNp9LNTCdpGSDaQAP4RQWoM4JsBj1lq1vbQDeX8sSTrNEMU
Message-ID: <CAMRc=MeUx2iHf8-d9yjZZ=n7VaG_GROvO2dW-bxavAS+XbGMFg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 1/9] net: phy: aquantia: fix system interface
 type not updated in forced mode
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 1 Oct 2026 01:33:34 +0200, Jakub Kicinski <kuba@kernel.org> said:
> On Wed, 23 Sep 2026 17:14:35 +0200 Bartosz Golaszewski wrote:
>> aqr_gen1_read_status() decodes the MDIO_PHYXS_VEND_IF_STATUS register
>> to determine which SerDes interface the PHY is currently using on its
>> system side and stores the result in phydev->interface. phylink relies
>> on this value to configure the MAC.
>>
>> The autoneg == AUTONEG_DISABLE check is not correct:
>> MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
>> negotiated link speed, not based on whether autoneg was used to reach
>> it. When the link comes up at 1G in forced mode, the register correctly
>> reads SGMII, but the early return prevents phydev->interface from being
>> updated. It stays at whatever value it held before (typically 2500BASE-X
>> from the initial autoneg run), so phylink configures the MAC for the
>> wrong interface and the link cannot come up.
>>
>> Remove the autoneg guard so that the system interface type is always
>> decoded when the link is up.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 110a2432c520 ("net: phy: aquantia: add downshift support")
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Sounds like a real regression, is it? Should we ship it to Linus
> tomorrow so that it makes 7.3? stable + next does not compute for me
>

Yes, this is independent from the rest of the series and a small fix. It sounds
good to send it upstream ASAP.

Bart

