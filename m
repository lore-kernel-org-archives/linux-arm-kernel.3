Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71816C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/8FBWOKis/5gAhZl+kumNEFhsuTOTp0Tn1yNZmhUVg=; b=IrCL7dT+7wLe+S/Vnx2GhH+lbh
	srxcYXSzJbq/lz1diWcvrzq0xTEF6cU0Fr5b+Su/oaMHi2fx9GPScGGI5B9FoEmNeoujHoAhuPzJ/
	WX/oJ8gaIeHwKUSiN6FCb1kLfA24bVRIR992qiz+onuBX0QAZFAbwtHHYWFNhuTKwQhQ5W5EDMM1P
	9LIRS8YVcpP+eOiyb0hwdR3i2jKwsA4HJP3c6/b88VMqVxeVyWtEzH4gdLW2C3EMyySQlnljVakSB
	OO82a9eTDFNoqQwsRphNobXc9pOEuzxxqwktN5cVd5exzDmibkj5MqMV7VfogNItGx7yAucLLlRs4
	pOF83Axw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fpd-00000007mhy-2np3;
	Tue, 22 Apr 2025 15:46:45 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EaJ-00000007UGQ-3OlV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:26:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3739975f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332010; x=1745936810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/8FBWOKis/5gAhZl+kumNEFhsuTOTp0Tn1yNZmhUVg=;
        b=PYkZGZPE0H5wnJGSbqgAGjWAsWTcdjXt92dBuPWRxJx0/lC71x5KZlLCMG5XrhZdBu
         NEXpNICTp5v9K4ufXE+sNqGCGMmIzk9qpw22lSZSrigjPdbaeZZq/fiDoQ3BYGKw60Ay
         YsThTjF10kkccpB7fDgbZEi5CagQLGlAd5fwD75uKxEMVkbLtdkrJBeQxCITMsRDxhsf
         OrXAi+2gbQ/WWwuGAdapouz8xezfmPC7vKIdwYCmnx3V8KBR0PhqXUkZqhKLOBlS3hYM
         kKxGZH6X9N3sGJto2ET2ME0qFVOeu5esM0wDHx5Od3nCrtpxXN5UssnqW/yVtHLGloVj
         CfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332010; x=1745936810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/8FBWOKis/5gAhZl+kumNEFhsuTOTp0Tn1yNZmhUVg=;
        b=mc9NC7WCbb5HP+fP9a5ikUBsXC7+58NjPCdzm/vj8On1/LaD2KzavLcSohwc35gESc
         Kz+RjjrHJWeE0ycsMvzO/dckuMNMSgNqpV9dgrSSw4/J68WkhjcNPwjhrAYOa0I5/xtA
         LjQDcVvIXEWa3jt1PAQXreDO/UztaCU4sL9sk8scq3Nf+2xWS6E97Ryd2jMJuLEEA/qH
         YdrvPdPvAK0X7GDWdUf9qrpuWFSpFhY8XIdE6wttlGFmQjCDqWmyBf0JCC2t27o7KEoz
         LfwNXfXiHvF2U+3EFpsiEwnE75iaEBE1sAqmZ9YxVOcMD3SMgvdMh7iaLxBFkG0czZ04
         z4YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2WxY4US8X5eubEw99CE1eymDM5mQ9ndmXBQWbxDWP8fSjwRVIRn72EZ180dE9L4yDCTGqPQS6HgQEpihfkXQK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5EW+GU1C2MqN7gzcGZmsF3H/e/nYMTQy1GJK2Lqq70/YcklBq
	DHp43Dq8IMZuYWyO0h7PMfvAlX+pmYsxgtYOLWML6PRAri6YP2gU/Mvi8dNVkck=
X-Gm-Gg: ASbGncsYNnQ2O6s9wJQ8XMr5eVdD0AmKqqKRTi2aPhr4IynDhfhwYn0IcAs4hdpDq3J
	ibeyn2vNT+YEZpTEVmW3Z8xfzjI0iqVCoWtKuVJ7UUOfnSBG1UR3sPQWcej/yEdxNjBOu7iivQr
	a4p1BL/JnwWD94iWttPbiBRDyDoDkfUq/1RbWTsMYxyiteo5CIdCt/aJ11GDzi9SyoxAL1gFE14
	zK292HoC5YnQjtcJIYtJa/BEJjo+N02IQ4sdVvgdRRxxzK3GxD6uJIhMwAXbedo6M7CGzRyvKu5
	lHetsm4dGiPhlHmbfKionWFaQWYsY8Nmx4xSmJgCmclEeuAZtAhCUFxIF+tgmg==
X-Google-Smtp-Source: AGHT+IErweWrqcRE3OUYv1Tr/uF6zeqr9g8jYjpvjE6dgePIWhMhbjuHUYd714wO1Cy0fgJwbMEbXQ==
X-Received: by 2002:a05:6000:4308:b0:39f:f5f:5373 with SMTP id ffacd0b85a97d-39f0f5f53c0mr3774129f8f.57.1745332010416;
        Tue, 22 Apr 2025 07:26:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207dbsm15318011f8f.4.2025.04.22.07.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:26:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
Subject: Re: (subset) [PATCH 0/7] Baisc devicetree support for Amlogic S6
 S7 and S7D
Message-Id: <174533200972.67056.15609256008080950446.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 16:26:49 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072651_863000_D2114FD1 
X-CRM114-Status: GOOD (  11.96  )
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

On Mon, 17 Mar 2025 15:16:51 +0800, Xianwei Zhao wrote:
> Amlogic S6 S7 and S7D are application processors designed for
> hybrid OTT/IP Set Top Box and high-end media box applications.
> 
> Add the new S6 SoC/board device tree bindings.
> Add the new S7 SoC/board device tree bindings.
> Add the new S7D SoC/board device tree bindings.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/7] dt-bindings: arm: amlogic: add S6 support
      https://git.kernel.org/amlogic/c/93d968adbba3d30c625149d7aa12369a42b89d3e
[2/7] dt-bindings: arm: amlogic: add S7 support
      https://git.kernel.org/amlogic/c/5c9871f98b187747a873dad2773493f2117b5203
[3/7] dt-bindings: arm: amlogic: add S7D support
      https://git.kernel.org/amlogic/c/c0c89503f6b722d9eb450ce1cfe52f785be07cfd
[5/7] arm64: dts: add support for S6 based Amlogic BL209
      https://git.kernel.org/amlogic/c/5fdecaafa2377731b84c9f3af5994d990224015e
[6/7] arm64: dts: add support for S7 based Amlogic BP201
      https://git.kernel.org/amlogic/c/1b753fcfcff8ad1a63512b5be01cc6f3968a859b
[7/7] arm64: dts: add support for S7D based Amlogic BM202
      https://git.kernel.org/amlogic/c/1a30661c20dee51675a1ddee1b81b6a0e8580412

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


