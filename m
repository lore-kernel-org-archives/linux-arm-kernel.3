Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A051C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 20:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WyK6vRoG5SvaOVIStlOKOP4rX2lqtxKCb+Y8Y6C15k=; b=4jukSd393oQ5cS1fGwxyRM5Kak
	FOU0HxqOAERy/h0lZeD7rwAll+pC+mGuI+vQF2oK6pNovPi8Zl6C0YMiOB0r+nRaFfzosgIfAO1kj
	Ei6Lta6OnlkN3UnQR0/05jSvpsFrc4WvufEbjqih0l8C8d7FGaAi3HJuFBZls34tiMMp1gQKcW5/Y
	S2cgfx1fUl1o5VnctvhLH4B5T70s8Bn8l/JMsa0LEyFs8xgECIVS8rPAyPTeyokBx7+cEjJkBuOir
	8U3d53iSK4IaRsR/JTOssIYC7ATpbSyXZKxj29liADw+YYZdAZnrhdvpn5/dRcTaNIEH3tmsuTQEd
	8xikXElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8ee-00000007VLF-38Yv;
	Thu, 06 Feb 2025 20:39:20 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg8dH-00000007VCk-0rjF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 20:37:56 +0000
Message-ID: <c10a8643-6f6f-4428-91a7-e7f5c92a3f58@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738874272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WyK6vRoG5SvaOVIStlOKOP4rX2lqtxKCb+Y8Y6C15k=;
	b=pBG5+4mVjB1wCwVfamE6jbu2Sp4OgvrtK4kKPXsOUOYbYZ47J0onJi1xzn5vqNhXDlyRAY
	rqs93SbLUS5C4BHgrpb7jrGORPH9aeagOaEDLkJ78/XP+gcJHXMaqfjexUnQQd6QPBd0gy
	39hovJ3GT+kdg0GIvNOQlePzERbQnXU=
Date: Thu, 6 Feb 2025 15:37:48 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Bart Van Assche <bvanassche@acm.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
 <20250206194117.1496245-3-sean.anderson@linux.dev>
 <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_123755_607474_0DFBDED0 
X-CRM114-Status: GOOD (  13.05  )
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

On 2/6/25 15:31, Bart Van Assche wrote:
> On 2/6/25 11:41 AM, Sean Anderson wrote:
>>   static int zynqmp_dp_enhanced_set(void *data, u64 val)
>>   {
>>       struct zynqmp_dp *dp = data;
>> -    int ret = 0;
>>   -    mutex_lock(&dp->lock);
>> +    guard(mutex)(&dp->lock);
>>       dp->test.enhanced = val;
>>       if (dp->test.active)
>> -        ret = zynqmp_dp_test_setup(dp);
>> -    mutex_unlock(&dp->lock);
>> +        return zynqmp_dp_test_setup(dp);
>>   -    return ret;
>> +    return 0;
>>   }
> 
> Has it been considered to combine the two return statements into one
> with the ternary operator (?:)?

I didn't consider it, but the line is short enough that I can add it.

>> @@ -2053,7 +2039,8 @@ static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
>>           return ret;
>>         mutex_lock(&dp->lock);
>> -    ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
>> +    ret = simple_read_from_buffer(user_buf, count, ppos,
>> +                      &dp->test.custom,
>>                         sizeof(dp->test.custom));
> 
> This change has not been mentioned in the patch description and is not
> related to the other changes in this patch?

I think I made this change while refactoring, but it turned out not to
be necessary. I will remove it for the next revision.

--Sean

