Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D71C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=; b=0QoDbn8SSPqjlzdbDDEkHiTjoX
	QVnFZhxQH0AIA0YfEABIygBEo4x4TRci2iz3hq69eer50WST/i0h3D5hN2UbPIxSVHHzAPI7YCCht
	F0AQB3FRnlxMhLS6SkJP3tjbeq+H59BlbUU8u6TmFlmuOg6i6ebx4yKR4xbhz1rKSkF/piFApN7NG
	8buSfdBndVav+rZpwdrjSHGpB03gcRSZMhKvcKyXsBzvDfvRbPOZ+AEV54x/AAGtfSgZ7NU1SHTUF
	umDAmKX4/gGBpFF/76HUzj8Yuez7+BwnsMCenDobt4ev8Oe8XoaHJ/fHeaUrlIOR5UbrZS6z7yKje
	dp5XBWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2ck-00000007kmE-0cGc;
	Wed, 29 Jul 2026 11:38:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2ch-00000007klB-0yMr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:38:56 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1309466f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785325133; x=1785929933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=CoZhzWMCDKx5BR1+BP3fMnMGbb8oeHcMSgO0YgLddrSsZFCtSbkENKUbJAt9+VCb6X
         e9hAf2e7GwpxITeSt7G8szzpUClKeURJysvpJaT+K15W+8cQ7QaewDipUJInIBtMhGs7
         Gzw6vPTT79uzqEg/sIT77evBldHD7i1DrIleTIrXZtIYWPCCxl2rOyq1fhpeHZdy0cjQ
         h4vW44wPpL6C3HKUBRfAtzQdoYa4GbUhd5l3UvhggTeSxvzACLh5pV9QaEZtGIP6LVZn
         477jamUfH+7JMgsGeX9LnLUzecGuLkSRIx9XDJZp8HRDORRrRuWMS8vLsE9S+cgL3+le
         RA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325133; x=1785929933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=BHON0MgAoYz8w6Q5pRQIHZt+PFz99gqRAHmkiRkQD/bq7diDTCxMlTpVpaZ7LBlKQT
         UFRpMgGaSkb2RB/WcKE81yojhzOE4oBi+pCnqz0PpOL9CHC5rcgsFxqPrzKHWBGl0vlB
         CjE/O+RdaIL/B2dnRyEGffgc6w8Yp327DZ7rF0KMxrvWYSILmUJs6FBevqef1piN5+7m
         FgyI0cVJNt0qhwrKTbVqMXQPjdfFgJkuyRNNTm0dq8nNx15DhvPx2QyxEAS8GybmwgbQ
         ZBqT+CQi/LmbArDMPSzBIVXQEioQ1qzu/RNq0y9gXWSaADQhkAfvx8DHy4erDua7qQCI
         W/Aw==
X-Forwarded-Encrypted: i=1; AHgh+RoXnc4TChpkx1lYwGIoPYK5geTvpf+1Zz4j8DXvbf5AYcgprcZgKaxLTuDDROTxEu25KK+PcLrLm95kaDHBtjHS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj772uplhcfu4WlCvEQs3ZrQOyFh9MMmB5xaVJJjeTquvIuflt
	fJIKtG9RE+t8cwTQAqRURVYRg0oTznc6mznGRdibH6hGCeOloxksAZSm7Akftu3VdoE=
X-Gm-Gg: AR+sD11LJLZ0uPGLFr1kiJXx6jWF2+IcwEoywD+OFYUkKb/qziZXxlL/URGn6FbrNKx
	enPkaSMeiWB7BHMXNflkIMFLzlqbq8XZCQJK/y2e/KQDz2WVctIdH0Ca6E8ye123J4oofrEPjbT
	XqprFh5SzsyLU08HEh0EHhMvnoDWNnCV9HyecE045210fpcjldGfLPVIxoz2p/HXcEc9pYiKfN+
	FU45NYBDBbPlVLFLDuLzunw5rwfNjP8+LDN9C8J5r3cZRBzTmQ+u748IPfkhzcrPqVuoHK9n448
	5Uhsfgj+PPeumUqadnZXxBG1N2ywWRSLGxWTn5cTbgKxSNyeV7F3LtL7XAkvx1Dj0re14iu2AnR
	2r7ybW9k8bNUFSXIsKti6CMIBUWxwT4Xls4ENL8gru1bWxYTcA2S54gatlwkjrWncXJ94mniGs2
	/PiYfZn1TXUHkxklVbd6fmp3SzuYe6jftjmGM1Bo/ebTDfWJdQ030rPBCq5jJwaoY74rZseGo=
X-Received: by 2002:a05:6000:2c05:b0:47f:9763:9864 with SMTP id ffacd0b85a97d-47fbabee850mr2432854f8f.19.1785325133163;
        Wed, 29 Jul 2026 04:38:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm7702125f8f.18.2026.07.29.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:38:52 -0700 (PDT)
Message-ID: <f77aab11-0e1b-4962-9d53-0bb2fcd6486a@linaro.org>
Date: Wed, 29 Jul 2026 12:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
To: Frank.Li@oss.nxp.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
 <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_043855_280543_36DBDC1B 
X-CRM114-Status: GOOD (  19.28  )
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

On 25/06/2026 15:17, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.
> 
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix typo simplify
> - collect andy, gouniou and loic's review tags
> ---
>   drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
>   static int camss_parse_ports(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> -	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>   	int ret;
>   
> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>   		struct camss_async_subdev *csd;
>   
>   		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
>   						      typeof(*csd));
> -		if (IS_ERR(csd)) {
> -			ret = PTR_ERR(csd);
> -			goto err_cleanup;
> -		}
> +		if (IS_ERR(csd))
> +			return PTR_ERR(csd);
>   
>   		ret = camss_parse_endpoint_node(dev, ep, csd);
>   		if (ret < 0)
> -			goto err_cleanup;
> +			return ret;
>   	}
>   
>   	return 0;
> -
> -err_cleanup:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>   }
>   
>   /*
> 
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

