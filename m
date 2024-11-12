Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3028ED42BB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rfw+wN9AUH3h9IWdAAjZRROFX4GdxCR15t9sueSJP5E=; b=sqLXd7psPByzZ3LKuLzc8wDm7J
	GFZ8XkUAQbZ20KkqBIWGZlL4GkPfXxqjrI+t//cNBVhlSGo/MribSbGPHlajfy0E5l94X+eUcVFw1
	cY0iYthH6DZigWs9U6oF0QUAYnI9zUC69ySN63fvVe4IK/Wh9nhpsoMQvIF3a9Ib1YWKUgtIDbDqX
	NiJeejXxewrZkrxkksX6Y8Fe14KcZaIxvpRdrLe5xYU4ANyvaF1i4T36b+TfvfB1enrYu/TnQFxyC
	kirgpq5Lgb3df8HPHwfmQA62/WHlJZOtJkpyoJnWv1j2kX0JIsQ9VpM4SMvoEvWhvU/cK/6fQOTxJ
	wZ8uOv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAv0t-00000004Qnx-2pmn;
	Tue, 12 Nov 2024 17:49:15 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAual-00000004LaV-039l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:22:16 +0000
Message-ID: <5c2c6883-d81a-4869-9f32-48d23c0728ea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731432130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rfw+wN9AUH3h9IWdAAjZRROFX4GdxCR15t9sueSJP5E=;
	b=QLDH6lZUK7ldFBFFY60D1IJpEJpv6E6CdX/D0wMreRUW5s13VDtpQ6iWetQwB2fRloelJT
	P3wvGndCwU3q+yyxxJhHZCgficVY9HnxmwVTsxE+/TdfnUFdIvMPCJ16mn43n+W3FxNnEw
	dh1Svbb5dK9UzKQS5LfKFQmN8wlWqLY=
Date: Tue, 12 Nov 2024 12:22:05 -0500
MIME-Version: 1.0
Subject: Re: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
 <20241112052754.GB21062@pendragon.ideasonboard.com>
 <37be000a-3ef8-4df4-aefa-b4d73487ad27@linux.dev>
 <20241112164305.GA24067@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20241112164305.GA24067@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_092215_234599_6D8D4653 
X-CRM114-Status: GOOD (  14.45  )
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

On 11/12/24 11:43, Laurent Pinchart wrote:
> On Tue, Nov 12, 2024 at 09:41:58AM -0500, Sean Anderson wrote:
>> On 11/12/24 00:27, Laurent Pinchart wrote:
>> > Hi Dan,
>> > 
>> > Thank you for the patch.
>> > 
>> > On Mon, Nov 11, 2024 at 12:06:10PM +0300, Dan Carpenter wrote:
>> >> We added some locking to this function, but accidentally forgot to unlock
>> >> if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.
>> >> 
>> >> Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
>> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > 
>> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > 
>> > Sean, how about replacing all the mutex_lock()/mutex_unlock() calls
>> > you've added in a7d5eeaa57d7 with guards ?
>> 
>> I have no objection to that.
> 
> Would you send a patch ? Otherwise I can do it.
> 

I can send a patch, but it will not be for a week or two.

--Sean

