Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQ19BjVTscIH/6I5a29tXX71SIq8/u8k7Y1kfw/hDmM=; b=fp5iPYOiajavRbQBGnAj6/Nso+
	oprrd1rcn94oA6W30mXvWQ0BHyEJrBcw7Q7qYUQob1UKo9Vy7DUzwmjz8Q9FiLyjfiCAWkJsnjdt3
	IyUjmIw7k/9Iq+CKcqGvc65c7un9oUBq30JO7sjaTMsbi7/bIF8S6NU7j33A/gEQDHSL+OVXSKZoJ
	aQ9hrIAFvHSCB6f/rHRdpziToSDd+HG5KllmRU1CFsKo0bhjNXgMAHYb9QUGABT3XHAJIKltdOJ1w
	XLg1++PjM7xqLxZoekhaAg0BEeHP1eOJA6bieRnZxT0F8fO5OlfdAbsqUkOCtiKaGEsdXmEc9tTWz
	82cKDh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm4s-00000001xES-3zU9;
	Thu, 09 Jul 2026 10:33:58 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm4q-00000001xDD-1MOX;
	Thu, 09 Jul 2026 10:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593236; x=1815129236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bWHIEdjL2dr+L3lteYYp6oLrvxioUMyONYbfmyggoc0=;
  b=kW9a1U1m/C2bVgO+CPTa7CX+9ssv+KkdfsmZOMCEC92GMbMsJdYMrxZq
   oA9bBEp022XOTA9CJHQ6nhKnLF3z2697CwZ/RBwE2m+h8d6pLw956iJ8s
   OqbAnbUr4naN1pB/KDjoI/QCNfUiMndzDusjY9T7uu6/jXxUiAfOcczgp
   gTN3NfzRl9TH7Wu6c4VRg9vKSNiKo0C9Sywkzplz+8RaOPooYqW5izdBr
   PRT2neIz0HaX/hloDuD8FbtS6P++dnWnK8YuMlifljg21xAjztp7z2xPx
   i2xb+9uBS78uJeLE2JipoORy6c9lIfYZTLkIoq7O6+gf5A2iJlQlPp/9G
   Q==;
X-CSE-ConnectionGUID: Z8vidAmxRiGMvRLuvOxFWw==
X-CSE-MsgGUID: hr8o+aBdS3Gg57nfdOSLfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94623171"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94623171"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:33:55 -0700
X-CSE-ConnectionGUID: oJJpjx0aQmOy2HToIrIdLA==
X-CSE-MsgGUID: F/+fAyoiRoqqeb7dacv0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="252799922"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:33:49 -0700
Date: Thu, 9 Jul 2026 13:33:47 +0300
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
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/14] power: sequencing: Add pwrseq_power_is_on()
Message-ID: <ak95C4HVnFn4UEo8@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-4-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_033356_403328_9D817810 
X-CRM114-Status: GOOD (  11.70  )
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

On Thu, Jul 09, 2026 at 05:57:08PM +0800, Chen-Yu Tsai wrote:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_power_is_on()
> so that they don't have to reimplement it locally.

...

> Side question: I wonder if making the !POWER_SEQUENCING return success
> would make developers' lives better? At least that is what the clk and

"the clk... mistakenly do."

> regulator consumer APIs do.

When the clock is optional, that is justified, but for non-optional cases it
makes life actually harder (see for IS_ERR_OR_NULL() checks against
devm_clk_*() cases, which Krzysztof targets this cycle to eliminate).

That said, if the pwrseq desc can be NULL and the API tolerates that,
then it might make sense, otherwise it has to return an error.

-- 
With Best Regards,
Andy Shevchenko



