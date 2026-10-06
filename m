Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306EBCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=; b=0zyO32+zFyXVWTvrQi8XycwxXD
	l0LlUnRQK83RNsxE1w3ovDUyuZqWhqURCF/mwdClN3EqTZ2Ash7d2/n46cxmEEP0K/EKVdcRswHYC
	p1R1TNWVOd8kcJsWgUeVF2b6sZAE11UfTTCLGhlwwRTvlQ8Hpf8+Tr4vZ6KvIUwUzP3W+o4q3qGYv
	vNaM8qKRQCYT7DsfsIEXuU6iJsBBN3UY0ZwWXr9D7TYGvB8atPY8ARSmGgWN20vQ5KcFobZGZbzxY
	ud//YI0+p5diLVgCqoWD/aispSbNk3wDyPpUKof9YBygHnGA9lzqnTWEJq+e4mYRZyiiFhn5Au0vy
	UIB6sp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFg-0000000063S-0V2L;
	Tue, 06 Oct 2026 06:02:12 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFd-0000000062m-2A62
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:02:10 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-144f79153f5so514642c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266528; x=1791871328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
        b=jLNXAd9zKq/Op9r3PtI8JZ74bZ0FDFEqDN+ve65o4g+Un5IU8uZ89cokAALG6t68Sj
         BrV/OveEfKL+VDggjtRmIqhV4S5wovG7PLBilvAj0HnaI5rtZ9hery0fY2D3drEqW48s
         F+YR51sEZpBlAVUOZYwJdc4G5vvpm7ZZFw/nlJNXEt4VXMV6XhZ+IXacFtlKSmXfpu6M
         JcylrxQBmcNn74GZ+C/xV/2vO9epOw9ZS/EoqIJyI8Jw9DO5+0kym3mR1RhMzLPNbHcg
         ViaqhV/CCNlLRNJA6fOv6hHsR1DS83Ky/h0L/YcV+AlHYZck/4NTP/ehUe4B6FC34Etm
         vWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266528; x=1791871328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dR8Qutpl2FyesqtcpPHIrzvBeE1WogkEGbe/5zasnK0=;
        b=GzGwkOmDfn9wp6MvMWl8fuMZymvigSJeklP+T4oYvBLtpzHXhanVndBgBq7Y52JB/3
         XIry+ihbf6q7saQyp5ZOGq15e2x0Q2SIY2d0uGWYQmt1jiO7i4Gjgfsjc3Qqju+J/Ix9
         4RIFLw2NfkXjqphgkepsrF31blPR+7vWp5OnmBD2AoF8eMlCrsV7bNBqa2o4J8weDa8k
         jA0NDM2A0cSfxC5xxTKUhBknafhlaEbzBV1kidNTnPf5tYgFF8lO6OpkSFudWVLj/95B
         SsN0fkUaIX6x8FGxu6++QRjjHqtzkyPiggB8Jxb+yIilNGK/GtzEYpiXtEyAyJPEw3Y4
         yLPg==
X-Forwarded-Encrypted: i=1; AKwUvBzEUIK4uc6eQaaApHeZkjPX7fU/qrWSPY40H5AkK6YuYwKCRmnDb7zNBEt4veDOD5ySe6FmGdgi0fH0K14SGJIs@lists.infradead.org
X-Gm-Message-State: AFq9FYLT+QFo9CUfTOd9friR2q81iB9+tvvvLXSnTZKm8we0Xa0azUby
	2XfV3dFcldUfp/oslVMl/tptvjBaekuQa52g5Hi1+Fc3L8pVIdOjkrJ3
X-Gm-Gg: AYBFou3ZTn8GDwqPP8Q05DUUh8ExIPjccupkpiI8bYIJqZf427Xi+J0xYluo2Emcgsl
	OCD0EmPQ+k9MlcID/nVo3aSkMO9cl7rjXBk3Q/9b/GDmn2ZtGdgiWL1tDqX9RYF/WSe3IKBf5Z9
	1oLzANYebDjj8EyVxdgE+L+ntwk3TZ3pL/XA13yCgzf1Bga4JC30Ql4hA7nIVExFZY6ILLNyARI
	iGNYn9lIV/4hrCOHgA2lFT7zO6/PG2u+CgZDmq4/B/8RWMJpMxIDwSBfHtCHNsVRbPcEZG7htXn
	uMuWLubW5ThJGPupe+yFytgUW3//ajSQWr3W35Ilkvg2l3+zP42BwB9pBwA+E+iKuy3pgC5YpdT
	sLseaMUyKOqSdzmLlDIPoQkGQpAr1dZT3eH67gcampmWbNpRh6YU4XK8YdHw843R0fQD4ws4I7v
	qnuvDwXXvm5aH8r5xAlOsV4SwQFONpdLnwcN3tuw4PB4ZBL9soagKe7WFOApv9kQ+Y8J9C1Hg4B
	Ts8Mj8uyn/Xeb1Rt2k4xzQ=
X-Received: by 2002:a05:7022:439a:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-15d302eb7d5mr2994502c88.20.1791266528379;
        Mon, 05 Oct 2026 23:02:08 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d84523b6csm3799091c88.12.2026.10.05.23.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:02:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Frank Li <Frank.li@oss.nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Date: Tue,  6 Oct 2026 11:32:02 +0530
Message-ID: <20261006060202.45817-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <asOtEhjOMXc9SVNP@parshuram>
References: <20260907063343.22255-1-hemanth.selam@gmail.com> <asOtEhjOMXc9SVNP@parshuram>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_230209_556788_1FFE1925 
X-CRM114-Status: GOOD (  11.05  )
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

On Mon, Oct 05, 2026 at 07:28:42PM +0530, Vinod Koul wrote:
> This is bogus, pls drop these... If there are real typos pls fix those
> instead! This is not a language book, it is code, upto should be just
> fine!

Understood, dropping this one.

For what it is worth, one hunk in it was not an "upto" style change:
drivers/dma/ppc4xx/xor.h has "contoller" where "controller" is meant.
If you would still take that on its own I will send it as a separate
one-line patch; otherwise I will leave it be.

Sorry for the noise.

Thanks,
Hemanth

