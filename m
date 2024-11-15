Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E357D6DDEF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Z6LvJ/sPB+Dl1kFLmZv/mrYyYjioWG5VXi0FQmBtqQ=; b=LcdtyEkCt3e+DS6jvkVQdOp3Ud
	e+Nku2VooScWa9eoUrmoe8vuE7KyOFJSkorBI9Aax8SmIRlBCljwLtBy47KoYtFZWkULtVKGtvns0
	j32AOrrqi9aPQCGy6DCVBlZ4bdZA8x2W2Zub8agVOzVV3LybWTwzlodDNnwZcVMDfda8HDeM9YMqt
	vNCNnpsgirMpwGSJZRO/ithrzmpjTBaoYFFIXFcScAXfEbgPUgyNJQJBT5JUjz7OGNasI3cDQaHX0
	oovqwPKOJDsVhikr0KGfC/VZkbhdWw648tzxUrjpIHLJh/xQbpqrgUhBT91f8tc9PgWwhjgNY7N8e
	TW548P+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBtli-00000002Oq9-23gr;
	Fri, 15 Nov 2024 10:41:38 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBtkl-00000002OAi-1Mka
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 10:40:40 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso4414511fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 02:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731667237; x=1732272037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z6LvJ/sPB+Dl1kFLmZv/mrYyYjioWG5VXi0FQmBtqQ=;
        b=vnoNws25yRfSHwDzeOO/7x94xNtjsR3epkXx329obrXLmyURStZRVhmgruzL/tKrHo
         Ma0eVZdwzrnyIRi6u8c93XKz+wqh63G2TN+YDzZXT22BBSdL8Baf0METRX7/9sPsA6+S
         zUClx1U0prAFDqaIa9pF3W/mVw6Ph6P/K/kDXf912edIZFyZskAFLmzAE/LEeRGFAv83
         DwHvVn1kqNfn2eJ+ACzmvhMQ4N1iajxH4Z+19ifofH3sH4Vja01OiWfVnk2ymOUxp361
         q7L1Kh4QO5ZZ7bgusfaPMeiH2VLKB7RFXlYNJhNVXwv/q/wqlFhlC9Z6X3pEKnPYXtnR
         /O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731667237; x=1732272037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Z6LvJ/sPB+Dl1kFLmZv/mrYyYjioWG5VXi0FQmBtqQ=;
        b=oh27vb8VLJNOv1j/ZKWf9VpMTWHGtt1ND+FT+e9fZlDUpn7yl1sOJJpceVMyABTtFX
         j4MB2zWo+tUTQVqHSi7B42wyLanbITxbrX9FU9InTupxZJtzAxlwk4al32rxhcsz0e2E
         dJDF2FHyRRgD2CeVyjKUQeFDi6O8VWfQILPS8iyiC7hJSZjSR43Mluga+NzRhuq1omJW
         H36tb2SZifgyS4u9YlqZ9IUipXOqh2+HJzI6xbqRkEq0KFvja6ie+JiZkYSoMiP1HDKe
         tGAjcGPCVJCd+OQeRmIk1OjQRG8pgomoiquU375jNaK9amvQEPoTGV9aU8T9Zktz1bs3
         faeA==
X-Forwarded-Encrypted: i=1; AJvYcCWfMgSZqMz9YljvCIsooYVGYNaYJJxscJwQohDE9dS/oRe+c6VMjSIJHCuVM/2zz+uPAxP/Hn3DxkHgkFuj8C05@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwG7CTalDNJzjPEc/f5EXAif3XRO4r7KCsSKs1Un/1fKfWHFw
	fkQlMHwrfSOgG23Rq6Ut4PjEtHT6HSvXJK6Bh9F1Cfneryx0yoWFDOBHMHigFuo=
X-Google-Smtp-Source: AGHT+IHochvip3ndT36pY7JzUJ9o2k/DM6zBRNTgAKVEogfP3W6wLBEgo4qo8JTEtM7I1Em76KrM6g==
X-Received: by 2002:a2e:a99c:0:b0:2fc:97a8:48f9 with SMTP id 38308e7fff4ca-2ff606900f0mr14332601fa.19.1731667236678;
        Fri, 15 Nov 2024 02:40:36 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff597a067dsm5179361fa.65.2024.11.15.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 02:40:35 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/arm_scmi fixes for v6.12-rc8
Date: Fri, 15 Nov 2024 11:40:29 +0100
Message-ID: <20241115104029.119226-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_024039_415786_5B812E39 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Linus,

Here's a PR with a couple of pmdomain and arm_scmi fixes intended for v6.12-rc8.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 7738568885f2eaecfc10a3f530a2693e5f0ae3d0:

  PM: domains: Fix alloc/free in dev_pm_domain_attach|detach_list() (2024-10-10 13:55:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.12-rc1-2

for you to fetch changes up to d2fab3fc27cbca7ba65c539a2c5fc7f941231983:

  mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag (2024-11-12 19:45:25 +0100)

----------------------------------------------------------------
pmdomain core:
 - Add GENPD_FLAG_DEV_NAME_FW flag to generate unique names

pmdomain providers:
 - arm: Use FLAG_DEV_NAME_FW to ensure unique names
 - imx93-blk-ctrl: Fix the remove path

arm_scmi/qcom-cpucp:
 - Report duplicate OPPs as firmware bugs for arm_scmi
 - Skip OPP duplicates for arm_scmi
 - Mark the qcom-cpucp mailbox irq with IRQF_NO_SUSPEND flag

----------------------------------------------------------------
Cristian Marussi (1):
      firmware: arm_scmi: Skip opp duplicates

Peng Fan (1):
      pmdomain: imx93-blk-ctrl: correct remove path

Sibi Sankar (4):
      pmdomain: core: Add GENPD_FLAG_DEV_NAME_FW flag
      pmdomain: arm: Use FLAG_DEV_NAME_FW to ensure unique names
      firmware: arm_scmi: Report duplicate opps as firmware bugs
      mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag

 drivers/firmware/arm_scmi/perf.c        | 44 +++++++++++++++++++++--------
 drivers/mailbox/qcom-cpucp-mbox.c       |  2 +-
 drivers/pmdomain/arm/scmi_perf_domain.c |  3 +-
 drivers/pmdomain/core.c                 | 49 +++++++++++++++++++++++----------
 drivers/pmdomain/imx/imx93-blk-ctrl.c   |  4 ++-
 include/linux/pm_domain.h               |  6 ++++
 6 files changed, 78 insertions(+), 30 deletions(-)

