Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FF1CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 22:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rva8eNp25Ue0gQsDBJs+PbWTXuUBcdKNczWyrciaM/c=; b=hX13RYsIH5C4f5+n7H2HQi83mm
	VZLuQljYoL9lKOo9tTFUa6ChJEPOi/XNr/V39HNOSnNXEygI+dMPVRAsSF6UJVhpTLWNUaWk9TZRX
	XZRxuG6RxpxEJX0/cXdm6b+wb8onR6WzG2f0lGnzBbHfDdwZGzeu66/yeIkEYcOA2QdYUSuTHJ1sB
	wSg+0jdugGkdyev9N6V07eolPc1190yhqCHcuF7qGHFTnNXlpjvA7b5cse5upjHRCY2uHRLPY6Bbq
	8Pama2vfS1zexn5hWoWv4KhSQ/qC79UwS2ahy7sd/ASdO8TI/7IW8P0rdekSONyhfcwRzslX2CQJc
	TXayO5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVRx-0000000Eq4b-0T8D;
	Mon, 27 Oct 2025 22:12:25 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDVRu-0000000Eq45-3kkl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 22:12:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-378ccb8f84aso55841581fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 15:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603141; x=1762207941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rva8eNp25Ue0gQsDBJs+PbWTXuUBcdKNczWyrciaM/c=;
        b=dqPQ83UxJKj3by6R10VPEzKZDFCvIN/hZdOCsc/9GNC2iHeEgdF+2x7a9PUUowq/H0
         Vwz7S4uT5D8GdYC1w470vbmOBce7FP+iR28yC5k5Dy8Gm2A4mx6Q3pG77BmtlA8c2Bq6
         kNebAAjHeh90Yfie+aGLhbGcvCDAbm2odyvq2P4v/hDA/nkteNe/icl0su7V+6QF/WUR
         eQN3BrojXUz7FFQbks+llu0QnGhIEwfYSKdBQHbcyw3PzSTIl29TMYQnuGbuQt/h+byU
         HhH18aPqCfPabXPVmh/SJ9W2rLg0ujPpnsmtSpeHkXXzdwkXc9Ph5BjLaIwykUyL69us
         bMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603141; x=1762207941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rva8eNp25Ue0gQsDBJs+PbWTXuUBcdKNczWyrciaM/c=;
        b=ccislfI1Fdc859/ZUqkHbvHgAE9GetpAZvu/c7ffChfZZo4crTCyGpKByzNkvJP5UL
         cIT5bhAOS5VYdF+ruhehYvjJPlqsfYZXyLfK2h3HvEi+U4tsap8/EGYQdCqB3+36SUPU
         8vooEAdJlrWxxNypFB3DTONxWFjgfXtw9zaeGY+l9r0mkOaUxm260/UONpN2dBYSw7kP
         GE2SEF5GCdFhoT6puk6thvxwSDAmkPw3Is0qg5G/HrU1FFa5ZilnSujES41Fh1gQuxEg
         YaMXaU9xkGiJIGMslOFiUmw3aYpmMmhTA+U91KGcUZ4osVt7qjCwr5xek2wPuCoGihHu
         OtBw==
X-Forwarded-Encrypted: i=1; AJvYcCWEivYYWigvGZZybgIKYfX3h7M1aB27gzfkwSfrfYBlbtFHkjTKFjG0msbrZZsUqyYG7egOl/fsGmP64fm6UDBi@lists.infradead.org
X-Gm-Message-State: AOJu0YyfyuqvbOV6it1YGV57BdYGQDtJR/Ea7SLL6aSYL/lYm/R1vXje
	kaHckkcVgzWRLAlli6Qeem54kzoiQfRSx6/x2G/8/igmdhZq3JGxOWR+yQqLUOigTTKJ4Zy0t6t
	PR/ZVHzL/csjogdSV05xwK1J3PYIRN30wgMzYUVtV2Q==
X-Gm-Gg: ASbGncv7vYJVoog/o2d4bXDMTKboF6X7XkrPQvzkUXmXnh2owMk3pbmzm/9koqSmvJz
	BLTJXAT2miU+pywpJnYmG8dyCdGx5ZKVMEBGGLgVyOKUT1BbTyNIGBAS7LmkKafWoJc/EES/SKG
	rsES8ZbcfF0NJmoljIi4wNtwDCxVW6UC7vDj/DZJ08A/RyZgcei/Ls5Wmn6GzYEEViRa5FJf/w6
	Ifbr03u0gdLvONjEw9xQWTEY2JcBQbrYNH7kLP3TuC7TNAJ4cbf8neHFIid
X-Google-Smtp-Source: AGHT+IH9m/NbKfDEBOg7KAI9hfdkDs7TGJGbF3wUoHtsDaxpc5srcl1X8uRL0I9IzeShm5L96wIBCgrx2J3l4dX7aIw=
X-Received: by 2002:a05:651c:1b05:b0:379:348:80da with SMTP id
 38308e7fff4ca-379076be2ebmr3767231fa.8.1761603140859; Mon, 27 Oct 2025
 15:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-6-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-6-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:12:09 +0100
X-Gm-Features: AWmQ_bk9gp6HQ-6BpDwN-PY0mSBFQkGGnyA4wpSZIs-jczVxX4VZCaFGaKlsqZw
Message-ID: <CACRpkdZK9L9q_zLZVc9JLmJ=XPWFBrKgk_3bLxxpCFvRCJr9-g@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] pinctrl: stm32: Rework stm32_pconf_parse_conf()
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_151222_938220_0B682F3F 
X-CRM114-Status: GOOD (  10.47  )
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

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Reduce the number of parameters of the function by moving inside
> the function the decoding of the field 'config'.
>
> While there:
> - change the type of 'param' to 'unsigned int' to handle the extra
>   values not in 'enum pin_config_param';
> - change the type of 'arg' to 'u32' to avoid additional conversions
>   and align to 'u32' the corresponding param of __stm32_gpio_set().
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

