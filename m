Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5F8C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=; b=S70JpVHPJhwy5ZAHlW0XkmU2qE
	+CGu6GvHl67s37+eBNaQOFYXRwHGpLMJh6Ma7cWkXCFlM/JUzgdGJzWEktp2zfuT2y7Am0OCJdXgW
	bjMzjjGqcIspzjrwXBVSryt4VtosLEL69LiLOWbn1GpYgRyjWsN0fvoVh3j66vZlRyc524hr/+l4t
	sDnHup0WctPr5E64BQdOOgP+c4tT9qkjF1YTJfT8N2Ftl9jSJ8422/nDRMDuuj575ERft6WOwTyqU
	2HpdxtkOHTjgnAX+De/Ves2m2wr9jCUym7nQY7R7BzatRKoXSeBa3kUf/8+GYCipg5wkazbQuxNCz
	jUCuq59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNpn-00000003gqQ-19CT;
	Tue, 04 Mar 2025 08:41:03 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNnn-00000003gCg-09Nk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:39:00 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6f6ca9a3425so48058087b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 00:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077538; x=1741682338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=;
        b=NdSGQsP9Aok5/rYtO74VihjWQBUzSyqwkhczoXtxaT0BhB+l0VPHJ+ubepl4PLQHpV
         kPI2OphHxHi678P/ZuGcfsWDfoEMbAK689qZXoJv7RRPda5okqnEHzrqhFGwudIZIioR
         hEjOzex7xEWgU1dSHlPqWa3tYCBsctxyY2GsG1TkSxByc8vaPpgKnn7qYQwbcP/QNFsU
         bOIb5CSzd8ep0mpFGeuTy4zmDVpDLIvjQBVTcqWSFNUh9THFGENk3hmeWxZRqno5jenM
         oIf/XY3VBAalywapV4VrfTwxw0aFqGc8XpNnY8HDMZzW+vS/jMapjvVKJBg0vN/2t94H
         YBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077538; x=1741682338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYX5W2qo0J6KDJGUHsyIA03NeMoxJ75oq5Jqbs0b/UM=;
        b=lACaBXiqYymVTSQfUXWnrZvRLnljBQpEoX2wpiu7/fB1YcD9hMjCwknl/kWi4IfSBE
         CJC4jBvKG78GeHvzTJmsxL2NnYXVOLaGvE+pzB0NUlsR1QeaZ5hhShev2LpymoYH+mcT
         XbM16kvS9gP1YowiY04GsMuP2TE4JWDLgVANPS1XlL9KXZzkBKZV6VMAmV7a3hEpYlEq
         FDMJjh8kDmBP6LhrInoM12aAH7ffjqK57MNuLqQNdj0ROAfz1QUjxrNG+l6N2gM9K00d
         1tjDd+shLXoVv1fc00JGaqp7qVHjeoVK6D1MoZpo1AV+gNXCZTrATnQybxkkY4Sw/gOI
         bKvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgVJL5XP/6dXokNpRpMq3WImXJfPrYDMSDNrXFN8wrg1FjX/4i4RRZdz7wIoAO+KczGPO5lWuv2CWwCpI26OjE@lists.infradead.org
X-Gm-Message-State: AOJu0YwSsxSwvq9yBXRIh4ixFkmab6CY2JzjkVNduMUnvtVO4/9xXCh+
	UO4+wGeE7V6JbC6piFMwWgZ+BqdBM2U1JBmXqQXsNy8SO6jEE60k9SEfvdekUn4NrBiQWdDBElb
	kKp8/gnu4ZMxggHhlemD6vhFGzyjMvUsDk2AGlg==
X-Gm-Gg: ASbGncsgO4ZP/hYNH3VopSMWwH34ZFui26/PWG1LqaJa4OogYY9QktHaOpDjMzJy1+J
	PQwDH/hX268T3lENNJXhkG8kJRog1NtiDM5QbFtTTa8Kn4FSoWQJbURTwPJqin2m7790ETmoX/n
	Rf5DiWtfU6ESoehsmLM2h+qwCJqQ==
X-Google-Smtp-Source: AGHT+IFZecsTbEQv8yIQnDTe4qYQxuFWKRYt90hdWjp7tqPlhx0s31g1I22yMpbTlBlWL9JWo4wt1mjIhLHqe4o98d4=
X-Received: by 2002:a05:690c:3341:b0:6fb:a4e6:7d35 with SMTP id
 00721157ae682-6fd4a064164mr198940787b3.9.1741077537823; Tue, 04 Mar 2025
 00:38:57 -0800 (PST)
MIME-Version: 1.0
References: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
In-Reply-To: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Mar 2025 09:38:44 +0100
X-Gm-Features: AQ5f1JrqMzIuFFtin-kj4LskcpP2GXBY5HqPRMPuqc5yJUWCwELNnJQsuIXOkVY
Message-ID: <CACRpkdbbD6wLp1-m8WMnW68stz6U5GhxbJxcKAThYXWnH00u1Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: fix pin input property for a4
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_003859_080381_AE0ECFF9 
X-CRM114-Status: GOOD (  10.01  )
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

On Mon, Mar 3, 2025 at 8:53=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> The register of pin input attribute means the opposite.
> value of reigster meaning is 1 for input and 0 for output.
> So fix it.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patch applied!

Yours,
Linus Walleij

