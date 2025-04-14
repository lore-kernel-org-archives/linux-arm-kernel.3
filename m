Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78540C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCrgWYM3Hgypgkdhg98cFtG7nn+j6jrPiIXWi6bPyp0=; b=4wmgMVPbyVBsHvCa5GWyKt5yKI
	7uqNKCvI2xLHOV3IMYLPA7uitk1WuYxwPvXnJXdc92b2ST3Ufu9nryTfABToGbFWuDt42ctmXRlGG
	aDd1gvL/1+EcayzsZLQzm41565lPso4g7fzTyIOfQX7VubvN+df+N5FSNFYIlXrVxZ9JZBLIjehNk
	CfUnA2OzJCkt5yY51qEyG2ILa5uelsUFCsnpZKO8djSiH+pRRR1UUNx88Y4+koSCRkypTxOm5lPU7
	wkWRUM8ro6jCyxcWDP3goUHAOKVQx/bpPsQuUQDlzTrEGpJLBodJNRUAdBai7Moycydaaxy7wR3Yy
	lraMellg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Kx4-00000002QBu-1Emh;
	Mon, 14 Apr 2025 14:38:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KqB-00000002OPA-3fTD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:31:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-399749152b4so2332287f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 07:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744641074; x=1745245874; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCrgWYM3Hgypgkdhg98cFtG7nn+j6jrPiIXWi6bPyp0=;
        b=MzI9p1f9BP9AhPIB7TTlMEAUQs9gjfy+Wrby68vOPQyAlP9Pba3+F3DgQXmIFySN6i
         Y/NBGXudXBl5pKybBctvA1p3H/mLJfoVZc7gsoCjgwucKyGjiDGlRtbkM4IoU0eqEHWZ
         W9qgt3f0oB3O64Cbm0WhlI+zigdPHPBLwQE93VNZRHlSGgdGVigwg6VgSw561hrHgflK
         tGEeCfqa+ve/UmfIppb+aibs0ZhiyWxRH1QrSWH1MHYT48eowgEIIxd1jfHyCKhKqwJT
         950zELyi7nhEU6MpNQNCz2J4BE34ZbBRg3w003DHS0+EgTYwNxfcfoFLMuj560FUICb1
         EfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641074; x=1745245874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCrgWYM3Hgypgkdhg98cFtG7nn+j6jrPiIXWi6bPyp0=;
        b=CFvCN8iSK+r72Kp5WWOzCavpk4R39RjZo7qDc6GlCugikM6vYm7WFpVD7DdDpmVUSU
         9aApQw4qff0pkGuc8447PsXHGkKRE09zSKVDktotJmuOMG8tfsl9wpc1WuJkY4LS1+vA
         MTLjDNteZCemNpDGMJp5QiwTwd3Uwp4dasCJUuN+J83tld9biqe82F14M+X3FlZ2GKYH
         02ZEBjMHuBepXH1EiSHtVXZZsyfvjpdZXsVDUFiu9s03OX0mWJ2nNxpiX5SPz1vHz6FI
         12QE0cIhWEm50xIR+vomgVXXyraE0j4uZ3Qw3svOurJfuvP2nzCpDLSqkWwEMa15gAwf
         rGJA==
X-Forwarded-Encrypted: i=1; AJvYcCVw7jiD7XMQi7ELJviEd0NKFFHzG8mo2y/YSIUd01HDZl1KA43sLRgSfH0POf40L0UQgt8thuibD4pUZPOosYC5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7qnlierAE8lfI8kemPrOLw3DwOE7/lzkymwO3ExUD7acznZI0
	F0hqtIszybkgaWThVn3pcI6hSKWQfzEx9NEcraXyKZPraG8bdohn
X-Gm-Gg: ASbGncs62P7aRzfRGuggDSicMpRIRXPL6WxByxtBoN+XtUZzZ7B8dKL6fF6hAIi2+DG
	SZzB9oezOWLTyA/W01QSRm0XZNjtDZawllUpx9FtxbA18vW4x0zeIP4R0fdpn2TbtJjet+tDNfl
	yb34hwoY796riKYuYXRt0AFua7VaeEwiWIMaTL4U0i1sN25mdeTJxnpzOek9GGehDZm7opRHeY3
	v1/rzqnH8jfhoDzmr7Q624+DEE78+zfQlQ4egOJbmW9dx1ZmlBls8ne+3FErwA1ime6LTk/wL2L
	DdEaZaE5RY8FW3+hrrx2el6KOugodaebeF3InN2ioxujdTXQ3u4=
X-Google-Smtp-Source: AGHT+IF4cFQXcUsJCUJ4rTn9rXcC4sO3n9nbDC1x24huqFx1CW67qBr8ulhefX4lOvKb92oRjDJHCw==
X-Received: by 2002:a05:6000:144d:b0:391:4999:776c with SMTP id ffacd0b85a97d-39eaaecdb44mr10571104f8f.40.1744641073750;
        Mon, 14 Apr 2025 07:31:13 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eaf43cd17sm11246340f8f.78.2025.04.14.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:31:13 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:31:11 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	davem@davemloft.net, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] crypto: sun8i-ss - use API helpers to setup fallback
 request
Message-ID: <Z_0cLywDNhlYIQBd@Red>
References: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
 <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_073115_912726_5A7199D2 
X-CRM114-Status: GOOD (  12.60  )
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

Le Mon, Apr 07, 2025 at 03:36:03PM +0300, Ovidiu Panait a écrit :
> Rather than setting up the fallback request by hand, use
> ahash_request_set_callback() and ahash_request_set_crypt() API helpers
> to properly setup the new request.
> 
> This also ensures that the completion callback is properly passed down
> to the fallback algorithm, which avoids a crash with async fallbacks.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> 

Herbert I acked but just saw some crash I didnt saw in first look.
Please wait a bit before merging, I verify what is the cause.

Regards

