Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C89EA4FB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgvcvfLmQxLNLL2lzefX6uMlmIaisGh3AUi4aXxqy/c=; b=T/1dx4YVBMGlt42ufgj0esVOeL
	4hDgZM99RKHaBmeAbkZkQ0S++BKaOQz5ct+A8dADxtOKINGq77GBOjPc9U3Pq3CNpNnYXQG312ati
	JuKEjtfUR8kuV2MVl+GjxZuLRtNrDBVwET/ehtaKusqKbnlkx14jotunJQRjPE8dG/hclr/rWMiVu
	AlfwqCiZihqMtoEgystnFhPxaxE4IbFsH4f4keK7snhpnCSRbTSnjSb1/Ni0FXpvLUGSAmMHR5Kfx
	uDYfhuBkwC6yKUVG3CcM4nHnJVYuHpZw8ozhL1r5a2tjbSSveta2I69PU8LU6G+lsWwyiGT4JH/JH
	Wk59bhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuV7Q-00000000HYG-3jZh;
	Mon, 23 Feb 2026 12:32:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuV7O-00000000HXJ-3LI9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:32:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43638a33157so3993992f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 04:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771849973; x=1772454773; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qgvcvfLmQxLNLL2lzefX6uMlmIaisGh3AUi4aXxqy/c=;
        b=BAqxW+RUhD1IrfVi/f266gfW5WwCxgJUDXArLr7fe5K3j6gUtJdfPfbjw3CpRdGcDF
         ZS4JtBwOSc8huIv7bFEYKOH+yv+MhUhD4IbkZbw9zA3Dje5hA3ucUNwAoGK7PqzaU/8o
         xz4Wo20ANJbZKvqJRODar77sfDkk3W7BjRHKmQ7U9Ce/4xn+2BskNFfSBJEga59E0y00
         dGLnDWVr5zcRtdc0qJl4j54iHt3zM7Xzmup4/2f+KVjhhjYV54KMfx+H8apZjs8pWA/R
         DkvECj10PSVlrwcUoOK75TN5QvB75eeKPo6KYSQv55XMELOhd1VT0GuDB2TwSoRaZygm
         dPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849973; x=1772454773;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgvcvfLmQxLNLL2lzefX6uMlmIaisGh3AUi4aXxqy/c=;
        b=lXPRn85DmQy/nRbQFoelfk9AXXFXQrWrQvX3EHsBV3QTwHP4n/Upq8xq9ESGM6LFrm
         x386ChqAqGJ7RpIwVYN3DLptvEnJGTRjHbbnZWHagr31LsUkJuOL1jKLVe7NBKib+0Fi
         1uHZQW0rgGoxf/OayX+8HW8tHE9poFnylgodSzUkNg3Y0JBZtQ+a1y4MNJ4Pi44FEhCC
         d/DBkrshqv+OFlt8ylrf5wsghYbruhsJkUxCvaYVfVxTCzXt6KIGIPknRn73+jtE/x7I
         6Q1R8OWbWW7yp5hvD2bxBavmGJdA8CefVWM9oRaMXBZaKG9AJOremu1QWmd40V6zOXj/
         Z2dA==
X-Forwarded-Encrypted: i=1; AJvYcCUafQVUKqWYGO4Fb0bN9e64tza7n8QtmDMjOSMbBtR0n6KreY3fS80lXuEdyOflSfQk25bXenGWFVjxNGOL/sG0@lists.infradead.org
X-Gm-Message-State: AOJu0YxMQe6whgNwnJHfieccBVvLeK/J12eFwCrowIifD+shBMUyWcsg
	+AIk/HInPtFMJpBJr87NY2OHYzXai2Euk6/3472aonuKoyIXxujoR96D
X-Gm-Gg: ATEYQzyGS4NztmeNp2NKYazVS9wU4+gRqrt3mgVdezxKt03/zqvrDrFp/jtWfJH9Dzt
	f2T3jGSKShHBnw2bf3TynFqv6ZXYtLIyyfUIw2YzRRpQ4ZCCZrcT5K9vxtSjEZ6MvrlXmNAOfzv
	hcNzB5dp/Ow9EVJb+uzTEnxjIgQk4WMGl469jBljnHj0j3VlO9kudvxa+5ecGfd76cyxWdZEVt8
	dWB0cTNYmRi/uQ8owq0l9TQWvc9d/034TUaaYka/eUraxz0+YdHNHWWxF6Lr5dqKG6VmHsKjp2W
	mkzglIjMtcZHUL4uDItfTlGSNWg2hYPp4m2d7gO8HOY+uwgT31dnzUNHGQHFNr170y0dGaKfxMA
	Zsou75CV+rIfosNmYJwlgPdQsolNUa2FhKFBqkQKZHxJEp11ZWcYT229Iqeq9e0/1ye8m+QUNmk
	V13cEH3KVOxJ6y5veemtFfBEgWa59EoDYyD7iXtGDuUZCvUPa3gOHOhhTsVFBsL4g=
X-Received: by 2002:a05:6000:428a:b0:435:e460:235b with SMTP id ffacd0b85a97d-4396f181e11mr15306649f8f.59.1771849972778;
        Mon, 23 Feb 2026 04:32:52 -0800 (PST)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm19029992f8f.21.2026.02.23.04.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 04:32:52 -0800 (PST)
Message-ID: <e6cca451-5be9-4349-b9d3-b464dafea077@gmail.com>
Date: Mon, 23 Feb 2026 13:32:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: cznic,turris-mox-rwtm: convert to
 DT schema
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260221-mox-rwtm-yaml-v1-1-25dec4a0228b@gmail.com>
 <77c45be6-a0c1-4799-9491-f7e492d60aab@kernel.org>
 <10f15883-d8db-4872-8af2-7a8cf293780d@gmail.com>
In-Reply-To: <10f15883-d8db-4872-8af2-7a8cf293780d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_043254_845032_8BDE5C2B 
X-CRM114-Status: UNSURE (   9.15  )
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

2026. 02. 23. 11:57 keltezéssel, Gabor Juhos írta:

...

> I wanted to get rid of all warnings, so I ended up with the current patch.
> 
> Do you have any suggestion about what would be the acceptable solution to clean
> up the current mess?

Please scrap this, v7.0-rc1 contains a similar change already. See commit
62fedca4ff8a ("dt-bindings: firmware: Convert cznic,turris-mox-rwtm to DT schema").

Sorry for the noise.

Regards,
Gabor

