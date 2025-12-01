Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C8D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/zDtzLQ3mrDGsn5l6i06J8GNek6GlWuIZEcOWe0BHY=; b=wPij3zKVQwc1hKFFeDQfBriui4
	4psJQCf7EA7se00CFKK+Ks90esp2/mNIBWZPbvC+nMIX9igHeHrp6xQWuNIhKhhIthD1xujpc34Uj
	1Kjl9/FRTCBcJZsaGqjbSooaRI83pdv4WxA1d0EkhQCUKcg0z+yRfg0gEpfR57/BdXqJReVmjAqvN
	XStbdJjlj80pUhdN4cQDBASyovcGLs+Qp61TTMkskGiRYNSsZpttjA3EA9Hiyb+xHGHW5eXk0F1/x
	m8lzZULqCuR4n9lc8jP0q5LKAzhCfzqaYgtenKZSS+gViewERy5oNfRU5PIP4eSlcVG1fUZ2wLiZ1
	ZUkfbHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ440-000000041uk-2PYG;
	Mon, 01 Dec 2025 13:35:36 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ41t-000000040Az-2Qfa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:33:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bc0e89640b9so2775042a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 05:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764596004; x=1765200804; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6/zDtzLQ3mrDGsn5l6i06J8GNek6GlWuIZEcOWe0BHY=;
        b=BGuYFR7Qzga1EqBLgmFwoKVtclzzi+f3aqKF3dAT9aUOVWkzPAashxxPN2Tx3PCkLt
         hdTdictkC6HhYom7nV+cMnC1N5NEhbIrfiAh8oQahE3LvcsRegFOp/YGx9+F3vUpxHj+
         4qwO6nIhrh6M4Dug7bNCRe3X8xN8DjPtAACkqaj0Lz0l5opp0NvSbK03TKCClDIyNBtq
         xPFfnvfsSnWnz/1CFdIodTYN4h0aq58Ppf9dicZIQUFTGEDQj1b8vukzgB3qZPWGxE5e
         qXIrkKHj/DO+jBkzljX3x9YPy+1ZPW0RqflteHGuCoOMsyzrPPlcZnvEdIiPorLBhWRZ
         kENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596004; x=1765200804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/zDtzLQ3mrDGsn5l6i06J8GNek6GlWuIZEcOWe0BHY=;
        b=oqDfWWHjXP+je+O1+KRZQqNus1SP5H63AVSS4WXYywfM8EYt1eyb73jm1KzlWymor1
         vl0ThwYX5WqZrrmXk5Og7DWdNwf/mDrNy7NE1sqzrq78gfdvrdwmwC90rHiPB9U9XoPH
         tm0emHoSoG6kgqAWDQpgEBnTNOf2dVJfgw9dac0fnBN/s7773z1gFqnAfPMJqWJEMBf/
         vbFMy4wOdOuhR5lI9t8aQKYWBth/HHG1ya9UgS+JRaWwfsQcHgRfzcTEs0ygvMBIu5N7
         ozNPAGti6FRVqDllvvZ16BfYMRq18pYdJiE57SfUKw5whKJcLIqDnRGN7pjgcYXCg0Cj
         hj2w==
X-Forwarded-Encrypted: i=1; AJvYcCWbJSNZbiFUHHZ1rECzMOMpK7X8Yb+JcweBCn5uudhWW8ceZG9zKpp7vfi7k1+/+GXDTicf5H7sWS88BSBCuLaN@lists.infradead.org
X-Gm-Message-State: AOJu0YzIIgipFiMgt/1vi2Cc4F7c+HzZgOvi4pOhW9rQweuxt+K3vMSD
	mGJV2Zgltg9Cu6ZTPuqzdprCRn9UqhQc51emhc612Fx7jo4Pf2L48wHf1k8fm+6iyQc=
X-Gm-Gg: ASbGncuHKEmDVr1EH0J3Alw9/p0+JIBAiri7Z1NoKMKK3xtBpVE3tR2FF5a+P/X05ax
	nqn2y4kdNBewiSRaiyMLKJIBW8/p+ZEYMb6R44MxTVVvxvD1vM4T5Dg/tznLnL6WD3koYZh7nGy
	KiTb7Mef5MvVKcFK+bTRtnU7zhZ6/xgwg0vWi52lp+Fx9fmGVjzy5KjDIbpowi/YQb8qeK7Nque
	+C0MbNBkduE/J9RSq8LZ7l/yJ3g3uSX1c2zf86X5QPeAIs/FI9GbqZYb4mjBnOwMBHsSBzuAC7m
	EZmCZMf0R+qzk8p29/rnCjyjzqpprFrUbdM9woONilH7sAlfcyYEBGeZ8KtXgvi9jtzNcC1snaX
	+dFSTDZkOVk0V/QrCI9RfvRbrHXt+luQ6yp9OZjw9t1FA99R5lUQ+p70Ec7NF1/7dbRn1Tp999I
	+fIgRc1QGxg84h828UhbS8fTWNawgY
X-Google-Smtp-Source: AGHT+IHKFtSw/hePVAblgBz7XowJWwPF88SK94EexlhYEAxjFsftk5tagEj2K8x0BHP2JoIqJWGmSA==
X-Received: by 2002:a05:7022:41:b0:11b:b1ce:277a with SMTP id a92af1059eb24-11c9d8482b1mr22957607c88.28.1764596003940;
        Mon, 01 Dec 2025 05:33:23 -0800 (PST)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb057cb0sm72909407c88.9.2025.12.01.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:33:23 -0800 (PST)
Date: Mon, 1 Dec 2025 19:03:09 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: huyuye <huyuye812@163.com>
Cc: ajones@ventanamicro.com, anup@brainfault.org, aou@eecs.berkeley.edu,
	atishp@rivosinc.com, bhelgaas@google.com, catalin.marinas@arm.com,
	conor.dooley@microchip.com, dfustini@tenstorrent.com,
	haibo1.xu@intel.com, lenb@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, rafael@kernel.org, robert.moore@intel.com,
	samuel.holland@sifive.com, tglx@linutronix.de, will@kernel.org,
	dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn,
	guo.chang2@zte.com.cn, liu.qingtao2@zte.com.cn,
	wu.jiabao@zte.com.cn, lin.yongchun@zte.com.cn, hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn
Subject: Re: [PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after
 probe
Message-ID: <aS2ZFdMFMwdlLHA2@sunil-laptop>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
 <20251201130757.7032-1-huyuye812@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201130757.7032-1-huyuye812@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_053325_642665_76C2CFA4 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, Dec 01, 2025 at 09:07:55PM +0800, huyuye wrote:
> Hi, sunilvl
> 
> Based on the above patch, I understand that you previously resolved dependencies between Link devices and PCI Host Bridges by calling acpi_dev_clear_dependencies(device). I would like to ask: on RISC‑V platforms, if we need to manage dependencies between multiple PCI Host Bridges, could this be addressed by adding a call to acpi_dev_clear_dependencies(device) at the end of the acpi_pci_root_add enumeration function?
> 
> Initialization order dependencies can be defined via the ACPI _DEP method in the DSDT. For example, if host bridge B depends on host bridge A, bridge B should not be enumerated until bridge A is fully initialized.
> 
Yes, that should work.

Regards,
Sunil

