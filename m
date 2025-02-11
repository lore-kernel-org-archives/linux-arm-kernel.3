Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1BFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZCYBoaijxw4u7sSmxmhwO3Ew2yN/pa2fTKBphMnoEU=; b=AiUzDP3aj/WZNSMo56iWOk3ecg
	pAqTALqk7M6YCBzYO2YPxnNzuGCcZkkXuspG4xzo80z6VcS1tkuUOi3HeM8KC5jEXf6/wTOPW70gk
	L6wqD3QLUcjBu8ZntPiHnnT5TjzBj/YkETKTcsnu5b41CtEkCyj597G2pADByNZiQbUnQxEt4l5Yk
	Ca6bLL4swdXOv7UG+yDOC1NYgMm9ElHKER6NjJS24tJGwi64HYrMjdLffc0L+cmXQ5NBaXO1h2ENx
	pNYZZWjBgwDuso0qU/BhPxXtrEwSWXwOjDusIrG/6v4E+PN5rn+iFlqJe1LgP8o292njFyqy8J6UW
	7/H52fLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkQ1-00000002nCd-1M6w;
	Tue, 11 Feb 2025 07:10:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjR8-00000002evC-2OKl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 06:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eZCYBoaijxw4u7sSmxmhwO3Ew2yN/pa2fTKBphMnoEU=; b=A6VcJOJwrpl49PVRcYYjumcsXp
	tKP8jqKg97MevUCV6iua25yigVKXgzA8OHjL9I7McB5IpA7Ke/YgfoNOAqmAtVNV7AeWnOLH/I3+3
	jo6AaN3wWfPNXzd3/5t4J0kUvLtr+dYuYNosROth5bXm8qCNseO75Cnh6fQikC7+E/vJBVgShkG4c
	aH5zLw1qWppjpHTTif+e3K+rkYS28570J2/4mD+CYPcXTkDnjwHbBR9n7DvOhNng7PEo+OTPPiORE
	zJHn2gOjGbJUVdiM4P7bqG18ZTafWOClo83iIJunDVOydUl9Ndhd3ghPg/CgRmFMqQVYVfDChJ1xr
	yXqLukkw==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjQy-00000000UzU-2rt7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:07:57 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f6d2642faso67472235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 22:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739254061; x=1739858861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZCYBoaijxw4u7sSmxmhwO3Ew2yN/pa2fTKBphMnoEU=;
        b=Y8hbH+WlGQswGBBGYjjcxM+w6tVvjkPBzc6WvRS/5udxKuGBxBo340WOTkr5s/SeUQ
         ylu1UfCrA8X4IVeX/Zug0itp8NOvsLo6glL5sixGcj7yUVOUTnvbsz+SN7i3GfypQQTm
         q19qg/vD9bnUXbtn8Spca9BrL27+pZSYgRC2xm9SLJh8zJllMrl+RNnBvXXd0RvGg7zR
         v2u8nbNf4BWRzcBWQee5olg9V7+B3SwPyxEwP3p5zttUjM1Pt/4tRyrks02oXbb4LrWQ
         qcrZfsCAV4bnnuLbGm5e6NHYf+huA29iz4eZqd1qroR298bO+1qkWB8di/4D9JUHzjOe
         6sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739254061; x=1739858861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZCYBoaijxw4u7sSmxmhwO3Ew2yN/pa2fTKBphMnoEU=;
        b=SbrJq/zM3KsHso4aAjBqVZcGJ7ZBZtuuSWnH5b9TW4TL6/nevwsM+TeWfpLkMr+fit
         9MuKqnbW5of6v+81MeXAbIOfuza3sZXd7Ys/iHWHWCOgAo04q4LjMKsRujlP4uFj3RdO
         moFQ3ucX657AdMHRl4VFlDlnOCeHTva9fxN3fuxYetg5Qs9/5QFMz7MnJZUvKqTeV5EP
         XOyWkuL5UE6Q5llWFu3qUywlFTY68GrAtS7q7niDrxsnH08DBgOkWQbSsHIGRn/EIAkm
         IkQ8zlFhH1z1sH5yyrpfcFyWCJ66/KkdEgmbiK41rXBsZps6O26Sn14GNXNYlItrjPXz
         wDxg==
X-Forwarded-Encrypted: i=1; AJvYcCUTAW50wSOPo6bJrSaO0eKzqvnRvkisGBAkdH3Tyh+qMgf+8nkWrr6VmdquZS8BD60HzDpNwmjVcOeGvRQMDbWO@lists.infradead.org
X-Gm-Message-State: AOJu0YzBL3Pi84Sv1pCUyXocaWACSWBib94Z3Q9vGmnj+FPd1jpAe8zr
	cd0bnA9iJF0hGxNYNBXUK+QSTfdxmAEukWpFOZHeVuYvbaJ7gODh
X-Gm-Gg: ASbGncsMMocPnta++RHQUc7J024/YoaFWRaGObdrvG2Zxf4/EX5T9tvxJ4bGjAwOfjc
	Jj3yInxeea1nSbLYjkuM879IoWPUrsHtY2K1wqNTDKKseK0D9d7fmlkR++t9CtXdC8tqtarM24M
	e9auJMkvoTo1ww6pe3ESWWBmkkjBP0Lrpel1+NWIUS5JP4E09Z2mOHvIL3NPDk5ijMntTbiOltN
	do6L0qEUGFB5wzXf4L0VQJtjM4X9ckbdXWtQcT7XQKtL14RHOFwFbG47orN5wb6RCNE36Cfvyae
	HUUNaBv+pjcWQCs9C1l9i78saWxdiuZT1ij7YWlX66cVwQ==
X-Google-Smtp-Source: AGHT+IEXZbVvFHUebNOQTZZuCtmrL4QARTAUGAoCZ0Io2NendW61xrPGBTihSLTOMP+6ldmhBpF1jA==
X-Received: by 2002:a17:902:f60a:b0:212:63db:bb15 with SMTP id d9443c01a7336-21f4e75e5famr272057935ad.38.1739254060656;
        Mon, 10 Feb 2025 22:07:40 -0800 (PST)
Received: from [10.89.236.32] (wf126-032.ust.hk. [175.159.126.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683dc35sm87436575ad.126.2025.02.10.22.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 22:07:40 -0800 (PST)
Message-ID: <5d82d549-663f-4438-922a-6831e57e80b5@gmail.com>
Date: Tue, 11 Feb 2025 14:07:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] iommu/dart: Reject identity domain for locked DARTs
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sven Peter
 <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-4-5d97fe247f35@rosenzweig.io>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250210-locked-dart-v1-4-5d97fe247f35@rosenzweig.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_060750_924118_7361DB9A 
X-CRM114-Status: UNSURE (   6.08  )
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


Alyssa Rosenzweig 於 2025/2/11 凌晨3:39 寫道:
> This cannot work.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Janne Grunau <j@jannau.net>
The submitter's sign-off must be the last sign-off. It appears that you are the author
of this patch, so drop Janne's sign-off.
[...]

Nick Chan


