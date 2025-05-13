Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E86FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=; b=WqNnb424kyj54pF2oFFXXdPENq
	VvbZHR2q3xGW0Ugs1PguVChBDYX98T+H3Zyqd1lGksrL8Qi8+3nACw+Kxyi0hGVLZwSt6WsQRHd76
	ofZkrkG3argwghqG382837OjRuY5l61khbZU30BsGcvctvPN4LEY0LLnM42/RLyi9aVtnLXOubRXC
	YMjDLhAPvHBwAtHxeBTGvvXeWvUH9y2LckrlplELkORnCoHj4PlDemwgxM81WVGVB8a+VrPskRz9y
	Mtd7l761r5nfnjFpphLnMknKE40xQM8cA4l/Qy54mmyPfUU0JqmZ3F2Ns4wQ83Q7YVnyPkbXh2siY
	VS8bttDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpUF-0000000CSij-2CYE;
	Tue, 13 May 2025 13:15:59 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEpS9-0000000CSPr-1VA8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:13:50 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54b1095625dso6688719e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142027; x=1747746827; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
        b=uy3hdfpxdWK9V44y/a6XAxamBU4bw5/4gqLX9EOgMJiZc6N40a5KXKBXLEJA1MlB6q
         wYtIXVx71IuA9GKgBAEcthRMMy5MDjFpD4+5p70rYJjQUf7U1TkYmlvBDeBT7hu+VsS5
         cEHuwf19uUrt7jM9Mp3pYq44RnenAtPkX3Rd+qEJ+K7XO+4EMsVtQoJVPoziECdZNNj8
         zwD8kg+UO6iBKYz6ulQi0WQqzFhR77NLNR5s7kZTv0k/6xkqNKZ+ovmA+QULTpoo41dZ
         PtlXZQ+Jh3UTctBf4XT1QMD8lAD5DCm7xBr7UYPvZ3HLAclvCCM9BAVpfr15TLx86TRE
         YEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142027; x=1747746827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FH3BY6eCD7Lez7c7QuOQpeui3zGud0bNV62j7nTi9Ak=;
        b=b+3lh1HdSH5ja5K5SlRPkzE3gUI9S5xV2RFJ23Zqz+PgVYcJHjqMls5ANjb1wVVNe0
         1VqB2qHVW3+3m/0FtX9uJHyD14uzqinozHPXdOoDYvCLcJNHfKcRFqzkUzKiSeOXrfp3
         /VG4Wne+P09sHcxuLsQ1db9jOOZokWS0w7hOgm8CEMdz+D2EUPRKPLCisXQeMR3uhoaM
         u2vBwLet8cQZvQLQwEFq3Oc996bCeafXL2IQ+cU/Gxq/IC/jOhPZGgozzYQNSFeznGAG
         qJ3Mf0Vi0pDcWUpWRMIA69rIMbUool6BIucYzb9bpXYbuIjiM8H1Dcm4vIudn05AfCnT
         tWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM1se42rNWH05hFuA9rGMub+4bmAzdY1Sd8+UyG0T7+k/8HoPESgYlwu868p1T5HBiyiwZuQ4G8BFvhHyFljbX@lists.infradead.org
X-Gm-Message-State: AOJu0YxsPAXnDk24HollzMYcLKwoEw+xRr+0rY+NGlw1dLW7Ni1IGA9Z
	Lul0RYHb0+mu7uYuLXBeF4NSrvdwjSYC/HvLcQd1X/2GKvYbziGPef+JMHCxrQ2pr84HbmRqSFH
	4eIEALvq22QTi3Gh3FTG3ApzTp2B+iTPjkpJHoA==
X-Gm-Gg: ASbGncvYIZSP0rf+f1G91F6g3pxFrhPQoX5iI0PsbgfGjiMnIC+vorYSjGj+3ffNXxn
	kZgjhEpTKb1vi9NTq4QeJTq+R0Jaz2FC0FiXtHT6gG2xEWzGjq11xwoSR9Prs9XFFexSdBQ8DHi
	z5tlVUY0X1GBT/I27A6nWvW6yxXt3s80Y7
X-Google-Smtp-Source: AGHT+IErd1zECtSWmiueqkwD4t5q1dDN1qHnbcMn1cncmM9gOi/5w9TSouYOqYoqxFwgSSQ9wh2aWvhxApgZaMeuOic=
X-Received: by 2002:a05:6512:640b:b0:549:8b24:989d with SMTP id
 2adb3069b0e04-54fc6764426mr5389978e87.0.1747142027286; Tue, 13 May 2025
 06:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:13:36 +0200
X-Gm-Features: AX0GCFtipyG-m8FrUnzYpmqYR7dxFkSgGJS5zK3dL1i48JJGkPJ7bD5UcE0Rkes
Message-ID: <CACRpkdaDiJDoyW18cAsb1JcJvFvrweWKtUbO0=pUtGKbz1GtCw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_061349_410354_CE78CAB8 
X-CRM114-Status: GOOD (  11.97  )
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

On Fri, May 9, 2025 at 6:47=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I agree with Andy, why not just apply this, these drivers have
had long time to adopt to immutable GPIO chip and your
patches are generously helping them to migrate. If things
break for these users they can fix it in the rc:s, and if there
are no users testing these, well that's a community problem.

But there can be some fallout, so it's your pick!

Yours,
Linus Walleij

