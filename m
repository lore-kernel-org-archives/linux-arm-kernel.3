Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91C1C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igC70o8ybU294XiVgv2dCfqybHERyfthoQG4v5gTf+k=; b=WJrCgg3tBQyImMzmfU4UIdqlfW
	XXpOmFF3NqY5pK70CEjwn/NVBxuR9gc6i8ntLStao/hl+2QFdKXMf0/4OeFMpTUPoBqOh6NfU52PZ
	HEykZBueA8AFZkoV8U+JmNMEdHGGwgw888vSSDyowRIABCXHknc4QqMf43impy7EsN+nO6nwJ3uEs
	dH30rDVbY8sBxjoSF1f+ENmJzHBa5kQkPI+Y+UyjqzHj+99tnNhesn1jpYPObQ+IeYPniiv/375NO
	xLxC1Vl+LNIP0ujOSyY9MkFYMZBU5A+68HEUWFvyXqlYcvq/Rkmlg3BQu2XchYWJ3L5rrBAaDQB6c
	z9TW+thQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7J-00000004WhX-39LN;
	Fri, 23 May 2025 17:23:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVIW-00000004PYS-2Liu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 16:31:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a3681aedf8so93236f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748017863; x=1748622663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=igC70o8ybU294XiVgv2dCfqybHERyfthoQG4v5gTf+k=;
        b=tUP3qQGDh+4DXrLzw2nk2msGz4XeEParNiRIPWKO+qkqgo8rgjLg31SKRcfNKVJhyg
         Ok9eDjXEklUUrUxkXTYuQ1nrbaSMh92Kxzm5LxCaVTwmglS5SppCnVzel/WNvXpfRnyw
         kkH5cvJ/SWAWqv3QzDi8vdyuKzdvhIHPwDeRf4XXDA5qykFOV05Q4jKiWRZMhQeNtbap
         UzXxee/bNEPcnBO1Wk0ok3ayzbHLs6seSCMqagPAMgH9IrPkLKLzOq07eymsN5gT7jrq
         L6Fzm4Rku7gwb3jjB2XVMy70MWBtqmx8S8i7j2LjcKj9aeuH0GCPa4JCJVzwgI+cJehw
         VT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748017863; x=1748622663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igC70o8ybU294XiVgv2dCfqybHERyfthoQG4v5gTf+k=;
        b=OIXB6ZLwJx5H4LCAL8mxaLFrlj5i/TnEgxq6XAPhUgWTuKZG4H5WKn2dCLPQkwaiq6
         PktHY7zHbt3ZTxisqVkPvPtLqrTIcXZtWfqDxI04LnBvK//tqcmdyF74hj6ojwo78jH6
         20CCGWdbnDtNr+ojDgjRdADiQJtmjs3oHTC9ul68kxib1CH+AIJzTm2AvAeNgKK5P1X6
         hVmFIHUtQQY/FITWI/CIbV2u0bbJ60p8GfHKfiY9B4IE7VTbh0nxBvF7BeOSLJegG2W1
         dwm+5cFE7qpuAlXw/CbgU7gF7vtfyruTaudJhT1UO2ClOQWDqpK5c/qE+t1opdaazPCe
         dD4w==
X-Forwarded-Encrypted: i=1; AJvYcCVeJm/5k2HU3NM2n3fEO38AWUytJU8poAQL64N3Nv2iacX6QKokx1AilPDAIfwi92RLlEcXBL4/024fw6sSLgO0@lists.infradead.org
X-Gm-Message-State: AOJu0YxGh8/RwXsTc7u54hzI997hLBDdSD+hzx4l4I+c1O9M/njeVmv2
	I8Y5vOu//tYaJQXFUp0GmnixpRGVY4FbX3JwDlvS94Rw2JNg0T7vxQKg/1RWwjJkHJo=
X-Gm-Gg: ASbGncsHM11vdjTdn3ThL8i2k2OsAzVE5NfqHEr8idoVCc2nf+fr5c9CEHfUoDLKffh
	0DUhM1a3kMG5iX4IruBcXVHMZyX905jxVCKofKb5Mi7EZpqzbv+EuX79EgpYCsf2dYy9A3EviM6
	ZOUrYAnlL4Pf0vxREk95HLDOAjdi8NRNOTzmWAy5TDi6EjVFAVO3+UUjrOh0EdnQuJyIDBkvwQE
	m8Ni9JX+B//IgtqwhWqffOBH2gDP8J9wW/UC1tNveAjUTkvC+IGq04kbCY0eEgt86fV6/uIWwt1
	qN+uQqnLOaEJycTkYbOX4mgdi/z5WpT+Tjuu3wdo+of3SL/EgO4OYFxu
X-Google-Smtp-Source: AGHT+IGGTvjpF7sv2w5zjZ0EW0X+dRfZsZNJ1QvwQmRtd2GPgdBA3IhgoeMEt8+gF3DgVzVaSIQ1fw==
X-Received: by 2002:a05:6000:4202:b0:3a3:61b8:a637 with SMTP id ffacd0b85a97d-3a4c20f8dedmr3518632f8f.22.1748017862887;
        Fri, 23 May 2025 09:31:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44804e89c42sm153252035e9.21.2025.05.23.09.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:31:02 -0700 (PDT)
Date: Fri, 23 May 2025 19:30:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, peng.fan@nxp.com,
	florian.fainelli@broadcom.com, fang.yumeng@zte.com.cn,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH v2] firmware: arm_scmi: Use dev_err_probe() simplify the
 code
Message-ID: <aDCiwqwez8nzk5F8@stanley.mountain>
References: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521161449954uFxEsoI6Zg_7wDu6IAfWk@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_093104_601439_328D1B70 
X-CRM114-Status: GOOD (  19.32  )
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

On Wed, May 21, 2025 at 04:14:49PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
> v1 -> v2
> (1) Order the includes alphabetically.
> (2) Delete "ret = PTR_ERR(*)", and then replace ret in dev_err_probe with "PTR_ERR(*)".
> 
>  .../firmware/arm_scmi/transports/mailbox.c    | 20 +++++++------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..764cbeac2492 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -8,6 +8,7 @@
> 
>  #include <linux/err.h>
>  #include <linux/device.h>
> +#include <linux/dev_printk.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -214,31 +215,24 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
> 
>  	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
>  	if (IS_ERR(smbox->chan)) {
> -		ret = PTR_ERR(smbox->chan);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(cdev,
> -				"failed to request SCMI %s mailbox\n", desc);
> -		return ret;
> +		return dev_err_probe(cdev, PTR_ERR(smbox->chan),
> +				     "failed to request SCMI %s mailbox\n", desc);
>  	}

Remove the { } braces as well.  They will cause a checkpatch problem if
you re-run checkpatch.pl --strict on the resulting file.  Same for the
other two as well.

regards,
dan carpenter


