Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A57C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sAhjp/jWRT+x30dhNKGShnq1cR4vqK59Cw49FCM0qz4=; b=3Yuo0+/fHp0IUAyfkLZ2LKn2xc
	fLW1V/sb1pFlhS2KCch26IOyKJ1EG7ixAcfCDuEPi1v9rGJJo5KdAmyq1xHcP/h89chJIyuvOJ+Iz
	Ji3vnf4RchfADhrjCb23tvuWlgOyKwEIJ8s2NF0UECugRLVvaWA5jdW1W/A/YfY5iKTcJA7umDBrI
	mJuqu3gj7OQLP3dP6yWONdi3p+wLMV/E6maJy/HfHuL17BHmhn01OfC2HV8V2YMn54K01QgK0/N6x
	/FsKKEFhV19RW+wxtlO7ckzygX6z83fD1umb1eO3TFABVvhrny1xFmUpJbRivBUyJgv5gjHFLwKE8
	oWt+11uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt2i-00000002TJm-23HF;
	Fri, 02 May 2025 16:15:16 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt0j-00000002Sw5-1E9t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:13:15 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpwp058kKz6M4Tp;
	Sat,  3 May 2025 00:08:40 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id EB3491402F8;
	Sat,  3 May 2025 00:13:03 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:13:03 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 0/6] DT: Enable sharing resources for SMT threads
Date: Fri, 2 May 2025 17:12:54 +0100
Message-ID: <20250502161300.1411-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.77.180]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_091313_471738_0EB7C3AC 
X-CRM114-Status: GOOD (  11.96  )
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

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
[2] https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/cpu/cpu-topology.txt
[4] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

PRIOR VERSIONs:
   [V1] https://lore.kernel.org/all/20250422084340.457-1-alireza.sanaee@huawei.com/

CHANGE LOG:
    V1 -> V2:
        * Address Rob's comments.
            ** Re-order patches.
            ** Fix bugs.
        * Remove #cpu-cells property

Alireza Sanaee (6):
  of: add infra for finding CPU id from phandle
  arch_topology: update CPU map to use the new API
  coresight: cti: Use of_cpu_phandle_to_id for grabbing CPU id
  coresight: Use of_cpu_phandle_to_id for grabbing CPU id
  arm64: of: handle multiple threads in ARM cpu node
  of: of_cpu_phandle_to_id to support SMT threads

 arch/arm64/kernel/smp.c                       | 74 ++++++++++---------
 drivers/base/arch_topology.c                  | 12 +--
 .../coresight/coresight-cti-platform.c        | 15 +---
 .../hwtracing/coresight/coresight-platform.c  | 14 +---
 drivers/of/cpu.c                              | 51 +++++++++++++
 include/linux/of.h                            |  8 ++
 6 files changed, 111 insertions(+), 63 deletions(-)

-- 
2.34.1


