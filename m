Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B933CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 00:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h2qt7cX4wkOJdidtitj675lsDv11ElI+DmsZjJn27k=; b=H/o3qreWtGLHCn7rXg9PxRpOIy
	sv6aja/WQXVFVun9TIlLG4hXvFuUeaQ1/deKR/GLOoja+YTRHjj4MwBR851ubpFUNMa7pd93TEvWy
	Xzu3XPe4EzD08zLGdVSLiumXvFqfWn+E6BvffaaIteuJnf4WCMVuXeJGLqpLUIVUdyKgLh8EZelaW
	XhTprXVIQurzH5b/UtUCcVqtZnKyB2h7bgAqpwATomtJ4UvRmYBnBUJTDHpWGvTLFjyGoIpRSEIdP
	yQb6vUnsQ3uNFKaVvEPtqOvCAvwO5VxJcKQ8ec0l/4s9hYSAExU+qR4MCxX6X3m8ogyEg08PuE8Z3
	fjEnCjow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO42S-00000000Oc6-1cbN;
	Thu, 19 Dec 2024 00:05:12 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO41M-00000000ORz-1IkG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 00:04:05 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728ea1e0bdbso220044b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 16:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734566643; x=1735171443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7h2qt7cX4wkOJdidtitj675lsDv11ElI+DmsZjJn27k=;
        b=rPh6UIHJ1uslOEpXWN+kumA/HuyM9QN3PPSBh4UEaTNgN7cUfjF4iJUFDJi27Dk9ZO
         yFvaQdF/Y2k3p6fS9aBbp1Pc9Bw1iLjvGk5XgrE/WrfhNoC3wIi513SE5wItDxK2g66v
         zfEH8GBvNHI4lGen6i2dvQrd4YYQX9SiwkhgGvln/hO1ROe4it62lUb5BKB1u9QT0n3p
         /yjEnnhrHjiE5F071Y849BnV6w4ReVCQ9+seRbvJgiYJt1EnAsLduDF6sctBztysPxoh
         rnf+2qTwiVSEHtFYT07zeWUhUYyzEODDndhcE4r936pDQEBuCAfkEpPXw+uNyEcLASYi
         6hIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5K5r80npRKsntS52fjBfAhP2CkIPYve0YYnYZJ9y4jBmifWwYtLhASbLUv2ftINZHfYZuqGeE6XKQz2BoJ0K9@lists.infradead.org
X-Gm-Message-State: AOJu0YyV2psck9kyfcHlkscE/JzDpN3itdGXITbHJMg8fAa86S8LMi4f
	sE66YyvUHKOajbOZwSW+YHJO8AtXD4BgWevV+ceh+KIaqCBRlKY7
X-Gm-Gg: ASbGncsO5x0XkeFeZPVd88/mAHdH9JLvTAANFmyCc/GH6zb9omAYUu+466tW/T4ZgId
	F0NcIS9MDrDa5m7Xgox/s49g5q03psjHE5S2hP89MYonvnCaVQNiBMYLr1588tXrskURaIbm7Du
	46E+IZMiPyYCfdSzxYcuf2M63myXEKYkNHNFGxUPZqlZ9BnzhawKVqF7m4W2oL1mgB1z5KkBNHL
	i5Rf7UZF0ofaonEf/c6wk0aD4LTIrQnuNyripjGl5SDopsmZ372ysaILlJdGuaCDxgs8zw/1eH2
	kVQbf6rWve4T4Qg=
X-Google-Smtp-Source: AGHT+IGdNF79Ot5u4D3U5W5J4oLFxdfqxI4VcpJ6oovCpaAvbnw6UlehMxVCYzUAjwiivmehIBRWZg==
X-Received: by 2002:a05:6a20:a124:b0:1e1:c8ce:e7a4 with SMTP id adf61e73a8af0-1e5c764799amr1933761637.20.1734566642596;
        Wed, 18 Dec 2024 16:04:02 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fbac8sm45302b3a.159.2024.12.18.16.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 16:04:02 -0800 (PST)
Date: Thu, 19 Dec 2024 09:04:00 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Thippeswamy Havalige <thippesw@amd.com>
Cc: manivannan.sadhasivam@linaro.org, robh@kernel.org, bhelgaas@google.com,
	devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	bharat.kumar.gogada@amd.com, michal.simek@amd.com,
	lpieralisi@kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for CPM5 controller 1
Message-ID: <20241219000400.GF1444967@rocinante>
References: <20240922061318.2653503-1-thippesw@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922061318.2653503-1-thippesw@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_160404_351195_CB63431D 
X-CRM114-Status: GOOD (  14.21  )
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

> This patch series introduces support for the second Root Port controller in
> the Xilinx Versal Premium CPM5 block. The Versal Premium platform features
> two Type-A Root Port controllers operating at Gen5 speed. However, the
> error interrupt registers and their corresponding bits are located at
> different offsets for Controller 0 and Controller 1.
> 
> To handle these differences, the series includes:
> 
> A new compatible string for the second Root Port controller in the device
> tree bindings.
> 
> Driver updates to manage platform-specific interrupt registers and offsets
> for both controllers using the new compatible string.

Applied to controller/xilinx-cpm, thank you!

[01/02] dt-bindings: PCI: xilinx-cpm: Add compatible string for CPM5 host1
        https://git.kernel.org/pci/pci/c/5c911b4659d5

[02/02] PCI: xilinx-cpm: Add support for Versal CPM5 Root Port Controller 1
        https://git.kernel.org/pci/pci/c/

	Krzysztof

