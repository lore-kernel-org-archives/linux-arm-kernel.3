Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B491C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 05:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rm0EqLIUkFc/YQEYZghm/9aMXZ0pgY5F/cnsZASSdbc=; b=da0oLIhhkU9lKRaIVLklt5lALF
	R/UeVtshV2Jnc1eaJNdbPQfZuFxkqZ6unyGspgylxdUxQAvQ2t52lVhgCt1GXRWujjcUQuMfJ1+gv
	w4AAe9uwJBSqSd7TN3DP2K4CC+u90ZKLXsl2JamxQZ4ELqBFmCCHqhcgswEmALzd088eZI2Qk+TaI
	thle6WDdXI5vmXHPmsFAWNLJJ9GwKwoK4eu50aXpN1t12G/eqSoNn76ZKtHd11m78SGGgfOUbxykR
	iBlP+tflXbMCKemJVIS+4iE0hHiE9+wvDd1qdltbXxmrVpchyLOF1lgl+betBRZAkLuCNpzqS6Iib
	dJ7AT3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9y3K-0000000CfNS-1wVe;
	Fri, 25 Sep 2026 05:00:54 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9y3H-0000000CfN3-2uB4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 05:00:52 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so174046e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 22:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790312448; cv=none;
        d=google.com; s=arc-20260327;
        b=FRs+XKYTVrUcm7v5INeja+zS6U8/bl0dWDLVDfXepKC6OqpQe/AxBIrFDLWK0uJuAG
         mPbAAlQF0PSOU/lcnV4Ai/h6RCU3fs1mOnoymuo1TZRb1GfgV9O65Bv8yJidWWil7DPY
         BY39iSpI6dCFdux4RfQv+tgmazrbOdp/L3P4fnlZWPpbctpK5dUdpln2UyalAfdZO2qQ
         u0Bay+u08qKyYlZYV4nnAQTdlJKIcHKeqFtrXOwGlEDsrvgIWm+obngryAv7ogfQNCdL
         A30Xq5ynDlR5FY+cy+QU024rspm9idlmkB4r5rWG3QklnFCsz1+AuYZGSusN/Jj+RsD0
         xs7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rm0EqLIUkFc/YQEYZghm/9aMXZ0pgY5F/cnsZASSdbc=;
        fh=FK4GgUn9WIosxxfPS3rIHskhjMp2bzVVR0TzhLWg/ak=;
        b=lQAcWhJPjtDhLm+kxP31bPaWAM5BLljGCzz/t96S2C/FYygwfDpTL4H38g+hXE5bme
         BBMc9SpZFL0KFwZYK+dRvfUdK5H2ZeBy5BxF1axnlJ8HDeKEcNfuowf91RY3f7j1yKtn
         7YWsX1ikRYKRKTqzO4vRPZ/5aPfTfU6Vgox8X7J7sVdIsWlOXrXzShscAQvX++XD1E23
         P90SU71gcFFRvziJnu7b1z/8rBRU849NJCc4IZq0sQ4yEZ2k4D5xfjwcRVyn4YUEf8Wg
         QnXVkhwMI8oLn2i0rnxd7D9DMJc05q1PWTnF87+UFdFiI0FW5Pj1EIpStXTliV1xG38T
         Nx2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790312448; x=1790917248; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rm0EqLIUkFc/YQEYZghm/9aMXZ0pgY5F/cnsZASSdbc=;
        b=JmBuxruk7sPTk6P2InHAKu79b2bDsbFlMoC7i4DdMYaszRXCsA0R12eOLztnaredp8
         vI613hJaOrJdWx78F20FdwRx6hy4WCC82jGa8Lm/ku0MQYZKgjlnlQOXbM59sYE+QX0j
         oEsKjaQnxwW2lO2c2A37yN/dwlFUKk62lMgjBok96ui/5GIV1cIpnNRNnD/Vj92f33vQ
         q+6PWBZa24vAf+1qSI1B96Gui1Es7mJw8W82G+K66RCWlc+EYPJMFrzg9FJIWKS0+lpt
         cHZXBSsA35yc+e7pw2TBf+BmrofzxqriLXOlHoam+yQXRq5tIjFfzfkU+H9RRL6pnSOK
         r9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790312448; x=1790917248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rm0EqLIUkFc/YQEYZghm/9aMXZ0pgY5F/cnsZASSdbc=;
        b=qW1OVxVbf/tSAJOoKy/xF/Mu3NAeHdLpExsl8To0JWnJl4OpDplLCWJv+z7/vGimMK
         Hi2oKNwxwlI76dQwBrV9qtmaZXCqdP0hV35c2z+Junl1SHveoMZLB07LY5VJXHGoTOF1
         UqYeWMJrOvtP6BdM9ZAu/0NEQ9Y/fvgmKSxJknqubkzOtgKKVvspQVGT1JHQ6kKGWZhO
         UMLXyMPwT9IbBYTGlAkHSLKzw/KrVxxDKP3A5fKqI0GM5zWTRXv+vIrbNLQFKTMjS5jm
         g8gJic+CksqTpxgKH+Vz1UeXgwVSVWkRjCDIwiO+IdnhmHBuDHPg1SbBP0KTMxCm/E8P
         jwUw==
X-Forwarded-Encrypted: i=1; AKwUvByMUew0L/woHnfJx+RZBjkCwoiBWa1rEm9IiklB1FCnnxluFs/XFVigUJG9M1WLQOvhXa6xQaHjvfd+VC0Ru/Jh@lists.infradead.org
X-Gm-Message-State: AFuF++kelw6/XG7h2WTnTvxkraPygyEV53bb/muGGXu4BCQKuIja6ktg
	XkRYlZfloD8d/TaSGNCs6S/l8IqdsGHRbsYmvEwA9shVl/SXsjJRnnJThbqDT25dKHPPY18IVxi
	PwLRHV832Xa25GKFnjVErOlF/iwiBybg=
X-Gm-Gg: AYBFou0hhqHNig9iLKHQanUn8PBta/4bdV5fwKn6S2gGxswFbGAZNIIL8mOR1ZrfQAV
	IyXEelrpQ30ju2sLcYfbIFwxrG2S+7aUge7LqZW5sT/pvKj7dP2Iw7vJS8sHEchInITCBvH5bch
	nsuxhTjUccGC7QVAILgBjD9J61Ypn0frRqhWJ3FQ4W5ddOOpYljTyXq9FvHKcwQF4GYPV1Wolv0
	uIJBCTIV6F54/sOQSiTM1mVnunxhTQPWxN73SlING1AcGImx6NpLy5672XC8snCexApAkMzq5kC
	gzAmD7iGxW7Imx9qrQrP0K19LJNc5v0N2+oE8ubZqGcJWgAleayuS/7Cx/ZmP757PQdlXYz5e5b
	D0APIC/O1pj7Hs6cvVw==
X-Received: by 2002:a05:651c:1442:b0:3a5:d8c5:dec3 with SMTP id
 38308e7fff4ca-3a63bf30056mr9425791fa.4.1790312447882; Thu, 24 Sep 2026
 22:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260923165447.619477-1-oss.patchbox@gmail.com>
 <20260923101026.000034ea@oss.qualcomm.com> <86jyoa4de3.wl-maz@kernel.org>
In-Reply-To: <86jyoa4de3.wl-maz@kernel.org>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 25 Sep 2026 01:00:34 -0400
X-Gm-Features: AclHuK_aa1lbVC07A0bMFtx-SCHDmF8FwruzF-cMfKgCuCV9kjuVsj4-WFomK0k
Message-ID: <CAGG=RgARi_wVpUBRuGS8UkEbXim1gVLx8Xuskocc5QYL6+68iQ@mail.gmail.com>
Subject: Re: [PATCH v1] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
To: Marc Zyngier <maz@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_220051_782550_D4B53520 
X-CRM114-Status: GOOD (  14.63  )
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

On Thu, 24 Sept 2026 at 16:12, Marc Zyngier <maz@kernel.org> wrote:
>
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index e9807af235373..91e08b5229b1c 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -5561,7 +5561,6 @@ static void its_node_destroy(struct its_node *its)
>
>  static int __init its_of_probe(struct device_node *node)
>  {
> -       struct device_node *np;
>         struct resource res;
>         int err;
>
> @@ -5571,7 +5570,7 @@ static int __init its_of_probe(struct device_node *node)
>          * reset, don't even try to go any further, as this could
>          * result in something even worse.
>          */
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {
>                 if (!of_device_is_available(np) ||
>                     !of_property_read_bool(np, "msi-controller") ||
> @@ -5583,7 +5582,7 @@ static int __init its_of_probe(struct device_node *node)
>                         return err;
>         }
>
> -       for (np = of_find_matching_node(node, its_device_id); np;
> +       for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
>              np = of_find_matching_node(np, its_device_id)) {
>                 struct its_node *its;

I appreciate your time reviewing this.
I'll send v2 based on your feedback.

