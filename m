Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F93D6EBEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=85Dz/V9UNKV76gRXI1CKiKH4NgkQ/KQtgXeRQo92xPc=; b=stu9RyIGtI/b11
	aWOKIIgQ685EXzGmZDg2ea7+n+pAbHwPO4iruC3G+YOF/Tl9opr7+uhkkPMtuTj1h45uSWdyxwKFL
	G95F86Z3KxIlL7gSw/hzyP7egBue58PSVrMV6CGvaMol7o6dyvhV9gR5Q97EJRVEfASIYWg2L8bA2
	NOt/8zj3X1PX4X4raoJLQPN8AsJO/DiNPlt+x+JLl11g2SInZ6EbdlYxWgMPRgF3UGgcRoeFdDYFA
	U1XyFLzqD7lxpWD1zmk0Swy7f+ye+IjPQPRxN8ARdbT9honCzrOLO15h7EoyyiTpvQ2vfJsA/GC00
	hId6JHIo2H9cBSB6TY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGx1r-0000000HI7e-2sli;
	Fri, 29 Nov 2024 09:11:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGx0r-0000000HHsi-3lQ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 09:10:11 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa560a65fd6so292445966b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Nov 2024 01:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732871407; x=1733476207; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85Dz/V9UNKV76gRXI1CKiKH4NgkQ/KQtgXeRQo92xPc=;
        b=mDs7rPW+NfhzzXUBAGk4vfY0dTOJZtR9Z+OSA+iV1u9n5MBv/nCt4Dxg2QuWF1Qlmn
         u/dCTng5z62LDuDpXySjteUpI+9fbE5zRJbT7QS58sJq9bm1rhyZBblu5eJQi/gh4/Y9
         1xrNBq8Ntu4miEvqdyRfDRiQqf89tyJnZpk751jrLeaGzyCdLTDdbMIX0TFmcitaYgvm
         xtfpVvxERrYbA697v25WgLvjyEajHOKMH1lXHmazXY+2z3aq75yIRtlJYCnk/5ghDGCo
         kk1lr9f6eeECVEbcSL44+k8wR9gmE+jmcZuf2wniZDQxPoRgvRaykWpc8lQuhEOc6vz5
         aSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732871407; x=1733476207;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85Dz/V9UNKV76gRXI1CKiKH4NgkQ/KQtgXeRQo92xPc=;
        b=vDjLcDk77hFwG8KDZ2Y0ABZh3rWSjFo7GDeW44PbiTpqAEFx7y5Mwqz914zQCxacJg
         VX0bnvnF7VSeZuLexIPv+gJ09U582RbDx61rodtQU1KbLlrLa+xJZsFkVGW/Xiaho6hh
         uVMVIf3/pelRfPjb2+HyDc3tRjjyTeOw1q6WkPjR0Dx13Ijo6sel710KQXWpO7y5rKrQ
         qJ6ZxF3kvgJadjkgkTXZIeufUfPfI7mqVEbLbwxqdkkYGgJxAwRY8kVmdp6D4tM8yabe
         T83010i++fDz2oLeG2tf53Fm24fcV/hvP5lnL5gxmi3fw+0pORN+egxXMixrlwbVfBRY
         9Xtw==
X-Forwarded-Encrypted: i=1; AJvYcCXNavCIjRjBYomI2E5hW+1aF5Q0nI89TS8+VvR4BWBXUwxqEtm+2VN62M99bT2dpgufQkb+6QUfLnS7hEQ1OqZT@lists.infradead.org
X-Gm-Message-State: AOJu0YzqRgSHk0ZfDv3P05cw5UgZRR1+JAFyqqcOzBR6D7sDC5jWGisx
	Z+0ww4XzS0zA+rnpX2x9LFPpIG9yVayvq/wd6InCdhpMSGDFjZvR
X-Gm-Gg: ASbGncvnjas/8Puz81HzjGXTti4K9K1WQ6PphFATmR+01SujqO50uweNNUklr7/kIif
	RL9/6UDwTNGsgBWP0AlHiBpgEM0F6tNKgqsQ2l8TgfOkN0V9FKVtwmXCXGeWLJZYZ73MpG5CN+P
	VFBQRm99t6Vv0fUGsZoUx/izqoZwWwfgSDCkmnA/ldxjnIJHyQodkZE/xwHoOyNuhetA2ouD3fQ
	Cg89+aUbk4cXUtdJi1WuAixv1Cg/JfptzU492yv6LeyFA6M
X-Google-Smtp-Source: AGHT+IHIfo/Ci32R+3fuYfGuVl7F/1TNk43TxxJOhgBJQfOEEtpCwcdgMeOiUXDwjeg7ubOfHuymCg==
X-Received: by 2002:a17:907:784a:b0:aa5:3b1c:77ab with SMTP id a640c23a62f3a-aa594506715mr768627966b.3.1732871407175;
        Fri, 29 Nov 2024 01:10:07 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa5999032c1sm152775766b.133.2024.11.29.01.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:10:06 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v4 0/2] power: supply: max17042: cleanup and more features
Date: Fri, 29 Nov 2024 12:09:52 +0300
Message-Id: <20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOCESWcC/12OQQqDMBBFryJZNyWJ0WhXvUfpYhInGqhakhIs4
 t0bhYK6fAPv/ZlJQO8wkFs2E4/RBTcOCeQlI6aDoUXqmsREMCE5ZxXVkvYwccWkoHXOSmtUARa
 QJOPt0bppqz2eiTsXPqP/bvHI1+u/Ux86kVNGaxSaKSwkqvLe9uBeVzP2ZO1EsXePP0SRXMuKy
 irgpQZ9dvOdy09uvu5qA9iAFMAOu8uy/ADAGWJLHgEAAA==
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732871405; l=1934;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=aE7dRaUlw9RRqWAw95Nml53/6tAi/ph07reiaRvoGMg=;
 b=MpsLaQHP6PEqDLQx/1zd9njOiFfLHMjNFpFZoSzPujsZA6u9/YSZmQu8s1Qx/jeSkLw4JnU0u
 uI2twrAR4BSA453tyWNnPAMVvjMXqXe1oF/lCxFpdv1/SaCd5AOVv53
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_011009_981447_7A61D589 
X-CRM114-Status: GOOD (  10.24  )
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

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Make max17042 interrupt shared, and add platform driver
version.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v4:
- review fixes.
- Link to v3: https://lore.kernel.org/r/20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com

Changes in v3:
- pass dev pointer to probe
- Link to v2: https://lore.kernel.org/r/20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com

Changes in v2:
- drop NACKed commits
- make shared interrupts unconditionally
- rework descriptions
- add platform driver version
- Link to v1: https://lore.kernel.org/r/20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com

---
Dzmitry Sankouski (2):
      power: supply: max17042: make interrupt shared
      power: supply: max17042: add platform driver variant

 drivers/power/supply/max17042_battery.c | 125 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 93 insertions(+), 32 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


