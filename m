Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB87C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EjBVq0GFzLfTDDFzR4Axfo0h26j1sxzZPJH/UhHQpa4=; b=B0S0zSg51ofpJwyid+YVcHe3Ck
	7/LZJieK3E7SZxE+DPOoduzQxXAct+cknHcyL7rgczevpfXct4bRCDzRhuSWUsb8j1oES6qVMl2i7
	BVAIFDxS6drUHIoVHp3XjcZW+FpeNTOc0ONZe50ENFSeJh+FUnxoztXDuMirWdWjPKEsYBfKoedOT
	Dcn+Kq+f+Bwb1hlD2DsEECeArjxyuT3M2joee381tPz+nAeBcf7WywSBZrzh6qHQKnpi/bT5L+mwg
	qkgGjXHuSmvMhvv4S4KuhfScIdZxi2uQvAzVRGGWBd4GvGCdyQwtofgz5ziOmeQAG6K85G+Ui110o
	QiMUbUoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOEG-00000008hUj-2uKU;
	Mon, 12 May 2025 08:09:40 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOC8-00000008hAZ-18aG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 08:07:30 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZwsZq4BwBz67Y2h;
	Mon, 12 May 2025 16:04:35 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id F25291402F4;
	Mon, 12 May 2025 16:07:17 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.30.10) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 May 2025 10:07:16 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/7] DT: Enable sharing resources for SMT threads
Date: Mon, 12 May 2025 09:07:08 +0100
Message-ID: <20250512080715.82-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.30.10]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_010728_591099_B8CE2440 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: mark.rutland@arm.com, robh@kernel.org, dianders@chromium.org, gshan@redhat.com, saravanak@google.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, james.clark@linaro.org, linuxarm@huawei.com, shameerali.kolothum.thodi@huawei.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ruanjinjie@huawei.com, krzk@kernel.org, jonathan.cameron@huawei.com, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset allows for sharing resources between SMT threads in the
device tree (DT).

WHY? Given the current use of the DT, it is not possible to share L1
caches, as well as other resources such as clock among SMT threads.
However, DT spec in section Section 3.8.1 [1], describes how SMT threads
can be described in the reg array, this is how PowerPC describes SMT
threads in DT.

CHALLENGE: Given discussions with the community [2], it was apparent
that it is not straightforward to implement this, since cpu-maps must
point to a particular CPU node in DT [3], Section 2.1. However, it is
not only the cpu-map but also there other nodes that point to cpu nodes
which indeed need care and changes.

SOLUTION: This led to more discussions on what the solution should look
like and based on recent conversations we ended up with the following
approach [4].

core0 {
  thread0 {
    cpu = <&cpu0 0>;
  };
  thread1 {
    cpu = <&cpu0 1>;
  };
};

In this layout, first parameter is the phandle to cpu-node and second
index would be the local-thread index in the reg array available in the
cpu-node reg property.

SIDE-NOTE: This patchset does not change any bindings, so I am not
including anything in this patchset.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
[2] https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/cpu/cpu-topology.txt
[4] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

PRIOR VERSIONs:
   [V1] https://lore.kernel.org/all/20250422084340.457-1-alireza.sanaee@huawei.com/
   [V2] https://lore.kernel.org/all/20250502161300.1411-1-alireza.sanaee@huawei.com/

CHANGE LOG:
    V2 -> V3:
        * I got the V2 completely wrong, so I updated it.
        * Re-introduce #cpu-cells property.
    V1 -> V2:
        * Address Rob's comments.
            ** Re-order patches.
            ** Fix bugs.
        * Remove #cpu-cells property

Alireza Sanaee (7):
  of: add infra for finding CPU id from phandle
  arch_topology: update CPU map to use the new API
  coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
  coresight: Use of_cpu_phandle_to_id for grabbing CPU id
  perf/arm-dsu: refactor cpu id retrieval via new API
    of_cpu_phandle_to_id
  arm64: of: handle multiple threads in ARM cpu node
  of: of_cpu_phandle_to_id to support SMT threads

 arch/arm64/kernel/smp.c                       | 74 ++++++++++---------
 drivers/base/arch_topology.c                  | 12 +--
 .../coresight/coresight-cti-platform.c        | 15 +---
 .../hwtracing/coresight/coresight-platform.c  | 14 +---
 drivers/of/cpu.c                              | 56 +++++++++++++-
 drivers/perf/arm_dsu_pmu.c                    |  6 +-
 include/linux/of.h                            |  9 +++
 7 files changed, 118 insertions(+), 68 deletions(-)

-- 
2.34.1


