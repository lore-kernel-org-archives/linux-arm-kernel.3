Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1660DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f27OiLGZ47vvW0NTfr16vxC8ZXYHbNNP3KSKzgpu3h8=; b=B0h7J4/MLeJqMkZzYOTSyW1ut5
	oUIx43efPGTDzVnXR9BPefIeVEcQr2J/z9hFl6SeQjsXnvzPqnDafIAVHXNQbg+QkVN8qkqIaTHaQ
	mlXgvCGX7QRbWLgFzLcNvGPIJn03GwQSr1zgso8XQOnWPswP6sIT0z5YMAERzGUhV6dZVWlLDBhAK
	2J02I30Fo5FXG5OqYCqYtmAmosCx1EMmORZPYORxd9/0MrEIKxEVq7u4478XUWqj0Plf+ClPbvH45
	Fk+dp/4JHhEcQeD8vZtaktPSyiEpAVdJivFXM6fkSpl8mibvWdiZXEjnGEmIpTrIDoHyVQGLI0rj1
	Ah1s/1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDec-0000000FVLt-1Hsz;
	Wed, 14 May 2025 15:04:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB8K-0000000F5ar-2ado
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 12:22:49 +0000
X-CSE-ConnectionGUID: qRA6NGTqR1SR9bXQEBmITg==
X-CSE-MsgGUID: TNXeHadfTM6hVy8HSlO+Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66526242"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="66526242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:22:48 -0700
X-CSE-ConnectionGUID: jVh6CU3DTDishg36Z2t4Xg==
X-CSE-MsgGUID: ywqvxL3qQsahLY7v8B01SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138946955"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 05:22:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1uFB8D-00000001Y1g-3TVL;
	Wed, 14 May 2025 15:22:41 +0300
Date: Wed, 14 May 2025 15:22:41 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	u.kleine-koenig@baylibre.com, robh@kernel.org, tglx@linutronix.de,
	jirislaby@kernel.org, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: stm32-adc: Fix race in installing chained IRQ
 handler
Message-ID: <aCSLEZoeafOporMf@smile.fi.intel.com>
References: <20250514085138.3221059-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514085138.3221059-1-nichen@iscas.ac.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_052248_695240_7E9E0815 
X-CRM114-Status: UNSURE (   8.52  )
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

On Wed, May 14, 2025 at 04:51:38PM +0800, Chen Ni wrote:
> Fix a race where a pending interrupt could be received and the handler
> called before the handler's data has been setup, by converting to
> irq_set_chained_handler_and_data().

Sounds like it needs a Fixes tag.

-- 
With Best Regards,
Andy Shevchenko



