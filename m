Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A6DC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=; b=mN4d0GlT3E4dUYz4OmyuRJhi/E
	r8Sq62sTvZ0bvN46tBY6WmQNykJrCtXxtkDjKNsogZlmFH0R94zJfqD3xlSnrVeiveHu3FNz8SbWA
	dIBCdxdse8AJU6RbWZ1SoXE+XuD9tllZ51y0NNRAiGJEJUnGdBYhyE7QsfXv7lbkf5mmT8cAS/gL0
	hCjlUxawz3nc6S4V+r0jc9D6nM3VD8TqEjAOJvf8iITTBjDHUdnaov4FSMzCAWvBwTkrsvdZ1lBqx
	UKP7baTwHN7ju7KO7ssE4o1ULJE8gIrXtg+I51VWg187CSxvtFgT2VAVf5XGYu35fVy6Yq1IrJZQJ
	owT/213g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x696W-00000004FJU-3CJE;
	Mon, 14 Sep 2026 16:00:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x696W-00000004FJ7-1ZzN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 16:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=; b=F9OS0gnTdcwx6c7j/3rMyp+62x
	llTX24AQIauYhhHSpmXuXFYFCKBojmduRnP+wUqHFrzY/lJChpLlnWPm9aFz5ySJZ1NaLQUZVBIhx
	l6pBypujPS273LEgsc4Ri9Nluy8S2ysKDIKSVjH210yBEioaeHAzzoxCxH3VFBd/Hqdz2pROzAypL
	0wa8nLwj9tdMJf9v+HOn9cgfTaQ5Hz0LMMTawrVD8n3IJYxsGMcuJGmjPEszSDDddgiOj+sUWfc48
	0Fop1QL4Cy94NPtkkRWbPh4m8NlrqRApyzjFAGBvLczE3I2b+wWS47AiZvTygxXMjr8FRxqsoMeTm
	j1SYCa/A==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x696T-00000005oUh-24gb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 16:00:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c253425b253so546569566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789401619; x=1790006419; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
        b=hN9Y2HB5TZBbs5TOxf6itUwITwxSu+ORH6viokQpWvv0Shv3G8HH1C8vGJ14D2cU3V
         in7Lgz1a9EBQ7trQfaKnaaqQOspCOHRlEyauEOYUTo04NNsTiZe1mcVen3D0ZW2/ExQo
         74PHAm6JDoupGfYQYRk+Bbmxw59cv0r6m4ccPXGE3UamviT9dYDK3m9bvqz8+lXjnuJ1
         lszvLZR4LYB5aNAJTMUEVJf3CMs7M1qwU7f1aFkeDdfT2ezpQKdlkQbkakYcjPVjBK9h
         I9KStugpgvV4UiaarU0Jppu4SnJI62WBOpPVs5/oay1rw108GA3qOQAIfgVm9LdyTU0S
         U11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789401619; x=1790006419;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRYbluNPP8AMPvjs11ldgv62V308J1KXRstC2EzoBRY=;
        b=aZp/swMwK9cnaOOPy6mnk5kKtVguI/twKB/SszyaCVSJWg705MauwLZbS/DXa2BW3p
         tfygQ/9WejrmBURV1oP5KOaHcoVObOoC1Dc+13pQIu8rEkZ/LNwgXZOyx0qoaS2N2eNb
         lGjJpMq9fXYjyhnmAvJ4oIeSYmidINFbMBC1c7ZnaOOk9tOCLRloSzKmNb5rWSdERI7P
         lth9WDYI77zD2TVcrYkNpLPlJmO0WNS08BFqOu+74ZcLAUSYakMCjPy67OjzbivW0G7a
         gLGUUAYppY8iuqkHq1HTav/cVxO7TJOD1N2qG/6hofBLDIZmNJmd1Inj36wpuZYR3yNO
         /DPA==
X-Forwarded-Encrypted: i=1; AKwUvBy5Sg6LayPljbIQ7l1O4ydWDlCyX/oh28voIqn+Iqgd26aa25CW3XeG2m/yqdZUCqtzyTekdieDgcHRIM3e7I58@lists.infradead.org
X-Gm-Message-State: AFuF++kjvXChh6VTD9C5rftQAH/VE0/hfolRjw09NkzyhvDay58Y8Bdb
	WhrO9YREBigKCH6VmknCD3VWBncdAvP5hF2DUN0kyL5CmrcoHNVZcSyvnyPhS2Yc3zI=
X-Gm-Gg: AYBFou3eYmCOYaifRrdGGrQqc+iy6twGKEeRWMJRInqJI6dKq6Bbu6J6lP5DnnCn+ze
	fN6HX1ZBwI/Zwl4rprZp/60Qp5iUJ/xmYB9m3uOImpnu2/Qv4+KYtmxG9w3hxZhorJfL1MkAHNf
	ITlbkl/qo1VzLTzPezS/G9nOYXLbNA6FwrRfZ2IWOx2BaWokKnYjFuOETWvSwc8MiCJyfhoDf8t
	jqKP2zf51gDPQNTpGsS4d05oP/Kh5x8QBND4a3YttQGbv7bHHjwcfE23J0mPI6Cd+2eRnCYlldz
	jdMds/n8gaJlPvi/RClGx8XdAM1okflWiCR9FCKCmh11cWIw9lu/mKCYE9pK2dpElNmpdBjkJsV
	KYg1pPAuo6SH16r7Y5zXJokUjKE0+tx/EpubhwJD9PdLxHPkn7yjk5zzLSBR9MFreNCr+IAqCUO
	E5kgM5hiktwONx7dvL/C9rKzHskUD3AARyP4CXu8HJ96IR2Eo10zWvfa7DjrawLQJCgXVneM0L2
	zg=
X-Received: by 2002:a17:907:6088:b0:c26:19de:9ae8 with SMTP id a640c23a62f3a-c29b8734e64mr227554866b.39.1789401619322;
        Mon, 14 Sep 2026 09:00:19 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021d0dsm467443566b.10.2026.09.14.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:00:17 -0700 (PDT)
Message-ID: <6d3fd2d27eb54a926486da34947e843c0f29253c.camel@linaro.org>
Subject: Re: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock
 failures
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Pritam Manohar
 Sutar <pritam.sutar@samsung.com>,  Sam Protsenko
 <semen.protsenko@linaro.org>, Johan Hovold <johan@kernel.org>, Peter
 Griffin	 <peter.griffin@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 17:01:36 +0100
In-Reply-To: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
References: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_170021_620248_266CC517 
X-CRM114-Status: GOOD (  11.62  )
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

On Tue, 2026-06-23 at 21:53 +0800, Pengpeng Hou wrote:
> The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
> the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
> path dropped that result. The CDR helper only logged a timeout. PHY
> initialization could therefore still return success after either the PLL
> or the selected receive lane had not locked.
>=20
> Make the in-file SoC-specific phy_init hook return an int so helpers
> with real failure results can propagate them through the existing PHY
> init paths. Keep the register-only helpers returning success and use the
> new return path to report the GS101 CDR wait failure. Other SoC helper
> paths keep their previous success behavior.
>=20
> Fixes: 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos USBDRD 3.1 comb=
o phy (HS & SS)")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 78 ++++++++++++++++-----=
--
> =C2=A01 file changed, 55 insertions(+), 23 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

