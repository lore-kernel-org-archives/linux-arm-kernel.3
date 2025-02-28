Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1DBC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la6q/fnJJDn/FlTPNLsSOFcZAtqFjxAsMo5jIsCdjqc=; b=u4I9w7KARY/lwCAf4fnvUtmPmd
	DvFb7SK4T/C96r5035y1sXrt/ZL7fgOXvJuqJAUg8tQahD1YF3Yf0fMmKOuzeBVOcz7elookgxLar
	aVk1Jl+CYsQw03AjUtoUej3e+mhN8+9VvQwD5rXZX+PTi6SDPO23fjimMTgBO6dJ/zbVkc/O51oxI
	1V82K+Ywdrcs/gB1LQ9OgLM7auZPbNB+/acKeAj7dhn4BJl0h2vB+LeKo1hEnQSpULWrhfYU1YyPh
	laV15/XTUT9PYGWrcXnP5sG2PBpHHYXZa7grr9NDwjparwQaLoxj7R1gnlv6X5CpJA9V5QNY1x6Wn
	veWdkrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5mD-0000000CJew-2j5d;
	Fri, 28 Feb 2025 19:12:01 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5hj-0000000CImr-2ShJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 19:07:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so476813166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 11:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740769641; x=1741374441; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=la6q/fnJJDn/FlTPNLsSOFcZAtqFjxAsMo5jIsCdjqc=;
        b=iF9ecSOHJJymzcHj09926AnEj5tgGE8B5bE6f0TA5XnQkIo9wr5zXh20XLU1BQCNar
         l3vUHiX2ZgwqIrhqQdQPtqYXI3If3eAuVMVDbJKTy0C4VoUoeDgiGlWrpenUZUl0bGXk
         bTNaBi/6PkhOKMhFvIgOyyrDsq+Nmh8Osh/QSFT0xEbQrsvad5zWdbSfRIiyXtDOeCPe
         7uFZeavdx7j/nhRBnKtXmYDsJ81mONh5vJBOaDtu5nIaRFXnMcnmLXdFYPoYXjtMZQ6K
         VL6RD4tmyLbPDH5SuMqnuMU0BNQZQKzAJjU+z+EAUcG1O/EEjSxkOpIa64mAiPFJvVuc
         mvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740769641; x=1741374441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=la6q/fnJJDn/FlTPNLsSOFcZAtqFjxAsMo5jIsCdjqc=;
        b=AXvnCpNyrjFc+J14jKW2bcYeQDLrHyzdvFzMaSxI/NB3S4p1PhhHwnTIwlgk58ULmH
         HiLuodGtVJylFQmrgQ41T4+mh7LFXVJXAjO+eufXd9+y65r/3ZWI+nR8B5X55bWbX3a0
         waEIHm2Db8x6+XXoMv2F/NvqDdGUeFauBLeKdL8GO8M5UspxdIvnSugTsAs1NJj96fpB
         459eRAIbltdAlfY+pwBDvFkkX2ObYCnQQwzHFRnBvgfRqV9YfRhTi7I/7Rc8UtvVKaHR
         CvihFPIivNbyl2GkN9+JK6MLxCLtcM5K/Fcz2u8PqUACdH/pw5zXMyEQDq565QzIsDC9
         Ow8g==
X-Forwarded-Encrypted: i=1; AJvYcCVc1Co/p8G/30Yl7Z6ECcaTgVhJblFEosj1Ck3CV5iRmnQVZPY1AordNVNBRPX5AOaR+0jRJKbV8K6zGHpUEjnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzAuxNYhDzCZbiYVrn7Rz2IwmdE81L4fH0Mpyf0TD0rfAltjq5x
	REKQdjkwoGB1wbMW2RBLjW+86cYSO1pARK97i85HtvBxb0D9il0IHKLVo8kUzyscLw==
X-Gm-Gg: ASbGncvUe7w0ukLv16TkREfK5+HaYJGtQhPdCyuJ8n2CAOLrDmKbJgtwIRhZtfisIij
	vxqU6gh0OEdUjN+CEHD1qn54LnKHdFn0PM7Rdb2aJhUmQMf28Pa4xMo1WS/6HnVhh5Ia8ZdamBk
	E0Np9tSl7NAm9a2AU2uXckaXBOsxdDMayI5C8YGPYHmJTWCmGpU3t1NurQQRuzy8iH29CUfZYc7
	AetOcJzxl2tD9+CebJnBN2ZNgeiOARe/x/ZMOcfpYlRG36D/k7iIJQwLURZ0o0d+iM+XHtgQass
	pp7IZgzCyXgd1ISj6HOB4Yb9iL0pgm5QG1w3VFJuiZDGWG7QZ6FyPWtUs0mrji/TrDXOfvWR8wI
	Fixad
X-Google-Smtp-Source: AGHT+IFCCnuArvXOTMmII9xA75C+BNMRa1V96w0SJJTrjh/9BJpW3iD91h/vTUlZoY42/F91EKCmeg==
X-Received: by 2002:a17:906:7310:b0:ab7:bb93:56ef with SMTP id a640c23a62f3a-abf25fa9fb3mr478547766b.19.1740769641246;
        Fri, 28 Feb 2025 11:07:21 -0800 (PST)
Received: from ?IPv6:2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78? ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b99a6sm339502266b.13.2025.02.28.11.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:07:20 -0800 (PST)
Message-ID: <31cad1da1a02aaf0935d35e9b56357fcea9320fa.camel@gmail.com>
Subject: Re: [PATCH v3 5/5] clk: samsung: add exynos7870 CLKOUT support
From: David Virag <virag.david003@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Kaustabh Chakraborty
	 <kauschluss@disroot.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi	
 <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Fri, 28 Feb 2025 20:07:15 +0100
In-Reply-To: <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
	 <20250219-exynos7870-pmu-clocks-v3-5-0d1e415e9e3a@disroot.org>
	 <20250219-discerning-affable-chital-1fdff4@krzk-bin>
	 <e2ebd4503100ddbbe8d7e21290329e38@disroot.org>
	 <5670d992-71f4-4791-94ff-4fadc1fb5993@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_110723_622670_910B17F6 
X-CRM114-Status: GOOD (  22.11  )
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

On Mon, 2025-02-24 at 20:13 +0100, Krzysztof Kozlowski wrote:
> On 24/02/2025 18:47, Kaustabh Chakraborty wrote:
> > >=20
> > > I wonder why do we need to keep growing this list? All devices
> > > are
> > > compatible, aren't they?
> >=20
> > Well, there are two variants of compatibility having different mask
> > values.
> >=20
> > > Do you use clkout, BTW?
> >=20
> > Using the clocks defined by clkout? No. I added it as downstream
> > had it too. And the devices work fine without it. If you want me
> > to remove this patch and send the PMU patch to its respective
> > series I'll do that then (unless you object or suggest something
> > else).
>=20
> clkout is a testing tool and I doubt you can use it on a phone -
> finding
> the actual clkout pins to connect the oscilloscope is tricky.

Actually, jackpotlte uses one of the clkout pins (7885 has two) to feed
it's NFC chip with a clock.=20

Not sure if any 7870 (or any other Exynos) devices use it for something
similar but here we have at least one example of a non-debug use for
it. I will avoid it on 7885 though until it's actually needed and I can
test the functionality (and when I have the time to work on 7885
again).

Best Regards,
David


