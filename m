Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F4DFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlE7cjMLFZtgFMq+aGelhtg7LeaGlT5DDi7ltrn57Pc=; b=GJLBXXJ+nyHi0A
	e9tjry3MXOOJU+0uHOzDPYV7KdHxqg6qaVXdZiMvmiUQrWA8KtxppNlKO/NRJmf71pVoyQ5tmD1p2
	scW30kWPFnQAzSADzOMTx7Bj33gpCfhmN7umIfz0baN+WWhMV/VIB4UWSWLx4OQh7b0I+20H63HYK
	SkyUhfIDVrZvMy3qrz/ymWcZkaJMuMY1xloBOLxjLkNKAFprRqjhTacHanDSB1Snp+TH/QvdErpKq
	Saj6kV7+2BWElF8tBjsu47faanoBAiUzOv7xu/U0sqFTzG/sNz6VypBGIzcazEKqWx8leN2j1CHV8
	umhr/FVFpchEWs/9f9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOt-00000001Pku-1Nku;
	Tue, 28 Apr 2026 12:18:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhOr-00000001Pj8-0Fek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:18:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso94405265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 05:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777378727; x=1777983527; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlE7cjMLFZtgFMq+aGelhtg7LeaGlT5DDi7ltrn57Pc=;
        b=c3rWADMD3CXVP+yhedA32sQG1OqZO7ARCDaV7YTwJEZSh+zaMCL0Xi0nTCs460IXKo
         iX4IWXz2VIydRpRvg/txfMjIspePOAcnQ8HCluMEZ/knM4g3fdmO0TE9bG4BCyoCIB/+
         Q4+2n1mEAI4CV+Q1FuIy+zm9uR/pDQHQz90QNV+Ixuhf7Tf9LSww7TYe/0wfXigJe6Ug
         fUVUi8jufEBnvHzeqcEk6fTPfTxIcWSbUiwJHlcyG5iKegfQA9hpwSJO7u3/ty8zaCWV
         RhA4BmbHkTzea3XFOnXaaKLX89y4JudWb3L0uV9jciOz5s5589FYKtGupmnv8Q/Vetdh
         tzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777378727; x=1777983527;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlE7cjMLFZtgFMq+aGelhtg7LeaGlT5DDi7ltrn57Pc=;
        b=EBSIYWe67q4eCcBLEeWTqMRrLhqO/7m9nO1whoytzc44y/BimNYuz4RsHFFXgcfPmK
         1V4PpXju7oBNU/lqwxuzCHcKcvS7Ml8sWdm8izOXBZiQZO1heUcnqFA6CLsUU73mLvlk
         xcPuYPkK8iuluz1x2ulhG3ldKgkW2HFsW5wRFz63/JBD0VGSoUOiIyITBed4aDnYwoyA
         9qDns+JZJcZcV2gCQIwwGnLK6eEL4xM1ewisDCpLbe2st4tgcxivU1IFxHjGAU5AF/St
         kIMp5u7Mekx58EDSrvv9LgF1SaXyudcbeS/0TEYa0Tzv3upbz1aQDDjx04Baq1DhG386
         /9eA==
X-Forwarded-Encrypted: i=1; AFNElJ8KfANBXWaaBeRf4NggtdVfVke2F+2MN6pHHLCqOkjPunp/Azv/X4VFUqOl1mp/1ur7H3mVqyT8gAif8FtOMGdc@lists.infradead.org
X-Gm-Message-State: AOJu0YyDIY7fJ8x4h2+l4SX9YmPmRdiQ1ckXpxTMryqszRsYTwAQwFHe
	ErbPGCGSzHOG+lmFfr3M1a2fDVeqTuBYMI52GnPIwYgpAcGKUQKjOCzN3oAdMyZpYAzJk8k/i79
	MCJrvqpg=
X-Gm-Gg: AeBDiettsXMe3sHCy30+BDihAHFpSAfs4EGq3/ZPaFLa6lf8YqArZcGWR91qODlzbV6
	ZmcSRTrFCbpQCv7xO5jUR2eMQO58qcYKEFij4WofVQBH/FRASIDrTYAWijtj2L2BNIUM52UFxyp
	dAQ4JCrQE9obpAabg+lMFHa4BAMb79qtUADbyWISkg8C4Jxg5F+/MHFHk3ItSzhaSMzU9GnQdHB
	rjED1ezC6s6owAdBkdAzX/oUgvCXXRp2yxYEB1o2aRARwaljo+7gtIxb77QRHrzYbEADaytqr0P
	8vCoGcD3OH1gt20FiSkYEiP2xwAzT0iS+DFRzjUrYLOx8k9HEBaj2S99yOxbmxQzBowSslWwwTr
	wkP6BMsqpmsNumAUE5Lb/jMSeWBVvTOXn7HpFDekiHjMGaNJnVsBbV2s53bUyQDDe1h0zo0OY2z
	Rs4OMuT4f+C21nPFw8zviOs9CPx0aWarr8+ajMCQ8=
X-Received: by 2002:a05:600c:3b13:b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-48a77ae03e7mr41619715e9.4.1777378726497;
        Tue, 28 Apr 2026 05:18:46 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748e622sm17851125e9.1.2026.04.28.05.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:18:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] coresight: ete: Always save state on power down
Date: Tue, 28 Apr 2026 13:18:10 +0100
Message-Id: <20260428-james-cs-ete-pm_save_enable-v1-0-c7a90ca6f43b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKl8GkC/x3MQQqDMBAF0KvIrDuQxrRgr1KKjPFrp9RUMiKCe
 HdDl2/zdjJkhdGj2iljVdNfKrheKopvSSNY+2Lyzt9d8I4/MsE4GmMBz1NrsqJFku4LDmiagPo
 We4lUhjlj0O2/P1/HcQKcDD/UbQAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_051849_134251_5D23C250 
X-CRM114-Status: UNSURE (   8.39  )
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

Fix PM save on ETE, which is an issue that showed up on the FVP when
booted with ACPI and the newly enabled idle states. Then refactor to
clarify and avoid any probe order issues.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (2):
      coresight: ete: Always save state on power down
      coresight: etm4x: Refactor pm_save_enable handling

 drivers/hwtracing/coresight/coresight-etm4x-core.c | 55 ++++++++++++++++------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  1 +
 2 files changed, 42 insertions(+), 14 deletions(-)
---
base-commit: 971f3474f8898ae8bbab19a9b547819a5e6fbcf1
change-id: 20260420-james-cs-ete-pm_save_enable-4e994e35cdac

Best regards,
-- 
James Clark <james.clark@linaro.org>


