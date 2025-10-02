Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1DECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DEtzWzJ+5AbtUuYByrnTkKmHNnskh1UPwBWzowwkgg=; b=OXrEKPt4rVVMgiNhoWzIcY5yPR
	SN8ESpRaowjkqdnW7MNan+XYBPgg9ywmvW1PwXzfD5CkzBsC+JGSe3kSVbVRLASl6ixhJQqGcrO65
	9IkH0AYwhWxqDlS3Ef+L9tKGwFzHp7k/pan+INHf4HxDXHj0SqnYnVBlN30vFDT6A49Xky4h7PRF/
	WCrm2H+gs1wRHwkQihfrcpIKhRII2IMuA4M3s9Eru5aeT88PUGvwh32TQfiXcoU9ANSGcxiyKQE7X
	3wcFx3QPUlgQKOVQsrdsDZ6dhIH/VY4KPE4zrMoiCM8RqhE4srvkqnxPIpPYgJEE3JF2xcTxvzofL
	Wno5Hm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Kd8-0000000Aewn-10UW;
	Thu, 02 Oct 2025 14:50:02 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Kd5-0000000Aew0-43wt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 14:50:01 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3652d7800a8so8526931fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 07:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759416597; x=1760021397; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DEtzWzJ+5AbtUuYByrnTkKmHNnskh1UPwBWzowwkgg=;
        b=LTjDPT2f8JF6/3YQUtn6JvEpPEtKAfn+v4DmTJB+teCIzTTXL2oA+zNwRWlBBbWtPK
         4TZZE6ootJSQyLCWuqAEVfKAeA95T1iGl8iSWlyw1ckLKULekykVT/ya4OZO+vdupNPe
         noa/t9nTeme8O8xfayKE+saxv5t62/EVvAwGFclQI025boSfQn3ypzY8rvtSWiqcnOUo
         308ruWShDDmgSjhbZIKnWH2nbYLXwM+z3MElBbEgtiFg+PVluBMTBRyv4VMh4gJCNNXa
         /XcswxhLPsLmr2xkTMD2+ygIgzsV9W85anmugdbJh4Uh8I4aO4dOq5dFic9CBACqLtuq
         PtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416597; x=1760021397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DEtzWzJ+5AbtUuYByrnTkKmHNnskh1UPwBWzowwkgg=;
        b=Obox0CAzkM7KAaTtO65FCBJg9FH4wUkh8D34aEfz6wz7n2kTNAx0zob2Fx07lZitYH
         SkYmZeRZVJAOzgpHY+0jRWWo2uR7wdeaHdmCbC4Oo3VVgebdXY4tgZRjB9tLM/mlaqHE
         p4/6IwnoV+0tv/TwUadHslhQABYgUCf/xKnqkHEoEU69cdkHlmi6rLAdjRX5s+iwP3l+
         DmIaczB+WKVAGtBuBgiIRjJt7Hc5qGyS4hpy+8ycxORnzcHUVAvRmHZTbwOLnUcKGlr9
         UgyINfeuKo8zIU0oRtdliZgm3UA6khtrD2hiFh8pGxZRzz3Kxh2VE35YB15EiAzz2VFP
         KJ1A==
X-Forwarded-Encrypted: i=1; AJvYcCW27n0dGA7+LlqeqM+/Y2ozZcOpyRJh2g7xekNjjaW/sVs/zlbH4pl9zxA4Rj9ATXMVNov/tcASSGC/XsAl4fIf@lists.infradead.org
X-Gm-Message-State: AOJu0YyvmwG4ZspO/HDg8kIDAmqtj2boDbleTgYvgzH0sLAuPAml0M47
	uZfyv2vr68iduUsLG0iPUkJGjyaREYbOfWr/4Sg2THZg0Voy4/EM5cM14i2EQAPhKLngYK7NzpG
	fZ20YaybBJAWJNFt7YQBzj6GEOqjP9QX/jeRMWmxrdQ==
X-Gm-Gg: ASbGncsepxvTbVWf88oN9LEbCHlihJbZ2TGmDrTA/TSdkcKGZ/votYHJfm/BaLixAIY
	1SuhNLRWqx3+fwF+gf/8KIYyfm9U4yENSSby2kzbAHek3opxNZQqPX5THmL6dBU13ElskGFLTq1
	LR4WN4wZQRWplZmMLomNCT/pY7Y3xKeklEYszR1/Orxu2CxOy8j6iaB221cxd1nJxK+xt3W7iGQ
	thMtmjfQ81hCdvzcNBluYtAsIvAwsGoepKXHUQVKPBBlxBGi2OjJfV6rjkXGoA=
X-Google-Smtp-Source: AGHT+IEFxaUXZbW4cydqpBo5P7Gi6kzBpFsb/v/pBDTMbOwFFLX/m9JHrRJwODjL2sU3sJEEl4mXuOKvbZUzvPir5oM=
X-Received: by 2002:a05:651c:c90:b0:337:e151:9ec with SMTP id
 38308e7fff4ca-373a711564bmr20327891fa.16.1759416597435; Thu, 02 Oct 2025
 07:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com> <20251002-i2c-mux-v2-3-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-3-b698564cd956@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Oct 2025 16:49:45 +0200
X-Gm-Features: AS18NWC7qjlJCo2wv35_zng7a-THUxjToC7YH2tPnfIiOSWbAAuz7_LLpy1uN60
Message-ID: <CAMRc=MdUHQmbDOGW1LMhE8iZmJszmC0oyOJYvVssap9wshBkmg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] i2c: davinci: calculate bus freq from Hz instead
 of kHz
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Michael Hennerich <michael.hennerich@analog.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_075000_251284_4FFACDF5 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, Oct 2, 2025 at 4:42=E2=80=AFPM Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
>
> The bus frequency is unnecessarily converted between Hz and kHz in
> several places.
> This is probably an old legacy from the old times (pre-devicetrees)
> when the davinci_i2c_platform_data took the bus_freq in kHz.
>
> Stick to Hz.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

