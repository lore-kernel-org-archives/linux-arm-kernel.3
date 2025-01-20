Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589D2C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYGLOqLJI/lW+IWCjzP3HZh5juvPKFXunICLVY7TykY=; b=PisE1XuUVc5C5XsW5e+elDgyg8
	7VVMXQF72IERzUnnbv0BjOdqNGpBFleYijZ/2N7qgs24XbnKEQ1i5+rPxNo06565HH2Lt+DYo3RUV
	3W6mqWLwPIRsuc5heOojYCXW/pcqITLbEdrGO1OOl9BppdPmvfv+SYT7n1LP5ba8p+Z9JCRZ2DdmE
	NLwk0mNUf33lcqXB4U2bbCj4dLfS5tIccc3Wv/6QPTBOib3sfpOzvOOti1hw9enl+SYVZ/VqTQlx8
	sp4XFOcTQft4qP/v3D1tbs9Ir3zdaLIjNjwezvCuBSq5wiYtnhGjvxPFH7vwc2y5+KhvuMH+1Po5u
	ZJzff2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoTn-00000005FTj-1aBt;
	Mon, 20 Jan 2025 09:53:59 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo5D-00000005BDT-0jnS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:28:36 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-71e10e6a1ceso1175118a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 01:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365314; x=1737970114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYGLOqLJI/lW+IWCjzP3HZh5juvPKFXunICLVY7TykY=;
        b=e89OhZgHxX9d6LHCqW/7UXxMYl1EV4OCWhkWk5MLm12x1z9mgRr3q+tkTcYOl03dLN
         odwlGcqpPQc1VOxl1SzJxC1B8ILZDTP1gnFAaCDE9sdGfL6NFUbOIzKRd58f6YuYXnKN
         qT8RRs8rEjiRJ8ehxq7LU2IRU7gjbr8hhdrS8oxzOdo4GYZowYnduPuzmLAXXF8lj3XH
         phFOt72GLaQRQARLVeh5iOSfCQYvRwff21KSFzMP0UoR77VlfAPuQdA3uNk4B5eueKCM
         oRi+XJNnkYc54/zKPtxUtynQ5Qa3ZE+psqhnIaJlR/xrj8wa2l73OlZI9NqSup9ZycZY
         2vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365314; x=1737970114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYGLOqLJI/lW+IWCjzP3HZh5juvPKFXunICLVY7TykY=;
        b=blGfUCn1g8V5Pl3Lk3XyWfebnjB/8Q3XkMHv92bMBodZtoLJGO6ftg5ypmgDR0RSld
         TS/ir2xovNce+Zihjg15NHYW8ksUrox6KGodyMX9iHfrwD8e1dc3k8HHcqe8QPYH7Guh
         hXJjgWPuHFbR7X5anXOk+tdFYekwPAPbtOU1PwRWktd74lldEmtJRNjVBFRaZMUOKgXT
         aifF+MwETliAiGhnIM7nB+zxG9JOgAXJiCzU+7omK1bvxbEfSnTHZeXKEs3XBRjWsZql
         TXc3cxGDXI9oI7pcd/n+yeMeJ+XoJ+Hw756TMJPGzsdc4NGweWPlT9nXNHt+mKJyWeIY
         PAiA==
X-Forwarded-Encrypted: i=1; AJvYcCVYx+3uAoBWgu3q6EUNB9GIzLri9rEmYfigTrsKXpOQOu8vcvukYg+Apg/0HWAYekcNbhsCGGssLEECDWN7kR8u@lists.infradead.org
X-Gm-Message-State: AOJu0YyNDyl2pRDbSZ3KDvsFOmWQx+iUAoN7jq3P98BJLNYpYCqmsrm4
	rR+zhKckAvv/vyqViXgzd6IcMW0wp5dq5XJy/elwaw/RR9bw2q16RnmYcin1OPG8zGbzXxh+aPd
	90+yVzBI0Fb1pXIGNxuZcXFwZjSjgvkmxYW2U+w==
X-Gm-Gg: ASbGnctceN7kGoYaVrdf93PNgsbY+rzq73CyQmk8BCnWRjx7soDdGk2Ho3Fa4CQ3K/r
	eLakD1xHeE+c3ygKkki7+nCOtxsdEdEThBPCWL/mJqadxGNSraCU=
X-Google-Smtp-Source: AGHT+IHXz5HIC/kgE9od/pXjpeXL85g5TtU1kd4nNrj3YOkf2uo9+V0+NxvurprGGTgRz/bnU3Uh1RFDsHX7Xc/0ROA=
X-Received: by 2002:a05:6830:6985:b0:718:18d6:a447 with SMTP id
 46e09a7af769-7249dafed00mr7355548a34.24.1737365313775; Mon, 20 Jan 2025
 01:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org> <20250117-gs101-simplefb-v4-2-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-2-a5b90ca2f917@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 09:28:22 +0000
X-Gm-Features: AbW1kvbVsVjCqWD9KbWL_JuAvkdmtbEPoznpA_6Z-NiivZwNyEvlPb517uEKv3g
Message-ID: <CADrjBPpbAXWxAkGShO2-kC2Fa1LvaNQ=JZoOcawKou=9NL0o+w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012835_214633_206FF7D7 
X-CRM114-Status: GOOD (  11.42  )
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

Hi Andr=C3=A9

On Fri, 17 Jan 2025 at 17:09, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> The bootloader configures the display hardware for a framebuffer at the
> given address, let's add a simple-framebuffer node here until we get a
> proper DRM driver.
>
> This has several benefits since it's an OLED display:
> * energy consumption goes down significantly, as it changes from white
>   (as left by bootloader) to black (linux console), and we generally
>   don't run out of battery anymore when plugged into a USB port
> * less of a burn-in effect I assume
> * phone stays cooler due to reduced energy consumption by display
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

