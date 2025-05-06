Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D94C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA5PfY6NY12/5Zj2EnrTQIT9NGofA0ZwpHxyeT273M0=; b=WQ8ARhEZbUKdPDZREuRfvYmaZQ
	eFdLfMdxttGIQMFdcgiQaLaTRjYVJOBqbqAsE4kj1MXief88iHnWo7mEfYa2nEwdO5V/Z1FlMnfIy
	S8pqjTcdN5kGf4LBUrA7ZQc9RppbsCXgoaeDs3C5zXQCGGA5j5aRpoUTk8BSTp7kbDBsjcIBJbRvp
	iTLkr0GpVOJF7bVtGosZK/d+ZkhNQLLVw3iW5kvsXiHhrGlixOBSaexprxPJPWqutvtnE0JKQ8lMM
	QFnzZDp3ndJLQHuvQmG3y5mbDyZm49P65CnkH2zmMuv5hbndYUOSK2m+8kVI7lMIMg/tCSBPx1KX3
	aOjRLQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQod-0000000DbGW-1nro;
	Tue, 06 May 2025 22:31:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCM5o-0000000CqmH-40yw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 17:28:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224341bbc1dso79550005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 10:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746552512; x=1747157312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PA5PfY6NY12/5Zj2EnrTQIT9NGofA0ZwpHxyeT273M0=;
        b=yh71FLsBg2djK2TVmFxoPrBAVuw/4+OEx6j7IVxiZHppaulm8VmS0jDgvCX97t3Gq2
         K/4ST2G910V0AQvSePW7CnEbemedMjfhuOdRsYC2mZNp3m4JzFLfWtkn4rH5gBFECch0
         OxBDg0Xo9SecvWAyAaqCgNs71jPBRj4c/dnROoE0Dlu7STaLX1cOdci6l+FjTxyfOK6t
         4ejCA7mZGTHKucrmxUOwSDdy6h1nU/u7Tui7/DMxXjTlT47OYz9anguG/sW+OPPleQ4O
         AdMtT1W3dqZtalSnPPqn5VOyYyACDciH+hsRBEXzlnIN4HuAZE1aVbJA+lJqe7Jc4xqz
         oXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746552512; x=1747157312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA5PfY6NY12/5Zj2EnrTQIT9NGofA0ZwpHxyeT273M0=;
        b=ptPcRpFMoiKX8hjbpJtPexII7JZ6/ZdTFzwqwD0JcG3Cf9WYiSMYQhpQfedPGD6TiU
         wnAYhNxUS6gc+PNi/RmT5B4FayrdXsit9o3Agk2U5TdQI0eMZpEE6npBDLFn8Ar+eldC
         jTJGfgbi2igdDCyxoEiFnn/0PceYz6UcGN3gexbz1BXVTmQ+SfL7iuIoP+IRUdxkG5xZ
         ZmWwKZujsj+2T+HZ52VIoRQ3IBQSaTktTTpKgZRS3V/HLtnFvHpftFUHeqW/f+8RDh72
         pBKUTZ6+jDDtuwReChd7WIwEl9T5uk/NhVlTV71n+IK8FZpd24a97kczbTnfCwUln9/t
         wgjw==
X-Forwarded-Encrypted: i=1; AJvYcCViT+Nhnib3k3/R95HOTSIdcTscc9U56zOkYllB3Z4ZXVTZazNFd2zApqLki8mBFW+F3ImG09VMURGMVI2waB+n@lists.infradead.org
X-Gm-Message-State: AOJu0YyAcHefwpG30eGN+cGGiKmsLZSUB0cwzC1Dq7bu9a7Qr/OK7Th2
	fQZ06LIvzG23ROlYW58RbUOtPQ5ufRWPS+EUBSGsxWujKw3jA6zClodWlQ1PWZY=
X-Gm-Gg: ASbGncsmIjPFRb2/LIF7/ETaeSTn/u6kWtjuw1nHMPjj2edlFN3Cnk0Qphm7y9P1NX+
	b8nZStkOgQ3/df1Qsbt1ZFDIq4FDDH6gW0cEGLs49ZMs0zOWpPiUQngpq2J0LBRK6+ruOew+d9L
	SshVqp0TVay3GUGis2AUKoO10VnQvXKFjW02G0mRPHiR/9ikq4TSG8o6RoEpcGUzyl017ei5yzQ
	nlns7KLENadGIk0GElBvSxNSmgCBuO1bwfpa/TOCgdcok7rzL8qqqg2HlrinoRTaHYPagY8bklL
	PbXA15YUmjYeTOZ9CYgCuWzlFA/uvY6ZLFJPS0zcRyTs
X-Google-Smtp-Source: AGHT+IEp4L7HwxTnZry2N9O3p9S78d/8SkvTPJNQn4jH71NKYa7pBIcfwdlj+kdoxFRV2WoW6lG3zQ==
X-Received: by 2002:a17:902:e5c8:b0:22e:421b:49b1 with SMTP id d9443c01a7336-22e5ecc5e65mr928185ad.48.1746552512052;
        Tue, 06 May 2025 10:28:32 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:18ea:e7ed:8d1e:88a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228b9asm76211715ad.172.2025.05.06.10.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:28:31 -0700 (PDT)
Date: Tue, 6 May 2025 11:28:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Fix two memory leaks in rproc_attach()
Message-ID: <aBpGvZ4U6VFpu1gl@p14s>
References: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430092043.1819308-1-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_102832_995815_B99F3D99 
X-CRM114-Status: GOOD (  18.63  )
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

On Wed, Apr 30, 2025 at 05:20:41PM +0800, Xiaolei Wang wrote:
> In the rproc_attach() function, if rproc_handle_resources() returns
> failure, the resources requested in imx_rproc_prepare() should be
> released, since almost the same thing is done in imx_rproc_prepare() and
> rproc_resource_cleanup(), Function rproc_resource_cleanup() is able
> to deal with empty lists so it is better to fix the "goto" statements
> in rproc_attach(). replace the "unprepare_device" goto statement with
> "clean_up_resources" and get rid of the "unprepare_device" label.
> and rproc->clean_table should also be released
> 
> Changes in v3:
>     Update patch1, replace the "unprepare_device" goto statement with
>     "clean_up_resources" and get rid of the "unprepare_device" label.
> 
> V2:
>     Updated the commit log of these two patches
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-2-xiaolei.wang@windriver.com/
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250426065348.1234391-3-xiaolei.wang@windriver.com/
> 
> V1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-1-xiaolei.wang@windriver.com/
>     https://patchwork.kernel.org/project/linux-remoteproc/patch/20250424122252.2777363-2-xiaolei.wang@windriver.com/
> 
> Xiaolei Wang (2):
>   remoteproc: cleanup acquired resources when rproc_handle_resources()
>     fails in rproc_attach()
>   remoteproc: core: release rproc->clean_table after rproc_attach()
>     fails
> 
>  drivers/remoteproc/remoteproc_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

I have applied this patchset.

Thanks,
Mathieu

> -- 
> 2.25.1
> 

