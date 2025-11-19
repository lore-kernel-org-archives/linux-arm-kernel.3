Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD540CF2564
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 00:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAWJfMyV7DpF7HKG9h+AUHw17u4/yHqs9en8PSsCyqg=; b=OL/I9LNeNAPT1/Hd+DT6GqnfPE
	k98KlrDzFSJ2iZ8RHalxjzOkymRnsK6caGYesmt4MjFlN7I69bwSvRGjhEu9G7Z1Nuf3Il0S/vz7r
	55AzfWxEaF4Wbm3VQRL69J1OjKfa72asMIh9fNwhSP5rkIYi0affZQQcYcisNsZmlLooHrxlCtLnL
	Aj7ulZ40o3B+8ODZ4msJeYXE2KzKLt0meyJiktdJaveF9W33nynCt0fI6wTkmwF29WkoW9CbObFKq
	uVJpVzFWT6veq5/xiKjxrN/RuLvJ2LdVVeclZGuo083zHoMSd4i9KokH5nSh2KmaRYc8PCV53Ibyl
	/K5PsaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWKv-00000001JCI-3KgE;
	Wed, 19 Nov 2025 00:46:17 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLWKt-00000001JB4-3J4r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 00:46:16 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso9883187a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 16:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763513174; x=1764117974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAWJfMyV7DpF7HKG9h+AUHw17u4/yHqs9en8PSsCyqg=;
        b=PadYLusf5flKeHg1utv5TftKzuVi5fWB7unTgD1wc0VPA2RnOc8M2kg+Piqqd1YYyl
         Tvp+b+2lxLe4DZNz29U0rRCjvJGyZzUVgWNeofYulh+JGZ5myQK2mowgfslVVUX9OIia
         umkdw3XubvYIF22Wny47rLxHJOTicP4sKMlyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763513174; x=1764117974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BAWJfMyV7DpF7HKG9h+AUHw17u4/yHqs9en8PSsCyqg=;
        b=Pcx0yAC9H4M0VvXLQwk4TiqYHeJTH9D0qXEUErcd5qhZQhCHwcPJYNk2SOtBqUoWAZ
         wW6TVbdQNM8EAUQQ5gmVBG54C2+Vd15DUY9yxJo5I66eMBKTVFt7u6y++Shnam77Qmxr
         S1Pc3/1FW6ijyQGHd10tkCTFxQANk4FLokG5YyHmWAQXkJwy2fCNA3r0gQt/1KzomSqQ
         w5gddYKnGXWWwtWu5Pm/pCTXV9eTj/3pkdp2WtEI2StjdO0wYvF6Ouza+amMvgyCw54s
         z7zZr69rV4W2nzXJj72cX3fxNkzKeASvgSCWpIpzYfZw+dWBqusF+bPqExWxM5gSnB3a
         fAmA==
X-Forwarded-Encrypted: i=1; AJvYcCXx6hGW0kUnxCMs0lPvm6NDjrAa1P7PiUha9h0GR870e/gwW+U2l5cI4OgLL5emKa1w1DQJd3Hi6H3gkfW2N5jU@lists.infradead.org
X-Gm-Message-State: AOJu0YzAcsHbZdK67HqsqbnQJ6bdSWImHbsZROF/g+4gsb+kS2G7On97
	4HBup57Bowgyw4u2rxh+JKJvU9QGguwHpd/fww8x5J8XKz75f1ZJ4e/PY80iR9jhQWtFbHfNldy
	yniR4aDt9
X-Gm-Gg: ASbGncvyyOkTwNYdN+effr6wqaP/aMZAgoeQe1/R8Uezs8Mb8RFXZJFIjtOGuuH2++q
	9gH8hTKL33mD/LOWtRD/ARP8HwXbtJgeA0Hd3xEgD/q4dajTYxQ2dVkmCzYue1oCcKRCRuvDje+
	hokNn3TDNUSp3hjPVVH0AlEPQ/LL3F4glpxHmMfDE9oQYg4VE9HUxE406TdFKFmXL2coFJBGVHx
	w5I48NkXrPBXek3Juqz8HweMVZWJVPKbhy86NGHmlNAO//e4L00vy9VRFwSReUBRjMJcfojMgxb
	hbdoOlvF4SXDXj5O81c6aKqOBwsnUVQZt2sDqNk5Rivf3QJC6RKna8J2Yj/v1D+NeFI8647nbBe
	HioYlyTT1vpu/XnsSIqpi0aUmfTVI3KtHrnKTiktxQcbASrXH9fNxW/qez59zWdVWy1V/AQTNU6
	1xHjwhywxcYXfoJ+0f1YOzASJWxE/tyYFDsWWPhoWTjclpHNhYUIOROG1HJwNH
X-Google-Smtp-Source: AGHT+IGbAruVnXfKPuthCcfgGato/q//QgKdYnzUsd0B9Lx1q1eVdzl+L/sEbx5lgdFF/+x5h6iyow==
X-Received: by 2002:a05:6402:52d5:b0:643:c8b:8d30 with SMTP id 4fb4d7f45d1cf-64350eac57bmr14704873a12.30.1763513173804;
        Tue, 18 Nov 2025 16:46:13 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1db6sm13895259a12.26.2025.11.18.16.46.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:46:13 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42bb288c219so2921123f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 16:46:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSjyCOzVCV1kkjOeXp5cuaQL1QsvhsHyLS/3T0gSZCH1CnDC3GX0AumvtNezDdRvjLEznnvDSRj2CGe42fbtwj@lists.infradead.org
X-Received: by 2002:a05:6000:26c2:b0:427:526:16aa with SMTP id
 ffacd0b85a97d-42b5939cd70mr18021926f8f.58.1763513172970; Tue, 18 Nov 2025
 16:46:12 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com>
In-Reply-To: <CAODwPW_51fKOfDQbTUFCum13M621Uxi2Zw2YHng0DrrwwvZhRQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Nov 2025 16:46:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb88hTz0kDxxKbU0G2yCqTgF9HwJAh6h68hf-cEtAurA@mail.gmail.com>
X-Gm-Features: AWmQ_bmE6F8y8blYKtFOlYYUsAOoXZxGgtId0c4_uNvCgfNxCdU3S4jDpKFXYPs
Message-ID: <CAD=FV=Vb88hTz0kDxxKbU0G2yCqTgF9HwJAh6h68hf-cEtAurA@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Julius Werner <jwerner@chromium.org>
Cc: devicetree-spec@vger.kernel.org, boot-architecture@lists.linaro.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	yupingso@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_164615_896213_08965A22 
X-CRM114-Status: GOOD (  41.66  )
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

Hi,

On Tue, Nov 18, 2025 at 3:48=E2=80=AFPM Julius Werner <jwerner@chromium.org=
> wrote:
>
> > 4. When applying an overlay to a device tree that's "incomplete", the
> > top level overlay will be merged instead of replaced.
> >
> > Example for 2 levels:
> >
> > base (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"=
;
> > overlay compatible: "boardvendor,myboard-rev1", "boardvendor,myboard";
> > merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
> >                    "socvendor,mysoc-rev1", "socvendor,mysoc";
> >
> > Possible example if we support 3 levels:
> >
> > SoC (incomplete) compatible: "socvendor,mysoc-rev1", "socvendor,mysoc"
> > overlay1 (incomplete) compatible: "referencevendor,referencecodename";
> > overlay2 compatible: "boardvendor,myboard-rev1", "boardvendor,myboard"
> > merged compatible: "boardvendor,myboard-rev1", "boardvendor,myboard",
> >                    "referencevendor,reference-codename",
> >                     , "socvendor,mysoc";
>
> Sorry, I only cursorily followed the previous discussion so I may have
> missed the exact need for this part. But I would caution against any
> proposal that changes the basic rules of how an overlay is applied.
> The definition of how overlays work has (I think?) been stable for
> over a decade now, and is implemented in bootloaders that often cannot
> easily be updated. I absolutely support your effort to get more
> upstream standardization for managing base device trees and overlays
> (which I think need to be flexible for arbitrary layers, not just SoC
> and board), but let's not break the overlay code in old bootloaders
> while doing it.
>
> Is there really a need to merge the compatible strings in your case? I
> think in the vast majority of platform identification cases, code only
> cares about matching the most precise string (i.e.
> "boardvendor,myboard-rev1"). If we do feel like having the whole chain
> of identification is necessary, it could be achieved by just
> copy&pasting the extra strings into the overlay file. If we have
> cross-validation between base and overlay source files we could also
> have the validation check that the overlays correctly contain all
> compatible strings from their base tree. If we know that the base
> trees aren't standalone anyway, we could also just invent other
> property names that identify them (e.g. `soc-compatible =3D
> "socvendor,mysoc";`). Anything other than breaking the overlay format
> would be preferable in my opinion.

I'm certainly not dead-set on it and I definitely realize it would be
a pain. ...though it wouldn't necessarily "break" the format--you just
wouldn't be able to use any "incomplete" DTBs unless you implemented
this new feature.

From my point of view, the main issue the merging solves is handling
"socketed" boards that could have any of a small number of SoCs
plugged into them (usually minor revs of the same SoC). It's not the
absolutely most critical use case in the world, but I know that we
will need it in-house and I'm trying to come up with a solution that
will work everywhere. Once we decide to go with a downstream solution
just for that one use case then there's no reason not to do everything
else in a downstream manner.

Personally, I've never really loved that the SoC compatible strings
are conventionally just jammed onto the end of the top-level
compatible and I'm totally happy with it being elsewhere (a different
property, a different node, etc). Mostly I ended up with this merging
scheme because I thought that was what DT folks were pushing for. If
I'm wrong then I'm more than happy with a different scheme.


> I also feel like we need a better standardized way to tie base device
> trees to overlays, like your `/loaders` node proposal in an earlier
> email, although maybe that's an orthogonal discussion (but related,
> especially if there's supposed to be cross-validation between base
> trees and overlays). The compatible string is just not a scalable way
> for bootloaders to make this determination, there may be a lot more
> differentiation than just "SoC" and "board", and the scheme almost
> certainly needs to be platform/bootloader-specific because every
> hardware vendor has their own ideas about how to group and reuse parts
> of a platform. This information doesn't necessarily need to be *in*
> the device tree, it could also just be in a separate YAML file in the
> same repo (since bootloaders will almost certainly want to have it
> transformed into their own out-of-band descriptor at build-time
> anyway, so that they can compress the device tree itself and don't
> have to decompress each one for matching), but it needs to be
> somewhere.

Yes, I totally agree and this is an important conversation to have
too. I still like the "/loaders" proposal but I'm not dead-set on it.

That being said, the two problems are separate even if they're related
to each other. I was attempting to focus on allowing the base DTBs to
land first and once we get agreement then move onto the second. I'll
also note that Chen-Yu is talking about the problem at Linux Plumbers.
I won't be there, but I'm going to try to attend that session
remotely.

-Doug

