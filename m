Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4DEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qBh2PRfn9u43SklY04e4FyKfcTmHSZzt7AhWG/h/FUI=; b=dyzVFp/CVo/aLh
	0zs6YaLDK9ylLLFIRILjsjpCJFBGJV+WR/J/1TTY1C8eiLD+LgXKK4HSHo7PQa5nGB94bwBqs4Dfr
	2K3b0CKz+S9UbVOPNYK/B7WP0tcZxb4u7+cnB11U5KT1VDDG4cbU9bbgIVeKQBET+cIvjnC5pPYEy
	iRCHQKntdtWwG4mpaRaGtU2LgaqwMBd07Hc4eyzz6MxRtrsDXmC4qEOBV/r9c1lIXJLfoiOi8Pgat
	SPY1+mVHSGM1d8tuRq03k6XFNAKuNs8oUvRpB9C26xgW9kK9O50z/5V2P58CehOQqBNruKPqjfj3l
	rJRka3j7kyI+utrv/tDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeHV-00000005Bwt-2thc;
	Fri, 20 Dec 2024 14:47:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeGL-00000005Bgf-2kxc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:45:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3863703258fso1946926f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705956; x=1735310756; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qBh2PRfn9u43SklY04e4FyKfcTmHSZzt7AhWG/h/FUI=;
        b=OcrohZnIYKOvwqg0NSgB2dJMwI3hlkFiYj71HHDXHfu0mHWllJOfv7KicwUMBJblwC
         lB93tPAC1FbAETqispg32UrAjd23pYx1L1AiHuBLfe1dgTVjvkG5Dm3W69jih4bMDyGM
         EuADltN5o+Ay7Dp7qW+N3jepQ4Lz3xeO6iztqVXY+YVJ308PUnjsqiGYc2n0LFjp6o3b
         O0D9rSi30mpbBgkCbXZDrgniQXU8RcJiau4tT4/t1+94S3jHUKgRqvXYI0buu1Z3k9XC
         PTzmMI8htQRw0Yz3NPiuTCKtDohglw4EA/Gdj4gbLKuTtpgxrr2ZGM606DC12o2e1168
         a3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705956; x=1735310756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBh2PRfn9u43SklY04e4FyKfcTmHSZzt7AhWG/h/FUI=;
        b=mMddsy0ajuB8wfzzfd6kFK+XgJbFcGoU2OZiFawtx2o08Ff8UnA1xYZhMl/RzjwVwP
         bH+McMnMqlOhfGnDrQt7dDO5yz6Dl8M50cri539GdCWbrmgdkR9BCKF16aGu/JiMK89a
         Ox6fk7iTMLs1sLcRtuNyW8k9yhxVFlfzTbgoX9VmqnQzSw8mftVeBynlfsMbVRMyHEyf
         COKDZdU0yrAuHNBwjDra7OFa/9h9aEveKFbvBoF6qe86aSCkIY9u8J+PqNMnzYQsWrZ7
         EZfgKM1Eoq9XsQUcXBgT6xinGjGKfMBob3Z50vSQ9UV63chLVZlqhCgnUsSyytnOPj6p
         OAAw==
X-Gm-Message-State: AOJu0YzyLVsECv9cE6rBJZeyO405WpEe2X3Nokd8FJ4A3Q12GERCcKQI
	6LSbTYhVceWZMkfEpiIbd00wgt6eKBVUHKLkbtZacWqgAakOIjnMcRtCh9xFqLY=
X-Gm-Gg: ASbGncuDnWBA9kEajBGljf6VijPGpm6xW2cqD5+1WCd9IRjogToNeAroT8ba5ObYKop
	myxenFcisYl8V5Ol7+ZfjuMS0iJhDKq2u9eIF7YeJlE4WV8JQ8h9l4CH2szcYPyV9IBXLK/xKpg
	HwReXFFNc4AnmHJosI6W7wkjnYa7EhX0TEA1fPMViX5RYT9eNBqbOnqGVtFzQEe/quUq5QdrCpi
	F20k6uXBeLm1T5MbOzFnxidFMSIYJLRcJdRYAma6IzLavnYgFOXLCcBmToEPLxM/XxguvjozOS7
	xAXRGvhDHJtZWLOuEhWzIpzXrV0e/+UMqxmJ
X-Google-Smtp-Source: AGHT+IEZzb0/kl6e42ArojgN/PPsCD/T2HSUJTcMY5j6C8P+GFD/1OQmhH9MjKPITxbxwyX5uZWh6Q==
X-Received: by 2002:a5d:5d09:0:b0:386:4570:ee3d with SMTP id ffacd0b85a97d-38a22a4c983mr2802812f8f.24.1734705956132;
        Fri, 20 Dec 2024 06:45:56 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm4227874f8f.44.2024.12.20.06.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:45:55 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/4] arm64: exynos: gs101: add ACPM related nodes
Date: Fri, 20 Dec 2024 14:45:43 +0000
Message-Id: <20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABeDZWcC/x3MTQqAIBBA4avErBvwp1x0lWghOtksMtGIQLx70
 vJbvFehUGYqsAwVMj1c+IodehzAHTYGQvbdoISapFICQ5FConXpRH+j8c6TNGbWwkJvUqad3/+
 3bq19xvN4bF8AAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705955; l=1409;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=m3kxsj6PdPfvr39eVNxBgS1/8+vpEhQMSwY5/ydn4Wg=;
 b=bzqeUTqgit5fBdKsmwIGXgn7rIJzr8IllqISGxcoXsCLqwv0Y6/qFtGaWG3OkrEndurMQFCd4
 6R9L2FyeLQwBXEgvyrqJuOGt3P3q1q73JX6EX3KRJOaWKmIiNG+O9v2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_064557_715017_E693854E 
X-CRM114-Status: UNSURE (   9.25  )
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

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Changes in v3:
- ACPM: don't specify the channel ID and type in DT: the channel ID is
  discovered at runtime and the channel type is always DOORBELL for the
  ACPM interface.
- mbox: update #mbox-cells = <0>;
- rebase on top of v6.13-rc3
- Link to v2: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org

Changes in v2:
- update nodes based on the bindings updates
- update mailbox and power-management (mailbox client) nodes to specify
  channel type (doorbell or data) and channel ID.

v1:
Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 ++
 2 files changed, 27 insertions(+)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241220-gs101-acpm-dt-6dcde166530a

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


