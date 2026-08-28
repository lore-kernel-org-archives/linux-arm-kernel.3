Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC807C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZG/JSrF/VgDZ41PuQy1wlBeOCLxrcnR7jrPKEkUbq4=; b=gB5z4o77mqrYjt2+OU+SklIWOM
	u8wxUyVWtUjtI0YHYNWQ4WZuFS85Ml+R18ZpNs7TB2VkQsA1efRhRpRM1kjKUqU/drRJcDvGq1l2y
	5crG08/soQlgxazUrAbYj4bKOBX+Q40NHWCIrj7aaTeIRyIf4kwnSJm+wD4sRE1iUmRl6yDhTZeVV
	xyOtQhsRUosDrf+KgdvUSU19oEOTkTQ1SFGwGT8+ZdFxyXmQYQk4r0pNZktxVNObL0p9+MHkbkdVI
	7i4mAk0ap6DiC6rUSdAGOf6gPs8ZE7uLxjXvbobbJ2rOthnhGel+XVv7tCB138vaoolzniYw9CS6M
	Fw4BzOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwOI-00000005nUQ-361x;
	Fri, 28 Aug 2026 13:13:06 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwOE-00000005nTy-2woU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:13:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YZG/JSrF/VgDZ41PuQy1wlBeOCLxrcnR7jrPKEkUbq4=;
	b=X/FmnSM0cS8HU6OnEAMI/DZZTXh74QoTo1Le4oCvCSwYeTWZAk46qtXTgna18+E49nQq/3iSf
	qheht6algnU0qoCJW6XzQRxdC+oG0Qbj8Vq0w1cfmLdGs2jC8aYEKUx+ov57SbCcT6l05sqTHc3
	9rNWE4N6n5crfeJk95LZueE=
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hWf1W1hsjzHnH49;
	Fri, 28 Aug 2026 21:12:15 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id F07E740569;
	Fri, 28 Aug 2026 21:12:52 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 16:12:52 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <ljs@kernel.org>
CC: <akpm@linux-foundation.org>, <artem.kuzin@huawei.com>,
	<catalin.marinas@arm.com>, <cl@gentwo.org>, <david@kernel.org>,
	<liam@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux@armlinux.org.uk>, <mark.rutland@arm.com>, <mhocko@suse.com>,
	<panov.nikita@huawei.com>, <rppt@kernel.org>, <surenb@google.com>,
	<vbabka@kernel.org>, <wangkefeng.wang@huawei.com>, <will@kernel.org>
Subject: Re: [RFC PATCH 02/18] arm64: align kernel text and rodata
Date: Fri, 28 Aug 2026 21:00:17 +0800
Message-ID: <20260828130017.134474-1-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apB1JCaNkGQMJQqq@gremlin>
References: <apB1JCaNkGQMJQqq@gremlin>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_061303_231358_B6FB9D34 
X-CRM114-Status: UNSURE (   7.86  )
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

Hello,

On 8/27/2026 8:35 PM, Lorenzo Stoakes (ARM) wrote:
> On Fri, Aug 28, 2026 at 12:11:42AM +0800, Nikita Panov wrote:
>> Acked-by: Artem Kuzin <artem.kuzin@huawei.com>
>> Acked-by: Alexander Grubnikov <alexander.grubnikov@huawei.com>
>> Acked-by: Ilya Hanov <ilya.hanov@huawei-partners.com>
>> Acked-by: Denis Darvish <darvish.denis@huawei.com>
>
> One small note on procedure: it's not really the done thing to pre-Ack
> patches in series sent upstream like this :)
>
> --
> Cheers, Lorenzo

Thanks for clarification, will remove it from future submissions.

BR
Nikita Panov

