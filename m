Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69564EEEC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=; b=oP8/U/0GE1oLJ/vFgwIa4y/x0X
	hiILlKaUAmy3FDh42rNUzVLu/EDgWZhoetgSw5l2OHIb8tHTnCM8fo4cFmMtMGpc6HT/kC5RF/cWs
	TXmG/maZVmwkqYsnAumCe8N/kZaq9QoN+24jwxA6aMdq5hjxwDUGzwGXOgKFYyzpECmnrIIb6r5g3
	UQB7NMH3oEedD68IqT3HCnR0N9fo7cUyzMfJTorV6q6hDNDsIe7FGuQf66sWOrTO2/rBOzvHX7q4+
	cnaYKvpr0q8Z+ihB3P8wgCkQj7QsWc1+vkk//h1wAuoX1C32qH9w4ChzVV7cece6RkO4R0F4VLZ7x
	E+KvVwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRGX-00000007bYo-2B5k;
	Thu, 01 Jan 2026 22:35:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRGR-00000007bYc-3r3b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:35:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BB0860017
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A76C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306927;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TamhxSSLWIOQnVFBB+j1xRP5/0Fc2qml/H9hmn/sRwxOUNMOPZaCOqCscVhB+1UYy
	 TMg0pZ+LKEaH0bFuNBbtzv7tTReSpQlHlrNKLEzWH4THopRGFpKJFlcmQnbW6+BOPv
	 duJoNVJSJsnaKfyD62ZZzg9biYWkXjYLrsoxCWk9AdrG4ZLO+YrO+yitM/GTx0Lv9Q
	 ctW3z6Jss0MV5cRnpcYNa2FWaSRTOoh8TECiSyT1Z9sEDvccbPAX3MEksTrxoyUo6X
	 e0YmE/TdtuLVpv+pLnP9lglEnZt0MlvTtc+Iy3KkO37NMKXzbmDGN8mHbdfQIVImCL
	 dFi7Dt8Nf15xw==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6446c1a7a1cso9490171d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 14:35:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWL5/6NYWP+/GknMDeFsuNsW5p2DRjWEy11u9A3kPX8vszEL5FISjO4meqJsRNBEpEYXxB04GCgnDhLI6+Ol/zX@lists.infradead.org
X-Gm-Message-State: AOJu0YzJCjPEBjIT+vlnbpKI9CQT6RXhzE+Rb97Ezuk+IvaWEgGbexus
	/RbrNGD4YiWQuvFDx+aEg0LbTIJXeoxzb/cWSfsufUsf311NQMYj1ZCyMH2F+dQi21kscevJvxH
	3tV/+f0Q8PfE+YwFscOmhj7ALUb2fWng=
X-Google-Smtp-Source: AGHT+IEeYsqPV6C7f4vJ/O868DjdRj8egVDw87qil6wCyQBZLNxaoQ2yxDSsZp3aYoWeqUg+edGFSQ92tz57Fm1YugI=
X-Received: by 2002:a05:690e:13c8:b0:645:53d0:2d20 with SMTP id
 956f58d0204a3-6466a8bfd42mr31278495d50.62.1767306926398; Thu, 01 Jan 2026
 14:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com> <20251219-gpio-of-match-v2-1-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-1-5c65cbb513ac@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:35:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLn_aED4koAz-4+v-=e1DK2uZwBvLXAEC_g+PYTD1qk28Q@mail.gmail.com>
X-Gm-Features: AQt7F2rtDNyDLbQCzYXEsAv_emsxTb9NcgwKtFoou1KzZzvhme1jN_YZGGSmW2U
Message-ID: <CAD++jLn_aED4koAz-4+v-=e1DK2uZwBvLXAEC_g+PYTD1qk28Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: aspeed: Simplify with of_device_get_match_data()
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

On Fri, Dec 19, 2025 at 11:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

