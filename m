Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B39E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/237DEZbmH5wVGbwoVnyMud2QLf/nwVGF7QU7PyuRI=; b=wDN2tp4sLN0v4Ew4oDMMhoe7ya
	VwS+jbaX/5agJqR5EAOKYTjFM5r3BJzx1LwiWwHXaT0jyK6YSWgpQfP8lwHAZslQ+ZFCjK+tYZGkh
	DmD/5nI+RgW0KCeg9sRx4xNXTzUfXh22blGcGljrslSDuaCXnMt7kRxbd1hVPDmDVpX/EIrA3eY5K
	DaxlxizruEdbHGJ/74ac76FS71oUbPceMvLJkthQgpwIDG6AaI0JVjvhxzoy1bfCeMpyiDvkUI2Wk
	RZnAelKLNlRQYbRJcAPKSnA8XG1+N8FgDpC2dOttUGjbl7/GuNcKSkWIoVxKfzLFKb1cNxYBjzzv/
	P0GE/MAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpZk-0000000BTmR-4BSK;
	Thu, 09 Jan 2025 10:15:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpYW-0000000BTUU-1VVD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:14:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3862a921123so476868f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736417663; x=1737022463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/237DEZbmH5wVGbwoVnyMud2QLf/nwVGF7QU7PyuRI=;
        b=peN14u0tkhj0bwGHlVLsaht4fAKeU3Vm+qkYIlXsQMAqyPF4PoFaIMFAXDpRLbIqUZ
         sY1V+PSejaZq44XEnOO69wYIU+OrcUXcaAHik2MzDZR2Q3mBpazrz/+3tUETnUJMMYt+
         PSZFXwfCh14Z9bVbGIb9gxJGviZcPFZggL8X70apAG+rhdA8RopWwF1M4ERfkknVmTmZ
         35JXzmLxvGwCy86JxV75IPBtvC2YWbf8oKmj6YiC5Rc4A70M/kg55QFua7sKiv5k0bxd
         aBRgSJxDd7XGZxTC8XH9VF/RA0Gi9721f7IY9U88mVutq2lg0e7FxFdqHwXv/IFs8ebN
         PVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417663; x=1737022463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/237DEZbmH5wVGbwoVnyMud2QLf/nwVGF7QU7PyuRI=;
        b=OheRyjyykZqqbY6jNhBbpcAMrC9stD+Y4t4WdSO3mqL74dxsO9IhJubjJ5B9uMFKtV
         NMV4d7FEKAJen/6djSPrPtLrsS7hcblet1ccehiITmAfr1GNT4RHrSvZKuwv2QZh6q4w
         Y1JGr6l6dwdCHy9Ukfr6Kch76H2w3p88/8B7uyBEf5hP7W3p4RydWfVFUcXPOUqQO77+
         sDdUNloMsxxyluoNwfm6qJY8P+Mf973EHI5rEWQp4U6rBXYMJ2IRRzqmOdZFOsuOqcW+
         IAb6exfHXMhzOxBk3S8J1dtFVc0INgM9XK5Hq+lVDtnPtzSOTgEYLHBTJaX18uqg9dEH
         83fg==
X-Forwarded-Encrypted: i=1; AJvYcCXCQdiXJ4+ae4Vhe7shqiGfteMY9aL5LKvP2ZGwkjMxoCNgt3Shz1WtyzEreU6MN2FrAwu6HJcQdrp2m3FmZVAo@lists.infradead.org
X-Gm-Message-State: AOJu0YwJy5ybjEN8A0450wyIoxtWi+ZY1JF9h5Kqqi92NBRdtugFEIkA
	fFnwnzD3MXWIeUcQzy99RLqPjdNQpxCkd5Texiu2kf/wLQ3g91Z8fP7rxY3tH4U=
X-Gm-Gg: ASbGncuFXUURF+KKIC24tGaoXIpVtxxNDDpMpvMY9qaql66u0ERrLZLyRTf2zubm/Gr
	fjM1RwKWwkJ1MvvQ2P0KGVIobs9EKfM0zsE74P9P/oMl7G3JlQbCJD6RluE2B6XiPCkC5tc7uDa
	Qr8/uNRJdRwv+WVXIpEbvxoKS+4NVOY7dt5h0Te0WP/mDxzo8mxf8X4WB7ZxIUhc8YN/tn2S0Uv
	+pSix50rZlVTLpzfHWYdBOVGwcBsSdMhMKXwTS0NHOzUDR0L3QxkIqrn/wW6jXaWMNgePtdaNXf
	eQQAj3yJ2rJZxR7Dx7e/0P0p7Q==
X-Google-Smtp-Source: AGHT+IEa1wvdA0r/Kzit2T66VOFD1pdDd/5gF4arR5cyzXkaJB7nZQwlEb/rszXxagpeRJrAJKWCbw==
X-Received: by 2002:a5d:5f85:0:b0:386:3213:5b9b with SMTP id ffacd0b85a97d-38a8732c132mr6080751f8f.43.1736417662676;
        Thu, 09 Jan 2025 02:14:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:125:358f:ea05:210e? ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8209sm1384847f8f.70.2025.01.09.02.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:14:22 -0800 (PST)
Message-ID: <5b891e04-be1e-490c-aebc-84c0ce2e3611@baylibre.com>
Date: Thu, 9 Jan 2025 11:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] arm64: defconfig: enable STARTEK KD070FHFID015
 panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
 <20231023-display-support-v5-5-3905f1e4b835@baylibre.com>
 <00af138e-4e00-49e7-945f-9c6e489208b9@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <00af138e-4e00-49e7-945f-9c6e489208b9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_021424_666241_505CD743 
X-CRM114-Status: UNSURE (   6.69  )
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

Thanks, fixed for v6

On 09/01/2025 08:54, Krzysztof Kozlowski wrote:
> Squash the patches. It's one logical change to bring config optiosn for
> display on your boards. Not each change per one symbol.

-- 
Regards,
Alexandre

