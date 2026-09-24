Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769A5C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXlP/969CHxJtU22HfzbT0qcpswupuWX/2g/r8D5tLk=; b=UlUdqgTD5ig8A0ehVXqtQdpRI6
	Nq2ROTFyRk17MlbXTOFNHF0/EYh9NswNVvb8gVWFUV9xLIKh04yarqrXWEWvrjxxx6uwm6+DnNbah
	hnUl5cervr7q4JLX6j8rmJ8EkemrhFdxN2K+ql6U8u52CyURAOR5/24mGpcWouDlisiGhG4ahbPGf
	LX3f5X1nR+pdpYtdQ3Gxx9ExZw0UZGRzrFccF6LvNLc2ksmC4tBNtKOuaX0RBR8Cmg8seL1qmeLk9
	AR0SQf+SpkEQmjuKCBJ9AEgaxpWXftap51AOTqbX6Xq5xhO7CuQNO88QB8tiRkNOtu2+OfgX2R2Mx
	XhRE4xzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jd4-0000000B6kF-3W2a;
	Thu, 24 Sep 2026 13:36:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jd1-0000000B6jJ-0ghl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:36:48 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso15261755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790257005; x=1790861805; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXlP/969CHxJtU22HfzbT0qcpswupuWX/2g/r8D5tLk=;
        b=v48koSy7HZA/DRGFfMebqg2/4LsM9XxYn/cNfvD/PP0lsLYg7CYxonc5A3u+iHBrXk
         bJsD7M6KP2VheSkVU/XGaayJ0G1xLSMRQzJ6hz8T+i3Wjj+YKuNMz1nKrlryxAxKa+yn
         zFIKVrfkA5LEL1ArftPvfUeOU3p3UtWpwjPTQEUF4+pwegFBCaPsmdKtQ04xtw76jSQ6
         trwpcI9iO7GyOV4U6u9BKXX2u1zZNCzysKCEUewAD9ve3xUdwv4leH1Cq7m0IfKJh6h1
         63/pJI2q/DMpy6QqhCiFxr/oKPSRDJtc2dc/e2HSKzdznkhCDwcG+rupo+ol2i3mhEa2
         hrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257005; x=1790861805;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXlP/969CHxJtU22HfzbT0qcpswupuWX/2g/r8D5tLk=;
        b=yY2QPHHxR4c0J/f96dTOh1UP/XHvMlsrnR8MDnVFCMQdnkq+VscRj2WWkPcsEPxNE2
         /6du0UJUC6B8AMx53QzMlc8tfkR3yrnQmRyKflzww51CWNW4Z1qVeL5Wzi6UaWDPscCt
         VYQUXurY647EhaQ9WheonLCZQ2kbXoEnXRDGMlN9hMcFsnuTS4PijXm+679SqAXNqm7A
         zGOJ/NUfZL3dTBBirTDKa1DFokcnUvq5wKe52JylcHp8gFfTVb9fUwRaqBwEE9R38tvz
         3UPA7xZhcy9ZKqGIqLD1s4P7f7fGPZ3NVge5fx3YX+y4EfiH2BcsZugoB610FHt1PUoZ
         fP2Q==
X-Forwarded-Encrypted: i=1; AKwUvByibgyP10IlYC5mc4hiJzL74cAVHtr/2R8IYUYIKToRoFY1BKGxNjrWtNK+oa57qcq2rwfxZr7/dx7nkCj7ZnEP@lists.infradead.org
X-Gm-Message-State: AFuF++kM8fQmmc9yA6PVdH2yVFjzeMAsg1WtsuF09iTLGqymCopIXnee
	OsIxPncU0t/uswGx/pYz2L6PXwRdMtbwz4dol4G7nXnPtLk/77qUirj/cRCv+Gtmswg=
X-Gm-Gg: AYBFou3T46Xrzt4Ld8VfpmYUsGbEqaRel7VdUJ8usUNYisyJiI0mF6uwOhhlXLGBhen
	/GsAb/2PccA12JQg1KCRTgRsSJtzlpPwk9UCfJoAdPZRWnn248Zyzos4aImOnqqkN1MQ2UhuQZF
	ZCcy8dXuo+Y++SS6u8+qPmLgpp71mxphLxGuZJptIkSBev8CvQpMPVDQQIqzwVPm3JKKXfetk8u
	ft7vM7+b1zGEIjWTMXuzTB7+bhXY077hIPJxtGZXqXUBZVwqbo8H2pjv8Rus/ItjWPaxCraP7yB
	a2i/5gagfSidrFGroc94fyuRwBKG9YPxFwSm5Itnn/6F9lfjmXaNAPvZATHgZa28qhP16os1kxT
	uqzrEJM5oVn6tLZoCmTmWQOF5OB5w7qinF7SqGvI2RhLjuLvaqsiHRBe9OieIYXkP/hX6sJLENd
	CEO1ESE6MVsOM0mz4yfPKUxV6A0nFvhDK6DujKTFtQ0MEc1fX2goszSgK/t8/SGTlCwaGQFmj2x
	GDVqcnsm5W5Ntudhge4qcNlGsujB+51ewxlNJ8nsBZ4J8CkxH1Sv1M=
X-Received: by 2002:a05:600c:468c:b0:49f:bd3c:bc19 with SMTP id 5b1f17b1804b1-49fe66f4cabmr40024985e9.20.1790257005322;
        Thu, 24 Sep 2026 06:36:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889130sm14521695f8f.37.2026.09.24.06.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:36:44 -0700 (PDT)
Message-ID: <8f18e32d-07a7-46d9-9e6b-55c8fd25ede6@linaro.org>
Date: Thu, 24 Sep 2026 15:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Fix node reference leak in
 rpi_touchscreen_probe()
To: Wentao Liang <vulab@iscas.ac.cn>, airlied@gmail.com
Cc: architt@codeaurora.org, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, eric@anholt.net,
 florian.fainelli@broadcom.com, jesszhan0024@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, treding@nvidia.com,
 tzimmermann@suse.de, stable@vger.kernel.org
References: <20260916180549.2090497-1-vulab@iscas.ac.cn>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260916180549.2090497-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_063647_228532_39083C3C 
X-CRM114-Status: GOOD (  15.74  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 9/16/26 20:05, Wentao Liang wrote:
> of_graph_get_remote_port() returns a reference to the remote port
> node.  On the success path that reference is passed to the registered
> DSI device and released with it, but if mipi_dsi_device_register_full()
> fails the reference is never dropped.  Release it on the error path.
> 
> Fixes: 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7" Touchscreen.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index dc4bb8ad9131..c14776561623 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -428,6 +428,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i2c)
>   	if (IS_ERR(ts->dsi)) {
>   		dev_err(dev, "DSI device registration failed: %ld\n",
>   			PTR_ERR(ts->dsi));
> +		of_node_put(info.node);
>   		return PTR_ERR(ts->dsi);
>   	}
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

