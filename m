Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=maTvG19pc/BXzKHo61lhffYCw6GZvIa778Ts0KzkImA=; b=S1DSsyx3CnFbUm+Rzv/suRwGMP
	vMCk3J7rVVzFALNXj7h8d/8OuXh+kC5nMfglUcuYZ/xSsQgLVvpC3uUnA4ufIGPj5JZat91LaGGsk
	kHEJSj81qgSyTcOmFq+W0/+kTl6bib4J59hbiwcOdSzsg76rXZCZCc0IFsGNuNlZmm6dOJWMlvw+O
	xaUR+4uqJz/BSg8nRB1z/95ndpw65JC5PtHYV1EZWLfs9idm2983Oq2PPV1GI2OeMddznn7aheitq
	8oCKrO8WTa0aTz2JG5ez1Ve5bzpPozAw/8Vx9jHLyZN1CGvikYcxW8LRnLa9RXpABbZkLJQXCtFFU
	W7IjDYpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AG9-00000006cuf-37Y9;
	Tue, 22 Apr 2025 09:49:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79EX-00000006OyE-3Mzp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 08:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=maTvG19pc/BXzKHo61lhffYCw6GZvIa778Ts0KzkImA=; b=dDVVBD9VcwRTScvw1wNdaUKdiv
	KYNnqWM7DkHYaBTgKe9g530RfmbmuHCIxUfcfujv4Lyy6caz7IzOJ4kX5HCkJ3AWZ200NhrhJ1qYs
	zDQbLQI4GzQmRKyUtkQa60tcKL/nOr6F1uq4lkRGL/4ZiUx89ULiqMsMWs5yPZM8An3OHaDO69+1E
	HpsEwABY3FlGEZvXojk4tNN6JptrOxrkSxQLJpvOE0FvrCWM1HEXGDIoAL1KUWqVa74Kt6RNfUDn7
	e+lOJ2BeuirrR0cbkfP0Oot2aBrHhdqVPG33iPLGUyIvqREPjcAWZdb1cUA06RcxM6/FeZ+Za5obO
	X/MW/TAg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u79ES-0000000BARl-3ZXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:43:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZhbMD41l0z6F9CR;
	Tue, 22 Apr 2025 16:42:00 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 38866140518;
	Tue, 22 Apr 2025 16:43:40 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.65.221) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Apr 2025 10:43:39 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree-spec@vger.kernel.org>
CC: <robh@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: [PATCH v1 0/5] DT: Enable sharing resources for SMT threads
Date: Tue, 22 Apr 2025 09:43:35 +0100
Message-ID: <20250422084340.457-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.65.221]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_094357_070631_D5067A85 
X-CRM114-Status: GOOD (  13.30  )
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
like and based on recent converstations we ended up with the following
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
cpu-node reg property. Further, when reading the property in the cpu-map
we must know how many parameters phandle has in cpu property. Therefore,
we optionally introduced "#cpu-cells" property to indicate the number of
cells.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf
[2] https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/cpu/cpu-topology.txt
[4] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

Alireza Sanaee (5):
  DT: add infra for finding CPU id from phandle.
  arm64: of: handle multiple threads in ARM cpu node
  driver/base/arch_topology: update CPU map to use the new API.
  driver/hwtracing/coresight: Use of_cpu_phandle_to_id for grabbing CPU
    id.
  DT: of_cpu_phandle_to_id to support SMT threads

 arch/arm64/kernel/smp.c                       | 74 ++++++++++---------
 drivers/base/arch_topology.c                  | 12 +--
 .../coresight/coresight-cti-platform.c        | 15 +---
 .../hwtracing/coresight/coresight-platform.c  | 14 +---
 drivers/of/cpu.c                              | 45 +++++++++++
 include/linux/of.h                            |  3 +
 6 files changed, 100 insertions(+), 63 deletions(-)

-- 
2.43.0


