Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227DDC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/WRM1ywqimJ2aPAr2Tip0blUkgzcD//gX/qp+tJeTM=; b=O9S2PpCEmfDbN6
	3PDwOG585ijhauxxT6abz7Qap7kgbb2+yIsdTB4sSPXiqtEuoKt+0YmeLzCd626zQ1SK1QEN1Fz9p
	AqiyK4qCg67ixWT+n+tVY3LAAs4ESpTNdrY8oJCQ6AtB2thY3vbCAhiK0IFlL7K7WittkkDc7CyvQ
	oZapvq+3Pd8eNyCFedtiasgn8Z0QgvrCD3Jra6+d3OqY8RQcxesUlQmhWyhGsfg7T6dogqZhnP1vg
	+qkJZMmZm+6QI1exc3uzo0eEs/XADiYCziyPaCJpe9dLJux86eM+acSuDJGVpw7rvyPTevWQYjrgE
	xa7h7j+T1zNt/4qyK4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhoS-00000008f6E-11Z3;
	Tue, 14 Jan 2025 14:22:36 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhjo-00000008e2P-03Y5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 14:17:49 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-304d760f0dfso44072811fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 06:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736864266; x=1737469066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/WRM1ywqimJ2aPAr2Tip0blUkgzcD//gX/qp+tJeTM=;
        b=TOEvyvcPwCFjthVkJDLE7N7qG3gAZXhf+QafflXmv2OkqMrpDpWHZsfK/wO1AwUN84
         gsrkcRZYNXIky1dNW8OqtlcPjiGm/MeaYjH+fpyGcyeWrlA/+Ic+Njb1YKZSaERw7aY/
         3koPWwgSe0TdaBGJkGhad8+GdJUjSpjBxnaEG+N7XR/E2JHVwUmkfDET8Dq+aDoOs6fb
         oMPNt5uNP3D4x9F9sBhrF6uQHZ+kYbcPYSFqSYNM0MQvjYeop9NgvUS06JxB8oHF6avX
         K/ZufmmaV8h8M9czyEWXg6o83r/CnEXCYlpU5ptqF9iAiFO9hm5hD7r0CXxsCGTaa+jB
         jwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864266; x=1737469066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/WRM1ywqimJ2aPAr2Tip0blUkgzcD//gX/qp+tJeTM=;
        b=CVASCRLcVIFXAMhXou9kHIaCSEfuPFbUkXVkSz1bZKjoH7a90oMGxkfocD0U2704Zi
         MGYLAiMne/u8GA3x4RzhCJXIet/3VQWyVxEgDNpwFtfQLi80Ip42vVZ4PcwS9U9MREqZ
         vFGj8I4EWCRXjB7areqnJK2pDDJKiOgp6wqfwDxzETJAz8ysCk+mQ+8bedtzVMKYv3Ij
         9OeJLsiGeBarSixPAXTAm969pRiumGR9Q6tEfprJC9HqdueKKBcZwF908ga+/S5KJLQb
         ufxmis7BTl2SSb4gEtd3yU3zqxGBaXQWr3ob3Sq/NODge/iaGJL/GRiVN6zVou6KWpxk
         soOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVthi227Z+Bo+lSAJ3kdQcuTGmkg+cxq0B3xQcIHgDTXKRn0sykgcalZZXqScrS9uP1zxZZJm+eMmwzlorsg86@lists.infradead.org
X-Gm-Message-State: AOJu0YxHxXlFDO8S90KjkCjiH1mT9fze17XbLDG2dXdnBZJV5opBFGqe
	QE4AFxvV2T9sOlbm+1JS8Nv71w7AD44CAxK7g1882cX0MtRvTDz8D/mn2c4iWgbE0r4kngyhflM
	aSBBRuYsF5YVZ9aRb+lDv7a+m3gJUMnIaFbE9jw==
X-Gm-Gg: ASbGncsbkkB34IldqFTnKb42KSnwvVwmEA2WEjamTDPiQBGGXj5+EqEolt9+9H/kyNk
	AM/wLd9F4lWDS3SFqQqEJHAUmCJhF9ylm29VK
X-Google-Smtp-Source: AGHT+IFPFJTmNosakpUt5JU8cN5nBrvR7+LTD4fCMkRrHXEcHL6oNl6Fgp0ggW/W8QtR1cS9S/mGb7h5l9NZcPFPlko=
X-Received: by 2002:a2e:bc1c:0:b0:300:33b1:f0e7 with SMTP id
 38308e7fff4ca-305f45478f1mr79313431fa.10.1736864266081; Tue, 14 Jan 2025
 06:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125836.225447-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 15:17:35 +0100
X-Gm-Features: AbW1kvbukVMqrBajLgYQt1hKpFELkNSEFH3GzkQaHu95dam2b6lvaqOS79Rlmww
Message-ID: <CACRpkdbJziJ0kKqZLrBuZ4G5HmnJbL5+j8zJLQ1H+q8NE9P3oA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_061748_048902_734190FD 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-gpio@vger.kernel.org, TY Chang <tychang@realtek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Krishna Potthuri <sai.krishna.potthuri@amd.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks Krzysztof, patch applied!

Yours,
Linus Walleij

