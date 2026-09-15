Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5257C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=; b=jZdsogNZCeFDlScrW60JCE5lcy
	+QA8vF0O9TfTby9nPuSwFgDkoS3ZJf74BA47wzlTN+zL2r+1C5/ypSTNt9893dJ4R3eYOu42hVv8N
	XzMPhpM2qWP14o1nsn//V81tMKRALl3DvbkNCG2BbBeIiNk0zlfYXZir+X9gKTKRJYMa/uIKtohMG
	ImLxFWU9E8VjqUoW+d3M9n4vZsTOZlyHxIZ6zBHWoRRlezPDXG11kbqwHVZKhSJ8mXzt7mHHD7i7p
	InJsWKz7arkcWGaw9leG0shfm9df+K190OlrZQfyF6RjOWUns5Ejrf532AnKizHm9X7Psaj9BHa+U
	aZiNF8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ufm-000000073nb-0vwk;
	Tue, 15 Sep 2026 15:02:14 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ufh-000000073li-3UYJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:02:12 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-90cc64570deso12029386d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789484528; x=1790089328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=;
        b=ftUT6xgnNpad1MmzbtZNsym4iBXCjcO4VvpJpTWFlbr/Bm5vY2TKizD3xbHiMPc4sh
         oXCXQbz4IpHHRVvFDuplB4sRuMlsjejwxZYJzUVs0/PFjMrZQFTRhTJ+rRynTrD7UHhv
         pfwuIB9gcnZy16b1uBB4AKB2+lur31ucY18DUxZxJZG3PwhgrLTOS3Ke0YfpLbr9qb+k
         A6LS9mye2+/cBNnzfg94onGJxjOdl3SNbofvrdSaL7rtNtPYYrbwkhrUGsga6uOEB/jc
         TjawdEZ2y5SlrccyXkYxcxg2aslRVBJSUFpxP3jM6cGOc8OjGDrLSoWVcCQoqGztk24a
         sfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484528; x=1790089328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=;
        b=pfNJyq/1hhmM7K9j6scHX8nt8CxfZbGxvnV78LGcwBqbvuX26IBu6+6hoQOihzEbc9
         GPBgW60lUOKNXwNHAqWPFRCYC243RVEZLjQRFGgYE3+MhnQnqJTRio6JqTMDpxQA9SmD
         Qgqg7nh/1mRT9XvtmHJ7kcEXROmMoritIctVdSrr9RotMqP0hwbLNdPdDnggWAibroIE
         qLt+TBjCBQeEXuKxyQHG6XxGxu3DoUWGugZ8j3E/nYkVAmXprz+0soMT3MALVHNq3X7/
         iCniUtjMp/B259fQWIvdK8i1Bd6tGoliK4f9akcXOfTHKXdy7K4gb5HXy4yjlY684L2v
         ZlgA==
X-Forwarded-Encrypted: i=1; AKwUvBx+hNTWTbxUA1SA3P9VoDMLPJkHOsT1Qh1MTcLcpAt5/cg5j5NmLQR1gRzKy2iOgpueu49Sm2YAA4b2chF+MKwt@lists.infradead.org
X-Gm-Message-State: AFuF++k3p4/cH2LIjdhj38Rwl15y3nvnCb+73xlxAawY3f4y20nVSuLJ
	2eTByEDDiVDweWasrdMMO0yF9JO4zDfwa6AExRy8T+xTSIsJqCA58Rm9o8vIOG/aBw==
X-Gm-Gg: AYBFou2n1whlUAmVjNJ1YuxZ7AzfxLK4Tw1jKGvyRvYKH1ttZ+AGHDGgggLQQmYuBza
	qmgTrjUgNtWeE2U8c/AQuUSC0KJZwPm9TyqD8SrMMhyoLw/9mTulmO13nuKKnEXVidhQrOQ6mTU
	qV/Ghr+no4+pqZTVBTOu56+IHKbD0EW2l6r6cHhdAX6WtiJl3IHs+BCmOxsiX4mjwVZUQtlv0i2
	VesoMQy/1oBcRBUDszeTZx+/I0cwWLE7Dy3wsC2XWo3Upefjdb3NxtguYZaz7fU8amvReqvd0xv
	T/Ga4bdpCYDFHmHacHb9I0gNIMRWtiOyJaguxbrBMazcxGVTdQ1pxueqvH7zed8u+/0hToFysss
	BXkik3RysKb+Kk17EWTieAF0N0EaS6uFPAZBkjvGMXaNF4Xq/GcwRC+7XfS3r6bNrjbO3zmuF/p
	qi+z3ZxhqAsitFzhK9Hces/tObKUrgnER+pvUx37u85vunsLIfMPMxWo1LkQVho33tOzV28GN7e
	Wawu576ZlQ=
X-Received: by 2002:ad4:5e8b:0:b0:8e9:cd74:87bb with SMTP id 6a1803df08f44-912343f272emr52165806d6.18.1789484526773;
        Tue, 15 Sep 2026 08:02:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bec51c7sm381356d6.38.2026.09.15.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:02:06 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:02:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] usb: core: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <e2404a51-3480-4c93-8d31-6b796879ff6f@rowland.harvard.edu>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-2-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915090223.1346-2-joshua.crofts1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080211_788853_1A85EB44 
X-CRM114-Status: GOOD (  17.08  )
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

On Tue, Sep 15, 2026 at 09:02:18AM +0000, Joshua Crofts wrote:
> The fail label in usb_new_device() disables pm_runtime on failure, but
> doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call.
> 
> Found using Coccinelle.
> 
> Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/usb/core/hub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3345b3298daf..dec6d5c49759 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
>  fail:
>  	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
>  	pm_runtime_disable(&udev->dev);
> +	pm_runtime_dont_use_autosuspend(&udev->dev);
>  	pm_runtime_set_suspended(&udev->dev);
>  	return err;
>  }
> -- 
> 2.47.3

Acked-by: Alan Stern <stern@rowland.harvard.edu>

