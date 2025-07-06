Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B47AC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xntmh5L/t1M0BbaxBvySuQJ4cfMmgjmGufu3g9VVg/I=; b=eWZ+ofPIvlDstv
	z2wo18ojzMsGpE4muf6NE/A27nOPfYOUZGdtWtNpTxw6CEdnDoWydcdiqjLNxJDUPY7J0D+VIPP9H
	vzU4v6+VvVtNaaTCQQB43BQw+5e6KdLeSsE8bMspCVvosXetBUA0ohAne10z8+E6HG1peTAO/Ppkg
	1VQZ/zqEl55QjCT9q3m7QBtDFS/sWQyzjdGlJqTssKAwGQuVIK5mCYf/VtC2MwmkMI/PVX8Db2uwE
	QQ8WAx7Mv20EtYayPxV8hjhL4A5CQsQJJfTFgjBoxvCcmjwij9vWqcl8O62gZE3IbkpCjOP1twcuS
	bbeNh8MAvj0QC43FfL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSyL-00000000Z0v-3mkL;
	Sun, 06 Jul 2025 17:16:13 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSw1-00000000Ypb-2WZz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 17:13:50 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b165c80cso2315788e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 10:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751822027; x=1752426827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xntmh5L/t1M0BbaxBvySuQJ4cfMmgjmGufu3g9VVg/I=;
        b=claRJDnfEBbtFlUAwSfCJ1I7giMFl13dnHEAkIhAhJehnGWpK8h6Zpa0QRMe7hzA+l
         gvD6IUDhWjFB2KQmyDboF2q3KWpDhlP4PF0m++4NG6uaBEPzkVfmU7Rn6Uxj4RpKEeTL
         QXtNC61WBV5KmuknJUH3sJsS2550MhiC+YUU/FV5Jg+uanJnbO1H/DpcMcgl+++zbRRN
         3UpTLV3dH34Uba38CSRkCf+E8zkQ2r1LwNL5MvgNL77ahBfmwX3KDUuZ8DWxCP7gKeJK
         ia94BZZIBF7wtQEISOL3ZJXPYixEYEl0q43/+bMT7RUROMkVE2Q+cALka7sPkldfaLC2
         o94A==
X-Forwarded-Encrypted: i=1; AJvYcCU79w77mKOWHdhwP6WxnqNeDPF7AU/K+TYUiJxKgRUagHyHeJh/qQZCTBRrYeTIp3Fqu9UK5peA9rZ2UBYriY0Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxdEE1a7zn3b2ya0X3hwNNBNZCLWzxwgWBnhp9H4LVS09ZJAp9V
	CJ9GsRkEXX2AGw9m0XukjsoIzLuhXOtj7zbHaNwDl7Ytfho48ANMLi8KhEmVRgZCMmM=
X-Gm-Gg: ASbGncsnZHgNuwkoYrLbFLhgP68KBks7AzNaJL1tx76Smn5Iae9nKvOtrgDq9Y6Eayc
	D4DqX4UxVwaH/F6734fXYu1bv1uPKraFEbCY3O280XXkeinZhbY1I8DM1TFaut6RWezBGJN0GNX
	h3vv/3QUZwOza3DQ/enaPbU/ldwdnEbuBSiZEY2s815RktFvmoegVCQxRvklrVAVCFbuZozeAG1
	jFa7dfiAmb7na79fGPI4AHl90K9DyLxfXMlc2HPiKQAwlYSeceAElWEGW+JTphX0/2iELenoGI1
	LDZ4vYFOqZyR0KXP/Esp0Alk8IqLRbS+sTBn8aQUMtDgr8Z7txutIGKGvqVx45dkZTiEBCva0sG
	g/RRYqVh9AF3Kt3WH1Ts=
X-Google-Smtp-Source: AGHT+IGTd8xHl0TlUl1yzGoRrztWyv6Ej9dtYOcQNTTMTEWePObIDOLhAq76Uj8h8KPTThW1Q+7pbQ==
X-Received: by 2002:a05:6512:23a8:b0:553:2868:635c with SMTP id 2adb3069b0e04-557e559f9aemr1520834e87.48.1751822026314;
        Sun, 06 Jul 2025 10:13:46 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baf8bsm1027687e87.22.2025.07.06.10.13.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 10:13:45 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b561a861fso20285331fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 10:13:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWm9bn3RZO+DYgpxcJrIv0tX6ZxpF+mYRgUKUOc1MMYaa07bOI89/2DhiKqdZdPqubajZd6hmyRo8hvuwsqnSS1@lists.infradead.org
X-Received: by 2002:a05:6512:4006:b0:553:25b2:357d with SMTP id
 2adb3069b0e04-557e55a492fmr1336495e87.52.1751822025791; Sun, 06 Jul 2025
 10:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250703151132.2642378-1-iuncuim@gmail.com> <20250703151132.2642378-5-iuncuim@gmail.com>
In-Reply-To: <20250703151132.2642378-5-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jul 2025 01:13:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v64_Qib8ZOJAV4YM0i+iWZUdNiKyMCjXPB-MkgFJ3T3qYA@mail.gmail.com>
X-Gm-Features: Ac12FXyldBjty2mm-UwbDbRGBw3sjMptAz34h6GSxjv76j_NWWYkZYXpbLYbm4U
Message-ID: <CAGb2v64_Qib8ZOJAV4YM0i+iWZUdNiKyMCjXPB-MkgFJ3T3qYA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] thermal/drivers/sun8i: replace devm_reset_control_get
 to devm_reset_control_get_shared_deasserted
To: iuncuim <iuncuim@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_101349_636028_510054AA 
X-CRM114-Status: UNSURE (   9.91  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 3, 2025 at 11:13=E2=80=AFPM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has two temperature controllers, but they share a comm=
on
> reset line. We can to use devm_reset_control_get_shared_deasserted() inst=
ead
> of devm_reset_control_get(). This will simplify the driver.

Nit: I'd probably write:

Make it shared with the shared variant of devm_reset_control_get(), and als=
o
simplify the driver by switching to devm_reset_control_get_shared_deasserte=
d().

> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

