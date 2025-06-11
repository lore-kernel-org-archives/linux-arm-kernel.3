Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB0EC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ee00Hv2n6pfIABOlHh41RgmvlkFZztRqY8NW1iNthOU=; b=HX3iCEG7SmrPoe
	2fxskwF3sfB6adTK+VXU+hCMbnjR488InK87kL8MLV5X2eoIS4V6Dtra0ElseIt7AoGcqmkOGQBhw
	yM/ZWuQXFpEO3MwC0SRBYPMqEXNy36k0jm41G/c1KWFRUu8Gg73SS8Ld81AWvfGthhyfWh3MWNRLT
	eaH8RwzWTIgQKPkcC2Yqs97IDvHV6CEpTXo0ltC3TzwKoWoUjtP8NFAfgIIH3KDHP96qlq2jE2B8+
	Ddopd7Bsa4HFYRQG6+7IBFD2WwR9dJ0msV1o2GoxLyRTn137UifcLTZLqD37x9sOhopErugDsUfXX
	P+z/MI9Lke7Y4FqqjPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMkw-0000000A9dL-061M;
	Wed, 11 Jun 2025 14:48:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqs-00000009UFO-1FNo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:34:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2495344f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749634472; x=1750239272; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ee00Hv2n6pfIABOlHh41RgmvlkFZztRqY8NW1iNthOU=;
        b=n/bAGApGR1WY+1+YdbgV89WZdgjhR//op/xwID40xIAzInz0bHOAZ6Au8M+0X5qnft
         G2t+VEcP1s/PJsN1Gu7AC3M73obW1EZtUTjFuSIGHgH3QdlSsRdJNeoZgAm0mTsKFifd
         DuAv54iy/DQWAtwdm/89vrxZ8wwuj5MFfF2+gDoAB1x/T6ndOmuuIRREQZxCIv+CGsUw
         J1FmQ0Cj2+jqxOB9uilaatbYZnk1Q2Ozren3GDjADElCbQjzyfVWrEaouMrncjcvJLU7
         M2BHNlZt6XjFiWO0Y1wWfhBWhJKLRrWOjTFe7Yjo01noBJ6esbjIjwPAoG5hpQnaJo53
         YdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634472; x=1750239272;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ee00Hv2n6pfIABOlHh41RgmvlkFZztRqY8NW1iNthOU=;
        b=JYQW+mqrpbDPNcdWb/3O+UALXqe1Mon4XZrkULUuAS5vRZHUP9jrsaiYkso1kWfIF2
         k5vAUKmd1Bks51VPXK+Lx3yKM8RRwxvF9yisXunXgre17i8Jq2lk8sPIAefQ2QEEbrSp
         IET9t4ab+Q4213AqdzLGijYn7sgVKLYNoZcpHJm1JJty5cLe2hZpH+JMEMt04siVQJxj
         Y+rdWC3dD/J3TuJ/2GkL25MNBnpEb0IThAGXIG2RD68rHeQ1nl5Nm0a5dfzN/HfPf/yA
         2NROCVNreH1DJDM4MjwSZI+8HX+kRkyPUXbhbXjEq1+D2ts15uqpM71czYCh9se1WN6G
         FQBA==
X-Forwarded-Encrypted: i=1; AJvYcCUy7HyC0x95yV5oZCzUM65xY9+J/g2+w9s29ev3+s4dWAtoTq1RaVIgw0hRtGpEu7upTIg9dzq7TLPIU5DL+S96@lists.infradead.org
X-Gm-Message-State: AOJu0YzYqc5q9OXQdZklN5kHfI/Frs/Pi6vqRjZgdoHvfbsllU3jVv0X
	ds6d950X4IVs+NIIdDMADtda8tozoFP/grb+EyJ2xVpQDh2yBAQFb36FMaAPjfZyovg=
X-Gm-Gg: ASbGncvA5YjSr7dYqDefp95efjo9lxlAHWrho6SGJWNeZXojkRFtQ96qAPfMzPFioZw
	7jr2MaTmYRXsHCpXKIQqW0FxZ3LsYWNaB6/dl8J4ZqZckaSluiiEnqDHLGgZqu8RZw+ePHr0Ihg
	cE5YBLOkveJ6c1wKuVqVIlS9+EZLLMCo9rQdhMPNHSyHljf8AQhkLGwjEQVomeX0OfH/DJjP+lg
	OjWtuxrFQkAfTjikW1vcS+M2Idc/Y+2Zaz8Trlntgq0fLelTZHmfmejhdFKnjCKTMHfmMhee9jd
	ggMbfiS44QBGNKpuPua4OhR3xHVL3mX7vRzxaWvCxdYrQw+0R7rumDf4gg9Gf+KZENnaJmzpwVb
	RnvNH58L4qlE7bSE=
X-Google-Smtp-Source: AGHT+IEDfONFcz3C9oPCAFFX7yDk+W3ZbpOIarlrBc0Cek5xrML9ciwnj6IGvkq3dbXA+yuDleTE6g==
X-Received: by 2002:a5d:6101:0:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a558a56a92mr1506354f8f.13.1749634472342;
        Wed, 11 Jun 2025 02:34:32 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453251a2303sm15467005e9.31.2025.06.11.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:34:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/2] Enable CPU Idle for gs101
Date: Wed, 11 Jun 2025 10:34:24 +0100
Message-Id: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKBNSWgC/3XMQQ6DIBCF4auYWZcGiIp21Xs0LiYw4iRGDLSkj
 eHupe67/F/yvgMSRaYEt+aASJkTh62GvjRgF9w8CXa1QUvdyU63wicllbD7i91KwuJsx965oR0
 d1M8eaeb36T2m2gunZ4ifk8/qt/6TshJSIKExaIZWY39fecMYriF6mEopX0EpP56rAAAA
X-Change-ID: 20250524-gs101-cpuidle-cafc96dd849d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=GKoJGEPtGbWX3S6SDM1+Marr1BzItueAulEfS+IMNmo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoSU2kMagcpLknWWW7k11DizyPziU2/a8+js0Pu
 9KZxxegILKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaElNpAAKCRDO6LjWAjRy
 utAqD/40EU+hi1XmIgZg+0irXTE/wDqmf+2p7hDECqt8sXZCZ1fyVhtVKyn5Y2/s3cCxl7gRyYs
 pT+ZIR33kahPtdf42bQ77nuvZQcC9mFfnWp63DlEecZJbp3vA7nzubISj6HCT5DQuzognZrwWat
 hwvU/3bMBi1kEv8ps9F35MYRDcv8I+PKzd4PP6nABxCCQpq/W1KoAVCzV7fo9Z3eDi50p74DKKQ
 ARxuGIS5gix2ERxxD0q/7HtuQPeTZUOW8tg2dUQ/d5Kaxmyofy1KcHyxL5oLXQ+VW8U0cueBXSv
 OnSsFvRWSFI0EWenF6m2eXOWKhvWcmihRaOCY34ho7M4e+1rHPOT7y7tZIs6jm9Tb/wwaWXykfR
 RlSxd1Aua+24Y3tF0LMfYYVP4y3heeXi7B5xxaHlXi93JEbtTu4qPtxYBIAb8lfq4eUgf7BlsoX
 0N2mY1ZjS7fYz84IlktzuF2DGm3eOFPrtL45V9mivm1ZangwJsHSUTTig92G5rX5oL71S6CtCKm
 kM93dPK4eir4K5aYbXGB4VB3BjZ0mE9dxm0CRyivIE5aRyNaq94N8Pp8X/MXorkc/U8bS6JOHZb
 nab9eZuV+F6e0D7UaAeBklm6uFSdKdLQrarsHrsrFwXIzkkIdiSs7edhHt8sfUv8G+NZNCfoJga
 VsRqDK8JBJHyPPg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_023434_362374_71359496 
X-CRM114-Status: GOOD (  12.79  )
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

Hi folks,

This series adds support for CPU Idle on gs101. In particular it
achieves this by registerring a cpu pm notifier and programming
a ACPM hint to enter the c2 idle state. With the hint programmed
the system now enters c2 idle state.

Note: the driver patch has a runtime dependency on the device tree
change to add `local-timer-stop` DT property to the CPU nodes.
Without this DT patch the system will hang in early boot as the
local timer is shutdown. The DT patch was originally sent along
with Wills MCT series in [1] but it can be merged independently
of the rest of the MCT changes, so I've included it here to
(hopefully!) make things clearer and easier as it has a strong
dependency with this patch.

We can measure the impact of these changes upstream using the fuel
gauge series from Thomas Antoine [2]. With the ACPM hint now
programmed /sys/class/power_supply/max77759-fg/current_avg is a
postive number around 150000 microamps meaning we are charging the
battery (assuming it isn't already full).

Prior to programming the hint this would report a negative number
around -150000 microamps meaning the battery was discharing.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250402233407.2452429-5-willmcvicker@google.com/
[2] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 * rebase onto next-20250610
 * Add #ifdef CONFIG_PM_SLEEP to avoid
   Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
- Link to v1: https://lore.kernel.org/r/20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org

---
Peter Griffin (1):
      soc: samsung: exynos-pmu: Enable CPU Idle for gs101

Will Deacon (1):
      arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

 arch/arm64/boot/dts/exynos/google/gs101.dtsi |   3 +
 drivers/soc/samsung/exynos-pmu.c             | 137 ++++++++++++++++++++++++++-
 2 files changed, 136 insertions(+), 4 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250524-gs101-cpuidle-cafc96dd849d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


