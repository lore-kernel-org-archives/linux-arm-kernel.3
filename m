Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5A6C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7cLRomgT9aYrM8YJE7hwcT94wlH0qz2XRoudr3Vr10=; b=kWoo3DOX3RhURBCKrAotcBx8TR
	Cq4JiQJa+pmwF+1KyFqKrxj9Duree+IoxNFR1IaGcsnRe+1jJb/qglFHPLUukGgn+07LJew2eTCJh
	Sd+h75XuJz99idBb6OrXpsvRVTbiVbZRNkaP+l+DfPfLi/lNLCxYBp+dp14CeWtJmg0ws0ylLQsmq
	TB9DIQ1+LS+X88E8rQpXpzavgOcxDzMV1YarxOFklJ2FMNdHEySisab6OGJXSUizkFLbeIrxB+pKP
	vpG0vYsl64mH7JAktaVjru+zUmbHOBlWxll7g6yie4QQT2okmi1DfgKAyeRjN4yMe+o2NgtMf+vCt
	z2bKb6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP46-000000042ZU-2hqu;
	Tue, 04 Mar 2025 09:59:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOz8-000000040tm-3kvT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741082085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7cLRomgT9aYrM8YJE7hwcT94wlH0qz2XRoudr3Vr10=;
	b=EpIK4TPKyeOlUZJPE1EKEGuWGLoBQOI6tldqqhG1E79c3QOPdVzcCWlwlCydHpbcJ702Ee
	6JooeZ1BcSDKL/qPe20jvPYZTUYJZAQM4NbKaO+crKuQow60AWwZ7K0LmNGKgkRHxcpTNm
	1++oJrWAX6JXb6xVj1c6TSjKbF83nLQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-5cmCG9xrN1O4Woxz5J0HOQ-1; Tue, 04 Mar 2025 04:54:38 -0500
X-MC-Unique: 5cmCG9xrN1O4Woxz5J0HOQ-1
X-Mimecast-MFC-AGG-ID: 5cmCG9xrN1O4Woxz5J0HOQ_1741082078
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso37969245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 01:54:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741082077; x=1741686877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7cLRomgT9aYrM8YJE7hwcT94wlH0qz2XRoudr3Vr10=;
        b=aX68SltMCa8nKgiqmTnAqPVm5zwlM3SOphi/ZmlxIWLW74QfZ6CjT4nZul8RtAV3u8
         en23DK4yZ5EO23O3kSUUii9Fa8dzH8QoppGHC4u/kKIA4FXz26FKUaLG2G587gKjBUFl
         9u8lNW2wPkx4QVR1lEl8AUmO5gffTYjoBwQVXdUv9QF0c3UDw8CvdORlKJOD3E7x+zgm
         GL84B0tIUJuV9QFFlCoUbjUvRdKBwgyvik8HNa/UzP0GAxU9YlLdD/TRtx0Prbcvg5+h
         8zYFwXKz4imwhSkvuxyQxuYrCAViMocIijb9KuKTGT39IgN/oafRRyN7dRQ4p4WL+3KI
         RSJg==
X-Forwarded-Encrypted: i=1; AJvYcCWhUlQRot1pTXy1lA07fW5Ib4yMnEq74hHyaLsnNP5ZAFKMc/C3oN2GczLpqc3oCg96ECHEM5eFIMpPkXcuBLau@lists.infradead.org
X-Gm-Message-State: AOJu0YwIScE9SW3/3VwWKPYljaB2ccJviHcVrqkYZkCg+28xZkEjWNBd
	/XWT1tEaBRFdIJXk54npyI7DVc7wue+6wihtFvFU+qkfO9tAXoVDNYWzhv1vxD1/92nfgzKkUbD
	mN5xz90brEU10vL8xDarRntl7VZ6GyI4Ct8t98rpI2HZNscXLpKFT56M5Yu89TfYAb32LcZ+0MJ
	XwmKrU
X-Gm-Gg: ASbGncsYrxcuMlv1HTA+ULgVDWDRb70LSskYfKcfBoxNV5fm9nzwKjTmtYwf/82SXtN
	n4vGX89tWjGRhV5MhLVZsxGua1v32CJ7tiLv/w5oMytpELaC6sBiEg3OxMvhXGh/XlMKJXbr7V4
	0eyplLEv1haMmtX0SrRvHkSViq54Ie8adgAV6YnDO89YrcWL0RofnMUVTU2ybTtyTCrU6ZU1Q8W
	dqqA3BedumD4muzOTfI+PDp472BuE9/Z7mSU5FqdrLe65gv6IkGZqg0fxPCZDkeVtxbU2qbUMlt
	d2uptjJWk79TjDFpFOUO6l2FGr3iHFAwmWkwXr3Mb93cYQ==
X-Received: by 2002:a05:600c:1c8c:b0:439:9ba1:5f7e with SMTP id 5b1f17b1804b1-43ba675a843mr118312515e9.21.1741082077446;
        Tue, 04 Mar 2025 01:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCYvnIe76LEUSPaxBjczhESkT9xksjygv9YFGPgN7D+cz81nubOVGbUrKCatMMMLTJvcstbw==
X-Received: by 2002:a05:600c:1c8c:b0:439:9ba1:5f7e with SMTP id 5b1f17b1804b1-43ba675a843mr118312285e9.21.1741082077032;
        Tue, 04 Mar 2025 01:54:37 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbc030d24sm82094335e9.22.2025.03.04.01.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 01:54:36 -0800 (PST)
Message-ID: <48885074-b590-41e6-9794-49ec12713cce@redhat.com>
Date: Tue, 4 Mar 2025 10:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 3/6] arch: x86: add IPC mailbox accessor
 function and add SoC register access
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, David E Box <david.e.box@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Russell King <linux@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-4-yong.liang.choong@linux.intel.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250227121522.1802832-4-yong.liang.choong@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dzCXhhPmrsI7aCFEsBkQAG54XUtHRYlE01T_6XEIECw_1741082078
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_015446_995698_6C18FFFB 
X-CRM114-Status: GOOD (  11.73  )
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

On 2/27/25 1:15 PM, Choong Yong Liang wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> - Enables the host to access specific SoC registers through the PMC
> firmware using IPC commands. This access method is necessary for
> registers that are not available through direct Memory-Mapped I/O (MMIO),
> which is used for other accessible parts of the PMC.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Chao Qin <chao.qin@intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

Hans, Ilpo, are you ok with this patch going through the netdev/net-next
tree?

Thanks,

Paolo


