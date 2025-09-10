Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7894ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0UnaL7L3IAHqWgKBL7OUft2gs1327QkkXhfhIjPFV6o=; b=Js2nZfOXlQ7dDbQaJeO/oo3c9b
	bvykMxNG3neDjaMZPPjbuYzZPUmPtjYP08Vb+7pkeN0CJSem/hhdPxcbjXhnaPr1gfnvR5IuaB8Hh
	fGbOChBIP9DNqFEZKodryyiVpvOLuLbZzk3fbWqFH/1MFO6f9rVGZ3rPtbKcq1OjXcyU+kEyo///R
	0HxPvBmO89iF5sq4vu/gprGrHprInHpqNlopVZLZUsrVBvuPuLIi7T00pT/T0IFFdYvxG+wEoaJ0G
	TdJAdRRpzxP3cSrBt0NpB9Bz15YyK4R2HhxAqHSM+0CDmWumU9bn+ImtB7pif1JMPd+sKBPBmsOx/
	cArBK+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMP3-0000000EyBg-1yVf;
	Wed, 10 Sep 2025 15:06:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwMP0-0000000Ey97-3BHf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:06:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so30434985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757516789; x=1758121589; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UnaL7L3IAHqWgKBL7OUft2gs1327QkkXhfhIjPFV6o=;
        b=DxIgX5t42yHMYFmsvx1iCHruLFlKNr2D6im6VVcq30ifRmCxzQrta3T+KtSEmG5AD3
         rGBpfz6YARt6XOBIXIyR11Dd74devoAPg5l+kaWeEPT/48uRkiGyvftr9Q4sRUfAShV2
         fa7bRIjxJMAHhY54z96NP9ACu2rgLDiKebdm/FXRGepeMrLGYTPzSwjeFwzYmKQPCn8E
         qiZw/bOKU+46MQMJwosJNhWrz7cqTl0jE9knVvMDbwKrn70m/q1L00bNPZtkdiiohQQl
         w9UPkPTDPZqh/N0q4lea9Uksd1b67+Hza1HmU3qhroTa5NyM4eCknR7sUnOslB5V+Ir0
         K5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516789; x=1758121589;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UnaL7L3IAHqWgKBL7OUft2gs1327QkkXhfhIjPFV6o=;
        b=daEiX1nocn6HvJ1T4R4K73rjH52EUhUK9rvaOAPlZxfKaWNDvRZ5AIHCr0Az9Gejxu
         SgkZ+aEWTb2TPazZH6O2+fYY8oY7x3K2nb1iBa65TvpYdxTHXIBTXb+pqVTv9/v80UC8
         alxjxU1WBoTZhr8Zpcr7Unl5+7/rvjMUFw3i7umxMh3tuymgdwiSzuhdv/cJVT58WI2T
         ckGvRw5mBEhMuFtLxhRyEV1g8evoXXlV1yya/1mbrpr/5B+HSpTSBvqG7evBrqz8VMAR
         reJe4eQgHv24yJu4k5ijseu7+jWvaCbycD+chUgQZcciduc3qHnJbodM+BtzAZRKnxV8
         kLXg==
X-Gm-Message-State: AOJu0YwbugWxnybePj/KHxhH8XIKqFLtc2TfHDX+fHyRVkk4GDw5G6bU
	kme9wHUo//OuHYspHRp5kgcVAL0ATsevUGLefxO3365lNPBZpyuuSG9ei0y+Iw==
X-Gm-Gg: ASbGncvSTPVhzAwMqJ8hfFLpClIEUkru0COwSv6Hg2c8M+gXdJxmndTQZ6+DlH2jFuc
	+X7Ep0s1tYH7NI8FXfH0O8u0Y35ePMlUtjJ/ikIr5b01cSyuRE53dpKAn/Dm6iforJsBL90AuY6
	hN06C3rJ7iJNkYdiJqZwB4B1BdPN7L4RzH3irI4YBJzaYlgpPWBs7ZqiHvJkJC1dHHgb7tbTuYX
	TDokvs3bNNoHnp71GKanVrr2XyvvR8atuFRh6CL8f/UtaSiuOguEM1Mpf66tnJ34Ghxujk29+KD
	Ol/mTN+11grbfCge5+DeetVDwyYRUgNzUlocBIpV+1VBLLnctthhQUJGJnffoptIp23Gf0onDAd
	jf7s+F5DhPySJnYyEEzAz4v67NdXS4grTR4Tm4JuyT1v8FdlGpgo02wGdgx0uczSUie4ZLM1rOa
	j/AlwV4Ls=
X-Google-Smtp-Source: AGHT+IGq5osJ3J2x91mbxuEEfrKCMJ5N4iOk1oE53+v9RHLdB2gEeP+duRN8zQkcsOJUcykGAbmisg==
X-Received: by 2002:a05:600c:468f:b0:45d:dbf4:888a with SMTP id 5b1f17b1804b1-45de6da472cmr98217795e9.25.1757516788469;
        Wed, 10 Sep 2025 08:06:28 -0700 (PDT)
Received: from [192.168.0.24] (static-39-127-60-95.ipcom.comunitel.net. [95.60.127.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d229bsm30924245e9.9.2025.09.10.08.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 08:06:26 -0700 (PDT)
Message-ID: <87c8f50b-90a5-47ed-af60-99a4e075a266@gmail.com>
Date: Wed, 10 Sep 2025 17:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek soc driver updates for v6.18
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_080630_826885_6D446A45 
X-CRM114-Status: UNSURE (   7.30  )
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

Hi Arnd,

Please have a look at the MediaTek drivers patches.

Thanks a lot,
Matthias
---
The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.17-next-soc

for you to fetch changes up to f1a68ba5739e42353609438e27a83b08d7f5cfd6:

   soc: mediatek: mtk-svs: fix device leaks on mt8192 probe failure (2025-09-10 
11:48:56 +0200)

----------------------------------------------------------------
mtk-svs:
* Drop reference taken on probe failure

----------------------------------------------------------------
Johan Hovold (2):
       soc: mediatek: mtk-svs: fix device leaks on mt8183 probe failure
       soc: mediatek: mtk-svs: fix device leaks on mt8192 probe failure

  drivers/soc/mediatek/mtk-svs.c | 23 +++++++++++++++++++++++
  1 file changed, 23 insertions(+)

