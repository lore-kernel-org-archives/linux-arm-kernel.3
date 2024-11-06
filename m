Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED63D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJYaxVvTUp9QvP3mUi1s6iCQPXwGbNw44HtbRG8OP4k=; b=IQwKrTVjs9R0u3GuduGKhs334M
	f3NzRxI947PMeru0TTaPg4HctX5ZX4Ab0v6AjYaSrJ3xga5hTwGAdGrWedY+vZ8rZCVa9B6Gu+m3Z
	x+CLaWLdJlOmyfZmMflSHJFOVbyjOwl0CB9KAnzaSt87jC8mp1KVAeURAxqwgVTvI5NCgJfWh7+/E
	6Kh6IISzxam59MpRtK/tXSZJnbKxBapk+19aGAmL3xzaw6UVFBxM/xwOzDAAXmM3aogvq7/TbURV/
	GBO9hYVER1+cyjldc5AzrTHo18TNEcg+T5PrFHAE0y+4Bfvaz/WGc3AI5o7wgVZ+ucrRjwOYx9miD
	qxVuPQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fTk-00000003J34-1ztB;
	Wed, 06 Nov 2024 12:49:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eZZ-000000030Ef-2GBW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CEE66A436E6;
	Wed,  6 Nov 2024 11:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B27C4CED3;
	Wed,  6 Nov 2024 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730893900;
	bh=0Y28HCcI5SsbTl2P3ZoSMyrKbW818FEhWcOl+EEwvd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qdYL48MLsOY8OhDphEjsHL9uUMHb9RbJqXpI0Pz+Dk6FjrZxGOYaJvd6n5GDmV/8h
	 rJRA8A+nGRr2rzQtOT7I/k1UMe/V4Bp4qKATP3v48fyeLUkC+bBLC1qBRxH9fZmSEH
	 QA1McZSfO3fXEQCXCObaSCFldigA7BRuKuVPcqnDlREb5Xvciu2jGm0L5yTfra9Bgh
	 LajyLtEkCnNR7a333fBU327zhF3l33B4VaDNwsoUKrnPJxkPYefYOPz4DyPupiUbz4
	 xIL/TNtc8BTTa+Rzt7/tKq+tHTHW2UbRr7k9c3FYxPbkwUas75TNPuExtBitCHpumH
	 dGVtzWr0UCdYA==
Date: Wed, 6 Nov 2024 11:51:35 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, jonathan.cameron@huawei.com,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v3 2/8] drivers/perf: hisi: Improve the detection of
 associated CPUs
Message-ID: <20241106115134.GC13801@willie-the-truck>
References: <20241026072424.29887-1-yangyicong@huawei.com>
 <20241026072424.29887-3-yangyicong@huawei.com>
 <20241029132826.GB4416@willie-the-truck>
 <5895fd31-04f8-f1ea-0639-12dd1f19069c@huawei.com>
 <9a64ed90-6c9f-a32a-85cf-9d0c41e2fd81@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a64ed90-6c9f-a32a-85cf-9d0c41e2fd81@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_035141_669630_8A1F5CCD 
X-CRM114-Status: UNSURE (   8.19  )
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

On Wed, Nov 06, 2024 at 04:33:18PM +0800, Yicong Yang wrote:
> Hi Will,
> 
> Further comment on this patch?

You failed to convince me that copying the online mask is safe, but I
haven't had time to look into that in more depth myself. Saying "It should
be safe" isn't really enough -- it _must_ be safe!

Will

