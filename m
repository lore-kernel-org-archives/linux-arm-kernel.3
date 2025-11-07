Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E31DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 02:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttYbeCKJ3OLF2JIak+cm/+0cAJg3a7naHdhTZ5oTJCM=; b=y+lW0okLhtx9pTaxQ1tDwGOoue
	qdiSDnR6R38O6H323nUER32ZblhKYmvJ3cUmGJIHXN7xgL34AF72s2tsBLYSJyes/3MMinvjS+DwK
	o/SCNefqOUpHV29a3XAo9E+T0sJBfgR/nYqJ1KC0TQnLAi+nXirehaKb0dqF3R6ocga/u6lMHM3AZ
	YfpGDFKbqLbRfiJqMwF5nuzD4hmf9sCYCnBvaLGVafmh2zabOrsFiL50Ly1/EDLCA1H74lXiudZT8
	qEz8/MBdbHY8TJkWpgHsMruynERoypzj6QqLFdPRAIafhtZaAa4e0gDf/poDbsVyKhq7hMSGGgH5D
	SqTj5wDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBxe-0000000GZ6j-0Jt5;
	Fri, 07 Nov 2025 02:12:22 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBxb-0000000GZ5x-3pou;
	Fri, 07 Nov 2025 02:12:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ttYbeCKJ3OLF2JIak+cm/+0cAJg3a7naHdhTZ5oTJCM=;
	b=oTND7xti/NC2W3lp57ZxBg2RHkOYc/x3+yPpDVhMGAvw36UguiT3bsave9p82GjGlyyJlPVeJ
	riF/XR32j7XsPV8Z5V3xtQ+vm+V4FQD0LAWcXx1na6m0zI3r0qH38BwDsXDVzMiYcML6iuRsn1G
	5/ha/SAcUUlu419yWmwHzwM=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4d2jFb4zgPz1cyV7;
	Fri,  7 Nov 2025 10:10:27 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D3F3140159;
	Fri,  7 Nov 2025 10:12:04 +0800 (CST)
Received: from kwepemq100008.china.huawei.com (7.202.195.91) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 10:12:04 +0800
Received: from DESKTOP-DKE2JV6.huawei.com (10.67.110.146) by
 kwepemq100008.china.huawei.com (7.202.195.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 10:12:03 +0800
From: Liyuan Pang <pangliyuan1@huawei.com>
To: <markus.elfring@web.de>
CC: <alexandre.torgue@foss.st.com>, <chengzhihao1@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<mcoquelin.stm32@gmail.com>, <miquel.raynal@bootlin.com>,
	<pangliyuan1@huawei.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<wanqian10@huawei.com>, <young.liuyang@huawei.com>
Subject: Re: [PATCH] ubi: fastmap: fix ubi->fm memory leak
Date: Fri, 7 Nov 2025 10:11:37 +0800
Message-ID: <20251107021137.874150-1-pangliyuan1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dff05531-f5e3-400a-abf0-a5307c50357e@web.de>
References: <dff05531-f5e3-400a-abf0-a5307c50357e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.146]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq100008.china.huawei.com (7.202.195.91)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_181220_517461_DE1DCCA4 
X-CRM114-Status: GOOD (  10.21  )
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

On Thu, 6 Nov 2025 16:16:05 +0100, Markus Elfring wrote:
>…
>> +++ b/drivers/mtd/ubi/fastmap.c
>> @@ -1644,3 +1644,15 @@ int ubi_update_fastmap(struct ubi_device *ubi)
>…
>> +void ubi_free_fastmap(struct ubi_device *ubi)
>> +{
>> +	int i;
>> +
>> +	if (ubi->fm) {
> +		for (i = 0; i < ubi->fm->used_blocks; i++)
> +			kmem_cache_free(ubi_wl_entry_slab, ubi->fm->e[i]);
>…
> +	}
> +}
>…
>
> May the local variable “i” be defined in the loop header?

I think it's better to leave it as it is, most of the code in
ubi defines variables outside the loop header, and defining
"i" in the loop header may cause compilation error in some old
kernel versions that use C89.

Regards,
Liyuan

