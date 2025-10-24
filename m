Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4066CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 23:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=; b=PM+lMGAokRhQSjDWk4q5oIaqVk
	sYcivYobXEaHbCbv2mCK1Fn9BVLCapKcsfq6A5SLG3A4wTEqt6l7/IT1NRC1psV1I6xLJVR+DTeON
	bY1JOCi3OBmgMZ8Qhr3gYYkBKZTNqKa6ZFycSZtyaEBJEosxLpCXl4DvySmS1OrSKwAdkb2wr2J+8
	w173v2mgaPT/Bl5ODVBGi4q1y8LRBM9NJbzF3iLjmygK5oO3rdnvXAPdMH3usCuKFzavt3umynqeG
	ma/hi/KzHhm75XimjP4LewozDsmxEcbJnc2B24SAiWXZuCIbn48q+uMy8CIu0KOF0u+4WE74wFFog
	wOrZumWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRHI-0000000Af8n-0sre;
	Fri, 24 Oct 2025 23:33:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRHG-0000000Af8S-0Atd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 23:32:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso2683815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 16:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761348776; x=1761953576; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=m7vvH/aPDY9/TUJvlhTvrVJobyImCzMq6iQGmmYidMSqs/JPwyrbwuLfT87DRMm8hb
         14xPB4FYsxVUhcnEbNpR28a4oyVoZ8khwTiqhytj21/79tCOr/qdTfIzsfpfrvVCe4uZ
         DuYSfezWvCvKP1sj9mTZQwfE/Xf/Ouh1W18yeo7bTTBgjEWPSg4XGYvZasKTyggy0vSt
         JEdtUR5QNq1m1kgD4vJlGkjAl54MoPgwG2afSG/KYs1P3Mb0ra37NB5sZjLnzEfpWp/x
         G2Jix5tKH8Z+i9nZcQq7N2FsQTr/brCdnqUD4pQTHq6ZZlMek3vIecooq42eo2j9rf7t
         1Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761348776; x=1761953576;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTAvhktvg0QkcPyr0Q0jFjF0psJGVFRyizayHmkabGk=;
        b=BMEmNdy7UVyDjHNL3l+oQXaTyhL1h36NU40qE+Ftny4SOoYvHGB2vhr7eknRRatyNs
         FG3Ob8jhlJk+kQM6oAXo+oafpP9pgERHTDvCLu7Vv/Uh3Kz1i49o8VaD0UY/YK6y+lvs
         mr/TSEQT8u1YaPvoyJTGa0en95n7HiilbvA6HcKbKsl7RVRs2lYya3FfVqTaM65NmCVT
         E6yttZWY+VgMv8zsHipqXckUIQFUQcsep6nmIIIKQd06c3nW7880CkjjbfvRU1vNwK2N
         qNiYLLhlNKt9SuXz2KLBWIkbbkMEh59b6U2KVwl+h+4p8ZVSmwDKr2mG3kfmwTbHVr/Y
         xwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/3BrTB94ffy8qqlF58dJvChzIB5y+VnuKK6AmOpvJhDZKNzrNs9rBnpWJSucswni6GvG95c1KTIkeMwAwg7QF@lists.infradead.org
X-Gm-Message-State: AOJu0YwsTEApSYqtOwZeGTkQT3GhO7heBXTUjbU2b7oBBzOwY7C0YoL9
	MOS0fWvqrehoPyUAXtSJ40MCU2Irv0+wfjomwPBIm49XYEKjSQzRe9PjFAplnYdv6PU=
X-Gm-Gg: ASbGncumVdyslgLHGxeziIwBHZ3MgrVijeGlJRDjx/thuC5Gt7Gu0fSgD3dvzKRDDQW
	R7H1otdKa93EuqzNvh2Zle1WXuJhBzY2wXRFMDfZ2l5vlLZZbghI21/22yDpJZ7LaGSsco40Tma
	s/AEmGeRk+1Sydk4S+9h3PtASZAgsbVwR/GJmY3/Svdm/gV4zOUunqN2xKouGtdL2qlOekZ2PMV
	03y7axrJql3Qy44kGZGmNrOW09xp3b2sIv8zkjL7m7Hc68qniCgJX9xFLo363g4k3haDPQ30+CS
	DFvYGU82XWPoYxRY6eKSEl7Ihoctd0/RInIXpa89JgT5BS188nTVbH+ga6ciBvNlRRHgyZzXsS2
	EEFjdevQXSqXOozgZu/3Co/szdC/4RsIdXqwyCAo+FMv54av0g2jawRXVqJnL1fZmXfFO2o4Wta
	BQU1vd/L5CCnOUjf4=
X-Google-Smtp-Source: AGHT+IGpS+9bXxIYVkmYN3aYKTkh9rmryEYIUIEOWTNg7RqiVEj4YoqfyQVte/UCsJWhkp/A2ApwYQ==
X-Received: by 2002:a05:600d:630a:b0:471:1b25:fa00 with SMTP id 5b1f17b1804b1-4711b25fd7cmr148300005e9.36.1761348775627;
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7969:1fa8:db69:6159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47794asm6627875e9.1.2025.10.24.16.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 16:32:55 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 00:32:54 +0100
Message-Id: <DDQY14HJJS8U.30QSLJ4PCYJQ@linaro.org>
Subject: Re: [PATCH v2 08/10] ASoC: wsa881x: drop
 GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Kees Cook" <kees@kernel.org>, "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Saravana Kannan" <saravanak@google.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
X-Mailer: aerc 0.20.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_163258_275275_F4A7B1F1 
X-CRM114-Status: UNSURE (   8.57  )
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

On Wed Oct 22, 2025 at 2:10 PM BST, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This driver is only used on Qualcomm platforms which now select
> HAVE_SHARED_GPIOS so this flag can be dropped.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I tested the whole series on db845 RB3 board, looks ok.

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3


Thanks,
Alexey

