Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C57CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlEPLoJQOQed+1gDV14mOLpfO+e0bUjLDpVN/NLv8WE=; b=CpFBjVZLdusdw9z8HASCw8yq++
	U9GjwVpz2rPJrzzj4PVckFKUT3T7rhGUFWcxD5z6g5Q9BDB3FegHagR7gyBKIgLJhMx0K/LuUXDob
	Fsh7WmTRtg7QyQTaWT0mod4NEAoCC0YHPOSc/k9VAjctjtORvIKoxKe6fwDwXEluFHaoYgIJfFya9
	07lOVYjnlVoK58+9I3U1Ditkqbv9YOAu6Sm56sTUpnwDX7TvYsoLCbpE60aJ+T7i0wZaCBfGZdaqQ
	WT06ke9CPEauIjMN+ggPjurzrTi0OBo5LTZ7yyversfle5Oyc5ZsyKTr0yR4ZMOxyaFqK3lJ1C3nZ
	hlaQ+jNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKbs-00000007aI5-37FD;
	Wed, 24 Jun 2026 10:13:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcKbp-00000007aHg-1VyE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 10:13:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BCC263D;
	Wed, 24 Jun 2026 03:13:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACA203F62B;
	Wed, 24 Jun 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782296004; bh=uDGgmQDxNB5JYlaT2W9AeNfXuRBseXPEq1ddL/s6olI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3rd5C4ccsWlusx04iTq9HGAvhuHiSLcLfmO5Bt2mHkpKF1D2QV8IgBUSUPxMUdNy
	 wFImr9R3SZPkZUe3+FTodWcm2mIUfbmY+0AHWx0cFbzgsisTTbsI7aeHbH/EsTwmy2
	 wMSachgYq0ul5YZJB7FD1hkHS3nTHbtoFVxLdEo8=
Date: Wed, 24 Jun 2026 11:13:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: Harry Yoo <harry@kernel.org>, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, kaleshsingh@google.com,
	21cnbao@gmail.com, david@kernel.org, will@kernel.org
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
Message-ID: <ajutu4JC6KRo46dv@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
 <ajltLd6FQg1aMge_@arm.com>
 <78d97371-b477-4230-8690-ac870a7bab3b@arm.com>
 <ajq-Ukmd9NBruhr5@arm.com>
 <f5927785-d5d3-4e64-bbac-220d40718a1f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5927785-d5d3-4e64-bbac-220d40718a1f@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_031329_622564_D90020AF 
X-CRM114-Status: UNSURE (   8.07  )
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

On Wed, Jun 24, 2026 at 09:44:49AM +0530, Dev Jain wrote:
> Anyhow someone needs to first test the current patchset to get some
> numbers, we would be wasting time on this if no one gets an improvement.

I agree. Something like iperf3 would be interesting, lots of skb
allocations.

-- 
Catalin

