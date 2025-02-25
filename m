Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDF2C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hQ9PSnky3hzUHJ3r5I6w65ox232hzZUXn+oYcw3lsM=; b=YeHLP1AqaB37dFoRUfbGAcmzZ4
	TpGFSU1MZFogg4xmb2J3y/9VEihH0X9XrVa4en6hLMBnUOuiy9d2j3iInyo4rVPh242d30eaq7v86
	Wsr8z95QG2I5myqZSkqANEuMRHR5nvEiX5Mm8ZZyvEHNSSu5I2Ruw1bb300GlmiMX7+32ai11BGwd
	B7Twojt1Ncz1KuMCpw6hliA0mIW6wEidrC9a5mszDVlFHXhBQkot0q2B6B54TsUC0lTL1vgi6ve7n
	f48/i7ZHKhOvg9DTBAcx6huTNH636lI7JVKmaMrGskz/rQ2I4mO4ko1oM8AeZywTjXtBdtJ5py+K3
	Lf2zhseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmuZk-0000000HI4s-2QW4;
	Tue, 25 Feb 2025 13:02:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmu6c-0000000HDeB-16OK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 12:32:11 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fe77285e12so316695a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 04:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740486729; x=1741091529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hQ9PSnky3hzUHJ3r5I6w65ox232hzZUXn+oYcw3lsM=;
        b=ZkJkTmc30k1LYj3BvbBGN5W4Q2bsFK7nrUSZ6ObenL/pM3DtXwyNVOoN32hWfEA72h
         lxmK1Hs17dXM0SddD1CYwjVsHQdA8FlcLPE6XRY3KPoifFv4zJLT97T2m5QJmGs6mCuM
         TkSUhfnkxv5Wvtxbi5KbKsSbmIHbapXnUkJEMr3eYkqfSrU8rASE1SBwbJG9sEXiRb6v
         y/qX+rEDa+ni5W481y6oE7/6JOVCx7JgJ1ssiNlmdvr02P1AcsP0ftRmHwpxsHNqXgjN
         GwfSZ2hF+QtObAc/a7scFvMBPvZUJQq8bJ9lzhtEGsHGJrkfzkHTvLw9NlwecHGqKeBt
         5FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740486729; x=1741091529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hQ9PSnky3hzUHJ3r5I6w65ox232hzZUXn+oYcw3lsM=;
        b=PdQJHw/cXNZfN87MUWIxEEyJe3exCnqw6HcccaKGtXpnZ2ZXuV7lmt+ZMy/W3WSS22
         5leRwu+OqCfQFnffZPU6YOc5Yn7itUgzLSZNKrF9zMK25IKxzrcx7YwKiiR6HKLMaYtC
         W+o4rl9got1ionR7Qrl+NnPkOu0bYdUfh8hLiWkeiNwDgzQx22keTTumQAk6b7+Q1K8+
         X3gKdl0uTyEjFlPJCZQb2tqhJXOsFY72mTd/EcNUrjPwsOSDt92iSLV7g/Mx9m9krRe+
         9hUQixh0QOmSEVuko5TrhRL0ElC7TZHB5DBlFG4ItnvLDfVq9oq6d/6KUyYqEHKGGsm8
         6rAA==
X-Forwarded-Encrypted: i=1; AJvYcCVHND+PyeLzpcn/v7ZvBKgWAbO4fJ+xiyE6+yXzOWfvocRc4AP1jv6Mo4NQi6uNSjWwMj2a3eJuRoj5ugOjkoMK@lists.infradead.org
X-Gm-Message-State: AOJu0YzI2fCaXpBeMoVM4h14AIyueEdw0/DquIiadDxHAfES0HC0+TLS
	B8qiUA/wBk0VIx0wdwUJbh48kMDnvhIiTwBs8w4PqFrulUehwWWFVfAhhX8I20EqHmuTd5Pufpa
	JQK7BlH4sMjjXxQoeSLzrdQGdQjkBLQ==
X-Gm-Gg: ASbGncvmNOLfWOskZ/SauLZ6quBCxOIvMiWz4io1aKd9Vsm2LzmEKDwxdVGxH8rhjeM
	JK8Xoh1zzwvRp0EmsFOnElwGXCUTmuuBgfnqhqp4q3WXzcWdxHLzE5eRAJ0T8UoFnU0DmPlRoNb
	ysSRQo
X-Google-Smtp-Source: AGHT+IEhj54F35PZEsJYYrzaWJyBanI+coj2uAU8OTJp3NVm093Jk0fuCJf+AJB+0L8a6Juozj6iHZgPqCZQO9GBPqA=
X-Received: by 2002:a17:90b:2751:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-2fe68a312b8mr6037629a91.0.1740486729075; Tue, 25 Feb 2025
 04:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20250225120707.2658709-1-m.felsch@pengutronix.de>
In-Reply-To: <20250225120707.2658709-1-m.felsch@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 25 Feb 2025 14:33:45 +0200
X-Gm-Features: AWEUYZlyvb2cM0-5vtqGVculafUAJm4OWsTkAKrC0Tw7wQoPYmnk7k-oBG7QuOM
Message-ID: <CAEnQRZAoPxFN1ce0MEY34KpJO=SS4n33ehABH4auxWTDq8_R8g@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: imx8mn: fix micfil dmas settings
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: "robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, Sascha Hauer" <s.hauer@pengutronix.de>, kernel@pengutronix.de, aford173@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_043210_298677_6C0B6F5C 
X-CRM114-Status: GOOD (  12.80  )
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

On Tue, Feb 25, 2025 at 2:12=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> The third dma cell is used for priority information not to encode
> something else. The NXP downstream kernel use the third cell to encode
> more information:
>
>  - Bit31: sw_done feature enable/disable
>  - Bit15~Bit8: selector
>  - Bit7~Bit0: priority level
>
> but this was never mainlined. Therefore drop the further information and
> just specify the priority which is 0.
>
> FTR: The sw_done feature was mainlined without making use of the
> devicetree.
>
> Fixes: cca69ef6eba5 ("arm64: dts: imx8mn: Add support for micfil")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

For all series:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Marco I couldn't find the cover letter for this series so I add my R-b tag =
here.

