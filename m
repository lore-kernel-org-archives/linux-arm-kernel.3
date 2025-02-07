Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA74C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=; b=0ci7686pKJK/ez8Zjkjrf2at77
	1HiHfA7/0MHNMaHWjmuAO6j7aWSIGsIyqfsD/aDqPM2SDF5S4q1QHpEjXwaI6uU0aDsHXPag7FgHJ
	7CSNSXxCPPFfu+81XqPY9BuI6URngVt/dtKk4EJqvd1TUTyVeJl5ONMZu5kPc+RkjwTjhBxuWXw3C
	U1QlxuKXenIWZev4z099fcoqcxvknnL/7MP3lqa6q9NKn1aspD0FWAvQsDMBZlZ+6Bq2V/S6YNHFq
	xJ/GXxLsPKp4w9QbpYEUxUF7vYrY16DXHlUMhjCm53DPS0rg1T++ONwVoZviuTu4oFR+F7pZzSa0f
	mdyMQJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPGa-00000009ptS-26I2;
	Fri, 07 Feb 2025 14:23:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPE8-00000009pWh-0ScK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:21:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso14368265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 06:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738938062; x=1739542862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
        b=xTopoJSC5b4rJMflVJ1QyNOavI9fn83BmV6QYtefUSXlSbSoR7iNNu5ALRMv/zcNsD
         uj32bJENGpZkbmzwIS6l4CrY8JSm2huQw5YTuxwrSW161ah7KFoxjcWs043GgHDj+yFY
         xBnwja1AGsLJwU8DEc4izyMvfi45cI1M3GeSqPNncaYB0+sL7xa/ZcqFIKi+MmonYvai
         RVlH7TUkLO6Tl/9tJ49hcdsw52ciQZug53nZqqxxfbCf3SPwIjR45qN+eSfptAm0Ibty
         N/RBoLs9xg1D9QhFUV3p75YIY9rpD8XGr7LNO21hltyAYdBFHgi+AfoAySHTjVFEo6Es
         lfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738938062; x=1739542862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDisuTD3ZLBeOSNMxc2GUk38TNgB9LS+VU1agrbB+iM=;
        b=OVEVsr5qiD4KODwC1BjnAq5jJQpewtjTx+mTiADjHBHE01IEGxBBOY9EsgnGgj1Zx9
         WndUi9KOHLgRDE8ql72fwZFp8bGJnGZjfAYGwROyfxYm+4P7f2wZhtxxUNQD5G4oWduy
         1OtzbPhYCnr5KkhNqJu7Sow43o0IKkDdSYlSk2InFe5pVpkXfICEtO9slZJG4VCyzneD
         jzpZHnKvH3EKFLshCxnYdPxtsD6BKnAiGyzLdM9e9Um5W4+2Kz0dg0eAssImIy8YFT1t
         vfPURGdx3dnvegUr9OxRRUbM4wppUx26H7yKdqZ8zzKYy2kolZGZWuIzTWByfuyZ1OVF
         ydkg==
X-Forwarded-Encrypted: i=1; AJvYcCVdkNlmT1Gro1+F0V1wojhyrAFOb2l92Zn1jNbe+V1UfWga78Ip97DCq9IuoNG/lnhAQi/owUV+n0LkPvzKPT2b@lists.infradead.org
X-Gm-Message-State: AOJu0YzAp+C90RfncZv37VMhcZgDQowEfcIKiRTjiGv7rZvr03rz8U8d
	HZ1E0/8yHEXM9V+TeEWJQa1blQZi4r0wnPtfPvx/oab0OcfjT/IoAgYKc2oZm2c=
X-Gm-Gg: ASbGncvfUhebve3Q0v8PmGUXhGrBxu1Isnm3VHKJvXDikNoOC+2NaL/0/YNipqJk9p/
	FnPgP1NYRwmNNHQPdCFoP4CSnfLMsC3XspWLZneR+2Ti+LpmEjlTfB2nygReIpt5Jq472Wpti0V
	Yi7IMdzrbIRqCGz40IbMoVUZfykB+EF6m+Hg0DCPUqQ7KYudL9tqvpTmxsLpSj9GKKiZL++HU7c
	qKgiyg/RSVRBc/7++iUI0h3P6SlV1bWE2897m4AMgI8N6ugTaBB9QsH1ISIFvoRu+P0BtKu4ARi
	WKPEzU+pN167INGoYLFJqPFDr3yZFkgKPBu4V1uMgQSUbpeXBDZSkWGJh0RZlNQ=
X-Google-Smtp-Source: AGHT+IFxDkESsH4G5gG1BU4H7B4x8RnSu0oAxMNZ2KGruE88D1fDp7b1Y1apydP5lwwz3pFDUdKEAA==
X-Received: by 2002:a05:600c:c19:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-439249842bamr30302495e9.7.1738938062277;
        Fri, 07 Feb 2025 06:21:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8? ([2a01:e0a:5ee:79d0:a437:fa6a:2619:f5d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9656fsm58840305e9.3.2025.02.07.06.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 06:21:01 -0800 (PST)
Message-ID: <8af4e0cb-4ac4-4ca4-ae81-6b5f7a06bf3d@baylibre.com>
Date: Fri, 7 Feb 2025 15:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/34] drm/mediatek: mtk_hdmi_ddc: Switch to register
 as module_platform_driver
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
 <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250113145232.227674-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_062104_151867_064B0F8A 
X-CRM114-Status: UNSURE (   8.48  )
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
> In preparation for splitting out the common bits from the HDMI
> driver, change the mtk_cec driver from being registered from the
> HDMI driver itself to be a module_platform_driver of its own.
> 
> With this change, there are no more users of the mtk_hdmi.h header
> so, while at it, also remove it.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

