Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73241D637BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 20:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fRq7HA8R4Yc87ct77Btl5P4p5LIi/AWOC0DPJEG4kLo=; b=1+A6LqC2oRwYC5DAsQbMXw2U6Q
	xqDjw0NxlxjsqArgLYy8W9qJNl0/63u+yMfxwLZ9sg+q5W1tLBnWfDovckcY9LShBhYmZ8xsjqCmr
	45hvr6HpiKC2eLG0obKIysIYIwx0579SDKeKM4XbdVZ9f4AxLJyw84KBiP35IzxLHIcSdsMWz2ERc
	OrF+2UWjzhBUvWtlQJNtBeq6uYHxGPIMi1E6bbjXyNjbkQChGGpsYJhZZWhMx0SiKt3gx2DVad4vq
	NC639JsHZZFfqm6Ftl+XsQ8Hzckb8W477rgW/nRRulpjPaWF1jD9NC2+zzmG5H2VEwcCopdNCxzkh
	mFzeGyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKFP-00000007zjV-2z56;
	Wed, 13 Nov 2024 20:45:55 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKDZ-00000007zXY-2Kmm;
	Wed, 13 Nov 2024 20:44:03 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c693b68f5so78461405ad.1;
        Wed, 13 Nov 2024 12:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530639; x=1732135439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRq7HA8R4Yc87ct77Btl5P4p5LIi/AWOC0DPJEG4kLo=;
        b=nbG3XR/WI4INW3/frZIT3OM89HQV2eSl47+NdasIj3A3KFFragEvQHEhcGdHNXC/4H
         pogFFNsJVQ3+VfyeYdQAMWYnDl8Y2ZQrxVsLYre7eRIYaGD82L8sB06a3+P/w+MCFoyS
         wQ2U12OopvqdpU0Cf5UngFgXgkWwiIe8tu+z9FInS5e8/jLopynk5GxGnPwqJ3d+y0Ja
         PwS0mBhz3y0Ds6j2Rbp+n/VxfrD4AfLwzfZTEY3Z69zanKpsQcQMXUqkWqlnRe50QeC3
         HMcbZ+EYWXAT7UL29Kdzp0gGIm2yHcygCLQ5dmF7PYugIjByeN48i6ZPQlo0oRPt2x5f
         Pobg==
X-Forwarded-Encrypted: i=1; AJvYcCVhhEyLerlUkxJHRdtGh8fZeIN8B+SGaH79x79duhmuqF6uD5UNJATvMOS43/gKP1NZLYXziqaYmin7IZftfiw=@lists.infradead.org, AJvYcCXc4/Xb/H5Rfjz25dZ0HUrb9WCthNesDFu+y35qU7OpZRZN/LwBsUYnjs9UxMQRqt6rBQwtUlSW6FHWomWxa1MM@lists.infradead.org
X-Gm-Message-State: AOJu0YzmTxVpnZ8IRAzItH2zbERAlKUtLMjhGP1eUrAjSAN1FJqSN2in
	GTI8jBxHU+Cc1y3tGfAqao8/zNTLbfO174/bgy8QeyO/4wArqj2I
X-Google-Smtp-Source: AGHT+IH+xt1qFBsd7q/DjytVDX9H9GNmPTwlfxa+JwVbYPjFdSHb/h1Jyme2qmdbuoS6hPSgEY5tfA==
X-Received: by 2002:a17:902:ccc9:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-211b5ccdc57mr67452805ad.32.1731530638800;
        Wed, 13 Nov 2024 12:43:58 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dca30dsm114474555ad.35.2024.11.13.12.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:43:57 -0800 (PST)
Date: Thu, 14 Nov 2024 05:43:55 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] PCI: mediatek-gen3: Remove unneeded semicolon
Message-ID: <20241113204355.GA1138879@rocinante>
References: <20241111010935.20208-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111010935.20208-1-yang.lee@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_124401_637427_FA96D2CB 
X-CRM114-Status: UNSURE (   7.06  )
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

Hello,

> This patch removes an redundant semicolon.
> 
> ./drivers/pci/controller/pcie-mediatek-gen3.c:414:2-3: Unneeded
> semicolon

Applied to controller/mediatek, thank you!

[01/01] PCI: mediatek-gen3: Remove unneeded semicolon
        https://git.kernel.org/pci/pci/c/d19ea320d302

	Krzysztof

