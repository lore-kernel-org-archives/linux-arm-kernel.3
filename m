Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE0BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S0+Zh7bx00KedsQeG+Vi+B61V2GRVFmBCadrSzhX3s=; b=rY1CF7zpVxRc1YtL6ONz8cbSYM
	WxW35yb6B2YJ0lPn4lUqVro+fBcV80Zgl6HdRj9RONPDsjU/eu4MbvgrZ6/UPMIdSvgHCnVVSNIEZ
	1NGZDl8WoXcN8KsuY2ySv9cRFeaRkRx4rgomaCm6OSidcBqCik+wslnsv0p7NStLf76U9Yv2z4Fkr
	G6JotO9VS5UjDsTm4rhnFkZR+pvnYiRrCm9HoDFLv+81YV8wDO1ShUGFNnUbn55aJjMB8PmLi7fqA
	sTIKZvnkj+e5dzkCqJfihRak2f9v9jBiUpfoAhjt7vAGzi99Iybi8I9NUeZdVSqWWhPeK+fffLKyg
	YT2HzQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy1g-00000000MbM-02Ee;
	Tue, 25 Feb 2025 16:43:20 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwqX-000000004Qh-0ylQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 15:27:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-548409cd2a8so4027929e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 07:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740497263; x=1741102063; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S0+Zh7bx00KedsQeG+Vi+B61V2GRVFmBCadrSzhX3s=;
        b=r+WK40R21VbM8dIG1Rz06O2haRP1D4Jp4i1bM9xZ5CjhNiGo+fdXWzHQxg/95nW8dN
         +9vVne3Bui7BiSSgGHBgvmvAGWErd1u8JDthSuH8NNL3OrHLYHmUFsMTSe4FmAbyElES
         e6fK/HSeiZijzPBen81N9qpw3+YyspqxWyQ301lyp1CHWv6tfkqz44fXU1LoXhd+GZSK
         QPlPsj+Nbq+UTQPGanD38kfPxQfoqWsb32t+m9P2mKfhDCWM8R8QnvBbAZ3mkuLrByey
         33v0wY+0+XGeBtLMBYHObYgyLT/9zbqauCcZI6LVGea3Es75euQz6NbjtX1gETIId5ui
         kl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740497263; x=1741102063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7S0+Zh7bx00KedsQeG+Vi+B61V2GRVFmBCadrSzhX3s=;
        b=VVrewL0u7KSXGk2Q0IsUWw6PeA9EAaLRzJGF6eN6UnPZ1YnVeBEJsFKWaLI0IBy659
         LeJkns3LnloLrwfoR2IXuN67fwzhRoI2Y3J9l6QPslyCI+oDiFmIhjEHxslftGSv8UOK
         u7Kwg9lF5vq9jOXSHm9dbotpITidwqNaPvQ0ayRFQ0JuLbKGD8ZgPgamZPf7dQRx5Rjx
         5hlAU2+Ww/cKoI5jAkfZ/hSc0gC7FICz3wHJ/zOpbi6F+JP66d9CO6qMAD4K1g0GFyJE
         MT+Wl2CnRFQc/KqY5q4+LIyFGpj1+o6s+l6rpL29yo8l5JbYqwGdl6NFdcEKeytHOse6
         NDAA==
X-Forwarded-Encrypted: i=1; AJvYcCWByfNc/1HHsd8JHBKa5RIggVEU3RN6yS6lfXaR2yyh54rq5f5eVgkMChgNeeRxREvTmTDTJRWHzVzg1rbLb3rG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+PPsBzohG1TvnL6+zEW0eO8DmwJxdJB8Oj71IPyPeqySMFgKu
	wriYh+EHF6pTwb5HaX+WUucdIAqdvCNNs+bw4/pqv/BCzcSOf+XdaUji1iHqvTGWcPWyr1ROSqB
	mahrhwEoTHwf/FP1ikplfv1aH0tQC2KSNK+kNyQ==
X-Gm-Gg: ASbGncv9wZ/UwKnQb9FJN9xwCcp5AZC45yc7Ocf3Ozh6uyufrc1xTWlZMvGm3IVNVl7
	59uN1IDaUg+N0L5elbj2G6vNjWhnD66KLjUmS+5AVfmpr62LYqPWq93vKSOuDyc3XeyI0OCCMjN
	WCsfColUQ=
X-Google-Smtp-Source: AGHT+IFgTJGE+RjBrEO8OC8TeDJzFMHUlzAIhSFbfMnj8/Q8uFWtMIjrMUGLsz+zRCyCJyT9lKeUrhXtO4KqUE8JmSg=
X-Received: by 2002:a05:6512:a93:b0:546:2f7a:38b9 with SMTP id
 2adb3069b0e04-548510ce891mr1958352e87.3.1740497263319; Tue, 25 Feb 2025
 07:27:43 -0800 (PST)
MIME-Version: 1.0
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com> <20250220180427.3382482-4-vincenzo.frascino@arm.com>
In-Reply-To: <20250220180427.3382482-4-vincenzo.frascino@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 16:27:31 +0100
X-Gm-Features: AWEUYZlv7NPRpHplJoYHtLorhg9CL7rEI01TWd7nd5BSlHowCiDOAXdzpMqpzHs
Message-ID: <CACRpkdY8TdiDyZU7Wye=hj5csC=8HKBghPwFxggrhc=7nbwtnQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] dt-bindings: arm: Add Morello fvp compatibility
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_072745_267928_A626FDDF 
X-CRM114-Status: UNSURE (   8.61  )
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

On Thu, Feb 20, 2025 at 7:04=E2=80=AFPM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:

> Add compatibility to Arm Morello Fixed Virtual Platform.
>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

