Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF48C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 21:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urCBknSfoBxunYc3x4TdwqCRcefY8UK7ESNufBc9V5U=; b=Gx5SQKHsZsabZCLZ5yAh9rZLWp
	ADcNAKPhPiyu/aqPudbTWlNSaRU0lK2BTwi8qHGtIu8HANxl/MojVClmWPkE61ofnJukWCK/SOkW1
	QrimC+VG4W4jnx2kyS0Gc8QqjwFDQzfnbgeeckC3Zx7h7PElAAVqEn/c3x+qc64ct/5bPEUaHFEHq
	hObUYQsz73Zl1i5suZjVsGLBcyI2EpyWgBxygHB1elYwdVvKe/qDjwg7f1F8sKHB26OEbS91VPei5
	sfyFTrz8QRtOKyvJYR/rPhBR3IqNomyOeJCA4HEhJOt+6sgo9B4aQ30j1g98fapxmtYCRNrlSb+Ih
	4JxuTmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehMi-000000060Cl-0QJG;
	Wed, 23 Jul 2025 21:51:08 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uehKG-0000000602y-0nPF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 21:48:37 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-611d32903d5so3504a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753307315; x=1753912115; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=urCBknSfoBxunYc3x4TdwqCRcefY8UK7ESNufBc9V5U=;
        b=i6Q1njvfQRkFzSRTW9fdnwULLmJZrlMRTESlAccUZ7ymjdGAWu/ByWy3aM+sTpvOUU
         BTBOot9cPv3Fgz602dkpfDx8qaPJJjewWp4Ud7qq4gDSkoTEWMMVyQRhibZwZ6M6kM/T
         31KXh9pO3fwjLECK9gL6gLKVPhwYhDaWD7mTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753307315; x=1753912115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=urCBknSfoBxunYc3x4TdwqCRcefY8UK7ESNufBc9V5U=;
        b=TKDK7VSysnucUGnnwrGdjfFYocwEpIogZ8sUeE/8m/3+IsNNtxMiXl0wCtN9vvO8r1
         DGYRu63Q0HXy6lSy2YHXVexEFMiPvPeCa390enEIjU0YuSEVy6Tmh9tcKEj8k1Wt07Kx
         GpYeO2x4Jbrb3dMosk2ruAuFmZRpqrk3fZxs5jSFqBVelyZK/++8mMtFU2WHpC5CRZ4I
         Btr4Q0Ut4nzi6yb5c5Eu2tNgGiUEMN8s9HNZKnv1ugl5Zdf2Vo44itgqscUoCREHPw+o
         H3xyTHyjxzDO+R64sywofWBw6DccORsJo/skFmiDkhTTd6z24SG0WgOH4G47dbVAmK9h
         OWww==
X-Forwarded-Encrypted: i=1; AJvYcCWUsgVn3atNlO+h+l00rGr02SlD9QVckY2Vz/OG3EtHWPnhUhmV0IgfMUz6PRjiMYBXiD5NkO2v9XYLBEvAxulA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7JxmeAoSMEy2oN0nxVtfAD3RVOCjYu0bFPJ4AQoDHJr7BYChw
	2JZE4B7fWIXqAmNeuyC6K0eItvrQggFu76B+uQ8RU5Iar/ncK1zD8k/20QejQ0oA9fRUFk1AaD9
	iid+GDCu7EaNlpZXI7YVbX1bLVWrlJ+2HWqOCKMB8
X-Gm-Gg: ASbGncvtRZf/XX1HHQRVnRyiSbVxwwMnYKiMcdwE/vnUs23bhhembB3yecAAFJ1d/jD
	onxtSEre6ZQZ70Sfb5GZB6JrC/bS4+BzRd/Jdtqg1FYW3quVdVfsgXUKON1d9bLHJaMW8ZmuIao
	GMLvQJNJDVAM+x7b5NnXVb0LgCwi1I6AfgpMkw9eQn6nvnAis/UbxifcVh7YK1Z7W7wfBmggWGQ
	wH08zfkYCODMg3qO21j+rloIZgvB44Qp2Znd4urT5+B
X-Google-Smtp-Source: AGHT+IE29O588oLM6SeiuCxCPB4k1tkTOOJCtmrayG7KngivziL2hZUa8WDJp6fjlpiSMU5FMaGeqaamK89e2HKbNPg=
X-Received: by 2002:a05:6402:cbc:b0:607:d206:7657 with SMTP id
 4fb4d7f45d1cf-614c4dff31amr25156a12.2.1753307314360; Wed, 23 Jul 2025
 14:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250723-ddrperfm-upstream-v4-0-1aa53ca319f4@foss.st.com> <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
In-Reply-To: <20250723-ddrperfm-upstream-v4-5-1aa53ca319f4@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 23 Jul 2025 14:48:21 -0700
X-Gm-Features: Ac12FXxzDR1_uTCXgfJ-I1tKRpXZw5fnYQthEfx3HR3N-6vAUe5POy6l3eogw2g
Message-ID: <CAODwPW_kex5Agqxg_i-XC308scEpUJU0me55G7iZ8nB9LC0acg@mail.gmail.com>
Subject: Re: [PATCH v4 05/20] dt-bindings: memory: factorise LPDDR props into
 SDRAM props
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
X-CRM114-CacheID: sfid-20250723_144836_253041_5F89D70B 
X-CRM114-Status: GOOD (  19.74  )
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

> +      Compatible strings can be either explicit vendor names and part numbers
> +      (e.g. elpida,ECB240ABACN), or generated strings of the form
> +      (lp)?ddrX-Y,Z where X, Y and Z are in lower case hexadecimal with leading
> +      zeroes and :
> +        - X is the SDRAM version (2, 3, 4, etc.)
> +        - for LPDDR :
> +          - Y is the manufacturer ID (from MR5), 2 bytes
> +          - Z is the revision ID (from MR6 and MR7), 4 bytes

It's actually one byte manufacturer, two bytes revision. The YY,ZZZZ
is supposed to represent the amount of hex digits needed.

> +        - for DDR4 with SPD, according to JEDEC SPD4.1.2.L-6 :
> +          - Y is the manufacturer ID, 2 bytes, from bytes 320 and 321
> +          - Z is the revision ID, 1 byte, from byte 349

I don't think this will identify a part unambiguously, I would expect
the DDR revision ID to be specific to the part number. (In fact, we're
also not sure whether manufacturer+revision identifies LPDDR parts
unambiguously for every vendor, we just didn't have anything more to
work with there.) I would suggest to use either `ddrX-YYYY,AAA...,ZZ`
or `ddrX-YYYY,ZZ,AAA...` (where AAA... is the part number string from
SPD 329-348 without the trailing spaces). The first version looks a
bit more natural but it might get confusing on the off chance that
someone uses a comma in a part number string.

> +      The latter form can be useful when SDRAM nodes are created at runtime by
> +      boot firmware that doesn't have access to static part number information.

nit: This text slightly doesn't make sense anymore when in the DDR
case we do actually have the part number. I guess the real thing the
bootloader wouldn't have access to is the JEDEC manufacturer ID to
name mapping.

> +      SDRAM revision ID:
> +        - LPDDR SDRAM, decoded from Mode Register 6 and 7.
> +        - DDR4 SDRAM, decoded from the SPD from bytes 349 according to
> +          JEDEC SPD4.1.2.L-6.

nit: Clarify that this is always two bytes for LPDDR and always one
byte for DDR.

> +      Density of SDRAM chip in megabits:
> +        - LPDDR SDRAM, decoded from Mode Register 8.
> +        - DDR4 SDRAM, decoded from the SPD from bytes 322 to 325 according to
> +          JEDEC SPD4.1.2.L-6.

Are these numbers correct? I downloaded SPD4.1.2.L-6 now and it looks
like 322 is manufacturing location and 323-324 are manufacturing date.
(Also, I think all of these are specific to DDR4 (and possibly 5?),
but not to earlier versions. I don't think we need to list it for
every version, but we should at least be specific what it applies to.)

