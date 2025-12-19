Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536A1D78785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wGFJgfb4wEXs8e+H5Ec45dLu3UmfZvwKEULZrNoyMI=; b=mXx1MMR1mOHi7zhftv+bGE2i+C
	ZizfUuluTl4O50oeTYUFR27+PkHt2ee280fHLUF9JHCeDyN6Gvk/ejH9VjllFfpEhQHA5Gg5ejgfJ
	nTmCNTgPiHjtyuynQ0QzdKYmh3bXXhIQPNjmAzYZ+ad/jJSalNJGKA7gLQZ6FciryF4/fgKXmcp7h
	k1F8ROkqtnfGbxp8jONwzqMC7AJSmK88R9GNplWP5yjajJami+tZx71PqbCKi+LGexOeec48KSFXn
	UzrXbsQNVZyhnoMFuUzWGIoWmaxfGfyNCoZVZUKEfch92nrqQuXpdwJqqcgP1fJZjdiDGdxdnKsgf
	A8mwRXgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbup-0000000AT6L-0Oi4;
	Fri, 19 Dec 2025 14:57:11 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbum-0000000AT62-3b62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:57:10 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47a8195e515so14697235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766156227; x=1766761027; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8wGFJgfb4wEXs8e+H5Ec45dLu3UmfZvwKEULZrNoyMI=;
        b=GMrUYrpadaLfcbIu14WaJp9ManFLhR85bs659aDwZaQufr8tM2QrtVC5sbgLLlXROt
         8paENXM/rcNK7dDRQ7eRWh2/DjMRqnANfR8Ly6Ej69u8O8S1A4zTbaeSAo6inDxahSRI
         qp6gKDyaE2OYoZ/CgKtFDb/YyPMWmKGxOAfV4FA9CpEiI159ZIY+R52euO0H4ZeGOjeX
         bljBy+ZKSytZ9R9jhJZfMVLOKcmDaqpFESpM31a/9O/kZse0lknapuI2Ii789dfgqS/o
         +y3FKost6YYvSXqWIqZd51KeRnNIfUn1ZkG2flVbnZEdjyBmuveKlCuPiI/SgnQS2SqD
         bScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766156227; x=1766761027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wGFJgfb4wEXs8e+H5Ec45dLu3UmfZvwKEULZrNoyMI=;
        b=Lp6eelgzy65cuQAah9aG3oVtjvCCKmcMFISqZp+c0vzQgsrogG7iixQuCrQrstmhPE
         yQRceb5ftzMI8JXqwIhlR/OjOgEB9IpJDYJMt5to1LAr6MNAxP26+dSSA6w2a69VBnwe
         4oSkK1Z73x1f/8hX1hcQkl+4CBeqFmKLNzS/kTHi52x/XjWwG13A/GfkMDSKvaqKS+a4
         nz+I+u3iIVIg1xnyhY8X8aA6JcngMv53OCgb/yxCn3Jd/E9IgWU+J+T7mEctBs+YNYml
         752P1vvzTCTzKTxuQ2JvhdHtPZI5gEYUNAzjgncaCoh3Z83GwUqS3sbVoSXqPqYUEmYp
         PCNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGGpOL9Tl14WNi6droV6FTEBKqf9Ly2Lc+FKN94tw3QXZZPY/7ljqoSvUK4YRAb1SO3REO6mh2BolUU2SeG0Vo@lists.infradead.org
X-Gm-Message-State: AOJu0YzsfbWWof8D2u6JPAL0R0CDU7SDpL95U6D1GksyZrbMYwaZHX0G
	fycPQ6RK21dccIBYM4RdRGNECLP+CiFeKULikgFQiSC5MQLmg55Dt9TDIO0hbvv4R6Q=
X-Gm-Gg: AY/fxX4/lieIZtSjailykiRf7pQUbWVsT1hQSe0YUhEikPwXWdvDz1l+xAFMaD4A9sx
	b6mctPDovRHm/QGXrkMUXkNQw9EUrLr8QmlsGFGtI3TZHWz3zhB4LYosMnacZ/jsfHar4ZQhGoV
	bj7BoT3aj/hC/4+jMy5rFfW0kg2xoiIxv6o8NIEnkrvqDF+gUckMIBvwzD11tQ05girnMOC5eQk
	7o9CZ4HRdgaUF21pT77yaI8z+f+Id0b8DMS4rJePrVQ4BkFbFvi+5haba0Cq+xEn7CrjFIwv8F2
	37qTAIwFJEzepzJ/DKpZez3uzm/X1D+l8/FSMnVbJYH7JyI2qLv7xQfyyKLCc00pU0PPNYfnrE4
	YRrZMi3V/KDxBONRvlEC3VZfbH4GqMoGJ6Iq/py9RTsZcVkhGQtHocRA5Sdfz0BHaHXWcrZ3MxW
	fKKSgEZiWTVgBYA3u8Jw==
X-Google-Smtp-Source: AGHT+IG0kuzKihAK2EYClDOPCu190trNqH7HRizVwD4ck4omkH7iQRBsiAgdxyr0jD3KRQLHTUyGMw==
X-Received: by 2002:a05:600c:1c91:b0:47a:7fd0:9efc with SMTP id 5b1f17b1804b1-47d19555b78mr36411585e9.15.1766156226855;
        Fri, 19 Dec 2025 06:57:06 -0800 (PST)
Received: from draszik.lan ([212.129.80.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm47624915e9.13.2025.12.19.06.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:57:06 -0800 (PST)
Message-ID: <da80f729ae5c8899181f3b35b0f30b59f11535a8.camel@linaro.org>
Subject: Re: [PATCH v3 2/6] soc: samsung: exynos-chipid: use dev_err_probe
 where appropiate
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Peter
 Griffin <peter.griffin@linaro.org>,  Srinivas Kandagatla	 <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Fri, 19 Dec 2025 14:57:13 +0000
In-Reply-To: <20251120-gs101-chipid-v3-2-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
	 <20251120-gs101-chipid-v3-2-1aeaa8b7fe35@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_065708_936714_1511FFF5 
X-CRM114-Status: UNSURE (   8.59  )
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

On Thu, 2025-11-20 at 11:29 +0000, Tudor Ambarus wrote:
> Use dev_err_probe() to benefit of the standardized format of the error
> code (e.g. "ENODEV" instead of -19), to get meanigful error messages, and
> for more compact error paths.
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> =C2=A0drivers/soc/samsung/exynos-chipid.c | 26 ++++++++++++++------------
> =C2=A01 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

