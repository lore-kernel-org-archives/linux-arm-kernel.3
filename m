Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF2AC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsO67/Q1bB5+9TsoihVncOsYpwNmLHwKaRgGnvby9hM=; b=abO1Nx/TDaJ89TbVUtCNeCIlwu
	h0smY37GVaSUuwDx2bx9j+DhNQWUDOCl99ftEGZXXE/Ffvda1jchYGxy0JYX0+pxnCKXV/hCffATg
	5N4nqXBxDjYOaoAvKbCWDcv7A2m5E2PqXAB4LHA+zWG6pB6LBC7AECi5ZXcUR1cRx3lfJq4smHg2s
	IpkasQ1gnCcQcRsp/tkw5VhhEx1kGY9mBYosHF77wNdS5Apzn9DmweE2M8yX5Q/9QR1Y+J4HefEYB
	kWhHeVfjzTL4UnJ3O4128javTN9/VAhGul97FEusiHDVLkvCZGk+UYew7xDxKIxR46jXxLnV+TG+9
	MzckwQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wravh-00000003w7D-3lYF;
	Wed, 05 Aug 2026 12:41:05 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wravf-00000003w6Q-1p44
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 12:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785933663; x=1817469663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aGqrGLoXLWCR77fzM54CRWcSbftuIKEd6Z/+uJWgrMo=;
  b=CApoL4VNyJWPgqipLUc8jdCoFpo5wAa3nDaL2Bum6vAEkLzVW/Q6lh1c
   KKyqC1Dui3qtHLIv6xZaf7g5bSuP9Gs43zt6ZTyzzVl+wi8+N+u/QeCQi
   Zo5mD0vLkrNKwNQMtCm1sZj76c6myXPBwrfzPnet/Tzbj2EQOFMeD7htA
   BY9L9tkB2pygNXbZSQCrEeg182zgX3Dg0/LnjazzsEZ+w6GhsFe0gkoPh
   lyk5Fdjn7Vdc4Cz0+hAqJrqNSZ7Nd3m1nt+jbhop6/jsqqvo1RfYyadjH
   HV6urznYmgVxFxghVSYOdOj7LMz06ssm5c8TYfmGT59QpTNl68aC7yhMN
   Q==;
X-CSE-ConnectionGUID: Co7HQMoXRYGZc1z5pgyxnw==
X-CSE-MsgGUID: qBtGIY+xReSnIzm4SBPGIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109293671"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="109293671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:41:02 -0700
X-CSE-ConnectionGUID: wzosoJldQVSzkWsOxz6I0Q==
X-CSE-MsgGUID: 8VuOfVSbSQKWowPXIlo1nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257499770"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2026 05:40:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2A42E99; Wed, 05 Aug 2026 14:40:58 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:40:58 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH v2 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <anMvWrR5E54fPXVV@black.igk.intel.com>
References: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
 <20260727-tipd-ace3-v2-2-1345957bd635@chaosmail.tech>
 <anMi2q5FmsvE4z8W@black.igk.intel.com>
 <7D31226B-98F2-4DF2-BA47-31CF9B269A7F@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7D31226B-98F2-4DF2-BA47-31CF9B269A7F@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_054103_542545_E9CA0892 
X-CRM114-Status: GOOD (  13.52  )
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

On Wed, Aug 05, 2026 at 01:57:18PM +0200, Sasha Finkelstein wrote:
> On Aug 5, 2026, at 13:47, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> >> 
> >> -static const struct regmap_config tps6598x_regmap_config = {
> >> +const struct regmap_config tps6598x_regmap_config = {
> >> .reg_bits = 8,
> >> .val_bits = 8,
> >> .max_register = 0x7F,
> >> };
> >> +EXPORT_SYMBOL_GPL(tps6598x_regmap_config);
> > 
> > Don't export that. Just move it to i2c.c
> 
> I use this one in spmi.c too, the regmap configuration is the same,
> just the backend is different

Ah, sorry I missed that.

Thanks,

-- 
heikki

