Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C086CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDowC+J9NkAkNKGl2xFdM++bofz3BCUgA7OJQhuHtSY=; b=1bGXjcJPunp0EXwf74id7C0cEZ
	10w9+VpmNv6SukMOFXfnlpqKCBjCxIk99vzGfRIepIvQziatvaA0GcHnIHxM7cCaMFl9mYaRwlDeN
	92TBTI9VnsQvr3qzPsddMvreakqI4YAmdTPtNa5I9u4LPVWIpHGUTuzM4BGX99hJZfmWXdR0tNNAz
	NYhPGUk+xj7vZxjTWxq4XFtHnKQkVJMq/H3p/xM7GpMxJjoyVvoBQ6NqzjHarnIDa5LhwDMRSgS57
	dZ72Iqv1WHTkQD7hug+fkhvm+njsLdcznD9fyxFBk1fHDA03zbeHhxfZ+Ferf7+Og8lN6sGwGaW6u
	dkEhDbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSU4q-00000005Bb7-0BII;
	Thu, 28 May 2026 06:18:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSU4m-00000005Bak-2dgi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:18:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ebafde87cso3782987f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779949118; x=1780553918; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDowC+J9NkAkNKGl2xFdM++bofz3BCUgA7OJQhuHtSY=;
        b=Z+kTB5jQFaLIjDedRaCrhDLXnyjO/g8LUx2/npTFusGKnmp7dF5MyKo+wfUQrPitH6
         lcW9Ssm+xaS/R4gccPaUHQ/k9+IX7lOvVOFPUe4EBHES2lNdNS0vxeflJOB7gDR8nsN+
         HHzRoohd1WfB2Pk5FQCxwDjVfuT1y6DLtHjya1NDdn7JHhZn385Gsauh0G8u6hBMyPni
         9JucEPYRCG1U/+NMHzRzN7pPFQddBI8xMSYbKfKWgXe9EswXx31/IhmS/psFayVBE9Cs
         v7lhrnzHgEP6MCPLFcejWVvO1OwWs/PliwPIbCcCQFSekLUWHFJNbErb0f6FjYwISYkA
         2BVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779949118; x=1780553918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDowC+J9NkAkNKGl2xFdM++bofz3BCUgA7OJQhuHtSY=;
        b=gg+IAyY9iHRdaD9kAltnk5T/vwHmrD+0KcDi/9mlU7OZsEqRqZLxn8U3OHWvWEb/qV
         c15Evbr9Qd6Rljr30PcR9bJkIcr+emubSkR4B/Gd+tjlYS1EmchUt0iHS9CbGZpaVHxN
         usxkKwK4jBLQIqQFJH7LeQ+Z8azIWi1m2j4IOwhazzO7aOi6HVTjXGw/J9iNcwvh5tIp
         pRij4t8r9UKTuTKmqcrbHmyUjNno/UywqNVP5iXAr/Xt5742RrYNvZVza9ND6N7YmF65
         zwABR30fYUm4AFkGqs1Q3zJBP+tqTt4UjS17XGZTXn0r50iKQwJ+VunXxHfeyeqWXTay
         M8TA==
X-Forwarded-Encrypted: i=1; AFNElJ9U9LMLM+MI/sqqsM82ye9hD1lrxN0ukh14ZUVD5Wu+aWsNqpF+qVtG7FwDs49a+PlB88swW+XCjXLyxAlX1mYe@lists.infradead.org
X-Gm-Message-State: AOJu0YzXGQFUvBjs8kYduUdiVU89xopuw1ODkKIyeouPLD7g/SzKawee
	MghITggdwFsxpOY2E0HcEmu5jv1/AR1JUbJBfm+7nw+eEwgkJ4e2DKW8FMb1EQ==
X-Gm-Gg: Acq92OHVYF5bLQacluvOhlzOL1a45S3olYoEkKgK6SXbtnzczKsrIImYC7dekQPIQCU
	qeLbMZG/8f3P3p1qBD5oHHFgZQhMpP/d/Ie1PVo7JcPZi3onPH2VjoMn3zfVI1WgaL//cVrwQiw
	Xuhj1HVBuXKZanEDNtNaW1lTDf9qssi6JFhOIK19HElUOigklwNVPDBsqhmoQaqhe6rAG9Yl+bI
	fHGBjk59YK22zEDU+pdMGEzaV+CHqtccBsPOPvkzLBH3DNoYS39O1B01uzEsvNiCpSzEmg/De2W
	u0NhSH7WIB5/JRH9KS+YZa7QgDFlAzR5Bl8PgWDlaMV/DHbG/bifIsmWMuy+VlzPfOLtnrpTwJh
	0kTmMNwGV029jvlX91vexACq9C6dndTAQr2uPAA3YCyLHeb+dIrHeUJbg+CEBqbOFqo+tVlhNLs
	fFlGCAt09S3gtm9F6W/YTp8+2UbKmNKZZ4qQ==
X-Received: by 2002:a05:6000:480f:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-45eb3691f71mr43798818f8f.6.1779949118000;
        Wed, 27 May 2026 23:18:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5a281dsm10925489f8f.24.2026.05.27.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:18:37 -0700 (PDT)
Date: Thu, 28 May 2026 09:18:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: zynqmp_dp: Fix uninitialized variable in debugfs()
Message-ID: <ahfeOh091V3BuuaB@stanley.mountain>
References: <ahP3Xagt1LJrhmFl@stanley.mountain>
 <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935aaec5-5417-3cde-f944-3c04ffbd3458@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_231840_696125_BA7FCF8F 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed, May 27, 2026 at 08:31:59PM -0400, Sean Anderson wrote:
> On 5/25/26 03:16, Dan Carpenter wrote:
> > If the *ppos is non-zero then simple_write_to_buffer() will not
> > initialize the start of the buf[] buffer.  It doesn't really make sense
> > to allow non-zero values for *ppos, so check for that at the start and
> > return -EINVAL.
> 
> non-zero ppos seems to be handled properly by simple_write_to_buffer.
> 

It's not an overflow bug, it's an uninitialized variable bug.

The simple_write_to_buffer() is designed to handle partial writes so it
leaves the first "written" (scare quotes) part of the string as is.  But
in this case, we can't handle a partial write and the first part of
buf[] is left uninitialized.

https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffer-is-complicated/

Also this appears to be dead code since fops_zynqmp_dp_pattern is never
used.

regards,
dan carpenter


