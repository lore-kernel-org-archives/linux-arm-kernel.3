Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D452D3E78B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 04:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKNwQKeuhF1XGky6OFqBn26iH99vLkY1N5p55ttmNSI=; b=juu8ULKs8YWKpx2tRp6sJi4uLI
	rtqryE5BHYeqaZtb0Uvd8LTvpcThf07x8de612CsA+uy0WpK8U57WAwuiXw5vzs/ydSXfV92dSzsz
	V6itYsXW8g0/LkYsO5R+gtOe3d17NJV8MebrPukldlAcgVSZDwZPGQpiLQk2qRzsqFAzyt2obOu9W
	x5P334saEwD7kd/F4MgylH1nE57kI9SOsqwGGAFPh/hBwocv8Id523tqHUS38Sv8lYUnXXf1dzzIi
	+9V7SlSPujUHbIEtXdxbHP5TVw5FMgLvnKe3I+gXSGoX4Y97I7+hvvBnZnXnkNERY9qEGe93PMeYM
	OSPLTxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXxx-0000000GC9J-2McE;
	Thu, 11 Dec 2025 04:07:45 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTXxu-0000000GC8u-1Mi3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 04:07:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AKNwQKeuhF1XGky6OFqBn26iH99vLkY1N5p55ttmNSI=;
	b=u16oZmltST8Qh3NIY1Wp100dkDTLW02Mh68wPXydnDRLSJBZXxWd9FDo9HHfYMXkkZI5069z/
	F1fJFVyEdEcRd6t98oyBb0LpM8PXEfkTFhn+8pepVKmC1j2r3OWpF1Qftrckw0tjF8u+IVSnF96
	F4hYHJti4BVNVXIrH+HX8xU=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dRfBm2twqzmV6h;
	Thu, 11 Dec 2025 12:05:36 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 6DFDB1A016C;
	Thu, 11 Dec 2025 12:07:33 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Dec 2025 12:07:32 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Date: Thu, 11 Dec 2025 12:07:08 +0800
Message-ID: <20251211040708.187155-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTmNrPVmd7sG7J8s@shell.armlinux.org.uk>
References: <aTmNrPVmd7sG7J8s@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_200742_849235_0F2110CB 
X-CRM114-Status: GOOD (  16.98  )
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

On Wed, 10 Dec 2025 15:11:40 +0000, Russell King wrote:
> Thanks. I've updated the three patches, and pushed out the updated
> tree. See the top four commits:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git/log/?h=fixes
>
> Given the timings, I doubt that linux-next will pick this up before
> I need to send Linus a pull request before going on vacation for the
> remainder of this year:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git/log/?h=for-linus
>
> However, I also can't guarantee that I'll be able to look at mainline
> at the start of next year due to other pressures - and I don't yet
> know for how long that's likely to be at the moment.
>
> So, it's either a pull request for the for-linus tag later today,
> at some point next year likely not before mid-January and splitting
> it up into fixes (for -rc) and the two PREEMPT_RT non-fix patches (for
> the next merge window.)

Thanks! These patches seem to have been merged into the linux-next branch.

By the way, before the PREEMPT_RT enabled patch are finally merged,
something like this should be applied first:
Link: https://lore.kernel.org/20251127140109.191657-2-xieyuanbin1@huawei.com

I believe you won't forget this, but I currently don't see it in any patch
queue/list/system. Therefore, out of caution, I still sent this email.

