Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C77EC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLksYmtV/LGt/QTVyUj/Eiqdx1WVJtDb2zhhPRveb5w=; b=MqdA/Ls66+Hkc+KdLLgzx3Njss
	g0qn7q22uK2Uqze0QjOaWUPJujFn9gNRrGWbT3dcQl7Y3jO90taenqagWsc/bKkLglD1b4Iy3z0fO
	kcu6lDEThir7PReUII+rkXK4ZFbPKeL3ebjlCEUHJwgUK7lbcHqwvslM+p1phW/+/UxmbDOyoKo8E
	Dy/41K55iCJbVUZKo5v2ZmpnrGjrBbuHbHWHofw0o+dJ7h7a8HhnJmmMt3j9l2fqUQ6kTVnvf6T0T
	qPVGx5CzkZk04ajtawRc5otuI5PXr3EHGNwgQXgqKLT/WtZ2ROYujIeC/43y7qr98QkIAmA5ttJwZ
	ADWE9ZNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSJU-0000000AWVc-3Un0;
	Fri, 07 Feb 2025 17:38:48 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRoK-0000000AQ0P-38K8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:06:38 +0000
Message-ID: <5f05d772-5d25-4b94-8759-95db3e283a6f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738947989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLksYmtV/LGt/QTVyUj/Eiqdx1WVJtDb2zhhPRveb5w=;
	b=sVzyMsw+PCLFyI241R6uxQ3C1W6cBpXLiQUfQFbDCzlMAi4VjyoHKX/YOL5/cMk4dM9GA5
	8a4QS7E4snoI1vvGguhgu14FD7fjN9KNLFEAvL1Cds7x+k2hj2FKrcDt6BhCqOARffRXQZ
	JtmxmwZ4DbHEGjiPY8B7/plBkC4rUIE=
Date: Fri, 7 Feb 2025 12:06:25 -0500
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bart Van Assche
 <bvanassche@acm.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
 <20250207162528.1651426-3-sean.anderson@linux.dev>
 <20250207164446.GB24886@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250207164446.GB24886@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_090637_136936_F2673CB4 
X-CRM114-Status: GOOD (  19.26  )
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

On 2/7/25 11:44, Laurent Pinchart wrote:
> Hi Sean,
> 
> Thank you for the patch.
> 
> On Fri, Feb 07, 2025 at 11:25:28AM -0500, Sean Anderson wrote:
>> Convert most mutex_(un)lock calls to use (scoped_)guard instead. This
>> generally reduces line count and prevents bugs like forgetting to unlock
>> the mutex. I've left traditional calls in a few places where scoped
>> helpers would be more verbose. This mostly happens where
>> debugfs_file_put needs to be called regardless. I looked into defining a
>> CLASS for debugfs_file, but it seems like more effort than it's worth
>> since debugfs_file_get can fail.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v2:
>> - Convert some conditional return statements to returns of ternary
>>   expressions.
>> - Remove unnecessary whitespace change
>> 
>>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 147 +++++++++++--------------------
>>  1 file changed, 50 insertions(+), 97 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> index 189a08cdc73c..63842f657836 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> @@ -1534,10 +1534,10 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
>>  	}
>>  
>>  	/* Check with link rate and lane count */
>> -	mutex_lock(&dp->lock);
>> -	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
>> -				  dp->link_config.max_lanes, dp->config.bpp);
>> -	mutex_unlock(&dp->lock);
>> +	scoped_guard(mutex, &dp->lock)
>> +		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
>> +					  dp->link_config.max_lanes,
>> +					  dp->config.bpp);
> 
> Could we use curly braces even for single-statement scopes ?
> 
> 	scoped_guard(mutex, &dp->lock) {
> 		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
> 					  dp->link_config.max_lanes,
> 					  dp->config.bpp);
> 	}
> 
> I think this would make the scope clearer.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

FWIW around 25% of existing scoped_guards use this style, and it seems
to be idiomatic for short scopes:

$ git grep scoped_guard | wc -l
523
$ git grep 'scoped_guard[^{]*$' | wc -l
156
$ git grep -A2 'scoped_guard.*{' | grep } | wc -l
25

--Sean

