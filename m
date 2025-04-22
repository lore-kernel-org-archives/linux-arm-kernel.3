Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDC8C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=; b=mOa5/N5pEDCEg1lbDZ3RfS9voK
	EUbfAw+PSDcU7X9K2YcE/mFH+o+qk4Nyc9lCsgpPvwhMYO1PsBOxcXUlfiVEM+I4XEuQfaaO5Q6Gf
	eiRvdJBI1gLo0fPnBEfci/5HGufPvH2lvxK31Bwlo3tnd80TlS0nN2Ke2PwsxSyIkx2wwPfZoBXVb
	86uHvwYhR4JxG2/OJ8dToL0uzV5L5fZRwMXJlT0PvVkWj+TO59gpW/YEo0+SqyKcl0nsUG/35hPk+
	IQOJNX6Z00kAzb1Ne5sU5lOif1gsfeGc5q4C3lr0We9P3DHrUYCPauWOtvPMdPACMku8yAKHfYARh
	t996qlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78Gk-000000069wM-1dGJ;
	Tue, 22 Apr 2025 07:42:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77gC-000000063mD-2O5I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 07:04:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4691314f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 00:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745305467; x=1745910267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
        b=hQBUicbh7p+ahWy++TvdIGnvCkUgqKqju5DJI8c/IVRSnc1ynIDJ7BrlGpxLvcDGoM
         spXpkPjRRth+YtMgSymDEE8LiEWMsW5LfumvEiVR6/MP1qY6FrCaDIZ+tYtbvn7kIE7R
         UV33np4tSmJ+DGB78O0F9f0JBLccKJq1a/JjfZ2d5Fvblr0M9ksxMIrX8EQ3TwetdjsP
         iWSrQjI0//tLo4Rd5T9yHh/v6m7VbWRuuL2tgPJwPDt/2WG0HKJPAK3ayC4BEmN4oaG2
         +pfWySZqz6cc98NqtygKRho4t8d8zy4f9A2Vsox1Y8RdbVCIPRr70tWpPU+6R6cc3XYP
         KuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745305467; x=1745910267;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
        b=AbFGir++BwJcVu+GvZzBH2K9yQcEFgeew4jnhJuZqc/0mUNdLlNczlF4hytaXEKBXq
         3eLsuvr597VXEEOhjOoSELzd/ON34yW6BwRvgxUk98j2jRrHdBrUg018EQqeDppB14mf
         xzf5ZYd1UzklzdCVobgcsvNsqXBioGYIXOUBFjPg4t0ooCmB6Nej5xhIHRyWZVhcaR94
         MltJ1aoZ39ysz1M/gqZoupRfZoZoLiwX8wNAQGuUx1UE70btNt35fCz/GtDDodDwS8p7
         3Z2SiqR51fvGpREOu4rdAYnb8qNf6d7csbtRLnPXRrQSBYBRW9woTNtjS4CEzDej82Dj
         5kTw==
X-Forwarded-Encrypted: i=1; AJvYcCXuIJL0aXERSzxkPrXJxBL6gi6mTWBB13GpmcedYRx+4CuwClbzTI5w5x/BldznTkSydpPQYUDQy7mr+cd+iGTX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrv6JdleOevk2P3hDXNOsTl8YyM0uYygY3RtW7OndH0TpS5AKY
	VjV1hnwUZIu+ATqyoFqga/h9Z7DutvmjD7QSTIN0p9uPwpJ4Bk60M+bQwnD5Upw=
X-Gm-Gg: ASbGncv+MWWBi1eCUsAS8Tu9CsrprZNHtqRR90jWK01ohCjnwyVpXSYktm7r9tMYVW7
	5CCVv+v71SspKaMzOdulSub+kJJAqFi7ck3zVC/G4ELDGVSBDpeBV9XFgw0y6PPKKx9vTrerEjX
	9VKOSIPiKG8K0ftaKz8KkLVKOqQ6UCNGpD8uz7ENuzeZVL2fxUCCrpGyX6EmzoWbPGkrSRm+F5s
	yolBgZNxnnOpsWOJQ18e6zbO7DhXa/BMYvNXk3D20do5Ckuw1QMlL8gdcDxwjMq1u94LOBqYT0z
	8D+uHhhTwP0OoEi+qaXqbJsEkgXGblv0iJmQ3P+lZwxgBIRwOdCG6te4iwptrTk7T9Yvg19JFEJ
	sdKoKKbLlOMpzllisgngIH1GOdJMj
X-Google-Smtp-Source: AGHT+IFkoSeVngdhH4gWhO7gH9R1jUTNRyHvXAKvr6AmKds7Pokhh7kLUhAv02Z1AP3MT8O8IomR5w==
X-Received: by 2002:a05:6000:4a03:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39efba8a4demr11868054f8f.33.1745305466576;
        Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d006sm14361970f8f.56.2025.04.22.00.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Message-ID: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
Date: Tue, 22 Apr 2025 09:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
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
In-Reply-To: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_000428_602113_3D6853BE 
X-CRM114-Status: GOOD (  22.45  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 19/04/2025 23:32, Martin Blumenstingl wrote:
> Hi Martijn, Hi Neil,
> 
> On Thu, Apr 10, 2025 at 8:46 PM <linux@martijnvandeventer.nl> wrote:
>>
>> Hi Martin,
>>
>> Thank you for the patch.
>>
>> I encountered this issue some time ago as well and had a possible fix in my tree (see
>> below).
>> My apologies for not upstreaming it earlier.
> No worries, we're all busy with both, offline and online life ;-)
> 
>> While my fix is not as symmetric as yours—I like symmetry—it is somewhat simpler. It
>> did make the assumption that only  calling component_unbind_all() was at fault and the the rest of the
>> code was correct. Therefore, calling one of the following functions:
>> meson_encoder_dsi_remove()
>> meson_encoder_hdmi_remove()
>> meson_encoder_cvbs_remove()
>> in case their counterpart was not called, should not result in any issues.
>>
>> I just verified, and, as far as I understand, all of these functions do a check to confirm
>> whether the encoder was initialized before proceeding with cleanup.
> Yep, that seems to be the case right now.
> Neil, would you like Martijn's more simple approach with a Fixes tag
> and backport that?
> Then I'd send my patch as a small cleanup which doesn't have to be
> backported. Otherwise I'd spin a v2 with a fix for the issue that
> Martijn found (and including Anand's Reviewed/Tested-by)?

Please send a follow-up, I'll apply this one today.

Thanks,
Neil

> 
> [...]
>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c
>>> b/drivers/gpu/drm/meson/meson_drv.c
>>> index 81d2ee37e773..031686fd4104 100644
>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>> @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
>>> *dev, bool has_components)
>>>                        dev_err(drm->dev, "Couldn't bind all
>>> components\n");
>>>                        /* Do not try to unbind */
>>>                        has_components = false;
>>
>> Above two lines are no longer used, so can be removed.
> Well spotted, thank you!
> 
> 
> Best regards,
> Martin


