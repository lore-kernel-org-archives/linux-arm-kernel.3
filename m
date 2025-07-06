Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B67C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 02:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rn7t5Vn8pMvyg/GganPpfVWGq9uNzUBvg+YEuGMms78=; b=KRMGIymwqaPpLaPtEgenNkoLID
	+8nUCLCl/l51U15Y0T8m+2gubeNv1+L8ZMnIphlz4ui9/oBMDGokZEkG/FYbb1LafkPLw8xhx261B
	TVcA0h8AltPh6rkYe7I8l5xJp1kKDMUHcyZSboTnkhAN+9ZibM3iTb7UWQq/+nBfGP2rvH+e8SAcR
	DQzUFCzkSuN4EiqioZ9MZ5oyZYisyAwIVnnUFb4CbQbL+4gXTmuvINujZ92y4dscJG5iPIbgt97mf
	hvIOzFGn/Pz0jAW85PgPySyVD/fbREY5sTle8lKXzC9vS9uhH3Dd/JwP9ph3JmEiz46wS/gvAQS6g
	1z5N06ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYFbM-0000000HILl-08Fk;
	Sun, 06 Jul 2025 02:59:36 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYFZ3-0000000HI6b-0H6i
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 02:57:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54d98aa5981so2767598e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770631; x=1752375431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7t5Vn8pMvyg/GganPpfVWGq9uNzUBvg+YEuGMms78=;
        b=jJBjDUnV46cqCHPfVttzA8aWnB6MJvkBnD4ZGVqwbZNWJtAByZ+YfVs8O8NtdJvqud
         vfXjrH35qMZau8ob2U5Bl9uT2WrGJLcUofkUOi97fhBFLpDxJy5o0eJ8CauBfy66nCjo
         gixUsr6ec7vVDHManncXpsFFh11utcndmrybIRDQHiSNBoROeQQviztKKy1llfJwvz9j
         VvKn6jP1rgbKzkRNibdnoBRZ/k3HylFIS6xoHBFrx+6FSBKgbL4W31RgOeMmIUVHtjZc
         YhIYA/47DcX7VgAfHBywWrf6K3zXZikCk+HRprxSfep5oG9/QedxNKLV/bW7PHmVZivA
         /Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770631; x=1752375431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rn7t5Vn8pMvyg/GganPpfVWGq9uNzUBvg+YEuGMms78=;
        b=JYcOOATgcHGtvfQEb3rgBXmF2PilIzgnrSeIhSlvi/Gf+KUQ3/zvUTmvEF4VYeiVyS
         J7vGrsOvrTA8MlzxfX2nd09AeriLCmh89fvadJdA8yaDqDU/8gsjcOA+iDy62XwFY0NY
         lMAWmjRgOSHSq18kVc+IEf9lrwALQU/MowlHz9P0ghV5yRWWR13m6R+la/091xuGF33I
         HxFU00dcRwUF+NFI1wUpbepZ9SvlY1tgZ9naM0lFuZLrKDLZHErXkr6MGGpa6NmMZ7zl
         J7X661f2hD4akXjBBxCfBd/gmNx/i0p/aD6naZiBt3B1Erpv7gyIh0O1pWIHHgmHskME
         5kcw==
X-Forwarded-Encrypted: i=1; AJvYcCUwEWIR1iBMEd0PYsdV4TYz3vUzhnc9AuRJz48mipYd6ea0fuseSISZsnvQ+292zGAGqkepa1quzbOqh5JY9zDn@lists.infradead.org
X-Gm-Message-State: AOJu0YwCQOmULp+pme70iisnjYkPSvWIQrztRO2tk0x0RqNnqEN51+BY
	az6m5ntN3b2dFkbIRgIRu43dqHlpEU7VnHy0zcvXoI8Qv1XaQwQSycbx
X-Gm-Gg: ASbGncvb3jYrrdaSl6WZIrEO5OSjN47sUxGsONRaOKTcIkuCKgTM4L8sXQ+rfMpK4wW
	Yvo/lZA5MUB9I3UVMGwUrCGyqgr8tUzcCpHEOuYh5YVg/Gnnu6HJVz2I+T6Cof2Zpf8BLzWaBXr
	r9vPNeQvr2Ph+RLRaOHN/SAPjeImRyDSmxBC4MLCotpcwAkPw/im3xO4Q0iOqrtMeQg6s0Dki2c
	d9j916ptBmfSog7lIM1Lb//vnAajySHOKZ1QWdMtypIV3qwEsEpTjiVE9fsAb0q/vh+7QicckfB
	WwuOuQIUc+l/odDTAPImGMQ3fnG/beitG6+wYKN6xQ57Fr1qZLTAaGk7jF/ZlbiNoFl9pTc=
X-Google-Smtp-Source: AGHT+IG7c6DkgUdK6MlS+lGxlxrwGbt7Tzq4+q56B2tWzJqubkeFQQPt3FbCuONr9HeiGCNfS1d13g==
X-Received: by 2002:a05:6512:ea5:b0:553:a32a:6c2 with SMTP id 2adb3069b0e04-557a1235e5bmr2012238e87.6.1751770630659;
        Sat, 05 Jul 2025 19:57:10 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:10 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: sunxi: a523: Enable Mali GPU
Date: Sun,  6 Jul 2025 10:56:21 +0800
Message-ID: <20250706025625.2707073-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_195713_110632_50A1E182 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

This patch adds gpu support on devices with a523 processor. Since there is
no support for image output yet, the gpu is disabled after boot up.

$ dmesg | grep panfrost
[    3.826968] panfrost 1800000.gpu: clock rate = 432000000
[    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
[    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
               status 0x0
[    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
               00000001,80000400
[    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
               Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
[    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0

Tested on x96qproplus and walnutpi 2b devices.

Based on v6.16-rc4 with patches:
https://lore.kernel.org/all/20250628054438.2864220-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250628161608.3072968-1-wens@kernel.org
https://lore.kernel.org/linux-sunxi/20250627152918.2606728-1-wens@kernel.org/


iuncuim (2):
  arm64: dts: allwinner: a523: add Mali GPU node
  arm64: dts: allwinner: a523: enable Mali GPU for all boards

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi    | 15 +++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts  |  5 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts   |  5 +++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  |  5 +++++
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts     |  5 +++++
 5 files changed, 35 insertions(+)

-- 
2.50.0


