Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62456CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjUmK2ozECz3lbsSt7T2t2Gcp1s3ZfK8yhq5qFhNE+w=; b=27jx26zheWBWrKDlMGu3br2cBg
	6/qx0PORTBgq1dqiq/+yWn9ao/saXXpnW7zTN7T8eSxpjbmsuDryMHjkIZEHftpRPamfxvLZDb94+
	nzEBEcY5C7pTVe6FmQ4Kqy098zfnloqjpwx0V74yPGBYi4IxHKwBrWeDo41qxyerQl7hn46TA9bKJ
	OvrWOTaIoswLIyJvWEeXxCWeiK/dBIMihD8jTKhxEFhVxIiOUVl3YbgQP4oLVuwK9/++RCpRd+f3M
	phRHg0IvObHgp6ImkrNwRhY1WRaPW5H2vPBQbztx93xvuXljiPdW1PzcpY3xOUCafME0meZMVvMmE
	uNrT6RpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbb6-00000003XRR-03hd;
	Wed, 22 Oct 2025 16:22:00 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbb3-00000003XPI-0Bj8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 16:21:58 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b4539dddd99so1272117466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761150115; x=1761754915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjUmK2ozECz3lbsSt7T2t2Gcp1s3ZfK8yhq5qFhNE+w=;
        b=ubWpK3XBt7BPFG7JDdq+6JhgYZrco7DcJYHr/0Tp4iVQ122DC80JUC0hazoWCcj7wc
         VM95xDdbveIT1IfJusWCM9sn2cAp1+0UPH3zhMYDfTm98M+AU5zovjP8gRoapn1WPUq8
         Bci0BXevetGmz9q0C6w6WNpaSGvAZgjyKRAXLlKDBfce+KU3mUetkGFtzFrMZrsPcGIa
         eaJIVmI4CHhqs8pNTFluW2LhXgk30QgqpqS1sZGqaKl5u1nYySiVKbaPJ4HyNs5eVhOb
         SMXvSYDhBlW9NegWh6E18XxZf6PjTqBQraR4kUiRoN6XPEgNFYET9rp75FDPkHSa5LLC
         F1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761150115; x=1761754915;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjUmK2ozECz3lbsSt7T2t2Gcp1s3ZfK8yhq5qFhNE+w=;
        b=srYgLLUAXvQYdZDt9Ee3hqTWnpOe2Sj13gvSxw9WQlMcv8tCLi5Ah1ipfRbC+4dEkX
         lOPgKj25b8dN6QJNsCMNF4L6h/kv4pUJ98pzJawpuVJKs+XG+lHzMl/mM3nC9TTt7HEE
         mHDDeTncObmjP133tVgTwE53JMfM3+6n7Yte22lf/KhqAkGiQN7q0Jb/dk6231sJsDV/
         PJd/ClXng6tWaQbBJCNdZAnzYpS48FNoH9RQKkBjuV6DufVy1+ah6J+WtvC7HhnP9g4q
         p9c7ujYFjnXNLZI4kJDo3VvP/+e4vxRc/xLswLbAy0X0MYXehqJXehQBpiCgmsTgfaTc
         AwWA==
X-Forwarded-Encrypted: i=1; AJvYcCVJdpVjHtrkByud89LaDElPnq6HDRy4Afmdpqxyp0rh7e1Xev/3517Ewqx+rXH9SlUhQX3FCB1IRPUUqCyDo9Hd@lists.infradead.org
X-Gm-Message-State: AOJu0YxPTpr4pUk6uJR6sc8wNJxb4/gLz5ue3uuF1+zhZuLax1sVRj4k
	bOdmQX4RpLy+xS9Zn4Vpyji8LMEOenK8WF+eF/qOeFwW5kDH8fg/gqOiKEozc1BTb5Q=
X-Gm-Gg: ASbGncsxnM0XNXEISXcLw8qOjVu16VJ97d/SDaAr75Zi6M7fAERyHeI+9UD5r6AsVHP
	SA6MOVm5IXLSP2eOz6EEoHzqdy7q5MDN8YtnmreuQXrZH2wRoUCNMv2p21oZiVuDIR4ICKswrDq
	N7Z1IPs7v5rBD+VnEGqmnYNwOJxENyp3KaiMMpL//YS8m4b/lEi/xUF+as4Nx0sBENnufKIzOFe
	q+k0J5neuNnewB9UbYNKA3pcjF8zlJOWLZIBalgwn7/1bEKxwOclVZpuBD4NZ48sjV8AuKpqoMy
	qqK9pNhuOZJovbUTvx61Q1gkK/zZlqrrFyxudogRrQeC2QwgJc7I49+vfTmwx4RoLSFPBSOJOKA
	Thjy48J05ETHBYGV7nR4oGof0ycardLyzHKLJuC9h5xTo6QZwbUlN3ER2uKrSEo0Bk/7OlsZXlh
	YkHzb2zrtS8ZC8PMcMnM6znMz8SH9aQdR5UWiPxqpqAA==
X-Google-Smtp-Source: AGHT+IGYChwhuUEGPVHCLuRk88XLXPKT4H0pjkSRx8SDm4X53gF3hPcQE6y1DcQp5mZdYfFKZ8VvaQ==
X-Received: by 2002:a17:906:ef07:b0:b45:33bb:24f3 with SMTP id a640c23a62f3a-b6474f182f1mr2501488866b.44.1761150114810;
        Wed, 22 Oct 2025 09:21:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da1ba1sm1377700166b.14.2025.10.22.09.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:21:54 -0700 (PDT)
Message-ID: <5ff5bda1-246e-406e-a07f-6ae7e8f468c3@linaro.org>
Date: Wed, 22 Oct 2025 17:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
To: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org
Cc: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
 kernel@puri.sm, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <0k5cPW5X5XBAPEI-utRwsf6huR-TBzPWKNIFiDo0w8R8qHEtZDcBbkrDaG-ZSl7Hts8VXGVOY_F21eKS0lIcQA==@protonmail.internalid>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251022102228.275627-5-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_092157_261628_B708DE0E 
X-CRM114-Status: GOOD (  19.18  )
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

On 22/10/2025 11:22, Isaac Scott wrote:
> Call on v4l2_get_active_data_lanes() to check if the driver reports that
> the number of lanes actively used by the MIPI CSI transmitter differs to
> the maximum defined in device tree.
> 
> If the number of active data lanes reported by the driver is invalid, or
> the operation is not supported, fall back to the number of allowed data
> lanes.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>   drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 838a1ad123b5..637ef6e614fa 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>   	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>   	csis_fmt = find_csis_format(format->code);
> 
> +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> +					 csis->bus.num_data_lanes);
> +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;

The function you've added can return -EINVAL;

Isn't that a fundamental error at this point ? It would make sense to 
trap -EINVAL and refuse to go further.

> +
>   	ret = mipi_csis_calculate_params(csis, csis_fmt);
>   	if (ret < 0)
>   		goto err_unlock;
> --
> 2.43.0
> 
> 


