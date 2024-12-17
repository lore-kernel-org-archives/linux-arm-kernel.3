Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C87E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d87CX4sPJ2SFFT7xE3ytRCoiviKYTjk0B5BoSWiSUsE=; b=1IuwEOoFk4egi1oFy35tyEbt1C
	K2nln/GZptzBcTR0+5dNDxyq2Sb7hA5eGH09RgG4ELbnf0aW0c2LMHxY1bmoMzGmUOem/C+QjGLdZ
	/rMKhvlBrnwPGcTHvx/Yb6A+kmHeEYtCUcwPVYZ+fMKOLgKl9cLr5yndRrXCSJ5i7iPFgHd/QxccE
	L0znRHVPZnyt9ism/0f2yHFai5EY4BXjSPEhvfHW9yltyypYQUheafDB5TJh2PGSUgkMcktYzWQ5g
	6pU4O8CDpYPgwUaaRrVfAkazN149u5Znbwrkj7fL73Z9w0vg8x14fhTgXXXaWRtxmPnhvQ4Ty5wS3
	/UFkohvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdMr-0000000Edri-1zWu;
	Tue, 17 Dec 2024 19:36:29 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdLl-0000000Edhu-23hR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 19:35:22 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-728e78c4d7bso38021b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 11:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734464120; x=1735068920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d87CX4sPJ2SFFT7xE3ytRCoiviKYTjk0B5BoSWiSUsE=;
        b=Vz1PprL5XTrLGWW8UCokfMrjF+spd8FxDyTEOsyslZ51njuZcVdu28nHhrJ3Q1dF3J
         SsrTbs6mvm7SJW/6fr8RoAtwot8zu6aPpHHwnmeBiS6xV6KeLDQpewh3xIBtzq12nCqz
         5jjE2sneFK+ACJNQ13kaDyIJprGAeg5glrpuC5avHAcOvvEITV7jWuwG2YaDCSoTfg4y
         6EMfNKqMV6byXAvCqrVkTzjn+NBLvqOI4hhE1S3JyeFYJM62uaKyX68w0M/wbLRPoTzG
         B4TCK5dQygGfd1efjs1k1Hx1QoMLHtpNYUBqHXtXZc5xGpIf5OrnjBWpNpR2mOSOM3dB
         TTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734464120; x=1735068920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d87CX4sPJ2SFFT7xE3ytRCoiviKYTjk0B5BoSWiSUsE=;
        b=t5T34cF714boYe70llifq0i/POIy4tGq7/yGsqmdtztZSlnU3CzFzyA6AgqgDLExTc
         cfMXkzBLDDccghLlQu433nLiUtMeuYurRuEcikC/y6rrXcSZmwIJPkuoibYyrjK/S2at
         46iJNyJFIEx1FsXQrx0dMdfQw869TKnEAkAGvzB8Z2KZgSS7a7LJNlyi7i4FbROsRIpP
         r5XcyW04eArdNwmjJ+1BflixRCK7xye7XqRc3oJqjiK+AmyhG8V+aAwzpiaFE6IjBsJG
         Q00Z2FUqredDJ+n4ynqcZ8Idb4TmPXC2hpqPyVlYS2G/40T8R1gd8EVVrn47MZtqqP9Y
         NUQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Xe1CMn1RhgbmJ+0o9GYIlvmzCGhdvbbjmPYUsKnmdVKQaMEJAfvBqoq3cVQvqOB2FQt3Z3UDwxT0xTT1jSeR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl7HDFc8vmm4/+bukf2UAHqcvJFq1rLEV0B7I7uvv97ERahG+y
	LBdwOKBmKBN4WU18PCt0KYuWEri41cgz78bqwqfvzmgzWBbRvNUsB3X1IwcdjA==
X-Gm-Gg: ASbGncv7Bbn9d91apt3+tPWXYGxl+7hMyrsxV0yN94zW+JcaXQVv4/DPCrwzivhkVrt
	wwGJtqOvhEOvKVn+04GSIswH6XOaexmdTNSDomlTFzG6xAxFBMPVeV1BC3UCoNBJlJme3g1+Yca
	Ii9NsqA/ulK/fWtRvYOReYFb1CHz5KPP8zeivl3z58tooMY1ZS7Aq8y395aMCehV91f7ySTib3f
	a8iY1eEL7wNfOJu7txUxyiU5y8J28avCtRUFex2LzXmtgL8uckJ4+5XA1DJ7QhOLrL13zjQnKOV
	5Ejwqd6OV7RhCuXqKt5jTbnP
X-Google-Smtp-Source: AGHT+IGYtQ+zUFnfNfiNRBX/1cbObzVwvveviWhy/ECfWtAB1ZGYKXCWjAdhChwSqe5/tliuvTSNgQ==
X-Received: by 2002:a05:6a21:9010:b0:1e0:d3e9:1f8 with SMTP id adf61e73a8af0-1e5b57f435amr24707637.10.1734464119628;
        Tue, 17 Dec 2024 11:35:19 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac53fesm7002639b3a.30.2024.12.17.11.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 11:35:19 -0800 (PST)
Date: Tue, 17 Dec 2024 11:35:16 -0800
From: William McVicker <willmcvicker@google.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] mfd: syscon: Fix race in device_node_get_regmap()
Message-ID: <Z2HSdK0wwaHXEWMJ@google.com>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-1-4f56d750541d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217-syscon-fixes-v2-1-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_113521_541132_7EF2AFB6 
X-CRM114-Status: GOOD (  14.96  )
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

On 12/17/2024, Rob Herring (Arm) wrote:
> It is possible for multiple, simultaneous callers calling
> device_node_get_regmap() with the same node to fail to find an entry in
> the syscon_list. There is a period of time while the first caller is
> calling of_syscon_register() that subsequent callers also fail to find
> an entry in the syscon_list and then call of_syscon_register() a second
> time.
> 
> Fix this by keeping the lock held until after of_syscon_register()
> completes and adds the node to syscon_list. Convert the spinlock to a
> mutex as many of the functions called in of_syscon_register() such as
> kzalloc() and of_clk_get() may sleep.
> 
> Fixes: bdb0066df96e ("mfd: syscon: Decouple syscon interface from platform devices")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

I verified this works on my Pixel 6. Thanks!

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

