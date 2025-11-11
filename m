Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB5ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sD00pU9m45ar5Ai3zpltFpzvxBL4raSGmlVVUZkRQc4=; b=F1R+HBn+nfXlnhRFBZB55x91hL
	p08cDj6joig9B1Pnm06SJkjdP6if0NckUDo0EVikNnr7fpTUUrOF5S3ZraTQ1rdpoIaHNUhAqIs4x
	wkAmheYdF9Z0udO1NcatrkBCUaGm9Hy9OnmQHhIpE9RH0LMdA4dLVOqZGZLmQ2tM09/cU30Y3+Etg
	Fo4dVqrh5ZBuhITiiKJKwQbWLWvPQAB8Lpj7jXBmS0WK7EJa8LLC1R+oCH8V6oR81yEWnIOLRWCLJ
	G8UvRJpelBxemAoDCgouFJtAH00TQxYXVLZUll0oV6z9I418zhPZHDqHlyon1mUietn+eZq02OcDS
	0agxvYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlSp-00000006w7L-0giK;
	Tue, 11 Nov 2025 10:19:03 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlSm-00000006w6Y-1mYr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:19:01 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-3e12fd71984so2434609fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856339; x=1763461139; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sD00pU9m45ar5Ai3zpltFpzvxBL4raSGmlVVUZkRQc4=;
        b=RAZplNTtiGRE5zVJTrJ72tk9vKw2y9d6OO5NCkXTZNJrkE3s/dtqgwliDEVhDHKee0
         z3iJq6vml/V83gHJoUz2TvId3Qn4P9L6eNQDW2ptf4YNbTztk3dUmcuJPC1yFuHxL/sP
         uozgv+ph4rmKbWfY6BJwEzFMNrBuhs1WJ5IhTPdWugrI9VUiZk4H5YK65dPpfd8gxZ8S
         WTntv4D9X7rKoAHyW2PgR41eKZ9MfgnuKSdFXWE15jP/r+xMqIAN4fj2H/ToNOgFwgNp
         aXAHZsh3vtkNMzbTGTnVN6Kliwlmfds2TlKolpomr15ldl91WWbP0QjmHl/Oq4fJNx3L
         R6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856339; x=1763461139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sD00pU9m45ar5Ai3zpltFpzvxBL4raSGmlVVUZkRQc4=;
        b=Dzt9lLp6N8ZCpTZb8JtZaBuEcd2I2Jynb5tZWoYm5a5A0NQxyLmoBYRkoLPzCAJWmg
         H4tHKJspLxIPod97qInsrToqgzsJay2xwfliHcCF7TdMl3xM56V7rTroHMR1HEqoLaaV
         swaYK1OBtbcESbPiHzmvFgZWMEX8oBJXmCLXs+nUWIXdgnxEK2tXYA2yIefisW9IN7xK
         Y1ybw5RNfTJ2bT6h85VdMEm53H9jSq0dBUv1P3WfoQIw8+i2sLp0r7rAsiwQ3YVs7RaM
         W/h6/T43OQcR9eYjcw3SqwTeEdxHAKnD253xFZK9XVcZWuZnBa2M505G+Usi3cnJGbK+
         suGg==
X-Forwarded-Encrypted: i=1; AJvYcCWRS9FAo1OdqZsP0awI7aGKnecT1TV3KrRoHRYHVHhio42nc5j6o1E0LFz6sx1bsAJ6BQ6gFSsFgJKoGgHUTuCr@lists.infradead.org
X-Gm-Message-State: AOJu0YxVrP+RzDVZG4ycmtMxKNG5X4X9YmfHAzui+FCGg+xXoNCfd1pn
	2lQZfbs/EV0f86a/qgr3XkHJE+g45mxcqdWipyQ8pN1OKe45arFrrDrjy39YXnxlV87RkB+eW3V
	oKlnQQxtIs6iQRe+tRW8piql9hU0m74jNEvqBWU5aTA==
X-Gm-Gg: ASbGnctz0jukuCWZorA0HCQQDEQChXjRnUWEK7b9NQx36cgdSlTdqMJVptBhRF8GVKD
	+OMIS5CqYDh8vrYAFIEF4veQvMOPNYZeQerIwScYt4hEgcaLnFXBauKbGXle1Ye/wflsyVfvMx0
	fPmsIUt8FSRRjtZK6XSXnbp5aFXUT23TjWsXrG0wZPic3yNj7XRbkJ7vgCNpnu/Dh5UG6KEsuUZ
	rAgor5G/qqGY7twy4SeFtY6FShNzk0eTACEDcgLjpxh4HyNj+aKC6z6XUwqiAJw6yi8WmM=
X-Google-Smtp-Source: AGHT+IFKS2q0YYMWvzAONoaylj8ozlLuIkMm1yaexf13YEyXcWtqn/MOGkO+d0PlUIAQQu2z38TBPdf0/w+7VAh46B8=
X-Received: by 2002:a05:6871:660d:b0:3d4:7d3d:be84 with SMTP id
 586e51a60fabf-3e7c2865eb3mr6778775fac.23.1762856339399; Tue, 11 Nov 2025
 02:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
 <20251103-remove-pmu-syscon-compat-v1-1-f2cb7f9ade6f@linaro.org> <20251105-guillemot-of-demonic-courtesy-6127ac@kuoka>
In-Reply-To: <20251105-guillemot-of-demonic-courtesy-6127ac@kuoka>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 11 Nov 2025 10:18:47 +0000
X-Gm-Features: AWmQ_bkZo0YG0fQozggW7w_kHLivwxPGKZYOmMZ80TBXcmQKFtFsfLDWdlG11ZY
Message-ID: <CADrjBPog8u8sRsUjcgKNG87kdcF5HHx94tUXPdTrCUG-PxSXWg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon
 for google,gs101-pmu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021900_479748_A61D2926 
X-CRM114-Status: GOOD (  18.25  )
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

On Wed, 5 Nov 2025 at 08:55, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Nov 03, 2025 at 08:03:10AM +0000, Peter Griffin wrote:
> > Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> > "syscon" compatible") it is possible to register a regmap without the
> > syscon compatible in the node.
> >
> > Update the bindings for google,gs101-pmu so that the syscon compatible is
>
> That's an ABI break...
>
> > no longer required. As it isn't really correct to claim we are compatible with
> > syscon (as a mmio regmap created by syscon will not work on gs101).
>
> ... with kind of a reason, but then the question I have: was the
> standard MMIO regmap exposed via syscon ever working for any part of
> this PMU?
>
> Original posting here:
> https://lore.kernel.org/all/20231209233106.147416-2-peter.griffin@linaro.org/
> did not change PMU driver and did not express that the syscon is broken.

With the benefit of hindsight, no, PMU write register access was never
working for any part of the PMU.

On the initial posting I didn't hit this as we were only disabling the
Watchdog on boot (which doesn't write any PMU registers). Once the
issue with accessing PMU regs became clear, I first suspected some
missing clock. Then later it became apparent we needed a SMC call and
after some initial proposals the syscon driver was enhanced with the
of_syscon_register_regmap() API in 769cb63166d9 ("mfd: syscon: Add
of_syscon_register_regmap() API"). At the time that commit was merged,
syscon driver required a "syscon" compatible, but since ba5095ebbc7a
("mfd: syscon: Allow syscon nodes without a "syscon" compatible") that
is no longer the case.

Peter.

