Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CFAD0BB6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBDIRlgEWMqLGleeM/QQfDMSxlWmf6SVjTQl09t1VHc=; b=gRrN0eQeKB5Xix9v4exbgm2G5k
	RfJ6wWv+FsY1PFhn7skx6XwsOhOcjD8wwvJG0wmUCVib2hLlaJ9sMyx0dHh/aCfIed9XCRkUEx+2k
	C5YINUXNw4ZOjGHYNgqejPRWLXdhV36jzvfbAu2qT0BtVnYCHBDd2nhyv8AKxwDsDZVJnKdFvqHF1
	wPDMf7dOr0yhUdYQ8EjkKOqxsayy9+Llz4v5N8yC2H/v1mhQTlN8aR5IcduVm/zADUEllm6/n+zqW
	TM1xYgwBSNlW3fWQta0h2gu8nNsavvT/ZVvcf/5Oah4FSPZSMqcOLF664vj0XblRzXCRs2eTO1Wof
	mAZ84tBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sQP-0000000H7mc-30Rb;
	Thu, 24 Oct 2024 07:38:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sOq-0000000H7d9-0OTv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7C66FA4519D;
	Thu, 24 Oct 2024 07:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB2DC4CECC;
	Thu, 24 Oct 2024 07:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755410;
	bh=QY6Un/nev6q0K4IVTPVcnizClruEWQyqCjq/Y1/z2B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNBU8c/WiyeL9WVczfmjAYJCL9CTE6jQVDPAs3/nHx0zD6vcK/RwDw1i31n9VrYxa
	 ufUmqBC9TO61KirSfykPfJ0yxhLQzuv6gpy70yBpWmaoexZO/7c/N7/YSgQ4pm9b/b
	 txeylAYt2kRYEZuXhIyVOYhC+cGoAQXMjtMHjUraoAetc8NpoWK1hLRB/PzWx2GWQL
	 DJ1CkWyb2UJc6lErdUUBCfl7RBBfAku3/iYOZ01bgRXyWZKFh6RLhDuWClWzx47tXt
	 e5KVHr3vtfoGOZH5Rm82iIkMJzGREHFPe7vu1QKL+sKZPEIxrpB8aIiEG2pIS1gQO/
	 U9hVOUdIhIxqg==
Date: Thu, 24 Oct 2024 09:36:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	horatiu.vultur@microchip.com, jensemil.schulzostergaard@microchip.com, 
	Parthiban.Veerasooran@microchip.com, Raju.Lakkaraju@microchip.com, UNGLinuxDriver@microchip.com, 
	Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, jacob.e.keller@intel.com, 
	ast@fiberby.net, maxime.chevallier@bootlin.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 13/15] dt-bindings: net: add compatible
 strings for lan969x targets
Message-ID: <t63jnh4ncssaajq6ef4pnhsmn7jjp7cstw6q5gay5hxzfjjvrh@xuepiohildao>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
 <20241024-sparx5-lan969x-switch-driver-2-v2-13-a0b5fae88a0f@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-13-a0b5fae88a0f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_003652_399940_2DA827D5 
X-CRM114-Status: GOOD (  17.15  )
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

On Thu, Oct 24, 2024 at 12:01:32AM +0200, Daniel Machon wrote:
> Add compatible strings for the twelve different lan969x targets that we
> support. Either a sparx5-switch or lan9691-switch compatible string
> provided on their own, or any lan969x-switch compatible string with a
> fallback to lan9691-switch.
> 
> Also, add myself as a maintainer.
> 
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  .../bindings/net/microchip,sparx5-switch.yaml        | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> index fcafef8d5a33..dedfad526666 100644
> --- a/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> +++ b/Documentation/devicetree/bindings/net/microchip,sparx5-switch.yaml
> @@ -9,6 +9,7 @@ title: Microchip Sparx5 Ethernet switch controller
>  maintainers:
>    - Steen Hegelund <steen.hegelund@microchip.com>
>    - Lars Povlsen <lars.povlsen@microchip.com>
> +  - Daniel Machon <daniel.machon@microchip.com>
>  
>  description: |
>    The SparX-5 Enterprise Ethernet switch family provides a rich set of
> @@ -34,7 +35,24 @@ properties:
>      pattern: "^switch@[0-9a-f]+$"
>  
>    compatible:
> -    const: microchip,sparx5-switch
> +    oneOf:
> +      - enum:
> +          - microchip,lan9691-switch
> +          - microchip,sparx5-switch
> +      - items:
> +          - enum:
> +              - microchip,lan969c-switch
> +              - microchip,lan969b-switch
> +              - microchip,lan969a-switch
> +              - microchip,lan9699-switch
> +              - microchip,lan9698-switch
> +              - microchip,lan9697-switch
> +              - microchip,lan9696-switch
> +              - microchip,lan9695-switch
> +              - microchip,lan9694-switch
> +              - microchip,lan9693-switch
> +              - microchip,lan9692-switch

Usual order is increasing, not descreasing. It's fine to keep different
style than usual, but then just keep it in mind and enforce on any
future changes (because I will not remember the exception here and I
will always ask for increasing alphanumerical order).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


