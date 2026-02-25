Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB6FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opzPiYITPDzkhL0K2KwNxWZZH4n+i8pY3gCo6iOBE3o=; b=hlfTwkwxmdZB8yGxII8vABfzPd
	Q0489N7uxdsR2CULd73VN9QawOYEChiBqjr10tZ9s6d9xk2/DubtiEdoj9Lg2tyj5tm87vE2qCWIa
	z2ELHgGf06In+UZaYUgCASszybh7Fo0drUgvAqYrPUlxK8ozdEkdTe0AOZWrhINRsuhoUCHjBwxgy
	aJYs/U0DXbE0OMiRO70E3lccAhpBG/T649QSb+L1ZmV+EVXzLmkgoc+DkqIhx8KC0cYr01uZgdLx/
	Bh40iH0ur1BbV9gndOSbevaR8p2YYQBxOP0D2qHZUtSuwFPxVAQg2qX2rhQVHIcfqvO6W6bpSdsHy
	mn4EGerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvINx-00000004cQ9-1G1T;
	Wed, 25 Feb 2026 17:09:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvINu-00000004cPc-0zXQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:09:15 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4837907f535so63185615e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039352; x=1772644152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opzPiYITPDzkhL0K2KwNxWZZH4n+i8pY3gCo6iOBE3o=;
        b=M/oI30FUnqF/VMFXEbkPuGw/EG6tjerSBoMQl3WP/aGWg3YeClm3ih3HbNdsOm74pq
         fGatviCKDXf2kJkNLViy0ITCOFlVnYBzMkskpMQyi7HT57oBwAIwqk9Bxrx2NhhUMO6W
         SaDV2meELt9bgkxCjI8qAqkv+2NRJN7zPtTDtwQ8KKzAJXJKAu32CD8vkXKPvrNy6tkK
         raKxOosjmgZXMjMpwNwX/FCp4xhFJzms9TlM1gfQ8x8mmE7NVxL2tnXPBepfbf/q3R9O
         xHzHhJ62aKaBwQs/Vdre3i9WqgH01d5xG3el5nSTMSwNGiA+OneWYVj0jtdOCyehWX26
         gvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039352; x=1772644152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opzPiYITPDzkhL0K2KwNxWZZH4n+i8pY3gCo6iOBE3o=;
        b=aoOpiYzHC/bab1SVYPBVnX1nt1+Q8u5AnKwPb+gjInGBvivi0CrMo+BE8MrtM5R9tT
         j3rDpL6u861oHJOm2+i4ypVRW9xnouhJPsT7mdBiQYJKSd7G5XQyorY8SXM/toP/xuRz
         yKKOPBQgFXHXp5lkSaYBAwcXjPiT3bls9gWf0dOdbjYtlM1Vs91qPB2FTlzVMuTK6nG4
         CCyROukND/DErSahr1Y5ut4BLhUuPQKhgxlKK313yiOhK8TT0hIXJbXGqfpDfXd8gAgC
         5mW/4ZxVKyFIKACX9rO+D7ZBxgBYVXOrzm5VI5HSdKrxw0as+Wc/BvFPtb5jFgHkJKTf
         f6KA==
X-Forwarded-Encrypted: i=1; AJvYcCWH4eLgsm1d9xUQ1pogpW30ULXQEe22kBV3SqGv1pGWHPnqc+wiEfoW27WFlfnmB3m1cKGAr9YE5lbf/EDrfroS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8h0JbLTXqJ1MnA7UzGtujSRxQ5QAItgm70yQcAcQuKolULoLM
	DT226Ac2nQbMzhCCwg+gK1W42OmxfOIFx1E38tRyNfsyKsF1L+M/MzmW
X-Gm-Gg: ATEYQzwh/nPrk3YIxD4z7QvPI7UrpUy3qkMSREM4Yju426dVFuq8/UOvCs7kr+ryFYf
	tOOzNuJdLNprhk9IjOys+16Mk7LGnoNda/oQ3m2sPcJo+IDqgmuJlqT4Yx6O3CwS4jTyU2m4HW1
	rSc0j2nFzXA+Xw8zJzFT7dYLALj4lcCC2CVVK4kmAgQQ/4FXOwMeaa5JQorDXJLt9xkMDov6yrQ
	NqTHURqWG3tumKkncsSMZISOkIpmJsrCSruFw3p/idCMx8EmIfvo+XQeDCH/zTpjTK0PqcI+0W3
	v0S3nslC8LsM90Q8KiFni1un+bJemDO4R418visdbzvdqGBcI48Tz1R2TI34oXo+C4ViFOIhSUv
	hDTO2xECxTJAdo5+BQenybBROMPrUI7W721wurS29kHS7NaeUHa8O7BhS7KK0JnMBLXZCsiUVGN
	bGrqqfhbCQtKlBoNxX6eCdS3v7i1iswlDUKUNfpcdEK9ymiob8JOoHjOczDygwlK1ojeRjb4dBf
	TC88BNJcy1Lh/13eQ==
X-Received: by 2002:a05:600c:3acf:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-483c21a747bmr20503405e9.30.1772039351955;
        Wed, 25 Feb 2026 09:09:11 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f26d7sm91050645e9.3.2026.02.25.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:09:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: allwinner: pine-h64: Enable USB 3.0 host
Date: Wed, 25 Feb 2026 18:09:10 +0100
Message-ID: <5050123.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20260225170045.1707778-1-wens@kernel.org>
References: <20260225170045.1707778-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090914_807248_682E29C7 
X-CRM114-Status: UNSURE (   9.00  )
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

Dne sreda, 25. februar 2026 ob 18:00:44 Srednjeevropski standardni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> On both Pine H64 models, there is one USB 3.0 host port directly
> connected to the SoC. The VBUS is shared with the other USB 2.0 ports.
> Unfortunately the DWC controller binding does not have a VBUS supply.

IIRC this is exactly the reason why it was never added. Adding it without
vbus property is not a good strategy.

Best regards,
Jernej



