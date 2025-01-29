Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD3BC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K69G1IeIxxuCiKCscRhvLW34BlCXOYiKubUuis1dGRQ=; b=nP0axjCMRrsQLVxRq9SuEMFkSJ
	WBfsmjqhrPc12WQpSAhsp3IKIzGsXljJ8hepwLNzEuYWBS4Gs5Q2ze3iD050mT4/+xQIBWwLOVjeO
	SqJCHlaN7e6wak5DswN9PL6Y5RHcdL/6O0uSgqaA9Hx9nFFWRIQgPGbF9kd9s8hxnlFZ+S5s+CAsY
	NNjQ9oDRJQk3sr4Oru8nubz/RqYx00ixqww27k0k2wvv88lf6Xgg+U/JBa61lvcfcabHtJ+7kaFGe
	UJ8ilA9VR2DWssXUOaDCBpzrdRE6sAPv1bbSz+cLNhHxs4rzidJTAZu26iI5wYpbuGa7K/16KOA3N
	iqStB/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBGs-00000007QC5-1zgB;
	Wed, 29 Jan 2025 16:50:34 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBFX-00000007PvN-40ax
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:49:14 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yjp2q14chz6L4t7;
	Thu, 30 Jan 2025 00:46:43 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 5BF721404FC;
	Thu, 30 Jan 2025 00:48:59 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.69.217) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 17:48:58 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <robh@kernel.org>, <mark.rutland@arm.com>, <devicetree@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <jonathan.cameron@Huawei.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<shameerali.kolothum.thodi@huawei.com>, <zhao1.liu@intel.com>,
	<yangyicong@hisilicon.com>, <rrendec@redhat.com>, <catalin.marinas@arm.com>
Subject: [RFC PATCH v2 0/1] base/of/cacheinfo: support l1-cache entry in dt
Date: Wed, 29 Jan 2025 16:48:54 +0000
Message-ID: <20250129164855.676-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.69.217]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_084912_276265_D777C480 
X-CRM114-Status: UNSURE (   9.41  )
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

TODO: If this is something people are happy with then I will update
spec/bindings as well, which will be sent to spec mailing list too.

1) https://lore.kernel.org/linux-devicetree/CAL_JsqLGEvGBQ0W_B6+5cME1UEhuKXadBB-6=GoN1tmavw9K_w@mail.gmail.com/
2) https://lore.kernel.org/linux-arm-kernel/20250110161057.445-1-alireza.sanaee@huawei.com/
3) https://mail.gnu.org/archive/html/qemu-arm/2025-01/msg00014.html
4) https://lore.kernel.org/linux-arm-kernel/Z4FJZPRg75YIUR2l@J2N7QTR9R3/

Alireza Sanaee (1):
  base/of/cacheinfo: support l1 entry in dt

 drivers/base/cacheinfo.c | 50 ++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 17 deletions(-)

-- 
2.34.1


