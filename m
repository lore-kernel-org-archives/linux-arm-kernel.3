Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD25FD4F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 21:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rgSHk9mt4aX5G8sCDclSDSiSH/P9YjdRhYPNztsSTY=; b=Kwd6araTIG56FBSrTVvBGd/FNQ
	82OZXONpA1RFgakwzEy+E5K8eNt1+ilrMUIIR79pRWwWWCJL0nlB5HSEdxuwNrhFevUTw2ORRznDa
	39PG4pZmcjGOv2cWIzJKu055d+VYeDIDMCxLVb1xgtJRKEc/dvObAKR/a5Pwyigfwl1VXla64i4Jk
	HSMnS4yOv8kgThY5JlZrL3MD/p34IM7HxMt2YK5xR0EJ83/tW/yGAYr8oRe+9rvCGxIr0s9I8O9TV
	UqrGap6pmqXyOuG5dUFBoQ3trscojm/kgh0O7MbOloN1oZlkc+aeJASrzowP8+URbeRah874b/bNI
	dXOFQtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04Ig-0000000AHXQ-2V0y;
	Tue, 10 Mar 2026 21:07:34 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w04Ie-0000000AHWy-2zXD;
	Tue, 10 Mar 2026 21:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773176852; x=1804712852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QD0ocCLo29LGXqoE2UpeJgKKNEmmXUqDI3RgU/UG4UM=;
  b=e8CayDXU63BGQGKu/CyvFVFWeag6z9HIFZgmL3VykdnHZCoAD6aW2Qad
   gI4LDNOnP8f4RYV5fqJFyTzbA4CGmsTN/qyqdyqDlel/RVcx5TYGbbHqS
   ndjjXwUpYci50CjOTjcBPMufZKMXcMB7CT87HbjS8mR2soda7y54BSh44
   Xm7bkLDEl/TuyMwb6WGzhrXn//2kPIPU/+3B9EJlYN7fCxIoUvXU/7bGh
   qEB0rh+vJSyNrQNyAA22m00d7SqwWSiIf3GekcTcRMzfkNp+7/gqHjtEn
   JVsFpTrPheW1vVcLAlQfdxCWAWWpRI1HKdPLD2sZ2F3ODc4zvpN4PQYXk
   w==;
X-CSE-ConnectionGUID: 75XrrOYtTvqGQCJLnqRlLQ==
X-CSE-MsgGUID: 2UM5VsdFTiWIRl/MYjyrYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84867496"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84867496"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:07:28 -0700
X-CSE-ConnectionGUID: uZWVu9RWRJeylP2ReXAurA==
X-CSE-MsgGUID: MPB2+mqHR0uif6GIR6yszg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216978035"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 14:07:19 -0700
Date: Tue, 10 Mar 2026 23:07:16 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	lukagejak5@gmail.com, ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
	sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Message-ID: <abCIBPZzZBfMoOtm@ashevche-desk.local>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-2-sanjayembedded@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_140732_785121_72BD13FB 
X-CRM114-Status: UNSURE (   8.84  )
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

On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:

> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().

...

> +	struct gb_camera_configure_streams_request *req __free(kfree) =
> +	    kmalloc(req_size, GFP_KERNEL);
> +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> +	    kmalloc(resp_size, GFP_KERNEL);
>  	if (!req || !resp) {

Now this check should be done in a better way.

> -		kfree(req);
> -		kfree(resp);
>  		return -ENOMEM;
>  	}
>  

>  done_skip_pm_put:
>  	mutex_unlock(&gcam->mutex);

To complete this, one may add a prerequisite to use guard()() first.

> -	kfree(req);
> -	kfree(resp);
>  	return ret;
>  }


-- 
With Best Regards,
Andy Shevchenko



