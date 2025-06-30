Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E488C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 05:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt8pkKM4Y0oW2EZ32Xu1/oV/J0B8ss3DlcMT3ph4E70=; b=SVIUEjnWxRDdIUdbN6LNUeVMJC
	7JN2SgBke7nJYpb4zrNiDyADUN6QC+gntTS2fTaJ16I6tWgj1byI2ByIL7eCcmo7ehzUIvyOWygYj
	WhDfm7Hf3pdGhZ/J0eYEcnFUBuhLJ1rDAz8RPk4u5lDVK9nEXWQS+iiOE79ij0t32kqmnvFrN31/T
	+o3ZXyQ/8JyReW/Snch41ljBTPfHLaRepPAF3jkXHVImps3t1ygEOFaumTxTeuU7g3pAvX4xfOFAB
	HWaGbQ4Jcnb/GCsHTMaLUJjtMSYD/WZNZqdX7FFq4GUfVeiaJAYG9Nrx231WdImKBliCY/BVBVc0i
	yn6G69sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6nl-00000001FAV-1ifk;
	Mon, 30 Jun 2025 05:11:33 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6lQ-00000001F0M-3Omj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 05:09:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bVvGy0t8TzdbkC;
	Mon, 30 Jun 2025 13:04:58 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 1079E180064;
	Mon, 30 Jun 2025 13:08:58 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Jun 2025 13:08:57 +0800
Subject: Re: [report] WARN_ON_ONCE() was triggered with pseudo NMI enabled
To: Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
References: <ce10f231-4ecd-cb12-4b5c-1c503d9177da@huawei.com>
 <aF69MAUB84bPX-Sy@willie-the-truck>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <a99ef199-ac63-ac32-12fc-353c8d22fc97@huawei.com>
Date: Mon, 30 Jun 2025 13:08:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <aF69MAUB84bPX-Sy@willie-the-truck>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_220909_013009_04623DE3 
X-CRM114-Status: UNSURE (   8.94  )
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

On 2025/6/27 23:48, Will Deacon wrote:
> On Wed, Mar 12, 2025 at 05:27:50PM +0800, Zenghui Yu wrote:
> > With pseudo NMI enabled, I can trigger the following splat when running
> > selftests (e.g., arm64/signal/fake_sigreturn_bad_magic, which will issue
> > a BRK instruction).
> >
> >  ------------[ cut here ]------------
> >  WARNING: CPU: 5 PID: 386876 at ./arch/arm64/include/asm/irqflags.h:34 send_user_sigtrap+0xc8/0xd0
> 
> This is fixed by Ada's series:
> 
> https://lore.kernel.org/r/20250620211207.773980-1-ada.coupriediaz@arm.com

Thanks for the heads-up!

Zenghui

