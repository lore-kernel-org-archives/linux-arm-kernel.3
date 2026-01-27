Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EF8D2FEE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 21:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFslpySu8DDPowPQB9Xmx5Dmps1acoRNefTV9K9B/78=; b=TClUpL12lpZqBmEBa9UqaZxe9U
	sOepfRHe3tzF4UGfsrCN6AbAUpx7r5fkDIcD7ANlln1N0nL+pZX0mwZ3nxQUqGFAXD17ujDZ66gRp
	x0tUgs+NMRF6/9H9d3fccurBYrwi+HfPmglw36NrYAPpzyqlVUrdvprksT3KVIradeqtDG3dfKiud
	cReSHAfCoiPt3sj1/OVEO80zdAJt/QT7GOldtqrumtoNDMtPFAM6GQNjvt8uHv/AZPMK+4pm2K3Pb
	DMFQGSHnTw762j99QiNlm0IN6g7c6YqsigWuEYYD+ez0gFiSgBRAw/ChSMsGvyQRphvCvHjwhKECC
	bwmfDVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqYe-0000000F41f-29wv;
	Tue, 27 Jan 2026 21:25:09 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkqYa-0000000F41D-0Pp3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 21:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769549104; x=1801085104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q5wUxehBpPLw0xkxOWjY4JK5mWWU7Rxj8x7jeUkVZ8I=;
  b=Q2L1hWcL91YzIrbq/M5H+v8wCdK62E8DCUHc3TuAQ2eKZXSDgxnBwvol
   FeuvzL2Fg+5QxnJlXaE1b1VuXVjV58uHtack3uEiN7FDF5LzaSX/k97Jh
   BKRmvbuNNk5ZYbkx8ZQ5yo69AeUlcTNKplE99z/S+tNuQArDhRaWDjZIq
   BMu2yc7uopUp13N3hgV+l7FChk30orsOjgjAjs7hBXtTHK6/AZAJaiVhV
   3M3vItQQ3PTW0eqjW3+p2pd/xlXVPWiW27e4Y7egMdl3z6DOa+wztse7O
   V5Od7Cz6YvtSMv2tj7EfjweFrRT0OrYlPRQ0v/MPHoI1hOCCffeZEquFH
   g==;
X-CSE-ConnectionGUID: YU/FIk/dSlSofFECKgQFSw==
X-CSE-MsgGUID: GIuHhtNUTM+v7u54DZWLdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81478900"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81478900"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 13:24:58 -0800
X-CSE-ConnectionGUID: 7BHqFVaiShKNtEhTDOVdlA==
X-CSE-MsgGUID: XvVQPI5IRMWk8J4XscMCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208523906"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 13:24:55 -0800
Date: Tue, 27 Jan 2026 23:24:52 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/7] i2c: xiic: switch to devres managed APIs
Message-ID: <aXktJPe2YMkWEqEI@smile.fi.intel.com>
References: <20260127-i2c-xiic-v6-0-e82e2f6f657c@nexthop.ai>
 <20260127-i2c-xiic-v6-3-e82e2f6f657c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-i2c-xiic-v6-3-e82e2f6f657c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_132504_200671_BC01B790 
X-CRM114-Status: UNSURE (   8.68  )
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

On Tue, Jan 27, 2026 at 09:03:57PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Simplify the error code paths by switching to devres managed helper
> functions.

...

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");

I told you to use slightly different parameter. Please, read reviews carefully.

-- 
With Best Regards,
Andy Shevchenko



