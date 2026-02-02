Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E54E7DEF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=; b=FJPUys8a9dhF2ktzkeRRQqWlIr
	qu/DoulMqGSQti5butLTTtm1vjxAkQP74Q18IXeVarL2bBgcoUI7I63XqTcBgUMhSoHxGD3dtwkl5
	Yl67AqroTjnvNsKpF6VkxqFqEFZJYQIniNq2iA2Nx42ByJyHE9HgiyM58pItmLusF2nLvaYU8vdyz
	rDYP9CgtNpVKRaQT8edR+2IBvpWNw5BnDLNSJRQFT8oo4uq5UIaz/VV2MZHakHyOCiMRVWUPnllMw
	WNjh2PG/lQyXvQqXhdgoaAdhl48JEcH+JZ+eg38zLqxP21wKMr+ryJ3ruh/ri9/Ng5v4B5nBevHhI
	5/e2NmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvPx-000000058xk-0hAm;
	Mon, 02 Feb 2026 15:00:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvPq-000000058w5-2m79
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:00:44 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so4474973e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 07:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770044436; cv=none;
        d=google.com; s=arc-20240605;
        b=JMwkNPcru97xf/D1Lb6psTGnKfOlGX0Una2Ff2nx8bKaFat3aK6c5UP/ibQWfS/ykK
         4YSiV/IhPn9LYjiT+OLDpJZQNoGmHw6cQQZxITXtVUAH62B6kIWlFP7UgUZ67y37SyZ8
         zJQjL/mAR5UHXAZjx2onG6UvwmtGwFJku5Pu4haMN7sTjYjlpn0gzuCn1Efg6gcksikC
         hNbLP0lkPZ1Fv0Emip/aZvm2gA6nIzWYPSukiYgj/lXgptKJe1D37x8l/VtXbaM/cAnF
         xo467GqmF1lJzOXXCeduNjAjbivYNxpQm+tJfALddiPV91N5O0K3CHERkxnq3KFR+u5/
         2Y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=;
        fh=rZPxir/ExQVwYVMyeL/VZo7YvBiSBf6nayhfMQgFVoI=;
        b=Yq3GqkTOJNYsrBjnBPW2WBQO5J8KCs5AwiUYayhP4H3htdKgzeliztU7r/wO2ujrbX
         YvC8jJsrJyyHqPxHrhE/yqNLHzw6pRzK8gCEJS1QWIX+lFid1X/ferAIOiuU81Rz4+3c
         FC2CBwkSY55kAIjEtUCXN32n2pvw/UClgcce3o5ZNss2X/5BlOxxY3s9rlQZHDArekDZ
         66iReUDeitedKwLrQCYfA2No5oa4fc0LfNZQGx1J7QTa04e7Lxa6QruCa+I/HBNZN5op
         YGRcT6S1G+hgEmJfZp5L+ZeI8LL8k3+EvN/t3bE2VbuxC3SeilXYF7e/GlV3JZEQNbSY
         87UA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770044436; x=1770649236; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=;
        b=UNzYblhH/fOUNyeKpH5NoLSQqvgREbP//rbyMzmk6P88ED1+w3fQOvze3/mysERL22
         538C1RUReIlo9GoZ8T7i7bEkxOE8UKgmI6n2zKTutvy/eAsZbRzvK6YJfaW7Vzwvr0+h
         Yysox08Lr5IFyWD+eaNPPo/RsdL/e0LwDpAK9Sdec0Pil3P7LzLNHkqIU+wYSs5JenxU
         03hZX0mYAKKCiLFiiMhjEt72j6PyorfZNWyIPz/dw9FCqTxSAx5f0qAD1U8cCFzz2T14
         CefaBKQJnbA3mpQsYv2ZtvnB7sCwOxM6MwzxwUM099NXNC1/5fDivutwQG0d9WmvHNlz
         oYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044436; x=1770649236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjY8IMEcwraRaAcklulnPu0XEgItry8qPQsBSr8viBU=;
        b=CCRlh05pMho8XNJT1Rj3IxIZQ+OzFfG5egQlC+e53GkQtK3Dt8TsDmEsMSOEe1O947
         B0QYH2K/yaOhHGcuLczK7WQbH07bY75naQyM6KoOQaN6DioWNuCYR8hHVrodBHQvO7Id
         sAWOVZ21oIVP972MET9TRM7x5DFAd3ZSBZNwn1ygCZ45OuM6+u6zIly8kS8rXufWLDux
         AJ2SVUX8e5chvPDEcBWhUfDphMsAJ/vEH6ttE+QQEOObL9rC2c41T0UQfhPBT5lPPzz0
         KWjDcsnfcjxMAfe6uRc3ecDUVkm4vWsIu4PmGPnxM38VCFE0mhA88pKMpYisZGWBRQKb
         Lecw==
X-Forwarded-Encrypted: i=1; AJvYcCXRjSqgUpo+EJ6h1aG/tYgTWPBcj+Pjq0UTbG0bKAbNqD58UCmu4A2ftH5i59I5+JRopaWjfN48XvQ9UdEt98ng@lists.infradead.org
X-Gm-Message-State: AOJu0YwaHY7lGExNahlPUJSKMqBXnpaXdYEVbx5wfzASY6fF9sdgo4/0
	03NjcQ/Aqzl+VE8tuQ+oNI6taiHtXyIA470/QgjAMjVe4vXgZbhACEHvsGMy+N2vC9WuTpu4HMT
	91FBXYWZ1b8TFaLcU40ZI/DxIvi9fBmLq/OG6aWoR5A==
X-Gm-Gg: AZuq6aJ+ousAD7wASD7ZggMSK5BjWMq+MO05JFcp7bORGGjy0GH1bn88rnrLp0txJRr
	EKK+LSkM/VtKkv2xQkpWjLv1fJ3B4rYk7qFXzeRskzChIZ8RSVeg7OyJe55QMw03ZEBi2u8rGd8
	4ejWFOJrQPlupBBt79RQ1w2lQCSaEa8ACilDPwqArPDpuUveKKcI0XRyOYYGVyhF3hcQPX/cf+y
	1TrEI/T1c1TcRkiFt9j2HjSrLhoAxBpG/5hF959USz+bxKwrtsheXWpaAfKK2VGBVHqpHr8
X-Received: by 2002:a05:6512:1114:b0:59d:cb2c:9b60 with SMTP id
 2adb3069b0e04-59e16443c8cmr3908427e87.40.1770044435428; Mon, 02 Feb 2026
 07:00:35 -0800 (PST)
MIME-Version: 1.0
References: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
In-Reply-To: <20260202064820.347550-1-irving-ch.lin@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Feb 2026 15:59:57 +0100
X-Gm-Features: AZwV_QgUchHwCanQC14NjkrQfkr08G0f7AUahWDnGm1YzWor4lHgCWR2MlI4fGQ
Message-ID: <CAPDyKFokrMP05rqbACON-ov+=diKpRfxywEqyuJHNnUk72L4kA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for MT8189 power controller
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070038_805245_BADA4D48 
X-CRM114-Status: GOOD (  16.48  )
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

On Mon, 2 Feb 2026 at 07:48, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
>
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>
>   This series add support for the power controllers
> of MediaTek's new SoC, MT8189. With these changes, other modules
> can easily manage power resources using standard Linux APIs,
> such as the pm_runtime API on MT8189 platform.
>
> Irving-CH Lin (3):
>   dt-bindings: power: Add MediaTek MT8189 power domain
>   pmdomain: mediatek: Add bus protect control flow for MT8189
>   pmdomain: mediatek: Add power domain driver for MT8189 SoC
>
>  .../power/mediatek,power-controller.yaml      |   1 +
>  drivers/pmdomain/mediatek/mt8189-pm-domains.h | 485 ++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |  36 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   5 +
>  .../dt-bindings/power/mediatek,mt8189-power.h |  38 ++
>  5 files changed, 560 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
>
> --
> 2.45.2
>

The series applied for next, thanks!

Kind regards
Uffe

