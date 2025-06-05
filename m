Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462E4C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsdpVjOzsdncm9Vwh4He55oywy7PVIGsyLwD/YGXRxc=; b=F+OhDzRQAfEgGacJ8mgKiIqfuK
	UVFOQJ0r2viFyb1yb+ZcH0kmYCjtidaZMZgZ53bvIzooFjxNbeW0fUvjkSm6k7y0ysf8bBu0/sssK
	k1wti4G3EjZtN6yhFweOoexXoFphs6bf+p2H6zCD8qPl7F+pOcSeGgLTsRLxEckTqr4t+YlzoNta+
	eabPDG7iMJHlFCFbvty5yfCoMZPiymZBGRosggZ447y5aRDd8EtPs7DXG0ZlF1fgEP1L60YCp8SzZ
	SoRVJdvOFip0IH8HjnN6Uv92awyxqhcXklOMwWY3Y5yvaWWfp5plYDccxa0i4VV49izoPKDpjPPlg
	2fPMEK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7Fz-0000000FCER-0BKJ;
	Thu, 05 Jun 2025 09:51:31 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7Di-0000000FC7c-0Es5;
	Thu, 05 Jun 2025 09:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749116950; x=1780652950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/LdIHrVh1JcLDKPaWvUKmpJEvq93neirKTxXZQVgqLY=;
  b=kdJ8QfhiYeDVkBX5j2NCcU6DRZ/vqFJqg5gEfWL4KfQ2z8hxww9TFDVs
   Ck/CFWNyn/NtwhMJis5zGG3lvFLbDjcLjNQgc7y83ffYxIUvKFqa5RqJj
   OJMhrjF3zo863WdMB0jYVcmN4TKmqqxIOzAB7FUVCYmFTKkUfH57gao74
   AeAJKA91pJFnGpXGtUkCZnrbseLQbh9wlRUgiYLWRHcF+LjgVqznBIAL9
   yvOT/9VYcEEzCwSpHAiHYJnjNERHrDDrOPNLdtkKG5gxp07D7Mz1Zk6zK
   xji2c4P2FiJfAq03k/6EIbaCZ92EJHCfZz7SJ/Gtk7ZEbdarFHm0Yvb7P
   g==;
X-CSE-ConnectionGUID: nei0ZO5DSAC7FfMLcnAgAQ==
X-CSE-MsgGUID: lsZsBPkIQ5yJ8A6MgAg4ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51297128"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51297128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:49:06 -0700
X-CSE-ConnectionGUID: 24mk+NbNQ+WtuLzTJaUflw==
X-CSE-MsgGUID: riKN5MFCSoq+pZ4xIw2+IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="146049871"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:49:02 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CEFD011FBEC;
	Thu,  5 Jun 2025 12:48:58 +0300 (EEST)
Date: Thu, 5 Jun 2025 09:48:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: Re: [PATCH v3 1/5] media: mc: add manual request completion
Message-ID: <aEFoCvPe4zE48UG7@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
 <aEC05991kEIIifDB@kekkonen.localdomain>
 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
 <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_024910_143672_79D5F243 
X-CRM114-Status: GOOD (  17.03  )
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

Hi Hans,

On Thu, Jun 05, 2025 at 11:37:54AM +0200, Hans Verkuil wrote:
> >>>> @@ -499,3 +501,35 @@ void media_request_object_complete(struct media_request_object *obj)
> >>>>  		media_request_put(req);
> >>>>  }
> >>>>  EXPORT_SYMBOL_GPL(media_request_object_complete);
> >>>> +
> >>>> +void media_request_manual_complete(struct media_request *req)
> >>>> +{
> >>>> +	unsigned long flags;
> >>>
> >>> I'd declare flags as last.
> >>>
> >>>> +	bool completed = false;
> >>>> +
> >>>> +	if (WARN_ON(!req))
> >>>> +		return;
> >>>> +	if (WARN_ON(!req->manual_completion))
> >>>> +		return;
> >>>
> >>> I think I'd use WARN_ON_ONCE() consistently: this is a driver (or
> >>> framework) bug and telling once about it is very probably enough.
> >>
> >> Just to be sure, you only mean for the two checks above ? Or did
> >> you mean for the entire function ?
> > 
> > For the entire function. I thought that if this is user-triggerable, the
> > amount of data ending up in logs could be very large.
> 
> It's not user-triggerable, if this happens, then it is a driver bug.

If there is a driver bug, it could well be user-triggerable, wouldn't it?
Testing may not uncover all such cases.

-- 
Regards,

Sakari Ailus

