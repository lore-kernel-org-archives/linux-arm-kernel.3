Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135E2D79767
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 11:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHy8sBbrgSuASWG7wDRYrM3C5K2VMsxnu8LkrgXJIHs=; b=wey0RinsrRLByoXqfOyOAHtVKG
	25VnsxT2aLUTBiFqLoIJjDQmMbKXx/UryrBW3bK8ZF/gWsdOf2yG8486MDAiJR+B6fD5JRGee6rsT
	C9brVfCFZVrL0EdWsKfNlQGqdHduKG6DOfZjrjzYNYCwkHm5AFG9jM/DcI9txntMHX2kdiJNJJdho
	8BKzTf3WFBw8ovB7S7N8gNqjl52dX0uveFJ9HHrn8n16pw5AK679tQM07zNw8JNpFvfaUTSltguKK
	FouyteddWwtm/dc+9VpucHqbmfDH7+zV4O3l2t/6nkWjvEAqFUovHCiDz/XPhT30iHIqcg1J9r+PO
	ODip7jIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8mx-00000002WNZ-2NA7;
	Sat, 31 Jan 2026 11:05:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8mu-00000002WMp-4BfX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 11:05:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4807068eacbso24368295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 03:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769857511; x=1770462311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHy8sBbrgSuASWG7wDRYrM3C5K2VMsxnu8LkrgXJIHs=;
        b=Jr1KFaaZEivNgLCQuSqpKKzJ+m/mRPT9xorJlhOUURgja8IEcy5qiguhtRwYr5W/eU
         QRPm1kceBR4Gf9RbOST+q+AmYimQ8dfxcZH29rRf0SwqJw0CXpwYxVqDe2reNGG3QPzF
         m+s2Iz2Nxfk1G2gEdke8jRp43zHO+FuVtEzrk22FN9GR+IXrr6xb+DY79BNI/VnouHVE
         XQUQAQMNfCqX9/OvdwxT9c7/V+XjV+AkXnSYZyDkkiNsPgkhlNbyWVe5aOiXQQdXOliF
         XLiWeurFpVrBkAe0bWXdKJ8UGwXIPJBfn+RibwDWIejcBxWyxvXmi4tm2rSRzI7iy4p7
         0mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769857511; x=1770462311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHy8sBbrgSuASWG7wDRYrM3C5K2VMsxnu8LkrgXJIHs=;
        b=VTKiiGQ9i54IeUWjhJCAvELuiU0nz2qrvEmJmeFEarCRkmcgldIYihx4PaZBh+7cLm
         cBrDR2U/Qbiq9t/RjBF/cWmck53fl+YwM0c3mfNyPm0BkoxmymCcAjfzCotT+ykFCuS/
         4DlM6O6qYddVAZxxTVDk0G/UFvCGLqrXq+aAH0aBJ2rRvATa02zanHTZbcl+rzQI5D3D
         by8KmVH7zhom40UheSOattmovO51reREHe9lMPVelRZOY1zcXtm/vMyYi03Zq9vSbClf
         eyxYNqifI+3RnFNJsX5NIwJUbXD04XDCRuOKm1ZhVJTVDzM6hkb1AkyWp8UYjgHDMwRM
         acTw==
X-Forwarded-Encrypted: i=1; AJvYcCWlxG9+lo3On6WirYOQXc5fZ79RP/xX1K9wI+ctyNhEgtXY9Ajkj/fE2jR2mdr4qwygL6fOJo1sjJSj7oMNFgrq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1GWfGXVqZxxE0nGg5Qy6LpbZMcalWu6DW52rrfAKRD1gfgob5
	ztjxhEMNTrwuo0vghM0ibYS71ghSZsItsAXTd+q1x0dcJmNTbsq76XjAgYvPSC0MVGs=
X-Gm-Gg: AZuq6aL3AtKtOkrSul8+FbsoTC/e2ydjRJYOyCXJPE3poXeNUbO0oCPEtBcK9Bj7UDn
	y0ZJK9R20E+CqDYOGGi0T4ZB78isGAd7OkRGX0REw9THROraq98N5Ifu5zq7ChbY1TpdSlBBXib
	pYDPj0ENX7dvIbQ/BPkZWm2vQFjIzFd9cXqt2ii33hGfpg1FrnGdbYo3QnwsYUfeMnzMrOJ2LTU
	c6ugN3ImWa6LMhXUgJJve6ckMstUa+eQbYRZf+85KFl6TdkXEdKjZUIQNHXVd5nUDILYoKDkbHB
	RmXvCOixpFXmKYXGyY1uKsWN/+xNBj3AfWOipzTR0g/iQCrk+m+/a9MDCh5joRdF7KFqr+g7B3d
	/AYnkqjlXL6lzt8RvR6nrh425V5rChuaX3RKqF2TgFGG6YflbbIR2x2rM6VdyeR4nrx2B/uw5P+
	oUuVetPDFLJvmgKdomsyWtkyug
X-Received: by 2002:a05:600c:818f:b0:47b:deb9:f8a with SMTP id 5b1f17b1804b1-482db491bfbmr69347115e9.30.1769857511182;
        Sat, 31 Jan 2026 03:05:11 -0800 (PST)
Received: from [10.100.159.246] ([213.233.108.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482da91a227sm54666685e9.2.2026.01.31.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:05:10 -0800 (PST)
Message-ID: <40975e22-8381-4696-86e2-f153dd306da9@tuxon.dev>
Date: Sat, 31 Jan 2026 13:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/31] clk: at91: sam9x60: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <562cb1e4a6890dd846720ecf68e0505ec32a450b.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <562cb1e4a6890dd846720ecf68e0505ec32a450b.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_030513_092246_AF07A31E 
X-CRM114-Status: UNSURE (   5.94  )
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



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> 
> Switch SAM9X60 clocks to use modern parent_hw and parent_data.
> 
> Signed-off-by: Claudiu Beznea<claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner<Ryan.Wanner@microchip.com>


Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

