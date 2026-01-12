Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD79DC9EC6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxPBiCWb0NOVn214pVZJyp96uXR6w0HjkmgFnnCgJjA=; b=YbZJ64FcM2aApJUpCZ6dcdaLQq
	q3uQ7Kmcy7DrkQo3ucyu1HJv/5GFcCkfiKNasBhMZtvshy8Awn518jtMLFYVMxnu8d6bYYHJBtrm5
	6uRgMJRONQasMXn9uFLvofBpQzVV4HDKVXCpxy4V1FFCv+TiAdPaMLNzOQnLDRS0Jdm5b2vxazZc2
	cHM7zue1hQPE/oz/5zMKl4eK7afrTrEFNcz5NpL04ij9hg/ohgsD9dqS3byg8g1fTMjPuIngHL61x
	11ffBQNx/UElrC+TNPP4q0UFjWciXuFJjFktd3vKeApDsuyI6MlPMHTQpLaR+NoqGQ7p8yLfXvcc/
	8pzUIVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxU-00000005ETp-1h7H;
	Mon, 12 Jan 2026 11:19:40 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfFxR-00000005ERu-3qO3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:19:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a0d52768ccso42407415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768216777; x=1768821577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxPBiCWb0NOVn214pVZJyp96uXR6w0HjkmgFnnCgJjA=;
        b=cz3SOmtiZBlubF6tPc/ayxGP3JjOQ/prCDCTTP5EylJCrHqxhm4EnnK8Ejois3a837
         wMsO3CqtVlLt5yUKahOzzfnaAyzdSLxSUCnLIkJB6AuLJepPGmc/xkKPQcUecq4eprbs
         vLf4AsI9fujfJa9BpshmzKyCBROht+BmlLpAWKIgWQSBt7Or84EWwWgSXOjDevb4kJ8V
         QHUCQLR/doWQh6mQ9GjvvmkiGs4B7awnkn9yd2DjJxRbaSoCi/5a+Q6Zjy01Q0QAW0Yc
         E6WeDR0Gpt9eYVIiRDQ09jcrp+ipDYbRcwJx6ONfu1Fw4622lQifsm/LQ9AgwH+J1wiW
         lm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216777; x=1768821577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rxPBiCWb0NOVn214pVZJyp96uXR6w0HjkmgFnnCgJjA=;
        b=ARVjwXbzcft74k2HCZXdQCWfrbxrIeuzUCohu5DBsUMfaKbjy7W5EZ7J4oZC2/U+DS
         7gdf2tMia2JaaabjPpJa78Na4+aIcY9JZVLvs8iMfhdYy8vcv613zQEk2sdPTSs5Yy1N
         8BlCpfgv20N+mcx8r+xqxrEb652VQ5sdH+WMqmftlvsMGZmFOJqjutZuURRo5NtamoXq
         r4rYVkOz5pW9+R/wbK/TdpiUjefQOJbrFufEA3HgyPjKaooffc7fB1U0zWoTqRKTuZQg
         wQW1XWHJ4O7uPPDuLS4C09CideU//rABwmZ71+O9A06R76yySUzGGn2PTXce/+ZJonTz
         iwew==
X-Forwarded-Encrypted: i=1; AJvYcCV6E8BczuHxRJcg/9SFgT+VHAO/L1SouZlo7lQuwNVxnWui817Bxc7wiS8oL8eBTSUbUWVM1YYa6CwuP6zU8Kf1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6CYuClt1KyapY5ugSbhSQ5Y8aDBOs0hBhYZcaHokE9oU7IRA+
	8ATe7znmVfSngUeBOF1v5ayho1xNbivSrvDVydNn/6wcfIoTsBJ3BYQFgLfPKiJo5IKrSy8HrZh
	emhMSLIvDsFFEMhHHeNaUXq4FlsJP0Vw=
X-Gm-Gg: AY/fxX7l1xuvVy56kfjwtG55Y64DP14k7t49LLzCq8YQKzxK/uCzjrxQlTXJ44+eH2s
	K7sqrB4Lgg5peyYQVv2paGuc4lvhSqmmyP3ZNa/ouVBBL6DH73L0TNnqiLiLQgA8EBFq86f8J/5
	kAddAwb0dZCWqIjXA9GJ/Yx0d0hwkWonxNQ8aNF7XT8EWMHoQuzpKsX0ED+1XknyNW7+EHgrQwz
	pdzXMrAr2kZCkHp4KKrz7EId9TD7bH3FE3sC+CgN4zETnl0KYG6dTgomBnUehASzxmsxhLkSnx9
	kTDZbIRkjQYSYYm6TyhHUU/UVU+P
X-Google-Smtp-Source: AGHT+IEHicF+3IJcwgxgH/BBD93opK5AWO2KmeQnPaid+LFlPvwR0B0ZKBH5hgAi8y89KFSsmAmBeqgOAxet4wXxVKI=
X-Received: by 2002:a17:902:f60d:b0:2a0:daa7:8a3d with SMTP id
 d9443c01a7336-2a3ee47f15amr165050485ad.23.1768216776602; Mon, 12 Jan 2026
 03:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
 <20260110200426.1461575-2-martin.blumenstingl@googlemail.com> <20260112-quixotic-daft-starfish-5fe914@quoll>
In-Reply-To: <20260112-quixotic-daft-starfish-5fe914@quoll>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 12:19:25 +0100
X-Gm-Features: AZwV_QhMOFbqafd1y2lAFL-G5cdRwETJL_KsPrbRSoSrEkURS4Vzk3WQ_kBZSVE
Message-ID: <CAFBinCAG-N+FKfSyqi+6s7dW8mK54W=-NpFAg=x5N4mF3gH22g@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 Amlogic Meson S4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	adrian.larumbe@collabora.com, steven.price@arm.com, 
	boris.brezillon@collabora.com, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_031937_951641_86349BF8 
X-CRM114-Status: GOOD (  17.97  )
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

Hi Krzysztof,

On Mon, Jan 12, 2026 at 10:31=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Jan 10, 2026 at 09:04:24PM +0100, Martin Blumenstingl wrote:
> > Add a compatible string for the Mali-G31 GPU in the Amlogic Meson S4
> > SoC. It has two clock inputs (GPU clock and a bus clock) as well as two
> > resets (main GPU reset line and a GPU ABP reset line).
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yam=
l b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index db49b8ff8c74..85fae7753004 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -19,6 +19,7 @@ properties:
> >            - enum:
> >                - allwinner,sun50i-h616-mali
> >                - amlogic,meson-g12a-mali
> > +              - amlogic,meson-s4-mali
> >                - mediatek,mt8183-mali
> >                - mediatek,mt8183b-mali
> >                - mediatek,mt8186-mali
> > @@ -143,6 +144,25 @@ allOf:
> >          power-domain-names: false
> >        required:
> >          - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,meson-s4-mali
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          maxItems: 1
> > +        power-domain-names: false
> > +        clocks:
> > +          minItems: 2
>
> missing maxItems
Thanks, I'll add it!

> Can't this be combined with existing meson entry, *after* fixing it to
> include missing clocks?
I don't think so: G12A (and earlier SoCs) have the Mali registers
"somewhere", while on S4 Mali is on the APB4 bus.
Even if they are on a bus on G12A: then there's no clock linked with
that bus (at least nothing I'm aware of).
This is why I even introduced a new section in the bindings.


Best regards,
Martin

