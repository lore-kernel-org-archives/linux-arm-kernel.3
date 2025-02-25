Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F38CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG3YidYogPh0t3kYDq7/qV85q51q4l91jIf6MGtnfZg=; b=kaZhlAdnqO/5WKd5sHpaBViTkG
	k9TVvOjJaCyH1+nuZg7FYywlhiqZW6vyEHrvfY33yPNPpB0BEgatf/fUomEVpEXEymZUeT91CT+0A
	8ihjvdDaStJx/wPAoBz6okaZ/Wc5dcdn5wSnJFze8sEVDrZTHHXOSe/m07noAdtbcJq2q5n5PoMVV
	qSiBOKrgXHhhwk6HX9zikVQHqinghytYFX5e7aZWHv0UAJoxE3nVJ6dFFdVf/urUIKhfCMQKv0hhP
	PT/5gHrwWPKh67n6Fss2fLYm6XF/ySdYszhFzmBwecq1FH06luAciOyOifZvJSflc+gLqT7qo8iVx
	piWSFaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyu-00000000If2-2nPX;
	Tue, 25 Feb 2025 16:40:28 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvwk-0000000HX4o-1GSc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:30:08 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-221057b6ac4so109299935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493805; x=1741098605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG3YidYogPh0t3kYDq7/qV85q51q4l91jIf6MGtnfZg=;
        b=IRLUXG1X2Ppl0A3+oqRJSLvrIF7rG1AV0y1MQFf3cVLaLr+3qEEYcu4Uc4cwcbMZu+
         zsa4U70/xs6Z987hv561Lh/LpfFBtu6zQSk6MnCJFqbYsAlz/wzs00NE2L/rB/6ftrQJ
         57+u3HayjvGJWy5WNoX+8I8vdZv2V+tYtX8el12SUdDjZKlFY/VNOvsJzRlLHYCU4SRj
         Pz2Ok8LXzHIP1uCnTZKZTY9jrtdESwn6syiQLwdbQtiFCqAck5+JDCNzCVh3OSFqVZEG
         GYWXVoNLrOjut4ouVvrcUuDebmw8retVwq8/C+VHJmxEZHyeMQtquo/+4RclqS59/K0A
         bIKg==
X-Forwarded-Encrypted: i=1; AJvYcCUnEARtPi3LvnfUFs114VqaCTZq23Sml2azt6eGs+7TDZ1o2EG59TPSAnzdbfRPsVY4N2a06jQa1vMp+oz6J/12@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhk7Gk8DE+5qBEiYidmIWa0KcyOI3zry0NO/ytcdlg+WlZGFxQ
	p1vMWRA6o+dTzENeDa2/9TS+p+zKzZfvTEWrvXWzwGpzRmHyhnjH
X-Gm-Gg: ASbGncvUxsrsptgOFC9PrtoJEN7yoGfQx7FKubdWqOlFvK9e2WSNNRLlBCazVEcGiP/
	rFKudRnhQ8jboYtcAYKzYPSBP1NNbD/Kb9DGcUbvRErIpmlEKpXlaE6e80jRCkXejUjrF70JBqJ
	v/qwo/vW5F3ayBHxcWD311MyqXZmE9HoURZmkY5gXKKt+31pFfmINgu0IWnV/W3Bm5HwJza/reV
	xFk7cT8EGLk75wt1035ryMhKzMHaeTaJvVMtnUK+5lt58hKvig3r2IWcmndGRovSbQyUBdshTpp
	+cUq01jBHXj+eEysS0PFCmxBB6nE/oertbyq3aAsCtk9kFDtcF8ruBw0hvyO
X-Google-Smtp-Source: AGHT+IHy6OrD/YH6k+g/XZQG11rxQoJ71aizZlrzOaFRpQvw8/aJiJt0N98sszSOwWUy7SbLW5HkyQ==
X-Received: by 2002:a05:6a20:a11d:b0:1ee:d384:7553 with SMTP id adf61e73a8af0-1eef5558ec8mr34863278637.30.1740493804970;
        Tue, 25 Feb 2025 06:30:04 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7347a81eb02sm1607319b3a.131.2025.02.25.06.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:04 -0800 (PST)
Date: Tue, 25 Feb 2025 23:30:01 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	fan.ni@samsung.com, nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 0/5] Add support for debugfs based RAS DES feature in
 PCIe DW
Message-ID: <20250225143001.GA1556729@rocinante>
References: <CGME20250221132011epcas5p4dea1e9ae5c09afaabcd1822f3a7d15c5@epcas5p4.samsung.com>
 <20250221131548.59616-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-1-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063006_337426_6A73C9EA 
X-CRM114-Status: GOOD (  17.74  )
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

> DesignWare controller provides a vendor specific extended capability
> called RASDES as an IP feature. This extended capability  provides
> hardware information like:
>  - Debug registers to know the state of the link or controller. 
>  - Error injection mechanisms to inject various PCIe errors including
>    sequence number, CRC
>  - Statistical counters to know how many times a particular event
>    occurred
> 
> However, in Linux we do not have any generic or custom support to be
> able to use this feature in an efficient manner. This is the reason we
> are proposing this framework. Debug and bring up time of high-speed IPs
> are highly dependent on costlier hardware analyzers and this solution
> will in some ways help to reduce the HW analyzer usage.
> 
> The debugfs entries can be used to get information about underlying
> hardware and can be shared with user space. Separate debugfs entries has
> been created to cater to all the DES hooks provided by the controller.
> The debugfs entries interacts with the RASDES registers in the required
> sequence and provides the meaningful data to the user. This eases the
> effort to understand and use the register information for debugging.
> 
> This series creates a generic debugfs framework for DesignWare PCIe
> controllers where other debug features apart from RASDES can also be
> added as and when required.

Applied to controller/dwc, thank you!

	Krzysztof

