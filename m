Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A3AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NIbM6q1x218b7Li1UvxruEIMKkwKF1Zyv43mPS1uqY=; b=orvQ855Np1hnPL7ELSwgJjs2Jp
	kr738zUYm9rV01WJo9n9K1KQO0fOz6YxdHvOoJlpQ2h65stinWDQ6z56tM7At75BSFtXcWQWu3vaJ
	rwRqOhcu0bXil8+eNhu53XieWyv1DDZqAP+KRZ2YWCWOSDzumbZ6WYPo5jeOaZYv0mUqYEcrsP04W
	2iG3FFfcR0gUPWkOiMuwlat2752HfU9L2pEHGDfp/hJTKq6Q7mZwxCvZ9eBj0tQZc1YhrF5O8z/xp
	fLIZc1gdFnS4pkSgeh0FoCW3VvmCHRxRsjQK4MQ0MzPLUZWXdXDV/rqLgEBeI0XvX951ZIESWqIZ2
	hjQS2wQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBeB-00000002DTr-00cU;
	Wed, 30 Jul 2025 18:35:27 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhBYy-00000002CkS-00IQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 18:30:05 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1789a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753900202; x=1754505002; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7NIbM6q1x218b7Li1UvxruEIMKkwKF1Zyv43mPS1uqY=;
        b=X6HRu2jdZMQw4BJchqxb3QYr7bKeeGC5FjuU2I6Dh7FuxSZYPaGADJsUd5XOMBNjY+
         AdgtiIJZfikLjall0pCF/zyH5zGi27MfcM9oaL8ehGtN098MgLuesPhW4zUaFxfjKPcz
         PeRyzgXEr7+E1EpD+VXTK0K4v5k5c+LRPl5os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753900202; x=1754505002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NIbM6q1x218b7Li1UvxruEIMKkwKF1Zyv43mPS1uqY=;
        b=brMJHzXpIhuawFDQ7DRBJfamXrw7Eu+tbKR6lM8tSGbP4UGtexw1aEsuCWXT1FeNQw
         A/wXnR7GTGazENVMQLFjffZe/+a8xQO9Wr+Tabq3ZTerPSIkIyza5zpZO2cEQNhVwMit
         FY1buLFJJ393fUzpTVgt7zLrgQTH+ptwvPKzkUFTuZSFYJuAvQOyMQ2WEWasv1uh+rZD
         MP4MwMJ+tCb0FWnHWUQxLONNoJHH46q/qtS08QHsKZFPq0aO/9oZXFvaUhbeqCELW7EM
         I++h7D261kGWuIaNiTbhVqjygUiw6k0z3k8K5n93HDdU0PCCseAeqPvPtLtxL0uxnvwo
         Ay6g==
X-Forwarded-Encrypted: i=1; AJvYcCX07FgziKGYfmRpo3oy3L9qOFzguUYcupZFXBIfI2naBBsHHa+SAkLe5QA3+UDYlINSKzxtRkUsokf9Gz4gOI/a@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4xMwDwYYpX0ppEP+LwCTRqRdW+Bys2rRZ/959pnClgBPhV38
	wcLwyalWoU6krEG1sbLaOuBNalHpGbQRWKshYZmsqeb7G1mqT+dXlhw7RMOWed5XxDgbsD3RgEl
	RgCMfNZTRicAQyT1O6Kn7PdWixJtWBdryvr5Psyd1
X-Gm-Gg: ASbGncsrRQ6ylByXum8t55hXHrn02EcCcX+9p2W95aWLU04fEfZPKFyyKF1oRJ44Qr4
	R74rrM2raBWH8w+QblkNqCltXdD/BF+FutfPdCQrdDIH5ovXo0J7YlIjupNJAm9vCOr0N3N1oyk
	/YyhUbI0rek65rZMoY5cD5u9lBXnVKp6FB8qUY5NOXrB0oOBcYkOnE3r8nbDXSYxrCvCaAvDirj
	1MoorM=
X-Google-Smtp-Source: AGHT+IFbbK/ul5EAl+qpurW8QCD6MUFcOByL7/YGvDuMq5A8bS06QIOt2f3QRAN6xuePrLmBIsEPhHn7xYqFra8YQrM=
X-Received: by 2002:a05:6402:d50:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-615a5f03c3amr15582a12.2.1753900202156; Wed, 30 Jul 2025
 11:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com> <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
In-Reply-To: <20250728-ddrperfm-upstream-v5-6-03f1be8ad396@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 30 Jul 2025 11:29:49 -0700
X-Gm-Features: Ac12FXzJRbNK4O4rQzoS61E9llbPlM-a0El1zXFqw746Wesi6zAN_YlMACvZJkI
Message-ID: <CAODwPW8ZXfMdFL2=6ht+BvQq5_LQkwHhQJT5j9DcseEx9naXxg@mail.gmail.com>
Subject: Re: [PATCH v5 06/20] dt-bindings: memory: introduce DDR4
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_113004_041290_953B60A2 
X-CRM114-Status: UNSURE (   9.03  )
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

> +title: DDR3 SDRAM compliant to JEDEC JESD79-4D

Should this say DDR4?

> +examples:
> +  - |
> +    ddr {
> +        compatible = "ddr4-ff,f", "jedec,ddr4";

This is not a valid example for the way you're defining it now anymore.

