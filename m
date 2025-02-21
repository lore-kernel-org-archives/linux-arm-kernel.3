Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB45DC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4RDEkxswbUbhEqdazfb85bOV8IiqvBYeb8Hqd67Gjw=; b=ywfxB+Au9tQxp8LZYYrL32dmjd
	6VBp1+pz8YiVhSGbjuOiK6sga7QaLVqQW+tj1eroWGOjmXvVkBCpK1QhAqZ1OjXu+8N1/Uuhpazqm
	XmG+6ye0/IVWdbzvNdo0o0/YyzKg9DLskZeqhhRuxNdbkjifu/1QIt/0NM0QZXeUipCfjl4QLWnVJ
	THPCjyjfGR/zFTsAAPqaYJTPpaXkoAtKOk2gBW1aFFasl8hoU8atKiYfq7nNa7FOGBjkEntWgKhjy
	iRbcqnvTglbbgzSTAYtJC8NeCiT9TmT7/DQiB8Kx+PtiKKsd5toCdBxJSgmMmsokpOXnozl//A2HZ
	09ze9v/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPXE-00000004ym5-2mg9;
	Fri, 21 Feb 2025 09:41:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPKY-00000004vYX-245Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:28:23 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740130101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W4RDEkxswbUbhEqdazfb85bOV8IiqvBYeb8Hqd67Gjw=;
	b=DOsbBNx15V3te3uSwQkkoQh8pumg9j1OQwos8Wq6tlZ1fHlK4USHZhrlj2Z+KFK5EV0a5Y
	yu52Dt06CaklHEPoASJGAtJs3VJF/LhNhSwM9ytDyySMI/slQ6yiW6DQPj06CrpXvFuR0e
	kCdlOsJm27epmZUSg5TuYitQKxZj4KdK1Z836JaiLvyqRvw28H1JAA11e9rmygxIO9tmdM
	gNtFCdP+zzJPnOEhkEPCbdVUaFfmiGjwz1cBHfhKJK7VGDp/4uwMnN2hdD3kw8cqyoeIWi
	KmcpfKqkKzPbqvV2KvP4UZxdXVq7Kv6mOM/7vIGJQ9wfSspsanV+Z/GUNxn8sQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740130101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W4RDEkxswbUbhEqdazfb85bOV8IiqvBYeb8Hqd67Gjw=;
	b=fkGnpwX7xaB0MJgMVSfZ73m14LAJWC3zzXp0zNdV5PL7QQKnBMpSPX9LZ/UcxHQpfJkKXk
	HoZaMLJZAc6KE6DA==
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
 kevin.tian@intel.com, maz@kernel.org
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 shuah@kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 eric.auger@redhat.com, baolu.lu@linux.intel.com, yi.l.liu@intel.com,
 yury.norov@gmail.com, jacob.pan@linux.microsoft.com,
 patches@lists.linux.dev
Subject: Re: [PATCH v2 1/7] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
In-Reply-To: <a4f2cd76b9dc1833ee6c1cf325cba57def22231c.1740014950.git.nicolinc@nvidia.com>
References: <cover.1740014950.git.nicolinc@nvidia.com>
 <a4f2cd76b9dc1833ee6c1cf325cba57def22231c.1740014950.git.nicolinc@nvidia.com>
Date: Fri, 21 Feb 2025 10:28:20 +0100
Message-ID: <87ldtzhcjv.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_012822_667660_6810E915 
X-CRM114-Status: UNSURE (   9.97  )
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

On Wed, Feb 19 2025 at 17:31, Nicolin Chen wrote:
> Fix the MSI cookie UAF by removing the cookie pointer. The translated IOVA
> address is already known during iommu_dma_prepare_msi() and cannot change.
> Thus, it can simply be stored as an integer in the MSI descriptor.
>
> A following patch will fix the other UAF in iommu_get_domain_for_dev(), by
> using the IOMMU group mutex.

"A following patch" has no meaning once the current one is
applied. Simply say:

  The other UAF in iommu_get_domain_for_dev() will be addressed
  seperately, by ....

> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

With that fixed:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

