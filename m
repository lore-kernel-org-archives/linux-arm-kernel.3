Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9ACC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=; b=erK6eC5XzLUbXshxCioNhu0FOa
	4FksHrgVqOXEATc5fvPIH+F5XNtx/GBQ7ggUZt5i2rz2TlEIuEluivsHURXG2DWB4cZTLgfRH8f0J
	kQVs2RHSIkXaAeQFjqnURPo1I3JXCCZlBjYbrQXo/AmwJq/d2a5Mh1FvP5kL0txIVVWrhQkrN+GYL
	S6EH61HezWT5zJaUo5eCuM4GIVzPBc9XkmHg6ssHNIci/rZet9dc0k1a218KH/0bSDJFd5cpmPqfH
	FF18o3Ji3ZccKNIcM6LqQxdtoZw6CXV+vmnb6Vc7sLZbns7JfRbP4N31YevShWzuYFlXNqCnHbY23
	WKTaMgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPHv-00000009q60-3552;
	Fri, 07 Feb 2025 14:24:59 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPEa-00000009pc1-1EBq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:21:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso14618935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938090; x=1739542890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
        b=iahGvqnzN7bkkkVW08uK5VbZ2ikQrVNWXDsUnlF2Nb4H4qoTL0XnB7ko+uXzCi+I79
         XaOv1XSL772wJuRTxNB3K9VTylAhlnVZ53oJy4Uis1raD00FFdhdoLfAD25GPuEsg7Ah
         cKF8dPATJLDsSfcUpsbEyfMQUBUjramJ53DAeCP5Ahc/HZWuDvJybfUVhJk5o/8d9EWU
         EHYXYXm7bKw2FHXWPHZ9Ii+2xiIatzQmVFkKsgoq192Fjiao25uTIItO1D+nq2f1OMgs
         SA8o6cj40H2K3sfC6cvzMrXIMcXP/pgJqgKO9jwd4nMIylnLy0FVJ1h7UFIptmOMLWte
         iYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938090; x=1739542890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAwcnkM+PzRe51c/ss1O+62EsfQXolXBWlx8ljeQQPE=;
        b=brjMTLRWrMmCBQeZCt0lZvTGrEXkCdT+/MsF1LBZekc9eGpGJT/8QG3tmePj/h0y2k
         VeskLvLVS8hPXdlhr039XPhxrus6ovcVM8ri39W253Om7fSlc10o3a0gG3XQS70fIBxC
         K9WDhUpSsGdr45NVeJFc9feVohlhiiQzX5eR/iM8IfKxzMjjXemQxljiuDcMNmfYrK4Q
         OJnLqhDXDrxgTH8RiXmm4wQsOGreK/eJk0DUTkJeZ7Honk69wvgdEAdhnMa30nv1AdcT
         XyRPAhDiJs4ig1zcUaR9s6yK1CvNYc3uG7+ikyuNwM78EkXUASxr0Iv4NQtGgO/rY+fD
         OJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3yVj+yFyF7jv4/Q1P/ODult1BOZtf600i6UYAl+3oAvwWGmkMqH1KfIqqIjGD9aeR9kxUtPH7ZZfDzLIy1LDA@lists.infradead.org
X-Gm-Message-State: AOJu0YzwQvtxClLYtACFdlnOrYbgHQnuqgsdKQl0JZdNFJaKPqn4BgSI
	AWtUymKhPq9n8QazVTvF9vKj6n6fbbvn1IAIdU5kmWVqr9jz22GYW2KocVBHKew=
X-Gm-Gg: ASbGncuBOV+I6suXDpAvHLuVvhzkaSVl2Rg2M9dWcWyoxeayprWJ3XeeTMVmYY2mx4h
	U21zRpKtOB1On48uDuiTo1aZZ+/Kgi+td8vSTxv8SeYemB56iJKsQM34zvih9V19NsruY3DdmUL
	D/sSuPGMh3n2g+/PnW6tgEwagTvzIMKdaV+zPAu0cTWoOD+UHKaWppQ6PBq0Oo2osuHU/tbJQYr
	Czl6v4nYc69OIKsDPrSVscg37/VbCqY49BtxwFB4bFYwbDpBhrdsZWfWV03i8g8i3KvUPY64OUg
	53I/eqQ5kUX4Lrj/LHZcQsbHiOQV1CS7fdPxC9KStaol0xmIyakLTLMeQRmwUvA=
X-Google-Smtp-Source: AGHT+IHsAn/5NuVWMfrT0WHyD1iRvhJHcQ1HOD5ajIz8v5VPfyCTgBqaPudj3dtejQe1G4pbiVMvEw==
X-Received: by 2002:a05:600c:1c8c:b0:434:a468:4a57 with SMTP id 5b1f17b1804b1-439249ca925mr25071915e9.26.1738938090624;
        Fri, 07 Feb 2025 06:21:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391d5283b2sm58939355e9.0.2025.02.07.06.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:21:29 -0800 (PST)
Message-ID: <f2e04ad9-c846-40e0-80c4-1b0e443dd14e@baylibre.com>
Date: Fri, 7 Feb 2025 15:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/34] drm/mediatek: mtk_hdmi: Convert to
 module_platform_driver macro
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_062132_323530_3FB25856 
X-CRM114-Status: UNSURE (   9.03  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 13/01/2025 15:52, AngeloGioacchino Del Regno wrote:
> Now that all of the mtk_hdmi subdrivers are a platform driver on
> their own it is possible to remove the custom init/exit functions
> in this driver and just use the module_platform_driver() macro.
> 
> While at it, also compress struct of_device_id entries and remove
> stray commas in mtk_hdmi_driver assignments.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

