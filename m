Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E40C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=; b=yKrm/M9pk9TMim
	zUTDuSyQrMl96eB/JFwMA/GRd11om+471r42VIgbEoNeHOSSHUp5Dbi1GG3ORxC+qXA7TElMCPIqP
	jATnnZL+s6xCt/8nfE2KevVFXXEeqLj/lraNQhfAiBxcazLMQ0pkQcW6L4FuxU13bxMNq6n/RLC2u
	X4Ub1kWs8BvvffmYRespL142toBNWPDfZp5p10lPhSzMLE3Jg9qmOPjAz0JNVEA4p0WKFgnEIZbDc
	Vrom+fcpWWlyUBMl3eua35sp09g7g16VdmSCgtM5meMxjDrioWxx5Puo8A2oMKvJaHWpvK7xCn7VU
	Rm/JtSXlcFX1DarnxzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppew-0000000CwYa-00B6;
	Fri, 31 Jul 2026 16:00:30 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppes-0000000CwXp-2zHC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 16:00:29 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so1917564a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785513625; x=1786118425; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=;
        b=eogdYpOqrIHPxmFNFs2MG49N/HodfMd7voZiCkUN4olfbE/cMtB8B5i3UzlYSWJtd3
         3sWOz5ABZEnr7WglXl9qq8raXDOVeZArJ5nerm1vzIFXKwr83R7UiG2lXIBb1VxqTopS
         aVM5n8IccVpYgNJNMtcESkXN7T0w2BY6lqYGI7y8V10hhtEf57bO3dSLp4qIr9MCSdqF
         +GBShumiNkn52pzSKZO6iB1YsQpLVqjU8Ouh1dAMalpA9JhKiDb4pstFihDOm7onaStk
         zpCZlYs4DKFjsVI8t2eoTeMS/HsMxh8BKyYCvqAjZjzwv65Va+BqaJMJTaE3NUqRaXWv
         +gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513625; x=1786118425;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=;
        b=AewCtXn28lXP3PtApZ1BmnCLukdWNAhe8fFILq9yRgU4hi2jHNqUVefDJjB7P7aJbi
         XKdyucHv80/Hj6FZ/GHmwI4rj+kWsGRizw+i3EgbGTLOjt+6xlIGkNbJiyUsQY99Zz/y
         /1MBaDijovpofkuY7r2/Jcpw2uDPFPsnK9OsKuNSOXKSVBk0nTlHFkCiSqtB2W18SnWY
         ntcuZv9DoWFHOApMKTApTGoShOD/dOCEVPefN2GAIVC0py3oXPQ3wHoafOjiM7aGB2FL
         AUKTr0R9u2DL0DWUGqH2XRGqXf4u7DEq4mpDBUGD6LfAmbH8WurEdgMFubBQ1tsBJjvp
         /Z/A==
X-Forwarded-Encrypted: i=1; AHgh+RpTLSH450fryDe3AcwUkdkQeES3AN7grBi5b+likztJQxD4y8B0ESFQxPrck/tnA7orchp6EuFiTV9cUcA3S25g@lists.infradead.org
X-Gm-Message-State: AOJu0YxznJu1j/Np8J4MzcpOOTH8diuHzA1FEO+2Ev7v8hpuNvrYMjJX
	dUaHx1haqwWLVobZhgiEmwZkrw2fH3N5RAEzHzxopLAIbNdJ1txWrAORJ1xoR+9N8II=
X-Gm-Gg: AR+sD11/ptGkyFqh/a38c1NoDBhrFcoIe3yuKZ6OXgmltg+6Na82XQ+4TKTJlPQvYIv
	uBaOrDFKZZbBh1J2NXxIT0wTx/88KaaLMcdMVp0sZTXs9LS1G+F2XONDw8RvLMkNy+I0ynWZ/PT
	RdK00tZHITttlmkNCL06qBWrJuju1Y07yZSwSjjJdEn82ad19U9u4oDHNaiktkWYLVWHC0r4ug3
	Z7+EO7TQNufUakfR47jzFpbGW0wQSDhPMQ456aqmFhRfqwyp9WM1JsarLfNGpdtkdAqsAR9NhOV
	z7skCmYjeF1aPpGBEjtjXLN8M+jtZUaZZZverb6OPiNKXvNu2s5soyk3r7LIEjWQQ3Cj+BOnXLP
	V4HntQzQyKxjzcCgZtjHm/4hh+gil+gb4smxwWY5C31+R17yvGTD6bE2jqrw+jy9YBKORzEkxh/
	gV0v0+YXe48h7HHp7wMuqkCZCyQNrw6THFx8bxh8Ut7JyBKtlSJynmYi6BZWrmvIZsldhbq/W0/
	MWU3E87sQhiOFCZoD9R7274S73QJFNlVz6rhYqUiw==
X-Received: by 2002:a05:6402:5305:b0:698:52b4:c2c8 with SMTP id 4fb4d7f45d1cf-6a0a7d13b50mr95707a12.34.1785513624522;
        Fri, 31 Jul 2026 09:00:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm1894955a12.27.2026.07.31.09.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:00:24 -0700 (PDT)
Message-ID: <41698506-1585-4b8d-930e-91a79b58b833@linaro.org>
Date: Fri, 31 Jul 2026 18:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v7.3
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_090026_774342_DECD0D0D 
X-CRM114-Status: UNSURE (   7.15  )
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

Here's drivers updates for Amlogic SoCs for v7.3, mainly fixes and new
SoC support in the Clock Measure driver.

Thanks,
Neil

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v7.3

for you to fetch changes up to 67481152be2ec5de3529664c82054b43d6d4b9f5:

   soc: amlogic: meson-clk-measure: remove debugfs tree (2026-07-03 11:52:17 +0200)

----------------------------------------------------------------
Amlogic drivers for v7.3:
- Clock measure debugfs fixup
- Clock measure support for Amlogic A1 & T7

----------------------------------------------------------------
Jian Hu (2):
       dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
       soc: amlogic: clk-measure: Add A1 and T7 support

Pengpeng Hou (1):
       soc: amlogic: meson-clk-measure: remove debugfs tree

  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
  drivers/soc/amlogic/meson-clk-measure.c            | 286 +++++++++++++++++++++
  2 files changed, 288 insertions(+)

