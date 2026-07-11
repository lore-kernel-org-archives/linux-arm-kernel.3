Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E104C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RivUc5YUXnOdUgRz0a+Ib/89lZt+K/9x14yXx6ELMXI=; b=c5/dbBZCYbq1Tt/oOHpRdnLr7P
	FIgluFzkz6C1kjmMm7/V+KhTExODa338SwGExnJKAhUee2FUL5AwBy3uCnI/cMPepzqPwPvrhDMzl
	txZoAcd0NJVEjmzi1BdSVukqcdv+qFGDrfz1v+2IYWqr4EbV6N1LZ4OWqGrNyA8vm49pCsqthytKr
	dAqtN/cGqQPkvAsg05T5RDC02OPDn3qoC+V5IcSKOFsy4mjSB+4/734T89Pu+/mZxlY5Fs73OYoMh
	7DZU6bbcMioGSRTnQfKAC/G5MsXBUCAgADvU3P/cfPkNzPMHssm6oYGlV3MJ8MZOCOkCyymVB7vY8
	TlP7fL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSq9-00000006N1i-26dQ;
	Sat, 11 Jul 2026 08:13:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSq8-00000006N0v-33uL
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 11 Jul 2026 08:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RivUc5YUXnOdUgRz0a+Ib/89lZt+K/9x14yXx6ELMXI=; b=c14DHHA1pt+yglxR7FSG0MDXRd
	y2UkUPn/ESl9feDMRATSMW+8NFqTkPruE1ER+hTrGnG86YfrHnvN2ahvgy4/VWkv+4GrbNVFsECth
	hkVCmJbvilVREMhtLGDinacOndmcU9DjD9ba15LV5b6u61MAP3NsiRLkhI7vyg1LGoJorOT8VXgQU
	hwg5oRHJq9i7Px4dH/5YPwMdbnIoGRirn4SgjkLe6iV/ZhuI4tzTaZK2+cLPLJQu5+vliEq1NY7R+
	gTbwiaqRWz6IJLI7m2rRdwHuK4CRopdLo59+43Ef3fGe0RutWqOl8EvJPYMDEqFunyNsQp5MHBIJ+
	7ubbSaTg==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiSq4-0000000AY3G-3TVD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 08:13:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RivUc5YUXnOdUgRz0a+Ib/89lZt+K/9x14yXx6ELMXI=;
	b=xw9nzOU534pfyhWOzj9pKap8q4607bkkToe3Ipnkb6QWR+MDZTi9e3O/H+gkxG0muwtB62cmy
	590BeUAhjDQbde2s0E8aqoxW1fmQ4KWS6jkFNgDjFuif9yo4slxZHN8h5FhDdby0SSxkWEGjE0z
	aOQke9SiLgZeI4qAHKPdblw=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gy1S444tjz1prLT;
	Sat, 11 Jul 2026 16:04:04 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 647634057D;
	Sat, 11 Jul 2026 16:13:22 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 11 Jul 2026 16:13:21 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <ljs@kernel.org>, <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <david@kernel.org>, <liam@infradead.org>,
	<liaohua4@huawei.com>, <lilinjie8@huawei.com>, <linusw@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <mhocko@suse.com>, <rppt@kernel.org>,
	<sunnanyong@huawei.com>, <surenb@google.com>, <vbabka@kernel.org>,
	<wangkefeng.wang@huawei.com>, <xieyuanbin1@huawei.com>, <xiqi2@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault() under CONFIG_DEBUG_USER
Date: Sat, 11 Jul 2026 16:13:03 +0800
Message-ID: <20260711081303.5472-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <alH4-zEWkSDK5EvK@lucifer>
References: <alH4-zEWkSDK5EvK@lucifer>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_091333_508704_305BDEC3 
X-CRM114-Status: UNSURE (   8.59  )
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

On Sat, 11 Jul 2026 09:05:03 +0100, Lorenzo Stoakes wrote:
> OK given arm32 can't do any of the stuff that makes kernel faults an issue, and
> if it's certain you can't deadlock on mmap write lock for VMA or non-VMA ranges
> on user fault, then no need for the mmap write trylock, and just take the mmap
> write lock unconditionally for user faults, and no lock for kernel faults I
> guess?

Yes, that's exactly what I think. We are waiting for ARM's maintainer Russell King
to confirm, and then we will send out the new patch. :)

