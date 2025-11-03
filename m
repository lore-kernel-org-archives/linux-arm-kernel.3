Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73F6CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L/IH8GWzke7o+9XH2ahN9Fgm4JRQMZZpkq9Zw8W23zk=; b=DO/829uzoZ4Kop
	u+LxYuGPlzMgn72qKBTZ6EbAhrtjJ+ZKIMhl+JPvqAXzL1Tg1lV8CVpDgkB9IqKHFZc1dVuVh8/TL
	ZwnBpiEYMqPJbWFF+RMcXOBUwN9zws1f91PJmWI4ffabmZKN9wMtdVgxwx79iOQhT6WjPMrvGTtMd
	iCQ8Ibr/nPm/3C7UVUfaDsO/E6Zm9nZfGOC9HCzuWYAo0uuzgQrHSwF95RnXDpuf2BDzruPGN21DR
	bodiKvAbdRbWfn+GV9MyfzT2MNRc80NGYgvfTSmJiOC5PMI523emyvim2IR8iTHd/TgEy5/b9/Oea
	8yEp4OUJAAMVxnRjPtPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpX5-00000009PCA-2Prp;
	Mon, 03 Nov 2025 08:03:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFpX2-00000009PBB-3gjE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:03:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4710022571cso39019835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762156995; x=1762761795; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/IH8GWzke7o+9XH2ahN9Fgm4JRQMZZpkq9Zw8W23zk=;
        b=phpCcxFeolQbKOpKKVlppTXKDKByHhMbOCF32wmAu3wnFS9D05l80a4ohQK7tj12IH
         e6XBrhPMbSQopU5Nr32+k/lhZlrs/oD+4cY1C8L6OlWAIRepKxfum02UnzJyxj26QQzb
         yXBwewDvy4zJu2AzPH/0gETUuJ+699Tl+JlBs2hh5OIEsdGtNVagakd6Xij+IZSblHo2
         utQ1iirbGSCyHAzUw81is5m625xkoYJIX3FmMl91Ii3YF1S2HeC4+DI3RivkqaYOk8vJ
         DV3n1jPnLMzJP8AqMAikVWlhziJeUTxon4nuS3n2mRxKllN1H4yTsMBeu2bsysjNj/8y
         a/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156995; x=1762761795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/IH8GWzke7o+9XH2ahN9Fgm4JRQMZZpkq9Zw8W23zk=;
        b=DOODsYyokmy+INHqj/BLwpXXS7jDH8OS5HslpW71uiPSK4zLXVK2o7srlRthoyqrdr
         zmObzSEKYsbSd57Kv36WSAehAQ15UGFsc1BzO7+6Qat7VXFgoU4JZT3BAYaDRLLCPixJ
         dQsBZJqYI0y+jXuvfrsEY5+o4kAvDkeYXGlzejrsDZ325S+vWoCaUIIEVsVzgetm9eG0
         dhH429qAdKenyuP5jW36IUKKu/4Q26dfBum9dE6nq+RFWpmUy8Efp4fJsrvUCjduZeDr
         NVcKeDNF49w36VIVe5o84rzLD5GWGHjVmJeUODbDxdhWkm/FcfoXhv+Rn9dAf8ws8ZNX
         BcVQ==
X-Gm-Message-State: AOJu0YxLtyeg/hJtSr27Gf1rDlU4n2HH5/gRKWhZLYZMiW5LwwqWuNJV
	VPmYGp+6xwlezj5LftcGgQhuAolsUGPFzAU6Tj930HHmzJxqsMdmwYQXHTElZRiZG5o=
X-Gm-Gg: ASbGncsV5ZVyDJhw+paIfd6PH4OjsdufX95OcAq6A6ZpxcAKD3oS7Kc7ilqeqzf/dHF
	rBk2bzWoZKn2TK/mJLCgjJl5y+kakUB/QX86E0tHRTD4gT939TNAeiMc4c4aDR4YnURoouC0mQX
	Quvf4ICUWDAkaWeAnvZj2AGNi17+BoV3jz7/NtIyuBAMBfxzEVfd8NPngIIfnmfAEhxzWjGeSTx
	6FPoy+0dNqeZtDBs5em4K8fWCr3/cs18tMkDI4Ip9Op8GZruB7WKTQsHIwwr9W+7Y64wBxUf4UT
	z8o/7NXWHP8dsKnftUiaTQmSNV6uwyolM3D2Xhi4Yt68YZ9D0kBI8Fmz1s/LzvSzOUG7X9k6hbv
	/2bbzInOItG2WOjXlpa5Ls8WVHrqc+RbGrQWIWACIcuN/hAFQWe5DFkVC5HEaK4RjvgaxNxyzTF
	tl4/hAfxOqG9CauKkQzatV0YabUJcLTtl5AdEifhjvnw==
X-Google-Smtp-Source: AGHT+IGE6c8H6wBz5xIqW//ZckvXkI1XYLT8wk/cpBvfubK8j7fG5RuGuBsFSian/icYU+pzc/KE6w==
X-Received: by 2002:a05:600c:630e:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-477308acfe4mr107228955e9.37.1762156994866;
        Mon, 03 Nov 2025 00:03:14 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm142336215e9.8.2025.11.03.00.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:03:14 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Remove syscon compatible from google,gs101-pmu node
Date: Mon, 03 Nov 2025 08:03:09 +0000
Message-Id: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1hCGkC/x3MOw6DMBBF0a2gqTMStkyRbCWiMOZBpvBHHoKIE
 HuPRXmKe09SVIHSqzupYheVnBrMo6Pw8WkFy9xMtreDMb3liph3cIlf1p+GnDjkWPzG8zQF97T
 eAZ5aXioWOe71e7yuP+t3HbtqAAAA
X-Change-ID: 20251102-remove-pmu-syscon-compat-dbbc492a4eea
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 dan.carpenter@linaro.org, arnd@arndb.de, robh@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=coLNq6UgBEJ54vtaDH5/Y+99RZcuZu3NnE6pznoVHXw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpCGHA6lXimYaS+RG+z/Z/H8ogsAabnPPFrp2CX
 MJNuVr+FpyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQhhwAAKCRDO6LjWAjRy
 umxNEACX503fKhg2AMKQRDibcYgVMIKHsDkrNclZQSBFNFA7K4CQBm51QUnarXNgC1NXNhqPlF/
 RL634e3JtP3iRMQFBRP/CMwebcUNX6cdYPjczSwB1fmekHQN4RGOWsoDilTyFLS+UyC6Nyrmx7e
 8Lhsb/UkQnr5i+P/plM1hQ4J4bK+whwURLEJdWDQU/j4gCFQh7PwEfhRCTy2KTv9vvkebYbXGSf
 Abz5lHMcPnXLH2k6i5wYJxvmdMJXjt6TN7nymfu78Ijqtk8xw9wtv7ual4qkskjjIIG3L+b1gui
 qOq8lVi3LVDMoztzyjfY/8UFg8p9XfEPF0rjYmbTnVVXyxtTHaYVY4hgN/o8fvjxYZ8T5Le4/U0
 D0zz7f5isA80epzaimEssF9zKMZ6o1dcUmV/Bz3HBNvN6MzFA67tJLmi+ugxsO07pN2CPTCqkPw
 ReIEC958wlTLWcIHJFRiPAnFrQSC0p2QlDO43eTKasr8DOwHs7rJlqlnQASpT5YQHDONAN8XfsU
 5rOG/t5r6ix9Ej+83KS0vL5jLrxWtFjD2Bk9N69hzJXoxTr4plOhY+/fvoP/QCoquV/dVeSGE2W
 BtQwSERkicsEdIEyPibIgTxzDKNrXxChqi7c91O3YStuxyeMslAOCOlcoPLd2PmTq+FUKojLRDV
 Drq/8JU7jm6VIHg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_000316_986631_48EA184F 
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

Hi folks,

This series removes the syscon compatible from the pmu_system_controller
node, by updating both yaml bindings and device tree.

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

As noted in that commit, it isn't really correct to claim we are compatible
with syscon, as a MMIO regmap created by syscon driver won't work on gs101.
Removing the syscon compatible means the syscon driver won't ever attempt
to create a mmio regmap.

Currently we rely on exynos-pmu running and registering its regmap at a
very early initcall level, so no mmio created regmap is returned. For
pinctrl driver that runs at the same initcall level as exynos-pmu today we
have a custom exynos_get_pmu_regmap_by_phandle() API that supports
-EPROBE_DEFER.

However with the changes proposed in [1] -EPROBE_DEFER will become
supported in the syscon driver directly making this whole approach more
robust especially in a highly modularized system with other drivers at the
same initcall level. We should also be able to remove the custom API
referenced above.

Technically this is a ABI break but no other platforms are affected. With
an old DT we will have the behaviour of today (rely on early initcall
levels). But once [1] is merged, with a new DT we will benefit from
-EPROBE_DEFER.

regards,

Peter

Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (2):
      dt-bindings: soc: samsung: exynos-pmu: remove syscon for google,gs101-pmu
      arm64: dts: exynos: gs101: remove syscon compatible from pmu node

 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251102-remove-pmu-syscon-compat-dbbc492a4eea

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


