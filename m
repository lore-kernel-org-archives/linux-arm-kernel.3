Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13108C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 04:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=; b=B6xWt+bSnZgCjFswa7MzD86/NF
	zU9twIYIkRZYyTNrOHXS0NUNuNOseHTBCS2AsnkULUuFV7xTNdNKfc6pPOQ3tqiRZF2O6LyyVwhMe
	NMga4/TYtGzetnykiH0jSGGaQFAp8NjmQDSMpRYJ4M2VP2NMI5DokijBc2yQAeDIOtEgyg7tHG97b
	V99MsZrebsR35meiw7vixQTukMsI8pChUfO6P75VXI9xzCDKP1VWpuGvATyOzcclVEwW1K/BUYGCP
	A4rmqIEbmnAvREtD0Omo9maNYg2LR+sVTvFAu6fkMQMkhtz8WGc6+wIE2awkFP0CCsnAdsJMTLaYl
	NZb0yx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6eb-00000000yhW-3Fj2;
	Tue, 04 Aug 2026 04:21:25 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr6eZ-00000000ygM-04Qi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 04:21:24 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3811f512167so4195270a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 21:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785817282; x=1786422082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=Ofc6sUoU1vvQ2mWE3A68da9sQlaiAxpZVSK/KLtqxq53xVtu9vWvbI0HfmJ1FU35WK
         8a9tlvsgyEecLXmxwzq/42+ZfUU06xKOnuqnLhRcq6KIAU6TeFz8YDjJwImqFof0BRdg
         vEtBkrV5sWKLzHRVcxUVbWRZV7PVpF0txiwuB2OfCDJKi+CNdRYvUYVcz9Q1Q7DAX0hs
         n5qCA+jpjH2UKyxwF8ZDgdh8ARIrGieYug5f9Ug8S3GvGNI3+/Q0Vg6PPYDGyDgO1Q5q
         RHEznHJ7wieIr5K5BTQrpnAJy1oI/EZChy22b9zKAI6hP5OvdKiZl1iL/eQibKq99sga
         bxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817282; x=1786422082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=GARPSkioflbi9PloIDw2D7xaBi7UyvEJ3Hev7FI8SfXpYQAgquFlDKLHpPk7slVmHU
         BsfgkH+zGmnrVcjHg2JersbB2cFLG3QrH0tk3eHQGfBi9HFTEKWayLLDPTdnjqiITWr8
         4NVPX/qWtXCUKGqW9s02AQRrGIaeLTgGMnEnecYpeU8GqyXbxS69UPtmOYmuhHEqOPnI
         6hTwBJfGk2YnBrxiYaqhinVQjMbKz7DIxyyEuUOygHNM7Ji+xbIe8MYD8c1zZH8r7JIb
         yBodTutbz8Yms+tfQqeJb3DFYen6d6BhtuOJ56h7QYY+mSVjIIEbc65O71Oh2vi2ROyn
         dXIg==
X-Forwarded-Encrypted: i=1; AHgh+RqogUOJo7mpHBL3nRKJohYorMoX+JeqqPDlFK91kF0QPpkPZWLWJpla4L/NE5TruaSBR3oWzwuKQEFDD7D7DZm+@lists.infradead.org
X-Gm-Message-State: AOJu0YyWt4u8OA1nSXD24gHtBQhE4WrvTmnPdAmvvSwstsI6HqQJXQS9
	qtQpFY3DM7H/BtbkWAuyYNxxQARkxurmlw9Zg/p4PupbhWH5WFzA/zNSLay6glDW5So=
X-Gm-Gg: AR+sD138G7tzvBF4hh6c/vBXpXHVKh5awt6ymIlfXtak0T4Dvxl3Sythueime6WtW4m
	IFc5EDtMAkQMMpByrOKDEtuA2uvBrTaaksqetLptjatUwIY3N2s3EiGUtZaJlKQD0EWbSWm/HCY
	Y8aUs5ONBXU+LFU24qtE98wLIcir/+BnK0KfG7QIT/O5Xoeequ4pgt89ZA+lmeFqhUl4kYcPuH0
	8+RJ9Yy9NUWTCHliUgNa6EBt6EwLZMV65DVNb5xrjvEjaShQAtRHl5n1WY4/pDO8r/aFlckMSPm
	Y6mOANWYfDT1Nqp4qKCcR0vzHb6SGUQ+rNXut8C6rOeju/gi0NwHoZWdfrnseIuJjusiE3jkB2V
	S+EU26pUegjKHpNX0dmp0W9sK0Ohyk0JOuVmjngLDV+NrnnWXf/q5Ea0ESeQi1TRo1rOjUcabXQ
	ofsK5/z3hiOE+sOzLS1CQZKusxWq5VJ8ZHlEEFft0bQ/pM539VBVPfLfNUkWIi
X-Received: by 2002:a17:90b:4a09:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38fbc60c7femr11264577a91.43.1785817281575;
        Mon, 03 Aug 2026 21:21:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm64394331eec.3.2026.08.03.21.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:21:20 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:51:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
Message-ID: <mre6ggyfjxo5dgvtrp3nsrbxngenw4r2eb6nygi4ybs5zsefyq@kcu6u33q3ien>
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_212123_065226_F2CF7012 
X-CRM114-Status: GOOD (  12.41  )
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

On 02-08-26, 19:35, Maulik Shah wrote:
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 1ec22010a3f9..5fcbea32089d 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
>  	if (plgpio->regs.eit == -1)
>  		supported_type = IRQ_TYPE_LEVEL_HIGH;
>  	else
> -		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		supported_type = IRQ_TYPE_EDGE_BOTH;
>  
>  	if (!(trigger & supported_type))
>  		return -EINVAL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

