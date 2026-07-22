Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C0FC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 03:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=; b=ksqosfGfoeqAykbsbASFqVeGgw
	7HdYC3F+qTe1o2jjNyQo2LxB1nnhw86OTaJDsuCUP1FcuiaN0pMbI4tHykDHNC5g/bJAw30TwtelO
	g7H0a+rEgEUNmgw77y3EvARt06Y5pWNzHE5YFmBdq5j3p0QxZofc+NX79UsWjawTtYEpP4QwZ7oj4
	L4oELuHqk6lClw9FcmWIQVwCw7Lhj9E+Wjv+E/jSOyuPsSD8ogAj1Nnle4mXJwIj8VfdxGG58nnbh
	ro5sJFZy4Hig37cjJ+04AkuNcDAGC6SwiCCZcNbhOY/N9K+xe//VA40oA8u2lIE4NhQ1BWlVIyfcL
	QhwnHU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNlp-0000000ApgU-0Vcp;
	Wed, 22 Jul 2026 03:37:21 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNlm-0000000Apfp-0fnI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 03:37:19 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-81eef95653fso44485247b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 20:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784691437; cv=none;
        d=google.com; s=arc-20260327;
        b=q+8BsiB+AnuXY4DZzzmIRWeZjfRxuIhNMNqDrJN/jrqFgzcfiHr7tRsf3HsBqrFAsv
         zEce4Nu+smp+D3gheElRlCDrvyi2DNEeyD4+T8LB442H9F5bMDbbNtcU82sQGx7crTxo
         fOIpygIRlArUQN/weg1Gk2Yz0CA7Gg/nulj/mmWgY9Dl4607aQbjN/HFae6YW3eBtgoF
         eFcnEV2Da3E6VsOlF2q1K28SRHMWkzeN+Od34bmOx8/39/+DQh87chzqpx3MUVygsYhM
         wnCTc2rN665fl2fR4EBBabVj3ei/JYhv+0DTfqhy6zu3Ne3eZj1puhTGksdZs+B9fFOv
         yXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        fh=O/pf2pvkQkBYSiH09StK8x7Xgm7oylquDvk9YXh+OzA=;
        b=oYejqxiCExtZuErPapEOFR+E8TvIHYaeX47a0cxF39PxmVqILx1Qyehq+TJlgw+Ir1
         J7w23gHRhhQN+SCpT9phU0N6jVLxHmQ/6bbN6JLOhHKyeZDOvx4mDxGnId8DPX89WRlZ
         iwJAh9StcjdapOLAAOf+oVS4veakw+HkcYVXv22b/krSYg2UAmYY8E4QJfqYe2ldR381
         X5BAf6/cfnteHMBdSI119nWjpMZCZZKWp+CVXGyLrICZCuxwIC5DWxY1oiDAEs3dHhho
         U4QUZV+LsF2RPK7TZJ2q5QT0e9MXB39UpmnLhWM6c+PhKPNS9ofhHxmOwtU9x0SfHqD5
         oKpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784691437; x=1785296237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        b=fza2AwSYge2VG0WGu5bijCgoOCfJMfGaPiEdJR6uycBjFpHwwcxTvtUqwXjKvj4rI7
         sufk6QaIHsEG4uXoAlitsBGFmKn98N/QZTRLd+l8TryPkMwWv9pkyBg/K5ecUdE2RgBo
         0HNQbelv91xI8sNGiDtieYKt1sc5ws8wJ4eI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691437; x=1785296237;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKTf/d7nFmKcsSFUbAB3exdk2dVsrnMxmbCxkgyTBek=;
        b=KR3qOrnDkVM6z3cjmJqhTtUyUvCEO29ZF9DURU5/vmyeMyNx7ogj1VAWb00bnA0kGT
         W1moBIPgdzbn1NmQ9+OUNhEaBLmuDq8YVm313RkyrdwMA8+X8TCQbGtRoA7xQZAK/SNJ
         ekqBQYfOT+LtiT+6vHy6bT0/AzcubjKSSXmen48NKNl3VaxX2fbhba3ikGvl4QnNL1JZ
         aDnP5TE4sW4LDOYji0TXRaYDbsvtMyBsa3vWquQbCEqEJz42Ext2N0CNZXdMcDeZ84uD
         ez9S0yP58J82wMKsBA7baG4h58YjITqLysCNgEf42LN3MxsuwEMfIZz/O1a/+QvgSNtl
         3RtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBAcwyc5p3UQN7Vy6nBp+gJDFXMKyuZA4YpkXzt+iXRdg/PALLqzG1I+NbkSbhcSBUrPDHNdHLt7iRRsizlPe5@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ1Sqr57q+ZLaEZ96zlmU0EIUUj3053UhQNKUvPy6a6Ilnicrc
	1+6XckcPZ+mB5KD++22wXDv1rLd9Hf/GLDZEE+plGITh/aLL0kBL0iTemthIWr7zmP1AKDZRghD
	TApo4w/tBuVUJMEAgZWzng/8hiAdkHgmWK6YJ1+Ej
X-Gm-Gg: AR+sD11vWXmrOzX8JP3dwKFGGB1ZntC5ERINOWMoLqhGPmrnPzHe13O6lxHtL7nJUK3
	CH4WgWjN2r9DePCkrv8/mTDwoHXR9l15kDvrE+0SyTfLC/0BCaOvNCyv1BNl2KaVWRCZEFSSa/Q
	ktUjJNaGsFOa8fEvm90EMxKU5HuiNC2qBXY2iUSKQQyLOU7mqZ+cjA87kFkinBTbGqtJtmh1Mv/
	3WDZH1J1qCcqu8v36YP/sE/2yBqmTk14Qk3IGdyqrdXEzP1XhiCzn7VK2QNgPuJcTGfDW2f9avY
	zx4mtbBJBOE3WrU=
X-Received: by 2002:a05:690c:6c0d:b0:812:996f:176f with SMTP id
 00721157ae682-81ef22d3ea4mr70445607b3.11.1784691436993; Tue, 21 Jul 2026
 20:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com> <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260721105230.101906-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 11:37:05 +0800
X-Gm-Features: AUfX_my3u1BuHiEh3Upx2wok8eAOOGJ_r8yDp0XbplwggDqqh2JVTYtoDhYXOKI
Message-ID: <CAGXv+5GrPZCZ=jNRi1AtduyZoB8DF_FUZev2CXhu4WzGri6U3A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] thermal/drivers/mediatek/lvts_thermal: Make reset
 optional for MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, laura.nao@collabora.com, 
	fshao@chromium.org, jiapeng.chong@linux.alibaba.com, frank-w@public-files.de, 
	bchihi@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203718_206841_CD98F940 
X-CRM114-Status: GOOD (  14.53  )
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

On Tue, Jul 21, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Depending on the SoC+Firmware combination, the LVTS hardware may be
> may be actively used by one or even multiple concurrent MCUs!
> In this case, resetting it may produce either a severe slowdown of
> the entire system, or even a thermal protection AP reset, as some
> MCU(s) may be reading a very high or very low temperature while the
> LVTS is being reset.
>
> On those, don't fail if no reset is found as that may be omitted on
> purpose, but still check if there's one, because some board(s) may
> be running on a different bootchain with reduced firmwares or using
> firmwares with reduced functionality.
>
> So, use devm_reset_control_get_optional_exclusive() instead, as the
> LVTS controller always had only one reset and retrieving that by
> index, specifically, always made little sense anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

