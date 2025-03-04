Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A134C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pA6zLWQ+dYJkLtBz+wtBiNsIVYV44LsyhmBHfgcYN+Y=; b=bTB0wNrUJji0oYfQZGit+Mt/JE
	TVFp1jxmZcCsHVKw27fY2ynrP8jAUIq6ePSBrL0gpAfehPXjslqzbOTvetmghf1VmMGxwzJbhv0YE
	Qto1g1MO/uSuUta5hE0eZ/p/3Bbr6xxkrwQSwoWqqDrXLLnNLEsEG9gUlNAoWo8re97Rx/JnqSk8D
	1O1hwmxV1XVht/A0gEg8WN3vPp6PG8ljqUxOhgdSPiFuzAQO0Yc75WXWFD5P14n7KIjMvloDzVqtz
	NJbbDx205MxbygeiTVFH0w5M5KHLO5VeV9FRi8gMqPWXRx3nJZPhm8qIjQ9TnziuqPVYusiElWW+L
	fFw70yaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNKG-00000003ZTI-0Vpf;
	Tue, 04 Mar 2025 08:08:28 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpN45-00000003WUK-45WI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:51:47 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-548409cd2a8so5521145e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741074704; x=1741679504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pA6zLWQ+dYJkLtBz+wtBiNsIVYV44LsyhmBHfgcYN+Y=;
        b=U+RwhPbAWt9MyixSW68nN5tGNQwp6r/qGWYlFOTxJvTkJTN1FiLeYz2XQlOdB+n7Y3
         YxSXM9nkyXBkjX2c0oma87vfR+Xfi7lAPIP+jLJm5ZxSR57O7XKOhZJeaqvOA823sjCG
         s23kCAZPEjqb9ipjQBaX+S3YQGfDP5DX61ftAuxO5gGUufjNnkVeKmV6nbf9NR/2BKg+
         3CBsGz5Uru44L2WHBrxg1YBAC1AGCtbLFqyNp0DQ+1GucegpbY4gHrwzQDN9wKkpFJO4
         m/wy3ehfMXVAytGEhndXcOnfPPGPHdNL+iUU/a0XKHa4uBgFBTyPkRDuNioiEsft8p5p
         hQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074704; x=1741679504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pA6zLWQ+dYJkLtBz+wtBiNsIVYV44LsyhmBHfgcYN+Y=;
        b=Jfi0KyDTRbfJIQ4WrXAKlsABRssr/wQtWOHInjvlyuxoXLMnFOhkYmm+6q1omn4It2
         u5wVMMFWLWX4GLv+crK/huWJszHsJmOfIuXyLy0YURXSAzJxSc66kBhb5KUN6rPu/5QI
         mfNlPgaYiYREcHeUf48Viebd4HFuOpNjXenWYZjMGtfrDNCmK7hrTHhJlNvumqK9gons
         cvKTCE0MEsIaQibDE1tyXDdGNns88tJQJOq39PbRXhkb3lsQdeqJlbQLF/+7LlsP8GBH
         30Rj6V3e+zEpA0RBy564OEuFBS72tFAMpk0bpnHTxhJ/HAjRIaJoWsF7iCtdmZnvEuQm
         DrOA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRXgcpOAjizymtr7zp+ju72YwR6hE6hUrDe/DaKe9jKKjJr6BMuyhZRUUodOxwjMFqq4vrIy5LomlqymdyJ+t@lists.infradead.org
X-Gm-Message-State: AOJu0YzZqyAbyP0iF9b/IXHSV7kLOkZWGD8oDDpdpAKpoXLDgGfglecj
	AIerPwWfj3TCBfuxhyMrk94l6bvvzzRn5Vixd+Al6XcaUjd51UZI6gQ8HWYCEAbXNyfaifJUCJH
	UuI0WKQsNSG4VSfFgfUOw1ay/mfRBf5w9DkGoSQ==
X-Gm-Gg: ASbGncuT7cFJg1TFAW65uMD8jNbwPbyYmobFrPwfZk2hACA9EhEffG35HQkgdUEcLOH
	HSO43TfWUUrUu1ETBNoKKZ48oSBXj9ygCxQjw0x+6kALDKKoH0x/2G0/MeXV66Xq+tXfhpCuKvn
	iFqVVq2Xkjt+m9mHJQqp6xMz5WPQ==
X-Google-Smtp-Source: AGHT+IF2HnTvgALEagtidtwMTknG9FoykhqBphkMLjIu+urEhq+snaAKQPbxfAEiEdOYOfpEU/z8RIcNqZf0RTZQZA0=
X-Received: by 2002:a05:6512:1292:b0:545:c9d:ef26 with SMTP id
 2adb3069b0e04-5494c34fcd9mr5744703e87.46.1741074704091; Mon, 03 Mar 2025
 23:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20250228064024.3200000-1-jonas@kwiboo.se>
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 08:51:32 +0100
X-Gm-Features: AQ5f1Jqk33uHsY5UV1F0bE-LoNlIC6DrZiXxoZsYoJWU763-1spk-ecprSEFCuY
Message-ID: <CACRpkdaELuU6XDKacOLsWAF8ncbudJ9Tp0jykAyf-NXRLjoSdw@mail.gmail.com>
Subject: Re: [PATCH 0/7] rockchip: Add support for leds and user button on
 Radxa E20C
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_235146_013161_B1A29D0F 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Jonas,

On Fri, Feb 28, 2025 at 7:40=E2=80=AFAM Jonas Karlman <jonas@kwiboo.se> wro=
te:

>   dt-bindings: pinctrl: Add pinctrl support for RK3528
>   pinctrl: rockchip: Add support for RK3528

These two patches applied to the pinctrl tree.

Please funnel the rest through the SoC tree, it seems
it should all be able to go in orthogonally.

Yours,
Linus Walleij

