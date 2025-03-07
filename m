Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF24EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sVCYZLL0PxN2CDTkTr7gzBPm/K6Lr1h5htb1NMheOZQ=; b=p2FX9mhCdKQDdE
	2xj6On8vDFPwxcgcBgaHXwxg/MwM/guenD/mqJZnnz2zZ77WWxgaSB2D3DrnsdElzgg6OnI/q1olF
	vxlzt/QvzGD1C2a9Ilyugmd+nE5uxKZpucw4XW+Hsn/ev2ozGXhwYH4Tbm77XQaIFH1r6T84M/N76
	ceXS8BIJQhOAda6+EVcg2bDJTuZjXITIr9QXufFjB7sfF2LgG92yU71HONV4trrf1ujOyxZRVZGpS
	E7rsJw10MKlsFjPEOBYyUdOrRdlKwdyMKNmMGBo/eY6s0IRzL1QKL/EnKtVVJdr+kS9jEfB03iRDQ
	5rIHnHrt8rHJtJQhpwVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVxv-0000000E40W-03G0;
	Fri, 07 Mar 2025 11:34:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUxK-0000000DsLp-0Uzp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:29:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso12976665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741343364; x=1741948164; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVCYZLL0PxN2CDTkTr7gzBPm/K6Lr1h5htb1NMheOZQ=;
        b=Z2pDY6pHngdYTfScphEbjgMXJojxwEcsB7r9DkJUkbv1Q23spmbfkG9kmAVRR+xAFs
         JSeid7FReUFhUhftHgV6MbECw4X++JSu4gWFpvshq4MKbzPPU9jDRywJRvnPITjblb/X
         F4YwRgg4yy8t9aM1VTrCqHBD77b7IrO+t4g/kgOwoC4bX9JxbzxJfleRmm9xjZINk+o3
         21DBYUmTYvbUTA0AhNvq56Wy3sl+cac+OGFtKj+ILwq435kpPBW5e0LshBYyfwYPZxkE
         WB0A+NcjQS9TxYW8LatJtmyBfQW3K6FcG1aDvwmuvocQzZydwNcCphXzc2YKl0G4ohf/
         bvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741343364; x=1741948164;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVCYZLL0PxN2CDTkTr7gzBPm/K6Lr1h5htb1NMheOZQ=;
        b=DbpRxJSCeaUm1duqjJ1DeJqubrxj0nR0GrkMH9dTrWjWQLwCHUkMtAwOzLEu5h0m8v
         nkVK7UjkN/jW6TUM6QI6Kb4QC/B74G5dkx6lWjH7RqnefJlsnN50QJLNaZhjhBJPzITe
         BNxUewmIpmfh0Z6FL1dDfyuzhBqfIGk5v7niDOMQOCAsbMiYX30qHUUVNUoD9G+DXOWy
         dpY9LJKPpjiA/0ddZCSKZiv/EiKzN+3UyGJWlv5Ey8WP3YYlwvJjpzVwRK1Mli4+y19e
         KrLnmBWxSJ7xkOcBOsD8XhPngV8gV3UCMi9/xZBYg4Vu9Lt2oJ0dJV86O1d+9Lplxvdh
         0Uag==
X-Gm-Message-State: AOJu0Yz2oCZmixjclONfUjzlM91ROPEcJSig+o7VUCg8O5YiaHc4GDtN
	AjBxeKdSU4Fwk0TwgYnrmgBVD0zZ+YrQ8JESs3+vzd0A5fTkSvqyUbriPZ3PwWQ=
X-Gm-Gg: ASbGncudPrJAvVHH8LlbOZvOvUd3+IeMP2vuwHSnPHFhWCwiPZck9dlkAORoUWoLV7R
	PVIMgA/hNkP7kESvjnzM54IeLYPc3HgXsKyLLGRK3vR7WSTUZY6eh9jT1BBunGD+BmPuSNaZgkL
	AOsmqYEAg8MMK+pFy3CHkr2NMDOtWHWaQhYSfCoRbwE9rNKTKptsb+Q/Ciiuc5kRZ5QuvlCA91S
	fdffFb+SROeIkCU8fzoxNmmv/HsYN2ZimAm+jZgMp/S2dKX/qrdaLsv+aNjyTnVEuKHdnM4UvgH
	O5KvF/Ydr2TpryVvLXZ4sUGhNFCDFfgDPFYXBVCKwXKxHhRRMKjcqN3tgZg40AlnWFpUyAWAr+4
	=
X-Google-Smtp-Source: AGHT+IEHa6kUt/xq+dn25f2syNI+XsfPksB/5LtSy2qdICevzWmT3fzjID8iFJtsA0jNgMPQs9MKwQ==
X-Received: by 2002:a05:600c:1907:b0:439:8e3d:fb58 with SMTP id 5b1f17b1804b1-43c5a5fe368mr24279375e9.11.1741343364442;
        Fri, 07 Mar 2025 02:29:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm49192955e9.4.2025.03.07.02.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:29:23 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Fri, 07 Mar 2025 10:29:04 +0000
Message-Id: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDKymcC/4XNTQ6CMBCG4auQrq3pHyCuvIdx0ZYpNCEtabHRE
 O5uYaPGEJfvl8wzM4oQLER0LmYUINlovcshDgXSvXQdYNvmRoywklBG8GidnsKAzTBp73C8xxF
 cixnnXFJea9EKlI/HAMY+Nvh6y93bOPnw3P4kuq5/yUQxwVDXDSGKyVMpLoN1MvijDx1azcTeD
 id012HZkTWAaZQSgqsfh3861a7Ds2MaqYQxlWQCvpxlWV4mkrrwTQEAAA==
X-Change-ID: 20250120-pinctrl-fltcon-suspend-2333a137c4d4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3384;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=iCQvNvrSUCbnUFJbDtQ5Q+slsxi7yRmUesQiJSr9k0k=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnysp59dcFeF8bi+BDvg8zdNdr2JC4aWKtQbXWR
 5PLmdsLeZuJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8rKeQAKCRDO6LjWAjRy
 ukQYD/4jJs2HzQEt5K9aXtxfYKahy7nUC8bA/y7SvNveZg0ZB2LiQAzUggdvLpc0sYwaLeDyw+W
 7VgDlv9Y43Sq2LQU7DBkrqGiIz9I1zdw2Sa768dJU+t4hicZveHo+0gQi9bYnSGJeqg1cgRZPKb
 qQ60iLx6KB10oRIxiu9Kf4liE8kQYRxza3T4y5t8t9cwFKhqysbzPBbVKnBlmOXvXtx9eZ5JMPb
 zPIVMkuD7jpCArp+e20WVkQ8O6qQRfPK/IuRLhLHgNnkdpVYYgnxvqJe5lhKOOgLGCTOjj6HQZm
 DzZRhFYDgT/WnWDn95tCk3axXfeuh/w8z5CcrUb2VHJWviA+wPQD/tpztLHG2xV8Dkr+3bgqom0
 Gdi0VtryZafXFJXBpDALq0zfs1HrFG1bFFdeBq0ZdfTId1UAKWuUxaERtmATLfUbrUsjPDr51sq
 EIyLbqlf3xovS9mbk/S1GOSU2np3dBHBSJJNXRAnRuZ6qy5GyrR3/NIOSzPHZEKidpRFcW635qY
 gA+bkLlUdDTDCr/zs+taHCtSEJrgZo4GqaSJi2GirQJWd05jVKaW76D4W8VuosrVXfVcmL6Efq+
 oVX7WvFXD9PVEiXEZRRzp+E9ZYJWgmQV93Hj6xVCZEd7daRmFKMui7rt12WEK+XxXuaTXoRpaib
 LpLgVdhn6s1UL+Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_022926_169792_46F829E2 
X-CRM114-Status: GOOD (  13.70  )
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

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- save->eint_fltcon1 is an argument to pr_debug(), not readl() change alignment accordingly (Andre)
- Link to v3: https://lore.kernel.org/r/20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org

Changes in v3:
- Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
- Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)
- Make it obvious exynos_set_wakeup() is conditional on bank type (Andre)
- Align style where the '+' is placed first (Andre)
- Remove unnecessary braces (Andre)
- Link to v2: https://lore.kernel.org/r/20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org

Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++-------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 294 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  50 ++++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  12 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  12 +-
 5 files changed, 318 insertions(+), 200 deletions(-)
---
base-commit: 0761652a3b3b607787aebc386d412b1d0ae8008c
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


