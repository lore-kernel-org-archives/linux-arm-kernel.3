Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCBACEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 12:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=; b=JHFXcbvSE1kdewYjOwd97Xqw4n
	c/f1pV+9GAlwVir+2lCgrVR2p7HRJaSSmznHI63aIJbJdO7Eg22vc4E1s5r4yMdm1t7iBN6vvqevQ
	JLmPEwVo0d4HidUT7CMaZwkRBoq0dBjoCCo1ZfOz65gumqW1aaN/yR+IRAM06FfWJR9SkypGkJfnC
	guE9Zh7H/oXXKDHM96gCUzXM4w558O0wq6OD3GW5tYBBM4d237h9KuPiQIwxVizu5GesVQpNnW52c
	e0PywNx1XRG5G+LovmfhHpN/Lq4h8ODen0VFLPcRdXQn6KW3AOzgZEtzU9zuNgHQuoWQwGhOImyjo
	G45K0OKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbR8-0000000Eb4B-2w3a;
	Sun, 16 Nov 2025 12:00:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKbR4-0000000Eb3l-3iLG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 12:00:52 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-641677916b5so6219729a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 04:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763294449; x=1763899249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
        b=ENwgjUkWljLYRbx/x9IRmAd8wxqKb16RID9dJjK5F9hTgFgJhkes02F04LqN3Qium4
         KBBaHPJH+AbMeoHDu4XScX5EIHCVKO/39OQNJSojWvzgwlu59+SbONf97gD5brmA8UrX
         XDmFrFzBazJstgCUCHfnu2dYXnq/glaFWZkPr6XWu8NdKRLu0Lk1MI2wR/R8i9Yj9OTt
         rmqV4D3W70RAFkQHgyyL3sU8cbWPzpb+QgPmJvxonSe5BddozKCt7kJUPmtbRdw/cFvd
         KtQNO6iM/js+4w338hFkCVn8vdgAm+hEiUdR0WdR+ErieKUpf+h0Qc100iGbwT1nn6gd
         +TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763294449; x=1763899249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y8FaqKEjgD4Y2LjTTGKyATQQX3MWIGa2bobHCkDv5PE=;
        b=QXgulol5hR3UGFpdtGuOn+saH/85dZLRvNeNEs9n4K79M32uGMk3CHXknue8hkJ3aq
         9dPJGyU18uEUTATpmDr+Zk5Owa3ue6T3t8kAKB7xsd26sOVPdm13xKQTH2qjQlef9mtx
         RqyXUthNZQ4ms0aMCtuAPbx/iZ3lsuTaHwcaTf+W/TAYPEtCaMqU4Csx4ACVoeVoVvuY
         Id1SQ8S9NLUa+nmLOOH14vUQWzkZZ4osNP8O43a1tQVz5W02BJ+qsaRtv5ex9icalmH0
         O6EC1tjpllcTYiGAufw/gD6XNmQg6WTHnAcWaUUFag1yepk8icFEQ1O4k6g1O9/C2lv4
         zB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOkLY2/9sdhjCz6m2UovvvWaP3ZFxwBx9jdK59L8QFj8Zy1bWgRYFEHfRfTIMt/U2so+FuAUV7Tev8e413Tg6P@lists.infradead.org
X-Gm-Message-State: AOJu0YwKt8KRbVIwghOfOb57SWNtwgxlt+WguEvtajavHJKTJenUXJL9
	S+XTzwdyWRXFOtrh/12i6I3Fy3gPCVmH0gTSPAQi9HW6nkCTt7iuYXp4
X-Gm-Gg: ASbGncu/B1YO7ajvB2jB+1knZz/Q4COLAYUW6XXzyvFrTCpo+oiTOdP7qg4Bx8RcMwg
	KcnWPF4Re0sWPRXNiyjA4da8qZrVY4ym/aiUFWKgBmQHMRcMB8CJDKKj7CWW+NT+JtWBlrDhsjB
	rdWn7nx9xVvIG/CF0TOb9PjcUUg2DUtYfUfI8MVyWFsxql+G+XVE8OJJIYS9ZW9rQVGI86wFb1T
	T9g0Y1DGsWEgrPKqLIuoiU40k1JFdbQUbwxacxfQyM7sy/KOj9P+IBeQ4Xp6diPwIsEPvxiHsmD
	6UlrHxzYRlPY2ejQX19W5SGXxwX+pHU8qUif0wrTxCBFpVAj2v/+lN98NI7W8jhG21yENUsG2PM
	xmf9XlXux11b9B+KzjxxOEgtWfjIDYT3j8wz4x36kGAMyHR5wptJfGG5qviJqKd881znRXtBSOz
	ukEwHaE7UAxM/g5AGn1SOwEyNMZylsjbuYOYtK7EFgKO4h6MaBpeMwEVv6ub4nfTBSyHykaBjtl
	2oyT1gSz0IRmD4N
X-Google-Smtp-Source: AGHT+IFWFubjCIweyb9YCoKzVFcXXsXAAvddERhRBpi3vJIG1VQ4HjCz6c3ATn4RBI8dMcQCX4ffyw==
X-Received: by 2002:a17:907:96a8:b0:b73:989d:3a86 with SMTP id a640c23a62f3a-b73989d3e2bmr79438866b.40.1763294448767;
        Sun, 16 Nov 2025 04:00:48 -0800 (PST)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm826174066b.25.2025.11.16.04.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 04:00:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
Date: Sun, 16 Nov 2025 13:00:47 +0100
Message-ID: <10753322.nUPlyArG6x@jernej-laptop>
In-Reply-To: <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
 <4b4ebcc2-491a-42d3-9758-60de80ce5eb6@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_040050_944991_2D1627C2 
X-CRM114-Status: GOOD (  21.68  )
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

Hi!

Dne nedelja, 16. november 2025 ob 12:33:55 Srednjeevropski standardni =C4=
=8Das je Krzysztof Kozlowski napisal(a):
> On 16/11/2025 12:33, Krzysztof Kozlowski wrote:
> > On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> >> As it turns out, current H616 DE33 binding was written based on
> >> incomplete understanding of DE33 design. Namely, planes are shared
> >> resource and not tied to specific mixer, which was the case for previo=
us
> >> generations of Display Engine (DE3 and earlier).
> >>
> >> This means that current DE33 binding doesn't properly reflect HW and
> >> using it would mean that second mixer (used for second display output)
> >> can't be supported.
> >>
> >> Update DE33 mixer binding so instead of referencing planes register
> >> space, it contains phandle to newly introduced DE33 planes node.
> >>
> >> There is no user of this binding yet, so changes can be made safely,
> >> without breaking any backward compatibility.
> >=20
> > And why would you configure statically - per soc - always the same plane
> > as per mixer? If you do that, it means it is really fixed and internal
> > to display engine thus should not be exposed in DT.

Not sure I understand what you mean. H616 SoC has 6 planes which are
represented with single DE33 planes node (see previous DT binding).=20
Driver has to decide initial allocation. For example, 3 planes for each
mixer. However, nothing prevents to allocate 1 plane to first mixer and
5 to other. You can even allocate all 6 planes to one mixer and none to
the other, if board has only one output enabled.

In any case, plane allocation is runtime decision and has nothing to do
with DT. Since planes are shared resource, their register space can't be
assigned to only one mixer.

See [1] for example how this would look like.

> >=20
> > Describing each IP block resource in DT is way too granular.
> >=20
>=20
> BTW, everything is update, thus subject is really non-informative.

I guess "fix" would be more descriptive.

Best regards,
Jernej

[1] https://github.com/jernejsk/linux-1/blob/d93d56d92db52c7ff228c0532a1045=
de02e0662c/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L181-L235




