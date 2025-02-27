Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CC1C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIHFyw4DJimMnpIl8i0OzzVtEtYlzfhRkm9JXG7+7wU=; b=UGgZReReE0CXaazZiHcYCuZh+V
	dLokTHK1lubRE2/TKIlar7Q/M7tPwmykv/wWgTaDb6ERnuo7b5BeVFtwghjCqVuo5UHFQIGqeC9z6
	GxW9WiT3wqKf8i4tKfaOaLsNW4JNJOtt8Nk0use/wZjpvAZInNGGz1TwMEyHKfAGVPO5OjXnbeM3Z
	3rr/Wd3fEFb55kBC65cF6RYhGbfJlZUwaqtonnaIZb6pR3diN+4b9ChgFK5fyJ//hbgtoANmDYeMs
	Vg29U73c21zVLn9EkH9hrbOWCrzLIsdPE945HYotCDgU341gJxIn88dLR/c154JoMrZoPUWG3nVk5
	MV5XWFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnajo-00000006wHs-2ilH;
	Thu, 27 Feb 2025 10:03:28 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnagT-00000006vuL-0rgV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:00:02 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so1148085a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 02:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740650399; x=1741255199; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIHFyw4DJimMnpIl8i0OzzVtEtYlzfhRkm9JXG7+7wU=;
        b=RZS9e+AOMVUh5KKkVX4hq0Vc12CrT2C1EaQHcnz/liNbMGBqeJMCqotkLZzmaqJc8Z
         IfhEw/i3hjBzzYqNjace1085oh9WzK9IwL26zQRQtg/usbHLsUD/tY17ngFCOcFw8efr
         +0cgQGcDmTZn06EXySehSl+J0SCL9Vy5791dd/aZhmZBC1jDykbA3nqLUY7z1eSFW/Lw
         5WBRjJOrbbrqsGH6uPgtxvq1dFb0jBZ5iJeTmTj88y+b3LncSRZ3cGJb5B7WawvbSCE5
         o8/uSb4fs7GCRPCT0BzX3jBj53xbofuxyZNs9VZexkNOE1SXD+sdhG+jZKe4fyAOir6q
         A9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650399; x=1741255199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIHFyw4DJimMnpIl8i0OzzVtEtYlzfhRkm9JXG7+7wU=;
        b=PrYyo+N9q31HV5Ar1i1rqG6KzlNoHQkz0fI8n8GGmDw1yEidC+MV3pf8Qgk1vsp6pn
         uNhMFB2qy2zReRMonp8ME4xFrRY48EYXhN1UpDcQY3Q0pCc4bMpoTMTaPjf73JRzQtZw
         ubXZJMTZ57tFkvwtJCTi4Zv+Kx7DceCP8iqhfen2F93Ph+1IrePjSBJmCWcPtlRDiRZX
         +dAYN/bRdYR3yV4N0fu8MJaCCd18qoOdEMA4X0xVGzQjWKXO08AblLXY1HupqRR2Z4i5
         p5ui124Ue8tl4AMhIV5JFHjD7+7lRzJhIA4vK/62Or4pBqR89rhDBoAmZuK2aUtN5que
         V7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUzQfSP6yTTDdn1EQxTLUs5e943VaHeSgVpEbUCZR4XAudHknZoNg6RBeiApYG0BY1B9AaaboxVeRCs7eXjxcpY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc+vEPg2F4B/VNerHz4kwUUDxz4UTJabJXMu4gidV5OJWPrJ0L
	Pk4GirwymLseny8plp/tALdlLpgg5Kkqb8rnpALWIgSBWWlWk1Z7NXMXXL/Hc7I=
X-Gm-Gg: ASbGncs2zKsUVFwcqvQgSo2Bz6v+GneGuioinvuhBzN6fq6nBNVjQRb/TMwGoS9jAtH
	O7cQQxT+/rBJq8hRqDyX4B2XyJB26S8Gfht/oIzGgGChyJaWDyIlVQXgk6Twtt5LX9bwKnhnXhI
	hDtu7y3Kc2JZQSV9rglTF/6blxmK7xXt2dEj3CwbI2gdXesSBWz/wQkU2cVuUWxURI9UqG1ZiMD
	lVnpHq92wphFojS/MajV9Z/wWvZhDtqNPQ6DhKDQ0tNToWsKwIVcXqHjBnIYxMM15pRaDvhW8mK
	XbPPHf398VWDUEw1aiguU0wyHsb/gy4=
X-Google-Smtp-Source: AGHT+IHunHmqDDk/8KV7z25yVlfx9n1ZmOsivVdt03USwowQNbi9YBZAEFtlG6SH7Vi2b3fPs6n3vQ==
X-Received: by 2002:a17:906:7cd8:b0:ab7:b5d9:525a with SMTP id a640c23a62f3a-abc09c1a653mr2285136866b.37.1740650399043;
        Thu, 27 Feb 2025 01:59:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c0dc21csm96948866b.42.2025.02.27.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:59:58 -0800 (PST)
Date: Thu, 27 Feb 2025 12:59:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: imx: fix a potential memory leak in
 imx_media_csc_scaler_device_init()
Message-ID: <d09ac514-be27-46eb-8b2a-1a397e3321d6@stanley.mountain>
References: <20250227074451.3698971-1-haoxiang_li2024@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227074451.3698971-1-haoxiang_li2024@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_020001_248153_9D717A1D 
X-CRM114-Status: GOOD (  11.26  )
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

On Thu, Feb 27, 2025 at 03:44:51PM +0800, Haoxiang Li wrote:
> Add video_device_release() in label 'err_m2m' to release the memory
> allocated by video_device_alloc() and prevent potential memory leaks.
> Remove the reduntant code in label 'err_m2m'.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
> - Remove the reduntant code. Thanks, Dan!

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


