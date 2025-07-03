Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF31CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=; b=jgbKMsCEmSXBGoqemftoctJss8
	vAn5Ys2d3J4BmAiVyRFuJVMzdYn7YVJ+LcQ0QRgGOIRanRB7G0DqOHcTiDClSRyjVhbPw+3xzYTZ+
	timu4Hp58TC3JZ7qlDisx5Dgfq78lHRe9/1Fui9CxjkL5HKqxdzcq+OmNBYnVRCIQruT2oKbundSp
	WNXRh4AG+zaNGifHeg2kXNnSCw1rcKAzBKuAQOo/ELN5arM1VUgroL2LLaMGUSkHY7YxqXvBGqr+I
	daxzgoymh5oj/tGEFA54ME42mpjmrbUMMHEPWo3zXUPLZl4crCqYy9NIJMKyYX9XnUtJqWCixjr4A
	yyFXPJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSgV-0000000Cm9H-2F8d;
	Thu, 03 Jul 2025 22:45:39 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS2r-0000000CfxQ-3ZRg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:04:43 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32b910593edso2745591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751580280; x=1752185080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
        b=L2Ugyto3sWXqeZ3Egw6G4uPn6++pFoe1witiRL1XufZ2Sxg6jVF39ePjjMDHrQ8UZs
         jGEySYIepScZJZGoWcGSbiSwqqDeHcmbx4AODmUX9pXmRo/4vx31anuda0gsL9Q7XiN8
         ZZM9cs6sVFRWeWUBJ4DPdgcNZWc2yvT+1AJF+oQ06YLjp+AYWsqYZLWjc4HGvD6SzK8v
         cpbtvg+lqnDhPe1M6ftnRrv3p4ELhPctMAQl9zWjJYvXAQI+vT0ugIsO56/wyrnRbjLv
         9/qP3zUamD0qz99AmpiGSUa+7yE/rAqvkTAtNqGvPYkSRiB59adpfeg0AX4Ji6SyFJlT
         Y4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580280; x=1752185080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYlX3ZZkKCv0zsZmTBGfcGnARoW6yQhWGD9ntTDvZCA=;
        b=khPx3oldYec0ekSEhc7DdjQlPPpy3hZTVJr1VecuQYQZybf97QaAY3fiwqQVBc1mjS
         +Ra8FB60uUgX4yD0+mDl1p9T1blhTx4o8eINjnmwogcpASk8eNeHqQgvzbP/jakJlwpv
         h3nADhEbFMtHwbAyAiiYKCcb8uCMmjzHsXgIDtJtVnI+HB1ugBtQgHX3RMkHOYKTS32T
         tL6aWPbuq2dZMTgtNSRM/IxQl3a6UPrkMW8q7uzxDg67O/mlFlpXJoilQUL46p3sagVU
         Wcy1UIujhpUZR+gmKxzAgqcbfnCbFW7X7Sf4mHNTdXJ3A2qpAR6XCUD7u/tDcfBFIVr5
         qKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCp9qf2NDsC9PKi/Evn1EieIJjXYQTIs7uogRqsg24yxECD3Nf0rovEmfB90u8U5BHCTsMQTTKbguoc1ub3TyX@lists.infradead.org
X-Gm-Message-State: AOJu0YyRano1lqLTHAcpkY4gJbR4dR7yU3ouYclidyvAuD8M6XZDY51L
	FRuM0X7Ku2q+0x4AddYmDK2k+CWJftyp0w5X+etMvsIMn/YEjUYnBm61z9OvoorXJnnPbz0ge5v
	lCg8nJs77QC0+a/IBjeZhEe0dYHvSCTNQnhX/7GdquA==
X-Gm-Gg: ASbGncsK6KvaCzJmIdj45mfXQIGH9nL1GEkKq9C7slnY4FfVI1LNmqQ4WLlx2LsFH15
	kc5xaj3VMvjTvm6Lx3rzpGRN2UJsEQnyQUcPWR1zNzBShxnIUGrjTcVNPJTNyUavWMohFdfoY0k
	fP0Kxzz7YsfN3UNlaKZzUk2O/hjOrkTnkKYIXE4BkGRFo=
X-Google-Smtp-Source: AGHT+IGImGMP5Fq/y4gpdZAXe/bNUj9t48oLyRIX8c3HTSvwJygjhM/8i/8L71e57dTnyWSS9tDnQTa49ULtKebAmMU=
X-Received: by 2002:a2e:8a8f:0:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-32e5f581285mr443871fa.10.1751580280107; Thu, 03 Jul 2025
 15:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250610152309.299438-1-antonio.borneo@foss.st.com> <20250610152309.299438-6-antonio.borneo@foss.st.com>
In-Reply-To: <20250610152309.299438-6-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:04:28 +0200
X-Gm-Features: Ac12FXyERrVVYpDPvl_uPGT_I6xGEjEKe5SU2NHnd5_uoaadOpsZN_FvQyb9INI
Message-ID: <CACRpkdbKNDr00y9-7gL5vixuvtdx7WgkPh5krGKkW9fNizx_HA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 5/5] dt-bindings: pinctrl: stm32: Add missing
 blank lines
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_150441_905381_79091473 
X-CRM114-Status: UNSURE (   7.94  )
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

On Tue, Jun 10, 2025 at 5:24=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Separate the properties through a blank line.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

This patch 5/5 applied to the pinctrl tree.

Yours,
Linus Walleij

