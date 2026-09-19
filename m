Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4BEC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 13:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1fZ6KqR7Gubow5Qyu4FfRMFbkSYpjfYEjbAmpCRKQA=; b=VM69xO2aW6Bn3pQDd3i/gP7dtq
	Rr7vlGbeq6x0h2tTXvD6JQOZqMKTagqqP8Wpr68iP4yO5N8ypvLsFxMZ0NEZu4pqfcXm5xBmK3IRq
	37U9CvYxXVUgMqVNzsbRmZIc6TJeNkGdPnUIl4gVJtNnrCEzP90E+zTKrKqQB8d0AF6iNjfnhwL8l
	God9fPiEc133ULP3IMROWubk5aNkKngGucktE5+RvPGC7awBd08yk+ICtsZUyfUi3soXe9upYKQ7b
	FerO0N459ZywkJm7AkWgunSnKom3QoyItJVgXlL88r4OlVFe/BHHhCWXvaYLsNqSEV9H2VdonkslX
	ji/wEOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v3b-0000000GJYu-0mYp;
	Sat, 19 Sep 2026 13:24:43 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7v3Y-0000000GJYa-1Sk4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 13:24:41 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so6256315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789824278; x=1790429078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1fZ6KqR7Gubow5Qyu4FfRMFbkSYpjfYEjbAmpCRKQA=;
        b=gK9tBFURplLWBT1gbEPE5gd6KBEUVptWXhAFmtJRPAjuMF6r2m/hy5YU24U2nli7/a
         cnaXfPQ2nVH/bT0/DEK8Na6cb280KjIFjAcbg2SfqU+/55+bGD/TArWcU6JYEI43epTm
         7mXaCrqd/L3zkIa/zfdEvCuh6RRJ6Orj0p85wysShEBRVJ29uO+0cSsSB/pxd8NJIGNj
         jt44lkDqhmAsBsJnbMIVc4cgaavW5+p6qMwepnv5QxiSs8OZw1/OM/7U8KiS2Ybmxa+1
         29tiU9jrAuX1Jsw3BQMCib3MCx7ebcCOK2MeEk+D5aAyVTcsUExAZE4SLjfwpT5EUldd
         I6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789824278; x=1790429078;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1fZ6KqR7Gubow5Qyu4FfRMFbkSYpjfYEjbAmpCRKQA=;
        b=02uVDUhnyxTvdH+vZRLbsuaztEmpCG4KBGnjTwCumF3qKUxXgRSGTof/yabQPYOzne
         72kfAW68jZ5JaJbPeWK/gFDBgqyGHZ+A6PlFRoYC3HsCx+GNu05cH0bixmcyQZDBpBv9
         wSqblu7f1WmtRaVQk8MQLyhv1oXcq+DP4eE4YevWX/YMbWgd9Y5SI40AHMEQZ3/g/Lcx
         kFSCBaYAhlUqZ6KfJj5+e7STAyQ+8iLVAjcj533d9BTy5kCp7D0H/3/75vUpf4cmE9zN
         0kPpfaOmLxAZ3JMksV0pDGJd8WOSyxCZ/1yQNDb3jOODiV+2em1dVRLQSwGhsvj1pAMl
         Pevg==
X-Forwarded-Encrypted: i=1; AKwUvByew9ZkKhiClr/cgQz9bKXZUvXyiA3q0xXE8Spk1rOPkA+h1P3E9JjCepTJI45bg2sUD1jEquMff4jPV9UhdvGk@lists.infradead.org
X-Gm-Message-State: AFuF++m85xMzg6bEJQ8GZIWsnuyzMkeX1lxv7vCocsVPMHVl+9eYngjL
	2zVydu9KBPP5pr50fGrIA7gSdJJ5I4EK06RPdOFrk1AMDrCWJKUq7OoCNBe0opEA2Gk=
X-Gm-Gg: AYBFou0FHo9agwr4j+PxYZSUZshxRqkcztE/zaLY9MGPA4yaUxjIYE9+l+3sifSdiip
	EHkALznn0l6G6rLr4gPZS+mOL3mF+IJob1UGS3Fk+vhow2R44KRjxfyfGPMcbNzYZAkSAQ2yfGE
	cJ5eL+369+XvoJkbrrfOvOqcSeizWqOdF1//D54esCpYNEoFr6+6bkO9cjwqA2wR977Lfn6Zm5C
	g9zJtiiMjLDN7sMsmfUT2vB9WfqEp7vethFq4VUMr2TeJ3zQyzhhpvbrIzHPuGSVXvoAqonQhYd
	NnyjrX+G/NiqXaHhkONFjoo/ufNalzEpGOLUS7RHXrjmwmX7mvYmS5wKmStCQu6ROOgdvz4/B26
	uQ2srfzaCOcn+yE7631gWuFyz861WcHwjRAjzHGf4x9gnprm0WOUhLX/WMhnzBeQt+1AxY40Zkk
	uj4hZRK7M4K5KoRCrNstlDWwhYtUeJGFJ3KadPZcVq44O8rLBT+FSxK7JsFwHHu6W+b/I4AgBAV
	+SIc+VjBabAn3m3/9tzEmoAN0xI3S+xgsTCUlU9gPicDE1WMRNYkwui
X-Received: by 2002:a05:600c:4e89:b0:49e:6ca6:d40f with SMTP id 5b1f17b1804b1-49fc4ff40a9mr87364545e9.9.1789824278440;
        Sat, 19 Sep 2026 06:24:38 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm303117955e9.4.2026.09.19.06.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 06:24:37 -0700 (PDT)
Message-ID: <e23712ef-1515-43a1-8cb0-e88e26505b05@tuxon.dev>
Date: Sat, 19 Sep 2026 16:24:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/17] ARM: dts: microchip: sama7d65: add cpu opps
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, srini@kernel.org, marcelo.schmitt@analog.com,
 radu.sabau@analog.com, joshua.crofts1@gmail.com, jorge.marques@analog.com,
 Jonathan.Santos@analog.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, duje@dujemihanovic.xyz,
 mazziesaccount@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260806074024.531259-1-varshini.rajendran@microchip.com>
 <20260806074024.531259-12-varshini.rajendran@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260806074024.531259-12-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_062440_400621_7582AC34 
X-CRM114-Status: UNSURE (   6.90  )
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



On 8/6/26 10:40, Varshini Rajendran wrote:
> Add CPU OPPs table for SAMA7D65.
> 
> Signed-off-by: Varshini Rajendran<varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

