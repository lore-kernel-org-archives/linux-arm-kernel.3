Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0975CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4cJaSvdyQCbEMb76mhwbw00KVaPl98c0awaqdZ3M8o=; b=VCV6knkVeONV+kQUMo8LJ2XVgb
	nrzZceDU2g7iEORLs4XLHSCf9sm3f2pboEqZOVE5F0i7xg+tzxmQ7Q6I/K8F3+PBzzCMDuJMdRzvk
	OAIw9IO9D/6nSMvmCK98erZU2gvVjdMv/rMsydM6lr0nG5nKsPh/BR6JngUPZ1iU4390987tkH+zJ
	j9TM/UiUQuK33cTwk3vSmENjuRS2LQXR5QFVLlwkhSolT7Mkg4bud1QepzXXiBY5jwamLIrS6/x54
	tPJVd6/I3ANQOMnB0pMOi5XXTHb52mEj9UG5RCUgfZPJRrIaN1R7WWs2hRUJB1+htf3J0tYahBhK+
	JJVc64fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRcL-00000005ScF-35H7;
	Mon, 10 Nov 2025 13:07:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRcI-00000005Sb4-0MLG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:07:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47118259fd8so20998845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762780048; x=1763384848; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4cJaSvdyQCbEMb76mhwbw00KVaPl98c0awaqdZ3M8o=;
        b=CS7QtDNWdvhvhoviMg6B7FAhFaJ/X9h2azyobTjN+9s/uwOftv6yA5LIl6XiMKFenQ
         R6DCQI1+Vh69Uf+c3YSgHHJJRaoJMCTUk0mS/41RedskBL2/3YshwFyJDBPcXqb6Qu9/
         6d/AECof0XFA900qCjW8j6V/epkJpViP4K6xPvpTih9uWq+GqRIy5SS/ZRNISFkAqlTr
         jNTcPB9oTqFkHRYHDHw+IlkxLH8X1DtgCqmA5yGN9c8MtSRyTKWcc1Mku0UUHa9cqt0R
         Hox6600GieHKjn7DK8THj8j+xQl/x5wrgDCzjQ58tjDUnDKke321Mqw6sMWvkiteQPH4
         U1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780048; x=1763384848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4cJaSvdyQCbEMb76mhwbw00KVaPl98c0awaqdZ3M8o=;
        b=orE8Je5wPORoq4xwpL4U0U75nFz0lKqT9013z+LzlejhcmI/RnEjGf+zOSxaFEf67n
         ye4SXH73C9KkAFoYyOXterlj97IGz88cZJXJYSNRYqVPCiuRVBKI9fqCACOXk/MgrhFQ
         ww/SufeLXGA9gZmWXIsHGEZIqiRQtukjPuPjoyF0l2bVwHswqAGSKfTahbkyXeB8IIRR
         HK6YPfmv0x4sLOSvxqrJFWY8JxSS8imuY4gB1x4YvFomgQ7d6OcB6qzXBpwFcvdMNarl
         mNCP5p3rurxXVbl5BEVWEzGGFrkufHWfcxlKA7WLgEfaZH4YMJ+vaMS7QTwDPxRsh0el
         bVag==
X-Forwarded-Encrypted: i=1; AJvYcCUAhaZOzLUP5ggP4JC/OKr7vdbZe2iA6ijJZ8Av2mDsn/ChHT3D5dUXNd/vCnhxw//NbZHf0rbokXqe3kfwzBSG@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxg+5WTmvva9S3POVtxXTc9Ok3qUCslMOx+KBUxzcqc/Hp7csV
	Ixu5VCa986HokM/JH3xek4cuFRahpF4/88e2M47LjOpE2Lm7ye3Sb1baRFZidbx7vSg=
X-Gm-Gg: ASbGncsoU1kf8sYyPD1cnc81Zfj75+QizB8l6rUKFy0O2Yx0oCwodZD1w+qNmk44SCk
	sTyq3WbH971WQv64JmH9nN+zhdOurri6GR6dN9EA/crMBnnwdyGsyLjUuUgtFCubjdijwLOuQVm
	UmftOvxRi/a4HpSinv+EwTn1SHHjQFkccmT7v6S9MXIkbn/KCmO/H9ZsF5tBKEVfE0bs+3S6mTS
	tmnwj1csz87bWFCIbxRb36UqI5/2iVMhlr8kxqrNaMn37xZMGy77rPDtYGMc1+c9SW4Y3YiEnO8
	x9BU4WVkLu6YlOEilEKk5yP01xNSmLswhozaPzHnsbqSmcxd5Pz7XVqoJp5EUkDl58+w9XVGJdJ
	QYIEV8nz4Mjti6vH6mKFmNsgfU8ia5SS6Mu0jUvdd13XfqRKCF7g0HE/wKAezI0zZ7wtCC5OzF1
	RTVZk96O0T3AWqV5D4aDZRFp/M711E740DCczyrHGEdCJzb6p5SoRd1X8=
X-Google-Smtp-Source: AGHT+IHcCOONTIlqmfkXgQ46x6qRMAz8cIzqeP6tpBIy8/x9/ya7VMOfAxTxh9tydHHTLgqTp1lvxg==
X-Received: by 2002:a05:600c:3b8d:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-477732308acmr85105745e9.4.1762780047939;
        Mon, 10 Nov 2025 05:07:27 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4776bd084d4sm252075645e9.14.2025.11.10.05.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:07:27 -0800 (PST)
Message-ID: <adceca49-acbc-4ae6-984c-5a8916aba8be@linaro.org>
Date: Mon, 10 Nov 2025 14:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 5/9] thermal/drivers/mediatek/lvts: Add
 lvts_temp_to_raw variant
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, Fei Shao <fshao@chromium.org>
References: <20251016142158.740242-1-laura.nao@collabora.com>
 <20251016142158.740242-6-laura.nao@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251016142158.740242-6-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_050730_188409_A6379C6C 
X-CRM114-Status: GOOD (  13.98  )
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

On 10/16/25 16:21, Laura Nao wrote:
> MT8196/MT6991 require a different version of lvts_temp_to_raw(),
> specifically the multiplicative inverse of the existing implementation.
> Introduce a variant of the function with inverted calculation logic to
> match this requirement.
> 
> This ensures accurate raw value generation for temperature
> thresholds, avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index df1c0f059ad0..31796a5b8858 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -300,6 +300,18 @@ static u32 lvts_temp_to_raw(int temperature, int temp_factor)
>   	return div_s64(raw_temp, -temp_factor);
>   }
>   
> +static u32 lvts_temp_to_raw_v2(int temperature, int temp_factor)

Same comment as the previous patch ... _v2 ...




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

