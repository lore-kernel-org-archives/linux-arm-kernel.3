Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42872C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=; b=W3duEr/mfeSPM4oW7l4KShRBLl
	K1ZWdq+qiK2gGzMsvhX7jXzZy2/IEF6+KubD60DyquBYPyKzVSTiGNJQy1jAvXz1P1erFsjBwptA/
	TPa6uYasdr49T5Fm/ONJPl5EKEj0Xa4mTUknXnEwPqq5EQb9ZT5S16IMTiH7b8nkVbKiTEHXqXPxu
	KDltIB+LXEtlfk8iGL8ijWhb+2s5/RjmiqX6vrwVUBQMvU3xChnnA5B7qjWEUyZS1FL2HPEfES+O/
	uFJ9Eji4sMUe4OuFpSCv1yxn12cQKSxtRNRXUInyiVbLQMaupefSZvpcW9g9c2NG2EnChSR+CT5Rh
	ftur7GsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHbf-00000002fTL-0EUZ;
	Fri, 09 May 2025 06:53:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHZe-00000002fBT-0aMK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:51:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so994242f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 23:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773468; x=1747378268; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=v00CNR3rots8+3PghErsyw85A+3TtG0Pdv/nmUbhqm0faqUp/UHwemLNrrB796qKTy
         +gl7kTn5FwsPch/TlzMVMqFBWv6vSXb+wk8f3X+cwoOAE1yekpN6UbQ5J2dEZ03XODuN
         2/BTGtf5wV0AuQubg8PDCrUih3FEUXAAceL1beNdQPfz4ej9/YCErYLqKqiBQK2gfUXx
         e63gpnRj1bCNY918KywCbf3gcug6aXxxBNDYi3z8Y9LMqj8OG/Ae2UVkH+1009BDMdTt
         V9ijibB4C7LW2Mqjz25qWGYrK1trMsiL8p0u5LONbwtlTYEpujkvhbLBxkmeZoLTTmHI
         MN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773468; x=1747378268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=rS4hfGmfB/bFu+i0Ln8PhZXLyPNDppA6vKf7qDn57dzPgJw372xcBdiuo2SVoTDrlw
         FXlSjk9QIZp8mFRef1DI0Js7UXrrmem74AP7909jdU6wfWMrTe+rgcAslsxM4hIKud8k
         cJYaPLm7/RDDG7oE3UW/cRT7QcUN2ETZDzNd8jORy3+rxDSmWzqawiC4dRtPgvE0OS2F
         jacNi+Lddk9xthvzbum9wDF77J9QAa3yU7V51fVZyP7n8FJrw2jSQwT5BmYC9B8PbyOW
         G28mkmqKsiLKxqbTI/t8TU7DHZnvjp53VcWDcPwDHmyOp4495tdPASt0GJ+ZqH+eB+H0
         whtw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Enu3g0e+ZCWA+stV9wWw8ali+M7Xe68nSEPtG8hwtCnjYb7gVOm2BNjjmEMf/PjVHNiXsTMq8f6HhWnbecxL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2UT20t/XIf3y9iYPUsNplzDP6GzqgryJz45rp02a4IcsQPtfV
	a+u+FVuhenuSfmWd+1KOucB5w411JKs3PoN+LQ5IupT9waZu7qbU8qZAjVpxqg==
X-Gm-Gg: ASbGncvCAReldsMwJG+a0GPqmUdQYTeiM7QPXoHDEgnx3fxMmNmmwDH7GtPxqyoOiJ0
	7NBPhhmoQw5Sa9J5Fg0f9VVHbLCpuFK8TtpEE9tbJkw/rQlYuwaZD0g+rbAw2X9JrO7X5RG0C82
	e+3oMmdgUxP/f0eBWSzFBGNPyXv6rtr2heQ62H71f9xmEdBRNKKHaocHAaJvSESCoXoNs0i99L+
	VL937m/eEUu1UT2KqrsGrKuIgsSvvM1LnBL25WwiymgYvEAHn2ddUF+ygIo+jCW0L2H3HJNoJY9
	O+mBfQJ5fHQBgolqa7bpG9UONwqhgAPi1IrYNhp8HSI23OcynYZH2GFHjvmz668pcex675NtjsK
	KKiMhx8tG+UbDwjdP+bXJvnE=
X-Google-Smtp-Source: AGHT+IEBZ+xyU+mtZq/TJ5fu+6WMLt3/ZEPH5kI6vP9q6SNWA2Tnohwr4qj0xsEIdaPCJ/e8n6vxRA==
X-Received: by 2002:a05:6000:178e:b0:391:4889:5045 with SMTP id ffacd0b85a97d-3a1f649be24mr1423812f8f.36.1746773468403;
        Thu, 08 May 2025 23:51:08 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm2214791f8f.89.2025.05.08.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:51:07 -0700 (PDT)
Date: Fri, 9 May 2025 12:21:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ethan Zhao <etzhao1900@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
Message-ID: <34nnkgbfkccvxiksjb5qaojppcvnkq4l7rchllsppy7cl4fics@4mwtb3rhko5n>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
 <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_235110_182899_8C90E551 
X-CRM114-Status: GOOD (  14.43  )
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

On Fri, May 09, 2025 at 02:11:00PM +0800, Ethan Zhao wrote:
> 
> 
> On 5/8/2025 3:10 PM, Manivannan Sadhasivam wrote:
> > A PCI device is just another peripheral in a system. So failure to
> > recover it, must not result in a kernel panic. So remove the TODO which
> > is quite misleading.
> > 
> Could you explain what the result would be if A PCI device failed to
> recovery from FATAL/NON_FATAL aer error or DPC event ? what else
> better choice we have as next step ? or just saying "failed" then
> go ahead ?
> 

If the recovery is not possible (with device,bus,host reset), then there is
nothing could be done.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

