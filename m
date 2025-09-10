Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ACACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFi9l2xoUcPdKDTlp7DtxIMxRchiKoMRzV8J34u2n6Q=; b=m2qeWv6Vk0WweZq78tUjVneLt3
	McLrPNO+PJnlDXAeharHkyqgdlAWrOCp3D8qOvwb8xturvU6MAgRmcSF2wQQa/D7trP3+9oKTQCU1
	mw9xrj0m3Qng615bXQCVCCCMAK1P85Q/pzWYEGM4LQ2qubLoUHYsUbUvdlBFKlm7noFgUPqf1elok
	Y6l2X515VAvKByzSAO/2hne1qjh0u8f19inM8YNsrKDXPRpZtXPGLe4TS+WuIx6UqSutetiJcuXa1
	VoouPV34jgcP38fs/1iJVHYROZvKXwa6ESTFul31WKJ2OgqMH4oagJtqW5CYxzZygEPLyn0+8B57t
	EyH1XbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFST-0000000CdLk-2Esc;
	Wed, 10 Sep 2025 07:41:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSP-0000000CdH5-0dKb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OFi9l2xoUcPdKDTlp7DtxIMxRchiKoMRzV8J34u2n6Q=; b=OnWLDd3036s/XIY6xs5AHVs1L1
	HQ6xJle2Mq5zd+3nba7rEaDFxO798mDcYgnn7xwQ0wN349VEe3ruo/PSa9rSm6PcJc6ziRH0OYy93
	U/kVomd4s9kVD+3udnz2plRhX/GDQP7eehI4nf0a52ZKvsZTLfcosOixd9vivUz8ExTnkmJ132tlI
	MjgLxNoYfeulwqq2g+4ole0nl0OEPVIg0Mpc/kw1q+K4s9IVZ6w5u2LLweF7TITX7WEdV+F0GfNLP
	LHEUaYk5imjIwOy6odrbI3NmNPuTSgauQmzkdBhTaNV/qiWnxlqd7voiDygNh0Vn41cm7rgycwGP1
	YQCJwE+g==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFSL-00000005mGJ-3Yd8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:41:31 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45df7dc034cso3643805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757490088; x=1758094888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFi9l2xoUcPdKDTlp7DtxIMxRchiKoMRzV8J34u2n6Q=;
        b=HfU6P+yJEQ2XTwgae/ZTtK01TGuIbZ7b+AMuNaph30KkonVeOCbE1X03K9tIw9Svr3
         1hDnVW8m98k9mJnsavD7kHVbtyX72rkgNvZimh+fmTWDFiIGZ9hqXAkSvzY+ER+zw1pk
         6cTMLJVfXLVe6S172EGXm3SllA1h5ICZnYN5Jf7mHNVIix8KBzSpGRzTBLVW+2NGEZFr
         vNxDJdW/uoHG8guDTx+ZuCCrmHXrqhf1bjJuEeZ3TSvQMu9UwTIy9+7iyGZPpyOCUVCk
         GN/wJY7I3o1lRpV6Mjfw+HlzB2UsHzZqiz3qxNPEiMD0PuRPleKZwet0CkC3LyMGitrN
         V2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757490088; x=1758094888;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFi9l2xoUcPdKDTlp7DtxIMxRchiKoMRzV8J34u2n6Q=;
        b=GY2ixKcVxir4THv7YCbZ59s7ewLs1Qh7fnSUsvPnwJnfkfolmy9FJZVh5n2YmH8u0X
         c7eaqmAI8763hzsmGrV8hYuvK6U8u7rs3v/hW2IbYQ8ED17Ak8M/8WIV8JHxyEmzEW+W
         XYagFvnR256Pbx8mgE9zNx0WZCY0o2aqwXBM8wD1RQtHIQX0aIciy6VO3CEwU5lHMy/U
         FJG88e4PfKwU3wiHHkO5xFk82X8lTWxILDB43+8WuTGCks2Jy8k6CJVSNZFXipqLG1Rn
         tWcTnFKJUI22rg08wvwEJ5BOCN+Tdyto4qMw+Mnx5/tHiPxSAPpfdhjVOFZFAX+WbDhc
         DxCA==
X-Forwarded-Encrypted: i=1; AJvYcCVu5Pgl9IU28UU0fH+jUNY9d1qCWhcFoyTEC9119y7HpgTrrjU/aKbmIU9HncqXIIXapU93J+IpplmtnrGvrwsy@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl1c6sGHDWxyGTy8MBAYBN6VB25ITYnZfIbPfcHnasnqAC3GiQ
	Uxlr48zsmaKbVQhPky4l/R2sx0s6uJkzKHs79IGAIA4lirGtAlXqYNYDtsKL6btiSnU=
X-Gm-Gg: ASbGnct6iDNScNsb62KZURdnqEk/JVe9kF3OQJ43hHQ8KbTtIEmuVLuxC8rDLsgPqzm
	XyYREbd4yyjTaH1D1nWi52t+CVMG4BXL19SR4Psq/dbQDDczIR2xOxWlHdkC6Y3aCsM1MOeCw5p
	ahPiEFksv73YzP+Ky3GFplUeyOi0JiijrrZmpN6neF/jKJrNa9NX7NMHprbJpGDrnpnatZY8nQF
	r8WgjI5mydq4HZUz5RwrQ8qns7+9CIXDGmbiB7H6Kzih0MMve+2PZvAKu9AbThn4b6SqWyN5CrW
	jORxny1ts3PKJK3BszCrrDoV5uWKEg3XrLK8dPSr6fKpkma0d5W93nccCBZjdnjk9X4OxklA8rR
	UHwCyUCoFf4S2mWirOdHIgHHhLkhc7qCu7YbowL0EHe7DGmkFstAfBw==
X-Google-Smtp-Source: AGHT+IFsU3yXlWlG1yOOb7EeI/0GYa1ze44ob0J5hkt+SyO3sFYx+UnxBi7g+7gTTu6mB+/M07fxiQ==
X-Received: by 2002:a05:600c:4b19:b0:45d:d88b:cc6 with SMTP id 5b1f17b1804b1-45dde66c652mr88230185e9.25.1757490088210;
        Wed, 10 Sep 2025 00:41:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259cb1sm17003035e9.24.2025.09.10.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:41:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250908-fix-reboot-v2-1-354d0e57c855@baylibre.com>
References: <20250908-fix-reboot-v2-1-354d0e57c855@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: gxbb-odroidc2: remove UHS
 capability for SD card
Message-Id: <175749008761.1189257.11203428787242176794.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 09:41:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_084130_170644_DCBCFD6C 
X-CRM114-Status: GOOD (  18.34  )
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

On Mon, 08 Sep 2025 21:50:03 +0200, Valerio Setti wrote:
> This is meant to resolve reboot not working on this board.
> 
> The problem is as follows. In order to be able to switch from HS to UHS
> mode the bus voltage needs to be reduced from 3.3V down to 1.8V and this
> is achieved by the "vqmmc-supply" regulator. The ROM bootloader is only
> able to manage the card in HS mode (3.3V) and the switch HS->UHS happen
> at boottime in the kernel. The problem appears when the reboot command
> is issued or watchdog expires because in this case the "vqmmc-supply"
> voltage is not returned back at 3.3V before rebooting the board so the
> ROM bootloader will be completely stuck.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[1/1] arm64: dts: amlogic: gxbb-odroidc2: remove UHS capability for SD card
      https://git.kernel.org/amlogic/c/663bfe77b6f70bcb33b2607e16c94fcb1029580e

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


