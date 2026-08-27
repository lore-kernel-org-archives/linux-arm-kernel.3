Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E55C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=; b=yhle4xCN7j2tQsCg8J8c2kAjvg
	O49Gu0d4R6OgK32iA6CRC99Iv3Qp1nziqNNiszGIh33HhgTTMlh9ub7HCc/EllWexaQAGeykh4xV0
	bu5fQdJVjeD/rLoo2YBNaspXvTB/tHtoptDMUvywFgojkauI4lmtdUgtuy6U3lqraTU17nfziL+Ok
	ZKT9pMEvDFrW0FfKwW6aMizSTLIfuVnO2gtX+7+n8J9qze/D6zqxaKsmNBEAKC9MFckPB//jut0y5
	MuNxllqT+4d9HuuxHoDyQqitVUu/YK7VENF0AkA3tqFZlk02uNeeUqa1ThirZIqOUOI+m7oyeUu/I
	aUE6XpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXuG-00000003rkS-1QzU;
	Thu, 27 Aug 2026 11:04:28 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXuD-00000003rjl-31mJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 11:04:27 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5bf94664327so1162275e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787828664; x=1788433464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=;
        b=aj3hDHt7REK+fimez96oo0xxmjUyqdJSSwUUm8R0ZvVeG+sZFRBITofMSlUE7jWaUm
         u3TRgls7XN5eVBSCyvcuK9IomoM44N02k4LnXn8GzroA7dzvpj7RoS4bJkMhdw7ZxQzw
         s+Cn6wz/+NzDsxy6ERbFqPY7HIAsLDj6nyTTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828664; x=1788433464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYUvIldewK6PvTP1rIkGVol761Yt1VpaE72Hq+Vq9o0=;
        b=LmNfdGrp4fACLsmbQPZWWajGHiNntvcfa+/49IL2Igz3jP26i0QMJw85m+dY+B/x2C
         MooHf3lMnPgEDCLhvBqn3v3hrNBTtMou+ui4M6EqaiqI4Pq7CN94vCPzV/EM5NlqUXxc
         hyKrwrs1RvplRj3SSjeFtG2n4SCdkxbLjPvPdkVdzHaSCktD/BhfjcZArqxu9P8qgscU
         tAkctwHyJJbKxU/I69Ns4++2nKOz4269A7GnchMkS4NU0hZ/SoroA1/J28lzu3IFrWC6
         E6ofB2nYOPcvC0CeCvkjexCWdHNs/iste+mqvs+IByyge1+PV1XBw6KYXD5Qnd5BCXRB
         jK/w==
X-Forwarded-Encrypted: i=1; AHgh+RrQKxi0VKsfOcCYrq3PZLSAptKJnkDulOgTdWbEFyvaMTKYjPIKhuOrubwwHvADviMjyg7F5+KJ3jLOC9RN8ALo@lists.infradead.org
X-Gm-Message-State: AFuF++lbTDYZdCOF2QpEgYk6iMrT6+rtudJoeWX1Eilo9lT0vxOWNjuI
	5YL0UzHuQWi0MEqswj3mxc9oAVFxPsdZI05x9I5ef55Ytztbx1FQXCwcpOHIMV+3UR7K9tPd/FX
	EmOs=
X-Gm-Gg: AR+sD12Qc8OT08IO82H1riElj+YIpRfhx+3x7NjUSan3b52+5RHxTaa2uh9hpvhZlfm
	25QpQgz8e5lIg4OPlsPc1UZfqLwG0qHjzhXYA/oVoJ2//WWyHPFyHihR8YB7YVYKN0gi/wFoi/I
	NDRVxsulYD97RaGu2FwxAYaSUf16ljGxrrl7JmSGebnmE5Vo6LZx2jdwW939EMV0AN2l5esEYHY
	BJdz0S2RFGxRHQB1rH4S+qpYjvOCGAhBbBUsTv5z/mbYsCrqT4PaYPwto8kKGsDyXfdB5/fgetq
	WbbWf0h+X7YMdTqL3j5qh2kSOEhz54XMe87nUoRrtfYeX/2qDKxD/lZfK1o12JD8/jhQCJQp1Kq
	UoSROjK778Q7I58QaT59F4/EtrBovZWC9RFkWaiYYGINHADI/o9tYQ8Mz1OYKQQQyOu6HypH6ji
	Iw2okdtbWqU+vJN0Redrq+BzlKScVDtGe9HWogpVlU09jFVx0+cIccukxU8DQYXpjbf/7hx5DOe
	1aNYmiX5OY9xTT//mT55mKx
X-Received: by 2002:a05:6122:4692:b0:5c2:ac92:eb18 with SMTP id 71dfb90a1353d-5c65c62b87cmr4978903e0c.7.1787828663746;
        Thu, 27 Aug 2026 04:04:23 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c65fe38f44sm3419937e0c.2.2026.08.27.04.04.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 04:04:22 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97e76cabd96so75925241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 04:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrwcWQovkXDSFi2fp3fxeLbLn6SGlZMZ2by3hlpOTnR64ZOPmI/ihSl7vpfZHsapGTNEdngRT0nP9WkzScTSyz7@lists.infradead.org
X-Received: by 2002:a05:6102:3c9f:b0:779:dc0d:2b2d with SMTP id
 ada2fe7eead31-782c0bf8c46mr4363524137.8.1787828661149; Thu, 27 Aug 2026
 04:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260827105738.8570-1-wenst@chromium.org>
In-Reply-To: <20260827105738.8570-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 27 Aug 2026 19:03:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1niht1VnNpZrqVaAb87FLVM7ZtJLOiDgCroGVRg2w09WBw@mail.gmail.com>
X-Gm-Features: AcwNN1XxLwZk6xI-YXSc5CYXIrMIXfGVUxLqoDEmpH_birCWDntEpyOtQassyDE
Message-ID: <CAC=S1niht1VnNpZrqVaAb87FLVM7ZtJLOiDgCroGVRg2w09WBw@mail.gmail.com>
Subject: Re: [PATCH] pwm: mtk-disp: Fix period readback
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_040425_824562_ECF96FC4 
X-CRM114-Status: GOOD (  12.60  )
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

On Thu, Aug 27, 2026 at 6:57=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The period value stored in the register is the number of clock cycles - 1=
.
>
> Account for the offset when calculating the period in nanoseconds. This
> fixes the discrepancy reported by the pwm core when CONFIG_PWM_DEBUG=3D1:
>
>     mediatek-disp-pwm 1100e000.pwm: .apply is not idempotent
>         (ena=3D1 pol=3D0 281500/499875) -> (ena=3D1 pol=3D0 281500/499750=
)
>
> Calculation discrepancy in the driver was found by AI run by a colleague
> while debugging another PWM related issue. Check against SoC datasheet
> and fix done by the author.
>
> Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

