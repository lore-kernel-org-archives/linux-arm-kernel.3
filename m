Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B06FA3722
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3Udg1A7dnizxaYQsat+vi05U+QBftMn1jOjMroxpb8=; b=3Ep1gRp639mY1Redxsjnzb0d0O
	l+w49s9U08XUu1lpJB6lOIF1dzxQpW6sux3NS3YYOqngTt2X5pS2QIg9tAe8KcwiURSgSt+Sy/i7P
	vAcXrcmqjOgc13I1LyIx0iJcmFXNymDUEyZ4yP/87gcONU64odhFnOw5ai/Q6B9Uo98pfYVTkOu4i
	WtRirD0Yp//J4GnJ5ejA+I9AK7RVJFXO7T9bGvvVg+W/J0QyOV3ygad312w03gc/IN4SsrPzbvvG8
	RVKhpcI7/3c6yCDb3WEAwYhTUfq3UAWi0F7sNacD9G22JAcsmVht6ZDOH5jA74aDhfLAgwm/1xGVy
	ZRpeR2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRF5-00000007bMp-0VcR;
	Thu, 01 Jan 2026 22:34:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRF2-00000007bLb-3yKD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0CBB4355A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D0DC116D0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306837;
	bh=p3Udg1A7dnizxaYQsat+vi05U+QBftMn1jOjMroxpb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XfA/ylE0rBJMsHsHb6ff8yDuopWvU4DWAFQ14cRL4adYprFGoZ6OAAYgujbJr2iRJ
	 /W9mjqnqmcymaCygXJQDD8Jy13PzbaGaUMus7/RM/dPVXHoD66dh8krpnwTGJhpUJE
	 LeL1fiWDl4J1t3/xNlRhqkabUe9heSi1kV3WIlNkrHEfawCusZ3sgW6F7Z3NFPlRoj
	 pZ7kCTaM9xH79WT7dVFLW9aGxi6wTgvUsX73CPcde/gFTyxgqMy274JbuHWUnUDzPn
	 /o38PzS3NJsCHWLV6Cfq4dxW9Y/TmUw/dRxpuAj0pUYBxiGrrh0lWPUeQTko31bHDB
	 rJP8UHgTzCx5w==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fb9a67b06so90583527b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 14:33:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU4+ZSwecl+4WDH8OU1Oqq4tKDE5srVGfno8RNG8+hLA35U+M8ihOO61Ypu/pNRWBKmm0N17bptKD24VYhB2Zx9@lists.infradead.org
X-Gm-Message-State: AOJu0YySGbZMaqWbCNrpxuoI48ybAXMeo+C+3PzBPUAbl/ROpV28yl1t
	9JcnyrfZhVFKa3tJGIJ1ZOpI5N9mE0knZcEf8CKRsfSDyCJlA1XymdQMQDwOWd2Ga6Lon9/0gqH
	tk1D4GDPEyuMfg4nJwsuZlFf0IDmwO24=
X-Google-Smtp-Source: AGHT+IE8kG0dl6nfZ9rDsSRend9zuK0sDG20K86USLrsvME01KojRh37n5srP/xA0B/lLw7qk1QH4Fud+Fy7MLPqvEw=
X-Received: by 2002:a05:690c:4906:b0:78c:6ae6:3c7c with SMTP id
 00721157ae682-78fb40560a1mr335458777b3.48.1767306837261; Thu, 01 Jan 2026
 14:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com> <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:33:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLk=9iea0qyDLy9dwmDEZZgkLcjsOPkw31ks=cEQ=qAQ8g@mail.gmail.com>
X-Gm-Features: AQt7F2rNFZ-MkfoJRD3W8h_DCYrEby3OkFKJI49Jsn33edPsbUed2eaZO-9R5iw
Message-ID: <CAD++jLk=9iea0qyDLy9dwmDEZZgkLcjsOPkw31ks=cEQ=qAQ8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_143401_003006_29B8F7D4 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 23, 2025 at 3:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Improve readability of the docs by marking 'make dtbs/dtbs_check' as
> shell commands.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

