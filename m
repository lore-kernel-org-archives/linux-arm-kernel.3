Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6888DEEA84E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnVOYFS1dOs4ytjskGYRNbag345ulKuZ+IaQUN3bwJk=; b=jaxsW1hDAtKD2oUsU0FvK34Yrj
	3dnq03P17LFOl+BKy4O6shfWM9RoZLBldTZXBoYckoMReWpDakb74MTFi/hJAfLHYoQIR92hCXQSQ
	WXdMzxpJeBfDsLX4irOfYUzxbRaHiJpxOsRWVakgIykQvbYs4RhK2gq1k2m8vwY0S9nsg6lJPAHUK
	I8nnkX193UdKXRrMY4golb8W+4eao1eIrKUadkodng6NwQaUllsrzS3cIdB7LBWtqsHjIsWmdZDXS
	BZcl74A6aGcPHtJfUnDfifxnj5Wp6kQ2Q6rGtjB6ciN504XbQFe2pLDnMSI0EZDAawK0kpQQFXogo
	1Qmbu80g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqdNX-00000002cOz-0uxk;
	Thu, 12 Feb 2026 20:33:35 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqdNU-00000002cOe-3mK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 20:33:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4358fb60802so153961f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 12:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770928410; x=1771533210; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GnVOYFS1dOs4ytjskGYRNbag345ulKuZ+IaQUN3bwJk=;
        b=yO8pdgthr0OpTZUQoN0QbtsNlPth7bRBd7vUU5F8ZNidvT0Wsd4vL08EjWjSzxEpfU
         5bW8i1samYGln81pMpAHsxY8SCqYkV2eU1S7LZ+LpDa//4FFGq/onNm5zs/+XQ2MA3Gi
         KVek5sHDCyXoTLAh+KqtCh12JJ1WzeDHUG/vxgO17pqjrVUgv+hq9olw5QeSPX48OK6z
         7Vq3kJ4X2rAc68nRElZzdEl/77XudApmsVEn14M2lk8ykKn/ot9QRZcezJs1yy4PHVWV
         EIuful4ILXgMsH6PfCE5CpTPpZVEWBX5CdMo6Yp5ZCNiASPU7dV5sjShOmndIQHHS5LQ
         XGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770928410; x=1771533210;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnVOYFS1dOs4ytjskGYRNbag345ulKuZ+IaQUN3bwJk=;
        b=uj8BD4uB8lQs0zNTP77wH0ApducmW9dbW1vT81BTKglqnOvS7G93n1SV3ycysInh93
         6gs0gN+Ig8HQ7Ham6s0fc+70Yy7ZRLuiQsYeKi7JnMvVUAcS9DsRLZjZqsT2l8rGj4WQ
         AuQ4xaunzgaFfCvuosg64aINzvSJQp6HASY8TlooMFCruyYaQIrAQiq7uloUlcEgNy+3
         hnZks8bh3D7TVT4FnTnjMGMKalaYSyFnIa9tSUt0f7uMjiX7GHoJZcV3l9k3r7lxiVrt
         ZI3tSZ9o0VhKTRgzQQQbEjcY+AEfWz/d3CsZGAVOX7BvhFDr7OeCHUcuANTBiV24IK6a
         st4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMuVWKUxut853AndUJS4+3i/jUNelTejIS7M4Lvde+3UhrrHMETt0vdnLT8qeUifdhGP9cCf7lfN137jt3QTLh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1MMU1yLXEsP0fMOApTmro52QOZPS4A5wUE/udFzNZD4nW8UY9
	lIwp7Ns3Nvj+gwct8IPYvsofKCalCPXMpBvWMey/zerklifM8K74WvIcfSyuTX/ICsg=
X-Gm-Gg: AZuq6aJy0kttIgI+IBJC4M7PNJjtb/seittGFcm3mjxLHKboHRDHHIf9tMgLcbrerLO
	OpVdD/21JJ0ZJAefNas4NjadZeE8rE1MA0gVQ64h886sTHd2FQE342ZJ1ySLZ2FjZH63WqWs1mP
	hKE9erw4B3HPdD6KpA+DJaLcSfC0Tq+Znc7Izo7CZ+GJmiz+j4ozhjaMfS4yaB5OhSItuOOsCUq
	Bs9qkCkN9VuYfkJf0lGnJjIpsGAlYqzazjLQ+AbtpJxUUVOSBCI0Gz4CkdcjjnWYD0XVCFycCnH
	Y3lN0yOz9sCXD7ZMa6Skx5fFLx23cQzj3HBflFGo4zDECiA4X9BvL8VTCsX8TUBIyoQ7I9IS3Rq
	fLKGNxnuev6nehN6eZNRbSN1in3FG62py184qOh+3VNMt0q51M5Rl7yA6VdDttixitDn9eMCM6a
	CoLuE3eUHgPBrgT9vjXDhVJwJnovCDAcPvcFHLyODe
X-Received: by 2002:a05:6000:3113:b0:435:9e81:105e with SMTP id ffacd0b85a97d-43796b22389mr268014f8f.19.1770928410444;
        Thu, 12 Feb 2026 12:33:30 -0800 (PST)
Received: from draszik.lan ([212.129.82.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm419495f8f.33.2026.02.12.12.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 12:33:30 -0800 (PST)
Message-ID: <f190f9a211a69bf5200098f9d26a40b117ff7953.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, Will McVicker
	 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 12 Feb 2026 20:33:33 +0000
In-Reply-To: <CAL_JsqKKig8ePmmMZH=QagSyw0d=FKrORTxKzj7HOZqd0jLZFg@mail.gmail.com>
References: <20260205-gs101-pd-v5-0-ede49cdb57a6@linaro.org>
	 <20260205-gs101-pd-v5-4-ede49cdb57a6@linaro.org>
	 <20260211211229.GA3882182-robh@kernel.org>
	 <b5078af810a681333043f64d71b7d6ea55ff44bb.camel@linaro.org>
	 <CAL_JsqKKig8ePmmMZH=QagSyw0d=FKrORTxKzj7HOZqd0jLZFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_123332_963954_93A4FEA0 
X-CRM114-Status: GOOD (  20.10  )
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

Hi Rob,

On Thu, 2026-02-12 at 14:06 -0600, Rob Herring wrote:
> On Thu, Feb 12, 2026 at 6:03=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
>=20
>=20
> "google,gs101-pmu" represents some specific h/w. That h/w either has
> power domains or it doesn't. So which is it?

It does have power domains, they were missing during the initial submission=
 of
bindings and DTS.

>=20

> > The compatible doesn't change with these patches. So I'm not sure how t=
o make
> > your suggestion work without causing warnings for existing DTs. We can =
either
> > have an old incomplete DT+binding:
>=20
> If this is considered incomplete, then you are going to complete it
> and add the child nodes? If so, then the warnings are appropriate.

Yes, I'm going to update the relevant DTS to include power domains.

> If you were going to maintain both bindings forever, then you would
> probably want a new compatible. Or just drop the properties from
> required. Note that if you have child nodes with 'reg' and parent
> missing #address-cells or #size-cells, then dtc will warn about that.
> So it's not too important if the schema doesn't.

Maybe the commit message or footer comment was clear enough, sorry for that=
.
I never intended to support both old (incomplete) and new DT.

Dropping from required did cross my mind, as I also saw the warning about
missing #address-cells or #size-cells in that case. Missing 'ranges' would
still not trigger a warning, though.

So does my above explanation mean you're OK with the patch as such? I can
reword the commit message a bit to point out that while this binding update
breaks existing DTS, I will update them as they're simply incomplete.

Cheers,
Andre'

