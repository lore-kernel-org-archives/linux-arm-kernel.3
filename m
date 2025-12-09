Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18858D3B996
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmsjjjpgLpXOwUIyAxU+dtO80cjSC8pQXKZr/Zixu6U=; b=ZDMWghK9bKYh+xQUvBGMV2/oOJ
	Ut4BaS8xJoe6o58J1mTsNHCWbGUbzwFMh6XPgC7rB75G8+N6V2QendzC7y2MWy4+LCdVYqDF/whYN
	Ga9BnVkVX9ViJpfbNNWajG+tCvcrynqQKiQ70FfHPR8YlnVaH6CsK5BHmIxousiErIEjZYFBU35Ec
	e+j4eBAF7DI7Z3EtUd2AjT7zSkpEUvrG5vnNNMXA7bWa3xMqosHiwykOJzR8VoS6HBP7LycEE1HHx
	D46fT060p8JjHTY45eUJmgrVMDvZ0hYQDMf3etrxlEomangW+10Amwz3FPRdELKTfOY7vDWXQU1/T
	gofruzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4Wf-0000000Ejum-0j5B;
	Tue, 09 Dec 2025 20:41:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4Wd-0000000Ejue-0yVq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:41:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23C2D60051;
	Tue,  9 Dec 2025 20:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AC8C4CEF5;
	Tue,  9 Dec 2025 20:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765312893;
	bh=6UgeHwLWxOpoVYgukx4GdIpLT8XqFIfNQirBTLCXB3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQ0d2tfijNqsU6nLz8VQlelwZ6vOzxxmQnZmKaKoooZqEqXwW7/FhYeVdiwBV1wcg
	 X3UvjtfnjUtZ1cC3KFTuVO6laMAzTENlCzL9XJXfaV7d7pQG6fXrvFuypCu76HnpjE
	 ZBwJZURHFR6ml2mbHeW4tKY+UiNZm6jdjg2jGJepVAqdU8xbGYjeDma8Gv0baamz2T
	 BEHm80uPvonOdqC3sN4LKJuQm97RnoYqOiF5jYjL1JDmvmiF9qR4mGy6//2BcnrQop
	 3EcmrS0WgO+M/UsWZd85UizxcPAnHevgAr/m9S3m3p0bJt0R2Rc1O00CWY5/aRv/Zx
	 LD3M8IQBXtjWw==
Date: Tue, 9 Dec 2025 14:41:30 -0600
From: Rob Herring <robh@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, taoren@meta.com
Subject: Re: [PATCH net-next v5 1/4] dt-bindings: net: ftgmac100: Add delay
 properties for AST2600
Message-ID: <20251209204130.GA1056291-robh@kernel.org>
References: <20251205-rgmii_delay_2600-v5-0-bd2820ad3da7@aspeedtech.com>
 <20251205-rgmii_delay_2600-v5-1-bd2820ad3da7@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-rgmii_delay_2600-v5-1-bd2820ad3da7@aspeedtech.com>
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

On Fri, Dec 05, 2025 at 05:53:15PM +0800, Jacky Chou wrote:
> The AST2600 contains two dies, each with its own MAC, and these MACs
> require different delay configurations.
> Previously, these delay values were configured during the bootloader
> stage rather than in the driver. This change introduces the use of the
> standard properties defined in ethernet-controller.yaml to configure
> the delay values directly in the driver.
> 
> Each Aspeed platform has its own delay step value. And for Aspeed platform,
> the total steps of RGMII delay configuraion is 32 steps, so the total delay
> is delay-step-ps * 32.
> Default delay values are declared so that tx-internal-delay-ps and
> rx-internal-delay-ps become optional. If these properties are not present,
> the driver will use the default values instead.
> Add conditional schema constraints for Aspeed AST2600 MAC controllers:
> - For MAC0/1, per delay step for rgmii is 45 ps
> - For MAC2/3, per delay step for rgmii is 250 ps
> - Both require the "aspeed,scu" and "aspeed,rgmii-delay-ps" properties.
> Other compatible values remain unrestricted.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  .../devicetree/bindings/net/faraday,ftgmac100.yaml | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> index d14410018bcf..00f7a0e56106 100644
> --- a/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> +++ b/Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml
> @@ -69,6 +69,30 @@ properties:
>    mdio:
>      $ref: /schemas/net/mdio.yaml#
>  
> +  aspeed,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the SCU (System Control Unit) syscon node for Aspeed platform.
> +      This reference is used by the MAC controller to configure the RGMII delays.
> +
> +  rx-internal-delay-ps:
> +    description:
> +      RGMII Receive Clock Delay defined in pico seconds. There are 32
> +      steps of RGMII delay for Aspeed platform. Each Aspeed platform has its
> +      own delay step value, it is fixed by hardware design. Total delay is
> +      calculated by delay-step * 32. A value of 0 ps will disable any
> +      delay. The Default is no delay.
> +    default: 0
> +
> +  tx-internal-delay-ps:
> +    description:
> +      RGMII Transmit Clock Delay defined in pico seconds. There are 32
> +      steps of RGMII delay for Aspeed platform. Each Aspeed platform has its
> +      own delay step value, it is fixed by hardware design. Total delay is
> +      calculated by delay-step * 32. A value of 0 ps will disable any
> +      delay. The Default is no delay.
> +    default: 0
> +
>  required:
>    - compatible
>    - reg
> @@ -85,6 +109,9 @@ allOf:
>      then:
>        properties:
>          resets: true
> +        aspeed,scu: true
> +        rx-internal-delay-ps: true
> +        tx-internal-delay-ps: true

There is no need for these (including the 'resets'). Really, the 'if' 
should be negated with a 'not' and this part dropped.

>      else:
>        properties:
>          resets: false

But you need false entries here since these 3 properties are just for 
ast2600.

Rob

