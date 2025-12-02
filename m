Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E497ECFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cAk3oLL8ROCJ57k2VQByXGpSqsygpTMtS752h0isB8=; b=eNXmJSy2PP2WtMeFUsvhOy1Utf
	ctTaocUPZhoh02Jv3q0cVsJPJ34+aOSeicha8WISSJwVQCedtXfKKZxxV+2T7UE4A0gvhW0vMNJxj
	UejXbl1qct8VhFqnvmyUWgh/6T/K69m4n8P75XEl+abNJGdCP96TkdBYBucRp5j074CZ7XrnJvA2X
	xsu/EvB8JPJefdu4KVexyCoFELvD4wMLbHzoKhsb27GAHevL+gTc90AScvW4GjP0iWKb1qASfPtDY
	obYeg1jIi9Jd3kw7U8Q6T75LOVz6GmGkMWNDrU00vUHmnKn9zdw2zvjjA/sDxoaP8F6bCLmKn9SqX
	4CyDwBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNSe-00000005EoY-0IEb;
	Tue, 02 Dec 2025 10:18:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNSa-00000005Emb-4BWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:18:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779a637712so32361005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764670695; x=1765275495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cAk3oLL8ROCJ57k2VQByXGpSqsygpTMtS752h0isB8=;
        b=IEs3OQUo/UMEmfeLXsD43WGWzZMgXpDY+sC44lydkf6wHR4/wYaRxFGzmTxLDCu+v1
         6KudtEsLmWCHtnEudHCau9GcW8uvkLzXQCHvitme4M61FjoJIoMEXDG4sRJnSUAX23Ig
         tlRW7l8vDNjmgMhc0U+plgjRHzk8GYnIPGD6WuK31MlsM3ASFqUKsDYz27/ThKMPpHNc
         XI+6UGuC44AUYx8n3YGvCiTl1xeXpVgt9u/y1AnPOZT24eGZ0BkxrIPxBHHb9REgjjHt
         j1Cov6TRzPXJT7ToY7CzcFVBGF384Gm9aDejhWe1n6xk/QkG3lwOD6GY4EyHfHqYLpI3
         7E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764670695; x=1765275495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cAk3oLL8ROCJ57k2VQByXGpSqsygpTMtS752h0isB8=;
        b=GCgY2/cl8jVAQwD7z0tMD0VVU0sySqNQ7L7gWqG772PDpVYhhy+EMuqtpN2wXPWrvO
         XLWfB7iYsOTJhg1dbSTqZlDGPO0Ze8WHKXfDZlPtE1FJMfeJiVxDXKc6EjrleyAYru3W
         1iluAYAHedoPen4wD8cNy28kQmtxqpiQnoAxrVKzf9KNHY0iDQcS2KuvgNpoUFxesrQV
         aDaqgj92wEnYtkI44UJDYZ3UhLGrb8tDsjerYdUHiFXZFpF0BUO5YlSkybGJ5vivaZ6J
         qYgD+C8GqNV6u3QPmIX06fKe5AhvodJVJQUzwGqH4Ogf3H34rFD3nfDR6U1UytVIO5Ep
         W9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzh2zCNts6xjWBlNYdr5GavvyqZd6bHe5WCflH8P+ox714Jt91v4CsdQI+jMYYhu2l5JR9M4cXaamgM+bCpZKm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/978DBdk2bDADSxOBdw3VG0bPnYr1EzW+ifWEQh1fZzK6QCiQ
	CgbEGjaaI6wSOzVj9WK54d8KDjvYwHXgZqReYNw9NpG2EahYGENOesT33H9F4swpuRk=
X-Gm-Gg: ASbGnctaNRPqPNRhX/7jFLIWeKDDUorB+QgsyhoCMn9SrpBgPNoL9r3Tc7q4v8KjxaS
	0LpLxswLnIu/ul/ycmhow2kiaKO3wOTaUAPADvGPx/ask7CvfgqPIL1eTkcfs8P9hdm1vwwPV3X
	U12JnFOb8Yh8ny4Uuqreh7np5hHM8EjcpLo8nfQwG//8/XN7uwUNeHY1jsQR0MWpuCCe0Td3Y3m
	qkdwd8tqLOOd2AhQVs6ETyYdnOoWFY3bGiMeQO3Fdtapz5kyt2Onynjw6CjEhbmJ2mj8G1bSlgS
	G8P+9akN/YKGaBvzZqFu+deqJT9NggRxpzQ9Wy9IcYOPZ3v9KqFYyksOcyf8GfyyR7IVImIzRoJ
	AZ1kBnU/41IXdjEJsFzccfnEEasKMm48zltJL0Fd6joRrJl3QHqiXvNmMJYhAWLarsPZTu93gdq
	yUaBPd9Xw5HNJj8vwO
X-Google-Smtp-Source: AGHT+IHy3nFX0LKMVWLipxBkC1l1bBeysdgOp+AnUue/+gwsKv8yLm3DSpc6vz+WjLvbvqXoMhctiA==
X-Received: by 2002:a05:600c:3baa:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-477c01ecc7cmr422115765e9.34.1764670695027;
        Tue, 02 Dec 2025 02:18:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47927808a3esm12254865e9.1.2025.12.02.02.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 02:18:14 -0800 (PST)
Date: Tue, 2 Dec 2025 13:18:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: vchiq_bus: Check return value of
 of_dma_configure()
Message-ID: <aS684lo6j3ldvrPn@stanley.mountain>
References: <20251202095253.1640-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202095253.1640-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_021817_044045_D451F5DD 
X-CRM114-Status: GOOD (  13.22  )
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

You're not working against the latest tree so this doesn't apply.

On Tue, Dec 02, 2025 at 05:52:52PM +0800, Haotian Zhang wrote:
> vchiq_device_register() ignores the return value of of_dma_configure(),
> which may return -EPROBE_DEFER when the IOMMU is not ready or other error
> codes. This allows device registration to proceed with incomplete DMA
> configuration.
> 

If of_dma_configure() returns -EPROBE_DEFER then this will just fail and
that's not really any better than the existing behavior...

regards,
dan carpenter

> Check of_dma_configure() return value and fail device registration
> on error.
> 
> Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>


