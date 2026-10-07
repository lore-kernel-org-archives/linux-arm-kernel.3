Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73DFCA6009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=; b=zSoJJ7ZOS192kcj+iZG0CSfHeq
	480AA0uN8g/dGKElrjSmF4BOh9JB/Aeoj6P+Z4Ul6HkPDUyMI6mFLvLjLCyw/pXLbEJnM4NPEb1Ps
	A0GgrWnM7JTE053U10FvXCPyo9CD8rVnbnQGISV0g/4BwS3Z98O1kA1m/qj8GP/hA1+TrsMjuNsTV
	iTn3/u1+3/F0+xSlr8JeCakp8ZSJHbxr1sH6X9PTvIJ3wApcSs73x5C6QsgVsB9uac7Ha37qGj0Sb
	k1y0IS3qEZSSm/Yk6G08NZlKegtHoxoagY0K+tTpyqg4W+SnfQegNW/o2PfnTVktvP8YgivT5qYki
	LYDSoExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZfL-00000003E51-0jPT;
	Wed, 07 Oct 2026 21:59:11 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZfI-00000003E4N-2OGX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 21:59:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c1670dad7a8so843050766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 14:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791410346; cv=none;
        d=google.com; s=arc-20260327;
        b=IEJc1xYk9IZUdfiMxGaSGHuUoinqP0P3A8AB/zC2cbVUg/KEQjZqDB/UJSgWtZfP+1
         IPQYpMWgBw5tAulGZwJhDzTl+GnVoeh0x8bf4gpE1VFwfa/9rtebes2XXX+DMPRY7I9e
         K9EKs1Lk+x/25G47LHM3A2PH5HmtU3pVGAbN+ak82hORFp124RBSMWMQT50vfVM2rImd
         Hpe8IE317u/kH55/JWi13vrWgGwNodPeleDRKeEdhcyTTbBPA9JZCeHaRgxOs18cxwEF
         gTgjFKLbZ6N6dh/HQ8un/Yb+8NrIqifNAPUc7SSkz4sUgHDvjXTjvVpoJWQ1mVYexM2T
         bnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        fh=N5S7zgIpf0tEvLiGJpPqCtJt5zgWb+RtVDquP/meCxM=;
        b=Pn2h8djTtBxHZPaMjJ4/P9PHLBfMtRMOb9B9HqZIpm9yOwnguV1vt/1ig+coB3TvZ3
         qlPCdLDkaFdxwDm94cAcZNzhEYeDeQSa7BOgoBLI/Biv1gooCvzB+vtVkq+ki9ACrK6a
         sed1Y1mMkvLnbDYU/NKqb62j2wV+3uP0u50rdil49WcnH2sffPGKeLUTIKvF8hjrDicz
         oin+nWMstcyJjUrU2RwgNJuVhcAvejU70Io4OIxwzfL78yqb+h/ggcm5+boTtRIQeTXP
         2X445DiEfWLy6hs2zetIMNhIftzPR9OhHe9B4EBbzywRDoO93HRhCs+8tH9ptAV8dcg2
         3VOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791410346; x=1792015146; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        b=ij+NsrIUBb9Fp4ypjyXTWnpoFgrmOVseCzS2ACDqoKkCle2HHKjGAN3pE0o8Q0BUom
         U9OVbXGP7ZZK4EtzKK/lbApMCHnqLtNVDugdHxfVOJAlOFHK7HTQsVlA+FQ3KMyfN49b
         hAntyKTOiYYiPLpUV/dJXu5hNYYTMhe1KwNJz1KNwu2lXR/ovVn/SYL9SzBoHFSwnMsL
         Ft+h9dqdiXSWyNsKTjz1NiRaHKGkevgwL6EPP117kgtXkZt9+XbOaC3rRImAS9flCNjy
         a/TDHS2/Ri9iZUfwqFU4QV2z0x6AVXvh7A51iwPZaBsIvAJDSqBAcVetMtJIh5oS3/HR
         sBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791410346; x=1792015146;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTupLQqOTwq3jH2ZB+au6HoSAz3uNI5sbJCpfgUjYak=;
        b=ZwjNCNZpjwigDWie0H2Zh9Dv9CNIGkEpTwKyPyCFu64UPpNAk04cLGZ3OJip84xuA9
         vUc60poue3FmdvyFBFMK/8OncovrBv7Tr3jHLDLw8jG4d91ON7278Kda7FjAtcEo8L30
         Lff+EAyQPWt3Bjwdjyfakwuw1y3p1V3xhMQWw2ixndhjvC2MrJklo1Qicn2F2amjhkf7
         CQfNOFP/oIcCVXTZwKLIrI7owyCpNKPFDYFMgrDJHTKpL1PhBowbptpre21NM5tHpLDS
         pYJilB8v2B2LnRu1ZrZIGZVVTbYj8c8tCdCMIz8SM3cjLFzfaEyw4Q3ZNUes1/gemhz5
         CBvw==
X-Forwarded-Encrypted: i=1; AKwUvBzoQby9UU7lt5P13jqIFEyKLVpnL5sUDHL1Qmz/PMu1+Yiyua4mbW/tWg1VM2A7+6V1s1x63X2ywL+rfjOLKyp2@lists.infradead.org
X-Gm-Message-State: AFuF++lpcivwKVXjSXXAnx1PpJ5MP6PeEoNzJ9GgbhYynatBtf89htWT
	+tBWcqkBwkx3ADiZqeBpU2kh9MRNr1BvZJKuM2qi16hJxSG6P+K+cll29OsCkhlMaMFSQWe8Ajx
	nANkTlzpDJzjTjHKOclapedRrrNoK3oC0mjXrbxv2VLY9yaCCXCUXDJc=
X-Gm-Gg: AYBFou2P8nhAFvuYCPnVlxd15vEAOyImNTa0bljbCP5UAm2Evs5X7Mh2Rr9fA6BKN2g
	d1HlSX48anr9otqmlwTDfh54F2LQc4nWIzNntdgdU51yyj6lpuG40MyBhu8S0lsfrXBYahKVO2l
	p6uGIMWx9LJHcz7h4LoOl7ncJP9ceT4EDAhuWrVZoR2PdinOw7m4WVqGXbcwDBeEw4JiVfqEJHA
	fgN4vZ91++AQ/jgG/WIpo4e3pBhe/SvAlQPMX749AE9lRo0Wv2JPKpUuS9yDONbT16e1jFMtauA
	9ZDwN8q8R1sXvQZU4aeTt6nCkVcTQFuM/4PUlhkbGowBPku7lDSbQzkg5LY5pXi36GU=
X-Received: by 2002:a17:907:3d52:b0:c2e:7daa:23e2 with SMTP id
 a640c23a62f3a-c317c18cedbmr350164566b.48.1791410345894; Wed, 07 Oct 2026
 14:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
 <20261006-b4-rk3576-reboot-mode-v3-2-6edba064693b@flipper.net> <20261007212432.GA381404-robh@kernel.org>
In-Reply-To: <20261007212432.GA381404-robh@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 8 Oct 2026 01:58:55 +0400
X-Gm-Features: AclHuK9YQekpwAgg-J06h9HjpyEEerPcos0qnPQI7GTm7jMZgcXE5m4c13MgYQo
Message-ID: <CAKTNdwFo03jFGMeJQpxXp1yOX+cG+6BZOYf1eGGZTdZWAFdz5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sre@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_145908_632637_4131B4CA 
X-CRM114-Status: GOOD (  26.63  )
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

On Thu, Oct 8, 2026 at 1:24=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Oct 06, 2026 at 08:02:40PM +0400, Alexey Charkov wrote:
> > Whatever program that acts on a reboot mode runs before a full OS, so i=
t
> > may lack the capability to enable the regulators it depends on, and a
> > reset that preserves the mode register generally leaves the regulators =
as
> > the previously running system left them.
> >
> > Allow a reboot mode node to name such supplies, so that they can be
> > turned on while the mode is being requested.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8 =
++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboo=
t-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-m=
ode.yaml
> > index 79ffc78b23ea..5ed70c87269e 100644
> > --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.=
yaml
> > +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.=
yaml
> > @@ -36,6 +36,14 @@ patternProperties:
> >    "^mode-.*$":
> >      maxItems: 1
> >
> > +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> > +    description:
> > +      Supply that has to be powered for whatever program acts on the m=
ode.
> > +      That could be a boot ROM with no access to regulators, and a war=
m reset
> > +      leaves them as the previously running system left them and not n=
ecessarily
> > +      what their expected out-of-reboot state is. Any supply described=
 here is
> > +      enabled when a mode is requested, and stays enabled.
>
> Sorry, but no. If we allow this, then what next? clocks? power-domains?
> GPIO lines? The list is endless. Maybe if a not generic binding is used,
> but still pretty much pure configuration.

These are the resources which are required to handle the reboot mode
request, they are not exactly configuration. There is a limited and
hardware defined number of IP blocks which need to be powered for the
reboot mode request to complete successfully. In my case (Rockchip
RK3576), these are the IPs that need to be made aware of the trained
DDR memory parameters: if they are unpowered _at warm reboot_ then the
boot process stalls immediately with an exception (cold reboot is
handled by the power-on default state of the PMIC).

I see that this may be abused to hack around what should be a
bootloader's job, so it would be great to find a way to explicitly
limit the scope of these - though I couldn't think of one yet. Any
suggestions would be much appreciated.

Best regards,
Alexey

