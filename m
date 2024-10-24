Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2099FD2E00F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPWavBPBtkbxSCcUdtFw4ouL78GHZ3w/+hpqcDQzX1s=; b=dS7freDXXSwjl7I1p4upmbNrGv
	jpdBDbqb9hiZ6my/PJaT5/00fWVF6z4j6r7ph5qrxAzn0XVBBrQIoWxcrzFdCubmDQZhExKZZ4fYv
	qdKu6nqi4ooBEZPkzVIoSUjDHEKABnQswub8+v8nlU0dSNBhA6KeaFYkSTZoRhDGSggE5gjosJbS9
	lm9O3gLB6lcBCwRPQLCDILXWmN1cUGxwA1SXsC0eTlLzQujxHjajAuv379TAy25jIucCT7U1E7J+a
	ysmn6WaH0qAhro+T/fviTnTwSAJTBfWEYBKhteOArJkueRN3a8HoPug/ED+vIHxxv3DhGC+wUnnGh
	O/Ck3RWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vge-00000000APZ-0nfD;
	Thu, 24 Oct 2024 11:07:28 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vYk-0000000091g-0L9c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729767558; x=1761303558;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=GPWavBPBtkbxSCcUdtFw4ouL78GHZ3w/+hpqcDQzX1s=;
  b=dmLJYopVElj9mfqlzgw0Fxhsy85jW3HMJUHaoPxmTS/7vpJgKfOYkmm5
   PQRHZsSDLeywiY2H4rBwVcHLNsVhQOPAeEknBg1ZKIyLaHI54UQCHzHGb
   qe61V6MykB6hx1kiVQid03YLO7wtd4opXMpKRMpvfLYTUbwVCO2DGd+TW
   kVKpSyDRbdeYu3tekME84MAcKOu+6+EbAkUA8bzELqiWlU58dg7DvaIWS
   13Q7xc5c+BCbw0XnAzkbCtLwwFeH8BpL2wg181JojQMvbRzjzVaYwoXjs
   6k5tmOtRUPpnvZrY+DmapVgmLWqi+4e2TCAD8cYoe6GwoULUNqvsKPsjw
   Q==;
X-CSE-ConnectionGUID: KgcSmlghTACUqhgGklwUHA==
X-CSE-MsgGUID: HwhoYfWDR5elbImVf2vamg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33296921"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="33296921"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 03:59:14 -0700
X-CSE-ConnectionGUID: HpBa6mkBQ/6ZbUkosee+oA==
X-CSE-MsgGUID: cIPq/R23SpeaTmSzk360wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85116587"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 03:59:11 -0700
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexander.shishkin@linux.intel.com
Subject: Re: [PATCH 15/51] stm class: Switch to __pm_runtime_put_autosuspend()
In-Reply-To: <20241004094122.113606-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094122.113606-1-sakari.ailus@linux.intel.com>
Date: Thu, 24 Oct 2024 13:59:11 +0300
Message-ID: <87ed45vkao.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_035918_156280_095618DD 
X-CRM114-Status: UNSURE (   5.81  )
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

Sakari Ailus <sakari.ailus@linux.intel.com> writes:

> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().

Hi Sakari,

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Or do you want me to pick it up into my queue instead?

Regards,
--
Alex

