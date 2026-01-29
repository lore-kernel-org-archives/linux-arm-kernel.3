Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADBBD6101A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgmtN7g00lwkN8JUHcOpWKDzOGBTid2ChoeKvuJnR2k=; b=RubFKnYiAPuDQDKQ4+gi3FYXs9
	HY+HK3DjQtCOVU8ZeRYwMZU/2vWHKetOasSL8fyxlJT0uwCK/aalwvBlOU0rcJZ3RCO/sAKtg/USX
	BqnTtuCODGg8VuTCpoENB4EmtIwsTlCLxAn9KlIDEhsIT+afmRgt2dfc6VagrMjpgK5Lz5hH3Lnll
	Su1tw4Xk4pwCM71Q1q56k5oO9u3HBLbGQ+UYtOqY2k53dCByLG+IK4e1O/8K4VCKENrqN5uXiG4TB
	Fc+raO1xQYwaRJE6hFoCITzZ1/Aw+10UhBLks9gJCsLUVanoxoWHzovVvUVfZwxGC7b+/DzysmFVg
	hBAuYRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTlM-00000000GMM-0xcf;
	Thu, 29 Jan 2026 15:16:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlTlK-00000000GMF-34qf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A3556001A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 15:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430A9C19425
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 15:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769699809;
	bh=O1tloW8gfVEMEcBPVggd9EMmWqLpPlFRfEzQCkil1HA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kiS3Pm5IueYJq5TmZqGrS7X7C+cWyG1KdjBU9oiug7eGGcyzr2O934EguWjN3FDjz
	 gat2aSyrK4fKp5K+S6alGJQvo4aL5TDXGkyr1lEbH+drcNwr3BcQLLDTaNNvLcf0Xi
	 Xww/zptlAVq99/UpW7eL3bzwdZjWV+ansPM7JM9JvgnyVm3cmmydMgusNtXysqT+t5
	 i6bfvNdLW5qgYE0+CTzveGSBq6R2JV+1s8L8e1CvVBVR6xtcoFOP/+ee1u8/s4xTaU
	 DCPzLxwKeW7M0TJja1ZFpyoUC/GEnxOwm9VoOjHuipk19xaZAmreQTZDvMVfbO7DbG
	 FOXOUIoDAUB9w==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so1615935a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 07:16:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXaizc6uEaKmiMrlXFToGZo1xTM1N75xuJ3omYY4LLHU4drF5kb8HewGBqANMNr/W0N+tDNCpAE5OjmCw+VGY0E@lists.infradead.org
X-Gm-Message-State: AOJu0YzCZnTK2VZ3FDuUkjx2SWjWRAnl+zumr9YvRjXxHprUxCmROdfg
	m3Hcqakh+HHJee9Ek/Gg/IL6g0M/QXaC6/lKCbgm+FLJBpqG7Wf6yy1GVy/IMEfmuNvt0+lIjZw
	UyBJNCPUiBI4h4DDe+qHzO4LP3nJ2cg==
X-Received: by 2002:a17:907:940a:b0:b87:65c5:603a with SMTP id
 a640c23a62f3a-b8dab423ef5mr644045466b.39.1769699807795; Thu, 29 Jan 2026
 07:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 29 Jan 2026 09:16:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
X-Gm-Features: AZwV_QgoP-01T8gPVg_GjRssieKZeDUA4_1M3p-JswAzI-a2M9jAVmrm9uPisdk
Message-ID: <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
Subject: Re: [PATCH RFC 05/16] ARM: dts: aspeed: Remove unspecified LPC host
 controller node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-iio@vger.kernel.org
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

On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> For the AST2500 the node was used for pinctrl purposes, and while the
> hardware capability is also present in the AST2400 and AST2600, the
> their pinctrl no relationship to it. Further, there's no corresponding
> binding, remove the node for now to
> eliminate the warnings.

Odd line break.

>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 5 -----
>  arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 6 ------
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 5 -----
>  3 files changed, 16 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

