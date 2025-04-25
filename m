Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ECCC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aug+uhhO10dT8SA1KkPf7sPRP/dd7tZddbirMjYFdb0=; b=Nkf942UfaXiZLm46kmSGPVsCWH
	/8baA4ieAvxOvhfdMYVRVVUTQkSvEbj61SeH+5xCVK80y9hrmL/yK5a7DYT+KL8UnR6strT0l7AZ+
	rEidIilRxT9idjcE7lXf8WTmazlF/2csjnzOeoZOGr9D/zKWuDhsp9eIk6yolSVSP4cfTX3cZRnDk
	LyGr4XRlgIjC8U5YcUoUdHCxuKnwYW4fZSdVZmbNCAx5zGTp+871d9MDx+VhiqQcQovuKwngRkE7w
	y9xB4Ie8CF7Rw1sUcBY3lAJ86a9/pjgrGanouSv+8PjWsgwAXg/oLOnTFfuAilZWjz+tadqlmSIBW
	o5Pbsu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8K0s-0000000HQz0-1vhD;
	Fri, 25 Apr 2025 14:26:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J6M-0000000HHGl-1H0s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1609614f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587700; x=1746192500; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aug+uhhO10dT8SA1KkPf7sPRP/dd7tZddbirMjYFdb0=;
        b=Hd1VCGx17We53ucCAr9S+KXAjIpjZ8CEIS9FT1JNODYM1gbWPwqNGd4ygoRU2XwRnb
         c8tJqDZ1uYh5M4c6sdEywSVR4IL5G2TNeR7riCKeevl2oyzzT1nLSy4/J0lBl/LKsw7F
         2Agwk9GBKvLVTSRUCdtbxGFFIn3n17IHDFYrldKWv9FTGtaq4X3YnrDhQGDfX7Q2aLY5
         XtVWNC/IOyyczVNajNBGS1pIuXC1Z/ybP82eFle4yvPhGktp25F/F4Nq25Dup/YtchO5
         +rRHmLjV7Q2slP6+SXaECf4BzBhxe0dCVi1A2FWZEywxIvEEUqyAJworuIqZ2OFyipa9
         3rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587700; x=1746192500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aug+uhhO10dT8SA1KkPf7sPRP/dd7tZddbirMjYFdb0=;
        b=bFSIrSxpjzUnVqRHw/kobO6rrZoXn7D6Lf07bE8My90pvf1SU+aHKxowLHow011AL4
         yqt671gE5tOmKpZrl0bN4noIB2hqFRvS48Z0Cb6LqO574WhD6sCNvCNJKt/tmzkvmur5
         5M8DWW4PSJKhlf/jFEDQ4XrgVzcn1NVHaK3EBfVX28JomRrDvdY3cQaG3mcLlojVVPfN
         xcNrz2yHpZQrWWCN2VXfr7xkjlWxwGLxpjBz3+AFvOlPmcTzhrC83Xnn1vC4BlvdvrAF
         hUO1z6qXq4YUFvC6k2IcIyOdDF2Re1OZwLH2CCvBe/jomyOseWWovie0SZWl/ARJU/zM
         ZhOw==
X-Forwarded-Encrypted: i=1; AJvYcCUxSApB7XkJ1QMLNHJJr1EeHWwx6CWnf7THZ4sBqJ2ZgiCnC/CNkrrsNQ4LU6EUG840EeisrazupYVBcyO+wob+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx1C6RZqOlqLMQQHgsbc4ayR1qghoVjvAsnBz8TKZc6iyxmfhw
	9YP8dvabU8LMozZH+ZEuKJd6EWvD00RuzrUTVlB9d6VuT6cTiPpM
X-Gm-Gg: ASbGncsTuwg7fi0ARzBrP7OfxojgyPYytr5+NKGahKPVXR5d1Ykvu/OCKuLraYg2eIY
	WyIrxu3pqADwcib8J2BDEGCUqyxSDRcBVTslzXdjJc57YZNP86Tdd4wuSPoJFZ4k5Qq7tyrz/E9
	T4DYqKydb0Dk9coURuqANgS9AsDW9CRGs2oo2SxSYuTGI/3LtSwRgcuKhT7SfeP4SmvHupBYGKi
	qYpIVCoL6mmzSCvkT1U1KPP6VuXeMUFmIxrEXydgFJl3ZBhA+0sjjZk1L9vLwcS169y9ttLi10/
	CW5H4MEX4CRtIG9iD3PBszkSgTN3o88F54Vb764Qaj5tR5CL4dug
X-Google-Smtp-Source: AGHT+IFSGC6ia6yK5H9T8nOwC67dP5jiFTss/M9i30fMyhHSIu9i6Cr1xRw6VNVbGW1I/F1aUlxm1w==
X-Received: by 2002:a05:6000:144b:b0:39c:2678:302b with SMTP id ffacd0b85a97d-3a074f14a59mr1999330f8f.45.1745587700424;
        Fri, 25 Apr 2025 06:28:20 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073c8c7fesm2394207f8f.6.2025.04.25.06.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:19 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:28:18 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] crypto: sun8i-ce-cipher - use
 pm_runtime_resume_and_get()
Message-ID: <aAuN8i5p1HlEkFn6@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-4-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425124517.2225963-4-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062822_337168_A70F555D 
X-CRM114-Status: GOOD (  10.69  )
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

Le Fri, Apr 25, 2025 at 03:45:17PM +0300, Ovidiu Panait a écrit :
> Replace pm_runtime_get_sync() usage with pm_runtime_resume_and_get() to
> simplify error handling.
> 
> This is recommended in the documentation of pm_runtime_get_sync():
> /**
>  * pm_runtime_get_sync - Bump up usage counter of a device and resume it.
> ...
>  * Consider using pm_runtime_resume_and_get() instead of it, especially
>  * if its return value is checked by the caller, as this is likely to result
>  * in cleaner code.
> ...
>  */
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards

