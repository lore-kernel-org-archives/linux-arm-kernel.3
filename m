Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80525C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsRjF6iBA0jVUvpTn7ZmwcFOLlij9sfjwslA/3l3Yjg=; b=oFwMdBUCHuhoeoSBPmdmuTt7II
	QjOkQnZp6HGo5aV95vtyE3xyjhAy3D3P7fKXq+hKe0I+bm13grqK7IQNw/KMVDCIQNhpHBGiNJ0zJ
	ZuOVB641ucM5Hkci8WEkn30cKc19NADXRWPbJzo2XjuOAOUGGdT/jxmyTUVLw5Np9RJzl5L5VHKXC
	x+9P8sFh7Gdq9dOfQ9mRJvmhwCnZxq4nxp2FkSFrJK/toJQJJZemjwT34Rjb1kzxUurx7F2PuZHAT
	eNhZW3QFP0wcKzXz6Kbpp4hUfwLJEIS2VTT9NO+X3yTASnLByG/ITD0yfIKnJQa4YyU59TWkTwKmO
	LxF49KLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYdT-00000000jEX-25R2;
	Thu, 15 May 2025 13:28:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYS3-00000000hOe-30Fw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 13:16:44 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54e98f73850so844323e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747315001; x=1747919801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HsRjF6iBA0jVUvpTn7ZmwcFOLlij9sfjwslA/3l3Yjg=;
        b=la/1ztMbfpRhaBD5IIQES3r/ekk9ssOWSl7TfZK+x2SuyxTUmBA463UnTlqutHfKP2
         8/iEHLznK7AigL5PyZwonEihaygK1wWQ74b7ukXLHP1U1vS9C86SBWkO/zfoU0Nhqg43
         B3VgHI66ss5NTxFV143ilThI/jGVWQUbwGL3GxS9Imgj5ympf0jQ6D+vASPO/cyQCCfW
         YtK7efz+wV1WJ8CU7KzCfL7Yu862IG3RaGQnezSvhr/Tej4UdKFbvpZoAJGxmzwEAuJf
         zkqpFC4DYUNp5c+DhHDw2hRILRLxFGV61Fgffp/6md5LY8efcDV9c6IYSn0aV/POGD9j
         p/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747315001; x=1747919801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsRjF6iBA0jVUvpTn7ZmwcFOLlij9sfjwslA/3l3Yjg=;
        b=lyubF7kkHj19THWPywuyTxdqPQ+ZQXjMR2n+eJw9KR3NO0zOdQzlJOlBoYglQcRlmb
         AyPwjTD9U9/vfilggmkhYytKBCJW+Dbp3z8VXy0NWR+eYgqTyRCjF/9NBq0yS/IlFA/s
         GlO4ml9G57XJvRt7jipbr2lVGcndmHkgnczF2pF88awrfpLaZpZjJ3LQvcE67lHISvqD
         8O0ZsZUHr//3H2AnXoY+NN6VAqghzHvims1mVsL5fXiC/xHFkovmLxIfsjzYX4K8Lsu/
         Zc9BKerfGHxPv3h9kc+Fn7rtuY/KAeELG8W/L85Hr5km6M3saKyTiwS/J8BRRHsGM6pF
         IKhg==
X-Forwarded-Encrypted: i=1; AJvYcCVedhR7cORzqHODFZUBaBYyH5Qh82mcT82RaA1Dy/9S7wS7M+h9RlQaSEsJgW/SLoHr6szp2hB92NAEq7c8qgwa@lists.infradead.org
X-Gm-Message-State: AOJu0YzoFhfFAtsF9b1LYhrcshjaOPSahVfbbQ4q/n3/W8WivbhRY38F
	cw4PR8FKza9AB/dxYG986SiZ+LXcSw0vGdq+De/zfE8ms0vODRJwZ75UeFj3LNf5glwaFWxq2o+
	G5WY=
X-Gm-Gg: ASbGncsbw3a+te9Ia8rctQG0pRDiEgfNgVbeL0P2/0mBJm4/JI9vOs7FsazQT2sEepB
	D9eCp2+DnT+vlUflY3jvFvBwEOyPGZJFq+zUA5PGVr+Q6A0Fq9ED9AmLQ7PPg95OmxJiymeQrVW
	unZ4SDur2rSbNSS9cv8JphVFniaxdw7tyC4190ww1RRy/mOIKC1Khf9IxOYMcFYSjhTD7i9dWqo
	242BEjCUhbD+77gfHX8cABXITyKDg7vM5hyd/eAvruAq7ugZyiNWDTUVki4CEwwaFNlPlxz5NY4
	rM4lj1UW6QZn2VlK4jmQDAZCiIRRD5W1E+5d6d2sxkRm8suwpM17RjJFh4xEAe8LtifI0MsnTS/
	nAI4ENw==
X-Google-Smtp-Source: AGHT+IEJPKvWe72TF7EByB4gPExTJZy2vEZ4XGn1I+zI8Qjp4rqHO9xavu6r1HaPWrHK/wY0PTR48Q==
X-Received: by 2002:a05:6000:240a:b0:39c:30fc:20 with SMTP id ffacd0b85a97d-3a349922795mr6543267f8f.37.1747314991164;
        Thu, 15 May 2025 06:16:31 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35c12d134sm403876f8f.47.2025.05.15.06.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:16:30 -0700 (PDT)
Date: Thu, 15 May 2025 16:16:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, peng.fan@nxp.com,
	justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
Message-ID: <21435bc6-d4d7-4576-8ff6-266ce9507799@suswa.mountain>
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_061643_760126_53756ACD 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

When you're resending someone else's patch you need to add your own
Signed-off-by: line to the end of the list.

Please, could you resend a v2 patch with your signature?

> ---
>  drivers/firmware/arm_scmi/transports/mailbox.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..816e79537935 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -13,6 +13,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/dev_printk.h>
> 
>  #include "../common.h"
> 
> @@ -215,10 +216,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
>  	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
>  	if (IS_ERR(smbox->chan)) {
>  		ret = PTR_ERR(smbox->chan);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(cdev,
> -				"failed to request SCMI %s mailbox\n", desc);
> -		return ret;
> +		return dev_err_probe(cdev, ret,

It's probably better to get rid of the "ret = PTR_ERR(smbox->chan);"
assignment as well.  Then it's a one liner:

  	if (IS_ERR(smbox->chan))
		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
				     "failed to request SCMI %s mailbox\n", desc);

Same for the others as well.

regards,
dan carpenter



