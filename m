Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93FBC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=; b=UhYNL/ApEkqs8EMr3x/Z3SKWGq
	dwsoVIsXqpLAWlZ67WY5k0l+AXHMt1SAE47NTx1+lg1INLHz62yHVpGdfYjsbdJFM4X7cKQ27TIC4
	5z2/XotO6iro4hm37jGIQZzgzAh45itLSc03P5mhpPcO3VH/8yb/jsf/RfDxAAErSn6eHEaXJ7/nk
	ZJQX8F49dDxaSKWYK679F8GxbCOpRlX2lFtZIPnErczaBPcfrKpSj3BTYZi7iSY7g4GoD8ju5EFYa
	HjK2bMoUL2kNtHwXTp1w+ieDVzeNSkp4xyneVRQW0TMhNKjsiaChEyLZaupM3Hh6K60Tfki+KcOvP
	+Tm9xSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVJt-00000004y1o-1uYS;
	Fri, 09 May 2025 21:31:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSpg-00000004cSF-1MsX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 18:52:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso16340295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 11:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746816746; x=1747421546; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
        b=xqtBRXQrXdW2YYeqRR3/5g4YcqJWbRq4Hg/crsbDK4sS9T5Mfx65jwyjL7Ela1AtLl
         /TRv/IDfVw+D1Uj1tgdk4JTYEy7n+eGsopjeUxkUFNqDyFdfo/aRhhFaGmQujwQ1XTXY
         sVUxNi2RipThjm0UaX/L+feLF2WNVAEzj2sEuryOjM31+f6mfCUGjhsgpepN59Tmwvyw
         ybTc9qa3TLY6vxKMGkufW795yobmJsF0UEz/FuedYKMHhM4Djqmmca2Uek+EVgpTE5PV
         9wXtzCBdMyc+kATqLlsy9uvoC3GiFykfS+NtgPyJI4HJhna1QsK/hgAVedq4aoV/PpNn
         mb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816746; x=1747421546;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4o6noN2eJkk0XdQVCPgCv7nvhvbBSL+3pUlcAtD0d+w=;
        b=jpJflp2qqhucGdpjY3W7e7+xhmmPwg39zeA8TKhAZMeDa1H47mzXBCkBuncSrZSSQy
         1sTnIL6EfztrC9AB++k+8AZvm8E8+BxWW+klFmqttmKVWdwkiHCTYBF9qaX0h19V8+y0
         JYJTY0BN9QYMLqbqXru/fj5DX85tg+HUFeF5DAbVY0yz5lcc/jatit4uazZZWq6XgJ0S
         rBJMzCtR0WhR8T446JSg5PpUQfJqMlHuBx3Wh57ujxykpgezT0aru/F/42k0Nse79zfd
         lSns/lGaMoLV78A7n39alRX7l9GKi8vZc9j7A3R8tiMx/S3hvThYj0HvPIVcMlz9rWxl
         sHjA==
X-Forwarded-Encrypted: i=1; AJvYcCUlO9zlW4zeVFU8HbgHmDAfNPHEs+eV1RTZBz+3ZIL0vduDC0JrfKyr8l05NZnzje5eNn4OdDP5mhUxjad8IKHo@lists.infradead.org
X-Gm-Message-State: AOJu0YwNy41tLDDyLNMW3fnkp8qTxifAYLtLqyqwWlgQd1PwrciHFtIL
	KPJt2vdorgPiGCUFz8jL3ipgsEyab9DKCoO6TiFLsgzDHM+4n4J+eWa2ZKfU0GE=
X-Gm-Gg: ASbGncteS2+rWM0rlfRnPftRN9jntX44/sTsPwVh7ZufKNp43wqWY6ilSxNxnS/5/q4
	mkMJUNFvsIzedpwLOI8ziNCTlYlR2e9KDPkbR12tI9kMEE9qE6TQRYAoWztGXcOwMqaONfJu9wj
	jNdoY7F3sYG2GeO4GysI2xmT/aDEH2tgKREyxuf2juvzoL44ovXqcWHkrRRVOcb1+yhNBWlLsyy
	UGgVuGRlA5fLBM43KxY1gzSpBGE64RQGHyJEPddB8NkqQ0/PmyPKQMvbpzkrcpW+PG/UKf4UoHB
	D41+qyih4BCYpTYlFCrUZj4mKw+26HU4NNUdIVT1skTmga02N+aJ7C0tZc+s3SXXFsYq+8WIPLa
	vHg+NmWa0SxOnyCHCqOgowoWYwZhg
X-Google-Smtp-Source: AGHT+IEkES7QrrP7dWUS3r90TTqs9H9HF3Qrg1w8ITbxBVl4k60rc9jJMmKmLI9AOkx38FcFHuyvrw==
X-Received: by 2002:a05:6000:2088:b0:3a0:b448:e654 with SMTP id ffacd0b85a97d-3a1f64e7509mr3877389f8f.47.1746816746484;
        Fri, 09 May 2025 11:52:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5929:59ab:840a:b8f9? ([2a01:e0a:3d9:2080:5929:59ab:840a:b8f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2ffsm4085907f8f.66.2025.05.09.11.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 11:52:26 -0700 (PDT)
Message-ID: <8ebe2bc3-dec0-4879-a61c-630b96bc4bec@linaro.org>
Date: Fri, 9 May 2025 20:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: I Hsin Cheng <richard120310@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250505184338.678540-1-richard120310@gmail.com>
 <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
 <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
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
In-Reply-To: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_115228_382848_D68E3E91 
X-CRM114-Status: GOOD (  11.99  )
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

On 09/05/2025 20:27, Martin Blumenstingl wrote:
> On Fri, May 9, 2025 at 5:35 PM <neil.armstrong@linaro.org> wrote:
>>
>> On 05/05/2025 20:43, I Hsin Cheng wrote:
>>> Coverity scan reported the usage of "mode->clock * 1000" may lead to
>>> integer overflow. Use "1000ULL" instead of "1000"
>>> when utilizing it to avoid potential integer overflow issue.
>>>
>>> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selectedIssue=1646759
>>> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>>
>> Could you add a Fixes tag ?
> Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types")
> 
> Neil, can you add this while applying or do we need a v3?

Will add while applying.

Thanks,
Neil

> 
> 
> Best regards,
> Martin


