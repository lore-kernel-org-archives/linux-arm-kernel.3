Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EE8CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0UV+UoiQ0o1JqhjRmQwXCX/FhB7NdaVFJa0JmT2ZO8=; b=E7JBcMg5EuEzZKYdb4lDE810fl
	EDhRWUa9BFJNuQxNEOeHkpeqkrp3ZxPldHAxzrcmuc9YEQbDACDa5IAUydPz1O4SploN8iXwPcNTU
	OlOUc3fUaVC4Ah/TYmlIOs6sHvX3iZtufAcvVewxM7RE5teqjLPA/P0coOGxd9mCXeP4FL+N5MgTB
	QKoJ59JOnsrV89D/lph3HVG2867qbO+2p5ix8sA3Y1pAPTRtjGyCfGI9dT3o7LEuXQll6MMZOaZC1
	BK20KuVjiZ0MWrNPOS75og0/nKmvCkwVFjO90GY4JLdNIpD4qvV+38nFXZL2QhVdyEgzx0WP+ebCR
	1S0cDBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDD5-000000044Ro-1GaY;
	Wed, 27 May 2026 12:18:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDD3-000000044Qv-39Ek
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:18:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED6AD60145
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A466C1F00A3C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884284;
	bh=v0UV+UoiQ0o1JqhjRmQwXCX/FhB7NdaVFJa0JmT2ZO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SwwCvXS4QScB+BDLZZdsUxD+eygE8kIj1OX7jbwPUwjvSDxFvspG2Mh9CmAu/WdPb
	 2tEoWhRI+nYz73tZJoXhQV8fuH+iMyD2q9vhwhykdCScxX8K2GUC+vdorEn/afKe44
	 1JzBoBxmRSeinU48k6+nxudKGsHN7ClR+iH9snR7SVXs4q/eRUrMcZnUZI5TlcbLm4
	 voatQV4xfGvi1Ny4dGvfYMJ//PY7kBFQYXGToBVV1kzMKubDDvjVRtCfIfagEbiy0C
	 pTzd0zhGqf1qM27QMarVVcdfwgKYdU92L3Tn79LdyBWYdUhO9vcVN3NXGoI8ZhRTm6
	 S1LtHi+/v55OQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8891febd2so15410856e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 05:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9v4PoFzEUWwvwu+9Yehq4JEXvhbYbgKlUGiiWbDpYvvBXrU1/6nylsGys8Na5Cb83qPzEfhDbVhI9ZoD0yErEu@lists.infradead.org
X-Gm-Message-State: AOJu0YxiRXb4qv3Y9EfYm0WeJ4gBJFv1Qd5itAV5/MUSMjVOcFYOMJoe
	Bqtd23ciSUBzCRxgdaRb/Rnvd2YCjeKaCcsNIHh2F8SCYtJ9z9TYEGTBYvyrrLYlhQdU5icOIhU
	OBZ5g6kGr9MthmkQpgAq/h7ao00xPzgE=
X-Received: by 2002:a05:6512:1286:b0:5a8:e5b2:c81f with SMTP id
 2adb3069b0e04-5aa323bc3a2mr7731477e87.27.1779884283417; Wed, 27 May 2026
 05:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260511031749.32643-1-a0987203069@gmail.com> <20260511031749.32643-2-a0987203069@gmail.com>
In-Reply-To: <20260511031749.32643-2-a0987203069@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:17:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkob7uLjSvZ+sMJo-Ry7hqE+4oivNErUtccrHZ279ORnw@mail.gmail.com>
X-Gm-Features: AVHnY4L2ohXmrKtTGIZ9dDWTgI6k7yLz_jdtjFDJEj-XWm489h4BZKcPHEY-P9g
Message-ID: <CAD++jLkob7uLjSvZ+sMJo-Ry7hqE+4oivNErUtccrHZ279ORnw@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: nuvoton: ma35d1: fix MFP register offset and
 pin table
To: Joey Lu <a0987203069@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 11, 2026 at 5:18=E2=80=AFAM Joey Lu <a0987203069@gmail.com> wro=
te:

> Each GPIO bank has two 32-bit MFP registers: MFPL covering pins 0-7
> at the bank base offset, and MFPH covering pins 8-15 at base offset+4.
> ma35_pinctrl_parse_groups() computed the register address without
> accounting for this split, so any pin with an index >=3D 8 within its
> bank was written to the wrong register.
>
> Also fix the pin descriptor table in pinctrl-ma35d1.c: switch from
> sequential to 16-per-bank pin numbering, add missing PC8-PC11 pins
> and their mux options, and remove the duplicate PN10-PN15 entries.
>
> Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

No reaction from reviewers so patch applied!

Yours,
Linus Walleij

