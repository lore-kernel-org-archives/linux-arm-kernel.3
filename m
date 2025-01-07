Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F9CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joH8dqPFxMW8rMz1XO77xmtl/YHd4CcIpAtUzKZocZE=; b=dJHFktuAUFZVvaOZZOAzJIMXOY
	qvefP3803xXus7iXxaIE57n97wd/5j9g1jJr+WD6XA8q+BXr2Z9wSmeUXj5TNKMaq7eia8RK7dy85
	KUhuRfZ4jgOlkVw2b0FPHAqV4dBcoZXiDRp6dZ/2Cs0L3/MFXW+fd/IcfMY6twJmnxf+OBtUoMHLS
	3psq6+5qNNJJfzhCXqzC/mAb9/wBlPxW5adNhkohkn2Z6N2K3d72mpUdOLQEhpEmGwstIlPk5qGmD
	oXszbLzZcP+YUDiZufqCOtfkt1BVJoDRq7rTbU6oeWeUrMjXywgEt4HFA8L4iqBPQ9GHAQLl7HJ5i
	IgQWHBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7Wi-00000004VX1-3Z0r;
	Tue, 07 Jan 2025 11:13:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7VT-00000004VM3-3Id8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:12:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso111157345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 03:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736248338; x=1736853138; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=joH8dqPFxMW8rMz1XO77xmtl/YHd4CcIpAtUzKZocZE=;
        b=tDOX0B5LuZ3UZ5CiZ0BNRuESr1z/DYsc0gC+WUSzNoJtO5FZe2/NwdsMtw3GnCojnd
         Oo9RvP+4NionqesFsb7FrARWe+nvP9AlV30na1184nPgDuzvh4/uDH4FsOjrA72s4Fjk
         J9MWYhagTSidziaP4/LXsDdY61qFw4rHivGERYXiBP1czkhQXtOVOA/uXI5woKMJGatk
         3QIjnZ0rNXXD1P2EA2X3mlFknX+JnKptzuzXhvCMJJ4XROZeMDWSmcg9/XS4x8RNGSlZ
         BxziaZMOnuIfYUxMUf7rbxr5DotypDmK7/sZSWjaGExRb/EamPv8th6dLoOzqaBcYtXH
         fxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736248338; x=1736853138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joH8dqPFxMW8rMz1XO77xmtl/YHd4CcIpAtUzKZocZE=;
        b=rA/CBC9rm1LzJrUVPaCjCdFvuXADtjhBm0WCgf3p4ccws0OnAyt62wDi360psS0n+d
         IQp7WGiJ4DnLvZ4872qkRMcVTJkg/eMoh0n/bGsFIpHcUXQGV2nj1Y4XQf0XpcOP6Wye
         zPB4JzEQL7JQ4NJitojWvuLEubll0KLkb8WkvWRm8VK6sEkYq6n57O4+iHHoOhJMqAys
         ai9iTrS74MStrqxGP8mxjsVtSsXm1Yd+yq4tWEzfg3ZNUBC2Xesf7zp5ZGgl/CyvtFM6
         hF/u8lITuVMYNPNcFqorII/Bmeb80GFJJqKmSO8Bb1YQ9aIpGVM4y5xG6Ehf/Zv1DUyw
         wAmg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Y0llWQ0k+FGE9y2O16KS9FZrFpMK3uc/+o3f/m6cdP5OfUs8O88ttPqw1qk1CELWj1Gs69MYpBqd2BmHoKZ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxuq6fv6PdJYVfsey8ePBt9bVZiUaPbmBCCoZTPj1QJqMvk8/Yz
	t46BvHHIaxEk1eB00zl2P6TIZ5h0TJPGhY+A/mq76cmtJM2OwoWw/icSq/soOb4=
X-Gm-Gg: ASbGncsvX9tN+/WkeWIET/CnFko7jNCRZ3dNSSIG/GjzfuMRLJv5c0lSavy5HY9XjHe
	VO/w64PKuzxLIZxSy8nRZtoNo2fOsP3GfsXiD3PmQM6/HdH4+4Hm2rVqIRKRoEravn84doz7NCj
	+ywW5f/ahkVPkhCWdjocDR+lEdEfHtqFAkPB6fG1qXLtm3Wldnh7wT+XtjVM5NtVlLcZElhlk6j
	cZF5NBDvHPKqjJouPHJZQZ8gjFaq/9PV7axyslndpaCqxckCmRa+kDnp9Ug
X-Google-Smtp-Source: AGHT+IFpD683L/Xnq8uxEeqg9tsz3tz8lKlVXMa5R3Jx59Gslqaq2nNppeiA2Jql4f+qmKUXncptVw==
X-Received: by 2002:a05:600c:474d:b0:434:f623:9ff3 with SMTP id 5b1f17b1804b1-4366864616amr567908985e9.15.1736248338172;
        Tue, 07 Jan 2025 03:12:18 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847dabsm49540541f8f.59.2025.01.07.03.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:12:17 -0800 (PST)
Message-ID: <9bc7e48b51d056acbba83bb40dfe133b16decc44.camel@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: defconfig: enable Maxim max1720x driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 07 Jan 2025 11:12:16 +0000
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-3-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
	 <20250102-b4-gs101_max77759_fg-v2-3-87959abeb7ff@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_031219_835856_5897A7D7 
X-CRM114-Status: UNSURE (   7.62  )
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

On Thu, 2025-01-02 at 12:15 +0100, Thomas Antoine via B4 Relay wrote:
> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> Enable the Maxim max1720x as it is used by the gs101-oriole
> (Google Pixel 6) board.
>=20
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


