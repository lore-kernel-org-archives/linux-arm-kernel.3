Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC9BC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiUuiG11sjb3RVF8qKsN43KHgfxfg8lfjAm8EVRs7z8=; b=Cgdto/FZc6Dgu6qLZeewlfJp5O
	yLJ6J7p/F7R58mRmZtzXfcY9jimrxyP+pF8Bl4ZWJ3je7LvYVY6FE2uaEWLJjg4bMfGyQa5mSIAen
	MHpWOVVUmU9fJx9D99UvE9g+wOX+8N/sm59ZNT3gHbL5VGfzqNb9B4xJALqU3F0BcY28OpSt5+ZtF
	FQTiz2cr4mlrfpofcTuSwij84zFB86LOXHVM3SZG7KAKnN1X6o4FsUIg1p0dOpkmAwTuTa6S8lAQe
	6gRYOoJd2gWpN+o3b9sUj3wuKn5se3Dm49BCQWTpMZCCriJrWXUfdZpDzwQLDHU2uT4XH9MV5Rx7d
	ry9sv5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmVM-0000000Bbu3-1Mzq;
	Mon, 05 Jan 2026 15:28:24 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmVJ-0000000Bbt9-2AWB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:28:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so488435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 07:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767626900; x=1768231700; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiUuiG11sjb3RVF8qKsN43KHgfxfg8lfjAm8EVRs7z8=;
        b=AWKl+DNe7w8bsXqZmndFQCkXBNXbaDxzOs6jLoqxU+2irhvxqo7UveaHMEo1bcvMhq
         fGbUpnc8HbhOUP28i607nQiGdTs4CINXdVEH5LqzYfHUO9L2fzzhKt9V36s5lGfO1Zxx
         19PItoYhwGfA50nRXdWvp1nP711yK9AS2P9uj+KwpHP26N++Efp3hWR9NNYMRMhQz5/B
         wp7RBzy/FyDBd4JRrpjmi0fwEy8TL0+wtGCyctHEVtnGYb4ovd5gBafoV19udvA/5Pjt
         5mOanOntO7ImcRwOW/7do+UEP/wi4Ok1XHpuI8M5vqjxxZ2Tf73KFRVfUXyW904ziKyZ
         MCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626900; x=1768231700;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiUuiG11sjb3RVF8qKsN43KHgfxfg8lfjAm8EVRs7z8=;
        b=myGdhkJlLpiw1dU7US3s1gR+R80U00FAQq7Vf2y5ISXRWgM3g0Gxkr4F4O6wjh4bkP
         45/e6PfUl5JT9CKswGkzZhw5xWZQs4TEpadGk0j33y5QkUK9xVNJ18vKqxdd4UbZ/mza
         iXbMbPna2lmqs0iZNbfgIdY9q7TutDUiOqFgSzaxhMPRyVjqrhEr7WvscI67djLXyvA7
         0p1xBRWAjR6SWJjY8tURDBR0w5jy3Pi7WpLioZ1w8Y++cjij0Q6ZZCsqiLPWago9Tt26
         213oGvEV+BTlAQ6NywW2f4v0rvuZ37g15OfvVXRRwMMZ0RLJ3ODvqoCNXu3Eeu8OzFb2
         rabA==
X-Forwarded-Encrypted: i=1; AJvYcCVBYlxlFdg24eGUbkhItSp74XqZe36lASOv5WXly2FjMD6o2IGfNFfe8xyhAPo3bO7g7lS7JkHVf7xewuCjXg9U@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg/VUMiAOx2+lRrcNA+m6heAI3mXifFYduKdkThCSU7DOcCfVO
	Q/8jlVBctbm1tfLsbPxVMqJNMhfEOncIqHFl97gRoAyssddi1v6YX31H+M1neqKr2kU=
X-Gm-Gg: AY/fxX5jqQbq4XfmeclzGGiJCFtlwsXvasuhkqxbyWX3a+g8Rn8GKc/q+sQ12Gg2TY9
	PHQgSdt+6Bqwd2ogggKUqh+J9MXYj2ULpyR/NA/U4SpvBOcA7peVZFM11MYiS24dIfsO2HE6fFT
	kLY/PQw/ubo5t8rImQrIpisyQJQB2CTTEXA767INGWsGPAF4X3kpBUn6pnF2r/aZp4KdoZcVhMt
	X+8OQA1SRao2giKKq34Mjj+DvboA3GXSEh4ISx+HW8TdL4mK4sxpcBh5ToXYIfUv5XfXutTfUFC
	huVUj24NrwwCW63vhmudCCkEcEvSk1K7HZ38Nm9tUg0ojfcX3kMTtKxl91Xc4BFcXF3uWeIsQxP
	8pQ9DAslGXJDmTK4TNGCiEdu7AEIkKkc19nMp9k58FQBJNb0hQFcRjtAEwRSucZqkJyd2oHVoet
	5Sl4JRume1BSrA+M3SYhH6sVebWMtBF/Xg/FTbXsED/dto21alifzqxP8JevAjZVg=
X-Google-Smtp-Source: AGHT+IFE8e5sC3B0bF5zrvpWL/oFWYMQNfCjja3Nw/1swqUnOWasg9DxOhRiNiaKDKikllRi6k1+zQ==
X-Received: by 2002:a05:600c:a0d:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47d34de634cmr534951085e9.12.1767626899465;
        Mon, 05 Jan 2026 07:28:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452c69sm198773955e9.9.2026.01.05.07.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:28:19 -0800 (PST)
Message-ID: <b671ca2c-1fb1-4c4f-b0af-45dd33402b0c@linaro.org>
Date: Mon, 5 Jan 2026 16:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH next v2] phy: apple: atc: Actually check return value of
 devm_apple_tunable_parse
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Glanzmann <thomas@glanzmann.de>
References: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
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
In-Reply-To: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_072821_599703_E050744C 
X-CRM114-Status: GOOD (  19.85  )
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

On 1/4/26 22:56, Sven Peter wrote:
> Let's actually check the return value of devm_apple_tunable_parse
> instead of trying to check IS_ERR on a pointer to the return value which
> is always going to be valid. This prevent a oops when the tunables are
> invalid or when they don't exist:
> 
> [   57.664567] Unable to handle kernel paging request at virtual address fffffffffffffffe
> [   57.664584] Mem abort info:
> [   57.664589]   ESR = 0x0000000096000007
> [   57.664595]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   57.664602]   SET = 0, FnV = 0
> [   57.664607]   EA = 0, S1PTW = 0
> [   57.664611]   FSC = 0x07: level 3 translation fault
> [   57.664617] Data abort info:
> [   57.664621]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [   57.664626]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   57.664631]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   57.664640] swapper pgtable: 16k pages, 47-bit VAs, pgdp=0000000b4391c000
> [   57.664647] [fffffffffffffffe] pgd=0000000000000000, p4d=0000000000000000, pud=0000000b44188403, pmd=0000000b4418c403, pte=0000000000000000
> [   57.664670] Internal error: Oops: 0000000096000007 [#1]  SMP
> [   57.665047] CPU: 1 UID: 0 PID: 23 Comm: kworker/1:0 Tainted: G S                  6.18.2+ #2 PREEMPTLAZY
> [   57.665061] Tainted: [S]=CPU_OUT_OF_SPEC
> [   57.665066] Hardware name: Apple Mac mini (M1, 2020) (DT)
> [   57.665072] Workqueue: events cd321x_update_work [tps6598x]
> [   57.665100] pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   57.665111] pc : apple_tunable_apply+0x8/0x80 [apple_tunable]
> [   57.665121] lr : atcphy_mux_set+0x3e0/0x1138 [phy_apple_atc]
> [   57.665133] sp : ffffc000802a7c00
> [   57.665138] x29: ffffc000802a7c00 x28: 0000000000000003 x27: ffff800016c84080
> [   57.665151] x26: 0000000000000002 x25: ffff800016c84090 x24: ffff800016c8408f
> [   57.665163] x23: 0000000000020004 x22: 0000000000000001 x21: 0000000000000006
> [   57.665175] x20: ffff80000d6da9b0 x19: ffff80000d6da880 x18: 0000000000000002
> [   57.665188] x17: 0000000000000000 x16: ffffe22de59e0e38 x15: 0000000000000002
> [   57.665199] x14: ffffe22de76ecff8 x13: 0000000000000001 x12: ffff9dd5f90bc000
> [   57.665211] x11: 00000000000000c0 x10: 048abc15ceba0919 x9 : ffffe22dbc5fde10
> [   57.665223] x8 : ffff80000175e0d8 x7 : 0000000000000004 x6 : 0000000000000000
> [   57.665234] x5 : 0000000000000001 x4 : 0000000d6d132db7 x3 : 00000000000155db
> [   57.665246] x2 : 0000000000000000 x1 : fffffffffffffffe x0 : ffffc00082b80000
> [   57.665258] Call trace:
> [   57.665265]  apple_tunable_apply+0x8/0x80 [apple_tunable] (P)
> [   57.665276]  typec_mux_set+0x74/0xe0 [typec]
> [   57.665315]  cd321x_update_work+0x440/0x8c0 [tps6598x]
> [   57.665332]  process_one_work+0x178/0x3d0
> [   57.665346]  worker_thread+0x260/0x390
> [   57.665354]  kthread+0x150/0x250
> [   57.665369]  ret_from_fork+0x10/0x20
> [   57.665386] Code: e69a0ae8 ffffe22d aa1e03e9 d503201f (f9400022)
> [   57.665394] ---[ end trace 0000000000000000 ]---
> 
> Reported-by: Thomas Glanzmann <thomas@glanzmann.de>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Changes in v2:
> - Copy/paste error: Copied a WARN instead of the kernel oops this patch fixes
> - Link to v1: https://patch.msgid.link/20260104-atcphy-tunable-fix-v1-1-40bf00feaac0@kernel.org
> ---
>   drivers/phy/apple/atc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index c8a58ee64b7aad3205df51cf16ae778471ad2c5d..716c1e70de38ca604803739fedaa543d91f7501b 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2178,10 +2178,10 @@ static int atcphy_load_tunables(struct apple_atcphy *atcphy)
>   	for (int i = 0; i < ARRAY_SIZE(tunables); i++) {
>   		*tunables[i].tunable = devm_apple_tunable_parse(
>   			atcphy->dev, atcphy->np, tunables[i].dt_name, tunables[i].res);
> -		if (IS_ERR(tunables[i].tunable)) {
> +		if (IS_ERR(*tunables[i].tunable)) {
>   			dev_err(atcphy->dev, "Failed to read tunable %s: %ld\n",
> -				tunables[i].dt_name, PTR_ERR(tunables[i].tunable));
> -			return PTR_ERR(tunables[i].tunable);
> +				tunables[i].dt_name, PTR_ERR(*tunables[i].tunable));
> +			return PTR_ERR(*tunables[i].tunable);
>   		}
>   	}
>   
> 
> ---
> base-commit: add66a6673bc4aacd0ef0f3c4a51271501770b17
> change-id: 20260104-atcphy-tunable-fix-517826d6fefd
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

