Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C88CD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 02:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xJNkDPeFZ3mqQ8f1vIw6iwLF+t+AtPw3ITe29YVPNE=; b=HGjWi3rYdrb9bF9ry1GFl9jl8V
	OjJH+6e4/XqptPJZEzBs14Z1Vfyby9L48GRifH7PricPaksMOks/EITnmXmpZOHGjs87/HmtfCgWr
	xDYOtYHvcb7dJolwBV6diAfEVl/qbs73WrJDT0gsxie3YQ0F16HUgYOHx8vDTw070Z9FOSFcQ4Y3e
	GtqNrEkGVmqGHsuB0xVyXIC08aYFcPzi9oi7N67ohpMVFPYaIjJyfUvfSbZajFdQg1SJLLh87+avV
	Ir2iPrZgoTDcpAhESc5IPxLdalghzBq9UxrTY9rLRhGgMg8LfeeK7NB9xA/qrunSBXNDMUsj+lV3U
	HXrEu96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPAnG-00000001Bdn-0uZB;
	Sat, 29 Nov 2025 02:34:38 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPAnD-00000001Bd0-3Jn1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 02:34:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6xJNkDPeFZ3mqQ8f1vIw6iwLF+t+AtPw3ITe29YVPNE=;
	b=PWKrg9CIIKX20SkXni2m0WgDvyVF7rPTKkM8q3Ou9evSEb47iF2go4uoiLhBwVVwEUmGd+R3o
	sAmidTA+oP96b6qoyCWa2bWw1iJaN9or7npTp+ATi/v2O5Oxn4KZsWal7NWsybJOWATLZia+yNY
	f5pn9OY24M3ZZ1JMdsvYTaw=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dJDj11ptjz1cyQk;
	Sat, 29 Nov 2025 10:32:37 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E5421800B2;
	Sat, 29 Nov 2025 10:34:27 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 29 Nov 2025 10:34:26 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>
CC: <akpm@linux-foundation.org>, <arnd@arndb.de>, <brauner@kernel.org>,
	<david.laight@runbox.com>, <hch@lst.de>, <jack@suse.com>,
	<kuninori.morimoto.gx@renesas.com>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <lorenzo.stoakes@oracle.com>,
	<marc.zyngier@arm.com>, <nico@fluxnic.net>, <pangliyuan1@huawei.com>,
	<pfalcato@suse.de>, <punitagrawal@gmail.com>, <rjw@rjwysocki.net>,
	<rmk+kernel@armlinux.org.uk>, <rppt@kernel.org>, <tony@atomide.com>,
	<vbabka@suse.cz>, <viro@zeniv.linux.org.uk>, <wangkefeng.wang@huawei.com>,
	<will@kernel.org>, <wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>
Subject: Re: [RFC PATCH v2 1/2] ARM/mm/fault: always goto bad_area when handling with page faults of kernel address
Date: Sat, 29 Nov 2025 10:33:23 +0800
Message-ID: <20251129023323.11612-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128120359.Xc09qn1W@linutronix.de>
References: <20251128120359.Xc09qn1W@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_183436_297263_57345E79 
X-CRM114-Status: GOOD (  18.35  )
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

On Fri, 28 Nov 2025 13:03:59 +0100, Sebastian Andrzej Siewior wrote:
> what about this:
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index ad58c1e22a5f9..b6b3cd893c808 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -282,10 +282,10 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  	}
>
>  	/*
> -	 * If we're in an interrupt or have no user
> -	 * context, we must not take the fault..
> +	 * If we're in an interrupt or have no user context, we must not take
> +	 * the fault. Kernel addresses are handled in do_translation_fault().
> 	 */
> -	if (faulthandler_disabled() || !mm)
> +	if (faulthandler_disabled() || !mm || addr >= TASK_SIZE)
>  		goto no_context;
>
>  	if (user_mode(regs))
>
> We shouldn't be getting here. Above TASK_SIZE there are just fix
> mappings which don't fault and the VMALLOC array which should be handled
> by do_translation_fault(). So this should be only the exception table.
>
> This should also not clash with the previous patches. Would that work
> for everyone?

When it is user_mode(), it should be goto __do_user_fault(), but
no_context goto __do_kernel_fault(). So I think it is not ok.

> Sebastian

Xie Yuanbin

