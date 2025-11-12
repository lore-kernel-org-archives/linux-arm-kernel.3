Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E1DCD13DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSaK7KjpsRpJPsoshb/MU55TLjeahDB1ks0unKYBn4A=; b=Vid+XProYhdfPh
	dzx8uinPVoIDinA1wREV3Kw1iEFWjqHaHpWwJOzWfG1qi/17rGwGD2+he0PF5vX/pwMSow/+viuzq
	NdYwQcIG/KJD7ninl5s7Dnt/kDTKnqYMMa0qz6uQx2jCTyPc3GlM8zqQ8/zhx0RNLUsGmq65gIi6f
	CyTuPq21EqOG1isi/kuYylz5hDp2Zg3QGkTVPYFOYud6jGejaVvLJtDwWFRqi5P8eikIJlyzxDcVn
	FuNOjq2sFb5TX/z9LxXrLh0fd3/xcRyyYN218c9+Hw6+jfDNQmeqXdLpXC0IjjgP+YhPftLLfj+VL
	gKJSIFJCh9oTRlrUVLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDMN-000000099LW-0wDV;
	Wed, 12 Nov 2025 16:06:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDMK-000000099Ja-1JrF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:06:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47774d3536dso7625295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762963570; x=1763568370; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSaK7KjpsRpJPsoshb/MU55TLjeahDB1ks0unKYBn4A=;
        b=eat0byyQLNID/67SdGnhxXfGfnKxBuMkMeInCv6FWrijWsjGpC7Z8bhMmXgiixD+MG
         CiFe0OV/D/GpnqkT7RRvtKD6Z+7pmzfJYwme/x6uLvIXX158sx54Eutb5lqkyRruOvXA
         X+n16QBlaStiGtkopdkIuNQDji1pH32ITqc1vjUKxo1FZd7BDixE00G5LSCye/TjMqQr
         +tq0o/ztGRffV1ADk6JSpNuZRDPxJwPwr6Y+x+FCz0+nmi3Ec8qg+vb9D8L0FKshHKb2
         QB6akUwaawNUrtjw3W5uxGDRMwWklQJg/JAol+laEuBfdkhcDyhLVKmDUCISZVi9d+KN
         Vtmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963570; x=1763568370;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSaK7KjpsRpJPsoshb/MU55TLjeahDB1ks0unKYBn4A=;
        b=I/BO3gAUQEumFEIx077m9jvkPbJYZGd0iKOGaoS2tQskiKjbXlFeB0DF4S3wzESPpr
         uxHan0RjVerZ7eAwn1Q4LW5ucDTr0L7kIXY5adR/gi+Wno+OyDAEd8sDgJ/4aFfOJabj
         i8FweybEByVbVaxLPfklRy6m3RbBNNB3n4xznkBRHKE+ftZ9fOYQjG/tS8MsitEXEI4s
         qtJQgMw8CLuHU4G1lLbbmsA4foYgUNFEZi0BDgrOl3cdntyOo6Ock1im+n5mdv1RwjzC
         aaVWeoTu1MIvjrE4gwGrA/otTmDuebffAX1meh9/tRLyH1oKLvhSnmxMFCmNmwTUJDBF
         RW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3atb/9pdlgGVrezLvTXjMzjrizCLDDa0kHeLby1hG+c+nRUr69pGcMA4nUgoghZnhQYAua34o4fSHK3Jq4WES@lists.infradead.org
X-Gm-Message-State: AOJu0YxSmgTFenBOp6SDMdE+LD/HCHpeVxO+X5MlvpFOR8fi9hWWDg60
	Q9bwpHFFqJGduNH/ylZNh5quiCSPbuk+X0X50w+MgQLEk/Xt4BZT7dRlLlNveoVsymQ=
X-Gm-Gg: ASbGnct5ACSAGxm+j+js4/V2YGXAXIwvdBLqWoT8JI8Gjws55hRQdpaVH/BMUIcOpPO
	/TiT/uk79QousGb6WeP3IQXuYWeRB7MLd3j3QBlyZVWXlhlSFNMf/5YZQIv+4pwFCOA9TNyhOJa
	P2MkzzHk6q/+CGq87sBDrby1jZ3zrmr3eICp5NvvaRKV5jpoCJGrXEa2cD3NPlThBnndDH294kQ
	uKxPzYz3hFz/r+b8wJcefhhibZFhddJAu9G9WfwcazPmvHKidQhDjRAjixE+CV3QKQMitYZJ/Jh
	rh01okvLIQLcADQGCy+IIbfU909c9PcEs1ZBEHMDRNrhamvymne5HJQNAIalOnjo3mDIFr2jSRn
	EdbSNzYLTVWrqX4E3e6GhtJFKeGi+8EHGnAS3IUfMGqbfbHZ3hqLf/L6GiR+ZSgY+5e42UBAU1W
	5Ht6SAFi20Gr2vKEqigiFyeYZn3SjSLR0=
X-Google-Smtp-Source: AGHT+IG6rFzEcxKdldL8ZJSA90DQKBh2V/CJToGQI/q5NdQAalijEOc2BYKjbz+pmbmuHRK+JHR6rQ==
X-Received: by 2002:a05:600c:5247:b0:477:7f4a:44bd with SMTP id 5b1f17b1804b1-47787224955mr29777585e9.0.1762963570392;
        Wed, 12 Nov 2025 08:06:10 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e95327sm41226855e9.12.2025.11.12.08.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 08:06:09 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 0/2] Add new phy_notify_state() api
Date: Wed, 12 Nov 2025 16:05:57 +0000
Message-Id: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWwFGkC/3XOQWrDMBAF0KsErSszmvEkdla9R8lCiSV7oJWMJ
 ExM8N0rB0opbZd/4L8/D5VdEpfV+fBQyS2SJYYa2peDuk02jE7LULNCQIYTkJ6nVYdYxK96/sj
 FFqc94NUyd+iPrGpxTs7L/Ym+XWqeJJeY1ufGYvbrzrUGABEMMzdEhIY6jXp2xaVmTOK9hNd3C
 TbFJqZR7dCCX+V/f1lQg/Y3c+yhpd6Y0y+Dvo3O/G1QNeg6WO6BeRjoh7Ft2ydU4cJ1NgEAAA=
 =
X-Change-ID: 20250703-phy-notify-pmstate-f02ba5582f65
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1976;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Tb8QWBachEzK293/rkkaGX5QoR2WIIDvyetwzLPF/dU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFLBvBMKx+UST6zAYRGgV+Ns9aJTxOwnsxasX4
 V/1V6CwXvyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRSwbwAKCRDO6LjWAjRy
 uqy0D/9yeYWXP6i5RIKwe6GIAI0BWoqhXoXkNenwExXcitTNpZk414r9TMsa1jqI0fj3A1TSesq
 KQSB+5+FFomF7mRj4i1z4ToYS8GlrBPBwm9JufqwjzQ7MTcN71JzReyMtUSEj9EkVFto7Pz891G
 YWK6nTx+MqgDJcSZt2+DnKYJheWutFMpQVD4R5jHWncVFYj6Qpvlh9BOq5upOiWrIuvmzX5rV5f
 ISp9AMu2FnLKjQhM+S7qEO5pPVD5zVPiRcAm6kcNTeX04ZFrm4fXiAouRy2YL01IbQx+NDtj+zE
 RjELefMhdU9ZCALKPu7TAA2AFGq+N/0jamQ2epi8DV2vXIB5hHtZ0ie166LLLjAwScov+pSQs14
 nmRel0AunzcRbXG0lCkKaMDKIptSLVygvTa2RpycBbGMuil7h1FSRO97whzFuM1d4h+pvArvwJr
 Bcg2TqI8pzc9pHTKv2TJbcoe0PzR4J8V5h1GOzkkFd9N2EbVvLi/TjZZmCNaoejmCnstvGYcCmy
 XjmZjy3wf7f+g3i2Zvdz/V4wY2R4C1p0u27OvTi97lSSMe7Tdx7Mmnwc0R7kCiVtm+nEjVcEeUj
 /pjAW2PupbeOjVQ80H+NZJ+snaJN+X6fmmhqg3wuTwUne/3+7LEeEOEBe/OI3/lFidz3Ep710z4
 dRvM7VGm26TWWMw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_080612_381927_4A941542 
X-CRM114-Status: GOOD (  12.76  )
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

This series adds a new phy_notify_state() API to the phy subsystem. It is
designed to be used when some specific runtime configuration parameters
need to be changed when transitioning to the desired state which can't be
handled by phy_calibrate()or phy_power_{on|off}().

The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
need to issue some register writes when entering and exiting the hibern8
link state.

A separate patch will be sent for ufs-exynos driver to make use of this new
API in the hibern8 callbacks.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Add missing 'used' word in commit description (Vinod)
- Fix 0-day compiler warning
- Link to v3: https://lore.kernel.org/r/20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org

Changes in v3:
- Rename API to phy_notify_state(). (Mani/Neil)
- Remove inline kerneldoc comment (Mani)
- s/phy/PHY (Mani)
- peripheral specific enums in phy.h (Vinod)

- Link to v2: https://lore.kernel.org/r/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org

Changes in v2:
- Add new phy_notify_pmstate API() instead of using phy_set_mode() (Vinod)
- Link to v1: https://lore.kernel.org/r/20241002201555.3332138-1-peter.griffin@linaro.org

---
Peter Griffin (2):
      phy: add new phy_notify_state() api
      phy: samsung: gs101-ufs: Add .notify_phystate() & hibern8 enter/exit values

 drivers/phy/phy-core.c                | 25 ++++++++++++++++++++++
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 40 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 ++++++
 include/linux/phy/phy.h               | 19 +++++++++++++++++
 5 files changed, 119 insertions(+)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20250703-phy-notify-pmstate-f02ba5582f65

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


