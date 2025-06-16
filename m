Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF329C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqzxOBMLH7wnd4MoqI+z4U0qu3t3OgvxHrZ5MX4ejcA=; b=T3dmTUms1QPRk+wlNvjVHLH4Bl
	OzAJoRCiGRkLSmKDktfRGxS0OK0APfbLjgMsoEhjY4Xyvnxz3JiEHdBMync2e3MDl61mDCCI79ZLj
	YdOZOop1bk/ie0Xbcm1tjWp2dnfIRXiDqbKjCjrp+29Qvy7Emuw6OfoQMW9jjTpl0ME22g90JUYO7
	cx70Fudh0ovoitMhEV9hKMldDMLuq+X6PIL+3KzGjrddvZZt2oQS4v5e4ldOYotMVmY2ktVUSNaDB
	+3PJ3/RF8706OtGo2u1282XNZQgau5S+uOJYYpScwhNgbIEDyPHzKfAVftQyMABTPz8IDyS+GoQo9
	KSgN0xgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIOk-00000005hqC-38Vy;
	Mon, 16 Jun 2025 22:33:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI7d-00000005fwg-2EEH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:16:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2363497cc4dso42365855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112169; x=1750716969; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqzxOBMLH7wnd4MoqI+z4U0qu3t3OgvxHrZ5MX4ejcA=;
        b=HXxyzL2V1JKsdAHevU158T7EuL4glBVZVChitNfw3dZcHiKoBDvaiogTaZLomI7CuS
         shBxv2rnSupXvF91CF2iOZ3SoAoKU0HkzZ+iJxNa9YOsFLCuq3pCgcHbzR9Rc4kPM9bS
         5erfGaq5gAvNQ9dRckYTGLPahRiDlV31tETQGF6vtreaYbcWrEKMdJsKIr5W2LKBvvUi
         xlYUH4dQKRUe+98Mfu4vbpMm3DsBzdsrFDq4wPUsbr1rNziaebZT1sOTJAmddphMUrsf
         yriJrNxEnn7FffSQxD/DpcbPyX2zWnypmSipnfsNaL5wJcdDAWYC2cxj/U2T9XBbCX1R
         K+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112169; x=1750716969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqzxOBMLH7wnd4MoqI+z4U0qu3t3OgvxHrZ5MX4ejcA=;
        b=jzcNAo2HJ5SXDqg7qRheAVV2HyKBX5xk7dv2nhDfLzVypfzhzyLA1+YkmIZFFxDoL3
         pCjV/cMm+8VBoOQlq4RhVwCp2NQoH0lgBW7UgJMyaMgzhZ94/Sr+tTdkY8IfsGnVXzy1
         kpCJDjrazrH9ka+zRPs+HK5eqCMerIYET7uYUG83AAMAnxqLCydtyCRmiK472mQqxeJv
         tkLveQsSYKEnOI5j7Kmu1aLNuaOrwfBRBVOUlQeemxBJG1+RIEB2V5c51iG5sp3JPbxY
         1VXbZ21YR6A91jwelh4i9Keo1vvxVDGvpYWxVzzwF+yd/d/ftkgOrXPGAVxu1Udb1XaN
         IOeg==
X-Forwarded-Encrypted: i=1; AJvYcCX5bGFXgbyEvLaPNoTtIoLZaBC1rWTmmWKf+WQQxhhXH8aiwUAj0+ADNxQIax/djXUkLVKVIFHr1orK8dxgpONz@lists.infradead.org
X-Gm-Message-State: AOJu0YwRWIugeLvXzHv0RICaHxH+HAZ5Z4V/x2zDU1H7M0LsxKwhrcV5
	rthBxMs6vAPGk5Fhhg8myM7/X+h6cN8iEugSfNqiEjSYFeXrMu7eSE6r
X-Gm-Gg: ASbGncubS8DKouAtjSU6+In+WWqVF2Htpypv7vcSk4E43V99wAl2igARi55/6ctG1R9
	Z1MMr/syjnWN1u/j8oLeMBi+6KOR2gP5Z9qW2e9cBD7Tpt7ML9i34R+2+5IyxpaMWfHu7XuXgek
	zUlkZY9toGDVdqkE9KcfAYd9ye8zbMgNJ6l8tFdDdZHVHXQ8CGWrLDhjwRf9lUC/N/0MUv7wYkR
	pb4K+EMCK+7uhfNZmXCgESIutN61+hWftRUXeNF2p8k4dIf42q9jXn0pWJn9U29c0Nsvo6fguCR
	y+SikkVk4drsVMf893j4VJh0IBI5rMpBHrwr/OCgU/GL0ItSsedwaa958ctRI4rKtKNiCo8wzBQ
	Hj3H9J0RQiw==
X-Google-Smtp-Source: AGHT+IE7D45OxaXOpEnSNmrkvBGVxdNdlxgSulu93jAwXQec/wc9R/9wjbBwJ4aaqqfW5jX8XSaVRg==
X-Received: by 2002:a17:903:320b:b0:236:15b7:62e4 with SMTP id d9443c01a7336-2366b1443c8mr181687065ad.38.1750112168797;
        Mon, 16 Jun 2025 15:16:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639dffsm6286948a12.3.2025.06.16.15.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:16:08 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:16:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 1/4] hwmon: emc2305: Add support for PWM frequency,
 polarity and output
Message-ID: <d6a0d179-1fce-4b3e-9f3c-3dacf05cc22c@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_151609_570401_A9D4F6FA 
X-CRM114-Status: UNSURE (   9.13  )
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

On Tue, Jun 03, 2025 at 02:31:22PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Add three new attributes to the driver data structures to support
> configuration of PWM frequency, PWM polarity and PWM output config.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter

