Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B32BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktoR6uVr+iqN83IhJ5uhhx0UJXCbOVpaCx9WSC2wCOs=; b=RhWONegHGY91dTznHvSuNFhasM
	/st5kFgSvFLhSDyykJ4QdEJ9UOBgttjxj1aNfM8UO7gvihomXk8kuoJwZaRoP7nBAVOlQWEmlklgs
	pLm5a7RT/c2jeobo9iY0ojm+y/6qOpDjaNu2J4M4fJD/0Qi+/hxDypC2utiK6sIGmDBXSNANe3esh
	VcgjHjQ/PayJbdoL2Pv0OyGwmZmf7rv/h/DqtpSb3jSD3B/x5TSwgodnvsO00e3nsHOvQ7gtjhIZ2
	iaRSdxCGijKLqjF5vy7oSvgOeR3VlUHi+oH39eyPbJ5SaJxAbxwDbqvwIgCKle9ODKYJk+p6Wkeyf
	17RF27dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodOQ-0000000CcTf-3Pbq;
	Wed, 20 Aug 2025 07:37:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod89-0000000Cb0L-029G
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 07:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ktoR6uVr+iqN83IhJ5uhhx0UJXCbOVpaCx9WSC2wCOs=; b=rOT397SxYLBql0milJ8RMmG1Lo
	7jTWw6+BGXD+gTn9MpeF0XjEXi/iBHUHN1r7TfuZKdGB0beAMLhsa5yRQMpR/mmdYWKnWZD1Gg/pk
	COUMy4uxoqfyLwkH3hqJuRLRsiFCYINdxyFxW3xeqpQCCZsM8l10ejZkR0KdvzNv5fIaxT3lnJw9a
	G937uK5TOG2SYOlDbGR+kGGoCmO8GExQ8bcPrRB+1MkmPKrrHIbXuEx9pOHlabF4UKOQSlsmFMeLR
	0Xgpj86pVU2hfSMQrweuw78osn0gfB+aP3mwF1nXJTdPYQfSNWWLVL8SdI5PFAmvqfEMUMxcAB39N
	Q5KdXSTg==;
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uod83-00000000DuG-3UJW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:21:07 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-333f9160c2dso47854121fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755674461; x=1756279261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ktoR6uVr+iqN83IhJ5uhhx0UJXCbOVpaCx9WSC2wCOs=;
        b=pqQjCcF48kgW65t/PLQKNpvWUn182rs3FpCpMU9JN/+zPWjVP6E+LS4c5rnjNXYTvr
         fuO7atxFfnXWRcVLAHeZCnIg7FWuevSOSK9RT/wcCxJpsdwVSz203cWLT2YrHOP6nI8+
         +5rHvuVmKObs82BXGXVYFKj7+aj6K+N68iMg1dRNjkL9r5zoafOX1EXHbmiX5AoKRtN6
         OBIN3c5BWbRT9DYAfKbm0kmJAZs+zhoSEvr4eDjdLsY3w002qANr7oxTv0/7eZRWSWF+
         7GJT6iRxc2c7Hmo3d0GY68+UPaRagZp7AlObvctL2H3kgjY4nza5BYhbYctcqrLpkr7g
         jWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755674461; x=1756279261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktoR6uVr+iqN83IhJ5uhhx0UJXCbOVpaCx9WSC2wCOs=;
        b=AojCKVGRVh7xvZDvR85e9+CyYN+BFxgsQkoi7Lrm5lfiWjUFXyIt/Tawhdb6FQVoRM
         NX7dkIu/jli9h5yWPsgZ6k+4wo4IjIZtatHX5FVs1I2nPqBcSx1q2+g1ynlfqDIrE0JZ
         g29ws5DmsHZ/Y2FpSubdVuEvu2gocePqMK01ndHtzf1tH44FqNPe1CBiq1pHPRwGxXGH
         vQnkjqgOONGQjXI1d/Czk2+mYi0XVpYRHhYrcAJlbOG7aSSqTY+dxCduy0lKfRoxP9hG
         Ini8rQSaoaUV11tOnqrY4m7LihqHQo4uw8F1bQ4Mq0eErZGFB9ljQpb20JYxP9zu0WCJ
         xpOA==
X-Forwarded-Encrypted: i=1; AJvYcCW3GFbYqMQi2Jv2oazt3vBnMq6MRnFmpSv2Z5zGCN1+WRkJkBXT9QUiv1a0lwfV4gr7n8GWSPYVIFqu1RE0JAHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyVzo3AYZ/MgPQY95+a8f47hp3ZU1yUfPA9LelptVaqltSaGNSG
	WBlgYr/DfDNBOTZYsG7Ukq9WcnCRj4AxHRv2f61TSWTDU4yeFZj3DXqaw7/DMxT5xhPETLuQZ8M
	A8ndtfEMKMcOkdePz+NOTrlKswXwKlLNfBQr3NRYhOA==
X-Gm-Gg: ASbGncv8M+U53sfbKlqUbrgLscKA3vKKMd3mQDvan3MjVKwWIs7nJJTUDpQLdhla89r
	QFaG83RuzB51o6dXtTWIyllwcVjn4oAz+i8p94IrTXQc9u8GjiJbcYNe6FM+COzfljeNZ3moHAD
	Of3Hud/z5VJIqEiCA8sVfoHt7ZYwJYY2p40GhmhFcSOCHUvR/UIjwSvQKSqkIq7SVwerRuyErkJ
	80PDwI=
X-Google-Smtp-Source: AGHT+IEhSxjZCfw4a8mb40d3FzcM6vUrSgKvHtgC3xcWemUkmbdkdCwfNVxjfPSijs9xEWS2bBLeXc6JSAQOzBY5S3c=
X-Received: by 2002:a05:651c:4104:10b0:333:ad65:c524 with SMTP id
 38308e7fff4ca-3353bc145a5mr4014551fa.1.1755674460071; Wed, 20 Aug 2025
 00:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250818103931.1100084-1-richard@nod.at>
In-Reply-To: <20250818103931.1100084-1-richard@nod.at>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Aug 2025 09:20:48 +0200
X-Gm-Features: Ac12FXwVe2yaYSWObSiIPH5gEnk6wo-BPXw1jBAn3u10wAfLmNVzja2ouijgdDo
Message-ID: <CACRpkdYYTe0YArbheo3msd6r+CNrt9oSZWNjkiwb=ZNWfJ1dkQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: ftrace: Implement HAVE_FUNCTION_GRAPH_FREGS
To: Richard Weinberger <richard@nod.at>
Cc: linux@armlinux.org.uk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mark.rutland@arm.com, ardb@kernel.org, ebiggers@kernel.org, nathan@kernel.org, 
	dave@vasilevsky.ca, ruanjinjie@huawei.com, liuyuntao12@huawei.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Donglin Peng <pengdonglin@sangfor.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_082104_024225_19E8CC17 
X-CRM114-Status: GOOD (  10.21  )
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

On Mon, Aug 18, 2025 at 12:40=E2=80=AFPM Richard Weinberger <richard@nod.at=
> wrote:

> Enable support for ftrace's funcgraph-retval feature by capturing r0-r3
> and fp.
> Since ARM does not provide its own __arch_ftrace_regs structure,
> we instead populate pt_regs with the registers required by ftrace.
>
> Cc: Donglin Peng <pengdonglin@sangfor.com.cn>
> Signed-off-by: Richard Weinberger <richard@nod.at>

LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can you put this patch into Russell's patch tracker?
https://www.armlinux.org.uk/developer/patches/

Yours,
Linus Walleij

