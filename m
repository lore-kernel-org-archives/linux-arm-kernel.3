Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA79C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=; b=LJWLAJ2KzChX0hq8yFBnwAHq6M
	SxVIZQ4A3Mg0zQegYc+2cuKcFvJWXJhNXd/ID6A77s9oey9GdnyR+5L1rZbboSI2fMllPt+ZA2oU4
	Dw54QtPE+Rj0RegpfWlGa94tgk6ST/WnN5oG3e44eVtvBm8XnO4WLaQPeTShO4qw4ZmKSUjDkE1YJ
	vsI9v3QLK0ep7Wl3WDYSC8S6Xxwt8Ob7EhRnU40ovX4SMg3xy+nee2PAavavvhVWyFkd1tNkQlgzm
	NRwVA6fZ5G7f+0vkVoa3QfbJnkQMPFwgyl42yTgX4YSh4Aws9397fKyFx3ONS7gT4sCjh9kDU+siS
	vRfPnXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCUa-0000000EoTI-1HCZ;
	Mon, 29 Jun 2026 13:57:44 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCUX-0000000EoR0-3jSQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 13:57:42 +0000
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e5b048375so43627085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 06:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741461; x=1783346261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDPhNjOsxEQ0DHLYZPQfDHuBKCTUhxYTzus1J/5tEMc=;
        b=tBlcUb1y6seZH78zz3q8dY/LRlr0MeeL1osTTBMXbtEjw2KtRSPyRkBsAXO4wLQHR5
         +8/xoCUu4y/R5JNW5MLsAx1H8vOn2x09JkHLRZnKEnYkJlGpKqZETbbVv9kOWZ/87jBb
         xyjB8gZI/F9sYcrvKRKHB9jkkb2BVPQKDJYVRVqU/Ra9HxU9E+mcb68QXQgVOS0l0xzO
         Q1nuOHlPis+9Ez1WU9QOC31ZZqIqmbnBDCpJIcPC2Y5XekdentdHyMj+ENb1e2ux4mU9
         a8J/dluzFEQ2VnBXquwmVXfG1JlaS8qeX7VY9MtajPsy4b4o4EnOuMrLlM75fcr9hqiR
         dkJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XL0UWT7scAPguLWRshI3vuaUlBnx7OssOma9gPfc6upIR2hNIe4uiOzQU5mDfxXSKqJ7hp/SYRUSBFId0sBYZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzJMtWQdTVvrtRUPB3KqIQZ9Bxr8DwGBviX5YWT/gbisggotCJ4
	0z5O/DOhQQD6rmWEndPe9owV1zIWXcYK490kt1IM0jzoMjwkRPHOQIZiEh2Zl4Q3
X-Gm-Gg: AfdE7ck2F4E4qN5nwVJ8NsumWPlzVAWLQIKWB55JPL36WcMWndabtuOmoEvW//1r2HY
	bGy+DmjxXOm+KdiTz8QfuRscAXO5saW7RqQz96OcFcc0h4xke1hgZ5GqluydqCSOkN65Dz1IJ3e
	RJACvFnvc+Js32m+xcWlu//r/uLB4l8ynn3cPoo9+6/IFQpy6GSUsZFeE+qB1EdaA6STbVlm0f+
	1sxAIIxPbyo6L8dPpW98ngG8TkZS2ilLVXVeuVhzCl2qSJu+OtA1ZeHayje89aOtr8/g2yIN2A3
	U7DO1Kq+Zw2BjGlxT6luq+LVzwIm9fKroTVsv63BMr49QmAlplaeFXBHf6RPn8C4Smhqgu5msyn
	BIXtGvijlUZjKHVk7ARXOPYCAbL+/SYUoZin7NBaKeVjkKiD6DLJHRl6n/8i9v7K4k4AVDFy2Ad
	gbRiaUVlZmFd8ad2cSnzspRfYNfNeyRJaBOjLM8/5hjN72ja5nKgh4AinT1j6fsJax
X-Received: by 2002:a05:620a:3711:b0:92b:67e6:4b6a with SMTP id af79cd13be357-92e5f3e7c8dmr144529185a.65.1782741460471;
        Mon, 29 Jun 2026 06:57:40 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-925fe040904sm2094373985a.20.2026.06.29.06.57.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 06:57:40 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9159951f05aso427961985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 06:57:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/WrwbyYcZjTzqRIrqL1dKZvcsau9SDuCl4IrAgZK9oVgjMgibNjI6MjtpW9t4QWr8jEJ7webdU8B32uWv4UhvT@lists.infradead.org
X-Received: by 2002:a05:6102:c93:b0:739:86da:7777 with SMTP id
 ada2fe7eead31-739fa951f6emr430364137.27.1782741103904; Mon, 29 Jun 2026
 06:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com> <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 15:51:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
X-Gm-Features: AVVi8CdHRRLXddfc63bNJYLQ9RF__6zMi6ngPMxYGYM87lHlKy_8kZoakyQBXrY
Message-ID: <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065741_931809_DDB004AB 
X-CRM114-Status: GOOD (  21.85  )
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

Hi Bartosz,

Thanks for your patch!

On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> This is essentially the same hardware as sa8775p rev3 but the PHY is
> managed by firmware over SCMI.

So why can't it be reuse the DT bindings, and be compatible with
qcom,sa8775p-dwmac-sgmii-phy?

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml

> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    items:
> +      - const: serdes

> +examples:
> +  - |
> +    phy@8901000 {
> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +        reg = <0x08901000 0xe10>;
> +        #phy-cells = <0>;
> +        power-domains = <&scmi7_dvfs 0>;
> +        power-domain-names = "serdes";

Ah, this uses power-domains, while the existing bindings for
qcom,sa8775p-dwmac-sgmii-phy use a clock.
I guess the clock is the correct hardware description?

Adding to my list of examples for backing a hardware-to-SCMI remapping
driver...

> +    };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

