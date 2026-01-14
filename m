Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AADFD37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h38yxI+Yu/9dFGuGUR3LKj4LUkkS33DMYVrIMJ5AZY=; b=29eImik1kZln9JnkGjNhSujZ+8
	K54xGL9dfCDTOVlvpDPpx7kecZy13FdyLe2bUls2u3VDsXT/r963VFd2Q/mA/qF5xApRMqMa7nRJ6
	fJYw3FAbqOT6vMIlYnhJUYpanTOcmuEtEGZvn1QRBXrO/xRZrkJARUvnEGHNMA6PFVzXHI/InU7Ue
	keSu6oEGucVUGbsYMciSDWbCLPw1ZaQ2IU2xBRxYS/0CT+Aza9fUXsLMIeJRWbKAtAnacOWi/UCXH
	hPIZ43Mb38f85XPkGVILb+qH3xIoiEm6kmYlFkmO0coHYSXSNJOL3cWjLLHlQbH7l/xjptP3wnAo6
	wqLplgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3HG-00000009pMA-3c5i;
	Wed, 14 Jan 2026 15:59:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3H3-00000009pCk-1bDJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Jan 2026 15:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9h38yxI+Yu/9dFGuGUR3LKj4LUkkS33DMYVrIMJ5AZY=; b=A96npf/5lyZuC+vccPR/ziy+AO
	KwmJ/VDF6d1T1cMbgLUHiPsXVYnkUntsaMA7nj7QfLZXQFJZus+fGiFEuMG5LBE4oZMUcLiXxsp2F
	kA4vf8gRCyWpfs9uiTckr7sDjNZy8ubzGwJNYChiQ2QpZ7I+jcqMFHbqIVuAaWBRb2ADZM7Zb0fOq
	Dzrmh8xLiAE0m3VcFy/FTu9PjtJUBLF31GBeDkJTsPMI3l0njZq9Kgm97Wr1lDpjTCxlbrW5qQLL9
	q7WI37zA0T8er/ywFQD3JqcVYlxkaSK9pUh6fReYUPDyV8hH8SShv3zqfxxYiBZLnoRyFc4TTlriA
	cxI4l85w==;
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3H0-00000005BcS-181X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:59:07 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2a0d06cfa93so77735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768406343; x=1769011143; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9h38yxI+Yu/9dFGuGUR3LKj4LUkkS33DMYVrIMJ5AZY=;
        b=luUj6Gmqovo+DcpTNMLw1KDIV1ocuYzpSrqQBGWAKlBsrbQzLwTnfI2K6ZtHF/mg/E
         IKBmCQP1cg/6R6hFJjRNtAduXeMd51Ze9BixIW9JJmMFez9wUJydJcuj4TVYjlED/za7
         YSS6N03Mi6Hlfo+Q7Rko2ywVQNF7EHq6U5rfmeXxFacljmqckbFdlJ7WVT4IFCHpRRQq
         EaEZUFnlNPHicjzf38Kspt6/Ulwyln4VxipDpDHaTXm/dQOicYsR4oy1K5Xmmsy/HZyr
         mQKJvbZNakIKh/Dn+2tEc2BidijiBvr/ouwAR8FeOgqOgrX76D9VXOFY5VMFRSSkiP1q
         BW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406343; x=1769011143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9h38yxI+Yu/9dFGuGUR3LKj4LUkkS33DMYVrIMJ5AZY=;
        b=Ws8w9rqGza4LBPJ35iwpDHQsrYilvnQ5SUOi6RxnKIMZoqtjVnekMOJjzwj5kvC+ON
         NIYiCXQVyAVuzq7Q47kwUzdbCmHBTqQF3vaX13qNhbh+0rL/jtK6ldaDYTIHH6O+mtVy
         dJwBOJvxqms4m/Hmf6UfQPnqJbDeEyjRagd7OrwCriYMOq3J/1J+JbVK2atBgpn2mS6u
         hmR5uxLIRurVJTk2A0IemVTDufn6lKSRwETmPQuDg1DKo/Cj0ZMBbNTGmZfRInmbcozB
         vOdfcgk8u0thhHSMh/eRvWvijVc6oVT/28EON7k5GnoU4jnrq+wR5lo3ztVaNK4Y5Fy8
         HN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkUVk44NeaA71ZHISfVO6i0f1Tr+YU2rnPS22u5GJdyByKqXlJd7JntsR5AS0+oTtP7lHx2VxHLsVtGU4pVk0C@lists.infradead.org
X-Gm-Message-State: AOJu0YzPWQ0o1y5Y1EyQ7HAB1e5wcRfc6A+C7dGg/wMA86/kMN4zeuj/
	Zp8xR66XBlWchETsbRT4bc1pkCsAdxz8kDohUSUg/yz9epdRQqS9mqaoBtqzhp9vcw==
X-Gm-Gg: AY/fxX6MOC+onwlcZY12fEUDZyIdtVwiEnbKIcoMfD/KVNbN5Xy27uDHNBXPA6fObuk
	JldWRPsHnFnQ3hjYci/AxtkqyeXR5IPs2/hO+ayeErTPfSeGv7rJw4M4+qk5yv1nMQNNH+W2KZC
	evlmXhrZleSxetx3VpcFFhIzAizwb+dY5u+YMYg05KPAKvbyWo2+e4DUjVW0lxDR42haGWaWttu
	xOK97o9n+MjiWa0VGeMiO1/jqcKSSpgTq1PKrrieIWJ29Scxw0Eiw7ZqaEfpiwuWASF5eP7Y8+D
	8BZtKJm1bWvqXeoTPMvw+RHe+oCap18as/Q36SNcRzm6WKN6cUZRGBIfu1LmGg2f9vqTfg9zUTO
	8i9O/GaIRPfDcOYqFE6LnXJvaxd+rwq7icbWjg1U7//uC7E8MssrAbS4uqeXNemujQWKNev/2AJ
	7kwFCDiK+cMx5yUj0C2UCe0yksAAxsSGg550WyWeVLvJ2E7FuW
X-Received: by 2002:a17:903:37c5:b0:29f:20b:6d1e with SMTP id d9443c01a7336-2a59a91a40emr2491455ad.9.1768406342960;
        Wed, 14 Jan 2026 07:59:02 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4e3efcsm19748b3a.20.2026.01.14.07.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:59:02 -0800 (PST)
Date: Wed, 14 Jan 2026 15:58:56 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v6 4/4] iommu/arm-smmu-v3-test: Add nested
 s1bypass/s1dssbypass coverage
Message-ID: <aWe9QI0ZoqjFCjSd@google.com>
References: <cover.1768248467.git.nicolinc@nvidia.com>
 <a72a60a36c9831bd91f369de5af0ccd96d180dbf.1768248467.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a72a60a36c9831bd91f369de5af0ccd96d180dbf.1768248467.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_155906_411656_F84A7040 
X-CRM114-Status: GOOD (  10.54  )
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

On Mon, Jan 12, 2026 at 12:20:17PM -0800, Nicolin Chen wrote:
> STE in a nested case requires both S1 and S2 fields. And this makes the use
> case different from the existing one.
> 
> Add coverage for previously failed cases shifting between S2-only and S1+S2
> STEs.
> 
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c  | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 


