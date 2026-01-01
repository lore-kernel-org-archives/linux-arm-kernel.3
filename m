Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82CDFA3722
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=; b=FLyXxwURKk+HSgDP2kOtFxYIJD
	EVZWYodikT5xU6hkYJmyqH/BIx3zFapoSZNfDyJySAZ1O3V+UNhBLhrHKKR5iZF6dWT0OMv6trUve
	ZPy6xgDoy4KynnbHAHBc5xum2pefqwzHMewMd0iFnQULLtbvi0ZrAPTr/uyhO4Wn8fY9V/osgEtDj
	1EyDD/RNZf31q3mVr7W/oEAHSNsPwghx6xjM/YbzgGeZgjkGo4YU7MxItAL2iNqRZyxUcQUqpAloF
	+uhFlxCLWx8ahs+Lz97/y5RiHs742OQIlqE2c09bLaipWcgO9WhYMOIb1I3m8H9lAdaoLlF5RU0wv
	3fFS7quw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRIC-00000007bnT-1jES;
	Thu, 01 Jan 2026 22:37:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRI4-00000007blm-1Ldv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B15C960097
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C4CC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307027;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kl4pgeQTMcNieDd0E9vjK0PVEZAl50YBJtlvRVdNDWMxg7YN8mqBWtoYLiY91IMRi
	 BdXVr1OyKkuUtXwyc9LJpZtj1d6UUH/o8Mg6pvaHUk+5Dbex2dmg5YHvJp42+5K4EP
	 pB2Yv6wpLhNBBuu9UBgbxxW8T8hCh+NS/C1Wbr/xVwmfm/re3MF43VA5FptGVfY0fa
	 UIa3jTgCrqkr6g/v4LgRdhf/+L+Yp4SYf+V79kXo7SKh4hZRaaHQOEEI76o0bm+Z6O
	 WeBWvuD+es7Z46FwOPh2OmjYP2GQzdh1XD5xyydWSA8e6MwSjpUaHB7+Y/yOY260YL
	 8Uz4Jv4EQEhQg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79028cb7f92so30703577b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 14:37:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXSZMTqOEpMSamUCbfWH/i6bTgCBHR+/gEcMSRYIzwKGK/OCVQicOG/t0GucdmAgDja7r/6Pz8FqsVI1uVi9Rv9@lists.infradead.org
X-Gm-Message-State: AOJu0YxBKseby2q+SI2RSxGCUYYwGnWZk25mNISnlwuhyor1kzUeK1Yc
	SbGezuTceeG1iMUfV02K3M4p4YcWsrTDGJ1AGJWTjYZpafGDnty9FbtkNUs5f9RQ3VCKUVwuJS+
	870hKDMIfChclkNwhO720jqNBX/jnTrU=
X-Google-Smtp-Source: AGHT+IH3rHX+MO0pndYIAY3BMyel2/PmtkDfaZjjQgMxYMPVkQt2SYFlCdvDRxCbn4W4GcVq5UmB1hnOFsctyFssdo0=
X-Received: by 2002:a05:690c:6f8e:b0:78e:1aa5:e970 with SMTP id
 00721157ae682-78fb3f5c183mr344105557b3.31.1767307026776; Thu, 01 Jan 2026
 14:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com> <20251219-gpio-of-match-v3-2-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-2-6b84194a02a8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:36:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLnoxse5RrX0-m3dNNa-B_h0yHCw6H24H14Dkts5XwYCDA@mail.gmail.com>
X-Gm-Features: AQt7F2oRBtplfDlu9a7oL72YgDu3OW_f7prR_jrtoZC5RVkWzk3Mu6ddY4BWlD0
Message-ID: <CAD++jLnoxse5RrX0-m3dNNa-B_h0yHCw6H24H14Dkts5XwYCDA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: creg-snps: Simplify with device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
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

On Fri, Dec 19, 2025 at 1:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

