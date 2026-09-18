Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374B8C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vf+VMKVEe34XIFcoM0F3NyOnHOuNbUrZlrEVL6D0Cdw=; b=lYC3eQiWXinSWjNqXj1NTJ7BeR
	EfHbIyj7T4caKz/wRFAQDL+cfZWTziLZJTEACfAp2k0g2EIVCF/Fl9wAoY8gEZP0M9osy3VzCoIoB
	xbCq3kzJ/b84vm/LWe9bXz/O0pvivD2BQlaz5U6+pjS4dGeFRRFrCq8kRHYrb8lc3tfZjtvEEa4S9
	Oai6ZSADIeM61oOShXPH/mLV14gn9MNtlUJMhnADmOkUw9LxSoWC9afmtdlFB4gXxxfK8no2q32jk
	hAYvk3TFVujiOCGFd/Ns6aO6NQh4owel8fHnl4XhHXDV02dvMquu4MtqENpRpdfAnlGWIjykRxQi6
	BvB1xOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VQz-0000000E2AO-0le9;
	Fri, 18 Sep 2026 10:03:09 +0000
Received: from mgamail.intel.com ([192.198.163.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VQx-0000000E29j-0vYc;
	Fri, 18 Sep 2026 10:03:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789725788; x=1821261788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uElSAhyH1PpeEPWtCcp7Howb3i9y6eQxOdUHga4bW1E=;
  b=GR14b0haBjIpr/0DhwIvkhYI9Xn76vRme6b0RAZGOxziKklvYSHtL+/E
   I/IfWr3MBEek9YuXfc982aukkD1MAZgjBFfsG9S7NQn24CbEtGH1UhJ+J
   BuPMAcRBsshrxSTkazqO4qbRp57l4lsZjacCEyn+sDyPB1pNJJNfm0674
   BeHu+Ya/pGGxvZ+SVc561QG1sHbape1MtTOXo4Ur59g6/lE5+DO3LMqMq
   iujsdp9/udHx9teUs85XdaC+txnr3Y8Zm4/lAMLblqs2wbIZfcljg/I3g
   bvV/WzKBMQNWYYB4F4Fb8gujaSfj2ZKvqKWrK6Ssw20LXcgO3LHbJQgRB
   g==;
X-CSE-ConnectionGUID: 7JJ5xXsyRvCaA1gdTalJiA==
X-CSE-MsgGUID: 9YpDHz9rS+237zQauBOLJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="728803"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="728803"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:03:06 -0700
X-CSE-ConnectionGUID: Fzk0+0vuSaGiYihkFXoX7g==
X-CSE-MsgGUID: JJFCgwzZRAm1B0qK2MGLwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270024013"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2026 03:03:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0041099; Fri, 18 Sep 2026 12:03:01 +0200 (CEST)
Date: Fri, 18 Sep 2026 12:03:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/6] usb: typec: ucsi: ccg: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <aq0MVewexVIdq_qs@black.igk.intel.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-5-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915090223.1346-5-joshua.crofts1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_030307_267544_ACA2952E 
X-CRM114-Status: GOOD (  14.85  )
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

On Tue, Sep 15, 2026 at 09:02:21AM +0000, Joshua Crofts wrote:
> ucsi_ccg_remove() disables PM runtime on teardown, but doesn't call
> pm_runtime_dont_use_autosuspend(), causing resource leaks.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call.
> 
> Found using Coccinelle.
> 
> Fixes: a94ecde41f7e ("usb: typec: ucsi: ccg: enable runtime pm support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 91c2958a708c..9d3ebb255de7 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1519,6 +1519,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>  
>  	cancel_work_sync(&uc->pm_work);
>  	cancel_work_sync(&uc->work);
> +	pm_runtime_dont_use_autosuspend(uc->dev);
>  	pm_runtime_disable(uc->dev);
>  	ucsi_unregister(uc->ucsi);
>  	free_irq(uc->irq, uc);
> -- 
> 2.47.3

-- 
heikki

