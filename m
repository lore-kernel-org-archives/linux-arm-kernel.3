Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC3CCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Y4Hmeaj9zYXIvPRM6itRd7hBEHF7uK4IZavdf0P3hE=; b=0AVLvh2mVfAzavqL9H6N7XYsPh
	N49GGFaap8YEjUCu8e797z191KwFTnkpWtSLqo4xpa3zrULiE0nMFNVJp29P2N8e2fiC1sCEPO9Xp
	LfP//GqYsnHALA/nWYBbhHpiORlz7X/y42cAwMAnHrOFxoyGcyKbbivb9YhIqwshM8pfs59DK/130
	25s5VwFT5F0NgqDfK028oztfrT5yb+iepRnwmo9bZL8wjhuxEJVSooKFJMh0iOwk4vujEy2mc+/DW
	p5sNXm6qid0/748zDeEtHbb55kCNDFp0f7sW4JyWXruhE+rxz5YZ5n315OTKTtCPaKGcfJsxMN4/s
	tIX4u5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYmR-00000002B8m-1lmr;
	Tue, 02 Sep 2025 21:43:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utT3J-00000000ht2-2eTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 15:36:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b042eb09948so330106766b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756827368; x=1757432168; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y4Hmeaj9zYXIvPRM6itRd7hBEHF7uK4IZavdf0P3hE=;
        b=DsJM/hNm0nAJIqVD/rJZaTcvhNqiiPZCGLGUNg34XUD1irvY1J+uk0kBgS+fsiJmmC
         ftrfsz2AAK2CTq1+RfYssbeSz7nidctmrZc8PCHdnfg5JWTAPHgbAlmbv0LbNFSr1eim
         Cn2Npf6feKpUm3cIj0tGOCtxG3pyh1xvREuFUJmxRSGLvvfqcXZ7oIhz7HbsEh/4hL7x
         yrXBQbMrS9lg3mYEmEBW3YpUoefUqKO8OiU9B/fgv5CFPqQtNL9VTnkkPB4MbN6CfzwT
         yeLZ1yd09bRGVhh/qsASWC6VflRdeXkaUIK50XyZLs8IF7Y8C6HlMggCbzRv1PFHNYnM
         4qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827368; x=1757432168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Y4Hmeaj9zYXIvPRM6itRd7hBEHF7uK4IZavdf0P3hE=;
        b=ozfzLMPTugn0AUIANReeo0kL/1wBnyqLPtcErNmQ/Tq5XLkVKSS6vtOmSXvcz2+Qaw
         idG6JuRAubRgUWADkywpEbpwZxvzdpQX/D1IayQAHiakTkAWjVJWwSgnfCY/q4eMG9xT
         mjmIKFdpQ4FqYgut6Z5sivx6V8VrJJwU6YbI4XsCdkGHO2ZVlZdg8zbAIGBoxMUgJk8i
         7bi76OsCW4mIiXXBSzNXBo5KNbu+sCLSBGnT38z7dLwshX8wCXFdAITkjK5L9pNttwul
         DSsEUZ4Nocu6p8j5rupz/1SAssVUYks8hp97SI25alIi056KGM2d5PIi/g6C3uPBJ0Bm
         vrTg==
X-Forwarded-Encrypted: i=1; AJvYcCWr86PdYOjic9iMYJt57zlvBomYYnzmJE2venKmgxC66qyM4BKPfDdWshhYsN6uBmRjmIPPmz8SypgH6HZuPe0Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxGjQn4+Os0zQNmjfANz9TJdB4/Axu2kwR+OhrBfMCr3nwbLBP2
	RA6aOHNcQfK0TRg+BuaWyWmZaz7Pin9t9wvUcFATTs55x3b2MqwQNAwmxcLSf6pZfWufyVzsh6F
	n1FG5pIMB95IJGYMUUVowttDnmxrnWiI=
X-Gm-Gg: ASbGnctGQop7PchswOu8zkcW8B2Gcx57tLti6Rw6DFuPl0KB6fIrkB+1eTkvRzHk5gK
	Wpfxhwwd1l/Jz1hYtKFoKirn90hNDcLcy0drxvHkPN6BUie3UrgEE/DNh1pbSiJp+yI0HggcPBZ
	sX3hfJ/43vMe1zrAonP2/a0Zk5hTB90Diqj7IQGNPG4JMA/h9J6rXDV1+cSeoB/IKFwPSP7yrzA
	9N00t+1HmgZU/3hDR67bLUIq6WhVrmERpFmTtzv
X-Google-Smtp-Source: AGHT+IGvRWgNdy0fihhRjw06pq2Hs9JGdwVs/5subwnKQbYsRHg2GMq+oZlBiYJwTVV3dKdKs8PeQUmCZrUBILuRg+I=
X-Received: by 2002:a17:907:6090:b0:b04:2cc2:e495 with SMTP id
 a640c23a62f3a-b042cc31af3mr770379366b.14.1756827367715; Tue, 02 Sep 2025
 08:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org> <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:35:40 +0100
X-Gm-Features: Ac12FXxX3Y3vXxhmR1yHN5IR8o_v2hNrvGyoSHzsymFzxbirriBpH1NCmvMkVvk
Message-ID: <CA+V-a8s2H4UzovMqYJ15nWu1X55dL+7qJWifHxMEkqjtTzigzg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] dt-bindings: net: renesas,rzn1-gmac:
 Constrain interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_083609_675601_80037975 
X-CRM114-Status: GOOD (  15.96  )
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

Thank you for the patch.

On Tue, Sep 2, 2025 at 10:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Renesas RZN1 GMAC uses exactly one interrupt in in-kernel DTS and common
commit message needs updating as we are describing 3 interrupts.

> snps,dwmac.yaml binding is flexible, so define precise constrain for
> this device.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml=
 b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> index d9a8d586e260..16dd7a2631ab 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> @@ -30,6 +30,15 @@ properties:
>        - const: renesas,rzn1-gmac
>        - const: snps,dwmac
>
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +      - const: eth_lpi
> +

Changes LGTM,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>    pcs-handle:
>      description:
>        phandle pointing to a PCS sub-node compatible with
> --
> 2.48.1
>
>

