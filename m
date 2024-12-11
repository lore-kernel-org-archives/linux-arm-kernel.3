Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B20E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=405Zc2ogFoII5Y01YYxw+4oVDyF8t9rieF12fX6F/10=; b=lne3CFNi6eNNgVnnkuCYgaCd/Y
	WoB0oJxPMb0TzxBKdrb8bSxZRGRDNZv7wC98/TmCJy9WHnvJFFY+XexGpJ0E4G6GtQbwPMXH8v3ZV
	9vF0Ha1A4cpt1HSNfIcqJYnOwwXAB156AiIEl3XqUoHuDckStstuyupWIqAC109pleYC2butwc7ih
	kXIkeu641e9qsPLiKleuSNsnPkiocTaXES1UvbpsJeAIwe3tK7H/PQ/mbcL9DfTuC0umPWCxQesBZ
	mY5XUCQfncAGAzNbwVKHDV+xwfXXSi24CeiwlI+9APGkCVsH9B7gZldWgy+5EIFg2MHbcf5ww3bEb
	3SIApMIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPby-0000000FSqQ-1sof;
	Wed, 11 Dec 2024 16:30:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPat-0000000FSTa-2y3J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:29:48 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa679ad4265so168340066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733934586; x=1734539386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=405Zc2ogFoII5Y01YYxw+4oVDyF8t9rieF12fX6F/10=;
        b=kiV4F0xEntUKXGQySbrmg1xXnChoMvwr8ILQJYVzlgnsBYwrMGq70pzSuc54RQ1WUB
         l2YZ8O1KrZVtojnyEZZ9u1a9LGH9wLRz14Xq+lHM/Tx2mujBgLBtMZepXHwKK2Eg4MUl
         AA6Beh4F8O6WbP0e7e8ZUHrYhzuKRl6wWHq/ih6uXiuIZUl7ThTPPSk+LM2OPZIqBZu7
         pHRgijC/dkyGQVlOQmY2UpOtokS5N/eyXm71uZjgcSmUOXvMY43TEdzX40ZivtYMA0dE
         fZLuPPX3cdsB9wLuV2dKDSVmz+/uudUcsy8D+QJhDfOSMYaqB4zpvHniYhPfYNSn2HU9
         hN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733934586; x=1734539386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=405Zc2ogFoII5Y01YYxw+4oVDyF8t9rieF12fX6F/10=;
        b=TZQYxRHWu9dQApUjVtPXG1W5cTsZvG7jq03soRT6N45DaojnR49Up79vtDcVb5a+nU
         1rvj7nE7CDRigxG4mThBus0N9mpOs3gtqSxgAQRja+4KSGzT7JzkAnA+ZXy/sDr3pJwl
         FtRhSN0GJCNCx3k282vyrnI/qAM3WQK8t5iIrYhmImpuoW1OB8fCMV5nPBiazZDJ6kQJ
         k4gskJ3r+kMngd6RlDfpTWUEjaOYK6rX8yZ2rKN+3sHLVrmUL5P1cD/uemLLOxqKDrKx
         fC5J9Ej9rIDXmXC4/u7vik8mn+B7CUCYJlkACE8UdIifvYURjiveWu64KaSJ0w4eBgk8
         HC+g==
X-Forwarded-Encrypted: i=1; AJvYcCXfe0RWapgLT5FaoWo/N5M0w8/MqVGBGAn411vBNKz/tqlpE8vEfKPwSss2kd/7mvZQdr/FAxOEJP3ymiGefC+1@lists.infradead.org
X-Gm-Message-State: AOJu0YzZo4IP7+QQUunMfFi2rwkiOzekcefrZtKhYDF0RgjKA7B2RZvZ
	I9gPVnRPtduhfCxyJrYaMqz/RzeEY3RQtlkv2TvC8Xfhu5mJxsMMCF1I/fiG
X-Gm-Gg: ASbGncsCMRhM2jwqR9q70B1YZJBE/xQ9nZ1aFFOJNRwK1+ZEEXbDelTclR7GHcr4Xrk
	4EJQkQhDEYAFMKFmRypJm620jY7toolEEFnxHe6PrzaGX2vote+9JoCJF7KWgFT53IJWDKE8WAj
	0AmYZARlGpIaASaMi8v0HvYQRx96Wpn523tnwF1NIwEcM5ZO4B3r3toMRLFfecjtl3h4imYFA4z
	RMSzqLVAVh3aqwNPax9KXF+I9vHI4fnIUThcbbBWNrj9SrFWA9xOQd6LmzTsxeDKEALxW1CZSHJ
	onbKLQg5p40UCyJ8iQQBes3uJgy8DQ==
X-Google-Smtp-Source: AGHT+IG8EM4U9gXsydrmKtBKna4oLCf4D8jj5BSeT0g27VN2a1zcPacXb4mK43JDxCcRqpqcGwZUuQ==
X-Received: by 2002:a17:907:268e:b0:aa6:ad4c:7d55 with SMTP id a640c23a62f3a-aa6b15cc7ccmr349512066b.14.1733934585452;
        Wed, 11 Dec 2024 08:29:45 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa663334906sm678451866b.72.2024.12.11.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 08:29:45 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: exynos8895: Add m2-pmu, poweroff and reboot
Date: Wed, 11 Dec 2024 18:29:41 +0200
Message-ID: <20241211162942.450525-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_082947_741697_6ADF8DF2 
X-CRM114-Status: GOOD (  10.93  )
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

Hey folks,

This series adds support for the mongoose cluster PMU in DT hence
a compatible for that was recently added.

After this patchset, I'm planning to submit patches for more hardware
support.

Kind regards,
Ivo.

Changes since v2:
 - Dropped the poweroff and reboot patch, since it works as-is with the
   included dtsi.

Ivaylo Ivanov (1):
  arm64: dts: exynos8895: Add a PMU node for the second cluster

 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.43.0


