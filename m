Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2AEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90p/gyewha7L8Rk4Ti90vHNRSV/6c+K4x5DC5VWwfGA=; b=xps9g7LXOaW/7gfCRYgypTNrf7
	zJelwAaJS+OAiSwHNwjGNi+mO+B/JvI8yBQ5vASs2FOfWPj4sPoJCYKQfhjo1GNRNI9KDkKHGv9k/
	V8UY3oHvRcXXmN2vgxq/MEgIFceyZWl1Pn9RsOD2QD4Wyo65f5M93EcnsHK2T4ge7LP/opx7TKHgB
	nOK0wVtfqSk5myjYPesiV9kbGYdoL0ZqBJ9s8j7kBbkQyqoPqU+oudVzWZfxet5wbOPfR1N6yay90
	c2IOiLCE7jclcJbGKUDKGcL5uIcw1VNmu3bu+oIWvlxrbnsV64YwW6CGpPWvk9c3UwaJ0SOD5PEWZ
	an6kkiiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCwk-00000003Fu8-1Gkh;
	Mon, 17 Mar 2025 16:04:10 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCu7-00000003FHX-0TEd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 16:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742227287; x=1773763287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJe8kVKyH077ow1Mw00nxnv3bgj5DDeZ/UYwSoiFKZk=;
  b=HU1wwn5hAJ5BqXIjBcRfpf0L8qTyFGTpsPuSA83pYk/NQQQcuK+1aN16
   M47bU1I5cX4PIdJR1OUoGEExXIJCn+ZD5zITTx8fS0wJBpoCJHU3sF08o
   OVymJ9+BhCfqUbMNNxNZv5jSMwmHQkT6GaRQx+OX0eFo9IlmEOXDiVhLt
   yz4GVUttSzIvji0hFE+FmmpQxQ0cwWDU5cQq1U1Z6yvYwJJWQ0bBDZShA
   6uw7EQNUvmACMFIgoIUw9oUB+3YfW7gLL3zFFQVqout7K3fkpVyhp95we
   HSuXxJMnosE+xqHjmia4pe85RqQTgEe4RVn2uCFXa3XQIL6RlfAPbplgE
   g==;
X-CSE-ConnectionGUID: yP+dQA3vQRSdhzmXBXK3aw==
X-CSE-MsgGUID: Y+W9SVSmREOf9D63mc3KjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54703321"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="54703321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:01:14 -0700
X-CSE-ConnectionGUID: 63yQND79Scmjk8NuLdValg==
X-CSE-MsgGUID: DHM8kifPQZSKZYZM2QSPpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="122479989"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:01:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tuCtk-00000003Lvv-0VD0;
	Mon, 17 Mar 2025 18:01:04 +0200
Date: Mon, 17 Mar 2025 18:01:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Guillaume Stols <gstols@baylibre.com>,
	Dumitru Ceclan <mitrutzceclan@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Alisa-Dariana Roman <alisadariana@gmail.com>,
	Ramona Alexandra Nechita <ramona.nechita@analog.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v8 03/10] iio: adc: add helpers for parsing ADC nodes
Message-ID: <Z9hHP3vdCm0WFoyH@smile.fi.intel.com>
References: <cover.1742225817.git.mazziesaccount@gmail.com>
 <e556f152a9cff2ff61e7b7a4b42feffb400cb1f9.1742225817.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e556f152a9cff2ff61e7b7a4b42feffb400cb1f9.1742225817.git.mazziesaccount@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_090127_199208_D019B1C2 
X-CRM114-Status: GOOD (  12.56  )
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

On Mon, Mar 17, 2025 at 05:50:49PM +0200, Matti Vaittinen wrote:
> There are ADC ICs which may have some of the AIN pins usable for other
> functions. These ICs may have some of the AIN pins wired so that they
> should not be used for ADC.
> 
> (Preferred?) way for marking pins which can be used as ADC inputs is to
> add corresponding channels@N nodes in the device tree as described in
> the ADC binding yaml.
> 
> Add couple of helper functions which can be used to retrieve the channel
> information from the device node.

LGTM now, thanks!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



