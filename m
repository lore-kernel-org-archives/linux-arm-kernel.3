Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B9CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uFyZjvPBAmbsxn7nEC7C02rpwZ1NH2zXCqf0IPWpsAQ=; b=j91Qz7S7ZVv/oX
	LHOEJsA0NVK0SvTn94pDUN5OlSYsPWSWyWUf74GP2e7NH+7hSirbVS+XMmH0vfiNTZD9EKdc8sLZZ
	X0weKI265/LB8+kwn+FxntThnFFeZ/sxchYACtYx8JWtNmFEkRwaqvNBxodd25GK+Y60x9FeYV2uU
	UnK/FlGZ+l6nMvoThMp7JVMoQ6W1homyb3M2j++GzmTqlDSDtQ/S4fsbECnbDHqOQnyraxGb5x8Dk
	WRdI0rrAaM8JU6Se4iRgNkiYXS3S/UaQrcmyXIEIqs4uf4Vc5atBVZJmsry3QYICwazWn7wbGYWWv
	8ALRWadIM7vxS1ixwPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eMt-00000008YI9-0FR3;
	Tue, 29 Apr 2025 06:22:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eJl-00000008XOB-0f5p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:19:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3489590f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 23:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745907582; x=1746512382; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFyZjvPBAmbsxn7nEC7C02rpwZ1NH2zXCqf0IPWpsAQ=;
        b=Mozj1QPGI0TcM+sPpjJWElEBtSHXMQV09FcobaXZDCEkXE+5k1bEPm61iDdsAAeE79
         Wri4F5I488tLcMyNAQygyFD/xEo3r0/oSxjvzrGC1s0bkSYftMOng/Z6YXgZCHTk19DT
         b6SvF2BnEsUtYcXg109AirLfmEFJ9RHE0Kcru4crGtZHhXDzY4aM9Q1zGiNYIhvrvzmd
         AG4KUvepDKs9QNkEJx+zJE3kCbBpcQbgRD7Muh5/mEU0RooWxXmObzfR645Dt285STBv
         UzMBY7h2kM5QScC1YkdatNs9Krlmn2j0BaFhRlKv7nzITYZi2+Z4XCflhScS2eJgJT4R
         h+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907582; x=1746512382;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFyZjvPBAmbsxn7nEC7C02rpwZ1NH2zXCqf0IPWpsAQ=;
        b=WTwaqyn84N0NNahoTdlwWeck26OWQj3ZWfpzhsMRsxLFdvCCWDC1CB/3L07aD4au0E
         TkcZT/uYmP2yxPq/enwIoa9ffnJ48FPAX9OsXAKYbo6tpCqTneAWrLDmmqMs/pPlcDuo
         0QrV5XhkUhGgVdXRSf1gmM0jqO+Xb0/knJzSVPXDL8UihqnVt5lbmTfsLS+bpEfuy9IP
         819IKu1Sg/x+ZOKKno5vIbuUG9zQ101x+JDj9tES9uKhkiZK9Ehn25RvYwcguIRUMkxA
         61Tv8mRTueas5W4TOhDm5++XRuaMg1k6vRh188UALP3gGmKbHn7/6HFZI5AkwWQLIvB6
         3WsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDIVCk4k+dPbfmFqNmfD1jy0quXlcEuu4b6pwQH/OtAvRTkp9eatw1F/GB8nqkXBy0LQoFIR3kyTdzqVAKhyOY@lists.infradead.org
X-Gm-Message-State: AOJu0YwA7iVka5Cnak0RmtSC26k505xt5FerhQ4UQ2wqFFuBGkVy06Eb
	rXVHxAXHHA7L2n7tMnn+NxnWZ6bPfjzeJmAvSHQL7fn8NTFy2cmfK7P4VJcn2Cc=
X-Gm-Gg: ASbGnctKxbOXm16RtDKl0kVOpIb7qC5UNYGdGbNaEwb38TarpwjXkvESpUwhGwdg7iQ
	4GwCOzynipm3jqAGhNf4hkN0Hi75L1Ay6SltuNC8Gf7Vjs4a8p1DQzHw7QFVxHlGenbmOgciKPe
	vi6iTwHCKohh37BVxKO541F/LddII0Fke2t9POhqVYoCn0OXxc9OEl65n40kWfpM3ovDD+wTBIl
	FEQJ67YyjI2pQG5WQMuYPFbluCDb7af5kGiDN+mbCZmSiT+ynMndpfAcH3x81myRJTagz6569te
	WbDm6HZ84Vy+5e1wXtx+0b7382uAdX9GhpjC986Vl4nr3o8L0m1tPkk/LPuP+zSNE10VdCo=
X-Google-Smtp-Source: AGHT+IGzg8u5L2WOlzYwTof6+sSIg8lXFgr3pYwOWiVWKlAozVNfU+0kERbCJNCsNMAIv+NpvoSqVA==
X-Received: by 2002:a05:6000:4382:b0:390:fe8b:f442 with SMTP id ffacd0b85a97d-3a07ab8c463mr9060355f8f.54.1745907582493;
        Mon, 28 Apr 2025 23:19:42 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca4e50sm13302616f8f.30.2025.04.28.23.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:19:42 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/5] Fix gs101 CPU hotplug support
Date: Tue, 29 Apr 2025 07:19:36 +0100
Message-Id: <20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhvEGgC/52NQQ7CIBBFr2JYOwYGaq0r72FcINCWpAKBlmia3
 l3axIVLTWbz5ifvzSSZaE0i591Mosk2We8K8P2OqF66zoDVhQlSFAwZB+XdGO0dQgcqTND7MQx
 TB2lKwTiNUT6gtU+TIDNgbS21UKJqKCPFGKLZtiK83gr3No0+vrZ4Zuv3v045CqrGpj61R14zf
 hmsk9EffOzIGsr4kVdUYPWbHIu8ZRWn2jRaCvySL8vyBuHNM4NEAQAA
X-Change-ID: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=RuZmshfx0WMimIm7Tn9iytcwybbaUd3KhINLT19ml28=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoEG976bf5mwHz8je/RtwgP6enUETGQ+/11sFwd
 G9ztnqgr0yJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBBvewAKCRDO6LjWAjRy
 upJED/0euGHEqK1Y6ppKAivCbCa/3MatUq0YyXDb0CCelsbCJFnbI1Pi6hWJExhx5UYK64lvIMW
 GmFozjAZD48cC9MBvoTweUds2QFBKToCjzMvhHlIBIjUrOzogPze9Uyr9hSD4miZCwu8+gqY5f+
 FTK/ZJRKVMQ6eLEb+cACcLWHIC6TEaNRnb7XpjDmkPbNOPzGmIq+pTruJDRPiQwEVGMX1TOUukJ
 r4aAZOGtcgGcXUk6XJ86OYx01cNBYkcSSaxHffjFJg0EE31laGnGuQLNP6JRPUzsa8Bc9vHclp0
 awLE9X3ubQ5CRXHiSqh5ahOt50NNIdnoBBImX9b/3Xu4p8elNQjcdyzQAuFpQDEYHdfDWL3Y6x8
 6yAWT6PX7j/HKWF6D8ZwGTFGI8ymfQZgjMRYLFHwHVxnJKBIEq7UKpLPPh4UNElqfZKMBMlB6KZ
 YnwwMNXF+dn0fQWSbr0HRhBav1uU1Ei6nuCsZ7h6ajZRo8YcUZLrPa2lBGOyoYahi/NdLp1cCZN
 OSuT7Q8tIypLXtfF9hOBs5wpBfg2Y/gV7aDDs+VlK5kOZdhgaPgM+Fzntl9nUjT17S8kovnIkhJ
 SsOQKQ1uuZOtyg4Mxo6pT0z86yCQqLIG52iviGixThe3BX2h512A4H2lkWvBXK+QkrP9xORYnV2
 NI4mJ1dZYDEAjtw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_231945_212760_983B0A50 
X-CRM114-Status: GOOD (  20.16  )
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


