Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718FEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=; b=cLCrrk1y+Pyzr2E5v0BIfeLq7b
	U4/6PWa7TeWN/eIKlV6PKPD9mvOmC/WFcBOg54ZqihfmnNq1lP3Tiq4bM8RDN/pfInvgcR5jwqJ9g
	XUzjoQqHktFT+7hs1T62jyvuNijGQl7AIqJ/E01jq6Um1gIs+YstX85ZaS/MFjErgLob+7aa8klhQ
	qomaNBCgKE4nqc0aT3emlb+LBRWZmMJZUpTUvAwpDNRJox1wERv/fu6iwiVzREJkcwsQ0nJhF0T4O
	33cll6xaaLgrKYxjenejBkGvaynHpjftNM1lE8co/v9ONFyFFRYQEGmVgaKcq830/G7CM/B2WA+ED
	EebbTkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgCs-00000008QOM-3BJF;
	Tue, 14 Jan 2025 12:39:42 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgBd-00000008Q9K-1iN5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 12:38:26 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54263b52b5aso5498924e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 04:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736858304; x=1737463104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=;
        b=klJ4DMb+lKfv3XNb88QeP7WDbCr2A3U3GF9bGsrIUXafF25PSAoXQ/qf/MtrRk0VLj
         YR29qnSVkbddJAAf1G5kK6AAQUbie/WFjOrVFQx+YuOIIohBzkNUP4VLPgPzXt47Sos1
         GVdEfXzojUo/caIBcKXDUyH+e+S4Awvfqlpzj0bnY5xcalM//OWnosA68whgZrny9j/8
         4HqNdfuWCiadsTHC0S0qJYPDgg+K5i9mF/qBDGtX5GezLC0rupvNLkO7uByTQATk5pcQ
         ZgQatPmk1ftngcomuTyJwUj7nLQlN3aHsm0PmtmJZEKk+EZ8Y8qHtwTSpCFkiYRd7pfl
         DaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858304; x=1737463104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOy+fpUcZjo3NQOA4lzsuRXkHenykO5B1X4kehGjluI=;
        b=voAnBFvetgQ7FyNG4dnMs6oLiC/bTbzWG0f9W/iutFi31/dzrOedN/Uk3b/gVeb7Kv
         XkcKdHFsXcSMfrdsDRhYfTI3V7vs3fB/ioCJLLax6vgO4w285K8gaUI/YD+PBbmpBWIt
         qQwXpzD6+dhkf8D6hx+T3xYkgZWUcJ0GPcxwncb7XKszrkoCzcSi6JCMqF+S8NtEwOKF
         qrc9FIqLyoYCuZpLajkkwG3I2bZdpM87542xKQyggr1S+fZy4hsEj5i+1czKeskU7D5A
         Uvs2h181ir5V3a8b/elFJNx8qJkzn/NMTmMrT4mi6u0T5nNAUZgCCQEV4PwiM+C+t/2J
         1j7w==
X-Forwarded-Encrypted: i=1; AJvYcCVjz4xa51/HC7VEqN90wr8X1SWNUUBWYD1rLuuDfq9zLUeVhtTKvyQouLdav7VVjKFkNTKcU3TsJ47TBXpzbAot@lists.infradead.org
X-Gm-Message-State: AOJu0YxH4e3p9R6BuzaPnns0uAzOuv8/KVkDBiRsWtzXPwbG3TpK30pi
	gZQFyIMIK0ggMVOCIniSCI+6JybWBibyrOhrAVQv+T0gfxqqdgFp9au+zFFkEWxVLv1KsHdXr+L
	9F72pjorf3KYmQKzu8OJPfci2T1m7a2BNhiso8A==
X-Gm-Gg: ASbGncvXtF0208wbk8xfpMeYpcYSG0hhc3aRiyaLJrAVKOqgj1SWt5PVouBCRcN5KBW
	EgKRKRrcaBYzi9M4ev1GhMEerOaDsLh1McIeS
X-Google-Smtp-Source: AGHT+IGcvU/U3n3KiVK8Pas9Rl6/CCuxSKRYPHEejh00b9yg8f2JKHdOjjfDGEy+haFbClEH/nX0/RcLgiFJCruBWNo=
X-Received: by 2002:a05:6512:b03:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-542845ba92amr8849466e87.16.1736858303656; Tue, 14 Jan 2025
 04:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20250106220659.2640365-1-zmw12306@gmail.com>
In-Reply-To: <20250106220659.2640365-1-zmw12306@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:38:12 +0100
X-Gm-Features: AbW1kvbmhkHMhFNltkPbxNdF01Aj3zGBI5__ealYxb0W8ke6YgJlZ3LsL-hjuu4
Message-ID: <CACRpkdYG6EO2x60Hj2tN3ucOQsA1c_x2hh5gd4frr=D5V=Lbgg@mail.gmail.com>
Subject: Re: [PATCH v10] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, marex@denx.de, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com, 
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_043825_447337_5E1361CC 
X-CRM114-Status: GOOD (  10.00  )
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

On Mon, Jan 6, 2025 at 11:04=E2=80=AFPM Mingwei Zheng <zmw12306@gmail.com> =
wrote:

> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
>
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled wh=
en LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

Patch applied!

Lots of iterations but the end result looks really good.

Yours,
Linus Walleij

