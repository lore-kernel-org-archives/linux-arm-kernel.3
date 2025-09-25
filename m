Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96570CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=062M6/8j4NBzg2XWFjfBe/0J/9992fP3Zjk0wG8eK8s=; b=FIMgUZIACfa3BRIgwTEt/FUaU9
	wnci2zo8mlzAbMpRJAvvxHp3RB0s9Qig5OLGK2xuXg+UBbHb3J9ORggjlZ5BNOU8ZJkri6ulmxDef
	I80/g0+tNbtJ0CF2ea49VxmRGbzbigWaQjmOREEFa4NQjl1wWIr1hJJ1MdWFFjdtt0LGgpMIW2UzD
	WKPYJMpWLLKrePfMUsrN+ZlJbZAmxb9SsZDNcD58w8TgCMy3qwOLSDFAxR786vg/gIsR7FmEjirb4
	Lv00SaVi16Y6FUbbvOL51g/VH8+hZh1pl7R5vgLDdg+hPukR9XeD93XREXY/GnfttoXFqUgPwO/Uf
	EewXqTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1loL-00000009Isz-2voH;
	Thu, 25 Sep 2025 13:15:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1loJ-00000009IrO-1Nk2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B20C245221
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 13:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEBAC2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758806098;
	bh=062M6/8j4NBzg2XWFjfBe/0J/9992fP3Zjk0wG8eK8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J3jlgsRY0/E6Z4oiW+LnGS/HJQC3hSvvTz3GdG2WpmcNMywVtx5FgvBYswTN0y63A
	 CY7WZCYcrAvR9n5JYYhPld9yuB0K9R3zwKH5JMCrQLvqq+Tpqc8+aJft2R8pZ/YDjO
	 xKYKkvQlXMv2dLj6FRuMFAlZqaguPnpSCv/FmuQ7egNRDcziNADCPrnI0FfuG4fe6t
	 SHS7/m5vr0YzA1bm5ZraTT9wnwijSpxEKS7+nwVNJ+wqNmkIf9zjXEKZm9xpVaJota
	 ESagvtM5tb0GlYoHqxN4kwYAVVve2IhoFrMwNApJ1J2+O0RxOZpJx+Gqbiz0BfskDv
	 kxT3RDlfI7/wA==
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f0efd84abso894300b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 06:14:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU13knJWJjcbcecszs2dulND1WrYOEmkpmrtwMplIYEBpEGk2ZPnsnJA2ddQqCfgq6SMjhX/7cP/LLz2+yHZ6kc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Pb3FGzhFl99McphD1G19MeqpM1WAb/25dkmd9tj02Nzyfl/g
	SIle3ad7A8R3dljLIzFj1KLsu1tdPHy4tYAz6zuXxyCzJF1TK7USepndzzzvNbR+kLV2xS99DtY
	yZquQvISJa3G0kw4n5FXfl6/cDTRZ/jE=
X-Google-Smtp-Source: AGHT+IEZTnk4r2+Yb8GhN2efY3oHv0w7Pj85s3V/DNwMNZqwPOEwouLCSWf6XxrASX7zuc/9JwLdyD/Xi3x6JTBBRwk=
X-Received: by 2002:a17:902:ebca:b0:269:ba77:4eea with SMTP id
 d9443c01a7336-27ed4a92b47mr39799145ad.46.1758806097880; Thu, 25 Sep 2025
 06:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com> <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
In-Reply-To: <20250924-knp-mmclk-v1-2-d7ea96b4784a@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 22:14:44 +0900
X-Gmail-Original-Message-ID: <CAJKOXPc2LwFCW8w5kDEZPAOPz1Y_ix0=jjUHQDHXW03wdcufsg@mail.gmail.com>
X-Gm-Features: AS18NWCtGqOMFzAGGyQqpY8JXXlJLDCy6kxa6YEKNYiE0F2TiXpsp24xv7MAzJw
Message-ID: <CAJKOXPc2LwFCW8w5kDEZPAOPz1Y_ix0=jjUHQDHXW03wdcufsg@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: clock: sm8450-camcc: Remove sc8280xp
 camcc to from sm8450 camcc
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_061459_406998_49DA0182 
X-CRM114-Status: UNSURE (   9.64  )
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

On Thu, 25 Sept 2025 at 08:57, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Taniya Das <taniya.das@oss.qualcomm.com>
>
> SC8280XP camcc only requires the MMCX power domain, unlike SM8450 camcc
> which now supports both MMCX and MXC power domains. Hence move SC8280XP
> camcc from SM8450.
>
> Fixes: 842fa7482915 ("dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc")

Trim your cc list. You do not have to send it to 50 people.

The patch is obviously NAK, if you bothered to test it, you would see warnings

