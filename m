Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ECCD2E9CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFqEUSZdxcaDfmyZahDJ5EOWPMwC1Jc+KDR3YG8sWm0=; b=XAS8JvyLpg+gqWGfY7mQKpsVLY
	C7w/OKG1vNcup+WVD6duv9UG7NvQ0wFyC3S2rnLgjIbz0AjPCLLIKmKGlRMNx+clr4VNGl4g4rTEq
	XSgjLWsocU4mjRIj1GsAKEgIHOuF3FcSrHQZPRs33tMPCkyolUfKn2IDRwEqpr383plg0KJv0qo7m
	EhEYXIUO0DDVV9A2JxE5EplvpoS2S3ekm3tzegslKBg7ltSQptLXFN52/g0CuFgj5uG0Hd6zwCfKI
	elIZI3xwegP/g6I0pXyDJr5NvW8GZhy4rvmMZI5BKTz+HSQNDf0g4ugCKNgpjY9y34FusKcIYMMDV
	Yp+Kg/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQpZ-0000000H7Zw-0Pjo;
	Mon, 11 Nov 2024 09:35:33 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQnj-0000000H7Fy-0Ebr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731317620; x=1762853620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S5DtvwrGDQ+vwlJFpq82/vsqjIUp6kWdOPKhbwAhZNY=;
  b=TCL/P5Cc9fQjVj5cig/R+U/dmComtJQ7ECr0uFR0N3hubvgCYP9PRjSC
   GY8/0nokzJPZYhFJo5pkyH78RUv+34nNXk/y6hbV62tXffkn95ynUnGxe
   2iZF1nW7YglcUNgKiIMbQBlnF6nK48xYw0RBzKzByscxGXIAGePNOGbMo
   Ce125vx17kCSbzx/KcQ2iFwUob1I8LLQDAJh3LSmIwWQm/yrtX6KnIIPJ
   atdWG2tVeDCUP1lN5/w8utDFxYB6cVwNylefPP8ZFspnh1u2ycIcJzbKR
   7MHfbgO8LtQLPkta0HfB5yBLk1O+GI1OsCLATBxQVPp2Dgpu9Lw4VMY7i
   A==;
X-CSE-ConnectionGUID: uBZVoZC5RzyDlWOJohOG4g==
X-CSE-MsgGUID: YgTooDHLSESfAIr+dTCvhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41677961"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41677961"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:33:39 -0800
X-CSE-ConnectionGUID: HoGMdXS/Ti+b8iMovMwi3Q==
X-CSE-MsgGUID: GgMl7szCRZSiJHpXxUGZhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86951178"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:33:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAQnZ-0000000DXlq-1Mq2;
	Mon, 11 Nov 2024 11:33:29 +0200
Date: Mon, 11 Nov 2024 11:33:28 +0200
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
Subject: Re: [PATCH RFCv1 5/7] PCI/MSI: Extract a common
 __pci_alloc_irq_vectors function
Message-ID: <ZzHPaPlrTYKt59fy@smile.fi.intel.com>
References: <cover.1731130093.git.nicolinc@nvidia.com>
 <0c09c2b1cef3eb085a2f4fd33105eb18aed2b611.1731130093.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c09c2b1cef3eb085a2f4fd33105eb18aed2b611.1731130093.git.nicolinc@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_013339_160389_5BAA26CD 
X-CRM114-Status: UNSURE (   8.75  )
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

On Fri, Nov 08, 2024 at 09:48:50PM -0800, Nicolin Chen wrote:
> Extract a common function from the existing callers, to prepare for a new
> helper that provides an array of msi_iovas. Also, extract the msi_iova(s)
> from the array and pass in properly down to __pci_enable_msi/msix_range().

...

> +	return __pci_alloc_irq_vectors(dev, min_vecs, max_vecs,
> +				       flags, NULL, NULL);

Even if you so strict about 80 character limit, this whole line is only 83
characters, which is okay to have.

...

> +	return __pci_alloc_irq_vectors(dev, min_vecs, max_vecs,
> +				       flags, affd, NULL);

In the similar way, and other lines as well.

-- 
With Best Regards,
Andy Shevchenko



