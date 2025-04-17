Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D2DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HatUJR7pfydRpRerJllcyKfpU70Imz3ne8kyK9KNniw=; b=jtvUW+AHc6mDlHXmDiUgzJOT87
	vtP9w8wXpuUp5NUnQPWfZ7KTfOR0YnP1DF2VtltPK/hwVor5Fzrfifw5Pd5NrGFYLgPLr1EwDMYT4
	Ty/8yUAJW9Fxu0rPBetNauWYWJvk910RsOeIG2giYtxP/atNwhS84p6DPAIl6bhNaMp2etFtanKEL
	McaYLGGrTwUagITDYkppxnZGkknYEjwoyT1hMH1T1pq2aRbRX8ajJw5cd3wNIrEKniLVQvVeyYsmr
	wYjnRj2JHl9WQ3pt0Kp8yo9TJuGoHC0FnXmqe7RWLH4UYp0TMHMeypW1Cmjo/n4ansKj9foUKLTjH
	KUHNCtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QDx-0000000DJQf-46au;
	Thu, 17 Apr 2025 14:28:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBJ-0000000DId0-1CJ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54af20849bbso984007e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899931; x=1745504731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HatUJR7pfydRpRerJllcyKfpU70Imz3ne8kyK9KNniw=;
        b=zIn94eIQXcPkokt0EOr7Seor1bB2m7L8EJCK6x0t6bvdelOD0e8VAhrILrs5XNlJNV
         D5dYTExjNdIABX+JB57WfIzcBDK3KTxEw6CYRwsS4hdYBHIvtO3YVEOrsho3Dr5WwSVp
         4nRZP438ZgK9l7gR9m0OPOG8sx0SLBk+0QOywH20POA/mQLwau2NS/EogfbxDuABwEKF
         XHH93V4IBLiezsil7fTQOJu3Wtf/tWBfLA5V/p+qHvMPDQ+PC7U5jtNSS6xNaZumoyha
         pEPRiP28E3m+4gh3VZjRYI/Si2kdpqkI30XqVK/gTC3zZCP/V3Pgfezr5QDLr9BN6z3C
         U5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899931; x=1745504731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HatUJR7pfydRpRerJllcyKfpU70Imz3ne8kyK9KNniw=;
        b=weATtVZPEQuDmtY5Cw+ZdRVMKPHGLPo6zIvxJyosW+YFFhB5qz9nAJopjgwB7tlEpo
         ksc5u76uoLL1AjyUbDIoD/6SHlpwSMqztd8sglndkxZHY9GFDWxOESiSuijlRi551CqP
         8QtX3ra4vy8Pr7XKYgmqcTi/Hoh30UWPucXIvNs7A1C4sT8z8PUIbdieAWkO4howP3rQ
         be1dXOYRKKmRc6FAxJupONe5N33q0uvdcMrc1sFOdFpIHS1S80pZ/Ih7uM+Nqotul26l
         8HWDjEbn9l+A+U1gYOHCPReb9gpP1Igwv74KRP4aHLgVnOy38QEb4k6BpLEbwweOkPSz
         Rn5A==
X-Forwarded-Encrypted: i=1; AJvYcCWpuhvAhnSmk8bni+VTnWmrJ9H5Ee4kA/o09qzr1LQnM6BwKX0KCKYUgOBwBU6R5RA9vS+YrmfHWAXtfeJU3jCc@lists.infradead.org
X-Gm-Message-State: AOJu0YxP/nSDbkXNK5/9I7ev71MdKOjplWpBYmZDa9v9crW6UYQheLcC
	nUeOOpIw1sw3H7Afr8/oC2+g74d9X25FxoTLpqszDcM9XSj25bS5VO6ur01mq+M=
X-Gm-Gg: ASbGnctuGFeKK0nNO0GP8QRiIF1omjB1h1GEOOrlJP72GkW6WZNyTtBhxW83UQRkpFF
	AtP83Bb8MSGMepw35+6fwoKApad/9FQji6GqRyrRtCRS8oscS9Plev691/2+A+7dBrQzjdgCCZo
	ArrwZmaXapUGi1fM055FSa8J2oBR46osxr6rCQo5ecxy3BiwisGxPs1SUkvuJX2PZ8tsJD0xGKV
	0kYi774fGJxudRu2y7OVAG9px/KetQjMEDeoFK3uIrrsthcg2djP1hRcUvuWuxggBvj5n2XZn9D
	18EiALvz/XXkyj8M+dryERDxw+mSeG4WEZd8qXn9GB79mbkO374HwoCW4AGfLlJCT1YbATEATpJ
	llLKQv3dZxgI+qkffG6Ilf38TWA==
X-Google-Smtp-Source: AGHT+IG6EsCnUo0eKWDGOg3mkKPpm5BPPY+Ezrmv+DqY8QKeGQ18bV/SmzaWgDutPvEppQHb4SvtsQ==
X-Received: by 2002:a05:6512:3e11:b0:54b:1055:f4b1 with SMTP id 2adb3069b0e04-54d6479a217mr2124920e87.0.1744899930795;
        Thu, 17 Apr 2025 07:25:30 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:29 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] pmdomain: Add generic ->sync_state() support to genpd
Date: Thu, 17 Apr 2025 16:24:58 +0200
Message-ID: <20250417142513.312939-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072533_325526_923EA458 
X-CRM114-Status: GOOD (  12.93  )
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

If a PM domain (genpd) is powered-on during boot, there is probably a good
reason for it. Therefore it's known to be a bad idea to allow such genpd to be
powered-off before all of its consumer devices have been probed. This series
intends to fix this problem.

We have been discussing these issues at LKML and at various Linux-conferences
in the past. I have therefore tried to include the people I can recall being
involved, but I may have forgotten some (my apologies), feel free to loop them
in.

A few notes:
*)
Even if this looks good, the last patch can't go in without some additional
changes to a couple of existing genpd provider drivers. Typically genpd provider
drivers that implements ->sync_state() need to call of_genpd_sync_state(), but I
will fix this asap, if we think the series makes sense.

*)
Patch 1 -> 3 are just preparatory cleanups. 

*)
I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
Let me know if you want me to share this code too.


Please help review and test!
Finally, a big thanks to Saravana for all the support!

Kind regards
Ulf Hansson


Saravana Kannan (1):
  driver core: Add dev_set_drv_sync_state()

Ulf Hansson (10):
  pmdomain: core: Convert genpd_power_off() to void
  pmdomain: core: Simplify return statement in genpd_power_off()
  pmdomain: core: Use genpd->opp_table to simplify error/remove path
  pmdomain: core: Add a bus and a driver for genpd providers
  pmdomain: core: Use device_set_node() to assign the fwnode too
  pmdomain: core: Add the genpd->dev to the genpd provider bus
  pmdomain: core: Export a common ->sync_state() helper for genpd
    providers
  pmdomain: core: Add internal ->sync_state() support for genpd
    providers
  pmdomain: core: Default to use of_genpd_sync_state() for genpd
    providers
  pmdomain: core: Leave powered-on genpds on until ->sync_state()

 drivers/pmdomain/core.c   | 273 +++++++++++++++++++++++++++++++-------
 include/linux/device.h    |  12 ++
 include/linux/pm_domain.h |  11 ++
 3 files changed, 249 insertions(+), 47 deletions(-)

-- 
2.43.0


