Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47ABC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IbefRUQKW2oql/88hpKv3fFad6yESLUR8BZTv5IsOP0=; b=SjmA1t4PBCNM+p
	YnaS6/Ud/LQ5KJOhdd6oAIZz9jedTtVkt+sn4+q8t4zsVQCdlgLkDv5OsuWvRfgy/Oxs9obXapbls
	N8hiCxcDpP/14sljKg/Oq+mxE8J7xLgqx4mRMI5RjvbjBTa/GaZzDb04xiswN0EWS8bXWvwyvnzgy
	qs+Z29c6wLXIY7pKXsHDC6emH7I0K5VkDcdDYrJqdD3v5Vz0kNvBOVHRR/2z53bdKtv7UkbDry0DM
	EjskEG72/UVtP/T+tyeWOiQqBsca2Pg4pM6ER6RjHztwnutMF5o1FcVaIKdFy0KL3BXoOudq9G15w
	XuHYIg06o9D2gkVEc55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0t4-00000005LuW-3Tb3;
	Tue, 25 Mar 2025 09:47:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0rL-00000005LcE-1HxD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 09:46:12 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so8263078a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 02:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742895970; x=1743500770; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IbefRUQKW2oql/88hpKv3fFad6yESLUR8BZTv5IsOP0=;
        b=kerjhWNJEfMwKwYWUVD/3wpNM0VVDuzd+m/vVqMM7FDEHLzqv30lqE6ibksvq6sF0d
         E2zJZUtOoeup6UrYhCeCZKf2/yVD8TvwiZPr47O+pvvz3p22kKVjfR4v67XDqGGFnbE6
         8MNNjm6m12JDR9NDfX3zmMAFjdRcJypCrwLy0LLtyXDfUYhWdw8UsDtAlJbs7i8XaZZ8
         p4sdrk6cVgy+7VZ3YSzR+zSeWXt1LgrX2TszDzuUWw73fQYvFHtYj2DNK1K36rotZan1
         Ci6AXuS+aXON+qCkhU9+ydYeqdoE33iPRZ1iVIbLH9w2wAnYXcUin/gJ50ILZAm6ZY/k
         kEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742895970; x=1743500770;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbefRUQKW2oql/88hpKv3fFad6yESLUR8BZTv5IsOP0=;
        b=ZYLmprTnE5uJNiQqFGcZgiVk+G/DWv9X25QL1DqWHulGiLZ2OJ1HNUdC8dAXxFkTbi
         LdhLmrJDqnUPOY5qOQx+vFjnATmAJhIZj52FByIEXRgb1lLet/l4J+LcYbWX5lP3fjXm
         02qGuPdLNXg0NY+qO5lEkhfXALsaVibNjHCS63lGqVuMUMqUhYjuEABrXFtnG6Xxa7Jq
         9b6PRJxIQ9dutVWSKP0tkAT6OHBlqn41UAE1si4OPGmba0241bs/hZvRQxEAhr8Bo4qK
         8wBXqp67VtCbNbpkpHy/JRx1ZS38ncF1Hfo3NpBRqhHzae/JfqFJsTBIWekowNuQIu06
         4RMg==
X-Forwarded-Encrypted: i=1; AJvYcCVCzSzwBPBGYjImJcCSme4+eYz/rwbjAlq3lfYTrMDtwEoSy85rTo64G+zoKriZ+CoaxfenMTgA90lhA2VqIfVq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl2Yqf5XYe+s+pzS6Zw6roqVoMVT9ElBiLEjL2/v2ILv0avr7N
	7t9m4EvimCXSfV2y7rpqPC5v7hnDYv2E3+yhN0UUZ97/16616NUPiX9Xr/xfYtg=
X-Gm-Gg: ASbGncv9noNQ/IeNbrLp31GUyJbstzEMnDlkSXRw+MaFMHXtZdit5eu3hsw5MCBorvb
	QX+TydVNluSTqoIfeCKVQ4uTEO1byoa1Epx3Dr3kCf7XeQNpSGcN+ARvM1ydpz6jS5DAjXCtbh4
	AlVWcBnhIGMHNDSaXkP1VRnfMITTeE3wWUcYP20b6fBSgbGmpf113Hy9pHA9IknyzByJNcJGIM9
	xdvgY/2OKAG56wzkCfFbb785fdWLs/ZBIM+JvzwwXPQ0Ubdn/MTgiMGSZEukKGWVafEd1xXryIq
	wYo5B0TkavKiDNE7urENoWIIkFInnfHzeRp0JtgSK9Vgyl3kXXBwZ/c+0LUQ76QJjnS2JEmhgGs
	86MjoYDvs7MNmjjrfoL5TWL6db2th
X-Google-Smtp-Source: AGHT+IFYMNqZbEEZU24hSgKcW3m5RLIViDlNIgnffwEY/e9N3Ve3Ev3qTdJRHo9n8Lr2y8eJMqGUHg==
X-Received: by 2002:a17:907:972a:b0:ac3:cff:80f1 with SMTP id a640c23a62f3a-ac3f258cee9mr1765840966b.54.1742895969537;
        Tue, 25 Mar 2025 02:46:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8e509dsm832834566b.68.2025.03.25.02.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:46:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/2] firmware: exynos-acpm: allow use during system
 shutdown
Date: Tue, 25 Mar 2025 09:46:06 +0000
Message-Id: <20250325-acpm-atomic-v3-0-c66aae7df925@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF574mcC/23MSwqDMBSF4a1Ixk3Jw3ilo+6jdBDjVS9UI4mEF
 nHvjY4qdHgOfP/KIgbCyG7FygImiuSnPPSlYG6wU4+c2ryZEsoIrSS3bh65XfxIjgutAUwjjMS
 OZTEH7Oh91B7PvAeKiw+fI57k/v7vJMkF75q6hqZFwEreXzTZ4K8+9GwPJfWLyzNWGUNbA5QVS
 qjMCW/b9gWJkyPp5AAAAA==
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
X-CRM114-CacheID: sfid-20250325_024611_366708_41C5B7F6 
X-CRM114-Status: GOOD (  11.57  )
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
Changes in v3:
- switch to unconditional udelay() (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250324-acpm-atomic-v2-0-7d87746e1765@linaro.org

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

 drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250321-acpm-atomic-033775b051ef

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


