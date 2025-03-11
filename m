Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED57C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ccls6QlRwKxRURW2wbvi5fD6dk24Crfv3eaY7igy5w=; b=WJraQH3nlgUJjOlCnEllmms2yW
	0D8NK9geYtSrZ0X+sIMnyq9eVqZfiXCq9xbLJbMnKAOjIa7XTNevCyQOI6ST5tH+yPn5/b9WIyeX+
	tJWRVoDPLCPR8Ti/P94UYoOx6MhHpMpmv6NADcTgo9thwV4A4R1/MXYJVPJbpwvjxZVK3FmaqWrg+
	gOS6URFYk7TE2FUVHGR77L1YOY/SBZoSSmoG1HPz74Bj86aTlxryXU6Afu79aJOdKYaDM8Z7IZD8e
	dDKW0+B9KCO+s/1J7OnhmJlzOvjMcupVF7tueW9iPwI0/RcQkjTbyLR+v5ikueT0lq9BI2xFF9Gwc
	89C4KilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Bf-00000006bO3-1cSe;
	Tue, 11 Mar 2025 18:18:43 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3wW-00000006YG4-0oal
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:03:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so176610966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741716181; x=1742320981; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ccls6QlRwKxRURW2wbvi5fD6dk24Crfv3eaY7igy5w=;
        b=Pr1U+Yc3ctQ9IdxeA4RopVQsphcmoyV+BgR6VEv/bLC4wv+DUTm2pLrJj6TibZ6wix
         mfMUYbFnytxsTBHBGB/xRexJGiC+1rMxLAugGAJK/LNr/R/EoYULNbl1tGuybnkvPUgA
         UrclMmSU1SWgTdMGryJg5FG88beNUhwOvE5gp/fUC5t2BI4Swk6Se4QV3cg4aNPxAINf
         /YGHLuNrmvHxkfBFxFyKXU+B/xr+wl6+nXrJrWfzqmZhIflinymlx/EgYBi1DEP8IQy4
         X+PT6NcZkwoy3uc1iOCEg0kXnGlWG+6sSXst/glc5nuEpz8vJ/8+txbbIqpyRc4Bfv43
         E5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716181; x=1742320981;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ccls6QlRwKxRURW2wbvi5fD6dk24Crfv3eaY7igy5w=;
        b=HVoR5hc824QbqVQggqZhYwwIn9qHjio1xn8LdmNgEwKOn3T1HWTGxmGFytRVOB17LU
         Nc63BW3V1WhLgjObQPXtm5kMfJmiyj0LR6J9tG5rU/SVLtWpSalz8azxDnWBdn4fKvyD
         qLToePmqvNsvCtYfJ2vCl3Up8NqFhLiSdVjINCpLSEr31fx3BU5EN2348UOzvatlPrBb
         HtCJlRB9EPE/FO8cqmZq+5nxafc7S+NDa0lNMtbR+URDcyzuAuhTR9CK49ux70rbMExF
         Oj4b6/yJ5lbHliVwnpWjYpPeChCSzFV9o6/nFJtgwT5VzqzoqZemsxDCtZPWukO0Axny
         CbQw==
X-Gm-Message-State: AOJu0Yz/P+ksDauM3jJSf68Y5MvN6bSp15dNrHXSmc6dDJKu0uFg+6a/
	qK+DCQmOmcnBABeNA1KL2HLcMBjujhbY9qX2hWhHvfMfWwYb8rqy2ApMdq9Pru4=
X-Gm-Gg: ASbGnctmg8gV9Z4DjLsGdH5bHG3j0/0v0eaz00GOtsL7T9C/UOy1EelueF1AK1cWT37
	I5SXZj3l5s0GjUHXN9YgkcIXh4ZgSgmdjEvSJbFjTwu5972BCLXepjeMpTyd61V1lU1YvkREn9R
	YiCgcoafIzsP+UU/GL2fL9ErsKVUczJU6R3LAxvfZIda5H872/MceraBsp9dNu2IqAvJm3xFFRn
	zPmCl9YDF6LReYiQfeqAzfrmn55hERLxMmbT19jNLjl2sYdAFCLYCnYraaxQUL4xb4C/u+OHCu8
	jYSqW+xHN9YeuxNQjNuegTo0l6MpRqdL546IAepxIEkyjrdu/cuSgcs=
X-Google-Smtp-Source: AGHT+IGnY0H7YzlXD8CZSfCox70QPKmTLZoV4lqMqMMxiyALS3HVvR/aMstzphLmsjj59KVicmXt3g==
X-Received: by 2002:a17:907:1c24:b0:ac1:e1e1:1f30 with SMTP id a640c23a62f3a-ac252fa0c31mr2141888066b.38.1741716181234;
        Tue, 11 Mar 2025 11:03:01 -0700 (PDT)
Received: from localhost ([185.194.66.242])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac2394894cbsm957805166b.70.2025.03.11.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 11:03:00 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Tue, 11 Mar 2025 19:02:56 +0100
Subject: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
X-B4-Tracking: v=1; b=H4sIAM960GcC/x2NQQrCMBAAv1L27EI3UlG/Ih6azaYu6KYmUQulf
 2/wNnOZWaFIVilw7VbI8tWiyZrQoQN+jDYJamgOrndDfyTCn86YvB9zYHxzemGQyMmiTqhWJTc
 24VrQf/RZ1dAN58h8OZEngpads0Rd/svbfdt2VwwgJIIAAAA=
X-Change-ID: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1644;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=TSHmhqZwyLnRao31ZE/kuynrWIfbFM/u9czNvOIv9MM=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn0HrQzl89Jaz1kNZJdzDGOQWcFYbCljywikz7i
 iJbfuU8tICJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ9B60AAKCRBjTcTwaHBG
 +DL6D/9IB7zq4cq3vY1Uw0waKJ/M8zCahI2LFsClUcFcgNnupikDLQ+SmcrOS6iYWqy/YcZQoD6
 VT3RQcN9OCgdeYSkAuhR6fXeN8GGJgiZXkSHWC/pn6M4exxHBGjRgn2i0cQqaMin+hW9G60fI5K
 L9aL0T/EP/MTgglpTKzhy+95WWh2JGR9hTXLfcSgen6fX/qiMIMsEKwtW24moUHMD9D4wb73+mY
 4scWoq5pWJ+TuVdpaurhAxFfRwgOObeiDEsRR+pqqU6iom1pTmV5cA9CpNaRjhmUNGnTYB0uqV1
 iBhsy/R2yd8AsX+Jrz52OHGpqmxa/+jJPFc20S7Tpx/aVmvvzXo3JkF4Zhfc7a19JEW8smZjJ5n
 3Scp8cnscwYBiVIYopZZ6HMjFsA0V5KXoOacBiqnXnw1CDHs48i2ZUoaF5R6OAkR2ueArZm8R8r
 kgGKM3zKTVdqsFWN7FAmx9x4aWY0omSWN+IY2TWvUOtA8NMJnFuKmFwu79SdpdKj84yxxZOKGKs
 49HqauXRI+g6UCm0G60qdDwWUqHqX65zjMMOS3vMwVUjVd3dbDS2uEnQ60Zuw6UJyQr0gZ2wTCK
 Cl/4MRMdb0P3wqr0E6eL7aZGJJixWG+nDMMk9R0t89eRki5HOd73rNgzb56w97aUAhQoU0HljoI
 CT5uZJChxYybamg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_110304_240801_A9057E73 
X-CRM114-Status: GOOD (  10.31  )
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

Currently some Qualcomm interconnect drivers are enabled
as modules which isn't overly useful since the interconnects
are required to be loaded during early boot.

Loading the interconnects late (e.g. in initrd or as module)
can cause boot issues, such as slowdown or even not booting
at all (since the interconnect would be required for storage
devices).

Be consistent and enable all of the Qualcomm interconnect
drivers as built-in to the kernel image.

Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
 arch/arm64/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
-CONFIG_INTERCONNECT_QCOM_MSM8916=m
+CONFIG_INTERCONNECT_QCOM_MSM8916=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y
-CONFIG_INTERCONNECT_QCOM_OSM_L3=m
+CONFIG_INTERCONNECT_QCOM_OSM_L3=y
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
-CONFIG_INTERCONNECT_QCOM_QCS404=m
+CONFIG_INTERCONNECT_QCOM_QCS404=y
 CONFIG_INTERCONNECT_QCOM_QCS615=y
 CONFIG_INTERCONNECT_QCOM_QCS8300=y
 CONFIG_INTERCONNECT_QCOM_QDU1000=y

---
base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


