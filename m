Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBDDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d3GDUlxVj2ccf8fygAExYdRMRYQk9xN/9FeFJL4KvNQ=; b=1ek62lEwxKK14j
	iyxjqR3D44c+fetmgymA3JjNWgJZoh0INCPYH4O1UIJEoC1veoqC/1ORYd7xCtH3YgB8D52AqlTAk
	+10Ag3EGworXxIYOr0RlLXwzKTHl9ustUVBRd/d4cUClVED1VRZG2BW4TGbs9AMWUj1aV/oy0R+J/
	soA/3nll7UwC7WOWv25DlnCPaPbPi+B1mYHIONZUoNQv3eX6KhWVDbTD+2aIHm6b4RENgJR3vht7K
	ccQm1TAoZBLUSFqRQQvxQg21ZKU/p7CwOp2mZfyZK2caMM2QDtQliaB2b/v0SMIVpzF1k2ImsK5UB
	gGLgyTQ8ZHtjT4Gs63vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUax-0000000DvBK-3CNb;
	Wed, 07 May 2025 02:33:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPMC-0000000DOPa-05iT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 20:57:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so5987495f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565058; x=1747169858; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3GDUlxVj2ccf8fygAExYdRMRYQk9xN/9FeFJL4KvNQ=;
        b=QGAI3pyDA9n2HPWoIUVa3IqDxysfZcXksGuFVFoALBOea/+pqU0sM4bWDUAOA/4Msb
         tOdA3N8E6SkWe7lW6QIcTtEExnaVOrIO4BkG5ZzR8RWlIXWGob2iDZpvdWVqsKILqywy
         VJ7GQsnOh71cQs9L5pdEw91XdefW3LRsOuXwY+TDotElzC8N1aAHW7ih42nLOrPVRD4Z
         +XWi6sm3D0ogNof5n497yQorRPItwAtXK+8kmyS7WuQOWC5ZoszZGL7eSwSwfvClNjIj
         Y8FnjdZVXSYEsayHitOKzZsurLkQA8zye0BZnxwZfhLX6budJ9yVptpbis2+0qYHT5D7
         J0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565058; x=1747169858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3GDUlxVj2ccf8fygAExYdRMRYQk9xN/9FeFJL4KvNQ=;
        b=guC5nsRPtyGA7dZ32uORFNuUN6jOZYd7045Cwh1MBdolOcCRjidRuyoYV5zVe7p4xn
         tR7Dgs73YMW3OI4Fb+pBPIQPX9g33Np7SBP1QbGcA3j2/iZuK4ZA24I8Q0/JFzM9CM9K
         J558McI8pDmji1JAfSyXCIvByU+ggkUf8kkWPREmmdrQUE5XasiDfaCNBxgliLqPMW9V
         bsqOoMWC7xz7DwvdN4JZMmUwUPjedz7ZxMOkEoG5G/IJtdhY0Qko06b20TMBcwFgIZWI
         72fT9eFSHL9SLq9jNA6U6ndaIvbsF7UG7oXiigQEQGArQYhOuEGOrV3uY081yiXPv9E+
         hCew==
X-Forwarded-Encrypted: i=1; AJvYcCW89nuklGhKzYfbdGWLK2n7hY3J3LC6yg19IrkIhX5cTOmKqPO4Q3YIX4aCtR/GlpuJgejkIlSlDcEu2+jNBtJR@lists.infradead.org
X-Gm-Message-State: AOJu0YwwmfKsGg5yYxJts0hPBfYfELIX77/KMzzS5BzdtkdruWpCxx/6
	ienZ/5jZ0Lhm5k4cdGhODVZH7sFh4MiMfsEm53AuV6t52zA9IVbC/9MChhsHScI=
X-Gm-Gg: ASbGncuR8mmFExkRrBF6SnVzARSDX0Q+olQRkZtGDYzHAQKNyN8R7+o+sO1wBQTC+VS
	23PIaguz7TXXZ7j+nXMwHRNp6AlsPaQFR/9oAnh2YCeiwY8EzgFTT/L8KhNzmUh9FbMLqrAFgb6
	CcJKd+uvJ9M2da5CBWymMIbBlDyAMUFGfwNJ0Hg/+uLIbjjaZpEh1tsmp076I2TtTwbmnIYnkVu
	4Vx5eGJ81aMdK6tUJxbj0qogAyZk3B29+32O5NeCZCcUysGmTAeOpq+UuTg4XiNs+Hyhf94Ep7T
	NU0b0VFHEJ91GhuCGg7kJt5AkWxLK9IovXTVVQAkikX3debjNcQq41bMEhpDZQkAc2cauMY=
X-Google-Smtp-Source: AGHT+IHSXoGm45WUpw3+gnrN3nF/nhYEgzhSmdR5h6fFyAHfRP8U4zc1Ueazfm9eTYC8whjoIsFoKQ==
X-Received: by 2002:a05:6000:1acc:b0:3a0:82d4:ba90 with SMTP id ffacd0b85a97d-3a0b4a1928fmr661708f8f.21.1746565057637;
        Tue, 06 May 2025 13:57:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 0/5] Fix gs101 CPU hotplug support
Date: Tue, 06 May 2025 21:57:26 +0100
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZ3GmgC/53NTWrDMBAF4KsErTNBM5LqOqveo2Qh68cWJJKQb
 JMSfPcqgUBLVynM5s2D791YdSW4yo67GytuDTWk2ILc75iZdBwdBNsyI04SCQWYFOcSBsgjmLz
 AlOZ8XkaoS80uWir6Aj5cXYUVAX2nrTRS9RxZE3Nxj66Bn6eWp1DnVL4e4yvev//bacfBdNR37
 /5NdCg+ziHqkg6pjOw+tNITV1ySeg2nhntUglvXWy3pDy5+4v1ruGg4DsZI6Qe0Sv3Ct237BmR
 ZIfyhAQAA
X-Change-ID: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4363;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=pyXy7Kv16xzChqAGMSwqlfI8ZzGLOqhZ2OlsFMalq1g=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne9SAiQrXdZ6vVyg3yJu7nL1zfrXgJ+sFa1d
 GcEK8FzesKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vQAKCRDO6LjWAjRy
 uvCVD/49M9qz+Y+rJVjuT9yEaySSWUKcLQaj0y4I6TMOJR81fQX5wcUmam4PbSXcM6wlbQTuLUh
 JYFutTFpsawztRifbISHDx+tyljoXFtNi2gih7IelYb0mdOt07vgd3+hi8wl/hWo0o1ETj3/V65
 VQBlS9ibUJZ7EiyMNKDXvRMzA5ERiC3sVLJkZcDGWbmhMS33OJ1bqw7YvmNOptGOzGORXtXJab7
 /M0EmzSSJJ/eFojq+Zu7LnBqBNf7RGEnoXHOeloIRtBM9DD4h0E4++ybTpt94+2XA8wGO2P417j
 zx/EFln19j4xaKtF6hrl8jfNIFHWpZWOs7vYiw2WVYJtxhamgA0b7zavPnjhls/uZU6nTJ9ucHJ
 Q4Y2/w1E72c6AIh4Ji+iMjNKQaRb5k6/Mlmy89M1uDLWa3jgAvfxZh476FLvzszaK4C0OVdObwW
 RHMaDeWE434MNSJ1BM51/+AeBRaTUyNLAMR6jFFKtMryIvc6V3rMHxdbiV8R19205fneiuKV3OA
 gUqQFKelyFlTw59sr0PkWc8cqr1Sd0nCoz/ZVdLI1qHiNcC8FczDDP997kN0OMoxdpURcr487xA
 cHtfO9/lo3GPkhFPGU6uPpVZtPHaEAS0c/Jlp6EUzBGuVC+15+6Qld5W9unPWj5Bh5pNlBiSlHd
 RjqRlEeCfHC+6tQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_135740_083277_B2DC34CD 
X-CRM114-Status: GOOD (  20.24  )
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

As part of an effort to make suspend to RAM functional upstream on
Pixel 6 I noticed that CPU hotplug leads to a system hang.

After debugging and comparing with downstream drivers it became clear
that some extra register writes are required to make CPU hotplug
functional on these older devices which use a el3mon firmware.

This series adds support for that programming the CPU_INFORM register
hint required by the firmware and also adds support for the pmu-intr-gen
register region which is now modelled as it's own syscon. With these
changes CPU hotplug is now functional.

It can be tested with commands such as

echo 0 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu6/online
[   15.880597][    T0] Detected PIPT I-cache on CPU6
[   15.880638][    T0] GICv3: CPU6: found redistributor 600 region 0:0x0000000010500000
[   15.880685][    T0] CPU6: Booted secondary processor 0x0000000600 [0x411fd440]

This would (prior to this series) hang the system.

As more of a stress test, I ran a script hotplugging CPUs 1 to 7 in a
loop 200 times which also completed suucessfully. In addition using the
recent fuel gauge series from Thomas we can also verify that the power
reduces once the CPU's are offlined.

Note 1: It is highly likely that similar changes are required for other
Exynos based SoCs using el3mon. For anyone following along who is
accustomed to looking at downstream Exynos based drivers this replaces
register writes defined in

drivers/soc/<google|samsung>/cal-if/<socname>/flexpmu_cal_cpu_<socname>.h

Which are used by files in the cal-if folder and exynos-cpupm.c driver.

For the moment I've used the GS101 CPU inform register offsets directly
but these can be moved to driver data once we've established other SoCs
benefit from this.

Note 2: To ensure older DTs which don't specify google,pmu-intr-gen-syscon
phandle still work. The driver only issues a warning if the syscon can't
be obtained, and the behaviour remains the same as today (system boots, but
CPU hotplug will not be functional).

Note 3: I've added the bindings doc google,gs101-pmu-intr-gen.yaml in a new
google folder as it seemed odd to have it in the soc/samsung directory, but
it's likely this may be re-used by other Exynos SoCs that use APM/ACPM.

kind regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Add trailers
- Fix typo with GS101_GRP1_INTR_BID_CLEAR in gs101_cpuhp_pmu_offline() (Peter)
- Link to v3: https://lore.kernel.org/r/20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org

Changes in v3:
- Fix  $id, relative path/filename doesn't match actual path or filename (Robs patch bot)
- Link to v2: https://lore.kernel.org/r/20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org

Changes in v2:
* Use BIT macro (Kryzstof)
* Use gs101_ prefix for cpuhp functions (Kryzstof)
* Model pmu-intr-gen SFR region as it's own syscon (Kryzstof)
* Use regmap_update_bits() API (Kryzstof)
* Program hint on current processor (Peter)
- Link to v1: https://lore.kernel.org/r/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org

---
Peter Griffin (5):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 15 ++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  6 ++
 drivers/soc/samsung/exynos-pmu.c                   | 80 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 +++
 7 files changed, 148 insertions(+), 1 deletion(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


