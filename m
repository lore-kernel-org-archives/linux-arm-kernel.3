Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE72DC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd3/JGFOLcwsntjnEW68DdLA+DfDMzDlmqW2hw1f6Ps=; b=mIuRop0JLqf1QpIMdYBE/EYVUI
	XXEeLy6VuqB9abC1AHbyF6zUIeqeRSszvQAxUEVNlRAHgtdFkK0zJRRY/oXKyF689+JSmEZHlUbKN
	SkbXCA9es5/VXFOPobCKzPRCEYf3YjO4/cxetTVXOQ8G9oVepFUsbPNrkUNhp0kus2xfXRlXbhMTp
	V4n0bHdmMVkasIjsWOtq7it5szTPfPdG9YQMj416gTkqaydsMV9mafX1HS4YLooCt1iNvkQE5u8k1
	ASKApHPnVHEEayM/q1YGYds6k8pPdtJ/l3ZGymLW6LXp3WKSgBb9wIDoEObcsEQHM8ykZnG5jldrQ
	97VqPeQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5jm-00000006jwv-1AqP;
	Thu, 06 Aug 2026 21:34:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5jl-00000006jwp-1z90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:34:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6824D600B0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACE61F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052088;
	bh=Yd3/JGFOLcwsntjnEW68DdLA+DfDMzDlmqW2hw1f6Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iJTzlJhbojz3frHzPcS3w4gCJFD9Op/dChir1U2xKyB4YudPzCIa9X8cxbOl6UE+J
	 HBk3fJ2UkPyuemlV/x218xtO+jzTz/SJ2m3hObzNdVX0X9bahpjHRCW3Qmre96o8Vm
	 SSFWmH6ErcuI5rTSDdO5OGP8GNbW3c8i5Jjj2N5DDpCZv8CwcwCbubkXKC0vAq/2Lm
	 Scrym3qRkzk9nGeV3pnyP3G5F0VdZ1DvMX9hA4z1ECMn/jCftUaV61h3zip4sG20If
	 yNUbF46BG2xbnNVdlE1S7Yh3d3Ed2ewr9oi1+ouJ9UZwKUlGDMgTVIZN33yQRYzzE0
	 6ENgX6g8++bzA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b2a3166398so2641121e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:34:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RooUqKfpjjbNFLL8RDn0YByyTF851stlaV1X35hqUvNHwQYE0AfvfXkkXPjNLziYReM6WwA2COPrRYtxQ3qLs8r@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw5WK25ExQfplhw3sxrX8huChjF1Gf7U0ZRYrtB40wfZ/AlOJJ
	LsblD5H1H7sFxIQnYryXbfnSv/4R7VN3tHAGjaPUlcbrOt82505noum4hOFtIourO86nwPkua93
	itWLE9JYrrk+cU+wPVv9LUKre6v8zwok=
X-Received: by 2002:a05:6512:3e17:b0:5ae:c454:3746 with SMTP id
 2adb3069b0e04-5b303b7e6abmr655632e87.43.1786052086882; Thu, 06 Aug 2026
 14:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260806083728.351824-2-krzk@kernel.org>
In-Reply-To: <20260806083728.351824-2-krzk@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:34:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmY=zd9ro5OzD5HK_GBxEBRbJu73dO9ZZ796R2xpL81zA@mail.gmail.com>
X-Gm-Features: AUfX_mzPSVfj4FuEYELOQ9M6R4lntnhq47DsZWQZZdv6ADv_yISTJYNWs_ln1h4
Message-ID: <CAD++jLmY=zd9ro5OzD5HK_GBxEBRbJu73dO9ZZ796R2xpL81zA@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: for v7.3 (second try)
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
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

On Thu, Aug 6, 2026 at 10:37=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:


> Second try - in the previous I had still the old email:
> https://lore.kernel.org/all/20260806082831.350285-2-krzk@kernel.org/
> Same contents.
>
> Best regards,
> Krzysztof
>
>
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

Pulled in, thanks!

Yours,
Linus Walleij

