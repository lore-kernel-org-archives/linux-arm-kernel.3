Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D65C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPUupjtmN1BYgZv9Z0cHZgSg9TrLMlKVjx5Ycx9HDDY=; b=QJsmRxZEgz0hob9lCghoiuHo8u
	yp9WUn4TxKEbVyEchhgUyYIseaJ9+7VwogmYPDOCLsZ8+DdU7VNDyP3GRERWFk7QnWvf0ctNKJyWj
	QFd/5+Ms5NCdNdnH3BR7ZyToXfcxCTvaDRzzc7qzIya+9TI35HCFCJLnFyvKaOv1ruoSJAT5d5vsm
	KpNdWk6eIUk1hwNHC2RcDo9U0rZy/OvZDxn15VqfvEXd7HIrHD0+HdyknG7G0EoDXKSe3OBiznODN
	mqQuBFds3M7cekGbnwf4qRd4pOCpkseh1wSMIoTC3ui/VUzOU5oCK/V89oQ3+pSPO/XaxHvo+6L6y
	mhKFpY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTes-0000000Avoq-2Hky;
	Thu, 17 Jul 2025 18:48:42 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTbd-0000000AurM-1jJJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 18:45:22 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-73e5e3c6a37so877409a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 11:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752777920; x=1753382720; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPUupjtmN1BYgZv9Z0cHZgSg9TrLMlKVjx5Ycx9HDDY=;
        b=gom2ljDhpVtNeb6rmiKIDJ7q2ZMQPze/3vdxqTP/ZiXunRJdm+ubQ0d9aOVgQA7TsA
         /wYYJudBTIA6O0eTdQgzGUY/97hNk+RK7gARWgmTbqoTLV5fchEx/iKW5w3CWX4+EBDm
         eGe5rWEbRgWup2fvGUgEd8KNdcH4R3ToSzG0dXSRKLg2ASyG+gpMFZh8BHEcip5Y3e3J
         r8uonSppNqkzOQMtBQPscjLk2hBZO+xp29Veya/E+9ZWPh9fFx309N9o8hz85eELaC2F
         1V9+vI/FGD9l/iHDy1q+2+TFkl8ed4XfxneNf5lHEjnx3Fm128+ZDWA4VgrDkU7ovKmR
         YBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752777920; x=1753382720;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPUupjtmN1BYgZv9Z0cHZgSg9TrLMlKVjx5Ycx9HDDY=;
        b=pc6UYq1fmZhDj1bWxbtGezshvrNHbVEtzxkL11ftm5btEqEssP9XZ60e7n6nsr1zQC
         ZRDUY1ZyP7QzD+n0ZvWEduwzTtBtm8HoP5yU66E5F1eSe+jTWaFdRCbCJzlJC26nbRnS
         m+JHqTjrFOGSTuMc58N/UKddRyYiZsA3nPYTUew9hYKcAJjD1HCDfd3eLpCboXvOxLkx
         DgHXlJb9rJgMfocX+nVaQ2jALWJe2cUEH0bhgooRzPpSlZBeQOupGUmDDIemQHH/JzTv
         tQlLLw6MhX3BkaJgbroIjiKj0YcCfcyVT0i8VOHtT/GfIOiUFlkYiBNgChJErWl8m8qP
         dacg==
X-Gm-Message-State: AOJu0YzaTFnSCcw6Vpr2cKPz9TRVIOpOwaX2O5sY6j0uMUcaDli6t+X1
	tSSFv5JLvYQFCADpKGlfvkt0/YImIQ6wVxgIJTdZhcxpTBBVyGPsqFyQPnxwitCqfHg=
X-Gm-Gg: ASbGncvmFtkWhHojZ0CUkd8FtLXRQvwIMkIOuTsM6DERUxzpsvCgM4O1bVBQ+xREcaw
	/JEKJUDYRwoDFTtuCw93rYy97ZYXSNKhCTrH/U/Amsabqlr2uBQjXiAjTTNkmd8NSpqsuqQ686c
	HMIHZzrM6rGSHZ/buAftnxhJhyjCRjD3SDbPygxjzWYXTQYPE9OjmV2nCoaKqVnpIM8I6yQd7om
	p7m+o9zeirgck9c4GgoRbTmCtfIqp6YTINiOpcjm2EN0OBrUfv0G7JhBaTu8Wn+BWm4D/7lo8Rr
	cbaSldASED+s2qlZttAECMmVsb+a6GhV9tUlsEFmXzWaCGFWfbY8XChV1xpaaEt5u6+Mt1+0+mI
	L16ydlEMcN/EaTZBBDTZ3LvBgYdgkaQ==
X-Google-Smtp-Source: AGHT+IEjspHuBNps2NHxdSiPij22BxAe6MdwMHe0tt+FGMOE42JOfPTIMn6x+KqgThhHWxwHBw51/g==
X-Received: by 2002:a9d:3e13:0:b0:73c:9589:2799 with SMTP id 46e09a7af769-73e66124b3bmr4563301a34.2.1752777920469;
        Thu, 17 Jul 2025 11:45:20 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1982:bb13:46f1:2e60])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e68f62e61sm1424159a34.65.2025.07.17.11.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:45:19 -0700 (PDT)
Date: Thu, 17 Jul 2025 13:45:16 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [PATCH v2 0/3] irqchip/gic-v5: Fix some static checker issues
Message-ID: <736d34e1-c72e-4176-becb-00f0b27be2bf@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_114521_462726_020FC3E8 
X-CRM114-Status: UNSURE (   7.89  )
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

These are few things that Smatch complained about.

v2:
I had a wrong goto in patch 3 so there was still a leak.
Improve the naming.

Dan Carpenter (3):
  irqchip/gic-v5: Delete a stray tab
  irqchip/gic-v5: Fix forever loop in gicv5_its_create_itt_two_level()
    error handling
  irqchip/gic-v5: Fix error handling in  gicv5_its_irq_domain_alloc()

 drivers/irqchip/irq-gic-v5-irs.c |  2 +-
 drivers/irqchip/irq-gic-v5-its.c | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.47.2


