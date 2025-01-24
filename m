Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9150CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TIb6Ho4dsShNkvaejP99BQRdt2usCHA3iEejuhJxDys=; b=NvmLoCboMR80ByVz/tGEjTgk8H
	jpba3ZC5k5ZrYzC2KrH96Jb+2PGzWtd8WMWSar9LE2SwoxHVebMxUqi47eQAGIIoK6kCh45/DSWTJ
	zWeIubHBsVo7LJ9W44kF879EJS8fpmT7sk6XH87RK6ReFzO4vq8KVtksMWY6XJF9SXsjuYnjGJWmO
	EnwkNRiWE17w7+oZs2FitIc5LrEuga14zHjCvbhLDwaChEoVsIPNLT8D0f4knh5jfPq5OH6XEXi8m
	gtLo8sY9qki9l9/GypqFQ4BiaxJEKCMAMSlTq0dwi2QzVGJRrleuMTAwqhIt+N4oo90B0PK6/MFLY
	z/ZjC9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLa0-0000000EyaO-1xGo;
	Fri, 24 Jan 2025 15:26:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLTk-0000000ExGr-0KWJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:20:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YfhJz3XkMz6M4Kb;
	Fri, 24 Jan 2025 23:18:11 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B99C1403D2;
	Fri, 24 Jan 2025 23:20:10 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.195.34.97) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 Jan 2025 16:20:09 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <robh@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@Huawei.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<shameerali.kolothum.thodi@huawei.com>, <zhao1.liu@intel.com>,
	<yangyicong@hisilicon.com>, <rrendec@redhat.com>, <catalin.marinas@arm.com>
Subject: [RFC PATCH v1 0/1] base/of/cacheinfo: support l1-cache entry in dt
Date: Fri, 24 Jan 2025 15:20:07 +0000
Message-ID: <20250124152008.313-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.34.97]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_072016_410729_2FD04530 
X-CRM114-Status: UNSURE (   8.11  )
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

This RFC adds support for l1-cache entry in device tree. The changes are
based on the assumptions that nodes will have l1-cache to describe first
cache layer. This patch enable to describe shared caches for SMTs which
is not currently possible about which there were discussions already
[1,2,3].

The question that I am seeking feedback for is to see if this might be a
good way to go about solving this issue? Or instead using phandle and
index in CPU nodes is a better way to go according to prior discussion,
I have another patch this investigates this approach [2]. Apparently,
every single CPU will need to addressed in the cpu-map structure as per
Mark mentioned earlier [4].

Sample device tree:

             cpu@0 {
                        next-level-cache = <0x800b>;
                        phandle = <0x800a>;
                        reg = <0x00>;
                        enable-method = "psci";
                        compatible = "arm,cortex-a57";
                        device_type = "cpu";

                        l1-cache {
                                next-level-cache = <0x8008>;
                                cache-level = <0x01>;
                                d-cache-sets = <0x100>;
                                d-cache-block-size = <0x40>;
                                d-cache-size = <0x10000>;
                                i-cache-sets = <0x100>;
                                i-cache-block-size = <0x40>;
                                i-cache-size = <0x10000>;
                                phandle = <0x800b>;
                        };
                };

                cpu@1 {
                        next-level-cache = <0x8009>;
                        phandle = <0x8007>;
                        reg = <0x01>;
                        enable-method = "psci";
                        compatible = "arm,cortex-a57";
                        device_type = "cpu";

                        l1-cache {
                                next-level-cache = <0x8008>;
                                cache-level = <0x01>;
                                d-cache-sets = <0x100>;
                                d-cache-block-size = <0x40>;
                                d-cache-size = <0x10000>;
                                i-cache-sets = <0x100>;
                                i-cache-block-size = <0x40>;
                                i-cache-size = <0x10000>;
                                phandle = <0x8009>;
                        };

                        l2-cache {
                                next-level-cache = <0x8002>;
                                cache-level = <0x02>;
                                cache-unified;
                                cache-sets = <0x800>;
                                cache-block-size = <0x40>;
                                cache-size = <0x100000>;
                                phandle = <0x8008>;
                        };
                };

1) https://lore.kernel.org/linux-devicetree/CAL_JsqLGEvGBQ0W_B6+5cME1UEhuKXadBB-6=GoN1tmavw9K_w@mail.gmail.com/
2) https://lore.kernel.org/linux-arm-kernel/20250110161057.445-1-alireza.sanaee@huawei.com/
3) https://mail.gnu.org/archive/html/qemu-arm/2025-01/msg00014.html
4) https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/

Alireza Sanaee (1):
  base/of/cacheinfo: support l1 entry in dt

 drivers/base/cacheinfo.c | 54 +++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 17 deletions(-)

-- 
2.34.1


