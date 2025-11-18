Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F853CEBF97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 06:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xPDqTOMSysXGINTTvRQnNReggLR5szicUimARShbck=; b=hIZ8nJ+JOo8yvl6wkX82ghqJGw
	ZddZeNnqEEIBSxYXvN6Nw0iHBv0itA6TJW2g++6l68k8EmzcAsP2WFmkhVUi/4tGg6L8tQudgbruN
	yr/G/gp9CGl0Q7cz7Lcg6azOTjYHlGxXDxUanK9MCdYjZNJmA1zGMmTzX3H6iZQUlceqUpsvpj2Mu
	/TGFuSNgQ5VwZ8a5kke88mDdNMpGULDzA9itafl0KlmbQDl08S6npU/aIGXlrZrqIAzxFxIaDH5/R
	neI20ak6WAZq2cTNakcchoh5kXYnHDUYi/XfdQif9kXeVEy4LpvdIWe4wxnh5imZfbOdwPB9swY0p
	FWnr4ZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLF05-0000000HU5b-33KF;
	Tue, 18 Nov 2025 06:15:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLF03-0000000HU51-0QQh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 06:15:36 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 062853F6FC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763446531;
	bh=0xPDqTOMSysXGINTTvRQnNReggLR5szicUimARShbck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CK+ai70j+478/4QnDauf2ZW76gfs63hZSfICJ1yCVH8uvDp+xqwVKweDKZsodMC3O
	 aie99mQNg/ORbxr2D1QxIxuAyj65SJJSsjhmZ4D/rG1QrGZaxqIPNOk/9b/v58SDGQ
	 WL7jHEf2Fig7semsUxtaMnxg76UQkeuEdc0rLOjBCx9h+3jUjz8bjaWcpME9lkdnUW
	 yVI5TFI03Wx72ese1J3lTz9gQnIxdE2ZSFksb6gJ6flJOeEUraKHEtC23smqUZrHFA
	 70BzmkUMantNGjlRT5CitjEu1z1UlBPyx2IAV7GhCYz9s8HY3M6kmi7vnBbfC9hLnP
	 ZOTWJV21cz0/jFHi/hfkMKDa1t64RlMJJ+DQm3B8jJw5czlzS1+w62cKEmja2N4BLs
	 bbpMrcjvDd6dbzpZR+Ak3KWUCZx06Sd4HOzzQ/JgLgtnGrd7I4zoSkRxdy40XtCjho
	 aTgmfbCr3ppLdabP+CKjkyExqxJLtRxtdpR4Brola8rjM+eB0iqvqmjflbaxXTlCyG
	 LTIuUvEhQtQ6Fj0F4vJ/s3RIyhv/H+K14/ClUywPtZ5PRqK33gsVJpFWAMDZP97o/Q
	 xo3N/1iWV6oUXUwfk02CvA+NBQBRg8AYwjb3q9wiGJK0p1dJSUEG6yfnCdKe+dkR/X
	 Mf6SOHz1FzT3eS31KBxrxUrg=
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42b2ffbba05so2662929f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 22:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763446530; x=1764051330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0xPDqTOMSysXGINTTvRQnNReggLR5szicUimARShbck=;
        b=w1gZNQJS16bnmNUyJYpObdABcpQKS+cCfyqfXziiZh4Ug70uze4GHes1mI69jS0Vb5
         uIKLETeXckZ1BNTxs7385gzGmG/lxaBVdK403a7vf89N6kr5TDW9/MBSzH4veoq/8DeN
         sDE+ozzNKQ8CDVz4pQds71LUdo5jt43COh+HcS8OXcSNybSZj8klOxYrRAekjYsl6jFW
         2/JSsPN8TwBwscpm3IAKOug8PTL4XxPJ84DyeXw/7yTDfGhIOhe+VqwKb6l/XVRubRxl
         G73ZcAQSzLYxISrM7tVXr3o8AkGx+MRYvgj/jnSLwvOMi1FmRVWVAWlNuXRwxAJYL1H1
         Lk2g==
X-Forwarded-Encrypted: i=1; AJvYcCWh8vw/K3BylIzh7Aj7DcjuVyu2TWLTs3OJXHMstc8CU4I3tlvjiomUCNT5OGTEwNozRZ+n10EPxgnENrBFLp+L@lists.infradead.org
X-Gm-Message-State: AOJu0YyyTYK1qeoKNLQZaEw1ZF3Bkjda+wNyt1xHiMJQfLGMtuJOg8Yv
	TA/YNokXPL2CCESTiD6JkT9JdbxqQEOER3f3WS21fV7cMNEGzZgsgwR2Zzm/GJmD9V0PulJ8sq1
	PaavO3du24EedEJV5RapUpNpclXvEtvbZXNKw8NI0Qu3SZlRy3gdUzJ+fFOxb+BYcuK2SBbOeIv
	2XK1cgt0QSn+7+Bg8lIFI4W1/xcKguOM6ebP9QRq9rI0DZB6mPL9n4ql6cOT91l8i05rQ=
X-Gm-Gg: ASbGncv7XAX3EJpw5McHsskC2C6fUoRC4XGqCEGyLdvmsnx/Ns1Co9lPqoo6rGVfHQz
	JgnO0Joa71LBlyIV8eHbqQ83eCzWoYfifYa+/jyS727eJdAEj61D082lZZySK/Jou5AGX7oGh1q
	AuZnxCtrpJqF0OYXq6zQzPXnw4odFPpYE2cysJ4mkMSUgbFYKorghiQaMrlFVDbjqlix24
X-Received: by 2002:a5d:64e3:0:b0:42b:3592:1b92 with SMTP id ffacd0b85a97d-42b59398992mr14875447f8f.47.1763446530540;
        Mon, 17 Nov 2025 22:15:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy67zljjCJsl6gaoTDv0BkRcJmeKCn+3ODT94OVXveyqq33VR5bEkPW+gUoinAzA6fvk06K9aUvCDI/PTkmx0=
X-Received: by 2002:a5d:64e3:0:b0:42b:3592:1b92 with SMTP id
 ffacd0b85a97d-42b59398992mr14875425f8f.47.1763446530167; Mon, 17 Nov 2025
 22:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20251111124853.2916889-1-jianhui.lee@canonical.com>
 <589670a9-ac91-4fde-b595-473408b3df18@kernel.org> <CAGmiHmGiDngNCkfkwdoV8M0XjQVFEXTJekPAfuZfUFRui9gSbg@mail.gmail.com>
 <13d96b3c-4db6-48f5-b1bb-68171ffa6bc0@kernel.org>
In-Reply-To: <13d96b3c-4db6-48f5-b1bb-68171ffa6bc0@kernel.org>
From: Jian Hui Lee <jianhui.lee@canonical.com>
Date: Tue, 18 Nov 2025 14:15:17 +0800
X-Gm-Features: AWmQ_bnblymQssYaPsksjspkDuKcx6JRpIyOduuPX-K9QeLiCzChrXLoyPWaCP0
Message-ID: <CAGmiHmFVUqCW0xv2U0C++OJPL5-vLKG_Jnkw0AkS=O_6tT5OiA@mail.gmail.com>
Subject: Re: [PATCH] memory: mtk-smi: Fix NULL pointer dereference in config_port
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Joerg Roedel <jroedel@suse.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_221535_466133_D3CD3962 
X-CRM114-Status: GOOD (  25.95  )
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

On Fri, Nov 14, 2025 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 14/11/2025 04:03, Jian Hui Lee wrote:
> > On Wed, Nov 12, 2025 at 11:51=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>
> >> Please trim the traces from all irrelevant information.
> >>
> >>>
> >>> Fixes: e6dec92308628 ("iommu/mediatek: Add mt2712 IOMMU support")
> >>
> >> Add Cc stable.
> >>
> >>> Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
> >>
> >>> ---
> >>>  drivers/memory/mtk-smi.c | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> >>> index 733e22f695ab..8eb043ff8280 100644
> >>> --- a/drivers/memory/mtk-smi.c
> >>> +++ b/drivers/memory/mtk-smi.c
> >>> @@ -244,6 +244,10 @@ static int mtk_smi_larb_config_port_gen2_general=
(struct device *dev)
> >>>       struct arm_smccc_res res;
> >>>       int i;
> >>>
> >>> +     /* larb->mmu and larb->bank are set in bind(), may not be ready=
 yet */
> >>
> >> And how do you synchronize this between CPUs? IOW, what certainty you
> >> have that this CPU sees correct data and the checks below have any sen=
se?
> >
> > Thank you for the review and for pointing this out. Moving
> > pm_runtime_enable/disable to component bind/unbind should ensure that
> > the synchronization happens correctly. I will send a v2 to address
> > those you mentioned.
>
> Runtime PM synchronizes nothing in this matter, so I don't understand
> what you want to achieve with it.

The original issue was a race condition where PM runtime resume could
be triggered before the device was fully initialized, causing NULL
pointer dereferences. So moving pm_runtime_enable from
mtk_smi_larb_probe to mtk_smi_larb_bind with the barrier presumably
fixes the issue:

@@ -171,6 +171,9 @@ mtk_smi_larb_bind(struct device *dev, struct
device *master, void *data)
                        larb->larbid =3D i;
                        larb->mmu =3D &larb_mmu[i].mmu;
                        larb->bank =3D larb_mmu[i].bank;
+                       smp_wmb();
+                       pm_runtime_enable(dev);
                        return 0;
                }
@@ -664,15 +668,13 @@ static int mtk_smi_larb_probe(struct
platform_device *pdev)
        if (ret < 0)
                return ret;

-       pm_runtime_enable(dev);
        platform_set_drvdata(pdev, larb);
        ret =3D component_add(dev, &mtk_smi_larb_component_ops);
        if (ret)

> Best regards,
> Krzysztof

