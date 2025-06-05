Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC004C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNhfQTAqbTsru8r+Bj0ZAPYYt9rhG4GCErgMWfLnbw0=; b=eoCr6Rcr/WWBSuHJQG8NTcV+6W
	TSENd1VdmJKYqfHNpB46WdLDMSVu2GrX8Q/G2SQAsVvMjlQbVz80cKjX8lCLgBH2De7E1vPchLe1n
	iO+Zo8gJklS5umyeHtSKSSzt6Kn82AWtQ/Qfmh1i5DU68vZfaHMvnzmNoKuezIlkhzyKkwJRxNaBP
	lXvSGM09yxHuuszi8giJXc6iMWrCrfaJBGmaSzwySC90KybWsTc8cznXqVoQ91Em3bLQngYu6GR8B
	A9Mx1iHIr3b+UiMLWh85oD5lXD14dPgU7HA/95WzKg/8wVfhG6aMtn+vjHUNZCmtetlddQWJ2yUq4
	dV6emNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAZq-0000000FcXL-0o1p;
	Thu, 05 Jun 2025 13:24:14 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAMt-0000000FZ1C-1nRJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:10:52 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-407aac76036so638988b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129050; x=1749733850; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lNhfQTAqbTsru8r+Bj0ZAPYYt9rhG4GCErgMWfLnbw0=;
        b=WpKy4OkXxr1BnrmUfacUhS3A1i07nl476pwbkRHbooUYI164IAc4F9as1ANdx66bZS
         oT4zwm4TNQZwn4evuueJj1vsFJ9K2P5qIGbzg7fTA1Da1rL06D6fhjmuD9SGoR+plFEz
         CRvCHMfRHGtTXJih2H9msH9rlXaty+rhMFAYDWHXdDOKTb8VonBOmnA4WUHB0hmMIjWL
         5aV5OgGtPYQddDydYb3VMAcML1rk+zDHmXQyr8tzleY8xZ36LSPkDYPAgKFY3ZhmM2dV
         yGoIoJFy5kK9Q8fEqHuI3Pv4Flt9ChXe4bO+suQI+5enkfqQ7ezHy6z5hhUDRPf5KAY5
         7Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129050; x=1749733850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNhfQTAqbTsru8r+Bj0ZAPYYt9rhG4GCErgMWfLnbw0=;
        b=etB9mZT6vzjlTl+FUxIoG0K+9BisT/lxo7EDtuK+ZNv/rkxablp/OJ08IhSfvDSygo
         DqCUYHER2VZVAzZyAUem3mKm28+pTgacqOqKtOrqoqm5/FOdeEIUOVInyFjaJtmQcP2p
         FduOUXwxzXhamFgfqKHoVo/+qruC+O5b9hrDgRkH2HbV5+XUqVvdXVUYLmyfsCDi29WR
         eWcbpbJSzZ7wl6yBl2w1rA8qjOHxI6GUB29imSZUdRf+0/fCdwZOt+3Ha/u4kNAFyTMc
         SbG5J+3pWei9nQH/U7bcvLx+hPqmfVtCWvUoG6eMhYPQDeNf0MhgP7G/IVubOE+1W9EN
         ewMA==
X-Forwarded-Encrypted: i=1; AJvYcCXfayoNRdwXwVzgEnd7iCK+tdMvO04vjXhDsAFTNR2fNTC7YKolCTKKQzPQXfT0ZFhZ3ucW0nLu+3+8rxKlvjuR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4y0eL77m1DxCSicxnBwha4OLrmKq3R07dqUyv3pJp+Ek5DObb
	oGsgJmakTZ67w3VHt43SAKpxFzuRtkEP+6wcbomuRd3LqyoYBEpL8mGPzBZMN9e+D0gSaJpKmjc
	aqfOJmuIy4tWNViKsIv7poqPboYuyqIRtOaupHpheDQ==
X-Gm-Gg: ASbGncuCc2i0w+RbzS5mPAxutoH1qpjGwYEFxplpCOC3ELw0vFbe4n/s7ARXpSRAspw
	kcX1nha4nobHUYJ+xi3JUnGzDDQPa+r9iyslsQNl1cLSafqv5HsrY1JCUBzg3zUSrh1hta7ssaH
	elh5ffy5/ggBB7Mqe0yJfQRsQ24YdRzXzIfIf2X78XtfP6jg==
X-Google-Smtp-Source: AGHT+IGvvIIAi7Jeo7wCUNfCk7jSkX+GkLuOK4ORo6xtJdT9aBnzQchoGj+e4GjQ+z6dMP38d8jOt2O6RhX124Z/rG0=
X-Received: by 2002:a05:6808:80b4:b0:406:d4d2:ac06 with SMTP id
 5614622812f47-408f0ebf570mr5092773b6e.9.1749129050369; Thu, 05 Jun 2025
 06:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be> <20250523-b4-gs101_max77759_fg-v4-4-b49904e35a34@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-4-b49904e35a34@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 5 Jun 2025 14:10:38 +0100
X-Gm-Features: AX0GCFudWa3xhzs7XGXYYVHqIxskkw2POUeo_WNLoTByWb5TUaRlQJJrMo-9pQw
Message-ID: <CADrjBPq67xtfWNY7GZAa3uJeGs4Svt940hW_X2Xxx3Pb7ZY6uw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: defconfig: enable Maxim max1720x driver
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_061051_466152_6076B6A6 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Thomas,

On Fri, 23 May 2025 at 13:52, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> Enable the Maxim MAX1720x as it is used by the gs101-oriole
> (Google Pixel 6) board.
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

