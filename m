Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71528C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 18:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ1koe0FoGKZWlSKLYl/usYRXo5FiitnJD7Hzawo0JA=; b=0gUr6tFWaPsUYHqZ100gsawuDj
	VFEF2sonrXMD59tMM6vVCU1j7nYBRUkq48fkZpQpA1/6H9pBeyADvv7pjcT6ke063ciYIhiTUFVir
	mZcAZEfr/DnqP4JSxFgn+q+iENs0IV9NWlA8k5+3VKP9sl468+l4kJIfg6ovR1l8UWBnWGwVC4aOG
	4fCDU8umi/k9YOnajH4ujFHGgsI1zENj4sFTU+PdgNYknCv0nY0IYJJiLN8+YpqHfzjtYFmZUka0V
	GJSbAnaBKnlq9yDDv3Wz+l0TKaZnKKF2riFRWvSdzr2ma3aNtA1aM53u4fzsrvpVeJnFZWmapElcU
	mHSRCbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4cT-0000000Fi77-06BH;
	Wed, 15 Jul 2026 18:46:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4cQ-0000000Fi6d-1dVd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 18:46:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-471eeac43bfso5675253f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 11:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784141163; x=1784745963; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NZ1koe0FoGKZWlSKLYl/usYRXo5FiitnJD7Hzawo0JA=;
        b=rd54WuaJIZTGhCPi6oRS+53TT83i5RXgMIYZJMe7lZpz28ePxWuy+i0kC8B2UfQ6xU
         VQUVMSZ5XDyj2o/sAujxM8/bSi6O741YfrMfHmUKMSentpxKJ32oKnxWlQEIzcL/5SkQ
         OrXHu7/DKLlkBX2XrTPMtZ9HwxQXIBnvhW9nNW9tEnasYFNC5aPkJ+2UzMCT8mlhkkRr
         DU9cX/zQgn0NvwJJgccf61pMIuyD5hdg243fTOOVYV6MIGVJ05Gf4hfFXgDp2yJgiVMW
         8ViRdnivSubxhmt1dfZjyMflkdMQ0RvMAAIDO3F3k1mObOoo2I5kJSVWYTqMWqi5iGnr
         PTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784141163; x=1784745963;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZ1koe0FoGKZWlSKLYl/usYRXo5FiitnJD7Hzawo0JA=;
        b=oNB9pnTTKf9R3G6XHnctOhLlt/txEWgRHcbkfEq72eDUno5+PcMheHPipryuJrmfp2
         rqjZWIT27ff+AI7lHc2RZzePXEXPLjtv2k7jiWW4UiDBmWNgQJQxejRwBg0SiVf/qr0L
         M26wZfZ4243N8urLhmhBodRnCef93CsObxo5wvXSz50eqnURDFj2bUKoyIp8+gnF1+JQ
         zdPE/fH9EuaG45dPAkFU42NKSMhmqDLtKwLCZyfgeiAI/E1GOIhvhICapHMNEDBYLjXD
         tFbx7+c4FDIhqqX2BayD24K+54kniKc2pFhQTx8q29gO0g4QjvPpWmMGhkhWIKRswtuc
         ntTw==
X-Forwarded-Encrypted: i=1; AHgh+RqvpieBl6WPkoWdfMk8mPDiBKZ4L9WhJDKfRRF4s8LgjQf4eaZ5KWaqz2PEN1250P1iiaXc2Byp9PEpkFMHcyEE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqen1RZR/2H0l4Nw9N7EcAMb2Y7eRdXs9GhyxqWVGNT02WGf1x
	gIoi01upEs9gfRXTmrwG4UOpSfDJaB2mTqRsoR3U2tuqBcWcDaFYtmyZRRpmAV4lgxs=
X-Gm-Gg: AfdE7ckek02S6onG42EJZwFZrLU3Dyrmp/qbbFiqlTB/D5oGHGauLZHlcSD3KphKGIB
	jGYTRpG0RMzI2agTtCQW+ljWDklHskJXR2HoB1yqpiCBf1dB5MYe966CauD420coH1HY1FMNMFs
	83IEa8Wp5dEAgYocAv2uZrmn1l7zah9Sq8QatIUojD88MLVjcCfyqGUsYXavY8VsogBD/XnXhqy
	jvTbIiAgKWwLMMwuVbUGzX+GYfYs9TO/gwYWP3X38DDp7fdQiV9htP2H35OBBJU6puqi4+AqQOd
	RYzq4oxzVrZGnJiUHguYO+ZqFPg5Zjb8B6vT1V+vQIJxXYltQGRdvAILtMs7u5mhieeKam+UmdN
	wbhUY/KuxLD0cEcdkabDM4gf0+V4HlxE/Y/xbbxivY2/9LHISDdgjjUU9MbUxFXjGtMdp6nRfF3
	bwpAVrPmHbaKrQM/UABd49ZRDFcNyTLfah7jYRwvm92+LO4d7OSU9WcCmON8F8YQbyQlzsqvl4t
	g==
X-Received: by 2002:a5d:5f09:0:b0:47f:4e46:e9e8 with SMTP id ffacd0b85a97d-47f4fcc846emr4872875f8f.6.1784141162784;
        Wed, 15 Jul 2026 11:46:02 -0700 (PDT)
Received: from localhost ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c25b2sm18639255f8f.30.2026.07.15.11.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:46:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 19:46:01 +0100
Message-Id: <DJZD9AJO482G.30HLO88FPQ7UZ@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org> <20260605-exynos-pmu-cpuhp-idle-fixes-v1-2-0cd05c81a82d@linaro.org> <CADrjBPoHhiNTfBsEam+=AWVc03mbQt+E6gm5Dw0fo=pH-w4Uuw@mail.gmail.com>
In-Reply-To: <CADrjBPoHhiNTfBsEam+=AWVc03mbQt+E6gm5Dw0fo=pH-w4Uuw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_114606_471052_EC0C78D7 
X-CRM114-Status: GOOD (  12.83  )
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

On Wed Jun 10, 2026 at 11:58 AM BST, Peter Griffin wrote:
> Hi Alexey,

Hi Peter,

> Thanks for your patch.
>
> On Fri, 5 Jun 2026 at 21:19, Alexey Klimov <alexey.klimov@linaro.org> wro=
te:
>>
>> The setup_cpuhp_and_cpuidle() parses the device tree node for the
>> interrupt generation block via of_parse_phandle() and decrements its
>> reference count using of_node_put() immediately after fetching the resou=
rce
>> address. However, later the intr_gen_node pointer is passed into
>> of_syscon_register_regmap().
>>
>> Fix this by moving the of_node_put() invocation to after the
>> of_syscon_register_regmap() call, and adding it to correct error paths.
>
> I think  using
> __free(device_node) =3D of_parse_phandle
>
> would be a cleaner/simpler fix.

Yep, thanks. Around time of sending this Krzysztof also adviced to use
_free() in another commit on maillist.

https://lore.kernel.org/linux-samsung-soc/c866dbcd-c211-48df-84e3-f66785ba8=
538@kernel.org/

I'll update it.

Best regards,
Alexey

