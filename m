Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B0CD42B8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjtCuBHtQgDpU3KQOdG6+r1FPPieI5NsRRxpX2bOTVg=; b=gHcxCgOcvpCRqLU1A6xyGXCGK+
	/zVuDKNUuSaL6acEu1aA+Ub2Ub0cX2sN4R7Cs6oWSpJIkEMm7ngtJKPWV6ML+PeA48LSQKKRveeUT
	GpYmbVF0/f5c9bFpbaQvG80CHe81hm99LS7BYkHo6Fxakp7efWVu3oXR+y3ELlNrLaRFCW0D9Tial
	YCkMlaawU2DZlgx1xB30kPSXRCWWhmKFOGPmpj56dI54R9mzHmFU4rWVf6qnW/Ogyg7Bc1mEiN+fR
	ljqukTh9vp8jz7TpX3PSJhUHSKXgtJrCsVsVKWQEB9L9eRbUPiiW/AZa3VP8+LiMHt+ZnMSRKhI+i
	xRUKoPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsHv-00000003q6w-3Hqx;
	Tue, 12 Nov 2024 14:54:39 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs5p-00000003nQ3-0vLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 14:42:11 +0000
Message-ID: <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731422522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TjtCuBHtQgDpU3KQOdG6+r1FPPieI5NsRRxpX2bOTVg=;
	b=nCt+95HRT/HZ9j+8Iud0gJu10W5OMu+C9+GoNpLHisBXJCDIyhTT6aebp5aN5fV/EiM+1R
	n7hYjSLiCSfA3qiuOxDHyPUgLsVe4H+CKrNEH3UuzayqLotGsBxOgsHLaPb6hkJoWaUBmc
	CnfZaHKi7D6ckeK8Dc5H4SR/IGcev4g=
Date: Tue, 12 Nov 2024 09:41:58 -0500
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20241112052754.GB21062@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_064209_732688_6A94604A 
X-CRM114-Status: UNSURE (   9.85  )
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

On 11/12/24 00:27, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
>> We added some locking to this function, but accidentally forgot to unlock
>> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
>> 
>> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
> you've added in a7d5eeaa57d7 with guards ?

I have no objection to that.

--Sean


