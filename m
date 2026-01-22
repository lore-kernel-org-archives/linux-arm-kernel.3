Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9071AD3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rUR54Tyd17FTCOVGsEwV6x6lAtcghwoM6kBxhyVcCRI=; b=2Uq2bgC5s1oFOv
	0zQRVDfkPR21YV4bHqkJepNgEKNp/SdIGUc5V5XVeI/N3Ux/Fh5t0ku0uNHT/o75Fly6VhaMXlkx5
	q1AfeeMUFaMihnAmfTFVDv4ATMSELa+0KPqV7Nb1lVgoMbitkUxmk9z845EhU7rRqXs7UPEg6/eEw
	96+XmmfdSdjUdfkvUVMln4bpdjUjD1zsll+sro5FMLgkft0FBfKX3kzqSBqez6l7NyDhP7V9RTXKs
	W9JONBVnjb3eBGJB7MXf4LFpRDE3xdilHFkYtm/rRUf879QosgCBXtCZMEcxEd/R41WlL51p7dfW4
	2UC382bzVs895qa44Wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw32-00000007GYt-2HdN;
	Thu, 22 Jan 2026 14:52:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw2z-00000007GY1-0dK9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:52:34 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so1011345f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093550; x=1769698350; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUR54Tyd17FTCOVGsEwV6x6lAtcghwoM6kBxhyVcCRI=;
        b=nTPejH+G8djzOIw9771egx5EgKaedulsPHSj5TkjgAFf05Rzuf0UHxhlPPXQZofQ4P
         aVBAcBw7lxusofAWqvZt+avERTkDnvD5cAKdfOGgX7q4W3IfWCbRiU86X59WjV0q5F3p
         RWOCy2UvGLTjKJqZ04HKGKR4hLUsqC0Ippw8xIWie2tZTILuLTAh7wXoCAqh6diSJRTZ
         mMfNY6mSUTIJlDAzFwkr5+JOqVQKYvmTGbO9lgo6wjw7zwF5HmAKwANffZO6WPbNsAnf
         +5lZwlR5M9WEKSH0WSUp5pKiyC552UvLt3MVJpAuUxObdehh2sAC+dsAlCeXrSAFV4Gi
         XrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093550; x=1769698350;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUR54Tyd17FTCOVGsEwV6x6lAtcghwoM6kBxhyVcCRI=;
        b=we8nPlyYWbQS1PtoFF/zBH3AjHXxUlbuYnFQY3noJlaZ+gH9EDvsg87dRRgcbDX7k2
         L9c5yh/s3jl+6L+21WE4j24e21ULJwwU4vwzLEr9aqJj2vh+fQuzvkxTVvaxs/5aEwYM
         uyRQ7jCRTOeMQlqsxQ/dxxjD4TdcuFtc6L00E9kv0/rAlNN40df2KVhSXuxgZMRNoRFr
         12uh4FkQGP2Ux/EONefmfwYlueGRol22CRMlv7gIzKVLv9bZ1sVXbM2VCEzDMJOS4yrK
         DONrFgM+SH+heKL3OdRLAxsAItggBlhlEYXh6dD/f4jsM4FS7OkV8X6INDMLTGDBd86S
         j5YA==
X-Forwarded-Encrypted: i=1; AJvYcCUcyFMaoRP7FWfl4FsEiIu0tgeIMCR58MYKv48LfxDGwmTX8EetQF99DjWNJhDIIwFRlJ4FHXJZnvIyOuo/MObz@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoz6R6OK5Vxepjj1wxQ5QNXWV3VtLE4oMQlCzakbJKXugcS+AP
	u5FL0OB9qgZaIyt5WVvsBSOtlOHvNE7MJ8ln6czVdE4cl7lzNePQAYfh2Py+ydJ8LD0=
X-Gm-Gg: AZuq6aIZG9tl60Bg8vnMzCDwvU9lkm2gofcRBXWTdKPUgwrKArRsKb86ac707ScwUOk
	d1oPsSgskv4Xb5+hxHFcTvksxnFOpVsgFpN4TgdxD4km2oo/IswZ8Wiw1KrXbjh8jsQpFt27aNM
	fUBuTJ6dwRA0AAhgMLWryrbe6is927HZ1bmpDX5lDv3+O31BBD+nb3h4JgHhIJWk7gFeGhKnPyb
	zxOGatg9z1m1VpvWfgeLerVk/CvgZ+2Ms0e7xc66TLQpoQZfCLBNnlOXiRJI7/BrzE5HYPIK+yz
	QtIf05MH2TpmNGBESuhlQunO7cTXjI+KqeQhYlSe8Lpnoy4ibPEI3SjSm6j03mGsrPYFOfcRZyl
	LhAKxUNW1rjYrICvQrlHJcYM+yUtrgh2a9MXAwL7a9kMDl8DVkDKaswGR4JGdwYMF/PaLkdP4MF
	yHNpn8NIURSTMQSfQkek0/2HB8onyO43AU1eHCYP+aPdcEKkfExw5H7wjgXor/+Ic=
X-Received: by 2002:a05:6000:1acd:b0:431:656:c73a with SMTP id ffacd0b85a97d-4356a07745fmr33106298f8f.31.1769093550144;
        Thu, 22 Jan 2026 06:52:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997df75sm45715217f8f.29.2026.01.22.06.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:52:29 -0800 (PST)
Message-ID: <ffd5947f-788a-4fe9-9d64-6298840d0212@linaro.org>
Date: Thu, 22 Jan 2026 15:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.20
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_065233_273605_5AA5D803 
X-CRM114-Status: UNSURE (   6.01  )
X-CRM114-Notice: Please train this message.
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

Hi,

Here's drivers updates for Amlogic SoCs, a single new SoC ID addition.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.20

for you to fetch changes up to 31fce0d2b13e6a4a12c9ba016e961418f8c82e34:

   soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4 (2026-01-13 08:58:58 +0100)

----------------------------------------------------------------
Amlogic Drivers for v6.20:
- add new SoC id for S905Y4

----------------------------------------------------------------
Nick Xie (1):
       soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4

  drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
  1 file changed, 1 insertion(+)

