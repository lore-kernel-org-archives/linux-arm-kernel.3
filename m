Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68DF10BA456
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=; b=UQQ2dNy/OYs/3/ug2aYlzihUHU
	M3pRONAmYgUuBZkOy8Z8UiXbKsmJntHvy7di6gE4iCHHjBHJDuV9QIOeemTiTkIkYNgpZek9NTGxF
	0RK/RgZnHCoa2P9WhUy7+oNrM79fbOeo209FgKXJTy+WgP7tOL1AUJXh1OlrfXpFBiIWq5abj3Sg+
	VU/5Q/l5T0bpgC2gAa4aJ5wyzaKRwGf9XOxKRXT4KWzmYgDvHFYIm8oxHygDOTcgyLTaAERM3To/b
	Hl+21QpbdplnxvMfiUN5Ov9DnHGNcii22YnobPjs0z9yZH3xc8/3xAI7ngbKFpaK8IdpDCA0q96CX
	mBYf/VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w638y-0000000722W-1irO;
	Fri, 27 Mar 2026 09:06:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w638w-00000007229-3H8M
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=; b=GrlstscSrXkKEMdeCbWqGxrSgk
	X/O6FEIScNNwYKCsg+NWke7cRb8l1HqtFEVYncU5HwY9Civykhzpv9xotgPpZeoLbezV0piq3jlSs
	avGv8FWpTLijK/0OCrhAjzmcNohalmcZqUlPFAp3wwmRZsfkAbcIL9r3dbc3ityXCdC/yhsYJhmdA
	MfO6ZsI9bb1tYVCwV1F75EC99OQbgrEtqxblIl2LYCHQGqbLRTd45Q7BjU70roETgb8bWgFrRECdJ
	lIiz9kHPDBaSi4vfGujnEen02kJLKrOneZFZX9ic8DQrGi3FaJZ5iNGJphAb6ZfeJdxuhwcnIIb6r
	NyGS321g==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w638t-0000000A28b-2L8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:06:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-66abcbae8a2so2033252a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774602369; cv=none;
        d=google.com; s=arc-20240605;
        b=S+fYSyMoM9XD8RvYUT05T4/psZuRXq7+EmjIxsuyMkNusPeo+OsIp5r0/Jye0PzS49
         D8UZA5S+DtrI8iQOjwX6eSVYRKm4MrjaR0hDDlICJphhMyFNgY8N0ELb7LwsOETCmvNr
         LIIBOqbRel9Kosohtk1yL8GJfFyBQxigTpKZXaPSvmA8yFoibvGg6ISVvXgG/LkbB+1v
         vX080/9CairsCxQBuMFBJhjojyJAFAnR/Wngh/GmR1XyuMLdrEO1HScj0p6aDXQ80cpD
         5Y+AUnJOBjVOG79GCDlU/RQZA9TT0Xb2oUYq/IDtoS39NOzNk9MvS9eI60yOVAUyknU3
         YsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=;
        fh=skD+yai1pMy/pJgx9M928y9eFJQo9nWrUmmKzfwl79A=;
        b=XEdsNoVpELU7gelgleSpNK60nZvLSdYfzhb8es5PQCIoVeLzUmpMqnTCP+v4oI5fzX
         P7v3zgRY/fFq2Z6SIAHpmHPxfS7+w0RMI+v2YhlG5s67CNPN0oKsgKgQK5tkw8xuavK5
         D2tNuS0X9vq1qyS8mVZ2TDT3jmxEIzSmijzgavk+m0yCmeREZUNUzfzKsH/3wHm5sZLq
         fTIW3m6Pp82p7FRVGRSiXgGPViDgDFly1S1JGa63SYVR7xymx6g6/aCd8DJhFBu/nCDe
         YHMcnisnh4xYDK9F53MDIOwFVo6yv1dgIrBKaoEND/5uB+2jE9Mgep/Vm3XMlhtv87Mc
         P1IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602369; x=1775207169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=;
        b=hLZWbSo0dLFFBOnDnYUGQHRBd594qP79tif+hnNWBsiXD/q1MGB2HOkZ5SR1+6qKnP
         iXo2HcoY8Wu8LOKXtwgefB7SkV6cFEt64H/jTY7FQMQ37+2MdTpjemXnPhoddKdut9D7
         +aHAlJPXrkkZdTF+Cr9aTgSz5FK144e++O0iVCXlGsNmL598mAx4zN6j62TUywx2W2PH
         5MQ0zGX6YoHvLSO7EajYXr2oeZdNpKwuC7wNbMDWY891yAJOTUnGSKexQOgO/DzNebr0
         mtumAvtQPnGqNcUJJl0uBE4IIzsVTn7jflq81hrTHnrzzBZl+8cENeWF74xb0ma9kTK1
         Iw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602369; x=1775207169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcbL84R2Ic0MsfVq/sbwk6AErZQ8PN1gKoAXHtH00KM=;
        b=nzYiQH1Udbs5UKbuLRvAtpgJ0yQw18aMMXFwuPP6JXB1qt2lpX5t4QAk70RAA6Xk9L
         c/SZ40EMJgVlKJcmJp2g2sK6vLGv+m8OiC7QBlgBSoO7WGnpfPLAt3YdmuDSEaDU3gt0
         bLdo5yR9trhUhc2fuNBakv+ZunmKuu18s4z3eDFOaUSFXVmkYWcFgAnacsSXTHcBy3zj
         B0p3XTRL++sl7bIoMRwC9SJUbOAsWibRssvwQG0rkZ4okvM/7/cvcLurRCbjJxanUnPw
         ExWwpgO63LOFpFlGCfNmALHKHWSKqYVq77evqUR8P4VIfei+/jq+0mkOhfnxF7p3Xkqb
         ANcA==
X-Forwarded-Encrypted: i=1; AJvYcCVTgWSFw6zEhhK8xUSaB5XtGpxrrcJlSiiRlWsZogPZO5MCNAWoA3Evm2rkAigynYAuLRZmZ55E5qXen36xcOy/@lists.infradead.org
X-Gm-Message-State: AOJu0YxaDqec6iJsJr+x8Cqz037hOhrx+0TxFVCN22s4P98RLTjf2FUh
	z9D6SyWcU02ypkapRgTtvUjk4Moa0O9viy+Vo8bB8uDF7m8gGdXkO9A7rFTVo9CRON6p+s53Pvv
	jAHN1WbnoSkMaGgWAZTkHvcB/a6Go35w=
X-Gm-Gg: ATEYQzw6zG5RHGTKYPqC3KCQ20Vd/9JV8i34KwBXO4iLQYSjJdO5buJT3rLsBPzjatG
	hImdxB3uBDD8+la8dSAUXzWdg+glkpAbfeBNG11I0jWuQGCuULjcKr47SYFUXtLVcOL1irErj7C
	GwDa0P0YFL+YeHIMhrxENENZdTpNj73CvbYPfgpFKzpdSIug6yKCgMXgksH00+VociyG+SQ0l3g
	5sTyj+m+v3WC53VrwbZ94SC/4OUZz3ADYUH7va6FcFJxnthg7wqAW4HxzaTojJzS0UNJebF1QhX
	0nkOA54=
X-Received: by 2002:a05:6402:1d4e:b0:66a:526b:96b5 with SMTP id
 4fb4d7f45d1cf-66b28c5262bmr1098566a12.18.1774602369094; Fri, 27 Mar 2026
 02:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260320094441.128263-1-midgy971@gmail.com> <177437177535.786081.7519498810130807269.b4-ty@sntech.de>
 <533f27c9-e970-449b-a431-4ba41a566aaf@kwiboo.xyz> <10821700.nUPlyArG6x@phil>
In-Reply-To: <10821700.nUPlyArG6x@phil>
From: Midgy Balon <midgy971@gmail.com>
Date: Fri, 27 Mar 2026 10:07:43 +0100
X-Gm-Features: AQROBzC8CnXSa0u5wehgfkvDz7gqUZpnjqEtux6oaO4slyBrfgvJQHeqANw0iXE
Message-ID: <CA+GS1Y3kiRrTZrS7meaHoSgOaputt3RL9iuHrtKqys4qN+uYYg@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.xyz>, linux-rockchip@lists.infradead.org, 
	shawn.lin@rock-chips.com, jonas@kwiboo.se, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_090611_768069_73E1C5B1 
X-CRM114-Status: GOOD (  20.94  )
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

Hello Heiko,

I apologize for missing Jonas' comments. It will be done for the next
version as requested.
Indeed Claude works "well" :D . I'll be more careful next time.

Thanks,

Midgy

Le mar. 24 mars 2026 =C3=A0 23:27, Heiko Stuebner <heiko@sntech.de> a =C3=
=A9crit :
>
> Hi Jonas,
>
> Am Dienstag, 24. M=C3=A4rz 2026, 18:15:38 Mitteleurop=C3=A4ische Normalze=
it schrieb Jonas Karlman:
> > Hi Heiko,
> >
> > On 3/24/2026 6:04 PM, Heiko Stuebner wrote:
> > >
> > > On Fri, 20 Mar 2026 10:44:41 +0100, MidG971 wrote:
> > >> The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
> > >> provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers=
.
> > >> This chip is currently modeled only as a fixed regulator
> > >> (vcc3v3_pi6c_03), with no clock output representation.
> > >>
> > >> The PI6C20100 is a clock generator, not a power supply. Model it
> > >> properly as a gated-fixed-clock, following the pattern established
> > >> for the Rock 5 ITX and other boards with similar PCIe clock buffer
> > >> chips.
> > >>
> > >> [...]
> > >
> > > Applied, thanks!
> >
> > My comments from v3 [1] was not addressed in v4 och v5. E.g.
> > regulator-always-on/boot-on not being removed and redundant comments.
> >
> > [1] https://lore.kernel.org/all/fec0f25d-733a-4b6c-aef1-2ac51bd15798@kw=
iboo.se/
>
> thank you so much for noticing. Looks like that AI thing is
> working "well" ;-) .
>
> I've droped the patch and recreated the for-next branch now.
>
> @Midgy, please honor feedback in future revisions.
>
> Thanks
> Heiko
>
>

