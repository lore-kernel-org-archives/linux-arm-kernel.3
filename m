Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2581C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUTRTVITPFHps8WU8MH+VWm7WBX0frpfGAwf5qHR79c=; b=PLdcp+kkedE3MCu5KyMrJpdzCI
	mLHaBeU0WT9yg2szcGZiuLz3Dcq0BAPERjnN0Rgv7VdACiOie1hYZLYcFDBbUJ75uhS4O2l8GAXlA
	uPRRzjPMvHtu5h0/UTrvbzHXCdTeFo6w77H3xcbw7cky9nC6vY2pU0LXEcll4di+0h+T5QCFkCn1X
	u43NQ0dUONQgfcO0mOrRXgHqxdb4ktX3J5+gZbVuPzbAu2dncz81Cm40KeipJDprWOUfaJZrL0YFR
	yJXeSSWiA+/SrDbLtIr9P0WKdZeSJ9sWs7gVfmzp+TDhqU+ZnSUCwHcREOF9+yruH2/zhSuiAIqe0
	dv3ENcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TUD-0000000DwCM-1nYc;
	Thu, 17 Apr 2025 17:57:17 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Syh-0000000Dpvx-2t1q;
	Thu, 17 Apr 2025 17:24:44 +0000
X-CSE-ConnectionGUID: PW9hmhhKQAetZkts2+qGKQ==
X-CSE-MsgGUID: N5h6GhbTRrC2yuo/8+O9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57165659"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57165659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:24:43 -0700
X-CSE-ConnectionGUID: TxAjV8heRcO0ivFe+6k3tg==
X-CSE-MsgGUID: rmcBZv2pTR+5o16tdqoLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="134969479"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:24:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u5Sya-0000000DGZG-35a7;
	Thu, 17 Apr 2025 20:24:36 +0300
Date: Thu, 17 Apr 2025 20:24:36 +0300
From: Andy Shevchenko <andy@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomasz Duszynski <tduszyns@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Andreas Klinger <ak@it-klinger.de>,
	Petre Rodan <petre.rodan@subdimension.ro>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/8] iio: more timestamp alignment
Message-ID: <aAE5VAKCK9zfXH5D@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <aAEz2ZD0Ipd1Xuy6@smile.fi.intel.com>
 <6ff6e3be-6193-4977-977b-24de89c09153@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ff6e3be-6193-4977-977b-24de89c09153@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_102443_733395_AA8EE4DF 
X-CRM114-Status: GOOD (  13.94  )
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

On Thu, Apr 17, 2025 at 12:16:53PM -0500, David Lechner wrote:
> On 4/17/25 12:01 PM, Andy Shevchenko wrote:
> > On Thu, Apr 17, 2025 at 11:52:32AM -0500, David Lechner wrote:
> >> Wile reviewing [1], I noticed a few more cases where we can use
> >> aligned_s64 or need __aligned(8) on data structures used with
> >> iio_push_to_buffers_with_timestamp().
> >>
> >> [1]: https://lore.kernel.org/linux-iio/20250413103443.2420727-1-jic23@kernel.org/
> > 
> > 
> > Link: URL [1] :-)
> > 
> > This will help to maintainer with b4 as it manages tags.
> 
> In this case, I don't want b4 to add this Link: to all patches, it is just
> context for the cover letter and not so useful long-term.

Then tell it to not do that.
OTOH I dunno if it has a special filters for cover letter.

> > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> > for non-commented patches.

-- 
With Best Regards,
Andy Shevchenko



