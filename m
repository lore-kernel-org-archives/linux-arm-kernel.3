Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3337FB5180
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj0K5FyMi7XSuPG2uq1mtZavJKlMVDQzSk2zMk1W2/0=; b=THbQ6T/1pGj8Vs0Xdq17lPX33f
	qjEMy+YqiHyURbyMe3mAUP7h0RVz7CgQLjf0v6RZFfum6F++fYRZuSq0eqDK7qaBQkdzM4pU9nDXb
	GrIED/fSLIKCYbVVjHyfQYG8/Q3IovKgGixlObkKAqHKOtgF211rnDTrb9Wj4Q/TAAJXI9JldgwC6
	2HzbbNx4kQ8F4XupkRsMFfBCNhBrz00xQu1MwB67pyKg59N+8fKsybppAxrPTG6pc7lKCz44bxGeC
	7WOOG3k/sQd1A8IkenD91+H/sFXShheWBygJGTV+Dk+LyYJ6zRM8TJwr6lIZ5U7qrdtKj9IF6n6h7
	3fj9Z4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9w3W-00000005kw4-27Bs;
	Tue, 07 Apr 2026 02:20:42 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9w3T-00000005kvI-0OAk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 02:20:41 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7dbcf927395so1285733a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 19:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775528437; x=1776133237; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uj0K5FyMi7XSuPG2uq1mtZavJKlMVDQzSk2zMk1W2/0=;
        b=yZjZCR0iXSpvNn/DDhpKqsQdcyrOY5VHr90rFjF5MPsHSjbR6XGYl8wme3QI7sZ1/U
         Y7wEqfohZBzC/7k5DEz1tb8S1vkqDMfAVrhwkxT9JtN0tGribUjV+rWZIYQIMiDt/Sf7
         dVW5L6pFayj6731z5J7EvR4NcPaQO5BD6tqIbwFVAdANAKO7bDJGvGlXjQ/oKcR2q9dc
         jug6VvmpQZnVFMFRqAhW9OJDYif5fHTXLMpFVvtL05iss3VPxgH/9AOM1n/hTxtBNA+1
         hkMCEfKFhGSsG3fhcXvd3F7y8yWE7WYbpEdRYl35gEfupcxv/PNjtKOlvUfo9td+3c/Z
         8RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775528437; x=1776133237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uj0K5FyMi7XSuPG2uq1mtZavJKlMVDQzSk2zMk1W2/0=;
        b=EGrl44sgxVmjpNoN/OyM5SDIJjv/e0w12NMcbI5X7uZy9OfqzUWyakw4NCoSsS2Dbc
         cD4zjN1H6bnuWRyMG9W0O6G2K5I9IYmVFoy6kE6xoNlmvnwO3exxf/VROh/0JqtFY/Qv
         gxgV5zRn/rxduWY+F0gR4NGKhjJsRzRewygj+L34IICSOGeNl/UTyFbB8+SSUqHDUr0X
         T+dVvASlpPpEMvhN7c7U5mbzh5uFH9Aj2g5CvjMzd10h4hMI8OJnJUh2UJlAsDlG8FGT
         loNz3fRwPZBzFNgj9n4sHU1XwEqhyyvYvgu1Sl6KY6bIMrkR9eagW1WbXp79jnkM65oA
         4O4w==
X-Forwarded-Encrypted: i=1; AJvYcCWjJhWLeHcanSfH/7gAI7SVRqRlnyxOmhQQv1vuGuXVzlM8Ls5s14BeFyRx3oznup5CvZF+Z4BUAGU35gEpAw+q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ZeoBSGtAAR5RaVdpFDUV5D/j8wVq+hZYlR1hlCRvBIQUJVsE
	mOf1osXHs+deSSj2DkrO9dxl63DIsGa/4M4QVvMVzR3nm5Tww40FeH1HSaqvB+OyxOo=
X-Gm-Gg: AeBDiet3Nx9m4usa7O35FhPyQQDBUAsfV6FGrcnshILCBtf9Pgk6UT2Gv9WimPxlhWC
	Icvuv4e/jqri7SUaAVlPUwkN1Cy8w0Y4auolcwCMG09q2ugy8y5EWWN/euvE9Sk9KUkeSvlBiM9
	H6qGm5fCx1xYdm8RgO5JYDV1kvqRSgBwK8RyZm17pBsayNXsbsAaJor1+6cdio+5rDlmfV3I1kI
	4lGzmvNH48qgqcSm77WFWihgMUkRLI9APbEJ8zurCAvfOpLnrysVDpzdx461Wbd50U3WFx2GBJ1
	kIcNnpkgz1u9qaYNPyjdsOVPxCgASR37UtE4c4d2L08gGv60oGm5aspgyPynLp/HWuJKxW12J2a
	pK+hbTmBG1NbZ4Qb/98ytr/N0YDf6uW/5aFJzn0gT8iRYiyn1ZUzSXN2PtqjjkL6c4v8PzM2ZoP
	yNlUOk2A/ZBR02PdRQoBkIyiOyxmdCxaWbop3Ftl4NDinwpfzosPrsuDI4JEKA7rsBR6Ys80ZEq
	YDbTKQhJQ==
X-Received: by 2002:a05:6830:83af:b0:7db:b68f:b819 with SMTP id 46e09a7af769-7dbb6f25a6emr9575077a34.6.1775528437568;
        Mon, 06 Apr 2026 19:20:37 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbd663a4a5sm4895363a34.25.2026.04.06.19.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 19:20:37 -0700 (PDT)
Message-ID: <8143e057-4c3b-4365-8780-003e897b9baf@kernel.dk>
Date: Mon, 6 Apr 2026 20:20:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme-apple: drop invalid put of admin queue reference
 count
To: Fedor Pchelkin <pchelkin@ispras.ru>, Keith Busch <kbusch@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Sagi Grimberg <sagi@grimberg.me>,
 Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, "Heyne, Maximilian" <mheyne@amazon.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20260403202701.991276-1-pchelkin@ispras.ru>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260403202701.991276-1-pchelkin@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_192039_548216_7055536A 
X-CRM114-Status: GOOD (  20.57  )
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

On 4/3/26 2:27 PM, Fedor Pchelkin wrote:
> Commit 03b3bcd319b3 ("nvme: fix admin request_queue lifetime") moved the
> admin queue reference ->put call into nvme_free_ctrl() - a controller
> device release callback performed for every nvme driver doing
> nvme_init_ctrl().
> 
> nvme-apple sets refcount of the admin queue to 1 at allocation during the
> probe function and then puts it twice now:
> 
> nvme_free_ctrl()
>   blk_put_queue(ctrl->admin_q) // #1
>   ->free_ctrl()
>     apple_nvme_free_ctrl()
>       blk_put_queue(anv->ctrl.admin_q) // #2
> 
> Note that there is a commit 941f7298c70c ("nvme-apple: remove an extra
> queue reference") which intended to drop having an extra admin queue
> reference.  Looks like at that moment it accidentally fixed a refcount
> leak, which existed since the driver's introduction.  There were an
> initial ->set and an extra ->get call at driver's probe function, and only
> a single ->put inside apple_nvme_free_ctrl().
> 
> However now after commit 03b3bcd319b3 ("nvme: fix admin request_queue
> lifetime") the refcount is imbalanced again.  Fix it by removing extra
> ->put call from apple_nvme_free_ctrl().  Compile tested only.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 03b3bcd319b3 ("nvme: fix admin request_queue lifetime")
> Cc: stable@vger.kernel.org # depends on 941f7298c70c
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
> 
> Also nvme-apple seems not to have a blk_mq_destroy_queue() call for
> admin queue since introduction - if it's needed, the proper place would
> be in apple_nvme_remove() just before calling nvme_uninit_ctrl(), I guess?
> 
>  drivers/nvme/host/apple.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index ed61b97fde59..1d82f0541b0b 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1269,8 +1269,6 @@ static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
>  {
>  	struct apple_nvme *anv = ctrl_to_apple_nvme(ctrl);
>  
> -	if (anv->ctrl.admin_q)
> -		blk_put_queue(anv->ctrl.admin_q);
>  	put_device(anv->dev);
>  }

Could this just be:

static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
{
	put_device(ctrl->dev);
}

at this point?

-- 
Jens Axboe

