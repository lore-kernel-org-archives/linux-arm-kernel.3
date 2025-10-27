Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C76CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 23:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiPQWeIHeevsOV0YNnrSX+B9LNP43U3Api7ejFSH8cQ=; b=EftbRnFCCDgvkEY20WtJys5140
	rH2nMq/iFnHUKKpMm3vMHsUeuXEYSrR3md6htbA8N1ekDWVondKYxCb508YVP3Y29a7/B646nXZEJ
	Y6lpRZxVTdTpvZqwT4eaayog8OWc5a8CS7hn5QKyQMRQA8bfc8yIytHd0KOHD55Iviv/s1KfzG/EF
	Q4FtGlwpL2qt9elhaZi+FhETGDIx9Ic2nMiwDH3TzWjwVkFq4Xle4CFfpbFHRy3n/HsL2HDGDWiIK
	8cO0nV2nK1EeU9VdTJ7JB3H0T63Epb/5lnAOb8rCTuk19lC7cMTXVyQ+VGECm3gUsTkB0bx4Rt4jm
	bqPKGJgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWXV-0000000EvaX-32qk;
	Mon, 27 Oct 2025 23:22:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDWXT-0000000EvZf-10Ag
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 23:22:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-27c369f8986so47055995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761607330; x=1762212130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiPQWeIHeevsOV0YNnrSX+B9LNP43U3Api7ejFSH8cQ=;
        b=QDFVEm6s164rlt8rY28WZPNY+tw3tf8p+lGl485Hr5eMY5g0s+P+378Lb/SddiUU/q
         ByPoJDxH5Y4hXrIgYcJ9neocCAruy9eh0MLKfyD4sJsRWjIgFyW9jd1KLWOINnBMHAzU
         vQoJJ7TiRme2BE3mix6hTXKHp5MqNFR69ErvLq4gtceHsnyYK2G/DtwB6EJhiUuWi6t7
         wOSWoGrnAFgyJh3C0apdHxhBt2a0kvbFy3Kn8qtChbG+08EsiYsqLGUv+Tyw+4rhVwo/
         zCht0w82iOvKT4XxXr6TpPu7IlXKodOISRTZBz8h4v9gYmA1howSFcUAHkBz2hEQZztD
         6Ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761607330; x=1762212130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiPQWeIHeevsOV0YNnrSX+B9LNP43U3Api7ejFSH8cQ=;
        b=WjxdrpwixDhqXcoLMC+JChhlCk0ZKrKhOcBcWIB37q3oUTRXgY8QyzYXktGIGwZ0Fo
         pQRIyvqssowgLaxCcDHW9dEEJkiy5O0QtWuIltPpF9hI+jEEAyMABMr9vQhV1FpOMX0T
         IVoUfwcE8sMEDAQPnVS9MAGnnw73G0aAIMTeWmwn+05UuULdKnUIpV4SCMXqh0sCFXJw
         CRIrmV/JwseLfXLcrSyYv6NKn6OeohoIc+Paz4g6Xvv/fg64zMz1nvg0HIGoLSqpjwgJ
         G/FHQtsz7QemCEtoqZzJeFD3MaLtys3UtRZPgP365uNNo4zwh56lLWX3IguJvI8FS1Md
         VtQw==
X-Forwarded-Encrypted: i=1; AJvYcCVla6qju9mn0/DB3VYvFy4oEoxOndMwIn70SzRdYTrt5oNGsNXqx2S0Kfvmaak/z83iiyjexlAdLzbCZjJWo1A6@lists.infradead.org
X-Gm-Message-State: AOJu0YxnxAbBN4EjLdWjIpDfXD7kzcJMsHQOv53M04EaLqDM3um/08qx
	ec3EuolKoXP1Ow6ms99J44rS6NjqZ2VVpzvKcWiYoCYMgG4bsHEVpG/Ac2SYd2eihcpHSEWuuwp
	ytsJw1Hw+ubkyAU3HbRD2ClV9fMtppqmWMs78EKMt
X-Gm-Gg: ASbGncueREmi8MNdDSlJ0YFpRvHoSue1WUXI0Z8h8zYaH+vDafCvLiEjL8BUSBzTgGe
	w+2Bv4jlW+Ry8TvdS0F1jyhXhE/Rx2b/ptycgtq10k9V5w2mxxybRb7r/XejpGSE9r+D5VTtCP2
	QYPDBtv0SBta6u62gUEcdN2Qppw/GOsgplUtmKlKY/66xS4OO7OzfeGn1YYFOZR8DTKnPcqiaqm
	aUvZAu2f/qoG4gWDu4dnH8xFwp8P39jfEgvDdsly6RAlct1bI/yXQXoo/EcaEptD+hKJP6aAxCx
	zpFLPiHIx08wKjXGpA==
X-Google-Smtp-Source: AGHT+IFw/jdLBZAkI7aI48cv68geMt8046dhZdRqyhbPorbEN5vUOHFP9Zbu6h+jTvEqQPeotPAALO6GhBMyaapG0Vg=
X-Received: by 2002:a17:902:f609:b0:290:ad27:c1fc with SMTP id
 d9443c01a7336-294cb6893fcmr16828025ad.55.1761607329339; Mon, 27 Oct 2025
 16:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251017235159.2417576-1-royluo@google.com> <20251017235159.2417576-2-royluo@google.com>
 <20251023-collie-of-impossible-plenty-fc9382@kuoka> <CA+zupgwQTLEs8_7i-VsGbGV7O2Y3XFA1C3aV7iuv2HLOwKns3w@mail.gmail.com>
 <8e4c8875-10bc-4f4c-a675-a7cefc68c863@kernel.org>
In-Reply-To: <8e4c8875-10bc-4f4c-a675-a7cefc68c863@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Mon, 27 Oct 2025 16:21:32 -0700
X-Gm-Features: AWmQ_bnZfP-h63jIJfnjGht1z_4tHKDRepUQGmMIkJ_dLhOGQfclonH0qtun2RU
Message-ID: <CA+zupgzzkX2CEicrLaW7oGB08qNVqF=5Jpfgcw5HWS1kDW72qg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_162211_287099_E13D10D0 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Oct 27, 2025 at 7:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 24/10/2025 00:22, Roy Luo wrote:
> >>> +
> >>> +  clocks:
> >>> +    items:
> >>> +      - description: USB2 PHY clock.
> >>> +      - description: USB2 PHY APB clock.
> >>> +
> >>> +  clock-names:
> >>> +    items:
> >>> +      - const: usb2_phy
> >>
> >> core
> >>
> >>> +      - const: u2phy_apb
> >>
> >> apb
> >>
> >
> > Just to provide the full context, these two clocks/resets
> > (usb2_phy and u2phy_apb) are specifically for eUSB2 PHY.
> > USB3/DP combo PHY has its own clock/reset that hasn't
> > been added yet, we would have to differentiate them once
>
> That's confusing a bit. You must add all clocks, all resets, all power
> domains, all pins etc. Bindings are supposed to be complete, see writing
> bindings doc.
>
>
> Best regards,
> Krzysztof

Ok found this in the writing binding doc:
"DO attempt to make bindings complete even if a driver doesn=E2=80=99t
support some features. For example, if a device has an interrupt,
then include the =E2=80=98interrupts=E2=80=99 property even if the driver i=
s only
polled mode."

I will add all the clocks and resets inclusive of usb3 in the
next version.

Thanks,
Roy Luo

