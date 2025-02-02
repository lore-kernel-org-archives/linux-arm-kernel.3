Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05D3C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsPzncwIigCJWeSgsuG0FXasnz96a9gzn6HqogWWQug=; b=tDRG4KBSdWrFwZ0iX8+Y4ZYaUt
	5tpyQL7HGHmmDO9AuxC4JLr+VZVpH0vj6+u3l+uORoWF2AT5DEWE495oYri56NjnU/RWigZLovpLq
	ZhNLHTjFwpVWc62wUcB1qBEZkTe7PlzsslobUp1Y6GhfR9T/ccCmKL0jGFog7DbfvF6fZ84uh13W8
	3jIJejfyRfyOmTIlW/bd839egu6dmJZJi/gErNG+2cR1B/hiYRnRRl+iKngqR8cEjxkyB5MPal9qW
	NPUbDMgbVZc84RHEbmJO+38r+2Wo6PGFX+z4MaOyeKtPkzKeKptBAYN4NCUHUariNlB0hf35v3gQK
	7FYSvAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tebYr-0000000Du3n-3UvZ;
	Sun, 02 Feb 2025 15:07:01 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tebXY-0000000Dtwh-1ZIb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 15:05:41 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-844ce6d0716so263310339f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738508738; x=1739113538; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsPzncwIigCJWeSgsuG0FXasnz96a9gzn6HqogWWQug=;
        b=TUT+bqNPbjEeMJMF4EC6MWhk1WbJ1cwC47VRA/hiuUjI3J0VI+1la9z2lPyqmg9rR6
         8TRdAitCwwU0QrAyTngAQuZQSlgWoDzHbTw80tW8RL/eAFncW4DXpFeZ6r68QdHXK7Vp
         No7PDB/ck36H5ZY6BioygKeQERrjHIwMPop4SuZOuoLrETuxPzAhCcbOtoN6557+2PK5
         T72VullAFOjpExznxqtNzJ9AfArM075f3DcYJYpJxxztkGtPh1ZEkbvCS5RI6YN7FYAY
         cI9xGUykrvw9xlLJD9UqLsdt3VK1heIB/2lBWEw2Yqjab02+kKxbOhVnVvxgFI5T3cmm
         TXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738508738; x=1739113538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lsPzncwIigCJWeSgsuG0FXasnz96a9gzn6HqogWWQug=;
        b=mu2/pGEmsIq5/JvR+4CohPeG205vsRH4NgmqZE5tY2quDjVfRsWPTX4bbsYLMWrqQO
         4w8MW8qhBtor9AyjXkaModilgbpahxgHV9PD+EIh0//ONGgDNO0oJrqpkpaNpQzNj85z
         3L9hhd9oCXUaxOcPS7CXXvEFgtcCHNqoeNvNlpmfATb4f7KXFIT6aXfdYAZAJpmtyyPi
         bcwo8TyREeqgKi0BeHlPzAXElMIPZdS9xlMKNMZp2isDRTSZYEG0PjDM41HGdz7ELA1+
         QZrIyvLN/PG3WYdphXBgBijUIURwHLLijgRKuIa8tDwHyOr/NEQzBmKwgVunsqhRnC9T
         J3zA==
X-Forwarded-Encrypted: i=1; AJvYcCUHONqTN/D2G1Ty/DQzOGhill9TcfV61HGlSqvDjFpuUvt8m1CdHKRSLOn3kUyvU/11TcH+n+crRl3s3CvdUu/l@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5JjhNN0ty5v7kzaPY9b/kPCylfToafzvU9qTEpyMZXfOUKqDR
	799xQUYbdU1//rjNunhji8Ryn92/ORA9FS0sKzWr9MiNEMOZT8oG+65L96JuDV8=
X-Gm-Gg: ASbGncuE6VMmtF9hByQObmDjkAofd6WovE31M1z4LHQ70HKYku9iEt9FlG6cSE5Z8kG
	T0V6yLBIQNu5ip8mVK1wgvZsWB5t2wshIJNsjKrDt7uS0rXhq/AGNrrQVLJBNuv3x4HBUs0pxgr
	aKI4FNAGCF2Vqy30ojaAfZTaybr5F4lL2U4Och6/wWvlH9XAmyYE/p7GIpXzju4+E5pc1fR3TnO
	wzmb1tkyYSG2yx32JzsR24nS6bX5tMxrCtNYyMgaytKrXHhW24+ct9ufJZDMJYl5r5VWb+BU7uP
	pVArZHjiznal
X-Google-Smtp-Source: AGHT+IGtE/JLqI8S9p7eRdsRPG6dC9TP58pGT88bNKePz2C1yiBYPfCn5bRWwQVviJy5GovjAgOURg==
X-Received: by 2002:a05:6602:380b:b0:847:22a7:240e with SMTP id ca18e2360f4ac-85439fa6279mr1766967239f.13.1738508738494;
        Sun, 02 Feb 2025 07:05:38 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854a15f8394sm204030039f.11.2025.02.02.07.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 07:05:37 -0800 (PST)
Message-ID: <8f039c53-a35a-460c-a0ff-43f592caddf5@kernel.dk>
Date: Sun, 2 Feb 2025 08:05:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: apple: rtkit: Pass the crashlog to the crashed()
 callback
To: Asahi Lina <lina@asahilina.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250202-rtkit-crashdump-v1-1-9d38615b4e12@asahilina.net>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250202-rtkit-crashdump-v1-1-9d38615b4e12@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_070540_404104_2920FCDD 
X-CRM114-Status: UNSURE (   8.11  )
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

On 2/2/25 6:48 AM, Asahi Lina wrote:
> Client drivers might want a copy of the crashlog to stash into a
> devcoredump blob. Since device memory management can be very variable,
> the actual devcoredump implementation is left to client drivers. Pass
> the raw crashlog buffer to the client callback so it can use it if
> desired.

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe


