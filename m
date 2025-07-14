Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359EAC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIA6a+smY3CSNk281uBRTI98m0jey8d7+OFhMF9gjAw=; b=1bXL9K2+jTElwhE1om2S7f7pXh
	vmDhGqz00JjrnZXQBRmsUmLIV26LwVFRoS9sKMVhFmwOfXNBDET9LLoFyQnqextDZzkHBTd6KTGIq
	LjfLTC5T8jffzYyM/AhVo7wVc/rw/JraOANvEeksrZ+bwQ1mxG9IEBTP9sTxp09YHBb68gqzA7tDv
	Kuh/BhHcwS8tAq9xrHRKI7k308hOtyuux7MUSPO/oibMs+zUwRmjIugRomGib2aGgPCSQjmUCe/5V
	ycPK5lOGzAO7heROfP8ql8QFEmTUjYEwbk4zaxn47vbs+NjJdelFEXNPR1+8YNQWhRGkJRhiFqj3+
	gnU3wnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGCr-00000001tNW-3qEr;
	Mon, 14 Jul 2025 10:14:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFx7-00000001r6r-3vtN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A5484645D;
	Mon, 14 Jul 2025 09:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E74C4CEED;
	Mon, 14 Jul 2025 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752487109;
	bh=6QNF2IYiYqPBBrAD5MOXPmWbh+lwfMKKPRRBenmPnKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ums9ayJN5n832EVbsV69MWCMFHIkAtW87SJM8xhoU99WdXpmOoi01pg9sXFG35BQS
	 aemOss8YmGLTKcVZME8JuPe0FdkYnSVBD1HdZecjl2w2e7vKAKutLFr3E7F3bicd5+
	 9avX8BMP5vaoKP+RN35dD7u12iVolLIZDw4tpncBqTA7E/v7xxgFzTq7yaqVan8JTP
	 aiU4E6arkoWr1hRxCAVVg+HPdswYptXzXyA6cSqLZZDPSSszrgttAO5Y1iHpF4pQHQ
	 UN7wUd2CHCpbhrA9HFwRNP9EDFwfGeKyhjzoB2IzipZUDUkeBEAUBDNmPkrtlaguFS
	 Jjw/Am5jCSaZA==
Date: Mon, 14 Jul 2025 10:58:23 +0100
From: Will Deacon <will@kernel.org>
To: DaeRo Lee <skseofh@gmail.com>
Cc: alexandru.elisei@arm.com, james.morse@arm.com, kernel-team@android.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	sebastianene@google.com, sudeep.holla@arm.com,
	suzuki.poulose@arm.com, tabba@google.com
Subject: Re: [PATCH v3 08/10] KVM: arm64: Handle FFA_MEM_LEND calls from the
 host
Message-ID: <aHTUv5kOE4z8tlEK@willie-the-truck>
References: <aHQQiJr2xLe9KotP@willie-the-truck>
 <20250714021400.631762-1-skseofh@naver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714021400.631762-1-skseofh@naver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_025829_996962_0E767A9C 
X-CRM114-Status: UNSURE (   8.35  )
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

On Mon, Jul 14, 2025 at 11:14:00AM +0900, DaeRo Lee wrote:
> Is it pKVM's policy to not manage Non-secure memory using FF-A, while the FF-A
> specification supports memory management between Host/Guest within Non-secure
> hypervisors?
> 
> Then, how does someone lend memory to a Guest from the Host/Guest via FF-A? Can
> pKVM prevent this? Or should Host/Guest developers use it with caution?


Perhaps you could read the code and find out.

Will

