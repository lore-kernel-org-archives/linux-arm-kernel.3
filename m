Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88205108B8E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsI+2W7F3CfaJSOjQ36WDkdbEuej6AfQp4Tx6/klAiY=; b=cuCGdclCKmABLRqUgVZRouHz5T
	XgRdzeMlThn+cgCfEnStF8M1QlMjlByW0ivaz4rj9q2pkiAq9cqzyXMe7y0o6ICSm0QgH0iYmvpVE
	Or1jqD2WUBrPemtyYDnYxe37AhNmzP75gei/NzsZMEdkbae/CU0NX1g/z4S5ed8ZNJNthW6UamMe/
	o8I3AnsJ87zMKP192k0RwYlP1YsvG2fCideB16bzAIZJz1rBZj5kMzANyK3OQKHBBRDGU5ClakV0X
	6nmsg2tC3SqUyT96ujgBkpXulfmZmaWL1V/xTOkwaqvz4cGVY12dcmajWZ+RuRtstYxAS8Mr1vmgD
	FR7mfw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XAi-0000000Cbww-1j8N;
	Fri, 20 Mar 2026 10:33:40 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XAg-0000000Cbwb-2Hsm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774002818; x=1805538818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LSQf6TghFoqm6GEMOdcWK6utgEtFgdJISULngartkrk=;
  b=fafL0n679MTDdG/6XnZtjfVHpzjc3CPDCdDhNhD3P1li6Sr1H39F28cU
   tNM+EX866RuRnJA5WoPcAmr+gW+izninI4tZtet7DSg8eusgztHPtkP/0
   72lX40xNtr002s8p/DSOXbVV9wMYx2vic9R3Wf0ZUU+kAjTPNDBvIu610
   B26+iWLnZWNoLoAo2XX8PhZgfnIz46F6zyx5/FlY9xCBIYy0zZpeoJT4G
   /ZnwnfikH2OzroDzpJszYuw6s4vQsGv+gqQyPvgRDqsegqLRzN8VjX+23
   1mVpnK45Sm+HFnTEaspVeT6e/sRz600vJbtNni9bwjRm7bxLijbozZtZP
   g==;
X-CSE-ConnectionGUID: ZYm/NCJESWW19ezVgNWfQA==
X-CSE-MsgGUID: 4s46OcJHRQGMZa3kIF/FoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78989471"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="78989471"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:33:38 -0700
X-CSE-ConnectionGUID: FEilcUbeSraVdBth6Vgygw==
X-CSE-MsgGUID: 5JXG02puThGdgHPVUyvk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222340475"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.40])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 03:33:35 -0700
Date: Fri, 20 Mar 2026 12:33:32 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	morris_mao@aspeedtech.com
Subject: Re: [PATCH v3 4/4] iio: adc: aspeed: Reserve battery sensing channel
 for on-demand use
Message-ID: <ab0ifBMNuY4BwqA5@ashevche-desk.local>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
 <20260320-adc-v3-4-bc0eac04ef7c@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-adc-v3-4-bc0eac04ef7c@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_033338_594938_E3CE39D5 
X-CRM114-Status: GOOD (  10.23  )
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

On Fri, Mar 20, 2026 at 01:46:38PM +0800, Billy Tsai wrote:
> For controllers with battery sensing capability (AST2600/AST2700), the
> last channel uses a different circuit design optimized for battery
> voltage measurement. This channel should not be enabled by default
> along with other channels to avoid potential interference and power
> efficiency issues.
> This ensures optimal power efficiency for normal ADC operations while
> maintaining full functionality when battery sensing is needed.


...

> +			/*
> +			 * After enable a new channel need to wait some time for ADC stable

Missed period at the end. And you probably wanted to say
"...for ADC to stabilize."

> +			 * Experiment result is 1ms.
> +			 */
> +			fsleep(1000);
> +		}

-- 
With Best Regards,
Andy Shevchenko



