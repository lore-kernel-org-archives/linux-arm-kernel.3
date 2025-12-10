Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00452D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grLYRYOUvvGwNKuz+SNyuD5NyJIcYntpEnrnsLGTOa0=; b=VcfeKXj6XLnrM/KzAdBidPzgRI
	Tz7mgMWWMS4hrrRADJ/OjXOEiDJ3GL+y1KFnLeo5DlZ18qsVuRjL2rgc4JEeR8HnV5T3p2ykRKI+K
	BeOv8GCdgIsZbcBRsJEgi51FzqPQyS50lDzfiWA95t7XKDh/X29CY2Ht82p+OoG6IzpZ559+N+Qk5
	5UbEs4MtuAh8NnqVc/6xQwpFPc6+jiaNlfCrzlIr4sCDWfqKqRTliD6tT8UW9XtCOnnZ7v01pkzZx
	JsVi0kwYGNt4bkAzKRuVQy00wG6aMNxCQYBZFo3luWgpXwNK7GFBYNafLN8dhRVLQtMZQDSwcj1Li
	uIwK6Mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGCo-0000000FGt3-1VuP;
	Wed, 10 Dec 2025 09:09:54 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTGCk-0000000FGsL-3FIC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 09:09:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=grLYRYOUvvGwNKuz+SNyuD5NyJIcYntpEnrnsLGTOa0=;
	b=bgAzAfyVOkK5o+u2HoswdtLxVll9Gi05htWfmBdH/utFL+7iu4FKiMV1hP8rbr6nm6rT2Lvev
	jUWI0V/nZ3xzvHRjrUrfVTAD5ldL7VkXf2PBhufg2YtXc/vNlWl+IML2H8NT3L72TLIDwO8oZYA
	Ctu0EuJoJA58dAHciXVIEFo=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4dR8xL3ch8z12LCr;
	Wed, 10 Dec 2025 17:07:18 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 40B8418047B;
	Wed, 10 Dec 2025 17:09:36 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Dec 2025 17:09:35 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <xieyuanbin1@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<torvalds@linux-foundation.org>, <viro@zeniv.linux.org.uk>, <will@kernel.org>
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Date: Wed, 10 Dec 2025 17:08:36 +0800
Message-ID: <20251210090836.60465-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251209085627.64057-1-xieyuanbin1@huawei.com>
References: <20251209085627.64057-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_010951_362765_01B9F12D 
X-CRM114-Status: GOOD (  11.26  )
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

Hi, Russell!

The syzkaller test has been running for 19+ hours now, and no issues
have been found so far. So to patch3:

Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>

This test will continue to run. If any issues are found, I will email
you. If I don't send any emails, then there are no issues. :)

On Tue, 9 Dec 2025 16:56:27 +0800, Xie Yuanbin wrote:
> patch1 and patch2 with compilation error fixed:
>
> Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>
>
> patch3:
> The simple test case passed, but the syzkaller test (the original
> scenario that triggered the branch predictor issue) is still running.
> The syzkaller test is better to run for a day.
>
> ...
>
> 2. About the branch predictor issue:
> Simple test cases (Link same as above) that can trigger this issue, has
> passed the tests. However, the original scenario which trigger the issue
> is the syzkaller test, which might take some time, possibly around a day.

