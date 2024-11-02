Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2000E67800
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 14:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoNhd3PU7MNVWI+sf1DSija4VTsLivchGzEQ82Up2A4=; b=0oE+cLrz40+a+Yuun2y59v1ddO
	8z93Xa1te8/zZZA/EUBrgs7umShKP77Ka23nBf4rY10QwU/PWRpOALPXZievmFHQC3IwQFkrO3LhC
	qLQ+Wu8vTbMa4bCpVA3FTPkA0IsAQiXxLzcV/+PRBiO+EMT40SdI2tDIBcYzsSaG6aSBhO19DkiHq
	1Y33qc8H/8mI3LBJ4KYIWZfsEK22151L5AiuYIcLHtGnBTJLfvFUrqOx0l4viZhVYJSWlzris5SVP
	lDJRp/+FnH6OHiwYrdTvVi63e6NcKzRLhTdLGDCN3H/McjEvaca5XrH/gHCWik6sHGYlTlZKxUlm1
	1TDnJsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Ezt-00000009qSV-1h11;
	Sat, 02 Nov 2024 14:21:01 +0000
Received: from mail-pf1-f176.google.com ([209.85.210.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7EyE-00000009qI8-1Agf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 14:19:19 +0000
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso1487996b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 07:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730557157; x=1731161957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoNhd3PU7MNVWI+sf1DSija4VTsLivchGzEQ82Up2A4=;
        b=sZOVdnDCOsWhLjXliL0o6ErazOSENrjegClSf+KMgIlGidpOOztAYicec5/oQmq4HX
         HLPHotZ7Ld2ZdnZUDCJnJ65V82zK7xN+EhBTgkRXCMFLy+PpqsmAS7XGVHAgeq+Q7gKo
         mJboyGIjBOdvh+ZQaxotQT9dznyueFggqOAQzLuYp3MvPp5TVaRinbc9mYwhl4M0tc8V
         wJit2ZwUB3/VunMR6GTakmFHL1AbL6japrzASOGJugZ1mr85W7/B8u2DxRVDPnlfchVK
         BbBoLXy1b1UcPQhE22i82pmsQhoqcXRhgVuvOGRzvwfYtH186PO8qXYmyW/WzrhUnNiq
         41ig==
X-Forwarded-Encrypted: i=1; AJvYcCX9oaamxZtt6c4HgKc9ZQLICqPl3oLDT8n7//9lcDR6ttEygcqvijMglsQteocmv9yN5neFs9Shw/lx5nJFfEnf@lists.infradead.org
X-Gm-Message-State: AOJu0YxyuQTzfbxR9Zb/1zbJrH71P/4Zmq2EPsb4O6hJ0Ge81UwJFq+q
	zojdDYSjI1MY9uPAEY91akS1tBCUaSAHIHolPv3sIgBarDzQcXwQ
X-Google-Smtp-Source: AGHT+IHPcKNMt6OSC6S/K2FJ3EposZZ5TOsaoIOHKw561pjEChI1kIfOypmeQ6NBttJJZ5y0zs9rDw==
X-Received: by 2002:a05:6a00:2ea5:b0:71e:82b4:6e6e with SMTP id d2e1a72fcca58-720b9bb3edbmr14950575b3a.4.1730557157041;
        Sat, 02 Nov 2024 07:19:17 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c3902sm4096567b3a.136.2024.11.02.07.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 07:19:16 -0700 (PDT)
Date: Sat, 2 Nov 2024 23:19:14 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, robh@kernel.org,
	vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
	thomas.richard@bootlin.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Deassert PERST# after a delay of
 PCIE_T_PVPERL_MS ms
Message-ID: <20241102141914.GA3440781@rocinante>
References: <20241022083147.2773123-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022083147.2773123-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_071918_342510_89654EF2 
X-CRM114-Status: GOOD (  14.12  )
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

> According to Section 2.2 of the PCI Express Card Electromechanical
> Specification (Revision 5.1), in order to ensure that the power and the
> reference clock are stable, PERST# has to be deasserted after a delay of
> 100 milliseconds (TPVPERL). Currently, it is being assumed that the power
> is already stable, which is not necessarily true. Hence, change the delay
> to PCIE_T_PVPERL_MS to guarantee that power and reference clock are stable.
[...]
> This patch is based on commit
> c2ee9f594da8 KVM: selftests: Fix build on on non-x86 architectures
> of Mainline Linux.

Why KVM?  Do you have the link to this commit handy?

[...]
>  		if (pcie->reset_gpio) {
> -			fsleep(PCIE_T_PERST_CLK_US);
> +			msleep(PCIE_T_PVPERL_MS);

fsleep() with the same macro and for the same reason is also used in the
j721e_pcie_probe() callback.  I think, we would want both changed.

	Krzysztof

