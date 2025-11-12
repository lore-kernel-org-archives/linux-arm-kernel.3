Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66942CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=; b=Rk8eBlB0+i+QEe
	Q31Wj+9CNMSu3DO1hX6c2+LyjWr6Y6htTfaCQJtLGOFusLgjzM+7RSRf8mtdqQwbLoOMRcA0Pdgh7
	XRx+Q3rNE8AKnrGUd9cu65TlgPL1hyeUEOJgtmZzmPXctMT2mAePcD+oi5JhDj8EjBQK5hqAqayLC
	mCzZDJwpfIMZSgrBZh5izqMDVX2RiZfPUZCDVHkC2f5s54HnHQt+dKKSxsqRLusM3mrGn554Tt2+0
	rnHzNYfPz4o2f/GMUO8lJiDch2dhpsUmZqGtme3xvXl9goEOlUITSI8oouV+rx3PGktWfkkfCK81W
	TXSORThtKrEA5htgDbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ868-00000008YuQ-3k7G;
	Wed, 12 Nov 2025 10:29:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ866-00000008YtC-2Cns
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42b3298502cso62096f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943344; x=1763548144; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=;
        b=INC7vKsM1l/UJN9nHCGqS8l1KdqRcqYbkZoRaQG8jYJ8YCtW/AM5/ZZFh7e6T+VbYE
         CdmtslBROchxNMaCzl1tuY++76tg53aKdLWa5H+fXEC0fI7xpUQLegq6iq8LSkNFAxTW
         W+MDhnEeHOmOD+4TTrNgqyTjnUFdKS2sJmlRSIJMBF/eU6qBVenwaoaLOeax3jC0UA2N
         4dPgUxKL1OsVxh7iImM7DQ6+ePvA3EIjxsVbdV/FOo1QYuC/Izdayv4dUhMlJVCdfle3
         v/Mhsb1nlt2ISVSSC89gPY7/B640nJbZz/gshHm1EHnAkHCkcsJzgwjgNFHjAH2xZGOS
         RnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943344; x=1763548144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=;
        b=tTgmb6zmI3l/cjdAUYuUv0vpHPEJ8FPzaF9myDYLt9SliovwosNgP6UKFxO+zKfm8S
         cMAkeCZSQEhIeFA1s7asM9WmsGp9CzvQsl17LisOMmIPJbxur3Uj9MO+Q3dW+KaL8j8a
         Ei//eiMOjOYCpk9d9Q5qNBJyNqj79fd5uiJ/7cbWmVJuUeNir1FJ80cqXg+JpGZGbjAl
         V8D34OFrlKVPvjY0TnPe4FV4oemGK5PbUY3dAx4yrgVfplU3AG3MvuizKTKxNOcKNmbg
         qT8vLZHRMKVIqTSiBjEpq5wKkuT+oDEBgiXhvf1nYu9nKdYUI6hy/kh7TqDxE9YE4lmv
         dKjg==
X-Forwarded-Encrypted: i=1; AJvYcCWUMUxAkSzZqI5A0fahucYCNiU3ar/N0niU/qSEHJfQbvKkgEkGNS+86l7VJSMlR21G/l0BMtfIaAyTUCJdn5UH@lists.infradead.org
X-Gm-Message-State: AOJu0YzDwuXmmWOUQdMYtpmEh4taZMQY/oRRduA1lhtXY/n8d/W3QR2Y
	jNVogodsHOjqsYzk9ipona+hcIRWcf6kl1B6+viX9WEXHmx/va8qM07e7x8PljKv2XQ=
X-Gm-Gg: ASbGncviQ7R7n8oZMtGHHZqjGnI7E763HgvP5uGhX+JxYzE6800GqTmT+i3LDQm5Z0x
	T6lWcz7MHKRC7JkqmxTHVpF+lJGlpSpERr2VuqkHaUKUwek7nRzPJRS8DENu97byUjcizjpbRBA
	mzYkYI5n2hF4S9jkGrd1RGD+aNq3plNp0EUCBW5sspRaxwDPzsgVs+Danvs1y3cbX+gzlQ94Bj8
	gtFIID3AIHRzYVODGcmXeC7qDTs1b4j5Xx1rTD4Tv6Ib2Nq1BAeHqHQqPDYBSWKfvt17D0DcXuZ
	1tzYuqZovZaKso4pipJITWEfN/z+qu5S29xGZODw01GZnQ6UXwrRBGLgKNWx0CNQk81amNlMLWI
	smQxMWLO0TVyZVocYPM1Vzs+dbNkT8PZvELpi7q0p24nqKlsp8Ay2vlFm3ADRCp83qqwvlCp/za
	w7PvFeMeEC2cxCeYKP
X-Google-Smtp-Source: AGHT+IEMmjHlZdR4rkkkBtikr3kREAJzYe3gVzEQY2F/CPNjTW6FIV3Gq5nMQMHGsI7EpVQgzvavzw==
X-Received: by 2002:a05:6000:230e:b0:42b:3746:3b83 with SMTP id ffacd0b85a97d-42b4bdb73bbmr1049650f8f.8.1762943344377;
        Wed, 12 Nov 2025 02:29:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Date: Wed, 12 Nov 2025 11:28:45 +0100
Message-Id: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5hFGkC/42NQQrCMBBFr1Jm7UgSYiyuvId0MW0n7YAmkpSgl
 N7dWC/g5sP78N9fIXMSznBpVkhcJEsMFcyhgWGmMDHKWBmMMietlcPeYvT4oGWYfymBcaSF0JK
 zvVfWtdpC3T8Te3nt7ltXeZa8xPTer4r+tv9Yi0aF47lVTLrmYK53CZTiMaYJum3bPr5NAz/DA
 AAA
X-Change-ID: 20251106-b4-of-match-matchine-data-4a64bf046814
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5+dyAstf0xhbGIWyYKa5+nXexFcqNXdclmhKrec/Eu0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFgkKzLKPJ79bhNkhzUMxTf7Rq0m0OFEmF4q
 dnv57GH9wqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhYAAKCRDBN2bmhouD
 18J1EACLN9dO8VHBUsLifJcqZjQO60hgIzWj+1YfL7nCpzD4o/V3Zb9fmbppxoW4A8qBWHFp+9z
 bla89lZvHQZo5Io3ja8lW7quIu9nzOFwt9GGBLMYb+Y4ukJpyT7gnUqW8MSni+LVw0fGpJwzl4c
 khYK2MI/R/M9d8wpqyfT9qS9+54jhVEmCX7oAcfw6fUOJghJ82AjVlioaejmfFriDfgq1AqC7Tt
 tLYC/FxWxmwChwzttO5J6CuIWkPJQQoqWoFeMjSJqgz0In8mhbWxhp1F6NyiLwj1BL9z6dGyTRX
 L7/11go/X9B2H+c37Dx4RMwFJb5p53L1RfJ+cc5Ub1MMcEhPFlxWk7LVM0QTk1T1sIszZNTiSch
 rRf7xEqCdXvr9Fpd+TIK7K7Wm11BCoErJWT6hj0bsWLVtyC3N+y5Pfk/nekv4/4e2hbWTQg3cQf
 MCAmbLzployqG0E87eyUpzn8cC9Zyu9YZs2rc1Mrc4ZHC7AJlaWEAPmoNfpCZVFKErcfVMjy0a8
 PPMvUe1+u/lpKCkXWSD8JfOk+mFkqB8gR2Kh+tMtX6hJHj8J05MZAWwknwQKHYYwAY6QKdUnk3g
 zOhsW95VFgRYFLBwwC+Cz0wjXr5kwLh4U2ZhwY0tRVnLtCw0DWHx6zGGwKRTG/YKbYQjDuv2t7S
 KoMdrL+EsQdcY+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022906_620825_245A21ED 
X-CRM114-Status: GOOD (  14.36  )
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

Changes in v2:
- Drop cpufreq/ti change: not correct.
- Drop soc/qcom/qcom_pd_mapper.c - objections from Dmitry and I think
  better to drop the patch in such case.
- I did not implement feedback for first patch to make the
  of_machine_compatible_match() matching machines in arbitrary nodes,
  because there is no such use case possible and no arguments were provided.
  I also did not use cleanup.h in first patch because existing code
  of_device_get_match_data() does not use it and I prefer uniformity.

- Add Ack/Rb tags.
- Link to v1: https://patch.msgid.link/20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org

Dependency/merging
==================
All patches depend on the first patch, thus everything could go via
Rob's tree with people's acks.

Description
===========
Several drivers duplicate same code for getting reference to the root
node, matching it against 'struct of_device_id' table and getting out
the match data from the table entry.

There is a of_machine_compatible_match() wrapper but it takes array of
strings, which is not suitable for many drivers since they want the
driver data associated with each compatible.

Add two wrappers, similar to existing of_device_get_match_data():
1. of_machine_device_match() doing only matching against 'struct
   of_device_id' and returning bool.
2. of_machine_get_match_data() doing the matching and returning
   associated driver data for found compatible.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add wrappers to match root node with OF device ID tables
      cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
      cpufreq: mediatek: Simplify with of_machine_get_match_data()
      cpufreq: sun50i: Simplify with of_machine_device_match()
      cpuidle: big_little: Simplify with of_machine_device_match()
      firmware: qcom: scm: Simplify with of_machine_device_match()
      irqchip/atmel-aic: Simplify with of_machine_get_match_data()
      platform: surface: Simplify with of_machine_get_match_data()
      powercap: dtpm: Simplify with of_machine_get_match_data()
      soc: qcom: ubwc: Simplify with of_machine_get_match_data()
      soc: tegra: Simplify with of_machine_device_match()

 drivers/cpufreq/cpufreq-dt-platdev.c               | 15 ++-----
 drivers/cpufreq/mediatek-cpufreq.c                 | 12 +-----
 drivers/cpufreq/sun50i-cpufreq-nvmem.c             | 11 +----
 drivers/cpuidle/cpuidle-big_little.c               | 11 +----
 drivers/firmware/qcom/qcom_scm.c                   | 17 +-------
 drivers/irqchip/irq-atmel-aic-common.c             | 15 ++-----
 drivers/of/base.c                                  | 47 ++++++++++++++++++++++
 .../platform/surface/surface_aggregator_registry.c | 13 +-----
 drivers/powercap/dtpm.c                            | 16 +-------
 drivers/soc/qcom/ubwc_config.c                     | 14 ++-----
 drivers/soc/tegra/common.c                         | 12 +-----
 include/linux/of.h                                 | 13 ++++++
 12 files changed, 79 insertions(+), 117 deletions(-)
---
base-commit: a4ebba34e722123f1c09ce3282e26f052fc8b27f
change-id: 20251106-b4-of-match-matchine-data-4a64bf046814

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


