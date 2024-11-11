Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E8ED2E9C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG1Nd7+HVlTq1ri/nmsg9JlZwgJXIHRSTROQznjNZMY=; b=li0lrUjJfACdHWc6Xdz6DGDQRO
	q7/oz4CESVhULDp7nJjmM3apv4VwlfapGUqcn6KB58yPkzaiC4pvgOBZxC1727j6NqwuxSfire+Fk
	r8iovH+Ir5jVQ8G3UJ31AKM2wEqA8OAUMu9SXhgH8ecyrMZv+e2FwXjviZU2nr4k/2hnN3O6m0ljD
	8EY5d9WXjcuPmdZb4IQ2BFZvixsJ/xDYnTn2qRyAwpn7E9c+Wq53+OzlRh3tfIjiyxy6TOV+ukoi9
	8aQvxTwRUnHTnZhZteRzeMYRCGaipnELFKXfbF37Io5VunSgztYU+iIby2Ft3EQA2OGlBdEaw/qZ5
	B5jv2aeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQmq-0000000H6za-06uu;
	Mon, 11 Nov 2024 09:32:44 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQkY-0000000H65a-3XS8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731317422; x=1762853422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BUnaed9fBm7H7/JjfD4vCaL7tVZY6KSJ+UsnJ84Dnps=;
  b=NgdHjbijAiwkUz1k+RGEs7KeUXXg2yr8WAjEzkhJFdydC0eu/UTBFFlk
   9KasfM48r2gVw48kSl/Xaa39cJGse17mBXxpTufKUlmxt0B4yaduDC9/H
   /WHfHU1xUoZbxzU5jCd+vGs+J9IjcryRpOx+oF9lKdD9h9uZrNRFoeHy8
   0YBQgng3uSUsbRcyXcKy+NVJLS+FMRKVJp2bh7rrXdSaaS4ZR1oYq3hb0
   ACLpSBHUSZY/R5i39juXBC1YQS4uVqWNVliSYzC7r3t4Z3kDNcyp3WFN0
   mv+Yz1PddSDHtKoP+R92t/ATdKIGCjT58zSR6NRS9Z53GxjGZzEscjCPs
   w==;
X-CSE-ConnectionGUID: QA6aZ3oISzCpnKZN4uOuMQ==
X-CSE-MsgGUID: 0OypxdVrSmq3yuixnmMYRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30998443"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="30998443"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:30:21 -0800
X-CSE-ConnectionGUID: 8X7KpXjaRMWd5iBaSklJwQ==
X-CSE-MsgGUID: t+bmDv6FTumsoJ+kjdXA+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="91748569"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:30:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAQkO-0000000DXig-2diE;
	Mon, 11 Nov 2024 11:30:12 +0200
Date: Mon, 11 Nov 2024 11:30:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: maz@kernel.org, tglx@linutronix.de, bhelgaas@google.com,
	alex.williamson@redhat.com, jgg@nvidia.com, leonro@nvidia.com,
	shameerali.kolothum.thodi@huawei.com, robin.murphy@arm.com,
	dlemoal@kernel.org, kevin.tian@intel.com, smostafa@google.com,
	reinette.chatre@intel.com, eric.auger@redhat.com,
	ddutile@redhat.com, yebin10@huawei.com, brauner@kernel.org,
	apatel@ventanamicro.com, shivamurthy.shastri@linutronix.de,
	anna-maria@linutronix.de, nipun.gupta@amd.com,
	marek.vasut+renesas@mailbox.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFCv1 4/7] PCI/MSI: Allow __pci_enable_msi_range to pass
 in iova
Message-ID: <ZzHOpJ8tNs5CD9m1@smile.fi.intel.com>
References: <cover.1731130093.git.nicolinc@nvidia.com>
 <7406707cbcf225fe8f6ec3ce497bdcfc51f27afb.1731130093.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7406707cbcf225fe8f6ec3ce497bdcfc51f27afb.1731130093.git.nicolinc@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_013022_915379_47A25DDD 
X-CRM114-Status: UNSURE (   8.42  )
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

On Fri, Nov 08, 2024 at 09:48:49PM -0800, Nicolin Chen wrote:
> The previous patch passes in the msi_iova to msi_capability_init, so this

msi_capability_init()

> allows its caller to do the same.

-- 
With Best Regards,
Andy Shevchenko



