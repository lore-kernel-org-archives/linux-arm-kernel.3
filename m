Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6758C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFPCf8D5M1X5rx99UIXQoQ9iwlwi2YMPh/PDLFzLuus=; b=Q/w/371sfp8nYfqSO2Ct12KO/g
	t0bo3VyvHrWWHV6HrptBeuaXj9VFOZmcvh9OSJAVh3d1KAL3M4F3oaITHMqCOrJqJf/rOzymwCS+4
	bs23yKNrLpTMhBTzKSH5ROax+XjX8BITOA5gYcE1R4G3m348T5QT+ujBJMnZJJZWg1aC6iIbGmweV
	+90KzK2/ytqunU8Eo9O+nuQc/GGoCPtUluD+hjXRYA5kzC4vN8gi/fvNCl9/eY12uJWdkmaNn9xkX
	dR/X3tG0swko0qvGGLE2jAnHqCvBHjd7Lo/snGrX3TNwaGBwg+l9fHOn6E2UoDDoDs8e60kacYqtc
	oranaMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aQh-0000000Erxj-0ct8;
	Fri, 18 Sep 2026 15:23:11 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aQd-0000000ErwD-30QS;
	Fri, 18 Sep 2026 15:23:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789744982; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qd/q2wVpxFcI3/WRIZ3tBdYsd2EoKb6XVtzU0JfS4MGDd+t2dLE1roaIP9XdmpACzy+o94UoDQt9s8xbtrAmt4oVs/Kmom7VlhtODLRhN0pcpjoo30Yerm9U91drzGGeCJz2xlWb3YjxxbO4qq/+1V/TBdlFyBvdroSzMFHuANQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789744982; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eFPCf8D5M1X5rx99UIXQoQ9iwlwi2YMPh/PDLFzLuus=; 
	b=Gga2xjjA3q7CrkP8uzQjeRtnsSEZhTfWZgKsJV/dfwl3T4xyHZA7/ARoLsCS4wbry+Nq7xyglb0YTpv0RAD5nEU6G+diYyvxL0ZZcaP1NgoQCLfHGx5NrlHljixzu05YvJIgbnkoU1+76/n+Em1sTmfz67I3nlTYkcpirf7N7C4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789744982;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eFPCf8D5M1X5rx99UIXQoQ9iwlwi2YMPh/PDLFzLuus=;
	b=g0gd5AQX8gvsnb84joQ4GMx+VOlotLGfUFb4Sn9YJIbCFwwBgNRY53+uqKG55uvo
	gKAWCDHb7bIGyMXemgg0gA5Je4Cqd90rBfKKW6CjfTSZnOJNLzW9n5Pa+z5OwJfyHCh
	pLQlB7caar+Sd6hxOwxYR+P8P7tUHCmPuH5qyhTg=
Received: by smtp.zohomail.com with SMTPS id 1789744980496928.7914211499516;
	Fri, 18 Sep 2026 08:23:00 -0700 (PDT)
Message-ID: <fa2f5b96-a44f-42b6-91b4-5895b57b4f53@collabora.com>
Date: Fri, 18 Sep 2026 17:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rockchip: rkcif: convert timeout to
 secs_to_jiffies()
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260918-rkcif-secs-to-jiffies-v1-1-110f336750b0@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260918-rkcif-secs-to-jiffies-v1-1-110f336750b0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_082307_825787_352AFA21 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Amin,

Thanks for the patch!

On 9/18/26 15:05, Amin Gattout wrote:
> Use secs_to_jiffies() to simplify the code.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..f82eaf9a37d1 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -314,7 +314,7 @@ static void rkcif_stream_stop_streaming(struct vb2_queue *queue)
>  
>  	stream->stopping = true;
>  	ret = wait_event_timeout(stream->wq_stopped, !stream->stopping,
> -				 msecs_to_jiffies(1000));
> +				 secs_to_jiffies(1));
>  
>  	if (!ret && stream->stop_streaming)
>  		stream->stop_streaming(stream);
> 
> ---
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> change-id: 20260918-rkcif-secs-to-jiffies-1b98a96465f7
> 
> Best regards,
> --  
> Amin Gattout <amin.gattout@gmail.com>
> 


