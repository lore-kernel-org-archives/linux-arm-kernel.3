Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1BAE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxD5AZV9DayoSXRYg+9hzpbHGYO21ZbSkS34RH52Yus=; b=Ingf75hEXf9LRszoF68PUwwrhP
	1Aq/XIa6cdexLCZYXegKEGgSixC4KU8o4ipD1dnik4bnSakc/W3PuZnUrOAZHVMcLeJ3r/BEnr+SN
	tH0ALBQpISBllm+jHyLksFCZAXh6DUJp5q4DCaqDQT5uWH6PgPO/0of1y/tCGyrc2um0+oGXkmcjS
	A+FZLCobgUSW/BxxeLrXTlqg6iZq2DJLzMwQECshi+dYEFpe6l68HC+WYdkC1RyHBz0BMKTawzFtE
	/eW4jbi1o+R9KjDBtGoXkgaexRFw8ACx6n2v9WISkmsXRn+1y2d7WgnA4mdEPvW4CSOA6SmL2gf9P
	4aSV7ADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaxz-000000026um-0sGP;
	Fri, 06 Dec 2024 16:14:07 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaws-000000026W0-2KYE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:12:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53e2baf3160so1423319e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733501575; x=1734106375; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lxD5AZV9DayoSXRYg+9hzpbHGYO21ZbSkS34RH52Yus=;
        b=26UnIDB9ycaepuq0rWIHLvrjTW0iav2/Rip4atUt/3EU0CM18A+ueeEbRGoMO7Gmx6
         DtxarKSL0XGJWSJBIeeyN8hJz4pU46Dz6Q4pFO/2LdI0JAKNu7Amj/grCaHGr7s3nm6/
         N6yU2fEnTzx4bqMNLD6z9o4JDopntuKVWSSpOtbtqOrARaPTLdQu4tdaR+PzrzKp9A5C
         iqaKfKvp2HSt5TN2X6l60Q8JF45gMKKGgZjK0rW1qfTTcC4x1WAAYMOo4o+zLon+Q8c8
         2WchoGT6IFzYjrW6es2ED81FDL1MoZOniYzAe7F7BVhNcZJIK/YVjwc2AtHuK0d12uEN
         YukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733501575; x=1734106375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxD5AZV9DayoSXRYg+9hzpbHGYO21ZbSkS34RH52Yus=;
        b=wlvyH2tPDnUDQkgkBnM/4iFCmpNYnWrfM54wl8NIcLFvw7zXb7zJqul8nDd8mXrcBH
         q9NohgUHo+NOjnrtVl10DXVGk6mbijCk1RsNoszBXL+HMAqBGPby0xnbru3MoeuINvN4
         OqATa00WAass/4TGrIXV9lUjBHPmkEIX/YieBeCvM00puoCvepETyLJjEwnmixtE0+z+
         W66kAn6D0PkpraFAxer/IwGG/xVAcSPbWXC/YCFov0fR5nl7o+EqDzf74uvZHdMfuCeO
         fC5A4TJzrqhDHiEyFpbbq5IwQL1Hj4H1fH/XKkZZTsnMiakWY565EVEenv1lr/sjmv/a
         PepA==
X-Forwarded-Encrypted: i=1; AJvYcCXS37XHFIC7iw8gdo49EbevL/t/TSLBdysGpXQMMyiqFnTGe0c9hgIwS3dZvwmXrVuz/8Av5gP/nRLXqF3+eL5F@lists.infradead.org
X-Gm-Message-State: AOJu0YxL2ppUoeSyMQ5nrQPnR8VLd56KXLViTsHUnMIDHYs/ezUAizkw
	qKchHnKWZ9qV4zMMedBc3LmD79D0JopQJgJ5ifTxWUaz8DcnuP8gPLw1eNxttA==
X-Gm-Gg: ASbGnctVxw8PCGaYNEVoNhFzAlkgsZLcMLPJiG9r2fI2w8S8An6oca+PfpvUn//bAh5
	bE1qC3grPW6V5MRjvysefHxYPMG+uBdOnMZjae08e4ostdv22fuYFkNf6GEcufnL6GQsdazfzV9
	DUJZ6/ngqFfYqd1kpFj6Wqmp2yRx29imR+2dE0+ei7mfEN3+4QOF/8LRLDF9CK9q71wXgfDg/Am
	BzQ/I1Vc7hBFEMK3WZX+biRdw1QtwqcY4J94oug9eAIGDrwYg6Nzp6n2mxIi8Y6d0DGXkE0/FR/
	jSSTpoZL
X-Google-Smtp-Source: AGHT+IGa2N7cTRtb6lbjP9CahxrYnMwp7BFPpNclv1nu7zbQhYjkfiRnsZDFOvKnxHHo3QTqnrg/ow==
X-Received: by 2002:a05:6512:308f:b0:53e:1ba2:ee1a with SMTP id 2adb3069b0e04-53e2c2b83bcmr2156579e87.20.1733501575334;
        Fri, 06 Dec 2024 08:12:55 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58dbcsm258112366b.15.2024.12.06.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:12:55 -0800 (PST)
Date: Fri, 6 Dec 2024 16:12:52 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 01/14] KVM: arm64: Consolidate allowed and restricted
 VM feature checks
Message-ID: <Z1MihH-aLq6lTccm@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-2-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_081258_625423_E99949C1 
X-CRM114-Status: GOOD (  13.37  )
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

On Monday 02 Dec 2024 at 15:47:28 (+0000), Fuad Tabba wrote:
> The definitions for features allowed and allowed with
> restrictions for protected guests, which are based on feature
> registers, were defined and checked for separately, even though
> they are handled in the same way. This could result in missing
> checks for certain features, e.g., pointer authentication,
> causing traps for allowed features.
> 
> Consolidate the definitions into one. Use that new definition to
> construct the guest view of the feature registers for
> consistency.
> 
> Fixes: 6c30bfb18d0b ("KVM: arm64: Add handlers for protected VM System Registers")
> Reported-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> 
> ---
> 
> Note: This patch ends up being a no-op, since none of the changes
> in it survive the series. It's included because it makes the rest
> of the series flow more smoothly.

Is the Fixes: tag above really needed then? It 'risks' being flagged as
a -stable candidate, but should it be?

