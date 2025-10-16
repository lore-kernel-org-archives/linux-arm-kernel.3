Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DDDCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ycztQkvJg+KdGCCiCnENVHtBhwB6Y+p5nrVTPjvpLc=; b=3Ci90a5Ic5nyMvuYUiRIepoevC
	+QMNcmwV4weAknehHwJFuHfZd69c7/+EN2B0R94kulUkpsoUNI++qm3pQG+iEfnSz22uVHr7hqkHV
	AQSei3tHNMdO7v9WKNzxtkYGmsWhkgMMp1dGGnl5xHzZqED4oWAK6istMsm80MQj8byrlsDbCfaQX
	jBfzxEMhItIGB3ZQT5onnAvEGQtU2Jl/pFHkBDuQoh/yGfKh15HsFZSKD4OcVNce4LjVIxPlcLfxd
	86abH18PLW2/6l5yb44n1dgUwx9TDT2gZC/DLMtgfVO01xlCaDYAPquKJdlYTMPO/x9dXe0YP1IEe
	d3bwe0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GyE-00000003YHB-46uh;
	Thu, 16 Oct 2025 05:56:14 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9GyC-00000003YGn-2JoU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:56:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b4f323cf89bso60042466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760594171; x=1761198971; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ycztQkvJg+KdGCCiCnENVHtBhwB6Y+p5nrVTPjvpLc=;
        b=FkPE8CbeD9cpKhW3gc2UJjhlFGfvY1T38nF/i5Fj+r96VQJaszFEdiCumofZ1mgtx/
         +sH8muICHxfW+QU2ghaQK1dIg0Mf0qI9y7a6KULJbG3nMFf1WWLBYIWR6skPkCDjvbnF
         7eyjqKwY66kYMOIRwy0MMBVGIB7h7DTr+G4JTUKNynh/eqJD2AuBP2ptQwHKFDPAqKO5
         9ibsvFmlz5sheI4/WFf2fpY4v/+hQEL2QMg0IQREVKk9zOpMmiUB09oWNIH0ntZoj4Ep
         Xv/PLIc/lHtobIWS22Wjfp2ursHxpXJz1N7NfR2qB0gFBJ93tpupD21Be0DBI4f/hRAm
         w56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760594171; x=1761198971;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6ycztQkvJg+KdGCCiCnENVHtBhwB6Y+p5nrVTPjvpLc=;
        b=AhpA8wRP1irI9FjupQpf8IruQw6xpg397Fw31ES9H2wiy9k/qx0KNpBFdmlSKe0ji3
         L6INj8Y6VqWhJ8duquQVCT73dbvJhqM+83+brOpvdDAedLfz9P6KdAKtyo0SrhflHgr3
         3ykKPPYudcwJz0966Z6C3HQ41/rTxV8dSUlwT1+nTUzQD/r+vomEo4k72yt1jaJ0yT9J
         YZc2WfqI78ExWK82DrFScySCweBr2FvJzEZhQ468r6I1Hi6CdO/Bz9Ip8vze7DRy2gyv
         r0BAjnbU+QCsceM9rHoETA+QRpl5wzq3LSQFsMMtwBFYOCI3Ty1iMk1sXu2xYVU8wEPo
         xS4g==
X-Forwarded-Encrypted: i=1; AJvYcCXUSVblYS6CPNsplZaajrN9+bKxxvSn+DlsHJ1DdAEnB9OnIju1XbI95i/jDoWucW50USDfWhI4KAKjvyJ8anSI@lists.infradead.org
X-Gm-Message-State: AOJu0YwEWOgf/crBFwtxNPXNom+ROzedotP6qMTnnmA0nceN7SNCasFz
	UjjADtPqKYeY+100cLH1riNw+5bsEl7PfDpzUmz0AeADb3+iUW8+Mt/5crABIQVmNQY=
X-Gm-Gg: ASbGnctjhPRMRlInAi8Fngc12JkEOzDtbyB9YqGi2FrUW8XZtCFKn5RfogmMVXjM+IT
	oags6/2g8DjUsZeLoAPZGRIuG+vJI8X69gJQmsuoBOFHiei+q1de6yk5KpP0PytjuMVJZiTeG9C
	X+ke/dsFiyzc6J/3LQJcskNDU0gMGqaxR62fDKpjlinXYxBoW7daIdT6FUBb0nwLXiCdS3EV8a9
	xcMdALkHsXdCl7IHHnI3QzKJrebzsGVXuTe2MABvRcgyHkmna6+1giWap0bJjLqz/ct3qfxb+yu
	G1JfOH/ScDrZVsqYoAftLeq09O0uNZxQ9pEMcuucSYT+BW2iycXUuQ0cmJZ3fhm7UBoid8N1m7U
	fgao5C1BA+x5e+AR8lRcmyPZqdjoXVe1hoeue6oUp2ysrKb12znhi1/ZJfI0hyQc+N5T42tNcOh
	LB3vjtkTVrbnKmvmtFRw==
X-Google-Smtp-Source: AGHT+IHRn6DJcub987XbIaCnD213XxBVwA1OkaUrOOTFR+bbpHbUgS+RyDdcriH37dmE0TK4LGPTbQ==
X-Received: by 2002:a17:906:c149:b0:b41:2209:d35d with SMTP id a640c23a62f3a-b50a9d701b3mr3125674866b.1.1760594170719;
        Wed, 15 Oct 2025 22:56:10 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccaab18sm419863266b.48.2025.10.15.22.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:56:10 -0700 (PDT)
Message-ID: <30a0c50b682b990820d486e536f320c7ea31eabc.camel@linaro.org>
Subject: Re: [PATCH 3/9] arm64: dts: exynos: gs101: add sysreg_misc and
 sysreg_hsi0 nodes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 06:56:09 +0100
In-Reply-To: <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-3-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_225612_595626_A9C9C07C 
X-CRM114-Status: UNSURE (   8.29  )
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

On Mon, 2025-10-13 at 21:51 +0100, Peter Griffin wrote:
> Add syscon DT node for the hsi0 and misc sysreg controllers. These will b=
e
> referenced by their respective CMU nodes in future patchs.

s/patchs/patches :-)

>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

