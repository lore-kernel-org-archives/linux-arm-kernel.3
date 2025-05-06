Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38632C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7TtuFXQF6ZdeNPFZLC/9mukJqUYWiDLYJzLo0tePNQ=; b=Vy/AdmHJsGCup3Cqr0WNSlEfut
	cJzPkakrieHba11JUne3Ee9DZpM4XqYtnf4J7sUQ1qtLhwTkQt7bI1Jb+LLKp/U8TYBRKoUTgXu0F
	g20HOFsHL4Qng0V36bLUXl2p6e7pVOVnUrqxDdOQOduh5GfHR3enUrfmTibPPLsc+9ZLS7C4o9BEj
	1Ox3rglkNs1UKhC/TMwfG0om8j+CAHdppeWiVDG6PsPA5a0stMny864xih8M3R3zZwj38q1Hp+1Ov
	ohe7s1z+OuYbbvrOMLwrHtR87Yyu+kagTMgjDMb0jmBJusA+vmVmeRGO9KsMWUXtCG2+Tmm/nGL7p
	VnLhu9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHX6-0000000BwN0-0Cng;
	Tue, 06 May 2025 12:36:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFUP-0000000BYwZ-17TX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:25:30 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZsDxM0Gqrz6L5hX;
	Tue,  6 May 2025 18:23:03 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 99F731402F3;
	Tue,  6 May 2025 18:25:26 +0800 (CST)
Received: from localhost (10.47.68.20) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 May
 2025 12:25:26 +0200
Date: Tue, 6 May 2025 11:25:20 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <devicetree@vger.kernel.org>, <robh@kernel.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<mark.rutland@arm.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250506112520.00004545.alireza.sanaee@huawei.com>
In-Reply-To: <20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
	<20250502161300.1411-7-alireza.sanaee@huawei.com>
	<20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.68.20]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_032529_449385_E4F92228 
X-CRM114-Status: GOOD (  26.30  )
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

On Sun, 4 May 2025 19:51:02 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Fri, May 02, 2025 at 05:13:00PM GMT, Alireza Sanaee wrote:
> > Enhance the API to support SMT threads, this will allow sharing
> > resources among multiple SMT threads.  
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary
> people and lists to CC (and consider --no-git-fallback argument, so
> you will not CC people just because they made one commit years ago).
> It might happen, that command when run on an older kernel, gives you
> outdated entries. Therefore please be sure you base your patches on
> recent Linux kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on
> some ancient tree (don't, instead use mainline) or work on fork of
> kernel (don't, instead use mainline). Just use b4 and everything
> should be fine, although remember about 'b4 prep --auto-to-cc' if you
> added new patches to the patchset.
> </form letter>	
> 
> > 
> > Enabled the sharing of resources, such as L1 Cache and clocks,
> > between SMT threads. It introduces a fix that uses thread IDs to
> > match each CPU thread in the register array within the cpu-node.
> > This ensures that the cpu-map or any driver relying on this API is
> > fine even when SMT threads share resources.
> > 
> > Additionally, I have tested this for CPU based on the discussions
> > in [1], I adopted the new cpu-map layout, where the first parameter
> > is a phandle and the second is the local thread index, as shown
> > below:
> > 
> > In the CPU map, there are two cases that only one occurs at at time.
> >     1) "cpu" = <phandle>
> >     2) "cpus" = <phandle> <index>
> > 
> > The first case addresses non-SMTs and the second case addresses SMTs
> > that the variable must be cpu(s) with an index where we later look
> > up the reg array with that.
> > 
> >     core0 {
> >       thread0 {
> >         cpus = <&cpu0 0>;  
> 
> Not so sure, dtschema says only one item is allowed in the phandle
> and I do not see here binding change.
> 
> Although this wasn't even sent to me, so I'll just ignore your
> patchset.
> 
> Best regards,
> Krzysztof
> 

Sorry, I didn't use the script, I will next time.

