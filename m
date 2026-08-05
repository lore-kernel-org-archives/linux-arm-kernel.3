Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B50AC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MQvhAxG1fSqcnM9RTDK76h0pQKuMYfzXFqMmTxpBQY=; b=lRFBJ2iMlQEiiZi4Q/lwkwo52M
	4ODwsYiUG4uW3mnw4KLr3JVuAwEyufVftbthpSA0mPRExRnZa1moEBV/yDtezt1+ReHVxKBiO+ach
	VqnB36gZDbYfVFprE3ZML9CviKvneX/Jb0O0m1gN7jDw79ikIVvrURrLck2vb8hNT9ios2INXvR6O
	ek/dNt2uHL4eUxHUY3FAqa+e5G6Igd/Io7jggQSVg3SK9jhb5jko5LbKj4Outfb8Cp/eRBiqa19Bh
	eIoRakHYN1DvdVJ12YD7pcLmBQHGQ2TRQX71zzm6FtnIDbQAU3RrqBYQjB8bMMNRh37sS/DHZrwo9
	dgixk/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraJ6-00000003rB9-3zMZ;
	Wed, 05 Aug 2026 12:01:12 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wraJ4-00000003rAE-1eUM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:01:11 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B54BA7A01A0;
	Wed,  5 Aug 2026 08:01:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 08:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785931266; x=1786017666; bh=5MQvhAxG1f
	SqcnM9RTDK76h0pQKuMYfzXFqMmTxpBQY=; b=E05HXm/YNHxLxIVexe1UoQQiJq
	Vev6NqOk6cx8ELleiIa4AF10i3E4qQlgJqGi1vidsosYMWDyFSx0neaY69g3XTD2
	RgSaPgWNi4jGF6dtGCG2CxVYhUe1im30CCKOzU/OgnMG1wY/nuzqzoJC0oupnJO9
	DtmKTUV+gflbtP6px+n4tR/FoUXqA8kSVBUK5k7YE5bohYsgBO/H9YkPsOuBRJei
	RmVlcxQpvIc/OPK0HuGb7ZIG9+y9+xZFjgsFepvRB+e5bae5Fn6Q4l3iYAF9o3Av
	7uNFHpSmaB5IZ6sVZiL5YueOzwV7/CNbUlspJFXxoXp8EPlJNG9pgeOXoNdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785931266; x=1786017666; bh=5MQvhAxG1fSqcnM9RTDK76h0pQKuMYfzXFq
	MmTxpBQY=; b=dWNJGggvtpT6iwE9Wy99ofxXiQ0ZPCqfU1pmIBocydxVH8vWj7n
	yFzat6WEpTk0VG2cQDA9yeFpECLdYXHjcR+HEsWERyL+e1Gw5YzKjvoFqxL3oGHj
	3iUl9IG0nZlts00H/CA77KPSROU5QMEdbdZTTkmgPNsgBuMq6gexAmOf2VKLYIn0
	0NS1w498BLl898kENaL2miJ51JUC33F1zUyfhsWSZQEsWosdyufnLIq7kcSZGowF
	cC4O0C5O5wyVahIvwLeZsyA6gQqX+5NMJ8oowENK5F/j9vow1vmaZIHXVnbFKRHW
	8S/Tur97yMnUeBIUj9e7vcWmwdDms5qe1KQ==
X-ME-Sender: <xms:AiZzakej4iVR_nfvt5VsJU2HcuuuJtH4icAlPmEWY2TRzyhzjFTrtw>
    <xme:AiZzaiC61pQzLghBDtFJW_51QgnWrsFwASYGSIeSfal-WebGBdJin4JIJMQKFwtSn
    KKlUmrdjk-LaOpac2AyNA1-WfMMdpT4XimLMj_7E_ygtLZAWUNbItGm>
X-ME-Received: <xmr:AiZzag45d2i93tI3K-ZGU9tdCKnaVJk-th0xrRbDnz9kID2ijW-iQWKSbwSiEinD3eexR66mifvWtNyGcioPKYzHdd9TQ-Wk1no>
X-ME-Proxy-Cause: dmFkZTGSCvmqUN+IsE2KmJvj1RxF6z1AYhEl2XfIj+8NagU6Bp39Fg2oB1JUJr5PsRTwMG
    jMoUWmja4vcJNXCkHN/usghvo9RfTDMVopb/p+XwpiiIbJzL9YaybGpF5/s8LJqKnr8X9g
    0LgK+re00njxntKPTOBM3LyrriqCYY+ujVnzOHPn3S9QZFTnpWkkvj7XNIOMqFxO73BGra
    9wh4KjOS/ek9lZ6U2EWXnMsFZmWWnUDiZutB9I/qvrTxfjnUpSH8S8PcRiy1qOrlFrJxf2
    w4aUKn/G1aciprGW4ig6hL2ugn9/XKvg/+auuXK7VrLBrs+g8r+c3DcWLWwwRJKJsRrgew
    is8NhOE46SyzV1kbXf+5YVFQkXxNrwp92Z0ZoRaTg7GgFF2ruWXH/N15HH+IqERBsAfqWX
    1978LDNTsMzPaiXmwdM6nFejs8I2Ay2OKNo1yio6evgjPi9U1SJ2HJsxU0+rq/d2HyWwrx
    li5oRtVy1psAcBAp/6bJR8UEz/E7CozOeducFuAmXZSl6NhclargP/iMbr6oURrBfnmD85
    vnKeD9Kywyxoyduw7tAl+YyQVgNG/wKhT/EMcH3yaQjHkW+49ttiHZfVt4XyxEi7KenQrB
    cT4ltyVZLy1rfhz1xffCUawZBrU+2HA92q7bGXBJVbNHXE13+nEdl8vIubRA
X-ME-Proxy: <xmx:AiZzajccnIc-tnNDC6kFyovtzDdjpTY3kF9DI2sc01CmzDx8wvPYPg>
    <xmx:AiZzausDEPq2jXNVe8EaXo5AuOrfB98XTyW9E1OS3Gfu4eSx6GyZFw>
    <xmx:AiZzarme-W224S6rjAez9B651b8TPo6goB8m6z_wjWYIgmWACkn5nA>
    <xmx:AiZzapTYB6Kn_-yfDyKl69WPywcyDmg3b4ZugSSsHpyGRgIJT7V-GA>
    <xmx:AiZzap4NZSxzt8u_uuxX-iAKsxs_fdOWo_gVtkh-sR7OZ7w-Rtzq9XQ6>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 08:01:05 -0400 (EDT)
Date: Wed, 5 Aug 2026 14:01:03 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: spmi: apple,spmi: Add t603x
Message-ID: <20260805120103.GA832571@robin.jannau.net>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-1-c15a12d9a7d1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-t603x-spmi-v4-1-c15a12d9a7d1@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_050110_676709_C6955AFB 
X-CRM114-Status: GOOD (  16.04  )
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

On Wed, Aug 05, 2026 at 12:11:11PM +0200, Sasha Finkelstein wrote:
> Add t603x compatibles, interrupt support, and support for SPMI
> controllers that are not always-on.
> 
> Keeping the "interrupt-controller" property as optional, as taking the
> j514c as an example, we only need this functionality on 3 out of 10
> SPMI controllers present on this SoC.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..fceed47b2cd1 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,8 +20,11 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
> +              - apple,t8122-spmi
>            - const: apple,t8103-spmi
>        - items:
>            - enum:
> @@ -34,6 +37,18 @@ properties:
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

