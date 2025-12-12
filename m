Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17605D59D84
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 19:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVUwj6Ss7aifiMd9VIv3Flz/Y6HZNB9830E8bskYMlw=; b=yNhsYX1J1kHBuzJ6vE5Xq+rPT8
	LEev1JKgTNEREITkhmZijKnyiq3fEKLpDvQE/EJBqeHoh22k7lA7eVmYZgyNjJCkURlkINlKpk6UH
	aUldOU3qlQllDfTOzUK245wAullPjQmGHGFS+YnHTMqYQuD7VwKv6o6gfFPAoImMABx6Vu1sStPvA
	dHvB2B5wABU83h1AufomB5fcqbz+yrEohW5gmr7csWT/+BSTVsw/H0Fs7TgQcRg5jlWtI2mta1Gxl
	S3Lfmop/GSThyhXtRoDFC4UVbh5XtFCkC4VKy502ceA90Lqdky+3UPni97b0aFhuDWmvQGE4uyucM
	2dZz/cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8eI-00000000yzN-3JY2;
	Fri, 12 Dec 2025 19:17:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU8eE-00000000yyn-3FV1;
	Fri, 12 Dec 2025 19:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765567057; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hWvkQqX8qqJRuIR1lEW3UhC9leLdg9AS8IeV/l63u7Xze87YXnxV4mM0cUtJFFJYyJu4r13ZtLxxVMrnlBrEkvwJIhD+7yJbkdOjbRDM+UxelLPvlSTeO+E469rStSevgJaB39GIQ8T1p2HxwwWc0ceVLk4OzqB8ghwtI7EGUB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765567057; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LVUwj6Ss7aifiMd9VIv3Flz/Y6HZNB9830E8bskYMlw=; 
	b=gd1igIJbwH0mf7bFdyYuHsLsHiMSbz1oIs+AFPX3Wceuh1g/OTOdI2BLcqOQySXN5EFqD1WAFrMIgzUrri8of4SWeUam9iyCL50JYIVlEAJLofqIQrS7bF66Hp1bDbOdKOuWZ43MBQq2BUmTeJNsx03bJoI295KJqB6NA9xAtN4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765567057;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LVUwj6Ss7aifiMd9VIv3Flz/Y6HZNB9830E8bskYMlw=;
	b=Cj/Ka0Urq2yG9mP62B39ePe/pBVaRZ+D+fm66eN06CH/cH3uHJT54f66ZbaLK4at
	5Gf8L1UV4lO7oQuYiDTsmmKj4gWa6e/0esZA8HEwEprf8Y2bir57EaE16loIQMG3Lqp
	35MqIiYMr+kZu3uknmaHw14MLwTcnLHGhd+8Uz2k=
Received: by mx.zohomail.com with SMTPS id 1765567056011166.01103093997517;
	Fri, 12 Dec 2025 11:17:36 -0800 (PST)
Message-ID: <912e62f7-210d-4e25-9119-7dea61b856c5@collabora.com>
Date: Fri, 12 Dec 2025 14:17:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: vp9: Fix probs struct alignment
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, kernel test robot <lkp@intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20251212160101.146684-1-detlev.casanova@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20251212160101.146684-1-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_111751_767878_45981AA8 
X-CRM114-Status: GOOD (  19.76  )
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

Hi all,

Sorry, I need to rewrite the commit message with some s/bit/byte...

Will do a v2 soon.

Regards,

Detlev.

On 12/12/25 11:01, Detlev Casanova wrote:
> When building for arm 32 bits, the struct alignment changes and the compiler
> adds 3 padding bits to the anonymous mv struct in
> rkvdec_vp9_inter_frame_probs.
>
> Therefore, the BUILD_BUG_ON used to check that the struct size is aligned
> to 128 bits (hardware requirement) fails.
>
> As that mv struct is at the end of the global rkvdec_vp9_probs struct
> and is followed by 11 padding bits, the 3 padding bits can be explicitely
> set in the mv struct and removed from the 11 following it.
>
> This makes sure that the mv struct is 32 bits aligned.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@intel.com/
> Fixes: d968e50b5c26 ("media: rkvdec: Unstage the driver")
> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index b4bf01e839ef..23c733ca2e8e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -66,6 +66,8 @@ struct rkvdec_vp9_inter_frame_probs {
>   		u8 fr[2][3];
>   		u8 class0_hp[2];
>   		u8 hp[2];
> +		/* 32 bit alignment */
> +		u8 padding6[3];
>   	} mv;
>   };
>   
> @@ -85,7 +87,7 @@ struct rkvdec_vp9_probs {
>   		struct rkvdec_vp9_intra_only_frame_probs intra_only;
>   	};
>   	/* 128 bit alignment */
> -	u8 padding1[11];
> +	u8 padding1[8];
>   };
>   
>   /* Data structure describing auxiliary buffer format. */

