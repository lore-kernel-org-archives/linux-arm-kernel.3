Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A24CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dV66bSO3p7CPdI7VDIr32ThJ93exQDdyBO//zJP39OQ=; b=qi1sRVMx01EAhf
	34V43+/BXtzWPsEhBIi3FCNMfbi0USJVpQsOSKaHGM4cLfeyiQ6xTNCEE7/+uj0CNCRji91BQFBzt
	dL/rpkxgyiYmaMTPph03pUfpJmbeJmlq5xYP5Qfp8OaofCY5zt7cFl5vjvzdXjhCCO+3jbz6YGBX1
	qOGzYrvIuGzZpWD6qT+W0VikWfkd8tn76cZl963BFS5dcNvaNxouOelJJGzKD0qTaOL80ZL0zHBgp
	78z7Stb2fZakBPFmMPWio0XRhJ4yaoe0MYZxqeSwcMNuYzW3htDZauA5AcxH0awIcpdg6XhvXQSGt
	Ns8wxRYWBmoaz0oP6deA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYCI-000000064tN-2gCx;
	Tue, 04 Mar 2025 19:44:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXGx-00000005tOd-0WSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:45:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43937d315abso6388775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 10:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741113941; x=1741718741; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dV66bSO3p7CPdI7VDIr32ThJ93exQDdyBO//zJP39OQ=;
        b=JddLNFwkgyI2GpWjinXD8T73EvKK8uv/Fq84gKHoAAF+I1rrxQVRlz/nBgScpTJKzB
         xNuPj6Qqk7b0vdBVtaCR0gl9yDcAMIpTWE9X7aX4OZhpeJp5Z49koD2ZHIOGMm+Uh6IS
         w8ptRpkXEPvae7KJdX92X3PaZDhPD2p/LU5OLAoaGw6lLZipmvIlrB1GdjzUqJZBpkYb
         wJNtNegk3sNUbl0/op3vMQYVk46Xx1hX/ctL/l5RbPpIHBp4iH5iiV1F2J4tXU5jMti0
         kSG+yZcrg/C8z/7SOVyQQv9mTG5XwZECKYdtGln32J7sbfUz8yHxHTrVR9xxWQyfSwfm
         /2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741113941; x=1741718741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dV66bSO3p7CPdI7VDIr32ThJ93exQDdyBO//zJP39OQ=;
        b=olSukirVmQLryYbV1t8O19oYTD4UVw/dyDbaOPQQsK8B1eDdtbRLp2yZ5BlUy5XJa2
         1cpmhrqXYDi6R5iwoHg8B9lh40XjQIpO05Hh3ItBjUK7YgDMvdHjPU+fJKaVVxR8YZCh
         cURVxDImV6QzzOgHcsNC/khCQNv+1h4bOe3BsEN45wP3gu+QNQ9w2g579M6h4xchvVI7
         RHwfvjxSo9FnIn4b7AlxbUD689ljDVpV86ZN44rZ0vfx+LNOcl8kPqTQGMhpUJPR6oPB
         UGG/xIojlrOQcHBrPG89dbZjnkhUF3tioMfo5URYOG2Wv3jYNnJIx6CJ81ZdBhNKxiVY
         7f5g==
X-Forwarded-Encrypted: i=1; AJvYcCXNxGGkZUsEDQgDWQo4Yu4InPdDAlgGlAEUbhnWOT+kLhZRJmVExbldLFs6ciPi3qZxc5P1lk+jGko9J+Huv3Ey@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6eSxPR5uTzJGe5bP8JNnqIO0pdITiEL0PHL3/FRUokNBqo2pZ
	iZa9kULHI8Yq2DyncEkxBDr8023hXhq1vEQogzTA5LP18EB4H6w3DRcS5k66fjE=
X-Gm-Gg: ASbGncvaBw7UEkShVbrdoMsghgrGRWNWdhwm/bs5Ju+ATiSu8lhKnFRQIvrAvbHM6gr
	KXq1ryF2PIdLmS0Rdbq5yfXSdm8/EMKY8CoMx2669ecZZOibwprnNSg4KbEoKY/mW+qAVhOYXPW
	AIFAVuPtvGvHglED1lvdmeC477JwEAkrnsaMrOQZknOYJt6nbeJG38zN60AyADDUnuy2wt58F0T
	jNN7nPQuX8AJIPUDLv6M297QT2UqzuT/heVOaeXbOStXC9GvuqE4l611T95xXV7bOHjSUwn2YQ6
	mhakKclBskkA49sPm1fAumtSl5CW0VdZkH4nTKJ1tBxyFvrIN51eBu5vgMGb
X-Google-Smtp-Source: AGHT+IHswIEyCJXZp7woYZZuJpnAXAHgU63OvcCGWQJRtFTY7jo4WjlXR0PIT3yu2UR8Js69fWovDA==
X-Received: by 2002:a5d:5850:0:b0:38d:e0ee:bb8 with SMTP id ffacd0b85a97d-3911641410amr1370787f8f.11.1741113941249;
        Tue, 04 Mar 2025 10:45:41 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6ceesm18229985f8f.45.2025.03.04.10.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 10:45:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] clk: samsung: Two header cleanups
Date: Tue, 04 Mar 2025 19:45:30 +0100
Message-Id: <20250304-clk-samsung-headers-cleanup-v1-0-81718e38246e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpKx2cC/x2MywqDQAwAf0VybiD1TX+leFh3owbtVjYogvjvB
 o8zDHOCchJW+GQnJN5F5R8N3q8M/OTiyCjBGHLKKyqoRL/MqO6nWxxxYhc4qTl2cVvRU9O3IVh
 YE9hhTTzI8dy/3XXdYx3eU20AAAA=
X-Change-ID: 20250304-clk-samsung-headers-cleanup-c07b8dd50360
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XDngEG8wtWQvhvF3YrSeK4X7ZGTxQunF/E8GOiLPgSs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnx0pN00BqtKjo8GLAIBcX4Q9OtViT91hhZMDba
 VZfjobaseqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8dKTQAKCRDBN2bmhouD
 14bHD/9SLqOUAS4O36jLepNIa7itVCkJE3SddDL/7+JXCH/HT/7ForYiv2Pw5ZCaP5FQHVs8rXv
 j8Wrrkh8F7rt6Io4KRK18qE84K4JC8GwEUCvG+TmryeajaUS6vg8ElbZ6zAHXeLIneWknMH6JRO
 xtciD4Om3JIXD0eWluwV7ZAbi4DYV9jhxZcY5YwXmJI+a+VLCbDSkhaJzKl/fwZO89r9FqXgpQb
 iJyp2P+UW+Wb1PyC8ZAJw/3a7V63Icadc/mzUKTiAQEqrHcPtnu2B8jwacPdrlo6bMuvT395Dq1
 odV6qdKw7WxIe5WFczs6dPRsn9HIOqMU2xKT4w9nkCBzBfTbR1Qqezp+DwcrYRTiNFUAaJeVF3h
 FwZ56GXbkyA+VtPJ+TqrLqVesOupSNLGsA9iNdxC1DI87ppon7f2/dIWNczjUhPAfsEdTCXe+j+
 GL9QRA+3ZvVi55tIjq95uk4ewxdWdALQ2L/n/7dLD1TnhazHewO1d/vOyJa3Pywp5HqBwDSKR7I
 8Kavj9bnXIyPuZUfXzn+yhFILJkyzY69PoYcXnCKIbD2WYWgMRuxKjU+o2AU/o80c4IUc2JGS/j
 Fke330DMu7cmYQ5rJV5yKYEXJhEZnVByMY16vLOw1jYACHQ62ZLsWqcXe9gH7H4iScZtUhzU4dC
 7Rdfp5W1qrpPmWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_104543_162998_17BAD925 
X-CRM114-Status: UNSURE (   9.47  )
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

Just two cleanups, no dependencies.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

 drivers/clk/samsung/clk-exynos-audss.c   | 1 +
 drivers/clk/samsung/clk-exynos-clkout.c  | 1 +
 drivers/clk/samsung/clk-exynos3250.c     | 4 +---
 drivers/clk/samsung/clk-exynos4.c        | 1 -
 drivers/clk/samsung/clk-exynos4412-isp.c | 2 +-
 drivers/clk/samsung/clk-exynos5250.c     | 1 +
 drivers/clk/samsung/clk-exynos5260.c     | 3 ---
 drivers/clk/samsung/clk-exynos5410.c     | 2 --
 drivers/clk/samsung/clk-exynos5420.c     | 1 +
 drivers/clk/samsung/clk-exynos5433.c     | 4 +---
 drivers/clk/samsung/clk-exynos7.c        | 1 -
 drivers/clk/samsung/clk-exynos7885.c     | 2 +-
 drivers/clk/samsung/clk-exynos850.c      | 2 +-
 drivers/clk/samsung/clk-exynos8895.c     | 2 +-
 drivers/clk/samsung/clk-exynos990.c      | 2 +-
 drivers/clk/samsung/clk-exynosautov9.c   | 2 +-
 drivers/clk/samsung/clk-exynosautov920.c | 2 +-
 drivers/clk/samsung/clk-fsd.c            | 2 +-
 drivers/clk/samsung/clk-gs101.c          | 2 +-
 drivers/clk/samsung/clk-s3c64xx.c        | 1 -
 drivers/clk/samsung/clk-s5pv210-audss.c  | 1 +
 drivers/clk/samsung/clk-s5pv210.c        | 1 -
 drivers/clk/samsung/clk.c                | 1 -
 23 files changed, 16 insertions(+), 25 deletions(-)
---
base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1
change-id: 20250304-clk-samsung-headers-cleanup-c07b8dd50360

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


