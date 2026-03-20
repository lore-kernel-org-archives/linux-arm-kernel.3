Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288C91099B40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=; b=WpN69bVEoZccug
	Tog5EX1HWzb/0PHOIWkrkoJgTg95kHdO5Lr5u3uHMet/CFq1SFaS6A2WEqv36pJ9ha6DRk4Pp+zi1
	VJk9LTBO+bc97eAWGRQIRs2ypyJsFiTRhgiYrFvSyw8kW9WrtDw66hFlgVwe7Xh9DZakAji8fkw+w
	3WFtvu8ddMAHwNOgTVMoYarJW5/ifJ9dxZFj3YZQFERV+CXdplQ3xRJFY2pmY1hUfopFOEQgGTEWq
	eFbKRwe42fHo4/45k72OJwXKsAvC0i/FRg3cagH5nXw4xGNWBtDaPbe0LKzuRJ8txg6zE+g3rny01
	urpXMdoE05HeewJdOqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBy-0000000Db4K-1AoC;
	Fri, 20 Mar 2026 21:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBs-0000000Db2Z-2UWw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=; b=LrgtUiW/bhHdETERMS1aaJOY9g
	QDG2q1xk1Ef2vV9wD2V4JmDzewmFAeKNa1dzzOsNDFsNrlKH2EFNdFqoCgqA/A10QFv66fvuQSdcM
	rnjrgk30A0IcUJnCxoVoX+HAZe0nJCRrGqRzHkI53ToHZvZBTnxjAbOzNBWnNMuuf+abrdxVG1HuA
	xjPt5V3x9vwcfvWEezNu9IcMnv92aRrI0rE9g1F31JrzHZqFPrM8zIYhK/ObO2W6v46IjGd2Ffd/d
	TiqUEAXfYiVcl0vJ73vVBVrhebqV8Ums7LW/ZNUcMVpO/ImnJPidv6GVpNUUOuW97PBayHUcqi1Ea
	mfGlZyXA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hBh-0000000GUTX-2I1Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:15:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so23253775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041317; x=1774646117; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=;
        b=EQLVWBb2/eGSGzs60Zb1ohpYlbDwcTuLpGf9CxiAPLfWynTrlH+xRlFnxTu8T2bSzX
         VqOQpSZe4em+hlsc7QC6qJJ63LQKMRbqOCuT4uymiFpT136/XPoE8P16Pq5rkrlf1z1C
         0o+dBE6YoLIK5Db5THPy+pId0SpCbWo+pYR+JSsKrKGjvfcKFNjnCmGYitTodHjCUp+V
         LD0MCymw4dUU93YitI6PXAe0006ldpjPgM+QFcLuvIPecoycnvT9Wd5bfdXPdP170/cx
         4kVLOvJE6MPzzW/UvA1c3Okp3F2Vg4mcVCQFhB45nVwvo0A+L2pcl3syqXUarmEaZYMn
         iBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041317; x=1774646117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1bGv8/uYNdnIMNZ+E0Ir9BQ3Ee2imch1dX4Gmz7nQ4=;
        b=BUq7nKktoRYgwD4iCPQ9p8iTQpeTZQNrRJMAMm6m+s3YM0bQgy84kv4CqmaqGBjzIt
         po8wXaUgojDkbk5nkXBeZgVPbBZLFBgba2oft+27D+vLcW6Tbj3mSZIOIufNq/RnA3Ow
         qvwhnVaFTVQPjDXG2833WOPY0HjCRoJsnEmGSnJEWcvWwu4smMXqhiZANuTcaTaxOftx
         ejxY8gqO+LJH7dUeM/qisGPi1RI6qqDlEKUiM5tu9+VzwxhCPBadlQuOQEw68Lycz/QT
         wttkQw39IdlOM3oX8rNWWmdj7L6wjfZI9qoLfp3aUwA+3+9PTQU+Rnm+2pFpdsHF+wzZ
         juNA==
X-Forwarded-Encrypted: i=1; AJvYcCUJMkc27P1hLXdVkyOsiCY7dE3/hXYRnOlh06kh9cfeXDiSPXfo1vcpQGyToqBjk3bsh+zq2PZWOoFLNWdFkAWN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv0cO8AK/3uYE2TzisTv919JB+q8PpXkiPaFMhqP4+v0sienG4
	PQdZjV9f3WhVygZJTzapQIqgY8Vn/Wpj3oPn/Sq2MlP1GlAmkDUtuGTIy63pkc5WLfs=
X-Gm-Gg: ATEYQzyv+VuJ2UPyj6UHtEbNwB8jAUhChAALlrHDETb9O35RPrTUaEle0vbK68l0CS+
	hRyvueYtjoDH2PFlMg45nZ28VYBLqwcBsQ+0Jt5PxfVouPi1m5D1sR64aq5fZTUv7V5uvdPb88U
	vZmi+kiH0U0YRs4A0FsqJth+noRRLuadvuUc/TgHizfTE4tZ+JHTlqBOH3I1Eipr/OIvAFfwp0p
	9Knddry3xGRmyePdcIN2otdoZOzK88NVYgn/4+/C+q2OUqj400ic66/F7q3wUzbQwLvJNJuPMOe
	P/UocpF5bapcg83xtVpZJD6d2AxyZbIQ1FTVJNXk06TgxbVjuVZyCKfy/TgiGLV17AytrRoZ7ik
	TOtvMC1IaOrq1lelqRL+OFXphfs0S33NeIM0abgiCdtEEwdydjmSpEFcSZeg2DzvBRIoYdaC2P5
	ybNB1aokqPmW/ZX/eg1ToolUrIy45V44RjcxUK06OP4bE1FhH6q7EcT9VNknN/JL9ehBzgBT7Z2
	qBCbCowrKeWYjM=
X-Received: by 2002:a05:600c:8710:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-486fee051camr64543975e9.21.1774041316606;
        Fri, 20 Mar 2026 14:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:15 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/5] Exynos850 APM-to-AP mailbox support
Date: Fri, 20 Mar 2026 21:15:12 +0000
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOC4vWkC/x3MQQrDIBBA0auEWXdgaoiYXqV0YXVMBhoVhWAJu
 Xsky7f4/4DKRbjCazig8C5VUux4PgZwq40Lo/huUKQ0jYqQ2z+maiZCm5XNG25Wft/U0IVAzng
 9m9lAz3PhIO1evz/neQE0O5mLagAAAA==
X-Change-ID: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211527_260621_98A3BB8B 
X-CRM114-Status: GOOD (  13.06  )
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

Hi all,

This patch series introduces support for the APM-to-AP mailbox on the 
Exynos850 SoC. This mailbox is required for communicating with the APM 
co-processor using ACPM.

The Exynos850 mailbox operates similarly to the existing gs101 
implementation, but the register offsets and IRQ mask bits differ. 
This series abstracts these differences into platform-specific data 
structures matched via the device tree.

Also, it requires APM-to-AP mailbox clock in CMU_APM block.

In theory this can be split into two series with correct dependecies:
device tree node requires clock changes to be merged. The suggestion
is to let this go through Samsung SoC tree with corresponding acks
if it is okay.

Will be great if it can be tested on gs101 to make sure that I didn't
break anything, I don't have dev gs101 devices.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (5):
      dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
      clk: samsung: exynos850: Add APM-to-AP mailbox clock
      dt-bindings: mailbox: google,gs101-mbox: Add samsung,exynos850-mbox
      mailbox: exynos: Add support for Exynos850 mailbox
      arm64: dts: exynos850: Add ap2apm mailbox

 .../bindings/mailbox/google,gs101-mbox.yaml        |  4 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  9 +++
 drivers/clk/samsung/clk-exynos850.c                |  7 ++-
 drivers/mailbox/exynos-mailbox.c                   | 65 +++++++++++++++++++++-
 include/dt-bindings/clock/exynos850.h              |  1 +
 5 files changed, 81 insertions(+), 5 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260320-exynos850-ap2apm-mailbox-cff0c8d69898

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


