Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867D4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0bz72reqaQ/H0ufrjl/XM53e5Ks3hOCkEwgmqzh2C4=; b=AuE7cmAexkzGH82NwHTJxL3+si
	iOqelgSZUQjbfHOB3kFsORf2sfHZJBAFo9FZZH+SL8ywDC22JpddUiN62gYCTEeMLWdepsKf9BJ92
	/pPiSmC+8xV7NUyugzJDlml2ArWLT93/KtqfrmOHZoEl4n/R7mfNbA58toF4YrMYV56N8qJ9kGRB7
	zNQ9YAbh97jwNP44CcPjt98qegpP+AjbJQj0Hwj+reUD+Un4+bW4yQqBrSFKpPDknti481M4oWuul
	hTYmBHxm23lQDBMjyYuBUWjAnmdIo5TW41CYaAd1Qa0y2Z1fmch5o9pYEuu9qzLyGbW0CsPdFDoIp
	/D2DMucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvmJf-0000000GayN-1ZiG;
	Sat, 22 Mar 2025 00:02:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvmHy-0000000GalQ-2dQw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 00:00:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2239c066347so60297815ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742601634; x=1743206434; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0bz72reqaQ/H0ufrjl/XM53e5Ks3hOCkEwgmqzh2C4=;
        b=ajkOyrvUtNhOvV0OCYqIgKSyCH8afuNKteVULzS7QFfvJ4HPN7GtLxkx1YEVxOuWKN
         vzy/6Qw7Pxg8hTEeWh1SJDgbbADqcLoZW+EA50fk6AHXnl4eyc7KC4kvU6hXvPLK0AGP
         voeUnmMrUqN1Y3xxYJf0gNRgVRvusUoVs596s/pJU/96UURh0/+zLBd5Mk/8l5byBQZj
         sdm8ntmg0XlPbuoJtceJmih0NCkS8zCpBiqIXieenUlH4EiL91CIU+UJMjy6RIw9yNG7
         439ale+uLdSqfsdnrla/1jJgddIxT1x2bWRVfS85DB9h4IjIKyQL1bfsS81RF2oAG9lE
         Utjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742601634; x=1743206434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0bz72reqaQ/H0ufrjl/XM53e5Ks3hOCkEwgmqzh2C4=;
        b=K0JxO+m4voYh+G7+vXByFxH9K/vblJfMFe9HT+9VAmHZ/0KqFFZD/f8zWucoiZQVzL
         TI6z3QTrqfLuQqYXLQm+amCaR/UgZs0iFL54BWXd6nzsQkJub2q0gcfW1Cz/kM8o/3XR
         QzKerSDMRS7pIznLT+yjXGzTtkmLBLAz6BpDYQ2Q8g2m5DnApcaTvXej5IOig18rrQlw
         B6PeITym20UWn+x08VvH6/s4lRSiUhVPDd6MyDmgdjqCc7Xqr2Au8LOlFPPKTLiNeyCY
         bO9Cwk3DPVHAo0Gtd9fkXq2W9UjH5PkOoSoh/so+N5vb/0ZL7mJhNT/+oQC23oLhtH5O
         ZbZw==
X-Forwarded-Encrypted: i=1; AJvYcCXVWQCv2uMFZkfkMoM4lXErulJlHm7qGvmrM46Hs245K+kj0O4TSxmXFrhJys1O8R6GLG3FUrq5gCz3/EokO+XT@lists.infradead.org
X-Gm-Message-State: AOJu0YyvxcT19BN5ZoVm474PiAnAIJczE9r0GOABkTGfKm8VlnXZy9B6
	Ezgvkvo7euO/kgOlfmrk4KFfl671b0Gr+JY1jkUAWIfgf2kwvevJ
X-Gm-Gg: ASbGncupcrMrLOPDBHJ9PbXjgWKTL9ueZO5+ELClP1+XKL2wualNvtiqHP76RO574NK
	2oSuYRwxVF1cId0p1ZJLpBBl6nLeayZpMhAAc/uHFOmHOrWbDpf4m6RNRF19c0cILFFS8HMA0Ea
	hTiybmDF1yPnLybQ3SvO0Vq+YyT8c0oM3jt6v6JpxVPWot+ujN4micN8XFndozC7JAXYzU1pzf2
	sIUnK0/sT87ynYk/an6hm9bSfoNsbfjg5Eg0UAw0A4KBYf3i9H+sAWmwimx5JsOduZrl3H5sa01
	BguykzNt0eRxOdLTw8wKWeh65ZaUizcap6iXwfuBySaN7BZ8DLVtnsmcRA==
X-Google-Smtp-Source: AGHT+IFj0ZbpdzJ3fOyHNqk79NMnaiYgxK/9tCAa9k8zoUUAbUTFn4ESNw1AVqIEpEFRcJAovc328w==
X-Received: by 2002:a05:6a00:b4e:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-73905a2300cmr8976502b3a.21.1742601633562;
        Fri, 21 Mar 2025 17:00:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73906159f8bsm2697861b3a.155.2025.03.21.17.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 17:00:33 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:00:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
Message-ID: <cf20e703-5770-4bfa-bb5a-a1f5f03f56c0@roeck-us.net>
References: <20250321143308.4008623-1-florin.leotescu@oss.nxp.com>
 <20250321143308.4008623-2-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321143308.4008623-2-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_170034_666674_90ED45E0 
X-CRM114-Status: UNSURE (   7.96  )
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

On Fri, Mar 21, 2025 at 04:33:06PM +0200, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Introduce yaml schema for Microchip emc2305 pwm fan controller.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied, after making the changes requested by Rob.

Thanks,
Guenter

