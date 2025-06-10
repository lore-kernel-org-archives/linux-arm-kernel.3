Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20715C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=; b=gC06drfA1jYRAg6HgHYWzwgtkx
	xTh7XlLUiJVkIs2VJiXt5PRSJvzwBaunSb3swgk8gcYx97MiAy2MZHNJ6eg+aDCbbixdX7YElvUW/
	n1u/78XphiQnC2mrt6StNytlkD8Qxt1Apn6ncBJCTMNMEY4tzWXr3iNqDZTUOn3QVij1XnCx+yHa3
	TQKgYPw40HCF8UrS4PejlYm+wdHqN3IQKZpf28VG+v7jbGEM96O8rhxOMAlSi3eoioRMWnbaVDC77
	kpF0+Y0kcoB5R9nVhRn1gKvoV/7X0bK5JIBWKRR78SL6PWbPe8snkrFDHg77CNKC4hwkAybrTdXOW
	cmDK4e+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyS7-00000006qHg-0hoS;
	Tue, 10 Jun 2025 12:51:43 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxol-00000006jgK-1pfc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:11:04 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5594726e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557461; x=1750162261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=IvvANS6V31q4W7579sYFxfiestDtX6W6b6GlHEdAyjxG2YcCKZbp7T/zxWGII/LJzR
         jHVhjJNyeujH08Sm8RANtFUwMVsGRNKBrXL0v7z4tMs3TSxTeXhLDiKxCxmrljuvyDBD
         lLk8gjsxqqP0h/nFT/i6gXbXG3A7Jsfw30O4sXRKyNv/IojRUSbYf3xR8oyYFgVd7M6x
         3YVvalff2fKFXD3ucAACvW5I/Tr0Y9g2pyzYfiuEIL7O8FNaFvrQSQ9uKEkXnhgCmqzI
         oCNJAJ0a4oWq6a3SJragDZFvZhZ/fCi4it6S+kheoJppxqxnYmjTNy79WekebyhDYXJU
         pNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557461; x=1750162261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=C5zN9O7jzy6w/8YM50wBiNXcjGs1IhQ46g5pi0b7A9mh0ogzZk3nqe9XgBV+kGur1/
         ld9/KBju3xCo+ro21B02xUC6oWBBhbClu3lbgJ/FbTzz/sthDnu9BdZdbqzOyBVTpvH8
         jl8MwvBlK11zQ+OroDrGunOML4pjQydIWM7nVY6vzHzkhZVFzN+EJAhl3ZxZ0Bc+Qlrp
         wC1gh28Hl+ebNSEiGxkvyJOaog5QlRgyDoRyM0vleuuC6BGwpnx2UQWa+Zc66APGnxUN
         R72Z1RHKjmS33aL3ekxeawilZ5JN0ONTBQprBTqkowyCQoGsZ4zi+FP3uEykrIPo3sn3
         L1kA==
X-Forwarded-Encrypted: i=1; AJvYcCX/6QeXmpCGkUdgDtX0YrAz1dO1KK4tKQU3He52rz+p/kx8Hb4q+ZsU7jt7zqwqytMGBEug/MkqDAfWqQ87tGPU@lists.infradead.org
X-Gm-Message-State: AOJu0YwnRJk5YZeBcqil/kv4V++QsreiKVPaOakq96JOGLV+8MZ1P4+8
	r6/d2dDmSHOEnF8Gcgg4lG084PM41RSDWzWQ530iP1PJ+koS5WZfsWA/QzElPduTYyZFNK/yfN8
	al5O0lINfkebVsgY9nZmO7fLWTWBR6BbHMB9Pr0BVhA==
X-Gm-Gg: ASbGncuysH7IVwxd3b1EX7eZ18LRETDEwfshcVIf+yLLNPaLOfq1ZVI03vKbpvg7C4o
	7Y+sNWQjMbbMCB4byQaxDyZnN+PbiFxZEtwVz8HjusGl+LklH56iB2K8CrxeUU9OWF8hVMiWPH9
	Lq48j1oNYBD83xj63a4q+ugpYq8mxe1wnkE2pPBQ8MXq4=
X-Google-Smtp-Source: AGHT+IFOaMh8nguz7KHH0YUJYEvUW0KxuIsZirmTBD11BY3isr05ce1T1ObffoEpspV/AnboQI2h1yWBLpHu5xR5+Ac=
X-Received: by 2002:a05:651c:1545:b0:32a:8bb1:d971 with SMTP id
 38308e7fff4ca-32adfc290f3mr40168071fa.18.1749557461281; Tue, 10 Jun 2025
 05:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:10:49 +0200
X-Gm-Features: AX0GCFsNvqdvdVYFA3r4z4h1YT4-Cj2REHImr1bxE1u6VG-oVRcj138Ag5WMjho
Message-ID: <CACRpkdacp1YVjrjfGvHu_8Y2hq03LNwG8Yka30xMbTEwtQ_drA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support for Amlogic S7/S7D/S6 pinctrl
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051103_478961_103E32E3 
X-CRM114-Status: UNSURE (   9.51  )
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

On Tue, May 27, 2025 at 7:23=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> Xianwei Zhao (6):
>       dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for =
S7/S7D/S6
>       pinctrl: meson: a4: remove special data processing
>       pinctrl: meson: support amlogic S6/S7/S7D SoC

I have applied these three to the pin control tree for v6.17.

>       dts: arm64: amlogic: add S7 pinctrl node
>       dts: arm64: amlogic: add S7D pinctrl node
>       dts: arm64: amlogic: add S6 pinctrl node

Please funnel these through the SoC tree!

Yours,
Linus Walleij

