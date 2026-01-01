Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFCBFA3722
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=; b=uLLTpzXrbnYcWaGqlQZu55tf+C
	zTUQ+4ZRnnslkGuGKmiibRkfFAZAGkQU6D56Q/l4i+pJETO+dMnd3/9+Jj6izEp3COCDMVrk21c0g
	tAX/4Nl6Usm7JB4qvdw1wFGl/G+dWNqLsmhRMinXvtYlR3JcGJ8xtMn/qWs4kHd2zR3KEme7W2nor
	JK+YILsGt7PLRy6kNDg9GIoyEOqcUpezfz/yYsd3e7eoQ3Bv6wnHsWB/LrX+xqBYYRwj2rkEjfhPv
	x0HBdrwe2N/e0chsVs2aMb9fKDnRTFIFe6039Rfi5h3dUvoie6WHMoI+6K91sr9SKvrW+1JtqCIqT
	S0eYzI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRHt-00000007bjB-2hBo;
	Thu, 01 Jan 2026 22:36:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRHp-00000007biU-26Ad
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A16143A34
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A60C19422
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307013;
	bh=zFPbOYoiGK2YHEkPa6hnUfO45Q+tjDmbpv/dwRaLQsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D6knG1BuD6qEHVAwPQ2DKg9tTyDVtorlevdSLRckmOa5iIdxKiJii051JNf8yAACg
	 GVr/obGJuSkR/0A0kPrv3oSUVXN/kLfADsbKky+M+TRE4vARsxUK/Eaxl9ob2LKcoJ
	 Hkawuibs9rcWXGzgoBDF2J/+HtC8kzKH+jKB3t37OYIIFOFZkEDhwLm3Wyc/4gwQCw
	 IV6Zx7+Y4dgH5BTebhaj0+Z0bEb2xwXgjRu2FhQICRyhumbmY8L5eLc5ya3MfDVjIX
	 ztWN+sx7EtKFZQzoGdk6w/vppML0zDAeS2H5iBWq/sbTKDcdUSbEmulGoPs+9gYkhw
	 5hmJkSUkwFcIw==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6447743ce90so10678358d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 14:36:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViFFP8LlwjSAA1z8S3WBWzanUKHY+a8JPv3kYQHR6yjwgsiFRXVMl224Aew9jrPUmc9wGrvepbrjOKsOzavaeu@lists.infradead.org
X-Gm-Message-State: AOJu0YxCT/i7rfqHxogttxm62xOkb4D+DQUjLiVyfX4U0c/KpvhK4U+/
	k9w8ZOcZdnyXf3A/+BW89brLTfaJKkY8vM+jrPlxCce3slT5qVBVMb+3zeESyWprPhLTzXNgZBh
	fNsC2QtP5vGE+PEIGjiTttP5jqVXm11s=
X-Google-Smtp-Source: AGHT+IEO5LwtEScYPWNW+HTmyiMl4lA6z8T55VrgRQjoU6dIngv+B6BdPNzDk5TNK4hhdSKTxLiw6rjQ1I7m1uaT2oY=
X-Received: by 2002:a05:690e:4190:b0:644:7a37:e8bf with SMTP id
 956f58d0204a3-6466a8a5cc8mr30736205d50.55.1767307012376; Thu, 01 Jan 2026
 14:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com> <20251219-gpio-of-match-v3-1-6b84194a02a8@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v3-1-6b84194a02a8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:36:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLmhxts7jPoTZabzCUCxjjxqSqgh488UrQk5CgeGC1T1nw@mail.gmail.com>
X-Gm-Features: AQt7F2pUbvBtP6_wDtOSoTk6qQP2DBSKO-EAbAzEKgRoIHXV2ayoPr7YsCnPilE
Message-ID: <CAD++jLmhxts7jPoTZabzCUCxjjxqSqgh488UrQk5CgeGC1T1nw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: aspeed: Simplify with device_get_match_data()
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_143655_291689_86C562D7 
X-CRM114-Status: UNSURE (   9.16  )
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

