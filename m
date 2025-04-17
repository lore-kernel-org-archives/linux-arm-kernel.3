Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6174C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WoT0hlEPdBONHHq0WB8GsPAqqVEz2gllwrPN5aCMDz8=; b=rJgo2H3jn8yRbFbng4yNpNCrK5
	mg3skoDCvaBJ99GnlBR+L5C8TQ09tKQrTT8ssAHDn4jHvUJ5wc2naPApWAg4lGe9NNVl9pt5uoa2E
	2hYypKWExJdHdtnlStTdrxZLisi4xKEcJ7+jQN7rp5UGmhbwvQu7JnrTb12ELh+XDrGc7CRFS1ne9
	e8UBZJZOFSfEEMNu1YjK+NsC4R/Gc6OVnNd0v36S2X4i9VE/Y5+zfeuOcYw9P1IZB6QjfnkBtUzeW
	OoHbdXV06dm86Hc/rSZ/wkqKWlilYlw9+s21UwiBp3vljXx3mEy1P1joc351hU6C62MV8gjq0Z+3J
	ANQBIkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5So2-0000000DnOf-09Ip;
	Thu, 17 Apr 2025 17:13:42 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Saz-0000000Dl2h-38LH;
	Thu, 17 Apr 2025 17:00:15 +0000
X-CSE-ConnectionGUID: CihYifOiQYK4Dx623fllsA==
X-CSE-MsgGUID: MgW139ZDRLSQj8JsPzPwBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57896177"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57896177"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:00:13 -0700
X-CSE-ConnectionGUID: rWy/F7c+SyeYPFOo11Ev+g==
X-CSE-MsgGUID: yfwn/Rs9TluKqRcHV1gQ3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131411561"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:00:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u5Sar-0000000DGBj-3VcS;
	Thu, 17 Apr 2025 20:00:05 +0300
Date: Thu, 17 Apr 2025 20:00:05 +0300
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
Subject: Re: [PATCH 7/8] iio: imu: inv_mpu6050: align buffer for timestamp
Message-ID: <aAEzlZoZTsQuWgZa@smile.fi.intel.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <20250417-iio-more-timestamp-alignment-v1-7-eafac1e22318@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-7-eafac1e22318@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_100013_800411_09ED748B 
X-CRM114-Status: UNSURE (   7.17  )
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

On Thu, Apr 17, 2025 at 11:52:39AM -0500, David Lechner wrote:
> Align the buffer used with iio_push_to_buffers_with_timestamp() to
> ensure the s64 timestamp is aligned to 8 bytes.

Same question as per previous patch.

-- 
With Best Regards,
Andy Shevchenko



