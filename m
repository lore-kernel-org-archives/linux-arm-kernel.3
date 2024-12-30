Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3108E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg3rOrpJ/V4ITpzMYa7ur6drZTaKRgCmtn4RTKqUP6U=; b=VmELoBxRqolyKq5bJwTTni4Wj6
	6gkZsLnWWUC80xP9nsqKUE9BKzPLJGfk9nsGxUUjcIXAfVZE9rsdr0QQKXWEa3nUqFGzYn+ognAv2
	1mL+s//oFHEijOZidmX9tvRGSodKGa0RWnCaeWFSx0h+e5kYfItYlyuhacpnP7jr5YlZ4wLO9erCP
	fbnC5O5d1ptIJvHCHLPfQoPdvjuwAUZAO3BjxSw/Qt13j8/0Eszi4qDJp+v1k9z0kXqEwjUUkIClp
	0G4w6AxmK9bmywWnoOjr68aPwf75m3SS5oFYZBFYVmOW+RpYwTws3DJx0tY6Q+vObaJ1I5PDTvhh4
	WTOgkWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCZS-00000004zXB-2qz0;
	Mon, 30 Dec 2024 10:00:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCYE-00000004zLh-3YwB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:59:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43622267b2eso95807375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735552745; x=1736157545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wg3rOrpJ/V4ITpzMYa7ur6drZTaKRgCmtn4RTKqUP6U=;
        b=RA95xLOUH8BiWJ6dKqNKd7nJP970DgDAiOS4NS6OFPAUWjIhEGfRmKCo8WGj7AuU31
         lHs1m8IBFMksJ6YMfiVA+6Ku+RzcWMy6sX6l4Cp6tTSAhVAvEX7KzItSXKmuop1dwb/Z
         w6a53M5Skpcba6GKtrGyYeQ5LeiMgNpKeoxbmQG/PVONmh7ohvKbDLxCOjHHs98WBMzx
         b7pqxiw+GqUIUbuZk5vdURrLUuF4XFILDUiChfSFcxUsjMTukS0jd0RxXNNb456RNklK
         lg1DlRW5UO1/XLxuc69+C7QOVwnT2xhzY+1102ladIvq4nYH02AtTUEKllsBc+fXGxfO
         AblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735552745; x=1736157545;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wg3rOrpJ/V4ITpzMYa7ur6drZTaKRgCmtn4RTKqUP6U=;
        b=dfaN/irxhJqwR4piszRfyid9V+mfgpKrzF89Tw/S/YkLA9s5+JtsN17N6oXBElUEJP
         7NB2povXmh+Esui+ygu8eDRYAxUcfQVkojtbsFHtBhqJjnhkJv6MQe9hIUIwMD7d6VZR
         75Q5tTu0cIpTTaYJDD2r0X5zm3JpOcrjE9yKGLffKqMnVCu4OAy3oLazXS2jy/da3/Zm
         RqRm3Xj5YLqVNsaHeyAa0C7Fuz/YEuAd/zDZMZKWWlJWxduWH8+zP4dXeqMuHj6N9fYP
         QktWRUWwUyi4YQuS2piNzUYDGSkDfG8dBe9yCxvWcTCwckThwGOUP3KRymquZYm7fGLr
         Nctg==
X-Gm-Message-State: AOJu0Yz0kk4+DqJ55EmOaWsmZIJSzkmPHTTEjk3ClT+GVrX3xOj2r2Uu
	sQ/yPwIsnW2z0qjccpZzaacYxvu/pv0obkDKTK8XhzVRJV+bsLmhQ4aEHVG+KqM=
X-Gm-Gg: ASbGnctgIUH7CdDy6Gp5mkJ79HPHkxEPUvutMFx8jAsoefRD3OEeBG6gp2aq3bGH+Vy
	WMsbWO3Q+zBHHGLrzZAO/qL+agxKbIIpb+B6FSjcSXU5rDdS4kBmy4pK9jUvJgv1V60X+5fkouH
	OrZFmNzrIOyygd5tcvlH2BkLq6ICo215t7oXz3AMZ6KDPHSmPopxfOOKh9t96/1zywknTHu7yW8
	E6hLopmYXoj2rS6o3nIHWubr6BRfBgX3SDKGvIJvvsKcgfxLx/9s7TWsvZcMdWwHTfap2ECqm3T
	gQ==
X-Google-Smtp-Source: AGHT+IHr0EeJk2baaepc6dGYNclRyZGkhsRUfmQUaioxZkb4SLPwgkjT+Y6PbldALk9VG7k/0s1IDg==
X-Received: by 2002:a05:600c:294c:b0:436:51bb:7a53 with SMTP id 5b1f17b1804b1-43668643ba9mr312560605e9.12.1735552745215;
        Mon, 30 Dec 2024 01:59:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832c45sm29382108f8f.32.2024.12.30.01.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:59:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, jbrunet@baylibre.com
In-Reply-To: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
References: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
Subject: Re: (subset) [PATCH 0/5] dts: amlogic: switch to the new PWM
 controller binding
Message-Id: <173555274448.2075376.17109271239824246199.b4-ty@linaro.org>
Date: Mon, 30 Dec 2024 10:59:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_015906_895959_55A8E801 
X-CRM114-Status: GOOD (  14.10  )
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

Hi,

On Fri, 27 Dec 2024 22:25:09 +0100, Martin Blumenstingl wrote:
> This series switches all Amlogic SoCs to use the new PWM controller
> binding. The main benefits of the new binding are:
> - the pwm controller driver now picks the best possible clock to
>   achieve the most accurate pwm output
> - board.dts don't have to know about the pwm clock inputs anymore (as
>   the driver picks the best one automatically)
> - new SoCs only need a new compatible string but no pwm-meson driver
>   changes, assuming only the clock inputs differ from older IP
>   revisions
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm-dt)

[1/5] ARM: dts: amlogic: meson8: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/d352e8fc91526bdbb70468e8dea13581b905891f
[2/5] ARM: dts: amlogic: meson8b: switch to the new PWM controller binding
      https://git.kernel.org/amlogic/c/39786592bfdd92b64a68283fa896e108ca9822de

These changes has been applied on the intermediate git tree [1].

The v6.15/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


