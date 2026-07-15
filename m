Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C4EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9S1sMsOnPqBb3uwAEItPWAvMzZg7JW5Rca0L0NiCUe8=; b=sIWU+0zm5jbov0H0hSxfnnybR8
	S8TugILlCCY8BIgKtTj0xxaHDo8dsIUizcVXnzHKGuptr4sd+3oYKzKg0dHoW4RCjGnuhQlic6rLc
	q1mV+EmyFJla/AxCRG/IMhVx6iMVwaBrQzrZ0Qb1RvqLqIkh9ijnAw3aBOO3T6Oev6FhgYlWDwyR3
	nmsAYd5pRUdkYfNRojB6nuBJ8twLPgPII3HJ7QBmIUsZGfULweEG6trUQZnJ7VM1uY/RaxIrnX1gk
	HyY72Fp+dYfwVmIxMrHMLE+nsoCVjctc1ZJ1pib2ur7Aqd7/H3okzbdx5C65O2dMzd0MtegPeRCCQ
	r6MfsNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjve8-0000000EH0A-0JIk;
	Wed, 15 Jul 2026 09:11:16 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjve3-0000000EGyY-38y7;
	Wed, 15 Jul 2026 09:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784106671; x=1815642671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jliDADGCLmkXxXJ784OiVvMm1uOKkWyQ+k6fHfNWlms=;
  b=cc5w23vVUC3e8YykRLOfWYSdu0HwCIBtJxvuXBaX0wHkGE/HQOGAuDGx
   G/U+6Y6kzxNhnmtQutBy9xxBn2+luxgkwaxgfJlB77GKP2tYKgOBhH+Gb
   h8ITkE8qvrOlB4+I7i8idF/GIMz4hrq9CFUnaCZMdZylD2lkqsKsfHu+U
   GhqPWg8y4GtRBsekiNJfc7yjhAlc4UUKl6QOb7VFZuJOer7mb0Tj3M+4y
   LKyZOgnhNH21kzN1aDIjv+KFZnxI7+Azg8rRCS4xMo8pyC0bJmbayH+fZ
   lcnIqxljrG8xlfcWZkQ/7+COoQgfJobwdx9Wms5/b6rzJ358lslx4kgU5
   A==;
X-CSE-ConnectionGUID: 4YkbQSAzQIyDHO34Qq7Cgw==
X-CSE-MsgGUID: /nQh8uACQM6iHaMq/2YWUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96106097"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="96106097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:11:10 -0700
X-CSE-ConnectionGUID: HlUvXl7zTAay9OsRhPH9+g==
X-CSE-MsgGUID: mm+NVqUFTFGtw1BU54676A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="255617959"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.129])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 02:11:06 -0700
Date: Wed, 15 Jul 2026 12:11:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v5 04/16] usb: hub: Use assign_bit() in
 usb_hub_set_port_power()
Message-ID: <aldOpuACh_FAainj@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715085348.3457359-5-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021111_798117_0996C5E8 
X-CRM114-Status: UNSURE (   9.23  )
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

On Wed, Jul 15, 2026 at 04:53:34PM +0800, Chen-Yu Tsai wrote:
> usb_hub_set_port_power() open-codes assign_bit(). Just use the
> assign_bit() macro instead. This makes subsequent additions to
> usb_hub_set_port_power() easier to read.
> 
> This change does not introduce any functional changes.

Yes, it's a pure cleanup.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



