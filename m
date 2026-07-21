Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422F4C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDdpB6ZYwZIlR+moMdqHy53xNfFlVy927sGzMiz2qu8=; b=hvXFY+qMdYeatmiJs86L9AJzJz
	ynb6hhvqtVr7eWP8SHVPtM7PRx1XLXjTPXD1bC0QIGVcPhN1/2mqiBb6G2GRaHlV+d8e/lc82Xe+L
	iLalLJzcj95JnAX2KOcjVZV0+EHgIaO0kqoDizAZPsAliFx7VJ8ZBa8BzlHwN1qY/ISwygh6PTOsz
	n45G5t8tzPUxSmw09irBrgMPYVhOKjomNyHKb3xcney//vuy0T7SxLagnM11kSHsFiG02eKgY9IBy
	WhZwx2G2xGA06u7FEJTMxMQEd/XH4/xAnl8lJH1IBBnDg7j+6NaO/rNos5qw7LSOhm+wxl0+GVl2p
	8IBhPoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Km-000000093JA-06bm;
	Tue, 21 Jul 2026 10:04:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Kj-000000093Io-0zGJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784628256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDdpB6ZYwZIlR+moMdqHy53xNfFlVy927sGzMiz2qu8=;
	b=fcUfOvBQ9Hxja/OGm+BLWaHjQscGbZ+/aMIhXLb0NqEVnU9Nsik806eFkmzcxH1r/2yJIE
	Z+tQi2jD+uOPVH6aomptvgknzYfSPDxuZeYcBANqx3qi2INpf7/sEyyeRJQNi2kUmuCW3w
	LrukOD2U9kRsWRK2aNxCqh/daeYBueg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-GrNlJ4CcOuWLi4ZaJRGrbg-1; Tue, 21 Jul 2026 06:02:51 -0400
X-MC-Unique: GrNlJ4CcOuWLi4ZaJRGrbg-1
X-Mimecast-MFC-AGG-ID: GrNlJ4CcOuWLi4ZaJRGrbg_1784628170
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f5a972b0eso4166499f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628170; x=1785232970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDdpB6ZYwZIlR+moMdqHy53xNfFlVy927sGzMiz2qu8=;
        b=iOyCS8JSCyhS/RMarlm278pvEkqPgntDqAbYUBMYcM6XkfsiT4sXzUl1YcwllQshsb
         snD3jdUda9ed75g6eDJCIgbOIwTPdjo0nUJpKkItJR2hrcrJk/Fk6NszjCHOmYd4hfwH
         Q2lKT7BpFaKK4SA2pQu2SK3B6GlGNSe8ZFN56eZiTQFjXVMlqKdy4s54tjsUmQeJKF3h
         l98hZlMy2HkLKdSpuOC0JmmuznnwDK73DU21ROsnHWK7i4TkCcbKK9+lVLcQL4JemwlV
         eR4jEQnLEmUz+Wox1joAPKc1T+ic3VDXgLqHmF2SZGu2VOSR9jgVcuXLYF1BsrTYbfjA
         H59Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNG3TKVnbhTR0Y+o8Exa1/j2PcbDGPCqKuMLfnNbMmJmazLtUp6Gz28Gz7+l0DetqUOswFCEQXHcnIfTJO9H68@lists.infradead.org
X-Gm-Message-State: AOJu0YwupI6P6XFjXRS3C4nO62fcdQ2XfEFc8e7vBB9IDDo7wrKaB1lm
	13O84rEdWDxPdlOiJuKao7zzRqTTa7a3G+ZPRxBVhjrOsjubOsp9MA94UmK6HaVH0R48r77aycv
	71zrab0CG6+wGEdUTs/8cMtFldwU8NRZ4/x9pmen3KkKPt6DYhgcW9JNLvES7qHmWJS2+VSi34l
	9X
X-Gm-Gg: AR+sD12nsSGE4jHw9YHvFW1OfQnoXxCUGjUAS4xQdL6HQIbzb6jjfwvta4TYJ67Cfj/
	1kF9/FZvOwWivR4FsbRN4M1PmXzw9gLFl9ubcyRimBmS0vVnI0R8Nq8nAdMDmJrUHMfxsu/IVW7
	FkPSGs3bwoEyou23r3d2SSdg5s9kxTMKAlLZv1DkQT+mGOxM7vDXJrzDVrpILRmNQKY+BTTJUyj
	+u6BYbW7HxeUmU/pBZT/tnyDS2eXtqVtruSqXUmYRI1zule+8UbFcCkF2evZ9WOkdsB+Gi4XPwF
	IiogNCWLFR+8QVcN23UBpHx0GbksA2opeSKMxPNkFh80j4AN0w+g0ekeks7fSwcZC1URwCpygKU
	84O2qCsqxUVvvJN854mCFElb8LrDrin9jaBvCDRfxQF8Wud2KNRDM5kv4htn49RFehNRX4Qj+Nt
	BOug==
X-Received: by 2002:a5d:5848:0:b0:47f:71a6:79c5 with SMTP id ffacd0b85a97d-47f71a67a5amr12529415f8f.12.1784628169357;
        Tue, 21 Jul 2026 03:02:49 -0700 (PDT)
X-Received: by 2002:a5d:5848:0:b0:47f:71a6:79c5 with SMTP id ffacd0b85a97d-47f71a67a5amr12529309f8f.12.1784628168390;
        Tue, 21 Jul 2026 03:02:48 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ce4sm38099290f8f.8.2026.07.21.03.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:02:47 -0700 (PDT)
Message-ID: <7e12f83c-2449-4618-bf43-acc533df3a36@redhat.com>
Date: Tue, 21 Jul 2026 12:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] net: phy: mediatek: add calibration logic
 for AN7581
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
 <20260708102341.53919-5-ansuelsmth@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260708102341.53919-5-ansuelsmth@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 918nJotGvCEae_xzL1DVhzyrPmmgRzLKB6GXyy8i5Kg_1784628170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_030417_364258_12E38582 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

On 7/8/26 12:23 PM, Christian Marangi wrote:
> +static int airoha_cal_cycle(struct phy_device *phydev, int devad,
> +			    u32 regnum, u16 mask, u16 cal_val)
> +{
> +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> +	struct phy_device *phydev_p0;
> +	int ret;
> +
> +	phydev_p0 = shared->phydev_p0;
> +
> +	phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
> +
> +	ret = mtk_cal_cycle_wait(phydev_p0);

The above call causes a builder error at link time in allmodyes config:

ERROR: modpost: "mtk_cal_cycle_wait"
[drivers/net/phy/mediatek/airoha-ge-soc.ko] undefined!

Also sashiko gemini has a few points:

https://sashiko.dev/#/patchset/20260708102341.53919-1-ansuelsmth%40gmail.com

/P


