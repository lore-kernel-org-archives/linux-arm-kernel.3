Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7226FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzvlZa0RLOwah5/5+7opK/gC/tUL1E7R/7woSm4zxAI=; b=CxL2t0ZVMDkVWunN0qDZmn9K4O
	J4Ht+Ug8p+WjefEMCx7ttLRAWD2yEhZB3UDrV5jn8XlbC878V+n5rQzrF3Q+KotiYGgpfxo41AvDn
	LZlVZW2/13CZmL0wKbYsz94CEH+8l8kwgGKeOE0ofYqtt1JLmjZWcJsK3XWvqbWBXhi1s2ZwssAlU
	yi4fjs9GfU0VaFjXD3CX1r6u0n3yu5x2ei96sLZMu9yI08ktLoqlt0WexrOnqf9BHh5o98nStJul6
	eyjhcQuwRsta2+IrD2xd22/FCS1yxfM6KAnDKByv20rXE/o6Z01xTPtTQZblx5DU15AsTkG0bhZjV
	ucWO5lYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txN0T-000000081Vq-32qc;
	Wed, 26 Mar 2025 09:25:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMxO-000000080vK-098p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:21:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so45709695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742980912; x=1743585712; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XzvlZa0RLOwah5/5+7opK/gC/tUL1E7R/7woSm4zxAI=;
        b=ajEgTvYiOuwG7IBi2w5dv3On1rUyVLaijadbjCKfkZak31dwyDkbYVNSg4JXs0/31e
         SH9G/M5BUoNdCpsfY4Bk8g+hhgNN6NwKKf5hWPi6c5xLJ1z/c1fDS2JYW8Ffp+yhWzhF
         8e8KNlc8uPI/09Qkkrm4ycNQU82y/LpD1NbM0jA06vjr4H7r4eS6fo9ri/+kVU1ui5+U
         eHgRcuGeAT8mN9M+8Iv8H50xhbYJvulDyYET42b93sGUnH/FbYKIbSEZHyFf9L2fgTo8
         hDvPQ1MpfaCkAjXHXCmPNwX8ZzbYnaB3mXtaFKt8kU2Dc0Xid+Wi2GGDjSkJ/khf8AM0
         ZnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980912; x=1743585712;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzvlZa0RLOwah5/5+7opK/gC/tUL1E7R/7woSm4zxAI=;
        b=FomaeUAYh4kpE/tsTrkqNWDjcdUj2wA6W0j6itJovoOSsa5Bzm5rz5/jT7aDlSG7WD
         T451J0VWEv5BbuOIzU9eClR83s1RNYiAIzX4wQBLglVmaJFAx2AfwYhL+O+UdcnKQn1r
         K0kpS6jpIHRAIhhvwhhCGscOD3UnsXHI5qc3UUeSQF/PTXdnsw6o0+vVJi/vGsLA/eUu
         EBUQjwsOasBKnCGTDq6aosq3ChetKdAHjV8LMa4HCin1d83ykL7VATT7H4Sur5R2E5C6
         8SueJurwVvxBaBtQGewdZ3iqFICtrAnzCHc7ysgbQgIFNQAaT/uOaSwI9JxBkDyfpEmz
         epuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCUl6A1gJkWkcnDQCE9XewmRFLPo8O3ZTHLnHbYuLMHrBS/E0M3BDwvVD9dIbhufstzSm3p3NIAwN3QRUm+G2/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0UuF1GZsEthqHid79/YYJVw1OEotDjexlGcu8zYcJgghIp3Uq
	EYhwXGWTUyunXLKrwwOA7TSCdZwfvXs1HD3OR9jTAV7mPMzgaJ0kbTsjEGrsl4Y=
X-Gm-Gg: ASbGncufjhx/jfm3O/2tIeU461rEw7GMYu6ieN3LPjjdvQ5lrIC6MB5SHe7AywpEqdc
	jIIbsmEn00oEY0D/8XsHmLyxL1da+S5piZHXmPBVGNNZ8B6lPcbS1Dlj21hXEQNLyAX1FUKqECk
	5aZRh7FeXADUloGgDS+HvtlaP2kuAfFE0cO8oWaylMjGh0WRF+9MnOeYGlQFAPwdGF4Mpv4XmFl
	oByyGXcD8wtrhwPFa9mvkKF4Ydn7TeduBMhv9v9abt2cqHQmg2qlgcPaXyzSFuUAErgY/5GgyNP
	nhqRqZWWiclQs6N/NTb3azwgRY6yqIFRwMHTT8t82THX/omUGA==
X-Google-Smtp-Source: AGHT+IH/DQkGwgvRuYj69u9dS3vyMOIDJgfTWifdh7zBGB7Ug/fqE/cY+y8J7X5UhPZzF5ii5sTYVw==
X-Received: by 2002:a05:6000:188f:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-3997f932ea8mr20348477f8f.44.1742980912202;
        Wed, 26 Mar 2025 02:21:52 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a50c1sm16436433f8f.38.2025.03.26.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:21:51 -0700 (PDT)
Message-ID: <4eb7800206faeb3bb729e28e7785595e196a12ca.camel@linaro.org>
Subject: Re: [PATCH 08/34] mfd: sec: fix open parenthesis alignment
 (of_property_read_bool)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:21:50 +0000
In-Reply-To: <e91b214f-3198-403a-be61-fcfe5645be61@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-8-d08943702707@linaro.org>
	 <e91b214f-3198-403a-be61-fcfe5645be61@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_022154_073901_99C1095B 
X-CRM114-Status: GOOD (  20.96  )
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

On Wed, 2025-03-26 at 08:06 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > As a preparation for adding support for Samsung's S2MPG10, which is
> > connected via SPEEDY / ACPM rather than I2C, we're going to split out
> > (move) all I2C-specific driver code into its own kernel module, and
> > create a (common) core transport-agnostic kernel module.
> >=20
> > That move of code would highlight some unexpected alignment which
> > checkpatch would complain about. To avoid that, address the error now,
> > before the split, to keep the amount of unrelated changes to a minimum
> > when actually doing the split.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/mfd/sec-core.c | 10 ++++++----
> > =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> > index 83693686567df61b5e09f7129dc6b01d69156ff3..b931f66f366571d93ce59c3=
01265fe1c9550b37d 100644
> > --- a/drivers/mfd/sec-core.c
> > +++ b/drivers/mfd/sec-core.c
> > @@ -276,10 +276,12 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
> > =C2=A0	if (!pd)
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > =C2=A0
> > -	pd->manual_poweroff =3D of_property_read_bool(dev->of_node,
> > -						"samsung,s2mps11-acokb-ground");
> > -	pd->disable_wrstbi =3D of_property_read_bool(dev->of_node,
> > -						"samsung,s2mps11-wrstbi-ground");
> > +	pd->manual_poweroff =3D
> > +		of_property_read_bool(dev->of_node,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,s2mps11-acokb-ground");
>=20
> I don't think this code more readable. The continued line should be
> re-aligned.

Agree, but I've tried to stay below 80 columns. I'll just move the string t=
o
the right in the next version so it is aligned with the '(' (but becomes a
longer line).

Cheers,
Andre'


