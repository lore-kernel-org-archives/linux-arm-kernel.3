Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E852CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=; b=TiNJ56MehsgrYs/G7Qfrpo58Dk
	PSLRLBEIOYOzsp3n0GnoZIA4PWi6ZrlgOpvzlxjd0FIFw66tqDdpM8xijVKUoRFAXINQrhUjiu5Q7
	C6Yq4Z889OHx5lnNL9/6KiSjuZjJwF8twpzshZ2NruptnqJOwgUC8UV8tfQ8kQPFco5eCUlUoOOA8
	07QD4JkMgMwshzjAUdGe4FKyE3Qhdc3PUlVSZtZXWI7iK8fO5lzf6V/zR2E0XfIevVqNDRZXZ/Lj+
	ya0FLLOblaY1T88PiuWoPN5ZNdw1MReKJ5LaQZm0dybiyegbjicQHTU8SfMQVJi5ieGSiYBy+AzF9
	Cd4aFeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxV8-00000004nu1-31cV;
	Tue, 24 Jun 2025 06:51:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxIH-00000004mFe-2VAF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:38:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-450dd065828so326345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750747087; x=1751351887; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
        b=cyNNquIIIGR1ksFtiNTsRfS0uUSYcbaahf6i/25JL+ymlQonIwykCjyGzVnEfiz/8j
         CH0vP2DSbDyCg5X9Y2r44fWdfSugWrde+lmY1hBIFtLJGNm1h4OHc0tkDxjveznpD1ht
         /6CRmLEuex5SwSGfNuA2aaR+A/FzobGBF0zXAZAggqgUbCcSWSBzG2kSfxOYyb4o45+Q
         GCGCPeJvkMaJDt9+1YzDxLzeQEVj6qh+dNFn/W2bEWQ+eKzzW7iANzhUQLZnkLQehq+v
         N66XUoKlvVZAsaiHfT+TYTlGa8XrZndDtXh+nipnwJGQojGbc4DXQ2/2atOAnNKtzbZy
         xn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750747087; x=1751351887;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqT1UTBAsYvRB01kXkmbX0p3Nu6z/Y55LPEAo9YxJwY=;
        b=u39+v9P5vOxu3TxNq49ABMu1AIwzIEkXj5pD+x+LGULjTntHdXOOZzXewHv8RL92uD
         uJBZif7yG1zyUPqtZpjzRiOycQ92l/rH3svwaQXlXc+gjdtytfZIwnPe2YOLELBdzaPP
         AAsT1qveYGDWuUrCmdbqOrWiQ+1sBwAjPTqQ9pxd1yNET4l+7v7CqbH8JcIlkO5/ezrH
         6rZgh/+iCR/kwEsBJ8t8aZIl32OWJYjdacD2gc6ITJPgMPSWfMYfsjRIRuouhJWZuh8I
         8ZTUGZO3DfuLXGZpuwQQ5J3xGyY2GDq7OkRvbw75HwHlnunth2GlsCENFrPuwPNpk3L8
         +7lw==
X-Forwarded-Encrypted: i=1; AJvYcCXL5Z3UuL9BxkIBD1NGdzTwps1KEJsFHcYYjTitk2/DnoTFyp66FDA8dm4ys14jI1CxFqC2ktHcre2P9S0RQsYV@lists.infradead.org
X-Gm-Message-State: AOJu0YybyWAYKx81lZDq0zgcKht24haal2Y/aMg82WfAJ+EfLDsYuaub
	ikZdeu1a4J11xcKu3EoEkIogmDZhDH1tcIvwQGxUUdM1JalX5qG6oWiCNHumg+zHYGw=
X-Gm-Gg: ASbGncsIwL2E5U6c7Nd6qx3Xz2SNJ4ppQIKyrS67vfoPpuow5rbN+ZSCmykatwE69zo
	Liq401m7AMOuegTtcuFxSoqiSDpQ+PiDCX9Bn3ensnzbW3Uj+80XW9+q+Kf6PhFVcf3klFvRa8M
	fIhxVe9yMfAaUkbdRCeZ/NxN87cQvfpDioHQnn2qh9bt3FRQSUp7oTu91xLwewWKEK5UhEPyVTM
	vz8DMMDoaD+8abVXcewFoLkfLy0eggd0tmeOWFZpORQaeMNl8iHY2l/K+D/AfS6ii/jI4w8WeUZ
	ui5VT4abKSnef5jdPdJK7BuASsGQu5BPp8P5dwNoctcCATkMqgAcuAQm/csRTnfGq83DN6j9lm5
	MRw==
X-Google-Smtp-Source: AGHT+IGOPbecHGYgB2YysSR5anppdA2xKx7TGTKt6AUrQoPCRTvADAlN3zQqydUylWoqDxWazLJxPA==
X-Received: by 2002:a05:600c:1d02:b0:445:49e:796b with SMTP id 5b1f17b1804b1-453658bac72mr136170125e9.17.1750747087505;
        Mon, 23 Jun 2025 23:38:07 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647f29bdsm131378405e9.18.2025.06.23.23.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:38:06 -0700 (PDT)
Message-ID: <9237a946ada82934ef4c0b5a84162a400fb5a88b.camel@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Russell King	
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, Tudor
 Ambarus	 <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, 	kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rtc@vger.kernel.org, Lee Jones
 <lee@kernel.org>
Date: Tue, 24 Jun 2025 07:38:05 +0100
In-Reply-To: <202506232219552539103b@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250415160212.GA372032@google.com> <2025041715425693974c6d@mail.local>
	 <24314441936d97a1892474eacdbbd690612de265.camel@linaro.org>
	 <905e6cab9932c814a578826329f5e3f944418ef9.camel@linaro.org>
	 <b193e94f042cf6134d2bed92152c23ee5bba6a26.camel@linaro.org>
	 <202506232219552539103b@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_233809_640966_EB6BC41C 
X-CRM114-Status: GOOD (  12.59  )
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

On Tue, 2025-06-24 at 00:19 +0200, Alexandre Belloni wrote:
> On 16/06/2025 12:33:21+0100, Andr=C3=A9 Draszik wrote:
> > Hi Alexandre,
> >=20
> > On Mon, 2025-05-19 at 15:41 +0100, Andr=C3=A9 Draszik wrote:
> > >=20
> > > Lee has kindly merged all the core driver patches.
> > >=20
> > > Any chance the rtc changes will make it into the same kernel release?
> >=20
> > Friendly ping.
>=20
> I've applied the patches, I'll try to send them to Linus but there are no
> guarantee they will make it for this release.

Thank you Alexandre!

A.


