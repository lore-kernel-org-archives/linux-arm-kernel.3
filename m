Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B0B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NRcD+QH6;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RE4/eDH9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1A8p6Yw8QB5cZ4R6ZLUTqYya8xg0OkNzmH7mK5ip2II=; b=NRcD+QH61cJt4o
	+XtbCO6G+REUBVZYa4fJRMzCEFLEfvcf8UlPYBXmZX42N+ymuCOgdzvRnNBkaLqoQAEDvAoncTfX3
	LUwkgIsAGdhgYE2np3XDZlBv04sVG78kp8FSVoyrVhKYUEft7n3FmfwfgWRhn4KGrhIp6bM9Wzot8
	ggMiaIKkDxsPgU8IRFUqjP/YvTSM2Wl10XyHjqvAnZLGNLyYwSkY1H4f0f/g62PP+yhYB+DHH007y
	2qiY5IQzKMkiKiJBU3+MTj68xRnx7P3QcD9HeBb3sZ2guMxKskSKRqyAsWFI6WXkXaPE9+YjqCivz
	orqzpdXVccVgFcWNwwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJV6-00000003SzY-2wBx;
	Tue, 03 Nov 2026 18:44:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJUy-00000003SxF-3fbO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 18:44:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BD561595;
	Tue,  3 Nov 2026 10:44:40 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0B333F628;
	Tue,  3 Nov 2026 10:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793731483; bh=uAQW7HvA0v7nIV7mc4N2TG5pPdvVVKtuJnC0ma5RjYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RE4/eDH9BflLfmG4pGA+XUXDeV9ihXn60ajrcwLY+TgWH82Pbak1ug67AKrnpV94m
	 zxL9dPNkSuyq/d9D5CRQiQGg4iOo4rD/gyaiTZJp7ObekDaiOHS74Q7bYHkdg1iRUz
	 WuCWnBi95UKRxA++0Wq2csBpNcihRbP5C2Xu13aY=
Message-ID: <fa595d08-9b92-4266-acb7-489e1b2277c4@arm.com>
Date: Tue, 3 Nov 2026 18:44:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when
 allocating a domain
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
 <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
 <9400d7a6-3d00-474d-bf1d-6db1a08c16fb@arm.com>
 <200bd69e-61fd-4680-8e14-338e2d45c266@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <200bd69e-61fd-4680-8e14-338e2d45c266@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_104444_979341_530B7B36 
X-CRM114-Status: GOOD (  13.86  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Reinette,

On 03/11/2026 18:13, Reinette Chatre wrote:
> Hi Ben,
> 
> On 11/3/26 9:48 AM, Ben Horgan wrote:
>> On 03/11/2026 15:01, Ben Horgan wrote:
>>> Hi Reinette,
>>>
>>> The change seems good but I think the commit message can be cut down at bit.
> 
> Thank you very much for taking a look and providing the needed changes. Since I
> am unable to test and especially since this involved a locking change I ended up
> with changelogs containing more than the usual reasoning about correctness.> >> It looks like this patch also has the plus of addressing this sashiko
>> report:
>> https://sashiko.dev/#/bug/linux-9a564d61-b4d8-400d-b4b9-cd5f20729468
> oh. Would you like this commit to capture this? To do so I can add the following tags:

I don't think it counts as a real bug as its only going against the
cleanup.h guidance and making the code fragile rather than actually
breaking anything. Good to fix though.

Thanks,

Ben

> 
> 	Fixes: 09e61daf8e96 ("arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation")
> 	Reported-by: Sashiko <sashiko-bot@kernel.org>
> 	Closes: https://sashiko.dev/#/bug/linux-9a564d61-b4d8-400d-b4b9-cd5f20729
> > Reinette
> 
> 
> 


