Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DEAC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 06:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cl65f/0t7FsLCASGiewdIE8SaLE0/OtzJdiDvPmWgAE=; b=WkImXezj0c11ffENBfwjFjTrPw
	6S+HAoK2V5siVW6YcHhGpQXhRqmANaxpVPa3zY4sMfUIKPz9Z2ITZ0s1dSPtpj47detFr8SRi1xbz
	Puzjm/h28RkqSP/wfkUH01evW9pzvFMXpnACNPtIgiNnGHz01YSzEVykZa20Rfz3FLW4CVqyH2j8n
	eC4HRJvsXA7+3MCFwop0ZuBNtyQjVJ/17hrz9XClfGesI6wjgV3Mz8mpJEC1L9YebNmMXvDIHX8K8
	i/AGjtvgslw1mLrfwL18rMMA4bTyz4LxIpEqh6+iXD3ZLiIPkZBol8DvW6lIvAnnrCzA8iERK//bw
	BaTPa2oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trAVP-000000004fu-0RAQ;
	Sun, 09 Mar 2025 06:51:23 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trATl-000000004Z8-3uBn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 06:49:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso1791178a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 22:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741502980; x=1742107780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl65f/0t7FsLCASGiewdIE8SaLE0/OtzJdiDvPmWgAE=;
        b=CA8IXoLbUKe9Vu99l/KdE83AK4GRmQ46wOCky8Vxk9FYmlE474dDpQAIQ8EUcaCO4D
         vzWW2rI+yqYutwRwgbHcIkkW7K8nc98aoIL+3sunHF091bCHnQsqSSA6bSxlBldLyYl2
         4H1dTA3vADrytNjDE+g0Ft04lXyaiZInNC8UUYV+BJxWbnAScpnjPU9d86jlNXltOdOZ
         76OhQKReLwfIbPtP/Utex9+n52hmPzHoPSbFk17S5i2ssajFYkhAp8DaXAMOZmoB9szM
         1hS/f01ezA9V8UwODJ0tnrIarFcyXPAdOwsjRiLJntSlNjsxfd5DoQSlk98+y3hw+7lu
         m+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741502980; x=1742107780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cl65f/0t7FsLCASGiewdIE8SaLE0/OtzJdiDvPmWgAE=;
        b=XE4HchXtPPE9NYgD+nQigssJ05BcYpjfSVgbf9Pb4bjzcKSQWMAKLKSwVDwU5pBmkZ
         mwBxX6rhS/bdG9C6j5xqjUuljwQ+aACIGig9TQ5WUqrvC175NPznTrFqbELFn9wF+fSf
         gBdeTzlD8w4ODHJONHLx8oVsa5vPOEIt9Wa232egtzCh2632Ap6PIfSHSutGPuceBDm2
         t3b8hXN9+CvhX6qVpdNng+Dab3iOR2aj0T1MgZY5Al3BGfh0nnCw/35FZA9WtP/IBTIQ
         m6/R2PvSDw487cJ/+2ffklNFFcwBaCR51jy1FlN9M5qNL0RbQT3nPPDJdVRaP5tqDxfJ
         tQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUofQCF4JM9vrDCQAvMdl/CHIP1ioCv3jSxxJoJJ0stK4b8Thm2MQJfdg+hHe5uNy3Wtl+HYaJWNYy0i7hp84Up@lists.infradead.org
X-Gm-Message-State: AOJu0YyP0mPVATMtWMYoiOeHwFSlHZ29lHdhEpmf0YldWuH0NyjWNr9T
	JqemfZY6OIcxaS/qN9wbT9owNEEQGybO02zjpP/nWHul0tDviOsb
X-Gm-Gg: ASbGncviTWGU1OXL83dhawY9s3hTiO7hGcoEvN+huj6R32BDNC4310u67sjuJZ7C7uk
	FUVm6dk9+PPlUYIK9y8/yz1NYu4QXTTflwU/oKv8qYxRRGV4bfhmRkQQkis3CrwJ2a6vnr6P8C7
	EuWyCblB4ir6gq7+s7niye+ZtjdCdXPZ0rTnimLGxYZuxwBvoBWvNRnYubOLqFaEywIq/q8Dmfc
	8UryyM6GctaEWujlV7CgFadjTbcf6NF5b/VMaWUBWMzYTO17u4ukZu6T71Y0i5CXUjwZtVX5/Ro
	pZdgMlfCFZhr0819xh2r0UXXmkvQ5RQLuR2Cy1pNxgQ9cwbyf6AJ/ka6yBisC3YnwA==
X-Google-Smtp-Source: AGHT+IFI/zjd7lG5rPco3cg8PnFl2h9bozpdBtlW5SATxdyS7wM6nxNoH3ZloBa8WWl8S2snqJH40g==
X-Received: by 2002:a05:6402:1e93:b0:5e4:c7be:f8bd with SMTP id 4fb4d7f45d1cf-5e5e24ddabcmr9224865a12.21.1741502980045;
        Sat, 08 Mar 2025 22:49:40 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7669fd0sm4835570a12.51.2025.03.08.22.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 22:49:38 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/14] clk: sunxi-ng: a523: add video mod clocks
Date: Sun, 09 Mar 2025 07:49:36 +0100
Message-ID: <4963134.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20250307002628.10684-8-andre.przywara@arm.com>
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-8-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_224941_971318_B3D6CCF5 
X-CRM114-Status: UNSURE (   8.21  )
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

Dne petek, 7. marec 2025 ob 01:26:21 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Add the clocks driving the various video subsystems of the SoC: the "DE"
> display engine, the "DI" deinterlacer, the "G2D" 2D graphics system, the
> Mali "GPU", the "VE" video engine, its associated IOMMU, as well as the
> clocks for the various video output drivers (HDMI, DP, LCDs).
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



