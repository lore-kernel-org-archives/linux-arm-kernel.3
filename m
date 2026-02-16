Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA68E7BDA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qPeoOZLMpDPHLvXRZ2UOWF72e8RnmNaQnfGaf4d8jU=; b=rOK0bAYdKHu2DqJzNRHHg6WpuY
	k1ncGzPyCxpwZRhLeT8jW3y0RB1kwF8mVlbtOm69UxBoPeSleSG1SOm9nRJj21PazfuzB5AjBvZd/
	WUwpUC1HRJTX25Z7BMoiUkHim+AvX+oYS4dMorfrZy8lCxYcF8zpwI2+FBIsKcu4zG5io8XiBkMpM
	LFgaBBSrYGcqJVhmKY2MA12cbtEe3rrIS6TeIrvV/uGOgk7YLJM11lgnHJTn50ibIZKMt+lnpveX9
	TCIqZa/80RXgdyaN6Achc9ExQj3woFHQ2YKsBEyAscb6RpEVHYbUyCtbXoxxYcv/pReSZXI9xi78F
	Zc0GYOpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34A-0000000783n-1wEt;
	Mon, 16 Feb 2026 18:11:26 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs346-00000007830-37fX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:11:25 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-124afd03fd1so5024745c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265481; x=1771870281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qPeoOZLMpDPHLvXRZ2UOWF72e8RnmNaQnfGaf4d8jU=;
        b=IvBqYxM7e8M4citci9gt9v2684clzPa8ACZPC0uVyPZky7IEZn9YJ56aSEjdE621IL
         Nph9ny25cvpyGsaPWGVDKqMwfxZGem8IREmEJ8/fjY2vb7r+mN1sbCSdApvnSe2EPY/6
         yHKduH4vgkVTj5ZUNMIWjYUagis+lp/Fg3FPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265481; x=1771870281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qPeoOZLMpDPHLvXRZ2UOWF72e8RnmNaQnfGaf4d8jU=;
        b=tQFMrbiRQHPQ2zbpZ6xFGM0CRm0lZ1Z082rZRCPk+k0v+yTTZK7uJowZKUA9XGJAcP
         8uIQIiqCiV8MdIoyYmOTwL60cI65oijJUgSgdJu1nRYde/cIf/Y1KQziiGdYlFHI0+I6
         gY6H9OYiINZ7YTT+ljzYAJO5ISrLOOZrXFVFxihsMHLUPz6CJ/iRk8N0K28RsTtCK+ao
         vBTZNqS0YQEQLP04vHljchXcpa9fF2Jisf9w4mU3yu0TO6BE2KgXYrkb00mfCfWB5Yz4
         3rVrM/j7YvD1noE50nBra34Pzc/4wzn1FOqGWRC4O8Zg1w+4VgioDazse4mqcF6iuhYs
         xZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6q2Zk/AfYqX5Vj0wFEyZ6R6avQGM2C/FO7kNz6ZA62mSaWhzTcFs5LArvX0oL5JOjWj5fMCpgaDIvTY/qxOW0@lists.infradead.org
X-Gm-Message-State: AOJu0YyhkRDjplFjpsUStYDzgO+/XZmmx6sSEDltaLBlOC7wvNo0NRbS
	zbEeH/Tntf6p/auVTksvbhS2G2PJOLS4B3us7ond63uPbf3/LkCRInRWpdSRu6EypQ==
X-Gm-Gg: AZuq6aIdy4Hn8zcGJb5OuO3UC9QBsZeVeCuxPWZzGpgdViEaMPXB2BmL0kki/AborYA
	o1/52x9MT7WBXK3ZcL8sp8p5Q0iGPwiinA4rDKwWJMmm+LoNGkkgDVXml6tqg0ptbmvq7Ros6O8
	7jXKVQPBy0euHU/Jtxmivr98kWqskeFPBNzEyzXwf9xZYzrExm6I1ALaurBLX6KPGuZCqRdMmBE
	D3YqCn/An5PgRl1iPQNChvSL+ycZ43CCQBuF7cIkHlEk7YX+XzDZvNZMeANfY4NO3fcyUfYzeyF
	ohNuFtBoKnd3JYSp0IaTLOfMligr5GDtoaNtTS8DclxH+c5kS3gYlayBYoGL84YE4/iMSaNBfOd
	bDq7DI3CIMebcUlXADq+AGkvvCGfKkWEO0QdeSy620ScHhgB2g4CU1/Mho6+TIjQQyLfgTmXgTc
	BUV4JYLK2vE3ve9YASYsihSk4fnk+271+fcYsJ3UjNm+9hn2bAZmgY5JMqJwDxinImOJSY1zptR
	xQk7nSDkiw=
X-Received: by 2002:a05:7022:aa1:b0:119:e56b:91f6 with SMTP id a92af1059eb24-12741bd1202mr3136852c88.39.1771265481071;
        Mon, 16 Feb 2026 10:11:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	andersson@kernel.org,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	daniel.baluta@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jay.buddhabhatti@amd.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	lucaswei@google.com,
	marco.crivellari@suse.com,
	mathieu.poirier@linaro.org,
	michal.simek@amd.com,
	nm@ti.com,
	rafael@kernel.org,
	robh@kernel.org,
	shawn.guo@linaro.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
Date: Mon, 16 Feb 2026 10:09:37 -0800
Message-ID: <20260216181002.3475421-1-dianders@chromium.org>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_101122_929351_CA5ADE0E 
X-CRM114-Status: GOOD (  16.02  )
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

As talked about in the first patch in this series, passing NULL as the
'mssg' argument to mbox_send_message() ends up causing confusion and
quirky behavior inside the mailbox core. Despite this, there are a
number of drivers that pass NULL.

It is plausible that some of the drivers passing NULL may have been
taking advantage of the quirks of the mailbox core. Specifically, they
may have been taking advantage that calling "tx_done" wasn't truly
necessary for NULL messages (it was a noop) or that NULL messages were
passed onto the mailbox controller right away without queuing.

This series introduces a new API call: mbox_ring_doorbell(). The new
API call tries to mimic the specific quirks that were helpful in the
old behavior and it's expected to be a nearly drop-in replacement.

There are some subtle differences between the new call and the old
behavior, but it's expected that all of these differences are only for
cases where the old behavior made little sense. The description of the
first patch details these differences.

The series attempts to convert all in-tree users to stop passing NULL
for mssg. As per above, there are some slight differences in behavior.
If any of the patches are causing problems, they can safely be
reverted while debugging the problems. Eventually, all code should be
converted over to stop passing NULL mssg.

Changes in v3:
- Suggest mbox_ring_doorbell in the warning message
- Updated patch description based on Cristian's response.

Changes in v2:
- Instead of just documenting NULL, introduce a new function

Douglas Anderson (15):
  mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
  ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
  firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
  firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
  firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
    message
  irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
  remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
    message
  rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
  rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
  soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
  soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
  drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
    message

 drivers/acpi/acpi_pcc.c                       |  4 +-
 .../firmware/arm_scmi/transports/mailbox.c    |  8 +-
 drivers/firmware/imx/imx-dsp.c                |  2 +-
 drivers/firmware/tegra/bpmp-tegra186.c        |  4 +-
 drivers/irqchip/irq-qcom-mpm.c                |  2 +-
 drivers/mailbox/mailbox.c                     | 82 ++++++++++++++++++-
 drivers/remoteproc/xlnx_r5_remoteproc.c       |  2 +-
 drivers/rpmsg/qcom_glink_rpm.c                |  3 +-
 drivers/rpmsg/qcom_glink_smem.c               |  3 +-
 drivers/rpmsg/qcom_smd.c                      | 13 +--
 drivers/soc/qcom/qcom_aoss.c                  |  3 +-
 drivers/soc/qcom/smp2p.c                      |  8 +-
 drivers/soc/qcom/smsm.c                       |  8 +-
 drivers/soc/ti/wkup_m3_ipc.c                  | 10 +--
 drivers/soc/xilinx/zynqmp_power.c             |  2 +-
 include/linux/mailbox_client.h                |  1 +
 include/linux/mailbox_controller.h            |  4 +-
 17 files changed, 108 insertions(+), 51 deletions(-)

-- 
2.53.0.273.g2a3d683680-goog


