Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA8D26293
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sy76whdWsr2+0uhdxqV/7DmqprCp9p5S0npWuG2odvI=; b=xVc9PevMnjtp+o3dSIrI/ft37e
	sYUivVKQ6ga8oO6TxiWXvUQmrFNdg7DPueMx0pH3kuBc/5ht86Jy8g1ZDD+LJ1vWYqmYY307ipRJ7
	lZf3YSayH47Xh1o5hxpdxYGeGAv+MNmNzsXucIQxYusZMmFFmMRAInZfODRWvLr5rh7dlVuLEJuJ7
	dkajG21y2WAhE8NSzU6zAXTccEGQRCp+DZihfMW1e9HipzcI/55+/gA2ajtvRdhAtBXcytMUWSNNk
	4SIQJUgl5LIVs7SASJ8gW77+bLiOEgDo5KuRJKMqS0cbRi1H8U4qdEonTAlrHlSt3pEHlnnsjK9wd
	lq3KaWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHdg-00000004OOi-2Vlv;
	Tue, 20 Jan 2026 19:43:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viHdc-00000004OO3-3VVy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 19:43:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso40586025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 11:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768938218; x=1769543018; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sy76whdWsr2+0uhdxqV/7DmqprCp9p5S0npWuG2odvI=;
        b=igcWD/GOY3qJ0OBaOMAydzyAuThJgK5dp4AA9CumFxwtwauuTxAhHGoEfh2ctMLB+d
         MRQrPADBcOIILaYOjVXdlp3xMSo+EmiLI6gBx5SwZmQAzoEwLcdCNunePsaMZHo4/moA
         qcYUVIo2YxHto7Oz8XaYN2pc+X12Bx9Y6LKJprvEXr02grdGHk4XObnPMoHQv/uCB3B4
         juA8hk9+nJY1Rn35KCr0B/4Prs6ilN1u5ZxscN+79ANH0y/A7EswYes12rJFb1CT5K/m
         Iowc8+DEw1mPDAGZnlziRH+2yzh37MDjg/tUnKA84fLzGNBEdbgSkF+I4+R6ZtM5Z81N
         kkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768938218; x=1769543018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sy76whdWsr2+0uhdxqV/7DmqprCp9p5S0npWuG2odvI=;
        b=BDw+5FSpl9VWq7HPvJbGLuUwOcXsEmigIqcJOf0JLz9XQDznCCXNvf5ZRoa6e1HSTF
         7VI+pQ7cqLCwRSi0605TBqqrKK8FwwsxDhXGe+D+Hu4ENIgkjc9gXKrt11N1NXwez2Gc
         mlWJOnlY5FKAPwzeuzYeeHbpHAbKkQzRG23YhzM1CxWO7WGmPWYf1JTWUIiSiB1JAAsN
         Y/qzk2A+7RH+m0vQ8Wcbfy9ncrdqm8ge76VCxIVbckPzTF3P/zr37bwjA2uHcUx8QF3E
         v4Hc+x0974ThD2WHo9YOMocxcMsJ0yi49n7lgYWrqFSgdGxRDkpOqAoJP9sfS3MQ9yhn
         ZscQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi+/HfyYtjFlhLSr/YHwjXfqBEY9blNA2psUtfJJzyvQDmMckBIRBXEJWJGsF2P8acuYev6k2w127Zf72vg2fe@lists.infradead.org
X-Gm-Message-State: AOJu0YxFkzlsCjDVfvVYl03PTUN4oMYqyYOpjT7ELT33N1y/ThQnMhQE
	BIqSQI2h5TzcFTCsh9ijCzyqleqyeucYsNN7l3Q4dRiwuL9DymmFUOYBgD4EKEd7u0k=
X-Gm-Gg: AY/fxX60iX2BgaThi4lDSf+ROqqWp5a9+vhYKck+BPLHY3svZSNL41QWTYTcGegyBLo
	Dx9Yqt3kLfd/t89gP3QjcErzAlWPoPldLHWdPj4IiFQ0uPAudXVsmwk93T5pjyfez2h252kDLQN
	1zI2jRQgqvIERm7S6gvN31nXxgj1TGSeCS8ijZVC8/4Vl5pzq2h8zS7MDDFXGnMgtxF6FAeDM06
	Gv+poQub+AbngOjJBihkLTXkYeXaD5C/8Cm9fj4HOJiFmyVfdglFZYCNPJLkDSe3RTUqQz9lGcm
	4UAK3Y2cTNR2PebPQY3cRSaaQNMgOnUZog/Ss9obh9XqayxOV4nkbDguL2YMUlN+r6w0FxefXeG
	kYgz7EFMLPLeE5ICgXkyVZUz4DStnInYLjIE+okiG0AmE5vYd8uwTMkWvW76FWGMoWM/fOqhmjj
	+hWtHfMKrSv4lfKdNkGnsc8hastqOY8PlpzGsmdsc7P+cevbbBNIFPFj6OkSxsQ6U=
X-Received: by 2002:a05:600c:458d:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-4801e341e2emr173523155e9.19.1768938218443;
        Tue, 20 Jan 2026 11:43:38 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:ebda:5627:9bc:1ede? ([2a05:6e02:1041:c10:ebda:5627:9bc:1ede])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4801e86c1b2sm257889055e9.3.2026.01.20.11.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 11:43:37 -0800 (PST)
Message-ID: <b43cae11-e67c-4979-9e9f-b49a0cd640e0@linaro.org>
Date: Tue, 20 Jan 2026 20:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] Add thermal sensor driver support for Mediatek
 MT8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
 u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
 lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 wenst@chromium.org, fshao@chromium.org, Laura Nao <laura.nao@collabora.com>
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
 <382ef406-6abf-4d6f-9f0c-42b0bbbd6918@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <382ef406-6abf-4d6f-9f0c-42b0bbbd6918@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_114340_989591_7BCDF26D 
X-CRM114-Status: GOOD (  10.90  )
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

On 1/19/26 13:06, AngeloGioacchino Del Regno wrote:
> Il 25/11/25 17:16, Laura Nao ha scritto:
>> This patch series extends the MediaTek LVTS thermal driver to support the
>> MT8196 SoC.
>>
> 
> This series has been there on the lists for *5 months* now, and it still
> applies as-is.
> 
> Can we *please* get this picked?

Sorry for the delay, it is applied now

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

