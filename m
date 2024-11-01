Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D41E6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6D4NtcREXB5Bup547qNdCAW5XslwNEJ4Q+db+7Xpe90=; b=oKsBs5UHDOAyhw
	DiI3iZ+FLp/kILtU9t6wJMVRB3+sgSfUtNJ0MxKa5YgUAz4paqxhT++Qj+eFmjnquqv/FKt7x39HS
	Z4lcAdQgxLF592y5+PuMpD6drxfTRTCVS3tmviTOq+mQ9VoB7kRINR1r/jWASankFNceoVAriASp8
	mj45XUDNfDq5Ax2uLoK2BEeaYhqvSDPKSP6mYrkQkUVZNvSADMchUzhhQ26GOiXpKezFmfRnuWPwt
	xqVxCERU3M96qMxN/5fDKLq2vtRbBmA3gRQDaFsbemcjuccJUwes1aKuvOqP5qcQOHGO4J6Zuc5sh
	s1ftDx1UdnWq/dZ3ldJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6trS-00000007Ycg-1Rnz;
	Fri, 01 Nov 2024 15:46:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thk-00000007WzS-224N
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 15:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6D4NtcREXB5Bup547qNdCAW5XslwNEJ4Q+db+7Xpe90=; b=eAUIznAKvgK9Tfn2m39GhCh8Nr
	Qg6shhRsPSW4nn2y19Jk0Ii13CwIwNiAdTi6bCdYaKrMRUIyYvBKgwvnbMdaO9YKEUbICGUudeu2V
	KbLdUG0z5nk/GKPe9OF6+RhzBRnvVA3RgqAPjlfvtbj7XCB+/1gZIYCLBtswyN81c++5hHptRqYHL
	p6Jql3/MdXywE9SbxlxcUFXQYI2boHkHj2vpDgoIBDR6c5FjzEK5VjevncjQ/Ckz8wP3qc6EXt7NO
	o5LZx1NwVALw7nOHH5IgtGAafzTBfxhaoyJ7OLO9t1U9IErhxXKXwXg62x1FRUww8/hKGaraPFOtP
	+Iab8FWA==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6thh-0000000AlAt-0V6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:36:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so1597845a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730475406; x=1731080206; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6D4NtcREXB5Bup547qNdCAW5XslwNEJ4Q+db+7Xpe90=;
        b=FLWgSxUlr+4dMyOp/zRmwlP/8qkc277wuQ/qSBPSOryN4pjPzAmpgCx3WopvL+HTXT
         /bYegzO4VWkgqYcNO6P69G8jArFtcKGeeNAuQIUsLHCOVfrJXSFTonIL+Ak6tyM+PpkF
         2K/AQ8n3RVfIZE5xQRSoRMA5AJuEYbJnHK2WqpLAf3FjdBD9y/WJ3otIOmWb27hV/RUL
         n+K6nXoJduwy4wewDARI+H7iPOKr5rDbNCryldDq+I6JjeRoYm3tdjk82CWuqonsHu2M
         Z9niu4SSZhUWVThYhOEojqydbFGXNqZn8MpleBr8NT6NrE3pW4z05Cid9wU6EVcw4YNV
         1O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730475406; x=1731080206;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D4NtcREXB5Bup547qNdCAW5XslwNEJ4Q+db+7Xpe90=;
        b=X2lpSM+Iff6gjQTlKrXSD8V0+Ew2KkJqfXHo90s/gFPoZUVETlHpSkTvos+7R0j/Tz
         VJisBFOjw/AesuQ//bjw3uuvkN88LQRBBmwt+iz8biRXRKF6MnTsCR04qE/3Njv8tlJC
         +CB53YfObSWmgGwEn9FnynN2wAHpV1E7Ux8z54OJ/9cUBA5+bqXoES05x+w9mzrLmiVm
         OeGMZweXGAARUGg0zDwHM24n/DuHLmq0IV58rjQtB1PQGIKZgajHB4l3LbD3iIp/koAw
         QJf9DB51x0pMjOmEl1oK0+VXSS83RaYLh7z/fvY2lul4l7rgKE7TytvVsqQUBXPBXcLb
         OYIw==
X-Forwarded-Encrypted: i=1; AJvYcCVI/RGdKUr4htkwq1Uo/dORPQ0JfUJRRxDDrTJANTD3VlQjfKzXpP534/h2mtQ/Jfs8h1/nFnLeL7r8y2+/iNtu@lists.infradead.org
X-Gm-Message-State: AOJu0YwC9y6f7EaLnMcD+CcP6jeT+40CYCfjxdoHb7FyyhXyNuhvHRbf
	d/J3tft5JaFC1N/8U9b6e1fKzpR/4Fd+0OmvRai+7FRXvbCmj/Za0hPd+BND1dI=
X-Google-Smtp-Source: AGHT+IFFj+60WKfoiIjXxsK2iwYQcncuiXaKb0lwVqrEg1MHxBwe4MkWUHlT+nIYgMUoUozG0R3kZw==
X-Received: by 2002:a17:90a:a384:b0:2e2:c406:ec89 with SMTP id 98e67ed59e1d1-2e92ce75107mr12293458a91.20.1730475405684;
        Fri, 01 Nov 2024 08:36:45 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da983e2sm2820735a91.11.2024.11.01.08.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:36:45 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v5 0/3] pmdomain: ti_sci: collect and send low-power mode
 constraints
Date: Fri, 01 Nov 2024 08:36:19 -0700
Message-Id: <20241101-lpm-v6-10-constraints-pmdomain-v5-0-3011aa04622f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHP1JGcC/43Py2rDMBAF0F8xWldh9IztVf+jdCFZo0YQPyrZo
 ib436s4hYYSSL3yaHHuvReSMAZMpK0uJGIOKYxDOdRLRbqTGT6QBlduwoFLqIHT89TTrCkD2o1
 DmqMJw5zo1LuxL7/UC+G8MuilbEhBpog+fO0Bb++3O+LnUnLm2yOxJmGx+j7MbZX1gTEaO0buC
 7TVNZ4BaDqH1AWa1pSWNOHgIqalR4paKThyMAp8m5kg16xTSPMY131bZnvYzwz1bEZmFKhjtba
 6duhk92rNeg424qFU3fXM70TWPBV5EaVmgiujAWr/QBS/YvOPjqKIKFTTWSsareQDUd6L+qkor
 x1Ble/ojbd/V2/b9g2TVvjvMQIAAA==
X-Change-ID: 20240802-lpm-v6-10-constraints-pmdomain-f33df5aef449
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-cb14d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3822; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=sJhIZM8nF2F0ipz5K+7ZrDZObZ0A9WQI1rMNPGAN4Ho=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBnJPWMtji6vAtmxBrj1xLbPcea8Y3RbMW+PcQQE
 rkdXnZ/ugmJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCZyT1jAAKCRBZNxia0/vG
 ZWrED/4lPApacXPdaJRxftG+06DmkKGm4y5AG+vRC+F5xBwLHJWfIjF53SWlmfhVBd2zhp8+DBt
 oA9b+a1KAYGzxFfZBGS3VXnT9ymQBMYzPPk1ACbkmUcL7g6gd6pRapH/nHskCFmKBienvbwCOaK
 d+zAwogd2ej09zPBv/lTtocuprUNnzGjHaRqrNcNKtk104w+wUJcCu47Rg3xbVl41VqDcXMAHmv
 YJSFVhvxLB+Ed9i1KXvJpg/Z5fhf42C/0b+Pk79+of+w54CjWtu4bayq6wwTepm4rDRbsWGP3Rg
 c7ac0/WhCUEWhQG0Ee59aWPO+UIr74kZhIY2RhrTFAqa4BleCYlfAPcWhkJc8LyC4XNBaYOwMpI
 VWY3tTo57E+/jF8N/+3P/oey2aXLa0MnVygD1vGOf2zB7cm593gKQR7rPbGvEOi4rHz+cBVqm3i
 U60ka2LeTlr5N0wPAf33YTU6Px8Q1RaLRxO2w5Pn+DAGEp8/gxr7ggeVmRy9OtzLOOePgNWGvye
 5ahlPFQusfH1q0H+U6ZTPO9S5OWkqcirR0dKTremz2v+lCILpzRZQaNcoP1pGdjrsFkglQ/x2B2
 2roUs7ZnjA+o7IGaidHRTFfJrw+ftWvtaprGxMZ39147dbH35BHeCzuJK7VbyJl/kDtI9EzJpk5
 4Aeq1/atbDe1s4g==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_153649_441223_78BDADF8 
X-CRM114-Status: GOOD (  18.98  )
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

The latest (10.x) version of the firmware for the PM co-processor (aka
device manager, or DM) adds support for a "managed" mode, where the DM
firmware will select the specific low power state which is entered
when Linux requests a system-wide suspend.

In this mode, the DM will always attempt the deepest low-power state
available for the SoC.

However, Linux (or OSes running on other cores) may want to constrain
the DM for certain use cases.  For example, the deepest state may have
a wakeup/resume latency that is too long for certain use cases.  Or,
some wakeup-capable devices may potentially be powered off in deep
low-power states, but if one of those devices is enabled as a wakeup
source, it should not be powered off.

These kinds of constraints are are already known in Linux by the use
of existing APIs such as per-device PM QoS and device wakeup APIs, but
now we need to communicate these constraints to the DM.

For TI SoCs with TI SCI support, all DM-managed devices will be
connected to a TI SCI PM domain.  So the goal of this series is to use
the PM domain driver for TI SCI devices to collect constraints, and
communicate them to the DM via the new TI SCI APIs.

This is all managed by TI SCI PM domain code.  No new APIs are needed
by Linux drivers.  Any device that is managed by TI SCI will be
checked for QoS constraints or wakeup capability and the constraints
will be collected and sent to the DM.

This series depends on the support for the new TI SCI APIs (v10) and
was also tested with this series to update 8250_omap serial support
for AM62x[2].

[1] https://lore.kernel.org/all/20240801195422.2296347-1-msp@baylibre.com
[2] https://lore.kernel.org/all/20240807141227.1093006-1-msp@baylibre.com/

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Changes in v5:
- fix build-error when CONFIG_PM_SLEEP not defined
- Link to v4: https://lore.kernel.org/r/20240906-lpm-v6-10-constraints-pmdomain-v4-0-4055557fafbc@baylibre.com

Changes in v4:
- fixed missing return in wakeirq error path
- updated trailers with reviewed & tested tags
- Link to v3: https://lore.kernel.org/r/20240905-lpm-v6-10-constraints-pmdomain-v3-0-e359cbb39654@baylibre.com

Changes in v3:
- change latency set functions to static void
- Link to v2: https://lore.kernel.org/r/20240819-lpm-v6-10-constraints-pmdomain-v2-0-461325a6008f@baylibre.com

Changes in v2:
- To simplify this version a bit, drop the pmdomain ->power_off()
  changes.  Constraints only sent during ->suspend() path.  The pmdomain
  path was an optimization that may be added back later.
- With the above simplification, drop the extra state variables that
  had been added to keep track of constraint status.
- Link to v1: https://lore.kernel.org/r/20240805-lpm-v6-10-constraints-pmdomain-v1-0-d186b68ded4c@baylibre.com

---
Kevin Hilman (3):
      pmdomain: ti_sci: add per-device latency constraint management
      pmdomain: ti_sci: add wakeup constraint management
      pmdomain: ti_sci: handle wake IRQs for IO daisy chain wakeups

 drivers/pmdomain/ti/ti_sci_pm_domains.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
---
base-commit: ad7eb1b6b92ee0c959a0a6ae846ddadd7a79ea64
change-id: 20240802-lpm-v6-10-constraints-pmdomain-f33df5aef449
prerequisite-change-id: 20241006-tisci-syssuspendresume-e6550720a50f:v13
prerequisite-patch-id: 945b15416a011cb40007c5d95561786c1776bb98
prerequisite-patch-id: 69a741b9c81d7990937483fc481aafa70e67669d
prerequisite-patch-id: 15e97947da8cb7055745151990c756d81fded804
prerequisite-patch-id: a0efbf22e69d23dba8bb96db4032ca644935709b
prerequisite-patch-id: 2999da190c1ba63aabecc55fae501d442e4e0d7b

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


