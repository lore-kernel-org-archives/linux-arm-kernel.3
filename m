Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1427C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7skpOByzW+hOTXagKwoSr9X/HjtkTFtxhdBwxlew5M=; b=JxqbNMhJXOGuweq8kOVGj08FTh
	73rag17yXCQbliPcLWBT1xKUTVc8MjHdsLMxOriLpYOqZ6PIMHw+b7ZDMw4Sx2Q9Cjnze6e153Z0U
	6eKGFP78XdKxMl9RLbqQFkKMX9MSZo0m0wlF6gmHY852112vVzTyVhFQYCMZz4FVM1GOI/nTVAhjm
	cuDmf9HEimXbDEm/Jbp0CelhgF3o3Ted45kcDptfVWSAuSpQCBQylV5mdxYzoRzAJimJLMvdbuzTS
	VeI+GPXxVkyrlYNskCwxJJDr/leL2UnG4OHM+M72GA7GjsPR21dzSOMYFXlwXoT55lP/b+uYMAyAv
	G0BQOJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGak-0000000FHfX-2CFq;
	Fri, 11 Jul 2025 16:27:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtS-0000000FAxS-18jp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:42:35 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7494999de5cso1546940b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 08:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752248553; x=1752853353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7skpOByzW+hOTXagKwoSr9X/HjtkTFtxhdBwxlew5M=;
        b=Vwo585TDIGwrCXS0tF/R7nLVxARok8zWKoDWIncI9lkOTAKXrZjKc23BjBp+xpuWNl
         fpB3gexs2boFlQim+9TCz7FkZe9Cpw/nO44qAVLoPY8M1veipq566W27Wcl3Qz3rjg6c
         oymTHyZDkFjPgKyHMGXHkBxAX1tN0LHnODWXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752248553; x=1752853353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7skpOByzW+hOTXagKwoSr9X/HjtkTFtxhdBwxlew5M=;
        b=SUhHNmH3HXhilQEhO3xXePBF0hFliFhx7ZV57JZnvdGDkdmUWRKAVFJ+BfjGvctx6K
         Sxl0xWVee4BkMAhqmwfZ+0YzDa63qxsxDmdY2x+lGSEurY00hH8jOFICmG25ELQfAudE
         o3KQQh/icKVJulpDqVGu4aim25GXm2lm8ycYx0k0TOcRq8Wapc+AbCmr46JLv6pt84eK
         SbY67n6B+/qvNvITZcdEbusj1QA7lt22T7QFiH1J1Mci95c4XbnqqpfiJjNUmYthIU/n
         7IsKU9Kr0VCAIyN3HGIoidIA5OVma6U9m0az1GSj5nCi36sbUJhz6vmitNuuYI9+D73E
         ih4w==
X-Forwarded-Encrypted: i=1; AJvYcCWotNnBj0tX93gw+NePoC8JQTRY0tuP3tbBx0aqAGwCinXrMTwW9Azxvo1zijIHCbC0OQhBs0fTOmYp90lnQxWn@lists.infradead.org
X-Gm-Message-State: AOJu0YwtRghMRqxyTKrzq0vcQRx4akZOWdX4QgNcScg8MM/jdJ1VqAeh
	bO7qI6gSGCv3TZxluN091hJUu8S2uIgumiSipmpf9PHqB5vFmU4bV577d9Ncs48LNA==
X-Gm-Gg: ASbGnctTczocCEN9MUINPBTz0lLiIq1pyBguDcUJDAnVt40CPToQkvycf/QQQVMx9wT
	RaUUuDdjDSfb3H36qjXxBml420JodkoT+vIrpw2yKjuAH7mHYNn+227RYnY3LggUa1febFKf9NM
	DSEvtp5eT+ET1dhri6SBhhVXHctaiWuZennHpogKGPtWfsXpXq+JGKNGvwKsUmT3/Xcf1i4yFFe
	3RJU7YJl394ONWKqz2t+N7rAI9cN15ygFoxJGWbUMYAryY9vywlDpyLKItPYHCjO4flfwsldllE
	Q4jBtRBSVwK0dZPcOW7auPr47I/nSiU7ocUyghpYktwxMeCYKGmYegyOa9yKOJl/9IyjJNqpNQn
	a1dKWZXtxls5380GYB9321HqbwBUEGwCf1ZKySFGtXyQ+lNf9NDYoBjRd/Q==
X-Google-Smtp-Source: AGHT+IGDEkar+diQDXAFzWseo9mmENOlTrd0V0FLWObaE74a9KCtE2gcym2rmo5BmC5WxmqYeQa0ow==
X-Received: by 2002:a05:6a00:188c:b0:74d:3a57:81d9 with SMTP id d2e1a72fcca58-74ee0ab538cmr5458867b3a.8.1752248553448;
        Fri, 11 Jul 2025 08:42:33 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5ccesm5762420b3a.27.2025.07.11.08.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 08:42:32 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	kamal.dasu@broadcom.com,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH 0/4] mmc: sdhci-brcmstb: rpmb sharing by claiming host for TZOS
Date: Fri, 11 Jul 2025 11:42:17 -0400
Message-Id: <20250711154221.928164-2-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711154221.928164-1-kamal.dasu@broadcom.com>
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_084234_308475_5EC920AF 
X-CRM114-Status: GOOD (  13.50  )
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

This patch adds support to claim host for TZOS RPMB access and synchronized
access to the controller hardware using hwspinlock framework.
To achieve this Linux OS and the secure TZOS make use of:
- shared hardware semaphore register
- a set of SDIO shared work registers and
- IPI interrupt registers 

The currently running OS that needs access to the controller puts itself in its
slot of work register and if its next in line it can try to grab the hardware
semaphore and complete its mmc requests. The shared work registers indicate next
in queue to access the controller, and current agent in the queue. Next agent
queue state is changed under the hwspinlock is owned by the current OS accessing
the controller hardware before release the semaphore, send and receive IPI
interrupts between linux and secure world are used to indicate completion of
transaction to the waiting OS. TZOS has its own RPMB driver which accesses
partition when it wants to read/write RPMB frames. Current implementation
assumes Linux and TZOS as the two work agents.

Kamal Dasu (4):
  dt-bindings: brcmstb-hwspinlock: support for hwspinlock
  hwspinlock: brcmstb hardware semaphore support
  dt-bindings: mmc: add brcmstb share register and hwlocks reference
  mmc: sdhci-brcmstb: rpmb sharing by claiming host for TZOS

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       |  36 +++
 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |  29 ++-
 drivers/hwspinlock/Kconfig                    |   9 +
 drivers/hwspinlock/Makefile                   |   1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       |  98 +++++++
 drivers/mmc/host/sdhci-brcmstb.c              | 243 +++++++++++++++++-
 6 files changed, 413 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


