Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECF9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ0qjLT5jo3q/gpm8poDUSRXpTxAB+PQfhlD12KVxh4=; b=sINQFO/aK4jKpSFUi53wV4tCuq
	lyZanMrLsdT8AwfZ60A65oW+GZHP0tFgVl0GraQ5UYOJ5ciEGlic2fVEExiOK4mlgaH/CSdqUhhJz
	cbgRpxEdBYvEkYQ9vExtY4I+rF0LmL6rvkp/cl/9wGLooYuo4Ktjcb983+/nHbKfzuusJBCXwClaK
	PRZ50/Aqe/AroN629FQqJ7Dcjh01k0SWB/lvVusqx7OjfkAzR7sYUArbIY3JSvBuofX88FmqOelNE
	y8zjgjIFsnqzG4nhgXptaFID//xhssSAz/hj5AvNVoRDCMH+afF7sAONs6S4ovgV4jMboxv+RCV1H
	/pnjLyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMyn-000000081Ak-07jt;
	Wed, 26 Mar 2025 09:23:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMvU-000000080ja-35iE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 09:19:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso34328065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742980795; x=1743585595; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xQ0qjLT5jo3q/gpm8poDUSRXpTxAB+PQfhlD12KVxh4=;
        b=HMur+LH08mtma0Ue9uhx9BabyiXvGqZ+TBp9HdqycP7gdlpv7kPJqc2/JApsRp9cMq
         EXzPmgsyBs5rbzHzuksA0DjcYlzVsr0C4fPwIl8BJ6hQnATFQS0LOJFdANCnXaKRofq3
         M70mBATQxIuFT5jvj8olqiHGInuV2pjhs/8ukdsCVChXbl4m0YgNuqKU216DNDuPzcFL
         ldJsBlJlMURBAVXZVF8W1AMApOoTk12M5DvwndCjYa8ekjuh/K1fEw96s09UC5qz6rx9
         /TbjpuzpTFCuWCAho4SM71jREP19lgrDzlvEWk7HlagsaaEbMH8Ey9phVA9gir8pN1d8
         STkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980795; x=1743585595;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQ0qjLT5jo3q/gpm8poDUSRXpTxAB+PQfhlD12KVxh4=;
        b=QEfaL/y7lhYFtn4HVGGykFwZ5ZED08al3M54jbHdQPnIiLBWeesg+QbDFiIA/RNO+5
         B+J7XxaNVdA6OkW8jUnNwrQjLgMwTfwv2rd/cZyOetD7YKiJVwmfEeDHF+/77q5rWMhb
         PRN4Z3cvF54SAhVVf6phC7UK3yfZPQqJsV5pK68uZqwkBH3QWwMM4bIbAR3raMv0R2F7
         r2odi20jZCdtIhXmO5fIVin9wxhxMQvj10B4s9Ck1nVqK0xCTN3CBWDXOdUxER0QvIhC
         Y+HPoFEhuOB4abw1qvXmPveBL7M8hdW5CWjxk8PXvDmCJdrAwrbljIo1+UCtAXNbVecD
         m9bA==
X-Forwarded-Encrypted: i=1; AJvYcCWjDQWYdyorOC3uMNm9tv7F1EiwXFD/RPZzq6GTiNGIYwCU0jv9ZLevxlccNHVVMSOzupKEJ0UP4YDfidJxGZy2@lists.infradead.org
X-Gm-Message-State: AOJu0YxYMunFT21jH+cgX/iqelMQ/vyh3HT4ZuvzgLA1NQi0Z2SxLejH
	cJoK0VYc4z9gFtFIbtyQYg0exc/Wcgzp5waM2fkLpTlqhrAkSSLznfJd+yhNWG8=
X-Gm-Gg: ASbGnctVJVUmTuILaslKxoz+2ZldW29R+ID+Ak619h4An5ZhV65BXSB5wwM4aB6aBI/
	MtxFi2VBgWHPK7d8vGt4s+c1vfSWsqO6ACTOCpjt1XiUZg+DPPwijbDGmoElone4Sko95Sh3pY3
	EnrqAwnN5T+6a+9VxPVlpwS4+7Kdoc5WE4+7xC3gF4Enu7OFoF7G2u3ULFf6BXnjG8255g+Tmqb
	gJsyOWJVIIMYDcKWrrTdVsMt/XUV+D38coBiqnvwKaJpf90NuzrQP8obVIOB5MMJ1LCW/XfbjyK
	ZzcNdZQa5xo3EgdnjXIZ7oIfu4swsMFLEwfQa95SMFalZfZchA==
X-Google-Smtp-Source: AGHT+IHdYeX3HXK3HliuVZenB8pY2eBivucP0XkMIaG7LHTPqNsbiA+5ps8ir+J/tmMzC0VVoMgrVA==
X-Received: by 2002:a05:6000:4027:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-3997f93d54dmr19401353f8f.55.1742980795153;
        Wed, 26 Mar 2025 02:19:55 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed5e0sm224956845e9.37.2025.03.26.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:19:54 -0700 (PDT)
Message-ID: <8c167b83a469d24373486af5936b466d44319409.camel@linaro.org>
Subject: Re: [PATCH 03/34] firmware: exynos-acpm: export
 devm_acpm_get_by_phandle()
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
Date: Wed, 26 Mar 2025 09:19:53 +0000
In-Reply-To: <f1e24507-7cf3-4e0d-8989-05ef3aaa2708@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-3-d08943702707@linaro.org>
	 <f1e24507-7cf3-4e0d-8989-05ef3aaa2708@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_021956_774713_1E617C5D 
X-CRM114-Status: GOOD (  14.75  )
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

On Wed, 2025-03-26 at 08:03 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > The upcoming Samsung S2MPG10 PMIC driver will need this symbol to
> > communicate with the IC.
> >=20
> > Export it.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > =C2=A0drivers/firmware/samsung/exynos-acpm.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/=
samsung/exynos-acpm.c
> > index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..7525bee4c6715edb964fc77=
0ac9d8b3dd2be2172 100644
> > --- a/drivers/firmware/samsung/exynos-acpm.c
> > +++ b/drivers/firmware/samsung/exynos-acpm.c
> > @@ -741,6 +741,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(=
struct device *dev,
> > =C2=A0
> > =C2=A0	return handle;
> > =C2=A0}
> > +EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>=20
> If binding changes to parent-child relationship, this might not be needed=
.

Indeed, I've instead added devm_acpm_get_by_node(), and clients are meant t=
o
pass the parent node pointer into it.

Cheers,
Andre'


