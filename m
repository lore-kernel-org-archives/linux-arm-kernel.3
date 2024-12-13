Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8E1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U2A0DSQsBZCyHCjJuq/xQMDgQGYmtUN7RbB1oPXeNuw=; b=CukZS+icjR56pT
	lo0kxngtJoFs5PaQgsvy/zMtFuWn/IrBlTS+PKgrTkccewKNOjZE8xIvQGrpM9V5U4wb38mKYuwED
	myBET0Hroj0vUR0mvBlm202n8doqesyqcNJIG03Nt6J2bWlpz+rIjBNur2++/Ay12bP9vMVu/yuG6
	EJKjdgXobktX7nXp0U/CL3J6NVcNCQfvs2IsSHzL0xhUuPqkb2FdLiHhaAVTO8qEPUiHRLYW3z//F
	jSTVi3fFt7jXvuLnUnoBcnOyVnZ5z9n74A0nZIOJ3DFp6VwC3ZqCjf5/bMDITUNN1Q3KosQBZ2ZOb
	PiCJAWkmTuN5V51Ej+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8p0-00000004SRo-2CNZ;
	Fri, 13 Dec 2024 16:47:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8n0-00000004Rt6-2FuQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:45:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43634b570c1so2018695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734108316; x=1734713116; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U2A0DSQsBZCyHCjJuq/xQMDgQGYmtUN7RbB1oPXeNuw=;
        b=AeGmZ2oG0f4OLwcrcD9AYKPfdC4YhxYJhHwaTrDHa6kFlJTRc0YrtiNi0TEBYwHJco
         49+hlUOIztnWSA5spj47+gxQJ2BNmH0jQ1GP7kseoDObniz7drQMf/RARqgLEgB4oNxy
         xWaiX/lQFjRgZ2R3S6DJBWssiPxTjUIH5GZKFoQY5E4eTKGisyOD447GQi6L3BPD4gjs
         cMUZQGDBajK3FlxVOvLM4cV1h8Hvpl2yzDJbxzMAC44R1Ohbcc4qwloB3Ijo67jaxetq
         QPFPZhysyiQDlk50PfY44sOg6l3L4Dr05dZ+fRDw715xLJZ5inbFEzEwVcnAPTUJhTpQ
         iEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108316; x=1734713116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2A0DSQsBZCyHCjJuq/xQMDgQGYmtUN7RbB1oPXeNuw=;
        b=Am7fNR8tTQ5cmMfEEv+a/TEUmgo889P52KRPSTlI1Uq5nHGQYOg+IZloxy7aL71A8Z
         p3c68I6JbTriAx2qhVHMztslmSJ/tS5E+lWYZGGAmJ7v30SwsGa0Q8m8hM/RtNxWpeft
         Qbu6c4tl7OjOIctNNFJkANjVLpzaUMLvLqWsbbfOSmTS8dEsXM3GCoczAQteEPY0bSQ0
         Q6pr/yrX4fPQsHxTn9z80MJcs+VZ0Pxq3WqKoK4AB+crT0xmCxG+osXucEjXV7EJP+Gg
         Vmo25fxKVJEo94T/5VHRZj9ynzo07hwqtiBF8ETIQ/KLBBcwAn7AOOQTWHFgmGGJeIae
         sDbA==
X-Forwarded-Encrypted: i=1; AJvYcCXr7s+6f0J1mzYRzVg8CIdmDJSfRfc6jq0wgWHuaWicyFmCYSdlPjdeo08+2+xzN0aOP/egVKFpZgPsGoThLp13@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzz0CIXyYx3Ot0GAK+S7n7sCpiRlNyj8+/sFl2sF55ao08ds2o
	3iVlPfC4ZQUDe0BttHjahJWvo3P2EIQ+ujEQcoLwbgmD2+c/3MUwrSiPD3HnFxE=
X-Gm-Gg: ASbGncsWARkATPVnNONZoiHMbrICWNRBOPR1YClO7lPniPbS4ZMxaPUl3xOZqYIgDf1
	motKDMm8iuv+K9Wa5+cz1tKYRvGTFvA8V2vZyLBIDcfCtffYR3mVVxWHxf+E9cl9NZ+wgFeHC8G
	rzVCQMzzaoQPb4C7apGALVGmuV2wHehIoY529GRAAUvb7kUe7TLg6TR6tLl8QT4hPsi93pJJMiS
	KeqfgG4uf7nagg6j6VfqJGM6OHQGlUASEMWKZ5IbaztMkpEoQQ9Nx3arlckYMdLuw2C363+80YP
	i8Z+GByfpg==
X-Google-Smtp-Source: AGHT+IHZJ2di20HJpkRNIWKJIeFs0CuIRmOYxZ3U2nkyoSYzcTlosFGe1cGxVE2LTdjgH6l8IIepXw==
X-Received: by 2002:a05:600c:1907:b0:434:fbd5:2f0a with SMTP id 5b1f17b1804b1-4362aa425edmr34728655e9.9.1734108316537;
        Fri, 13 Dec 2024 08:45:16 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625550523sm53900665e9.7.2024.12.13.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:16 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/4] Fix Google Tensor GS101 CPU hotplug support
Date: Fri, 13 Dec 2024 16:44:37 +0000
Message-Id: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVkXGcC/x3MQQrCMBBA0auUWTvQiSmiVxEXMZmmA5qETFOE0
 rsbunx8+DsoV2GFx7BD5U1UcuqgywB+cSkySugGMxpLhq7oc1qrvLFE9KXhktfyaRG1aeEUTHV
 fnOXHihshzTcXrLfTfSTox1L5bH34fB3HH1sgkqd9AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2o7v5L9OD4+jL7eoS1HSAH1rlsefrFIImLxiX+uatp0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnXGSZfuIaCNB2a/OJnzHqAuOiyM2etUNKYbV+0
 C/C0x0YvVOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ1xkmQAKCRDO6LjWAjRy
 utWQD/0eoK8RIO7nrEuBMHD793BwLl1lcBfzxKcA9w4q1BUI16yVBb7izZ+8E1TOcgPHzyqn3vk
 MHWJragitUXibjNIbh/tM4xdc5ko1jL7n1wBE1R5GP83D4W/2jY63oZPrFFqy88ZfcQICn2taf2
 0erNKDBTc3ZODWaBgKur/vBgXYLrooFG437jik6CrF4W6DUiEakoixuIsJZm7aIwM1IwAFRlI3z
 pXnvhqcODqJb2YkNQ/isDehKftaZ/ySujrP63gBeNaRK3yC+q93FPW5O7jDgkNifUHFra2hRpyx
 a/fHHACO7K9u0qN444AAWlHb2hsffq+rOQ41zZLjKDRqazYlczaeANiZHJAfa9dDu58vKtvTkK1
 Lpc7miIhQUtZBm7ouSPh+d8lLf/MZrmjH1fcjJWsLYmG1dG3HpiS3kS8IOwP4pe0VWUuJbqw/DR
 E3ULI6jeJJDgR30BFajfgKAjfY2hazulsFGQR0mtYWajbCiDcEPd9EqXodXGgrQJzgqHGWJ6ISe
 YfN7BJy0AcIBVl2E+2dSLASGVc2g7geepJ1p+5goRuSH/5lYCBbDxIJ4nFRGy3QZZpsksHjCZkC
 FGd7x3ogt55av0XRgo8zX+Qrk2IWfKFRj5+uTr+T/esi88NPkNKMkeLEvQcxwVyUESBgV1AiMz6
 JPYxpWDGm9hdv1w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084518_589897_1A7BEBC2 
X-CRM114-Status: GOOD (  17.25  )
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
functional on these older devices which use the el3mon firmware.

This series adds support for programming the CPU_INFORM register hint
required by the firmware and also adds support for the pmu-intr-gen
register region. This is achieved using cpuhp_setup_state() to setup
a cpu hotplug state. This is similar to soc/xilinx/xlnx_event_manager.c
and soc/fsl/qbman/bman_portal.c drivers.

With these changes CPU hotplug is now functional :)

It can be tested with commands such as

echo 0 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu6/online
[   15.880597][    T0] Detected PIPT I-cache on CPU6
[   15.880638][    T0] GICv3: CPU6: found redistributor 600 region 0:0x0000000010500000
[   15.880685][    T0] CPU6: Booted secondary processor 0x0000000600 [0x411fd440]

This would (prior to this series) hang the system.

Note 1: It is highly likely that similar changes are required for other
Exynos based SoCs using el3mon. For anyone following along who is
accustomed to looking at downstream Exynos based drivers this replaces
register writes defined in 

drivers/soc/<google|samsung>/cal-if/<socname>/flexpmu_cal_cpu_<socname>.h

Which are used by files in the cal-if folder and exynos-cpupm.c driver.

For the moment I've used the GS101 CPU inform register offsets directly
but these can be moved to driver data once we've established other SoCs
benefit from this.

Note 2: To ensure older DTs which don't define pmu-intr-gen register
region still work. The driver only issues a warning if the registers
can't be mapped, and the behaviour remains the same as today (system
boots, but CPU hotplug will not be functional).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (4):
      dt-bindings: soc: samsung: exynos-pmu: gs101: add pmu-intr-gen reg region
      dt-bindings: mfd: syscon: allow two reg regions for gs101-pmu
      arm64: dts: exynos: gs101: add pmu-intr-gen regs to the PMU node
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../devicetree/bindings/mfd/syscon-common.yaml     | 10 +++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 29 ++++++++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  4 +-
 drivers/soc/samsung/exynos-pmu.c                   | 73 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 ++++
 6 files changed, 125 insertions(+), 3 deletions(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


