Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD64F531FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiVB1nUUaTgLHnOiDu9/3O5El3WjSoq5GjXvTnCDSVc=; b=yJAwsmVSpIY3uU33jCQ0H3+ndg
	XOwBS8fUAIJv3PgPgxC7oOyz3jyptCafzGBYUEpx92usYqk8lWZgCKQFLpV2HkGFQ5TALJgVi/NGp
	yRahd5Vu4RBIYyDtmAE4ZmV/eE3A3mOqkljJbuu9RlasiXskco3y25eH9fe/+12mGMrio4tvB+Hhw
	67i98FZ/o/HgVLY2vMtYKUBtEaK32koqpwz9dCWqHsU0e+0IrN7QRxjBpomQqv8UH13QN+TNIeuG7
	0FV+vKxSB/TLyCmvCZr3bu/2LAAwozq1Sdh67Uxtouacipu4VvZBKjRRD7Uqq08jr65G47NaSCGSu
	Eqd6IMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYLn-0000000Guca-1miE;
	Tue, 14 Apr 2026 07:38:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYLk-0000000GucB-0xGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 07:38:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488ad135063so50206125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1776152297; x=1776757097; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiVB1nUUaTgLHnOiDu9/3O5El3WjSoq5GjXvTnCDSVc=;
        b=V9eDsCRmlZHEGOZNuT1kOscpGVkoSzI2b/uKirdKAzsnRfJWRBuNi5E0ylYf79KWaD
         Cm+7c8GRexia5dwU4U0Mg3Qr/aYm6bYCkXLNLeKK4o096UiwhIU4SW2GWyuCUwni9G6R
         e9fCaNPUBODKXi/RsNuSI+fdYYGTAKi3wRz+DZKdCU8cUf8o4z958XTz87e8TukKmPri
         PQFSypHe3hbzLFIQhqbb0RkCUQZYHZ7jMJy+RkcVG0ve5z9S3/2smbmM0UCpaNcjX2q7
         M1yDHUmtLpWj9nAu/Gl8kiz6v9eAiqv2lrv1w+UNlMQi7jID0sEy2PNV8UQOFz6iazAn
         6JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776152297; x=1776757097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RiVB1nUUaTgLHnOiDu9/3O5El3WjSoq5GjXvTnCDSVc=;
        b=dime3kK308KW31iZnj8mpYDG6su/7S6deda7uDEot1w2ArKHFvBExHFyaHTy+uYF5g
         g9WAPkwkYXXEKoOBXDg128dgq7pBVpWrfe6Pw1Y3DCx0NlMJgn4jCWA26NhYrjeCQIDW
         FZpob/eB1ANQxU17Zat9dj/STKiQNYDmiNeq4KjsdCxEyjz2JokNQSf8x7Xd2Te+3WbB
         HlREzn0rnuVGraLiMuzm8Vnoig1zUmi7mhqjw0AUggSQder+whHFDDK4bPIh6RZ838x5
         Z6TQsXpLGalFfNwiFUJ8h0MhGPeNE5gZYRakBWlb2Takgtk+lgnD83ITbTfDcOWwEfxc
         NRtw==
X-Forwarded-Encrypted: i=1; AFNElJ8zRxfNDz0DOjd5s1D8STCmUPasG7stmN3zu/u/1MOe5DiakR3jGYYs+S7sPwOLSGBYGA5z9739/CZGIB5HgT3Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwTlx0seInHkwqepLjQy9939rDuq4uChLjFq8xNvE80mTtXbBBq
	VopSTe/K3GWyCnhpT5TqPQhd31wL3VrWXRuBcytN+5scfbbD4zFp2dUQ5iUnWMNyuQc=
X-Gm-Gg: AeBDieu2Q2XfC5EpLvzNM/VEwCu/aXe2o3MKeJ1sOZYVO2NdrSPvkQwcOaDRrJGCL1r
	sA2dvpArPSblbzdAixrWAzhLCIaw2ix0u4C+cGYHfC9wdZWV2abrBMprgIGNqiylIY+1T16gSpc
	6CJtYVR+40xyBDy5cY+YbvOhO5dOBBOVtg2TeFetqCB5OdgeGOf/xRZOT+2q7g+nL64fJAsEQ7i
	2NeeIFS6bzePiut2Cdn5eD93HFp0kTDk3QGA7gSuIKogrB7eqpU9mC0UZjixF8xZ0tdAVHQLOCL
	snbfYGwtEDPmhSWT0o6M8T61j3/FsIM0fT8ONm+l5vF+ahEiynnms6ztYHhm2P4dy7CSIUwHw/x
	ad9+oloboxHa6zxT2zbBcFz5zrBZ+qAZUrM1uTiqB/inN6pq2ZGLXachHCqr145S1rVZbgW2X/L
	GEfc7iheZ3NaxwvkiI9/DZFyGzeJBR77Q=
X-Received: by 2002:a05:600d:d:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488d67eb7a7mr170044495e9.1.1776152297303;
        Tue, 14 Apr 2026 00:38:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e826sm64458585e9.6.2026.04.14.00.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 00:38:16 -0700 (PDT)
Message-ID: <09085eff-ed71-42a9-8806-a9748d2fcd61@tuxon.dev>
Date: Tue, 14 Apr 2026 10:38:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: configs: Drop redundant SND_ATMEL_SOC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-3-e76de035c2df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_003820_417471_7763E4F7 
X-CRM114-Status: UNSURE (   6.93  )
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



On 4/12/26 20:12, Krzysztof Kozlowski wrote:
> CONFIG_SND_ATMEL_SOC is gone since commit 4f30f84feb77 ("ASoC: atmel:
> Standardize ASoC menu") and can be simply dropped without effect.
> 
> No impact on include/generated/autoconf.h.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

