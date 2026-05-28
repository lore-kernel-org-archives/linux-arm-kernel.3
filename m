Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FB5CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BqU1KULHNpKd+dvxOvwz5A4nP7Cq63wMOTMOE8f41c=; b=aCBPe4HK0LtXO+V/u8/0VvaB0C
	s8APZ+W4ya9npZXdE5WUNcut0uDrm08YNHNtW8NcY8xIb/zUtpFjggwDCZKmiy123DpbVcRK9k64Q
	Cs2wUSzHHA22jt8SiYYsS5n3eG7GiPDK03ReaAT8De7vH3MUSVgIBmN72685D6I8pt2yGzyA7N3qg
	Uu9pXGh/L9QN+UpUV8z+6zkvjks2VBunDQX+sftpCh/A1I/0RepccVtZEX6SZkScrMc7UBO0eNfq5
	THmAQVK6QQD2vfdRAOL+8yfcz/VIt9JeDCm4CZ2lJIZaIkCQYbCK2ShT6RO3ODGamqc0pdzTBGAgT
	nYuSip2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVgF-00000005KTN-3dKI;
	Thu, 28 May 2026 08:01:27 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVg7-00000005KMw-1gZ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:01:21 +0000
Message-ID: <9189701d-168e-1e63-8a6c-f6926029c336@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779955275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4BqU1KULHNpKd+dvxOvwz5A4nP7Cq63wMOTMOE8f41c=;
	b=sigEYBE9VG+Z7WKjCq6mMqJ6An2dyD6r9Lrla0s3BB0zMiKJHdpR3N+nLodLHJ+C5XkfeO
	Di2f0oyz2YX9JdWcKHiX+SyjMdr12qfPYBbptiY4A19UMS9A86esUUFaKuFuL/C+oO0Tdc
	Sbn3/wI0m2vOEP9/ScSKCwsqmq4+IO8=
Date: Thu, 28 May 2026 04:00:53 -0400
MIME-Version: 1.0
Subject: Re: [PATCH] drm: zynqmp_dp: Fix uninitialized variable in debugfs()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <ahP3Xagt1LJrhmFl@stanley.mountain>
 <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
 <ahfeOh091V3BuuaB@stanley.mountain>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ahfeOh091V3BuuaB@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010120_186125_DBC117EE 
X-CRM114-Status: GOOD (  14.79  )
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

On 5/28/26 02:18, Dan Carpenter wrote:
> On Wed, May 27, 2026 at 08:31:59PM -0400, Sean Anderson wrote:
>> On 5/25/26 03:16, Dan Carpenter wrote:
>>> If the *ppos is non-zero then simple_write_to_buffer() will not
>>> initialize the start of the buf[] buffer.  It doesn't really make sense
>>> to allow non-zero values for *ppos, so check for that at the start and
>>> return -EINVAL.
>>
>> non-zero ppos seems to be handled properly by simple_write_to_buffer.
>>
> 
> It's not an overflow bug, it's an uninitialized variable bug.
> 
> The simple_write_to_buffer() is designed to handle partial writes so it
> leaves the first "written" (scare quotes) part of the string as is.  But
> in this case, we can't handle a partial write and the first part of
> buf[] is left uninitialized.
> 
> https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is-complicated/

OK, that's a bit strange. Can you add this to the doc comment? I certainly
missed it when looking around for appropriate functions.

And I like the explicit copy_from_user variant better, especially since
we are setting the nul-terminator anyway.

> Also this appears to be dead code since fops_zynqmp_dp_pattern is never
> used.

It's of course used in zynqmp_dp_bridge_debugfs_init.

--Sean

