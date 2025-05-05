Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55285C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl6spdFCta6JXs9NjzJlT+z8o2YUBT0Kre+VTf+/vXs=; b=KN4DhUSRwq98jjiOq1YJ3Sdr73
	kmmYVMoWpIRLD+uS3kfTvh0GshPv+T6aILFYiX+fEZg06ppScPoLVxJkP6gMjPo5MD62VVdZyfg1R
	0qcQV7Y0kNBdm3lpoeBwRzJfGcy8HO/EEecxHWrJsME1clfvNLI2NTfT4MQ+sYcyyjy4UrGmdX6LA
	c55CQZGOINsvVLPmxbuogo+/QdXTkcqE4G/rr1l4zGgh67CB1swffajItIiyrlZBruIz/E0EtThuM
	RRPMRpQQmEPy61utLnOpLF0l3FiBmkT10Slb8O2qYbEvYw0hMU20pM0TJhdNtOaqXR5YL2K7h7Fk2
	sMMOXIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvkb-00000007RuL-3ntR;
	Mon, 05 May 2025 13:20:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv5j-00000007M5T-3jJG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:38:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-441ab63a415so43778855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448718; x=1747053518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl6spdFCta6JXs9NjzJlT+z8o2YUBT0Kre+VTf+/vXs=;
        b=famqxPv5yX/XHUOl89qwuYn6pcnjFxLQG1Ctr9J54VwPslaWjMZQD+TUo8te+NPM9l
         m5FCSYKN2IxJSZcGEI8kr/mlJzuJkzfzv79+/JF9rwstdkAbluf5XAI8TsPAJfnBrYta
         848fxKhfSJFljlwU9StWXpjU7qhyKS1SPjpUOrELk6yU60bSO5lPtDmvYRojWWTJH1Zu
         CJUKWSn6y1O8FBtvo+Yx4FcNEZXtrWjq3dMKPC34wcaVoGMoYRfGL4iOB3qPIxcOqqv6
         86RBrEmX5ipd+zPzDCERcnm8nnLZvLumTW3KE2F7pGLsdsMli3yBJiCg2TivE90jv5jP
         YBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448718; x=1747053518;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl6spdFCta6JXs9NjzJlT+z8o2YUBT0Kre+VTf+/vXs=;
        b=SCNOD78N/IaA+//t+H7GoZ5sxt8Xdz4z5jTCVE9kQqN4GUfwcg3JX+1jdiDuuG8y/S
         7Kb4CGjROJvYTBDUjLvzfrM62f3jIRWVeXyu9SsCg3aEzLtRtIK2E6kPDlTbcjwlmWDx
         BhygKs2/ccUnJjAiDtlPcJy7w9j/ap1pLp5U61dG8pGM2cpBE7bK7SR8BpRBKpLLJ4R2
         xxjWZ4XMo1HaR5ENMHv28sbBEIV3KotgI7mqxRqOYAZgKBgMkyvgav6Ozssyq2TQoEcq
         TH//5On2FWyLyoEtNfCWkWl0TMNwYp840WUOaGrjfpAmRIGAFFyy3oTaMHL6DHqGiRlo
         kBLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuqAVkfgHvfPCBIN436Bgjv/Thqm/hbEuXC7g5tS/F5GvpC/sIY3J9EVkyHBkQ8PhMZF4XmUCr2n+5R8StTicJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yztq02sNSJllxSF4TYSKzygT4VzYRiRv8QRMTDceBLQTWxgePmX
	r2e78F1LmFDfMpZ8yUUG9accnntfA5CAoA7OOpXTIo+E0GtVZzbTDpGHqD8VJmMx5psfvUpXPu4
	N
X-Gm-Gg: ASbGncv8jy4c0ToUv4Y1WXFcJdw7UTYtbYSqigtwRY0rDEo1tyf+NSShLjjD+MI+BkL
	oLdoENaLxBb27JD+KGmX1jEIYxrHEt+3fLMp+AJfHjZ++gRQ2mXO5mqEIcDC4yGhvVBEqUWhSx6
	yv+9lkvo99F7yBLvBAJoMvmy38dKr8j4P62lI4koTsjyRlzZ3flL01abSvBnlCKd65+W6XVyH4F
	JKfVFvULLPurMl24cr4NREBMD32cGr/YB094/hajUcfrUj/cB3sfiGhrsJJdi+lnta1yUzdzzVo
	r5mowoVYLQy8cCrIIf8s1DhP04qdHNhcYmx2oX4blkH4Sgxaa8Ae3g9W3IqVww==
X-Google-Smtp-Source: AGHT+IEPB1W6TKe5pDLjaw9rUkL1i4ZzERHI8wMQEDvQTkA9//qDganu2o1wcLoboBW4dB3iaby3zw==
X-Received: by 2002:a05:6000:1869:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a09ceafb06mr6167004f8f.20.1746448717806;
        Mon, 05 May 2025 05:38:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bf6sm10416625f8f.18.2025.05.05.05.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:38:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
References: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
Subject: Re: [PATCH v5 0/3] Add support for Amlogic A4/A5 Reset
Message-Id: <174644871707.1393229.7222540687542026901.b4-ty@linaro.org>
Date: Mon, 05 May 2025 14:38:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053839_957893_14F2EA27 
X-CRM114-Status: GOOD (  13.10  )
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

On Thu, 20 Mar 2025 17:42:07 +0800, Kelvin Zhang wrote:
> Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.
> 
> Imported from f20240918074211.8067-1-zelong.dong@amlogic.com
> 
> Changes in v5:
> - Rebasing on top of the latest upstream changes.
> - Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/3] dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
      (no commit info)
[2/3] arm64: dts: amlogic: Add A4 Reset Controller
      https://git.kernel.org/amlogic/c/946b51882b84f0cbec2acd203467866a7378abac
[3/3] arm64: dts: amlogic: Add A5 Reset Controller
      https://git.kernel.org/amlogic/c/f0911f29478992f37e91c208fe44c2ea5b378b61

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


