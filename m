Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68DAFEE4ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DsAsZ47Hy1YLfVUDttBLQyIVj8duDK0V23RicKiO8s=; b=EoCWVrDOfmOE9xR61e8Yiyunuj
	gktNH8t7Rk4jLLlxeGd1uz1omoGGI12lgHFrrm40BX1FL01geRip6Zc20NuwWsCfDcSNlPIqx+27K
	4wr5kOytA4dEYjIQjEwEVOlZ+ZUOUUmA0Esaul5xnqw0WvVi0rQSFqGYjuVdVhGOLG05z+5vKqKYl
	q+JwU7MKuj35k8bk7cozW5FO5HAVEKDUE4DNkN02JfoKS6Pu7P/EuLPmhaDKK8LO1TQ1/lJcBtE81
	1w52oEBfmOrwAlDldNSKRpYTVGHlGjQBLaBMPdftcxzQLc1lYrQAkZ2mYKS4fNpXhpl2JrIM+L7vM
	G5dV0n3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKt4-00000009tfY-0PZ1;
	Sat, 28 Feb 2026 14:01:42 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKt1-00000009tes-2zTy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:01:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso25946275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772287298; x=1772892098; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DsAsZ47Hy1YLfVUDttBLQyIVj8duDK0V23RicKiO8s=;
        b=lzNhpMeUgSYgIiar7w/6ZfsZn+ikoxxvi90eRE0x/knOkChohHOPXrCs/058qXUQbY
         AWMIeBpzvyyqapH75B6l+yJQQ3qD0vwRnRem3J8lH5YXzVm7w7GejMg/hLHXRvX0FJXn
         p7gpScZMB+hRygXAI3O7cQRqBJIfvGClA2RzlA6nu2MHVLE3CCrv78h5GHIlaqHt4YoR
         SvnRFZUsmnInFmMIo9PYj/mjGbIDZMa0XoStNRlwpfJh+mtW433xbJNMMj51P5mzjYyG
         j3nsiK5S+Ik6c2TLsu5JXB2yXkb0qiNTJO+ca2hE6vA/ZS38jx+Ng9XP96rBihSrla3X
         RrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287298; x=1772892098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DsAsZ47Hy1YLfVUDttBLQyIVj8duDK0V23RicKiO8s=;
        b=Sr+nDlTrufdeRiyjaEnANa/9jEgFqucdQbpuCp9cJXlnL0vPR0OXFGqS/TK0qnfMlU
         AExPZmGIkLL7PwxHwYIZm/NCIdERylDU5v32xvg2j+MdPvOp/bb7DB4UO5hazPFXBEUj
         kEIoxE8ZwRFctvdUpd9NG/AmKMoOREiqg/TfVRer/yb2d/be2hU6oBU48wPO/7NjnWy+
         lE36l8cxkMMOlJCh95oVyFgd3QbUbupyRmsv5GE3GA5uWuYlNEon+NXVxbPVcYjhpjOu
         ww6/2Up6klWPbpqO/yXo+8yVate9BCDLI7NpUmXa+wHu3VUsqY9UXsxGOWPt5Ww1AZTo
         YaEw==
X-Forwarded-Encrypted: i=1; AJvYcCUuNZyTe8Qrrs/pnsZG/qhDXvj+asxzOMQ3Yalt+MHpwMQDPDLFUnMAJpfm9cw8h8EZLo//tsWbZt1rPy08hEGW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc3Ooa1JcvEMLxFqotOCyX4uFs1okZ8Y36A9OktuQ07wEje78v
	ZgatOWxtjE1eAtszZczYrFMhGa1CQAEqYqa2H6BBxmbj0hXx2P1ceKUNLjvc3q8J3Ko=
X-Gm-Gg: ATEYQzxAA7jmqsazBt25KqgQxRxmot2pU7Ophf9uWLJEdQXuleR9DXJUOs4AcY8Ds5C
	LiyN6ZWN97C1qMTRVtjBMSH3v1xZjGGOVnW0crj2XBsotl1hdgCffe8HY/KY6t5dqqYRu7GVaJ0
	+Fjw5I7J/f/5QlQF0RP8iQ1GyyIB3gEhDP9EHeSgHpBlzG36InXqqY7yMUVeG/QwtULYG5LV28B
	/bGhRcZ4r8MIR5KNXC3T+T70lV1nZEg7vZ8TUiXrTLMb4XqQQMKmG0jUVjYoSaX+Yd7L5LThIq4
	RCYra+m7KpevEE6W4f4gSwQq8FoGCTJBoOzMFHDBeDvVRrNRmGZ5MFQ+HztITJkke17kdQyhH9v
	fF94tnpXBe8maTlvML4u/DV6thInDTy+cnvUs8n2T5PWzbvvXeZ6jNAcrwETud9G6M4SLSI+kxZ
	vIyaGEe2pE+YxaNqXA3oKzJ/M1gjsi6Ppu/oWtjXuk
X-Received: by 2002:a05:600c:3110:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483c9c23ffbmr100960715e9.24.1772287297776;
        Sat, 28 Feb 2026 06:01:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb84e4fsm81020975e9.8.2026.02.28.06.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:01:36 -0800 (PST)
Message-ID: <49e7865b-f1e4-4e7f-88a3-31f2b05c9072@tuxon.dev>
Date: Sat, 28 Feb 2026 16:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ARM: configs: at91: sama7: enable DRM hlcdc support
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-5-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-5-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_060139_770383_5FDAB79A 
X-CRM114-Status: UNSURE (   5.99  )
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



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Ryan Wanner<Ryan.Wanner@microchip.com>
> 
> Add configs for DRM Atmel LCD Controller, Backlight and Simple Panel
> 
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan<manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

