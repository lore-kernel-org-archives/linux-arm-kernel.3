Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC4FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmevPJuzAQEfh9Vfoz9jvKbY+uv3U7ML4Z/zdPtsuCY=; b=lFnzleyMaSmaaUcj2SFLJEHi/Z
	WX5482yCywTXWdoUs1YOqoMlPUUQeci6Tom8WBGMUChepB53ZoFhKKF6pCmfT9VI2FnPICrYrRODA
	lRnFsBGwlhSAF9GS1eLM2IyjatpntjZfaQUn4/dbDHCHRWBEJZFetnj989W1JHiswWmRXBlGycS25
	qmUx9lbhcsev+x8VanADsKK5bBoqJjOI5q4HpgJcV3GEHbM9b5XjHVFvEKAPG6/KVLJKYYPJRevY4
	zE2Rd9mTF8J+/it2YTCNKYMvi+YKoNCiyUMCQ4aHudXAqOotsSHwq5WKfKl9rqnKZMUPEC0Txtu3n
	3TUMb9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKvT-0000000ALqc-2ar4;
	Tue, 19 Aug 2025 11:54:51 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJE2-0000000A4cp-0yfS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:05:55 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce5247da6so5358140e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597952; x=1756202752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmevPJuzAQEfh9Vfoz9jvKbY+uv3U7ML4Z/zdPtsuCY=;
        b=EzfcZIwi68c/ShfRFCFryFmI+wchP7bBk8ebl9DolSnU92SfQ5UkBmfu0Hokfxpx5h
         M4AFb+0U3976W5wcgGR1O9sB1/2eCsDPW6sFni7tghKqWEFP7tDe1ezNdI2Ech6cQ8Wc
         gB+cRiW/YgSHrzFwCUpzExQ9bVmr5ukBHMofhN6SHrg/kr6LpxfDrT4h3zaDLqv7kWjT
         Xk90dTphTRJuCRWse6fhdOF+TAfIfg77sbeiwvnref0WkQA5cSrOkCmdfqgp2wFhnInD
         rf2/B/q5Ux3QQ9DTjInk4Jl1KKRYu4CZltqQjdBvc3RfwOF6jHHeQ9+NkIq3v2RT0oi/
         7Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597952; x=1756202752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmevPJuzAQEfh9Vfoz9jvKbY+uv3U7ML4Z/zdPtsuCY=;
        b=GqkpgLV2fnys19DMXqFef5XMqz9P2Rt1GvfqDus6Po+PIpYk5OKU0vNnzqXyxopSex
         qcPFMZLEaUkdv7zGfp0k1rklnt9ldcHXP9IDkPYI0l26xZATSY4Qk8xUYCt9VtBzkODv
         PhZGE5N6fHXDn7tfralAI4x3DNjd2VJtP1HQIYdwQ4SnC4MLC2cya0z+EPqtx58S0+Py
         b/2ZfYqbTJ77pVgxF4pMmbu1GQDr7piCwSyC/3Lifzq4HzPNxdK4swY4YyS5Aip5t56S
         DM9xxsXlJcB0B/hhTg1f8BmB9a7RSOZvbn8ZhefzMBiWEry8rLkLHnyOQJJHRuu5EBL3
         mHvA==
X-Gm-Message-State: AOJu0YxoA0VEd0L78hd+7xOSFWFpqvAKADLEK6prs3wpU/7R/098yFE9
	FggYeYl0JFEWC8EQWGATIbA2kvVAxOerJMpNbkRBcax2SGCYRKviaSiFqQuM1EcrDoKmSOjsoFB
	wwr8cVmUcrLsFELB2GUqnWbL5/QkVFxY1Nrx2QGbWmQ==
X-Gm-Gg: ASbGncv4VegbnhFhGP4zH6axnhCg26TwuwMvhsN8L+jiK8/mw3aLrfOegn2J6LqmKJo
	CqXBM7ac+jRfABq+4VGLmHhRXGQft9wYHIBL4eairk3qcPWlLvs9LPepwM2IZhmfEin4s2z2nya
	2BZxEyHAXy0wZ36oumc2bLNx+O+nXPE85RlT+IqkO9E+7Z6eUafRmE5mcfYIqD6Lk6ss3mFKsDj
	qNBlqByDyWS
X-Google-Smtp-Source: AGHT+IH8Ywy6QSFNQrvMFIhOqJl9NzQkU24rJxBfbjgtO+LyNYl+wrL8ALdkmABTyTYg+Fzy2PCJ15fLq6pB7xmbNNk=
X-Received: by 2002:a05:651c:1107:20b0:32a:7d76:262e with SMTP id
 38308e7fff4ca-335305348c2mr3828141fa.3.1755597952457; Tue, 19 Aug 2025
 03:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250811183711.8980-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250811183711.8980-1-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 12:05:40 +0200
X-Gm-Features: Ac12FXzYVYJtSbcKCZlu97zMX-yVdkps4sEMp4LqhVyztQAdSGb-Vpac3W8oRbM
Message-ID: <CACRpkdbbHY=yXFtD7T=K=kn0MAdy7c2xqL6=ZJWy10EMuuCL6Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] ARM: dts: use recent scl/sda gpio bindings
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_030554_270081_25D0ECD9 
X-CRM114-Status: GOOD (  11.35  )
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

On Mon, Aug 11, 2025 at 8:37=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Some ARM boards still use the deprecated 'gpios' property to describe a
> GPIO based I2C bus. Let them use the proper '{scl|sda}-gpios' property.
>
> Based on 6.17-rc1. No dependencies. These patches are the leftovers from
> the series for the 6.16 cycle. Please apply.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I think you need to send a PR to linux-soc to get this merged but
maybe the DT people want to queue it?

Yours,
Linus Walleij

