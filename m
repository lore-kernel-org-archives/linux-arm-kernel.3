Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C2CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKLhOm1EGO7KiVaRio9S3BSdKkAkAUK/rEpRWJAD0/Y=; b=iMt7WvOO3oY+PlIB/ADuR5y/1v
	GyAZ0m92SKxBCrsDM3VsP3QFGQn22Mtu2As8cSDsHzjSOpR91QaC037nk7e3OPkmPS/Jta8ZyP0aW
	MhE/BabfExAAYQMhHpe8142fmzo/NlkjM6EtPdePwZltnqT8zW6+CqTJnG495w+cZvKC9SV+Yqc+N
	TlfQTQYGi47tLVgwz2AhFJaQ7/hJ4c8Oz5JtWvKQgpnBPb4KPTZ/ZADHkm1Z/ma4sQlSovSGgkacO
	gOeFrRFM23eAkL69myLf6kqzH/1svXQQVPAXnCPq4vSG2IzgBegTpkbIojOUQOCKkRC7rvH9uPwVe
	xinN+m+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcm6I-0000000Ba5q-3RgP;
	Mon, 05 Jan 2026 15:02:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcm6G-0000000Ba5S-1lak
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:02:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so17010502a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 07:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767625346; x=1768230146; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKLhOm1EGO7KiVaRio9S3BSdKkAkAUK/rEpRWJAD0/Y=;
        b=APJ1gEV9mtOrfkIRK/VW/HqlLeU3prx1XuE3Sq8ST3w/Tgn/P5Jv40RqSCjuMBShOA
         m3rnhw3/D23+y9lcVAjc2/+P/tpccZc9xVBKRukThpvL07cEyh2hTfoxIS5XtYh0qCNS
         UnKsSYdiIQf3n0KFumDNmCTNWz4pfSK2kfC5AEKu/5vfpCl8/wc9b1yZbdmbcqFGeN4i
         mZ1EuuMyyLp3K8FJB9jdR078TT36Hz01ehtoUUkFWyz4iwjPIJGbedVf+piglbd0o/ki
         QpRPAfPKzce5x0J4FdmduaeMJSnvA59lVNdRGkfo1C67THwmqDaoSbm6+Ze0oMk5r6Vf
         326w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625346; x=1768230146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKLhOm1EGO7KiVaRio9S3BSdKkAkAUK/rEpRWJAD0/Y=;
        b=RnAf7AcRt4Dg/yFoAPDIhW+Uv/etqaFD6mPUhe7oAzkiKhM8iJlIJ/ekcN9ZcbTrzR
         exQHqKcWwjVdGx6viSGh2WnGKEraWHFa3M4qtyYFb1y2ObrhnoltPXMWhsHtdzc0A5wn
         M2x18SIqcy5z/1dA+8zRyFeVeulaytEveOBOo4tpuSATmDtXoRK1JEZS9nYJ3REQfQqX
         AT22eNj3PsgzJ3lVTGze92NleE5jvDgCkBBUy4+nukWZkiGfAIQawZfgClmHZ3l6tEgk
         Ujs7MUnfClbBJab4A/svUDI0JZJx1w8lXV+JR/zxnW4bzN18xCq2enwILvu3JXQUyNWF
         oonA==
X-Forwarded-Encrypted: i=1; AJvYcCVjE5BfoRJqOzE9zHvXcY0kthcNpasDKBrQzAf0r1zpp00tGp4vRvoMbdRM42KzcR5Iy0fWNXjQML5BZrC/9LBx@lists.infradead.org
X-Gm-Message-State: AOJu0YyFF3N8GbZOjrs+MpS4s/TGvRT6VrquHbRkTin29RUBIzG4Th6k
	K7cbriNRgLYFD8XfzrjjBNokPlTxeE4Q4+Q4zX1EsBmZltBuqTCEuy4KmQvo3k65/pQ=
X-Gm-Gg: AY/fxX4nrAsQYGqIIjqLspqGXpzw1K9GVk1UoQRIR/CModzHil6ONnCdDT5Gbm2gTbK
	clfTFvU6z2k73qG160SVpSjxPWR+5A/Xf2uL01zSPz6Jry36KuBv8tbNPy7JrlJgjbHipPbdiw0
	8uB2DGTy04IWrY1rvaLUOIpfNfRQ8fwkHWt63x92Hj8cwX+1ZN3lBRH98LzbzP/aFUsNkRCseeO
	CQSNVesMzSU2T5aNW8UXXWosFtVpy3pY8XnqSNHM38nkr99NIIptOHgdXhYOlKzjP3BGwEactsh
	770Vz7iQ2hhpa4cyn72S9CWSseLreIh3tG/lsDEgN9F0eK/fj4ehXkXBqyQm5Ghj43GBbj5urVM
	TH7FF0ww79qmZOJr1cpYp9VN7XVg4x/n9I5C9yQQwUYjYjoC+0CVcmkbQ3b+QzOmKdispKd6Zms
	IONxlhN7wsEzOcfn36Zg==
X-Google-Smtp-Source: AGHT+IEAWpC59x+QqXtzAbU3aYnA9kRQspD4kCFsoe72YD/sq6zSK5+EWzvZxjFYxJjc+vRGaIzw+w==
X-Received: by 2002:a05:6402:210e:b0:64d:1a1:9de4 with SMTP id 4fb4d7f45d1cf-64d01a1a027mr46987198a12.16.1767625344267;
        Mon, 05 Jan 2026 07:02:24 -0800 (PST)
Received: from [10.11.12.107] ([86.127.43.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65075c1b6f7sm23205a12.11.2026.01.05.07.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:02:24 -0800 (PST)
Message-ID: <f8b935cf-9211-4c21-9d52-5afe92d6e955@linaro.org>
Date: Mon, 5 Jan 2026 17:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: exynos: drop unneeded runtime pointer (pclk)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260105-mailbox-acpm-pclk-ptr-v1-1-8474de8c4584@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_070228_469954_CA4A9A23 
X-CRM114-Status: UNSURE (   8.82  )
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



On 1/5/26 2:34 PM, André Draszik wrote:
> pclk is not needed past probe(), just drop it. This saves a little bit
> of runtime memory.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  drivers/mailbox/exynos-mailbox.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

