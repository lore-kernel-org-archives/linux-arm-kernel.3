Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF610CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDa3St3z3sBjphBfFJldmgeiOcJlSQHxYpBL/HB5Rrk=; b=p+j1GOkpeodZt1FdxCI62YgQRj
	6vqwsJSxrTs0TImECfzRpfi+t7OeLk6lew57QljUk/HNqryWiS1+MX2SBQS9bhnL20MnmbUD3btjg
	gM/n7NuwmIvSK/cAlYEUtYsQisjoiyMYBH/NjTmLGkmC/WGOh7nvyvMXod1WV8EMM2fx41sROlluA
	HhR/oeGXQgkALOf8BJaAJUAP5u+h9lvfvnyySy04fh2Ts5t47TetTIBD8njl4nZ47Eabm/GF1RBnD
	rAa5uHf/klkx4KVtnkYtiqB+3Aqhy66SBliQPy9EDd017kAMoMFUbM5EnxDAwNaYkzP/vbwUxBXOB
	ARf4oyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJzq-00000007uA7-3REq;
	Wed, 10 Jun 2026 14:33:34 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJzn-00000007u8i-3kVT;
	Wed, 10 Jun 2026 14:33:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781102012; x=1812638012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nbSpTI+NEem/B8QHO4h+hdqb3YdpkqnxeBRh6LClmIU=;
  b=X5WLT4kUMOo1wWzZcKmVy5Jj4rem6G8ot/7Fb6V13KL0tbAPQCmubGPK
   MvqEuCySm6kN72zsExWep/qCjT710X9cOKizj6MCKY1tWC0qjK++BIDAY
   f6r2s3/xiUl8uFsIAmsKPJ/bIHhf9bpfS90wUYwckNEUn1p2Cad0fX038
   TjMBzWPH70dmF2fNEt/wrGHFiDwbQo6YQNRJISXNOz660vxTloBcUFtMN
   au7KRHESa+dc6FuxSkyICUx8hMWidh226XrDx336b2G7rXreX2cdw7HtS
   OYmkKFo7CgHCiGrOzitY1FV3O/7FU8WlP0S8krPxO8KQjW8YozMxHdgzU
   g==;
X-CSE-ConnectionGUID: kusnoDh4SE6VQ86EcE/fow==
X-CSE-MsgGUID: 66l6H5SnTD6pO0+izCAsbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81742957"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81742957"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:33:29 -0700
X-CSE-ConnectionGUID: H8GN1TzCTVSABF/VcR68RA==
X-CSE-MsgGUID: 4X+ZiRtBQHWMqwM+SsXzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="284277249"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:33:23 -0700
Date: Wed, 10 Jun 2026 17:33:20 +0300
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
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on
 remote "port" node
Message-ID: <ail1sAxgh5Xtkj2y@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-11-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610084053.2059858-11-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_073331_943822_5E063AFF 
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

On Wed, Jun 10, 2026 at 04:40:44PM +0800, Chen-Yu Tsai wrote:
> A USB hub can have multiple ports, and this driver needs to
> differentiate which port is being matched to. The USB hub driver now
> associates the "port" node with the usb_port device, so here we can
> use the remote "port" node to check for a match. Then fall back to
> the remote device node for the other connection types.

...

> +		if (remote_port && remote_port == dev_of_node(dev))
> +			return PWRSEQ_MATCH_OK;
>  		if (remote && (remote == dev_of_node(dev)))
>  			return PWRSEQ_MATCH_OK;

We have device_match_of_node() IIRC the name of that API.


-- 
With Best Regards,
Andy Shevchenko



