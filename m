Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9367EFEA83C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=; b=RlsXJ5/pVmh3i6DsMQOeViI9s+
	HFp0nf8ZAaqfzkl2nb5x/623lA6fubK+mPG2C1tigcCNEOukEy8GotOiq6B6ZXqGhfueWMaL4239i
	X/vJFri1A8O6l6fTLRtEQbtjpC59PiA9hfVjwDFKO6XzsbuKP1fCZ6xaNAn+op5AQ7/SZWKrzFoNb
	l82zyXn0FrqyzgdElpMcbS2sEyYqcXnlxr5P3X3vu2seJ1Kq21UP9UfLRo7L+Gtb4y7TWOtzRHx78
	XenYnGt2MlgCy+oSPdmc6m23tiMYiytwszyYJLZD+D6qDSdIydCFwsCI7rNPpDlutpgN2ajvLpb3L
	YXCirF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kca-000000033xC-2lgN;
	Wed, 25 Mar 2026 09:33:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KcX-000000033wU-2gYA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 09:33:50 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a27a90a7b6so2596914e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 02:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431227; cv=none;
        d=google.com; s=arc-20240605;
        b=Zvh1IYIAdGM/R461N22/Mo1L+lR1KPa9f0psIdtBoV87HqRUFCfPyY8JULsfku5PaP
         +linJtZDzX/bYdQpC1/DalLgd+xLTMqP+VeG39OTj+ZPRZ5Z2EV5m2jgxh3bL7GbgFXl
         fSMsxpKuUriRzStJ74mxQy/vGOpANRG2KL+lNFx8M6sBoesNqT36xR8ONylgdjBr9R19
         zxzNtPAGag+gZAL0vBwTWpp6gGoO5ohPauyr5/ftyOzAoEcGV6EyIE2/ZE+l0C7YvvcQ
         4FL+s7FfYSOmfmdNCwyiNIFQWOCIkfSVHhmwhn0AoZFCN2wfvKMRskUnK+IgR+htV39h
         1tKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        fh=CqOFwJqH85V9EnXG/iDeyy7DodoPvvKobK8Y0OGgZfg=;
        b=OPkz6qAzgECneiTbTWLJWUEodKRWv52EWbwsOlL2iV73kipODG5xEX0B3eu198hAbn
         GrlqF55Hb3jhQE0WJ1FEsLESZ5K+JvFmYY/OwOEGpC8rlizMrA+eoDND5yW13aOpGAep
         izUjvUu4I5TxnrFZ1HOHyrQc7T4NMju2d/Orxy60ciWepDiE9FqrwopEpX1aHaMxdAS/
         pJ9k2By1EHxNfclyDD6uLcXSRt+brb+yoTSXkHsJYxVa1ERfdVVDkmDecB8ITV22Zd8W
         IpCUw2mhoqAEDJzTSx5A97urPhonO85jxAO+8gVVlwTq6FLcs6+R3ReQbuVmLSC+D23G
         obig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774431227; x=1775036027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        b=VMWBpKKLCR19QEqGAlqt8pfB9Mr6GLfve9B/6CFtCZK9Y5/PMw0y3nZMc7HPCybxNi
         b6vEiGfi9itt9uACeSMs1fDrrPUzbBPk9ktwDIbt0sdQKuV93E20cXAoJmbTVK/rI2lO
         3HvikZ+Z0VQhPGbbHWMojPPRR8WojAftL0A+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431227; x=1775036027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        b=T4cT0RTc1j5gPD4y9uioDFhdTOlyKITcMHLZeNqZQUmGJ3Ea4E5+G9hVGC0npgnhsn
         Hboclomart78hSGsI+mAaMGH8H4nSHTDUaLzwWLM/JQA3Aq7ii0/YphIJHiyhdmiZ97h
         Wbg1JT6swfrfc11SPwL8jHmiD3t218DgjvQwEMGbw8IWUtqjhYIc1SAPJ542mVslcb2N
         WGPhO4jR+TVrznYMDZG84a57JPA6RQGnnRKm/XqCtTY2D/MjUEfs29+9jQTv3KsesEe1
         0e96ZYrtCWU7AN/hmtcLpCFmDfE+UlrUV+ZRwmkozN4iGcuufYV2TOPU+3y2MOED/7id
         cjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHIxKtddYdI302PfcD0wFYCA5W4GuEmfewUJa0bglFWfAS3rvG+ACgHU1JYDFpqlgFJHWhAEJMvXeV+7TOfeCB@lists.infradead.org
X-Gm-Message-State: AOJu0YxYLty6St7Fa3Lab4aC9hA84ZekS3mKCfWsmmKv+0nWQxotweIu
	t6PrdZxq1FWj/EAVgxUDnPu1nFym7Njsd2LpVauPuhq/kX4KfWxaqiGfWNe1Owrt2Cw8KZnXsDV
	zLIK1lnK1d7nA23KrLFRAMKHHtVmPEtnkxCwQfaT6
X-Gm-Gg: ATEYQzxwEzbrTAfFyok65mV1I4U40YKihLEe3d+xh0GX4DuXC2r/hAFVHUrONTClMrT
	dKS1Oz+qIlOOJBJOknZkpWn3OcVAkrHpv8Nt+O8zsuY5wUk1Kl2LlBWY0SDMshDkWtIvTEyME0E
	u6CMOn9SU+Arp9nztQcSrNyrvC+2pTPW56mvPD2ybUkPboQOOjuPha68XfBo82VSOQhkyUgDznT
	FsFvisFFMMp8CjzDLIkPDkYoHTNULIs0HZjDv/URrXcGNIpkk2z05qyhRbAcdLhXn9CR+GzhtAT
	MRDD1QXa47FZDc9N3u6ExLF1DMeL7bPVgroM
X-Received: by 2002:a05:6512:3e11:b0:5a1:3864:9306 with SMTP id
 2adb3069b0e04-5a29b99fe3emr1149914e87.43.1774431227426; Wed, 25 Mar 2026
 02:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:33:35 +0800
X-Gm-Features: AQROBzCBmtM1crEyyFCRfioph5HGsVEx0Ru6HUQh1CoBPOQAq272r89mllAysys
Message-ID: <CAGXv+5GwR69W5FVWzFYzdybdXv53ub-o9doDQOwey4O1HE6jCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mateusz Koza <mateusz.koza@grinn-global.com>, Frank Wunderlich <frank-w@public-files.de>, 
	Gary Bisson <bisson.gary@gmail.com>, Cristian Cozzolino <cristian_ci@protonmail.com>, 
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
	Max Shevchenko <wctrl@proton.me>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_023349_723691_99474AC8 
X-CRM114-Status: GOOD (  16.66  )
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

On Wed, Mar 25, 2026 at 4:25=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> My Lenovo Flex 11 Chromebook contains a board with revision ID 2.
>
> Add rev2 to the compatible list of base hana DTB to allow depthcharge to
> match the DTB.

By consumer electronics standards, this device is ancient.

I couldn't dig up which revisions were commercially available, but
our downstream kernel says that regvisions 0 through 6 are all
compatible.

Acked-by: Chen-Yu Tsai <wenst@chromium.org>

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - Added Conor's A-b.
> - Changed mailbox to ISCAS one.
>
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 382d0eb4d0af6..2894c8a16c78c 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -148,6 +148,7 @@ properties:
>            - const: google,hana-rev5
>            - const: google,hana-rev4
>            - const: google,hana-rev3
> +          - const: google,hana-rev2
>            - const: google,hana
>            - const: mediatek,mt8173
>        - description: Google Hana rev7 (Poin2 Chromebook 11C)
> --
> 2.52.0
>

