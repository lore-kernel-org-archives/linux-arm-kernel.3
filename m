Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08406F45A0F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 23:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=huYHr9pbT+aIbCmPuPJO5mChpAaAzejhwMiDIrUto84=; b=P4wrDeQT69p8gV
	9zuBc8j+MjVzTAOBhlmsQqvLdbE4NtU1KOxxODSLnlRv4ydMb8BuH4R0IRzp57LBltsp3+Hbgvwir
	JBs43JVIfJaxKOmsarSePjMzKuletnXZteYPDWg8h/UCLJXV9y5ABF4TTfjfxPDrJ7N4F9tOceMl9
	lWJ61tR8TIXIlv/RyydczXxkPgPfgAfVgdAJWyrfYBqF3FmM0X1reDt92GWycmpi9QPaJb4QaP/GA
	ruPDHAs6RJWzYDzjso765ZtuFGY3fTAVRZCryLkUVCw0Cw6pmWiS4L+dlKxnpOVdX0lqjIi7KU8vv
	D9lqbl1B/yUaScWIWdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLWy-0000000CwBZ-1qB9;
	Fri, 10 Apr 2026 23:44:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLWu-0000000Cw9s-3qvT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 23:44:54 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82ce49785a0so1220199b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 16:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775864691; x=1776469491; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=huYHr9pbT+aIbCmPuPJO5mChpAaAzejhwMiDIrUto84=;
        b=MG+wLcfWxadKlyzejnFSYH8HoH94bGdiXRuv2sy2OSB8ONtjbyxsOm/412B5+rXJvf
         f+DAG6/5plSvgqWbNuA/fIuL3E3mVnz8j1vSdQgDd/pDizXxr2XXxgALQGknjkX1Xr6v
         8l0pcOHtjT70swfeEK9nVGGNjlC5F2DXo4+TEvE7MJOmBQxKu2W43gmbZWhrmOE63zwD
         I7vreY5HtyYfPXZ3Fp73V+Tmf6ibARicVMMerax35JHuBzmedQ/MKJzX+mjFczGRd09B
         dhaB98okLLHfl5kpn5R72VTHX9Z8zkpdgC3GcWDk/GE9Yqj0zC8GqJP3BWI7zt8fq9yY
         xu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775864691; x=1776469491;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huYHr9pbT+aIbCmPuPJO5mChpAaAzejhwMiDIrUto84=;
        b=QchcJyKbI/QQtyKszX92ZiVHOC0oMsmHO7qMNI9lmcyf13SIyEw+0VMYUAchSzgk/D
         cZIwJRFbIgl94XGUBdIhR9n8rhiNK/WHMHIbter9mDuxJJ6WtRPN3zwYOx9Jt4Z6GH7A
         Gr8ZrWbiL778qhLgJgAGd46HjpXKqj+GoG4A+LGv1ynFsG0QopyJ02kp2Z+zaS3QhnLG
         HaBkzxTKks6Vkm3lV5jTR7hRiKzTkBp9kksHQkyybPHywnMDBOQSSal0UIlLJfd2LaPs
         euOQw/Glel2fZipi2gtXtQ0FVKtsYy2K2cKvehDiE9sqJXB9APYY8HdcNN2OxotgiyNt
         ceDg==
X-Forwarded-Encrypted: i=1; AJvYcCV00Q+Enaaw9Wy3u5P96sTzi9Iq7++IyDoYpxUCiizpA9h5exCRZuCtCdfoBVl0UlgwLIOjBTVNOid50u98orwQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdr1S2cvPDx6hzvNfWwpKzym2joYd57dT4p0KwttesCCH+Xor6
	RyGzrz/PwqRxlQLlw6njXGcVTxYqQjwjjJkFo5Z3FxQAhSCt1j3iBXxIeWPydYJdvjI=
X-Gm-Gg: AeBDiesJlTTGbvr5rvKKuYnBPP8XRVSRP/TpbLSpSrUt240dg17RiOxDVzOGF3YAA/w
	ynhUnv+CNbBJjDSZkD9hrbHVHVB1phPVfLtiMgyCgO1mcjOpAqtST3Oexoxbn3B+9kbR4g5x/Ls
	qrLVQ0KQyBu1m+Tn1gKeLCRam1pjoa5BE/592aR3aJ+RAeXnEn70QZOWkxd9eJ8OvYMiKrK8Ad/
	a2PfwGTWqe5Emleu+x+VXNMI7gvBf0bI41SwUff86UdJ3wlOTRGFRNb+zlwtawBiL739N0vlDiO
	5+co+w8Z/udwOlfd0cVV0Z3zKoAOUQvjlDqwOkAzuLw95o4O1LchvG6q9A8HitWed9uVVhCr6Or
	DEBigACQ/1/JuDPI+ojNN7iagpzShDz4nHuQEOAn5u+hu1y2sLCZDPUqiakihGo+3aztj4tPUje
	J7kIlNjaw7FSYciHr7Dys=
X-Received: by 2002:a05:6a00:2291:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82f0c131fe8mr5687894b3a.6.1775864691397;
        Fri, 10 Apr 2026 16:44:51 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50d24bsm5199585b3a.57.2026.04.10.16.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 16:44:50 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
Subject: [PATCH v2 0/3] pmdomain: core: add support for domain hierarchies
 in DT
Date: Fri, 10 Apr 2026 16:44:35 -0700
Message-Id: <20260410-topic-lpm-pmdomain-child-ids-v2-0-83396e4b5f8b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOL2WkC/42OTQ6CMBCFr0Jm7ZgW5CeuvIdhUcogYyjFthIN4
 e4W9AAuX/K9770FPDkmD+dkAUcze7ZjDOkhAd2r8UbIbcyQirQQmRQY7MQah8ngZFprFI+oex7
 ayHmkrM1LRXkpTgKiYnLU8WvXX+tv9s/mTjpszh/h6PGMu+GLQaM8obbGcDgnc3GUFWzVnn2w7
 r0fneVO/vdpligwzwpZVKWSVdddGvUeuHF0jCtQr+v6AeWCMlYGAQAA
X-Change-ID: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=khilman@baylibre.com;
 h=from:subject:message-id; bh=aPM/J6Atyc6lQWjkUGFT2TxILqNUCfZT//AqqZmtYrw=;
 b=owEBbQKS/ZANAwAIAVk3GJrT+8ZlAcsmYgBp2Yty8etfKsq26Uwcdeie8PHr7MO6o7FocgTRi
 Dsr/NXJk1aJAjMEAAEIAB0WIQR7h0YOFpJ/qfW/8QxZNxia0/vGZQUCadmLcgAKCRBZNxia0/vG
 ZciKD/9w5DzMzDtkLd5MFvW6NXTCrw7RU+nBKNEmAkSIKvwJJNIiVjKky6HXf7s3WaEfLY6aQQI
 TVzGCpWNNprKPNrTSFDoki3zzuSKoULopyeOodq9U8kYJLfyVMOA6FUdltIArsiHyeI8U4AswFU
 /pNN97hk2zOQfdOLYnhrnKMGZj7dfUrlp/2XdmwVcTH0wMdL2EUJWgo5nhpOXCcXmqTo0Q/Wrly
 l4WzqxaTqYWL1k5FAeJQlyL/D5ybDcP/iwk98ElOjOpBhbwpnXlthwMheOldPNkchGkESngwDv9
 7qi3AAuK4/RAbvHr8H1NwuLA0rBb7GdzTUmBTQeh1jS9AL+5ADu0gwmMS7lBul31vbJ7ikrq+zp
 o1KBTCSiYtVYEeXa53E7iCF05XLc9AHrffhF5BGsMu2xsdemEK6hG2PURiRrXNwDxHhxm2UFFt5
 xuwxzaD/9XGOaOFXLFuIubVzI9Kv/RcawuzKLRmi5sMPNYq6Enjg59VtScYIi+gW1LMKpmHZBoy
 XiPHF+rNtaOC4DR/3bmjM//WzuXiCkbNJnYQEVVGIeAcdxQYwBU7NGFN1rZHzQzQHv93PLoFlx+
 uCHusFOjLcJES5qUWbBqXElwAy538ZgFsJ2mD/cLy6ylDsak+dfhvD9Ducp5iUixDLjEfcShLL5
 lu9h+4pnWLivOfQ==
X-Developer-Key: i=khilman@baylibre.com; a=openpgp;
 fpr=7B87460E16927FA9F5BFF10C5937189AD3FBC665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_164452_969724_46EEE0AF 
X-CRM114-Status: GOOD (  14.46  )
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

Currently, PM domains can only support hierarchy for simple
providers (e.g. ones with #power-domain-cells = 0).

Add support for oncell providers as well by adding a new property
`power-domains-child-ids` to describe the parent/child relationship.

Also adds the first user of the new API: the Arm SCMI PM domain driver.

Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
---
This idea was previously discussed on the arm-scmi mailing list[1]
where this approach was proposed by Ulf, and then an initial RFC[2]
implementation was made.  From there, it was suggested by Rob[3] to
use a nexus node map instead, which led to several more versions
attempting to implement that, culminating in v5[4], where Rob and
Geert then had second thoughts about the power-domain-map approach.

Therefore, I've gone back to the approach in the initial RFC[2] to use
the child-ids approach.

Changes compared to initial RFC[2]
- dropped RFC
- rewrote the parse/add function to use iterators/helpers from of.h
- add a remove function for cleanup
- use child domain language instead of subdomain

[1] https://lore.kernel.org/arm-scmi/CAPDyKFo_P129sVirHHYjOQT+QUmpymcRJme9obzKJeRgO7B-1A@mail.gmail.com/
[2] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/
[3] https://lore.kernel.org/all/20250528203532.GA704342-robh@kernel.org/
[4] https://lore.kernel.org/r/20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com

Changes in v2:
- dt-bindings: fix warinings from make dt_binding_check
- scmi_pm_domain: switch to dev_err()
- pmdomain: core: fix locking around add/remove domains
- pmdomain: error unwind if any children fail to be added
- pmdomain: fix node reference leak
- pmdomain: ensure power-domains and child-ids properties are same
  length before iterating
- Link to v1: https://patch.msgid.link/20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com

---
Kevin Hilman (TI) (3):
      dt-bindings: power: Add power-domains-child-ids property
      pmdomain: core: add support for power-domains-child-ids
      pmdomain: arm_scmi: add support for domain hierarchies

 Documentation/devicetree/bindings/power/power-domain.yaml |  34 ++++++++++++++++++++++++++++++++++
 drivers/pmdomain/arm/scmi_pm_domain.c                     |  14 +++++++++++++-
 drivers/pmdomain/core.c                                   | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h                                 |  16 ++++++++++++++++
 4 files changed, 229 insertions(+), 1 deletion(-)
---
base-commit: f7b88edb52c8dd01b7e576390d658ae6eef0e134
change-id: 20260310-topic-lpm-pmdomain-child-ids-e3d57ae57040

Best regards,
--  
Kevin Hilman (TI) <khilman@baylibre.com>


