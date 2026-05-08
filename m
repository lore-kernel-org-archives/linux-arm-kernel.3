Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDEACD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cDX108p0uzre2YaOaDlgaGo1Iqc97n6Wg0g1XdnjXXg=; b=GfAuuwlgq0wj2XyYcM2xzVft5a
	aglN55Nb5Kd2bNl1pDqdjiihkoMrYUGSzNF7dIqptFzzX+Ohnj6rBUrxrUJGCPCiWUaDbe+rghS1b
	OANJaokkwWm3V3DgINCAhnaRQWCFQzVaroHFbhQlVBRTIazDuZviEu0M9YvY3FN9q6cB2GbiQIaY7
	m7FOmaLzssDZOvQ1aN0dTwc4KMlDvuJWbisB4uqIuER+aK/Zp+bRnn6fLzHRicir9hTt2lCnE6aiU
	jhIEhdI+YgBjxmHpNf8QVikkVe7qpE4BNnkmRAQsO/2cPB/teCvViCHLAd9CnOKb8IV7MwDOpc298
	sLGhbVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUE-00000006Sww-2XdN;
	Fri, 08 May 2026 12:39:22 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUC-00000006Svb-2k59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-38e97e73234so18108251fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243958; x=1778848758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cDX108p0uzre2YaOaDlgaGo1Iqc97n6Wg0g1XdnjXXg=;
        b=ggz/Y557y/rZFz2zMxzYGaZSfaoBXqDgsW21C+44bUbJfjvceWQO/DuTdlVRRsrosm
         4A6jtupNaYCpiGSYw2umsN0VQnWVmQSr+fwxTx52Smb03B1UHu7cICAKR1vnrJglLyXf
         nPYkaINQFx8TquUsmeZDuGpSt6h0cQgOujn1Na74S5SH2YAEYyyMYQbe3Rv1GK5RWN0E
         MrAr7lqWpaFspBwbhQVcykIj6pp59R1J8nS15ZDt0lCrpfSwva7ko+f0KSiTymBRFtvL
         hmfcb6dpYX8cTLvw0lV5icKNVK+z2RayNn39VG+erdbymVjk8fZANvXH9synqehM8v9n
         Nhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243958; x=1778848758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDX108p0uzre2YaOaDlgaGo1Iqc97n6Wg0g1XdnjXXg=;
        b=SSOydrBadsLIBsGEiOz47yqJE1V62vjSB3P5Ul37NGHBKIgDjveMlBh2RKiCHJWe4u
         2Ik6bjLOQylP4P4xgmobq9SDDAwNEW7luluWe5FEIiKkGwXcbF7QzojX9DJ7Y5P5VVlN
         F5o63F20A8TK3wR66gsGGAZKVFo0Yrt1ukDFXekkjE+gpJtViHwFLxbcTnJtDMT3H4XA
         qqma/o6spoKsxUx87qLsfPDOVoPTQc6eJuTImSIr28fhzoF+o+Nstw/NBC73xz9yJLoZ
         Tx6MQX8B5CeyCAMCWkY2J460KPVkZIGpQTyYdMXjjy9OM1NRAoRnHNZcX4KZVHXpgeLo
         zTNA==
X-Forwarded-Encrypted: i=1; AFNElJ9Pb2rJZMvX0sXNrIhSYlWd1uAET/ko6ffvsG4S/9cxNT2ohIZPLaaiCGF5TLuWlgqFTWCsCXYpDjM15nMUFm5a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5xhZehvvnYPXP8KAxM7GgEqXuU7JX8eb/25JJyW4hF5NWOuE9
	IlhtGR9r0Occ4YOyeZP6z7hf3N2zY0jKDrq0ckTi995xZs1z27tTsEqsWQadlinfUGI=
X-Gm-Gg: Acq92OG0XqtzVg2rTHuDIjMy/y0XZqSsDlmve2MGizvkF/hN0ThKgG4VVFZu4047M5T
	46LLWPegkTywrzleP8VgYWXQ8ebrTgVrPkJ+8hyLzLFhlvGC5QcUJbszaZX/XjIbUHTEBCXW+PD
	quxRHSvAd6en2FEa6ZFs4qMYsdWYuqZO9SUTZ2Qat5tiRNW4jN3zIEqj3ZEAcxh6a/FZqn4G1pK
	ADFOUU018UbjmsybBCkqH+bUPesdTMU1+h6JZA1QOYYY/x9/WKOSuMdovcOab/GvGKe/tKSla6b
	f0JoAiXIfH6nMjNiQY1KAItqb4AFtC8L6RGVVjUSymH05rvStoZBKrjsOIpXyu1cL0e4/IEy1Q2
	SQKgOWmZKeb+E04GnfOIZM3lAetlnTiJtvNHCHRw/fyeGYrn9xy9JAStuHP0lqvvh3ESyx0PWUG
	0a7YcF9vst1TQtUv6lvqoONXPuYOTeVtoUJzt1GjPrVTW/PqXT4J1PN0FtdL+tHlaQtySdwfGn
X-Received: by 2002:a2e:9f08:0:b0:393:7ab3:6d50 with SMTP id 38308e7fff4ca-393c40bcc4dmr37791951fa.6.1778243957558;
        Fri, 08 May 2026 05:39:17 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:17 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/13] driver core / pmdomain: Add support for fined grained sync_state
Date: Fri,  8 May 2026 14:38:49 +0200
Message-ID: <20260508123910.114273-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053920_736527_57522ACD 
X-CRM114-Status: GOOD (  15.07  )
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

Changes in v3:
	- Dropped tested-by tags from Geert, due to changes in patch2.
	- Addressed the comments from Danilo and Geert, more information in the
	changelog for each patch.

Assuming this is accepted, the best merge strategy would be for Danilo to pick
up the driver core patches (1 to 4) and host a branch that I can pull into my
pmdomain tree so I can take the rest of the series. Danilo, please let me know
what you prefer.

Since the introduction [1] of the common sync_state support for pmdomains
(genpd), we have encountered a lot of various interesting problems. In most
cases the new behaviour of genpd triggered some weird platform specific bugs.

That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
remaining limitations that we have found for genpd's sync state support. In
particular, we discussed the problems we have for the so-called onecell power
domain providers, where a single provider typically provides multiple
independent power domains, all with their own set of consumers.

Note that, onecell power domain providers are very common. It's being used by
many SoCs/platforms/technologies. To name a few:
SCMI, Qualcomm, NXP, Mediatek, Renesas, TI, etc.

Anyway, in these cases, the generic sync_state mechanism with fw_devlink isn't
fine grained enough, as we end up waiting for all consumers for all power
domains before the ->sync_callback gets called for the supplier/provider. In
other words, we may end up keeping unused power domains powered-on, for no good
reasons.

The series intends to fix this problem. Please have a look at the commit
messages for more details and help review/test!

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/


Ulf Hansson (13):
  Revert "driver core: move dev_has_sync_state() to drivers/base/base.h"
  driver core: Enable suppliers to implement fine grained sync_state
    support
  driver core: Add documentation for dev_set_drv_sync_state()
  driver core: Add dev_set_drv_queue_sync_state()
  pmdomain: core: Move genpd_get_from_provider()
  pmdomain: core: Add initial fine grained sync_state support
  pmdomain: core: Extend fine grained sync_state to more onecell
    providers
  pmdomain: core: Export a common function for ->queue_sync_state()
  pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
  pmdomain: core: Avoid an unnecessary power off at sync_state
  pmdomain: core: Add a couple of debug prints for sync_state

 drivers/base/base.h                       |  22 ++-
 drivers/base/core.c                       |  77 ++++++--
 drivers/base/driver.c                     |   7 +
 drivers/pmdomain/core.c                   | 227 ++++++++++++++++++----
 drivers/pmdomain/renesas/rcar-gen4-sysc.c |   1 -
 drivers/pmdomain/renesas/rcar-sysc.c      |   1 -
 drivers/pmdomain/renesas/rmobile-sysc.c   |   3 +-
 include/linux/device.h                    |  44 +++++
 include/linux/device/driver.h             |   7 +
 include/linux/pm_domain.h                 |   3 +
 10 files changed, 318 insertions(+), 74 deletions(-)

-- 
2.43.0


