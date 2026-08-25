Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF4C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5Ct481F4wkRupatYcRj24aj8wwNlrEwHJD/XdnqyS4=; b=yFVKhpO0P93DHK+U1g7oLfgt/i
	SzOl6WLTN6gWuTEBWlZoRyrDW+P68Hftgc6LtyqIJX6ePwbHOdIcYBCpFSspfT1xn2HyTG3s9F/9z
	hpSkrqQdy/CuVWeUhsSh0UCKsBhUQWHe3FdgnZDxyUxo23+EQ5J/YgL3kg3tyJDw/7UTMsjlv8/D+
	oEdkcJgf9kSbrrNsNhPKspB1XpkpfH7ih9sGCslbbAlOKNt/c1EdoOHsegbu/J1B4jluuQJm/1zEQ
	zJYKl5iS6FCKWJUS/wzYxRkEGgdWuZLSHy62T5LPn9O/b8PMMu//28jUrly6Qt39RdioBaHsc6w1Y
	vyzXA5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqKy-00000000mbU-3Ubq;
	Tue, 25 Aug 2026 12:33:08 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqKv-00000000ma8-2Rst
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:33:07 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-836c8cd38beso4213127b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 05:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787661184; cv=none;
        d=google.com; s=arc-20260327;
        b=MeCUb2FA/diqL286f7fHll+zlRNsmaBR4Xnu+rodO1bpchSb+aDZBlVCmZCsz2YjG7
         pd0pkE94iGMmZfSyzTDuiZLDf7T9Tx/rK7Y5Bu0NPJOhhNLrujVlVdgFal3tkvNBdG6z
         JAZW6tXYr0S9UCAGeW3EugP6Cqidci7piMSnKAPFF0vczM5xmJdPqJqxtDR723/gA1JG
         M/5mrKnRa/HiS3OeTKHGMU1/qCxO39N07xiQNq/CPV0mNbtvO89M0z+lErD4C8NJ+8lk
         ie2azWD395qlsr/eiJTNWzXQVtrVxNfKxmeCKr1h0nSYQXhMs6xMKkpNVP9HNIdY3PKq
         gX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j5Ct481F4wkRupatYcRj24aj8wwNlrEwHJD/XdnqyS4=;
        fh=WcR8UuqjvujMa+zTrk4QC76NzrBnbTxRY5kgGMCMbAY=;
        b=gTf5DJNHCBPyx+ITZu6Mj3KKMFzzSeWuLKs4+sVlc7DE80ArnjDrjaGxacLkJGXP/y
         nRRI+P5cgrmmmeWyoIxFklSqwPcQkLb29sGeuNWc0+k2vt08YBeFZc7Vnpqwhl6lwGjw
         3OJ5/TbVedqWxpVaUBLKXDQ+eYUl3IIGMgIiFLMNFNtX0/XkKPRbz5STwTMavZuxKzV/
         g1Wma0odk8E2wUy/3wAJVsAzO+3d+jIa9YufSPcVo0zaWHqomcUkhojZmI2dPzZHgkIp
         hJRSDMgxcY0I5qmoq2kvWR7NhX5C7qXhICgN1GosaohNoxZQ3omgbTg/x6cYMSBW9QC0
         Aluw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661184; x=1788265984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5Ct481F4wkRupatYcRj24aj8wwNlrEwHJD/XdnqyS4=;
        b=SaXiJqZwl3PlIW0f1XPXLfIUvNBA5I9X+d1FUfTfhtbX0PNujdLTO7vRnLLW44gjjA
         imz7dodHvFlVDxlZENH3vsv6usZQEj1tlL1JNsTNeFc9VQ1ltYOftLnFQ+UqKGN+7CYs
         wKk01Mky2vBW6ZeL/LpeNeSa4tX9qfdsQH5hzYAQvojUKV4Y94u9LwpThtOIeHLXLDkx
         +7Q4qT+mDNhNDNVlkFmBfve04b1Gep3k5uNIeMhD0Zei2B6VZQ9xyav+gYqrbb8LUMat
         MlaITARkmeZ6PXVWbRTf/fvAIAyQ4l3JRij8+YPK/6i8RrkqiyOQfxAqHU/JVuHk6JQW
         o8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661184; x=1788265984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5Ct481F4wkRupatYcRj24aj8wwNlrEwHJD/XdnqyS4=;
        b=tUX6MTbe8VI1jCfwCnywmUzMGKUT+W5Rd0OWkh3TkSqIuj8LX5O+G9aLT4wJ0JLRdb
         WHyCl2tpw7kqunk0/ovEsNBtPw/oVJouiycz5d/WqW2Ijgts9e7WJJFMuwaqemAmvqwV
         z+vQedKEv8/CvLc0kH+LDcNmdu1N0Qpv05dt8w3wFT5mTBm+klcVMKIRl5pyOPRUNWdU
         jvf3aOyMVtOh/0qf1S4/ppRTgJmHvip60f3nmT02vrGIkYbzBE5qpsCdbJziywrGPGaD
         /rzfPiqy6ptSs+sMGUIzpmsIZ4qMzmbWsazhhCXVRaWQCfHbFj60Xyuqc1Q53LNzWtJu
         n9SA==
X-Forwarded-Encrypted: i=1; AHgh+RoxXN3J3hdlYj7X9EXNx792Pofy7Y5crM3pO3hVcZn5B1FBWfqVcJ2hL9D6rXrkEGz+P83eHOv6jT1WFeyfrTDg@lists.infradead.org
X-Gm-Message-State: AFuF++lUesVC34V8BGeIt5J/8ZNuYUqIppMdvis04TCqe09ozUiUmfv2
	VE1VMqken5DtjktCx6Xsf0GJ/QHYizWqNuzzYqlJh+0vCpnfQ3iRDXDPas9PrqOGrs45TQXLfOA
	FrZbw5X03poyTeXIIAM2mIWXBnuxuFj4=
X-Gm-Gg: AR+sD13yLU9hxwbJlm3s+jr+HljDAoYI5Q5O/o06Vr1aB7Nm3h1/Y+dq1G8Ed1Xr5jL
	Xsyi3KAz/pY69omzey7xY3S6syr7YRKLi/HLC8TFVgmn+Dazi7C/+C593uV0yc0b+pOYuIQCamB
	WW2Lrayo2ztJN7/vcTgFnhviK81HZJq+NQR+cM6Pm7Afli9m3MLsdX54U6MsZDLcRipht7wBHM2
	nui74Zp29Ppi0J2HttvXA1HjO9CcuBu4K9Z80Z4QQkUeJ7sPKXI6hsUsv8yoCrxbn2HwqtqpjSd
	lLI/2ChzuxCXWZQ9dr6GxOYo4U1otA2ETyVxPISid95+hw==
X-Received: by 2002:a05:690c:6b03:b0:7ba:f0d0:5e9b with SMTP id
 00721157ae682-849f4692ca7mr107963927b3.2.1787661184163; Tue, 25 Aug 2026
 05:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <ed82f56171bbab8b150d3512412cda12e7e09a7d.1787568944.git.gahing@gahingwoo.com>
In-Reply-To: <ed82f56171bbab8b150d3512412cda12e7e09a7d.1787568944.git.gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 25 Aug 2026 14:32:52 +0200
X-Gm-Features: AcwNN1Xtzi2WJl1KccSUfPCnVd1JKytTLunfgDKRxF-zeJjSJm8murTNkgUrOck
Message-ID: <CAEWPSH7AcRb4uAnhmcL+kk3mQrgqYsQAYR=JQjJdkFGVK4qfHw@mail.gmail.com>
Subject: Re: [PATCH v9 05/13] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, u.kleine-koenig@baylibre.com, 
	chaoyi.chen@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_053305_632652_0530F9F7 
X-CRM114-Status: GOOD (  19.16  )
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

Hi Jiaxing,

One small thing I noticed while applying the series for the
RK3588 re-run: the cover letter says this patch carries a git
note naming the base and the one prerequisite, but the posted
mail has no Notes section - perhaps format-patch ran without
--notes. Mentioning it only because Rob's bot asked on v8 for
the dependency to be recorded in the patch itself, and it would
be a pity to collect the same remark again on v10.

Regards,
Igor

On Mon, Aug 24, 2026 at 1:10=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
> already describes, but it wires them up differently: two extra CBUF
> clocks, two power domains per core, and a single reset instead of two.
> It also has no NPU SRAM supply.
>
> Widen the property ranges to cover both, then pin each SoC back to its
> own shape in allOf so nothing loosens for RK3588, and keep sram-supply
> required for rockchip,rk3588-rknn-core only.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
>  1 file changed, 44 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-c=
ore.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.=
yaml
> index caca2a490..3b611b64c 100644
> --- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yam=
l
> +++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yam=
l
> @@ -21,6 +21,7 @@ properties:
>
>    compatible:
>      enum:
> +      - rockchip,rk3576-rknn-core
>        - rockchip,rk3588-rknn-core
>
>    reg:
> @@ -33,14 +34,18 @@ properties:
>        - const: core # Main NPU core processing unit registers
>
>    clocks:
> -    maxItems: 4
> +    minItems: 4
> +    maxItems: 6
>
>    clock-names:
> +    minItems: 4
>      items:
>        - const: aclk
>        - const: hclk
>        - const: npu
>        - const: pclk
> +      - const: aclk_cbuf
> +      - const: hclk_cbuf
>
>    interrupts:
>      maxItems: 1
> @@ -51,12 +56,15 @@ properties:
>    npu-supply: true
>
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>
>    resets:
> +    minItems: 1
>      maxItems: 2
>
>    reset-names:
> +    minItems: 1
>      items:
>        - const: srst_a
>        - const: srst_h
> @@ -75,7 +83,40 @@ required:
>    - resets
>    - reset-names
>    - npu-supply
> -  - sram-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3588-rknn-core
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +        power-domains:
> +          maxItems: 1
> +        resets:
> +          minItems: 2
> +        reset-names:
> +          minItems: 2
> +      required:
> +        - sram-supply
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 6
> +        clock-names:
> +          minItems: 6
> +        power-domains:
> +          minItems: 2
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +        sram-supply: false
>
>  additionalProperties: false
>
> --
> 2.43.0
>

