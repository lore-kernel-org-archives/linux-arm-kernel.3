Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211A0D29FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvNQSaYKyUim5tFkK4HAPN4WA2RLqZuiV376Fz2XMpk=; b=UmdlcyrD0bKBB4WKg4gd9C6Onm
	MjiGzvbyX0kNMQ/IWLxHBNXmsUVrNjsNFazSujXd3ShpbmrUg3Gn/2lpIeNl7DOjtblOype25tQ5w
	/JZmPcBCa/D49mVturc+C161Z9G/Vtd1UAo1OyI0ibFOBZofAqR+BfokFBXe/xFvqg0qzhqQjIRFp
	leQwgoMQyikW0kjM+4Nsp2P+rGhTWtyM4t2RFcdalnN48+CMoWrRdbuswPxY5/NkbI9JNORxtojku
	jzrrh8+Z91A9tcDFogdTqc+dluJdCmoOPBPBmVD4aWe3WbmtStmIZWpW0W3b5CilxCDLp1g+IAyc/
	8aTVUQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfziY-00000009740-2JHb;
	Wed, 14 Jan 2026 12:11:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfziV-0000000971y-3Tvw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:11:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47796a837c7so58987775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 04:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392674; x=1768997474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvNQSaYKyUim5tFkK4HAPN4WA2RLqZuiV376Fz2XMpk=;
        b=ePZkmR3z2tEkg+Jc6kK2ITd3pGTdXHl3wt35Rm9UYfddL6hCohS5vGej7oajDrw95x
         R5EuQdCzyRP65A3iCpvNBYPl7SyDucCao8RBw6T6sECfrCJubSf3xXEYOEo6akg//VHE
         itK+P5dNOu+7PY2BBUQNkHtClxhxFvACGvTjDVZ8dVqHPWNSLL+z/NyK5bVF+MI2l7v/
         PSDv/Qiw4TnqvfTJJNdw29aZOffqrE0BcQWV9fLJChz0E8utPxdh5Ii5lqbUXWDY/7eb
         WYNQUv3t6KdjS2hBSUlJcbEoHsH6Vu+bANJ1f7HOop48yjURSILf1ZjIAZlsv8HpofIi
         8YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392674; x=1768997474;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bvNQSaYKyUim5tFkK4HAPN4WA2RLqZuiV376Fz2XMpk=;
        b=O4sXCL++ttRI0P1om2cR+t3Pw/hk483+PMxRMvVsNerefwyJy+YItCwYW0JqPRDIKZ
         fUPVBZtMppKfO25CS9VvnqINFLyZ/9K1kmVwGFC2u4F+6dKOFKc5zX2R/rO7U4HIvc1G
         jzywO3mpLmgcJ2bSNfY4brqvQtMD/HrvCZFffe6D5EDa6pvi1ie5DcYqp8LhtJQ7SQTb
         FBhltItU9thRyGKgs4hOrv2h0FXDW8DWFZiQ5pS11ZiARsXugl8+8MbDE5U5XB74qaoj
         piUDiglPHS9bX7XShwSC2hrrjevp5q0BzE/DFcydUWBkbM0a7CWbrZeyIaUOQ9nmHfre
         kDKA==
X-Forwarded-Encrypted: i=1; AJvYcCUNtwNFGjbbh7y8ns5TIxu5ua1cSdNaM69LN4W3XxLrZRUVTh2eVvouPHxBB5yT4Q2/YFWo13K/DIEAngGYqBxp@lists.infradead.org
X-Gm-Message-State: AOJu0YytUxrHixjT80c6ZWAAyFAmGq945PBbU7dj6JptzXMkS5XVdebY
	/SL7TNLuXn3zxeDY5h9Zap4eWSYyNdeNWfMUE96WGV5r9nS9Bd6/aVKESZACjztW0hY=
X-Gm-Gg: AY/fxX7A+PogsFxG/0CJ6Vpc1JHr7GxdPQIUKabkqI+UXLa3Yir8r7QMJW/qpl1SXaW
	Ynu8d0Ohpe5ouDP1UMhp4TO7Kc7hkuayQlxaXOc4+0e8dE1xCk4q9fqS/TtK1VQYf+0tLzwUdUK
	p4mOCa+BRxw9mRIx7SZQBnjyPZj8GV3BXgMIjT2YR0E3CDgGJ6UckzlbKHncVKeAVJINcInRpgE
	3QvDiyU078zXklkJiPQ/1fNcQPyAofD174YP3zh3BYy9jrFfgMZ4ycLLIiuYe6IZdRIxJVXhN/B
	Rgv2GmcKUgqoX5qfuyhmJ/QqTi1g5DAxVUYwkMShhroDjwl40zy1onaZA10zlJ2juNGWMlkL4Wi
	ULfRXXZE4SkngAdsAAYSkk0nZ/hgUmc0A9aHGu8XLvq2D6zEm1jGZsmouauvz8d86FyDxUBG9Lo
	TzOHHV3x74OfUL5bLMRuJufMgn1MNFmbQ=
X-Received: by 2002:a05:600c:500d:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-47ee33917d1mr23304285e9.23.1768392673795;
        Wed, 14 Jan 2026 04:11:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5fe83bsm50158222f8f.38.2026.01.14.04.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 04:11:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Message-Id: <176839267313.2837299.1195775819800428515.b4-ty@linaro.org>
Date: Wed, 14 Jan 2026 13:11:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041116_472372_F68FB929 
X-CRM114-Status: GOOD (  14.37  )
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

On Wed, 14 Jan 2026 11:43:10 +0100, Jerome Brunet wrote:
> The patchset aims to address the issue raised here [1] for MMC B.
> 
> While checking this issue, I've found that MMC A and C also appear to be
> improperly described in this platform's DT. The 2nd change fixes that.
> 
> To be on the safe side, the MMC clock should also be assigned on the other
> SoCs. More changes will follow once things are sorted out for s4.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      https://git.kernel.org/amlogic/c/86124a8becb43eed3103f2459399daee8af2c99d
[2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
      https://git.kernel.org/amlogic/c/3a115d42922cffc91b303992eadf220111d66c31

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


