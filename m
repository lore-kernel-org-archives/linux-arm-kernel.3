Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2450DCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 20:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNXWXlHT5+84YH+qmxDCb+3VQowVLVSncoXOi7xa9mU=; b=WPWQ04a6aMO2WmpirqMSbIWjYu
	CvJeV55OS4fr/yXNlbKTwryYYi8ynRMYCteFlYDV9MjLrXjlc4hj1ANXqWT1ycahU+o3G+BvR3Rg7
	rcUmtg34ZrFoY749o2YlKvCQAop0g9oAcQP407QQqfsBWcRJYlAqTGpFkn9wB7HNqdngbjy8P1e4t
	jJLpJtgZHw9gUEPkDfgLO3Qm/bwJBUDX+/f+stPNLg0b+SUDLkxwStvxAWQCE71NuUVv96FFpXVya
	yL+A10eI18Hg1bk13rgXsLDl8neLNKIHO5LbNF3aMx7OGfLyfR18A5nRFtKdjefjXVSZugsMoi9H+
	cIwWPo8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K8w-00000003PpT-2tIo;
	Mon, 29 Sep 2025 20:06:42 +0000
Received: from mail-pg1-x565.google.com ([2607:f8b0:4864:20::565])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K8u-00000003Pp3-03oY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 20:06:41 +0000
Received: by mail-pg1-x565.google.com with SMTP id 41be03b00d2f7-b523fb676efso4989281a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176399; x=1759781199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNXWXlHT5+84YH+qmxDCb+3VQowVLVSncoXOi7xa9mU=;
        b=N2uDnrLbf4wlwWShzufDlFTQ2Pqwoy2Fv3urFXhNnKAz5ZyLSX6mvxtBR5kFyVXoLh
         5P7a4fqSBB/7lGRv24BZG7SEyg2kqBW+9M70feAJF2k532DNF4hss+e2uCY8Zf5j9DF4
         LG5ITXB3JQpFuyU9Wc1cZkBOR8CIgiZv7o9lZuvoGlzxdJwuZ9xurHuPvGUNqjloCfqX
         QPiUX4z9HbGOypGgVrj5OuEb/CZWA5+2nbGzJESueGS/AO1pU7A3S+P5C4u/YRSYfyec
         UaKq8vjrapzFQ2EaKpT3WOAMv+GwA9xF5AM0LuPv67knhO6CyfGW48p9g1Ms2X08PyKX
         /HOg==
X-Forwarded-Encrypted: i=1; AJvYcCVTiLgYKnXieP+oSsowE4vY94+ZR8DjVL38rpmlGNNVqhW9G66/AKhOrjEZhcR8Ed3C6IrtGlWIKxhOhVSJYNoz@lists.infradead.org
X-Gm-Message-State: AOJu0YzAWzMtYFU5og7Pn9OoJwO6q3Qeuvb8C+TDnRL3q533vbQkzDGh
	nVugPpcrECrCaWiY/8u/nlmUS/LjVJMQwcfcMvGqhnwIhrzz5pdbLfA0WPxIKlnFHZbOXOOhpCp
	wkSxNDDJ5qaHCqPujiHnNEo+VN7bT0NS0KnGDQXyrYE7lhyStxSoo78DKkcY9f3Kg6Cc5J77TCg
	t57xh3Xl6lS7BhvvYL0ludem+eFmbIL6UVOsGBEG4gqPI1WbKot4OeTRoVIUm1uZfmaP2Yu04lV
	/+Z3hHTovWapsEeN/yxj9R77/FyHg==
X-Gm-Gg: ASbGncsIyXjh1fFeenJGBFEiIBAXTUB1pkQnn+uVP7NzFs8kWEkyXnWVLN3Os4tLMpa
	+8UnidbUV+KS35IOrxpMtlW6kbbXRGxn+YGoXXT0Few1x7OS4+pCzu6/tXjEPpfcokl5Rx3+BaN
	RFgD7vxh7e/K87Zy94miQ7jhtItC/U9J8B3XXaxOVrKtuE10zQ7JOKyn7LK8go8WfJfVkmBInnb
	7On9eFOQfIFbPMfqMwVYOShgVE+NqEyVCtnqUAPVuLN/6ZFX3C32NzKrOWJZ+NXImSMApvyprnA
	1OOcBhK0n9FNNoEL2aCVMzoKZDDSv1L3sA5HiH2hJfezqeWo3ZS1xHKnMkb8SC+qZSRBjL8g3+O
	eE9vpF/6ngdLmWmigC1dT1sH7Aae9kqKR4T0wMMxXjJd1Cai/qI0jixl7eH6M88SA1gPFmHedW3
	A=
X-Google-Smtp-Source: AGHT+IFOCdrQI77lE8iRG0Xi+AeKp+X6DbULhPjq/WFfRboSetwKOkKLFI1N0zIfTGnUORU0Mj41EzT4X4Ee
X-Received: by 2002:a17:902:f688:b0:269:9adf:839 with SMTP id d9443c01a7336-27ed49d0be2mr203344725ad.19.1759176398729;
        Mon, 29 Sep 2025 13:06:38 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-27ed66dc6fcsm10348035ad.16.2025.09.29.13.06.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:06:38 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55153c5ef2so3400964a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176397; x=1759781197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNXWXlHT5+84YH+qmxDCb+3VQowVLVSncoXOi7xa9mU=;
        b=Vep7dTKm8UTp8LzPvJqcTNW4klRBCacNhdQ0S76xIbCu8pYCMywZjHSS3yGoD+RaZU
         5hIpjSBZAfYb7rfNqH8+F9P2AFaUH/1hmPfsI4lsi5TzPUS3CuXl4tXfALnIWIO5HQCT
         t64CwWJbdh7PcqDIFogfKK0z+Ws8EEOKTM6E0=
X-Forwarded-Encrypted: i=1; AJvYcCUA6tQsvG62e7J1xpw0DPdfIzFqLgEUWqgzoHt5FOGg/dm1Lw6fW6DKeOA3ZNsLnBJ9k66VkouZAJ+K4RZ4WIa3@lists.infradead.org
X-Received: by 2002:a17:90b:4b90:b0:330:a301:35f4 with SMTP id 98e67ed59e1d1-3342a296f22mr20564265a91.20.1759176396992;
        Mon, 29 Sep 2025 13:06:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4b90:b0:330:a301:35f4 with SMTP id 98e67ed59e1d1-3342a296f22mr20564239a91.20.1759176396554;
        Mon, 29 Sep 2025 13:06:36 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:06:36 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 0/3] Adding brcmstb-hwspinlock support
Date: Mon, 29 Sep 2025 16:06:23 -0400
Message-Id: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_130640_366353_C2505E4D 
X-CRM114-Status: GOOD (  11.72  )
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

This is standalone patch for the harware semaphore feature for
brcnstb SoCs. The initial patch was sent as part of different patch
set shown below. That was not accepted, however the hwspinlock feature
is geenric for all brcmstb SoCs.

Intial patch:
url:    https://github.com/intel-lab-lkp/linux/commits/Kamal-Dasu/dt-bindings-brcmstb-hwspinlock-support-for-hwspinlock/20250712-034624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250711154221.928164-4-kamal.dasu%40broadcom.com
patch subject: [PATCH 2/4] hwspinlock: brcmstb hardware semaphore support

All the review comments and build warning have been fixed in the current version.

Kamal Dasu (3):
  dt-bindings: hwlock:  Adding brcmstb-hwspinlock support
  hwspinlock: brcmstb hardware semaphore support
  MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver

 .../hwlock/brcm,brcmstb-hwspinlock.yaml       | 36 +++++++
 MAINTAINERS                                   |  8 ++
 drivers/hwspinlock/Kconfig                    |  9 ++
 drivers/hwspinlock/Makefile                   |  1 +
 drivers/hwspinlock/brcmstb_hwspinlock.c       | 98 +++++++++++++++++++
 5 files changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
 create mode 100644 drivers/hwspinlock/brcmstb_hwspinlock.c

-- 
2.34.1


