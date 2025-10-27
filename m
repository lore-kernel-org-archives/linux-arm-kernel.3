Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40871CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=; b=zhpfh5/37s0xCulMRZ4Sqip+AF
	vbN8pRJW984PqwyQ1TZHSnqsxNJ577CvqYbw29S0G3eOzWXUK2JfsTsX9yD7isEjhoYvSGjo9BirJ
	yKp6vfv6BnAIJWaW5Wzb+5Il6N9l/ufGJJgUEiXkcsV99BiO35G5es70guPHyo3FPf6OzpeR7VRhZ
	UwFSHIJSioxIkAS7Wq7bkiD54LsB8/IpxoAe87doBMR3BMLeNrOWg7xWKX25J3yhTAFMtzdMl7wlt
	l2rrd/DTKlkzVwS2NPQ87Xvc5FGiO4Yin+5L8RazyqCrkt/vNctmftWXX1oxGJisKC8lWcigI6UdV
	nvn2QV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVRJ-0000000EpuC-3IFP;
	Mon, 27 Oct 2025 22:11:45 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVRH-0000000Ept1-31vJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:11:45 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-36bf096b092so50711371fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603102; x=1762207902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=;
        b=bQUCzIa4GRWHSZgjP2hK2opznMRLdCcH/MhiidStvP3iCsjALBpktOH11grp1FDAhQ
         L0G5mXxtdltQtUPsp91kw25b37kpOp8uiT+UQrVoCbMZf+pBNi0vKlhHrZuRePcy01cy
         WOXFbhhLJyltZGHaRIx06SIBM0pbB/4f7WuYSZf3asFLfHSzcraBRKXZg1y+xNBjca66
         /11xfNJnnjsRIh7IGuy9c8cdEPXRaoFBkorGIXVEpC98c7iENn8XnJ4Eh26b/p7/Wq6C
         qAdC8W9HjOtdnEozpEONCTQ7tJVPdBjFTG2LmbqZwn1k3iRtWygScZsoU9OkOZuln9xr
         I1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603102; x=1762207902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tdW9Tc35Kw3/0Y5blWohgMonE+9zr16T+U6ZKHumPk=;
        b=d3xC9c/VZB0yFR+w29ocrw5Rjeko0XJ3CKgzfu5jnkaNPOMmmYIrPzWklxtESvT/vj
         RL4CZgRCyMyQmNGHPwx9eRytRkntLPTE0Uu37FQSmwsWr2weBtIyexxVXbbfgb2GNXxg
         gxoFmSLR6X3k/P7eGMd0ZBplMTlUKJm/SYrokDdYQLdxYbRpkjgbqr/JZvGBJ/xS+rK7
         pplimAzB7dtF3mk8UftYllGjrVym2ig6j4SctlnE4z26F9rgN3pHyqh97CQ3uIou4A/+
         nISpnVtXIAaSjVvVDrlwVhX6fo/btv117Tu2q9qZrYK1fXEHEqYBR4WurIRLxT4MUA2V
         pqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrNtMPpYEjAFuFGyG4hPBCDhCnaZb1X6U4JCoWceKfNLAIVLANNenaGiWG67hz1Efd9l8CHA4/dI0rSichqZfz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3vHza8UUEBLOQV2ONtwWODy5CHpBIl/VREwpO0Z/hbc4O1GIy
	10cjPNqVti+OYI/LqfFI1NYrNhUhkYYTZEMeJzXj7BHiSTR61YO0xgg0GAS2RGYu94rlFX+1j8S
	aOWByB0L+LCx5BWnm6YmgyHfEEvDidme9aJSznYvtuw==
X-Gm-Gg: ASbGncseKJC4t1Un74352hMhablwFIPGUEkHt86vpMzbS5n/Ej7MWUHbAwjD0U5wAoL
	/V1GJ+0WxDi4gqAfKmbOC03SyEbTr3MdZ+oBz9SReDcKqoNS+wvCsjsuXlewJeTElPlav7hLIkX
	0jFiRDNIo6ylmUpLraGR2wBt7rgQQUkzIXlbyCw67w2JpLM3/u8/TItxh4+ow6RG8cTYBH3RUBX
	V5z0pyACKFDWfvdZSx9OWQ7vwYRcl3e0uu+hsjT58hdLtSyS0SbdrKXN2T6
X-Google-Smtp-Source: AGHT+IFLT1ZdWr/hhEMnm9sTGNuOU2VvPh+C7lrdPQU4P+9e/YVXxLQp3pBZJvB8TttzAJ2Uq4NY4gf67nRQdQ5ZGG8=
X-Received: by 2002:a05:651c:885:b0:372:9505:7256 with SMTP id
 38308e7fff4ca-37907711530mr3518411fa.30.1761603101693; Mon, 27 Oct 2025
 15:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-5-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-5-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:11:29 +0100
X-Gm-Features: AWmQ_bma_Zx4YiWdv5O86TAgEFt04A-92MDE252FFHP4HKRhB_QpFTlP5ImwzJk
Message-ID: <CACRpkdZHYWMezkPq55Xmfj9U+0pALg-DJaR2bKXA95s_ptk8-Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/12] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put-ps'
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151143_925269_4C0CC726 
X-CRM114-Status: UNSURE (   9.15  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Add the properties 'skew-delay-input-ps' and 'skew-delay-output-ps'
> to specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

