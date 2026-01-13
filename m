Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1408ED29DF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn5NX0zVHIadFPbViV8yMvWD/kdQPjminzNjM4/y1Bk=; b=dtaWIuQ9bhWA1R1cwmRc44Rn26
	O3CC86fpot2zNBr77jIKlyBEC/rGdudQCcDBCw43Daqe+i49qyZVcZ6rBJeeXTXBeiq5X6JkRDNcq
	MAc6yfg7HKt+ZIccyYcXdKurPO02v99KePvzWN6a7xRSq5G4HulQnZM1vioHTa7RYPL0LFm2WnjcJ
	1VqYkRIyTUQhVQIzMUfjfLmYXO324mVSTzTJWQtM+NEhty1qTAlKhAcqWRfIFzmHH67DRBO4rWsqC
	g5d8Hc9s9h/Hz95bwB2YYFy0IZnqYNEdcSrcwYFh4rxzmPYBEvyEdRvVtddDw7tMiWgCBeu+Sx+eW
	kt9CEGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaTe-00000006oyt-0DF5;
	Tue, 13 Jan 2026 09:14:17 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaTZ-00000006oyV-0Lv9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:14:12 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so12268248a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768295647; x=1768900447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bn5NX0zVHIadFPbViV8yMvWD/kdQPjminzNjM4/y1Bk=;
        b=Nf6+qMrXTIIuHy29YFKjmQ1fpQ1pnSLo2m8CWtOnaskmDiPrAbxT1uXvfR0KtpkT4U
         5PZ14okBFbndo53QzXIk2yg4N8BDi961wX6n17dlSS5GERuKcEfqP1TLFVMBjDQoyWgO
         4QxXOnCX/kgwalYCYrWZzPlOzk/hQuM85Zy6+j14y5duHDThuAkkgPvkPkJ1R+qXHyQ4
         G//tP37mQVDJxQblkN4lg2ez9avjl9psEeIO2Zevca6yfIEaxQ9oBFnaUCO6mB90hY9z
         yTKtUeGuUUBucqmdv663PKbl86+bs5c4YUD+9ADQFI8qbAUs6Z6oZEdjvi8B6AtnPuRC
         YAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295647; x=1768900447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bn5NX0zVHIadFPbViV8yMvWD/kdQPjminzNjM4/y1Bk=;
        b=jk6Hp2nIbgSnoAkRKEZebOOL7K0DzASih29VB+qKZsM6DF1Sjj+V3EJaoHFUnTRG5D
         9X0WT47bdxVgM9pBHSZw+7CRAtMfvCdJ9O6308X+usU+4EV1OHJDECbc+ZY19zJWbeew
         eUwU4Zf5BvF7t7LJJONDFpee0Z6JSV1t/+xhYH9U+2ltLh+zosQNHVner6/Z5EygTLHU
         iXcw5UcXv3I27fzgv2TWiUxoz5cqSqc09V10QiMw5b1lAZSppU9bx1jL2lC5jReORVbZ
         Dv66KOyUbHBhqny1Klg52VsrNbprXiH9qPWsFUMX8w+h0TAB0RJFQ2ai6dVlU1pH/t3O
         AXMg==
X-Forwarded-Encrypted: i=1; AJvYcCV9SQmN3Njf+8+VuF0O2LSAd20UvRo+MHQLV0hXJhhruCoQwT6OOtVlcZH7HetevoiF5ItpfXn+CoM/dTmxJN7J@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu5caFN9me9wVx7nlNP0MZLfGCDTNVhtWgHF47l5lqvtYn8oOt
	aNI+VQnD69ROQK6ou+oi21qwLC4P9Gqndt7LH6mibJRNN4IqNYwdU3gZug9RMgouNhZwD5qSeqi
	QXSuzn4GOvRCYteI64Wtdd04mvM0Qji4n3g05CGxu0w==
X-Gm-Gg: AY/fxX4rzufd4BSRntPorIxjgTA6VFdv4C1lMsc+ZyCLqgYWQ+ZQfM8UzvrSs2UZUfA
	SVkEAvf/cAQCRG74b0j4PKxS3Tzw2uuUZWJqlB7FHalJgJb5pDK6WP5oKFEw8drjs8V0CrjBhn7
	rgfesNPw20FaY8BCuCEp86SCAa20GGh8MEr4ar9g7Rt5Ng/NIzIG+3tSfF7n/t+7SR8yPp7TGr6
	q5G+NC6K3gO13HHFtO4IUuI7S8p6eoITb8Nw5YC34aa51PFJ89zkDDUDLnoWeYkmxYxQyPmOtPH
	K1D7+z9Dgiq58yG2edWbMo2U8TM1fNMTFJGLNkk=
X-Google-Smtp-Source: AGHT+IF/uMz8MYijvgNH6EAmeQTRc6aRXVQ6Ac2y4GTApWuNrbNhRowJgw1xPnWbWQMx4L4kzhRYmGW628wrmJp9buE=
X-Received: by 2002:a05:6402:524c:b0:647:9380:103c with SMTP id
 4fb4d7f45d1cf-65097df5672mr20320306a12.13.1768295646934; Tue, 13 Jan 2026
 01:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
 <20260112-dpu-clocks-v2-1-bd00903fdeb9@linaro.org> <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
In-Reply-To: <ba585515010ab9a9b417d000ba744f8178ca9e24.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 13 Jan 2026 09:13:55 +0000
X-Gm-Features: AZwV_QjDqNTFOct4T-rP7w13f_DSbKkRMZMwlRNVBJ9q5uu_3B70MKV9_itceMo
Message-ID: <CADrjBPomC-QaL8aR4QsEPm+Uu5_QoWQZUomLMZt+09-ywH3wjA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: google,gs101-clock: fix
 alphanumeric ordering
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com, 
	Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
	Doug Anderson <dianders@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_011411_485563_A49A58DF 
X-CRM114-Status: GOOD (  18.73  )
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

Hi Andr=C3=A9,

On Mon, 12 Jan 2026 at 14:26, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> > Fix the places that don't have correct alphanumeric ordering. This will
> > make reasoning about where to add future entries more straightforward.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 6 ++=
+---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock=
.yaml b/Documentation/devicetree/bindings/clock/google,gs101-
> > clock.yaml
> > index 09e679c1a9def03d53b8b493929911ea902a1763..a8176687bb773ae90800b9c=
256bcccebfdef2e49 100644
> > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -27,13 +27,13 @@ description: |
> >  properties:
> >    compatible:
> >      enum:
> > -      - google,gs101-cmu-top
> >        - google,gs101-cmu-apm
> > -      - google,gs101-cmu-misc
> >        - google,gs101-cmu-hsi0
> >        - google,gs101-cmu-hsi2
> > +      - google,gs101-cmu-misc
> >        - google,gs101-cmu-peric0
> >        - google,gs101-cmu-peric1
> > +      - google,gs101-cmu-top
>
> If we keep 'top' at the top as one outlier, it'd reflect that it is the
> top unit and all other CMUs are children of it.

Thanks for the review. I opted to just keep it alphanumeric so it's
(hopefully) obvious what all future ordering should be.

>
> >
> >    clocks:
> >      minItems: 1
> > @@ -70,8 +70,8 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > -              - google,gs101-cmu-top
> >                - google,gs101-cmu-apm
> > +              - google,gs101-cmu-top
>
> And here.
>
> Either way, I don't mind:
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

regards,

Peter

