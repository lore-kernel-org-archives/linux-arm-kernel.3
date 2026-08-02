Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6364EC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 09:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcowD4hPnaFHV6viQpEqJbkWL7F/EROyiT8dzgigGfM=; b=xSDYeXyIKLTy/ktG4zSizJb/nq
	Da3AO5snxO1yKcnIjlg/INoWyFkGPX6ZfnuYJMWfqJJwr9iR0JBDOg2n1oyzmHUq/a5R7nKn3K6+E
	C4hKp3mEd7xDInr2LYUPS1zqeMRpZQDeCGc4hL+83uiq1oFPRItDGn1kI7n+Z9sHrfAPPNJp1Jvor
	cQFn3LsmQN6kFW7fDSPkoc3niDuQX2pzJEXaDOIZwsUEQRDvppWjLK0YhYylCIwLsN/anqd3iknca
	EZxBxQFIM2FfQsbtqqqaIZdNP2ChaV2Gd9GBv2xu5lE/p7GHVc0CEyDA8K/z2zf+udIHNNMqNf7dQ
	tRxdyLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSAG-0000000FVMY-2gEb;
	Sun, 02 Aug 2026 09:07:24 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqSAD-0000000FVMC-3qvu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 09:07:23 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 695B51400143;
	Sun,  2 Aug 2026 05:07:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 02 Aug 2026 05:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785661640; x=1785748040; bh=GcowD4hPna
	FHV6viQpEqJbkWL7F/EROyiT8dzgigGfM=; b=U45ZRKdZUacgCfJeuXq+8XIfwg
	FkIe3LnHpKEl5LZJzKpkZTEgYvJADxrQbnUIvbEwJyCCQupTT7g1AudaCAvgZtp/
	RjF9+arRNJ48T5pSgAIuDBfzh+zJJtnGAt1iG+LI4uZcLJduk00/VvCLXj1y3xHV
	gHhEI8jFKw+kT4tctCg2ELCF0l9d/Avz7YJBnhQaL9njlSlzrH7Iug/RbFmlcbMm
	SDlGlTNWsXZYvQOrkGNn+GoiPYMEp9VlNc8Bzb7xGKdwJUC+RqQwkH0IYRQRbkE2
	Te2wKs6uO697k2wbzywGcnp7ABhMNLYghb4fjPYXfqoOx/TCuwzI45B9Dwlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785661640; x=1785748040; bh=GcowD4hPnaFHV6viQpEqJbkWL7F/EROyiT8
	dzgigGfM=; b=iaYYdgdbc8hho4RDdf68ER6YQuxvEMU+b7dGVXkT9FVnk+yYfq4
	qG1KtjuFg5G3rczAV6kXJR/rgTMgjt0O4q1d+lCgaAKkFXgfmPgg2IMX1YXfrAti
	FF7VWQqdR5R9t+FPL8YDgBAS+Bp24T388klJ9ryT/KB9zfXRgut0FvbEQKZxRbvd
	wChNh+5sJWSy43jyHOdcRhY6W6zd3V7kufYjHYRDBXDV9n1ZkzgSFAM9KYGGnWH1
	2sa1fdelusbFhAlfYi4v30FI4M0Ll67c92XII7dUtuPj+gJMzHe+3KeDZvoKy5aJ
	KmQuCb8B2QowbuP5Wn6Nk9UOwmI9nAFfRZA==
X-ME-Sender: <xms:yAhvavzFCbnwRH47grekZXx3M80xjHwUS2f7ceA3O8S_mjzElsA1qg>
    <xme:yAhvajEfi1o6NOMMub6v71PdXbVSMiJGDsQYYdGUSroH4bF4I7SSBTgp87fwSbgU0
    _yjrBDh5Axng75fouGr_XeWBra9Us4BX1tGixBh30r2aBOOfNBSyb1U>
X-ME-Received: <xmr:yAhvakuHv5JBVcUcW7EpRX-j8oelL8B5iZraeS1zagRG1EKa00DOUcOR5gYuC3M7jGpQYvHwxXavZ43kBb9q0oSXbwGzB0lwXO4>
X-ME-Proxy-Cause: dmFkZTEtazb3aefcffG10LA8PvMPA8OYtMmfWjpIL55fBjfd9AI95fb06+KDp5LodwwKTa
    JPvvjV0gUCD7/zA2r57MQ/BJw8SCZtTm5v+4VIwFpWnYvam2fq3cTt08REowgdxfh7rF3s
    VEphO0c6UxRqSZepVtejjjSkCN9sKq2+9ZuSJBL3UYvaCGrAM/lrjjkRbtfjqShy8h2Fri
    YcIQenOsldMbNDI/gnvMnwByKKzfL1ldbQFa9u8fJghDFWRJZszVcpQNJt7BgBPuUwOmFs
    BilQLr70C8SPZH1vvDkfwZY369BotsIrtohR0HJdUnOylvl26JOeljIMdfkXrTXTluBdDm
    mvoIqoTrzoLZ9ro/RwQhiJFXDbhaTYoJ15tHxiI6BaotM/COL/qA5k+Zy6qE32ZXOM8y3A
    hVcCm9gORpMU159ZDU63ZUIPc01jnAPJOfL0qta4AYgMvbw7aFvJvW466LRYqGQY6n5jS/
    xambnA9eMiJQ9M7Xer7dGN8ivfsZWzgsJz1aF4WmT0Jou4G6Wpb5mU/bLAAq1D0P3Hm9zO
    nfMrVdvUxOIGaFHc/feZDhYubM9ETHYEKzxRApkBzhAfbHzvsAPfcEklD9EZ5zvtp1TOeE
    V4pEeGkAjiGf32VBFMhL5XFreaAAWsKwRCWL3sXUL8FMuYKpLVWpw5zDPnaA
X-ME-Proxy: <xmx:yAhvajA67ISfiPShw4ZqH6oZvH5brpyEvRoR1cReTSoIjNMkkIg7dQ>
    <xmx:yAhvavB8pl8k_EnC_ieSqQqJvqGoEuxrrd8hUG4gV9YD0xVrqNfKtw>
    <xmx:yAhvatqjYcYtyYrOuHc3MKU5-ZZLECogejx28JgAw3kfKMMVcUshMA>
    <xmx:yAhvaqGtWRMhPvec5bjrutgo3-kEngXxBxEvo63EpEG92a07DeXoSw>
    <xmx:yAhvahc9ngYaMtqECeuIW5VkzET0QgVu5qbqgBNIR01peIrlA9XFkgoQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 05:07:19 -0400 (EDT)
Date: Sun, 2 Aug 2026 11:07:18 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: spmi: apple,spmi: Add t603x
Message-ID: <20260802090718.GC806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_020722_042582_328BA336 
X-CRM114-Status: GOOD (  15.30  )
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

On Tue, Jul 28, 2026 at 11:28:07AM +0200, Sasha Finkelstein wrote:
> Add t603x compatibles, interrupt support, and support for SPMI
> controllers that are not always-on.
> 
> Keeping the "interrupt-controller" property as optional, as taking the
> j514c as an example, we only need this functionality on 3 out of 10
> SPMI controllers present on this SoC.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..9fc511bb0cb8 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,6 +20,8 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
>            - const: apple,t8103-spmi

Please add "apple,t8122-spmi" as well

> @@ -34,6 +36,18 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  interrupts:
> +    maxItems: 1
> +    description: Optional, operates in polled mode if not present
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

