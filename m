Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A1FCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yOfbXfp6ub02CLaVkSzncgam2NRXSN2eMhn2KnSsSd0=; b=VpBn4kOO79NajeNvVrkkp1QC4V
	4bFhaPD8XHvMZhd8BGgMWfYv0tBVFq+UVH3DU5Os0pstfVidS095ueb8EklscpMIsJXsGTCT/3neS
	2+2cjACM+xJbvDQjSraEJSjQGFZ/0SrWVdVlcV1hWBSMTLMq0KnzpVBTNL9BtIsDKn4BcG3aXeF7p
	7rf63/QDeSUedj+0+SPYUKckyWE8E/WjE5e1ejnhwwk3WqZCbBRO+ieWixIoM89kbjtv/Kj+swham
	jwj1KlnLSCgK+fhNT02a5yXdHlYQmpbSf884h21C/qrla8R+X85vMQ/T2vOoULsDB7j0nOIUa4Elr
	5ZpU2qbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCWj-00000008HNE-3Wwp;
	Thu, 01 Oct 2026 08:52:29 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCWg-00000008HL3-0vPm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:52:28 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610010852204e71d2550200020736
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 01 Oct 2026 10:52:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yOfbXfp6ub02CLaVkSzncgam2NRXSN2eMhn2KnSsSd0=;
 b=pDn4MZM+/qgU33ijPc193ZPMjNuZoCFP3Zv8BNZDmuco+rPp+RIXRcK74TTgJW1x5dSbps
 GLYZI96ML7kXlbRosOcMP2gZoH0BGRRt9PqDj+LS0BcYZyFGussWkmlNRDETXMx9p5tgbeM/
 bUdmbZQLWjHuJ5DrmqshemH5407NykB5cydcj+Jcinf0nB/DdmZqXv/aaz3oDGWTfxYuYynD
 HMwbMff14FFF5YOK3vGDrAKmY8c6Has1ZLsN3X+AsyUkAECFZi4dR5KRbmaGIowOTPejQ+WH
 kcpRRQ70QvkYrhlSX248MoaNfRswNTBDiGFAjaIm1WnYSPi9wSPiHjwQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: fix group/function table leaks on consumer re-probe
Date: Thu,  1 Oct 2026 10:52:09 +0200
Message-ID: <20261001085217.1778645-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_015226_899000_448DB3CF 
X-CRM114-Status: UNSURE (   9.47  )
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

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Pinctrl drivers that create their groups/functions lazily from the
consumer's device-tree node in .dt_node_to_map() leak the per-mapping
tables when the same node is mapped again. The core deduplicates
groups/functions by name and keeps the first instance for the controller's
lifetime, so it silently drops the copies built on every subsequent
mapping - e.g. on each re-probe of the consumer device. kmemleak does not
flag them because they stay reachable from the controller's devres list.

Reproducer (patch 1, pinctrl-single) - any board where a device referencing
a pinctrl-single state is repeatedly re-probed; here an I2C TPM whose node
has a "default" pinctrl state:

  while modprobe tpm_tis_i2c; do rmmod tpm_tis_i2c; done

The tables land in a generic kmalloc-N cache (kmalloc-192 on arm64, where
ARCH_KMALLOC_MINALIGN pads every devres allocation; the bucket differs by
config), so watch it cache-independently by diffing /proc/slabinfo after
dropping the reclaimable slab:

  sync; echo 3 > /proc/sys/vm/drop_caches
  cat /proc/slabinfo | awk 'NR>2{print $1,$2}' | sort > /tmp/a
  <run N cycles>
  sync; echo 3 > /proc/sys/vm/drop_caches
  cat /proc/slabinfo | awk 'NR>2{print $1,$2}' | sort > /tmp/b
  join /tmp/a /tmp/b | awk '$3>$2{print $1,$3-$2}'

Patch 1 (pinctrl-single) was found and fixed with the above test on real
hardware. Patch 2 (ti-iodelay) has the same bug pattern - plus a missing
.dt_free_map that leaks the mapping table as well - but was found by code
review only and is compile-tested only; I have no such hardware to
reproduce it.

Alexander Sverdlin (2):
  pinctrl: single: don't leak group/function tables on consumer re-probe
  pinctrl: ti-iodelay: fix memory leaks on consumer re-probe

 drivers/pinctrl/pinctrl-single.c        | 21 +++++++++++++++++++++
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 24 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

-- 
2.55.0

