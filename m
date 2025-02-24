Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E15CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 18:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjyHwCSZNLK4SVIWWoNCwaf/Co4pdr2aVmA/QrJzipg=; b=Q06G4ONJYyAqLmj0iVj7XanQvb
	08rxjg2k1kNi9FPdJbDGlDH6h09uroe793HVqFjV8OgRe4+yUUQq9pmHYj68pOnyWL7UVtcEhqjOQ
	/rhy3WTXO2qa+FSjpVR0MtqPkuzG5JoVFNaMCq6+hYuoeJHPBCT31f99GCMezj+HsdevO27zMmJ8/
	3h3A5lTBbTF773uNqNPIuA4VQN8Ky67BZQnMwH6ZBYcX0df/UUfsYYpLwwvfX9vtr+H7GyjQRgEfL
	Soyjj6HhelYW+pwk9deKe1I+kEbUcfuiAOSc2JRDLSwOfIR9eY5+Od+tGBa/eqQ9bVhya44BoRvO0
	jxZjCn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcyA-0000000ElF4-3K1a;
	Mon, 24 Feb 2025 18:14:18 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcut-0000000EkW8-12wE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 18:10:56 +0000
Date: Mon, 24 Feb 2025 13:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740420653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjyHwCSZNLK4SVIWWoNCwaf/Co4pdr2aVmA/QrJzipg=;
	b=JU8IdZ8ZDCt/ifhh1hA5Q6whezAiqU8735YHxd82xnDW3c4RBmNxkIUBsjkipWbfwvQQZ4
	HbjbPDYa9AzrlyPUehZLxnEXRpWOdjV1J0dYqvuTBM9OAM2XKhRwMacnfczZR++xe0nlgy
	aNIY9CgT7coDH3eINfF+kduJLrOQqoiYZ4bhGpEqOjEO6f1fyDABbbo/wqG4cinRE3b69A
	YgLeg0qbmA0+tbfuUsOS8OUlZz84jj7W+fmWmjwpeHI0l5XLtvn85TBzXm0USVQe2MlEiY
	b7VAHIVrd4BO8MPriYcuCvXBEbDByMPPc77bUBGaFFqIu4wSlkj7ByDsQm5fnQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] soc: apple: rtkit: Cut syslog messages after the
 first '\0'
Message-ID: <Z7y2IdBJbIWOpz8r@blossom>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
 <20250222-apple-soc-misc-v1-4-1a3af494a48a@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-apple-soc-misc-v1-4-1a3af494a48a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_101055_432720_979BCA93 
X-CRM114-Status: GOOD (  16.07  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , Feb 22, 2025 at 04:56:49PM +0000, Sven Peter via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> Certain messages from DCP contain NUL bytes in the random data after the
> NUL terminated syslog message. Since the syslog message ends with '\n'
> this results in a dev_info() message terminated with two newlines and an
> empty printed line in the kernel log.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/rtkit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index b7f4654c3341..595efce265ce 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -476,7 +476,7 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
>  
>  	log_context[sizeof(log_context) - 1] = 0;
>  
> -	msglen = rtk->syslog_msg_size - 1;
> +	msglen = strnlen(rtk->syslog_msg_buffer, rtk->syslog_msg_size - 1);
>  	while (msglen > 0 &&
>  		   should_crop_syslog_char(rtk->syslog_msg_buffer[msglen - 1]))
>  		msglen--;
> 
> -- 
> 2.34.1
> 
> 

