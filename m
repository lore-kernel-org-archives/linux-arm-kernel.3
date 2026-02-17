Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7623E909D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=; b=cQgHJWyR9OJ8ekL68t861eRS69
	a3pyiHmQBNepB96JfB7VZjztVEoJltktTqkjEZ+A4EXLbvIwlguv8Dc0OJFc6z2cEC/WZ0cfS2G0p
	TpgmNApJqtXNwfLbcLCRQBOOIiVo6ofEXgddFywi+mwqvFKgbpP3IYvD8Wuq/8oR+8vXFm7y+aniO
	yTKYqvSdTANz/kixjNlgu5gmTvy800AOuE9DNmvFVJfqNAqPfqykwn8/l9S73y7sFDzIibWPrLBue
	7sMxskTJPa9HNrF1CL8IFLPHIf/s4Qc6J/DDeitLRT+b9pozmKVT5W6CBaYmAKEwym56aMxHfMPva
	Duqi+xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO5D-00000008a5w-2Gvg;
	Tue, 17 Feb 2026 16:37:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsO58-00000008a3t-05jp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 16:37:53 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-65c0e2cbde1so1825617a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 08:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771346267; cv=none;
        d=google.com; s=arc-20240605;
        b=dL8FmKdMEDWcPd/bGbeWTnfm7+F9qqGSihL8as7BBTaG4xNuaNjoIlvqYjYYNx6k97
         9Sly2aAI/do5i/MUyIA4h2dqen3flYF5DnnqSZgjvfYCWBPhA7gHP0QQGYPOb860cm2T
         BRWN3hldtdQvotu42Yk4LTWgrU4CPCJmrM0ZNx3LovM4NdvTL+1Vh1cuBJCe0kjqgtt2
         cSbwQ4KRk+jpQ7lcszm3AaGdySMxlBy+kvvWuP/dOXJThMBqxvlM0MRZ6Akq3YSlg5Qu
         CiLqaecWDujsA8IUbQX6tsLetwCdmPmEB1Mkjll0DBZrQrga/QHIXXRZhPoCA03qmCED
         ySiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
        fh=5vAM17w20g84qdwlTmf09IIz26OlyNyQOVCK4nZtWwI=;
        b=MXZrjshtxl203utuP8wUuY7H72NAf2VKGU3gFDOfW8CH7rrDiYTg1RQWG2NgFstrpA
         19/ZZN+6CHb1z7RPkxQo3e1ySb3IA2CNW2OE+cSpMWRb9/jAX7qTEa35eBxUd0das2Kg
         cYd4wlF3w+ncd2XYMtSR6pODJ/R2nHUYrgnAl5UE4SvKXOUVnZ8N9V2z043ECPkioSLO
         LXUuHNrwezG31pce+BlsbDXZ03lZ0WVxs2FcvZBzFfF6M+K2A6LlOc+J+CWSVf0oKFqN
         y2SJwnPbhP5GySFLSINNXxduCsEPxSPKLM7/Gwqe/116IGrw8G3alOirO/GqarVWapUp
         E4Uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771346267; x=1771951067; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
        b=HQI31/0pakNEaH7kgDRrAcBjXj3DnE41+mkIzXVr6z76QOMZeDs1h9HIpEyBuluNVN
         s/vsLNUFY1eV4tg4YyCherla9PPjGWJ/yanr51A9X0dOMkPckaC2kK5ZkqJ+dzSI9Iiq
         59eIsKctKvOSrMbssJU1NEAqQXuYdtdE0OBGKslQvInoutXuV3jccp3B9vdHPOSPsOji
         5Q4/fbY4biPHvvaHR960vwpkIHIy7wxd5tOwY7uFBqt82pbMogbgT6KBh/Oc9RPUK1Rl
         3jcHkYEUvoB2votg1ZnaJGXNkZU6aul1HtNegZKXIfoH4bYpPyQkeV8pqvZlqvLu9ZYd
         kJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771346267; x=1771951067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIGbAV+8Vnm23slA1If+Si9qq/awHjco1XJ0AGN0iyQ=;
        b=d0SLLCTAdCXQw9H9VfvavHNawdHcFo3qMezxxvxZfkObNs4q2yCHzIA3YcgTOHnzoz
         Zm4vdAnOQXEQj4JkeBvKYIXnPwAuL8b0Nrm+MTZC5GMKlp/wWbPIFbA6L1NyL/sMwNel
         D1ORkLZWOh0kQG3wKvkvxzrB6nCPhVDxzEcOMi3uCzkxZfxi+hz1dDSTHKT9vl2ZM1ls
         qPaZz9azcQ1FOtnZ9lVXxmy+FqqMPJ2BH3CE+K9C6cuMWe4B7aSX3xB1OHD0v8bUjE5y
         visYLKOuoPRM9SAG0T0whZfEtbB24TY+IcHBPHvdZe1GiD/4ffJNKQf1vUY7FBo27/RB
         DTtA==
X-Forwarded-Encrypted: i=1; AJvYcCWzyHUm9riqaCH9xLzSsm+M8McWTco+TFb3MGdKMwv0fj/ZM9uvG1CFRL1kJn/9JnuMfvCB8JS8ZjcCCflDoXlb@lists.infradead.org
X-Gm-Message-State: AOJu0YxiKnZ3tMpAITrwqgpCk8br8sNF2Fqb/muVHWr3FoJP8jXYDqKM
	3Z0FzqGtUbi6q4klVL7Eh5R5YiGH/hCctIAf/IHQK82T6jxEkL9tjZiuTNa2+Ur/J/3t9gh3RfY
	ZawrnJogH9VneeaVZqiMbbmLoXFe0fBE=
X-Gm-Gg: AZuq6aIP91UaD77QXMGK5ZJWIPmKpshfxsZvDq1Ji7lkcKns5it8f8KToXx++ihox9s
	np9vqGTsGFX/TIdPBYas1nJCi6msTBEF0bpMVdFgbtCs1hwdhBdUQkUoylESF8u5DMJpTJc3q5y
	LL2DEbxhcPnR+kIoZnWsVtGbZqyYYTAFmDOPcD0lHMjd4+QUHfWV1DfNJnWukgoflpeXX2fGmp0
	qNuLLnk1OYU3r8hw49T/ZjeZpspxwoT7jfwtDGOJ+XxxuZh7cF1/Qmrc93Cs10zUWvFiHSnkQAQ
	nfVhC/2eqZGe6piR
X-Received: by 2002:a05:6402:3648:b0:65c:1f0f:e6f6 with SMTP id
 4fb4d7f45d1cf-65c1f0fee06mr2535558a12.22.1771346267257; Tue, 17 Feb 2026
 08:37:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com> <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
In-Reply-To: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Feb 2026 17:37:36 +0100
X-Gm-Features: AaiRm51UVemOzhQMk6xoVI4EJaD4w62lgA3q3kyqzB9n5tt-MdAm1A1cRwc2sAA
Message-ID: <CAORyz2L6_4yLb7t6-H3MjCu7QJtPF0QTvdsvdBw8f9zTey_tBw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: Vladimir Oltean <olteanv@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_083750_924595_BDBCB36C 
X-CRM114-Status: GOOD (  31.06  )
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

Hello Vladimir,
thank you for the reply and explanation. As a new contributor it is
greatly appreciated.
Those patches are definitely intended for next since as far as
I know there is no mt8167 device using upstream kernels out there.

As for the Fixes tag, the rationale for it was that it's ultimately
not coherent with both its original author's intended usage [1] nor
with the current code as it's not present in [2], possibly due to the
fact that at the time of the original contribution bindings were text
only and less accurate, so I described is as a "Fix". I understand now
that the Fixes tag has a special meaning in the merge process so I
will just remove it in v3, it does not add much information anyway.
Also thanks about the git commit prefix suggestion, I didn't know about it!

I apologize for the confusion and I appreciate all guidance from maintainers.
I really want to do stuff The Right Way, it's just a matter of moving
along the learning curve.

[1] https://lore.kernel.org/linux-mediatek/20210406113631.2675029-3-fparent@baylibre.com/
[2] https://github.com/torvalds/linux/blob/9702969978695d9a699a1f34771580cdbb153b33/drivers/gpu/drm/mediatek/mtk_dsi.c#L13061

Il giorno mar 17 feb 2026 alle ore 16:35 Vladimir Oltean
<olteanv@gmail.com> ha scritto:
>
> Hi Luca,
>
> On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> > Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> > describe it as compatible with mt2701 instead. It is safe to do so because:
> >
> > - Bootloader doesn't rely on this single compatible; and
> > - There was never any upstreamed devicetree using this single compatible; and
> > - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> >
> > Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
>
> Not sure which direction this patch will go in the next revision, but
> (if this patch remains in this form, and intended as a bug fix) please
> do not mix fixes for the current (and stable) kernel with new development
> for the next kernel in the same series. They are supposed to be applied
> to
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes
> respectively.
>
> (also see Documentation/process/stable-kernel-rules.rst for what is
> generally considered to be a bug fix. We don't use the word "fix" very
> lightly, there needs to be a user-visible impact.)
>
> To help the build test automation select the proper base branch, you can
> use the "phy-next" or "phy-fixes" git subject prefixes when generating
> your patches.
>
> You can send fixes at any time, but please send new development for the
> next kernel only when the merge window isn't open (unless it is marked
> as RFC, then it can also be sent any time).



-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

