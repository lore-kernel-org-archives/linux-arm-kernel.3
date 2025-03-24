Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BD7C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VIXMyJcelbL95lk5i6cF7CMMxgNXH3YnFDanO5WuLy0=; b=h6jYlFUF2BfO9C
	Pm18K62T9kSDo1aAi3TEuYAiTs+fUHRvcia+yqgYDkw1qFe7TJJAD6PZ1hvTCOPy0rqMWKnvBw05t
	TocmrHWVwL2AZtA8zsYU1J5Fxt+sYmDBYF06S02CJahpWhyRBmdXPg0iJohMZuPJgl1q4Lqn5BYxg
	MLArMdVdMXJl5ER2JhUtuGt/IfLHgvythAj8yBrdS6NZUi6nUEe3oEqOM6CDdRRlDWxs8kJJSXvsv
	QDEnIUasN6Ussi8UyrSFSXITHcDGu0sk14BQ2NOKLw1YmfnHrz2bhMWzjroqauC9WBtFYDDrY32CD
	wZv0VsHIOQcVVam2eLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjqL-00000003XJu-2N4a;
	Mon, 24 Mar 2025 15:36:01 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjoc-00000003X7P-3IrN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 15:34:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ab7430e27b2so951887566b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742830453; x=1743435253; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VIXMyJcelbL95lk5i6cF7CMMxgNXH3YnFDanO5WuLy0=;
        b=fTCBScSqqyHsepdIDH3yXwQ7GccTEeDF5uUyMPr4LUHPVc0uM14MnZCukdUP6oMKoJ
         kzAXKUP9NlAQ7pXXyE9XYw2ZxMtzVDntyZ+ci6b1LYJHrBKpJhnrVrmEXZv4YjSxURiK
         CKx6NOPnWBXffckx16WJ/a+xRormRzesM0iAY+rn825fM6ICH9SmxPeLtcNQLOLYwEP2
         TLdeXFLr7KYIwBUaR+P8k89cRoNbP/RLwKzstdYo9tFNjw4rcag9wz2AYJ+cx4GB010d
         DZaC0K9qkwy6XhAlFLMDpc9piK56qem5N3s1OTNSMSNiJbSI7F6CmLbHBIMGcCoT077h
         fKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830453; x=1743435253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VIXMyJcelbL95lk5i6cF7CMMxgNXH3YnFDanO5WuLy0=;
        b=IUvxpXBXUp8SpDainBRQovUkVe+sYTTjSr6ldC5fj8hcAOykZYyWlXHCkTDHFCzk79
         N+ZzwpGT51bu4W1u0Bt46ptieH2YAGteWB3/NlZzOTWP59RpvLaqFPihgTR7OdEsAi0V
         0hhlyczV2C1MGK2VAS95dx7/vyjgcmQOM/gp2qLCKnF7XmzuYbBVs0Xqtx0xddx1xtBU
         wBqgMdCOMTaEbwee66aebUyNXjaHlDJL9hu4trrg3lBtKeNqjArw2aX6uAeHkunRV8+X
         +XxySs+hoKrWG50L0NIyCQDh2N3h24YnS64xKr8ErDWpm8s69uJqmIm8TnUvEqoPIwU0
         SbVA==
X-Forwarded-Encrypted: i=1; AJvYcCVqghuDwQV5OUvN3JraLtq5S+ynf9Ju0PYJ93gPvs4Rb4/ojSV54IJyDBrQbH7IRm8NnSQSlm9AmhZ2cytSCaKg@lists.infradead.org
X-Gm-Message-State: AOJu0YwstKkq/e7PQScm9PNJL/bzXWR+TqvmYDW/6KvW+YrO/SoxiviE
	TdE0f5NLMUyX9tfqpiYHEqtMgKmazHcDZ0lFesdFbxRFW8xnZ7dDSOzTYGhSCWr5VXlzdWLX479
	rojE=
X-Gm-Gg: ASbGncuqnUKaeY/D4AlBeCtYK0jazEGNUTbf6Z46TprXOjWfSVSCDjlD01SBnrjrsSv
	/g9ePtIxjrRfhD2fTVHPjaHV74TJENM+plbVoEmD5mtyW76e5UphRaatkhFl+FhXLyI/KpVNiij
	Hlvi0tDEEsiEvumcfJt++ynP4F3ORqNZpBMJfgx8GRVOnLCrQx0+BL7JyqRKBe6cUi/EXNMIDnm
	cydH5bqTitCQr4qmwowDcULLTS2Ky6ftAjhaCrUWeMWYTc1YF+SPdAmSjN19PKSCq3uR77LAsGd
	KSheHAFSaNq6EEglpqrwa8mUlxAJtpHMRiPCWUwY8nzOQp+p3UaB6W9kHiLJzLqGMWJ8EU2/6pF
	R5dxY78FMwv4E7r1vPS8sodaDlvHk
X-Google-Smtp-Source: AGHT+IEAgyYw/lVqLDZmI/94VMcCiHl4tz0Ye4f3LeTmnsdRF9wIxE3C8ACjWz621GGbasA9tr0kSw==
X-Received: by 2002:a17:907:8694:b0:ac2:cdc7:fa61 with SMTP id a640c23a62f3a-ac3f22a030amr1409182066b.25.1742830452932;
        Mon, 24 Mar 2025 08:34:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm690219466b.31.2025.03.24.08.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:34:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Date: Mon, 24 Mar 2025 15:34:08 +0000
Message-Id: <20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHB74WcC/23MSwrDIBSF4a2EO67FB9bQUfdRMjDmmlxoNGiQl
 uDeazPu8D9wvgMyJsIM9+6AhIUyxdBCXjpwiw0zMppag+RScyUFs25bmd3jSo5xpYzRI9cCPbT
 HltDT+9SeQ+uF8h7T58SL+K3/nSIYZ37sezNOaPAmHi8KNsVrTDMMtdYvaPIgl6cAAAA=
X-Change-ID: 20250321-acpm-atomic-033775b051ef
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_083414_836974_E5E53DA4 
X-CRM114-Status: GOOD (  10.60  )
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

One user of this ACPM driver is a PMIC driver that needs to communicate
with the PMIC during late system shutdown [1] and at that time we are
not allowed to sleep anymore.

This series address this by switching the code to using udelay() in the
specific case of system shutdown. This approach was inspired by I2C's
i2c_in_atomic_xfer_mode(), which has to deal with a similar corner
case.

Link: https://lore.kernel.org/all/20250323-s2mpg10-v1-29-d08943702707@linaro.org/ [1]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- add missing ktime.h include
- switch to ktime_before() instead of !ktime_after()
- add link to user requiring this change to cover letter
- collect Tudor's Rb
- Link to v1: https://lore.kernel.org/r/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org

---
André Draszik (2):
      firmware: exynos-acpm: use ktime APIs for timeout detection
      firmware: exynos-acpm: allow use during system shutdown

 drivers/firmware/samsung/exynos-acpm.c | 35 +++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250321-acpm-atomic-033775b051ef

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


