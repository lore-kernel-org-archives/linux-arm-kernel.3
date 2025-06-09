Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8390C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 09:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9h1BhqUVFkMCcjUoQ2Nd5X7sSs3oYw6IAFnYamJD8s=; b=dvdfTnc9aRl8rPJeoWlIRCxO6N
	nko0QFpjU/GdBX1iDbtKZUfgg6/lfZGXBUcpNuVpmi4lN2pXsK2mcsil7CtmyNzTyFQtQ1vFX9rUW
	AXAhvtRvujm01Egnx2/4ppEPHmwYLWtWw8L8/WxdxT09Mbn18Dex7+DmpVepI0dg9xJS6ghNkYBs4
	i0dexW6E7t61pFvOqUoc8hR88towfL3BMb9zjdWa6yFU6mJqE1rae/dINhPAAx5+x2JoqLkdodh5I
	eDeu6C0cuzutHOTdwSei/+Wy77ab4+DsSODxSRYNE//w/so/AGuW4OYdA8814YQtH4aBOVpp75e+z
	cqbXl3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZEG-00000003qQW-2pqu;
	Mon, 09 Jun 2025 09:55:44 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZ1u-00000003oOg-2prL;
	Mon, 09 Jun 2025 09:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749462178; x=1780998178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ySRPtb8R9TF5f8eJsbPNdOwas6ksBf1A56TkU/8cVVw=;
  b=h98rv3ytRMWYtdRcrHq/T2wY/pMz5OsEFJSDyOrfTbTtE/XNRfVkoP6J
   cux3R7X6Zlhbryx37FPlAfQ6tTQgUyCdDViF4BrueMTYgT4KovOMr6fKF
   1CX/4mK7lgJWLctK/x4DYI9ayZT87TPuA+CiCdMvF6oZYCezYUWdyZuzt
   MAs1C9u3NPKiInWE+2yUfdVppah9loaM2SfZBlEHd704ONfh2G6Q2+U1I
   pP9U+ucudP2VAOplRcJg/D803ZjZOJlpaIuZRoqTz3ngbnPlaRzwFC2Ln
   3kw9nlvD2CUb7258gyDWjWf+cU95u47LDW57qCfQ6sMb/Ka5hJEwaYrXh
   Q==;
X-CSE-ConnectionGUID: 7LsBqFjSS7Sx1aJEdvjStw==
X-CSE-MsgGUID: ayaDYwGkRRCYq9fYsnRjIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="76928216"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="76928216"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:42:56 -0700
X-CSE-ConnectionGUID: QnzO4A5ISYmRZ0zlw6R7RQ==
X-CSE-MsgGUID: 6nY5V3ToRDm+64bSkkZUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146457300"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.36])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:42:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3A31B11FC22;
	Mon,  9 Jun 2025 12:42:49 +0300 (EEST)
Date: Mon, 9 Jun 2025 09:42:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
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
Message-ID: <aEasmfi3VBkuFU3g@kekkonen.localdomain>
References: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-1-603db4749d90@collabora.com>
 <aEC05991kEIIifDB@kekkonen.localdomain>
 <1ccaaec7f782afc71bae5c3b0f60a786a907555c.camel@collabora.com>
 <aEE-VFfJDhUbM2nA@kekkonen.localdomain>
 <8b1ed01a-b6e3-4670-a4e0-d8eee7ddc524@jjverkuil.nl>
 <aEFoCvPe4zE48UG7@kekkonen.localdomain>
 <608f95249ff3a39efb063ab9c6a543259a7b0ac9.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <608f95249ff3a39efb063ab9c6a543259a7b0ac9.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_024258_733097_0B5B183F 
X-CRM114-Status: GOOD (  16.69  )
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

Hi,

On Thu, Jun 05, 2025 at 08:41:45AM -0400, Nicolas Dufresne wrote:
> Hi Hans, Sakari,
> 
> Le jeudi 05 juin 2025 à 09:48 +0000, Sakari Ailus a écrit :
> > > It's not user-triggerable, if this happens, then it is a driver bug.
> > 
> > If there is a driver bug, it could well be user-triggerable, wouldn't it?
> > Testing may not uncover all such cases.
> 
> You are both right, if the driver is not used, the warning will never
> trigger. I was worried of the hit of a thread safe ONCE implementation,
> but WARN_ONCE is simply not, it can warn few time before it stops if
> called from multiple CPUs at the same time. In that specific function,
> I can move all the checks inside the lock to make it truly once.
> 
> Now its up to you, I don't have strong preference. These are driver errors,
> and usually quite critical. They are not bug_on simply because we have a
> crash free resolution, but its probably not functional anymore.

I'd prefer _ONCE variants, I wonder what Hans thinks.

-- 
Regards,

Sakari Ailus

