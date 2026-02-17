Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A2EE909AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=; b=VxFuMkC4QYDPvL4BsUmV8JB/n9
	9kndUuZSTJiWAloI1Ch7d/b7nMWITsTMqxQOns4DjB9V2m5ReQ5E9Ttap2DN8OdS+BfKEUEpNfMky
	NwlO5XTrMejrqotyQsdrjTovLOplU4xKQraGz08Is+ORzCoCYA3ztlMoALFsbehZjnwzX1NWCxnhE
	AtJrqhcZNtZmOxYERIV2sAoFRdpJoM62sb8yTXbJDef05XHbKw5Qe0bERkiCfVPE8+eULzepzhdAC
	GP3ShSEKgs0+61UpIWxm0L41hcQBTLvCUhshREZ0b0xePlF3jE798bDvxAZZc3LeSqQx5lutxvSeH
	pUjVdkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMN9-00000008SZ2-4ATN;
	Tue, 17 Feb 2026 14:48:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMN5-00000008SYf-1GF0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:48:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4833115090dso38901205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771339693; x=1771944493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
        b=nQ3skE0Jt5zqDljFBE6f7KJZbJpP+EmyzB9UzY4Mvlr8DkhvcvsOQfHEIrXZXpoHlr
         Y/f2RWa8uLgEvtzQSEpgvWhE19IO2oGLyFJXFmZYL4E6LD3fqFYHE7Zu9WfS24cSwngL
         JFOI6N8+5VCdyNoG1XILzYzL6WYXNnGq1sa1kp4Kp5TUSJ49KYAPVTtpJbUdPYa6tauG
         VBgbYElGdi0/NrNyd51Y18M3NcHUITaqbWGMrnrW+AjZZtjLfpzddkQtUc3s8/FhN/QC
         Hsd54cVZcalbN42E6aTHr/gRqt5z2V57A2JkYO304O8bZiOVkcI8WHGsMcuR9ylmvoZ7
         yEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771339693; x=1771944493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XWrOUlc6WmN3rEw2oGS4C02DYkL+sibKsPW3R80wFhQ=;
        b=EcvW6XgZVCYMXHLcDC0bEdM/bG91Sqzr4zgz/sbMvorW40k0+IDiuHthwfNPeYMJZT
         8Q8qG0gQqKEtA336tdWX5Sqd5Aed1b1a39AAGzSDXm8BarJ/56rUImfjMym7Go1Qf3AJ
         92EcIqceeCj3IlMpDr3iUFkbLQ7bD8Mqvr/L2d+G2d5YC7vRvwIFl87vU0Ld/oVe1pPw
         Zy7NGW9+cd0T2cXgVnvM/4QFvyX0SteF776XKIkQh+1Cy/QgrYbSQdTXbtC6NXHdjYYK
         yVXlKfPaMDdzdSdRIgFHAWQ809KOgVtJi/B10dscHclRsessvSMv8VaIcC1P370u4FAG
         LRHg==
X-Forwarded-Encrypted: i=1; AJvYcCW7YpM62ejTs1nHA6szwEPZM3AjnYpZlih9Mq9yiTjK1r6E936meugZFoGVuhKbjwhmPTqGxZqPTwQz7C2wA5Y9@lists.infradead.org
X-Gm-Message-State: AOJu0YzflRRA6MgJIcDqxPCzS3T+8lcv13d5ltABT5JGzuBZp8vMaone
	vpa9e+/k+6lSV8LUVVKqCvDuK0s8Ky77BxEkX21w/Omfx/LXjzPaRWhu
X-Gm-Gg: AZuq6aJRy+rgLioRGT3nI4hv0scP+NzXvUnaPpInM2rfKdD84SN7o6bB0LZvRcQddAM
	CWaRLz7qhxd4QI4OXxqXKsUGK/QNyxXQp/Dc8VK2h3oPMtHToWk9kmGV0tgHEvEJOPB2bi/JcuD
	2AH6MqdyNkpPNgiGGf2puXDTgnYTl7VwJZOukO7mGzenmFx6nAM7AZfeoPO+TeVug46JqZ94K4M
	yWL1PwpTo7v3c13q2dC8gqCzvxVfZbYrqTGfpN/E30C9dK2IlPPQg1olK4/zsFU9Yk4lLq1GV/z
	/GzFo4VtxhFjw29234u5tLsztsoi3GwD5hj46EY7r3zzv03I1EtZjX2S4+pPgSgUwVSZrBP29+Z
	G2GhXp84KtpA2vgFs5NkeZkDkhVpHe3Glakwz85b1FU07Bzwgd8TZc7vW6XMGXkU9GLA+yT1RHD
	HOmVpqkNTUeK1+g/Z2naEq4uFdI2DhhwCQzHr7p3jTa+TcRa9bRjEsHyBQb8vB+CATC53X1xDkJ
	r85ig13NhSaXMlQQcw=
X-Received: by 2002:a05:600c:1e1d:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-48373a15f31mr228213415e9.1.1771339693045;
        Tue, 17 Feb 2026 06:48:13 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a4e149sm164687075e9.2.2026.02.17.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:48:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
Date: Tue, 17 Feb 2026 15:48:10 +0100
Message-ID: <6238719.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20260217093004.3239051-1-wens@kernel.org>
References: <20260217093004.3239051-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_064817_084239_430A0EEC 
X-CRM114-Status: UNSURE (   7.73  )
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

Dne torek, 17. februar 2026 ob 10:30:03 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> When the PRCM clk driver was added, somehow the r-spi module clock
> was skipped over.
>=20
> Add it so that r-spi can actually work.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



