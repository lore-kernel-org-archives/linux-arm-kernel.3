Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8389CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 22:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX+5unsZ/nIc8zTlOk5LEx289kMidILELWKfCtaDFTo=; b=gk4t3P50ojqkgog8UbzqxgUExn
	2u1MGedFWsNp06ejMLsEx2LZgVjoCNRTPJsOXHQlihJ1rUIzXVu6nZ4g0j29rQx8uNvdtmxg8qtEW
	aN+cXxbyWC6ZEdDbavmEVXPC8UerA7+g3n73CbF9slPX5bNqNg7KDT0SighW7lD5fMUe3K233kjLJ
	Jz2EAmMe40oGCa948blqoO6bDIDz/wgIP9xC7+laZDzcbjtzSzIv3JPF3GX+EFZruBVXC9+5AdqTV
	rKL+sxAPulkCO1H3O+il/UkH+DilTYizkLwmAI0beeLXThXqX1Ao9xUazYZDwCm8TCMTs/G+/+qT7
	3S4/I+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WYP-000000064j0-1jZP;
	Thu, 16 Oct 2025 22:34:37 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WYM-000000064iY-2n7R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 22:34:36 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-363f137bbf8so10775001fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 15:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760654072; x=1761258872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX+5unsZ/nIc8zTlOk5LEx289kMidILELWKfCtaDFTo=;
        b=kockvAAh8SEKYEYIEeWg19xMRpHOECA1R1BHyTfaBrEEJHlt3dP6GrZfPftIEKJXOE
         0E793z2gXnm2Dr4cCqez0VXe0TTcpmkZPN74B/kHALB3Ju8090h2/kEu6uNytSjs7iDC
         FfmfIFAYDoquTRoSO5k40suLw08MAUPfRqErkpr8wl4lzDq19mp116UeQ0ye9ejOn+Fl
         oa37Lc/+6a2PTt3LjO6EWq0vH/T972/bQ8RN6mu/sgq2ljYJtrij8sZbBqvYUbW2bQvf
         hRp74jzNdnyihQkssxdXEelEacAaPZE8Pgb6/fbkw02p92HS2ky5u8R8oVs8ZWrAaiU4
         FgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760654072; x=1761258872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX+5unsZ/nIc8zTlOk5LEx289kMidILELWKfCtaDFTo=;
        b=tBhuGr5m3sOFJb9m5D1kX6NnjiHQNUIBICdrxh1YfHf+w3FmINUIHUxMh73rr2VWeG
         F7Hpk5/uFm+jFpe93HCSWQLbuQ1Ecwg1mUjOJDewGHYvNImV8kUZETLLnAc6+Ur4W/6F
         dC0mTCbI7dx2qbZbQnj2OgK9XnOiEV8RXHajo4IRQMRZ5EiHNMVJAkTcVXLQmojRyaIH
         4zgVpLRwlG5mXcxwMhHx7cpblDcevKMELmLApsQ+2enyEs0bOvxpWJyuzPpg9jniJJww
         vbJIre9yvb/yvOob++qLrDFlGMCvtrkBiLoa6NUIqlhvg3/Mp5edbP7BrtbQIg/ORDdv
         l8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrMqRY9wvyid1RugcrO9sW1GdhQPZRZ8iFcMV+ikwjeG5yZOxEcysbCh7EaqhSQSpjKU0Dk4aiyMOpP8AHP7lY@lists.infradead.org
X-Gm-Message-State: AOJu0YweYlnT478ocRrjYamPsnDCh91FK5ZhHttHeArB4fZan5zoB8qr
	tlL7Y2OjtBhRe7NCTQy2NJuZQg+67Tvht/2nENczS3Y2Z2/PwoCoKD+ZBhhuSU3m5yy5BA4oIpU
	RM2rhsl2B2Whp+Yjn//os6IJlztu+c9d/oxKs8Ou4Wg==
X-Gm-Gg: ASbGncsPqiAgv+GBwP7cGPyXJadFSt4ggKq3Eh3i9RVTpYQ4vOKWImnTcjcC60hYkBD
	KDbwlGYj4nPk+GKpUN6FCrpi2oEE2IFJV9E/RtwpWggJWH37ZxuPyPBkQHW4Tv5PHKvE5MoaMnD
	cZATihoP3WQnHRoPcCOsZH+wAKgsUSn1HGnt+z20AoDAc+4Hmoc7ALbL8o8HNt1wxmBju/tzZe+
	m2XfXAAK1amaqe1ZjfrWKINs4L0qVybC4P/M6ojagGQEvjjLJ3Wk62YDs0B
X-Google-Smtp-Source: AGHT+IFA4cyVMFygunIvR6Sb+S9YIRIcOrQFSwrOM7TfF/g+giPJ+nTPjzhR5YZOyLHNwAaJZrRx7sKEMrauQ98ImcA=
X-Received: by 2002:a05:651c:1b12:b0:376:4320:e362 with SMTP id
 38308e7fff4ca-37797ad8130mr5292681fa.48.1760654071781; Thu, 16 Oct 2025
 15:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com> <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
 <20251014-water-gown-11558c4eabe7@spud> <7ba7c2f2a6dcfac30f05b35a4f41ef0af2dab575.camel@foss.st.com>
In-Reply-To: <7ba7c2f2a6dcfac30f05b35a4f41ef0af2dab575.camel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:34:20 +0200
X-Gm-Features: AS18NWC4woaW4Og4j92NIZzv9C3mFxPWXkXZf-tyb-63Pv9rPBLJcNATzKQalio
Message-ID: <CACRpkdahbDfu+ffZC50hPrZRRo85_A3WUr8za-D7_tRJA6shrg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties 'skew-delay-{in,out}put'
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_153434_872872_B010640D 
X-CRM114-Status: GOOD (  10.90  )
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

On Wed, Oct 15, 2025 at 2:52=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> What about the existing 'skew-delay'? Should it become deprecated in
> favor of a new 'skew-delay-ps' ?

Maybe it should be deprecated I didn't think of that.

I think there is no need for a new property to replace it,
your new properties can be used, just with input and output
skews set to the same value, so hardware that can only
control one skew knob should complain if the values
are different.

Yours,
Linus Walleij

