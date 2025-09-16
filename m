Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A4DCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xbawwmBoJ+wZI7xS6DVzS80oa3hVLAsUDbr1E7VfLM=; b=YaEXHo4XgUF5QkXeHgYmGpQy2B
	L8c7NRjgxv8mQFolIC8dbqM87DInwH2f/lKoPxdDZIlTV0ZyHBxigXKMy8u1x9CobAul6l+dAAuB1
	pvM8IT4LbKX1sahEvaddsbSoSSaRJq0OlL7R0CTvnNWb2NT5A0jrVC9uQeZ9+AFkHtjwoKQfXkUD7
	GbtfkBTTmPvSbQuk/8GTVsqaa9N6QhaBQconAQ8pSvPDPFdQyrCNd4dbCDGdaE8etO+iY5CwTRMd9
	3HW1jqmik+/8rBc0t57EgGG3VtOFcJcUaftABIT8q/hlCLQcBHpQ1ksUkawN/loQOk9RC9WXAeaBQ
	eb2C5YsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySDU-00000007Q0K-3IlS;
	Tue, 16 Sep 2025 09:43:16 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uySDS-00000007Pzp-3Ocx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 09:43:15 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-72ce9790ab3so35448637b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 02:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015793; x=1758620593; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xbawwmBoJ+wZI7xS6DVzS80oa3hVLAsUDbr1E7VfLM=;
        b=b1tBZLFs+FHz3AYYAZqv3TbMNnm+jQfkif476YItZ3ZH3m6lhlvEvoxGHO8pUEwuUL
         YH9WZEActY6XODWfXUkZ3GiKQwpir5MvlKj86qaiyNWXvmxpSNZr7ye60F0y0A7fNA5G
         eAz5uL79sqWK6/VdVz+7vs9ba0EIUeoheu7sPt3xQKAo7ODr+jUJw7gFwJpZ48K8FG/U
         SXmyK37KUeaG0+Z7a4fQdGFSCpVh/iL/Yty2LNFbEoR2uzF9e9OTYD6gpBc5W8X+vMXu
         fGhI8Lg3GcDgq7dLKc/ajgHaZ1sxwK40RRfs2s8jrGSgbvYZxRWj3TlrlwimoqI1g556
         N2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015793; x=1758620593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xbawwmBoJ+wZI7xS6DVzS80oa3hVLAsUDbr1E7VfLM=;
        b=LEH9k4+f4RhjjVZTmBuKmNdFVFijap+Ksi08F3YM1/A9gqIa4WuHxjgDYT9PE/g1Fh
         DURBOArVHFmuae5wtVe8/0ZDhqxl9h5izzHoRa80NhQ/uBLZAIoHIAZKw637AVzBtF2F
         1O6R+4Gfd01F3t22mCUw9G85b/YlhlmSgR6q9vmsRiYUB3psPzXPyUrCRAKTBMzPabgF
         5yDIQ4DFqog/ih4U1wA6ngN8PQc4sUbRAR+Jd3Z2P3L4g0YEtNo+rVT3Hgbs992InnaH
         uJ7B62cxy871tq5UzV9rSzrD7sNgS3jcAi9OLlAH7qqbThwcOYMgMbYy8k73B1ePIClO
         mhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX10iqplmY3FiPNl4YqjHnS09Jj2t5wTziNBiGuuYpmB+VtxMRXxx+bmR0Yk53uBTv0yhookmHWUChWEleO7ARC@lists.infradead.org
X-Gm-Message-State: AOJu0YwnF2fgIJ40aYZTctP/7o2TEkoTI7GyMzhys5I4Aw8Vf9vTxG6q
	Laj1iO4KsY9vyKgAOOfzc8giYmFdTglCNi+0jWT83xkMrNUekUt6mmJ3fImDjaS+6N26WHQ4Kei
	GM1+Cj1HS9t+e+39HpP8TTlXTbd5ZKHk=
X-Gm-Gg: ASbGnctSYvFTJBQlsHfPBbEmpFVAwWXx8eClS72oQwDQH31wBh3c35BKInHInvj3ZqR
	x1OrvLn034/aJNIO5RUt/0KzjtWlkFsC+m39QEnhG5pBR5zOkJFb90pigQoZwuPBpPzRqssz+EC
	KKSstin6QQswO82V2PEdMDiskEFmnp2CfEjRK/llaQmNBOX5NNysJxLM1UGWMZHHwAXm6FAxp09
	QkIUUuNHGGH5tE8reLKzhm1NieCGao=
X-Google-Smtp-Source: AGHT+IHV/RX93XAmuJF2uL0N4vvl4pBykKHWOWIaKMzu4BBoHbE2JJaflos/7YY6pTURHoTpA1UgbNRwBPMZjCyfZfM=
X-Received: by 2002:a05:690c:7088:b0:723:b16a:ce6 with SMTP id
 00721157ae682-730659be315mr116536247b3.50.1758015793437; Tue, 16 Sep 2025
 02:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250916-flexspi-dts-v1-0-61567f969165@nxp.com> <20250916-flexspi-dts-v1-1-61567f969165@nxp.com>
In-Reply-To: <20250916-flexspi-dts-v1-1-61567f969165@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Sep 2025 06:42:54 -0300
X-Gm-Features: AS18NWBOYsyflacEeUU1SMpoaGg-Ie2TjGzWnHyRp3ZhqTvzAQSB9G1WINvKAyg
Message-ID: <CAOMZO5CTrGA19npaW+u0=V0nUV0nAqoH+p75L06yR28DVBGfYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: correct the flexspi compatible string to
 match with yaml
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_024314_853734_22B465E0 
X-CRM114-Status: UNSURE (   8.76  )
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

On Tue, Sep 16, 2025 at 5:57=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:
>
> According to Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml,
> imx93/imx95 should use it's own compatible string and back compatible
> with imx8mm.

Nitpick: "fallback compatible"

