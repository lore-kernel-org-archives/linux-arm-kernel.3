Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8098CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NU+WkG0JMZCGGSqCR8dN7ZBIBOJxhf8qjGX+ma2NsKg=; b=3Tn97hhkUmvJnLU7E+DQtrQoaQ
	PsWP3jWwXHkRnEQo9ys5R1Gl1epmfCzJLcI0hRp++C2Sj9qlDn3CGu39zyoHVNPF24TNBzQQpcGeM
	SS/3UNU1ddhlx+PUpnZY7dIoUdTHwB/fr4hsYR8S4FXAwkDDZskcPqSy4a/BMS5srBhZJgUNF43Nn
	6Wj73Ev57qcAPgXnGic/pG7NnN+f3bCkGbxMafz0FTAuPBB0hytZ6aBmcYn9Zv2Cs04CDUE/iJlLT
	WFVS0Ev32D+z+u5bG+AQLI/VprIwTpDBnO6dMbtm9nXLRiALw7wjPLVek2vdzm1pBkH7RN4SXOx56
	89N4a5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOfx-00000004rfV-23En;
	Thu, 28 May 2026 00:32:41 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSOfu-00000004rea-0gDM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 00:32:39 +0000
Message-ID: <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779928342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NU+WkG0JMZCGGSqCR8dN7ZBIBOJxhf8qjGX+ma2NsKg=;
	b=dyisPlEHNGROmDO3PIu1xSoLKqbJ5ya7lkt4PEAUuiOJahBM0lcV7KL1qiKyDISpRWGvHn
	PU9aaAfjRJt1t0zYYK+VV8AbVWnhtYyWhAho5LVkMGWMq37hd+4E6BJrMBblf7z4Ug1ArL
	mdEYdaIAxL+2EOtvyfHtndikc337ELA=
Date: Wed, 27 May 2026 20:31:59 -0400
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
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <ahP3Xagt1LJrhmFl@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_173238_360731_8B931891 
X-CRM114-Status: GOOD (  15.24  )
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

On 5/25/26 03:16, Dan Carpenter wrote:
> If the *ppos is non-zero then simple_write_to_buffer() will not
> initialize the start of the buf[] buffer.  It doesn't really make sense
> to allow non-zero values for *ppos, so check for that at the start and
> return -EINVAL.

non-zero ppos seems to be handled properly by simple_write_to_buffer.

--Sean

> Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 7fb11b0a44f0..847179476041 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1888,6 +1888,9 @@ static ssize_t zynqmp_dp_pattern_write(struct file *file,
>   	ssize_t ret;
>   	int pattern;
>   
> +	if (*ppos != 0)
> +		return -EINVAL;
> +
>   	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf,
>   				     count);
>   	if (ret < 0)
> @@ -2028,6 +2031,9 @@ static ssize_t zynqmp_dp_custom_write(struct file *file,
>   	ssize_t ret;
>   	char buf[sizeof(dp->test.custom)];
>   
> +	if (*ppos != 0)
> +		return -EINVAL;
> +
>   	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
>   	if (ret < 0)
>   		return ret;


