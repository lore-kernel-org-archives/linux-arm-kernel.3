Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4291DD132DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXakJlT9uMF0pnqKrP0GCUoDzv7wousR11pYk7zv9Co=; b=YcrLF56ZZdUQSBl5sxIVnsjky0
	za8TfHzHnbjfTrk1M4GI/H9VK+vavUZJ2z00In5VwOjF89gmoHoiDd/5VMGIB1pUjJTPAi4rkYaRv
	OocPD4j4SwGm3h98S9IBk0/lU4XVtyDAg1RhjRsbM14xY1hiU3wF52jXTmKRpq2wBThZgqmeS42i8
	WeUamCW1AWA764aJdKknUm/nYuY64XNxSeL3OC+LjI1lyQL5hdsdZF+kIaJXvGk2Civ8En1e0LAmc
	tI29mqdVuYccZWQxMEEJkRYzYcrExsnL5btKrFgXk9JX2fmtoPC950rXdzAHCd2O28UXoLJB0LhoU
	Hph7vmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yuO-0000000EBjh-0sST;
	Mon, 04 Nov 2024 15:22:24 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ysM-0000000EBJj-0lnH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:20:19 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cdbe608b3so42925265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733617; x=1731338417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXakJlT9uMF0pnqKrP0GCUoDzv7wousR11pYk7zv9Co=;
        b=nlN3c2RH6CP6p64CjeddWaziSlT9YYskwMHo9YqoNWVr034CSzY3OuAjq5cQXcoHhO
         tpBXSyQWh5bwd6xmKz/YGfXlJTzDb4OvaiEx84TY/vdENWCbOalkZ3xSzocWUymSlOWD
         c+M5nDHjxeG1MCYsksE07GG3TsUXIMYdQnTWfgChmEwBdZ1BRJfD0DX0rJojhdGt2byx
         Ps8py1elFxCaRW3RxFDeBYL4ot/SB6IEsf4jwhkPky7EwKu7O9b+UDRl2sWEqpzsNY1a
         89DE5sxivEtFIGdMtBJrmvIyh+SlKyaAPDNeWGA281KutIQAvwXaBjWWMYiKMN4dE9U7
         /How==
X-Forwarded-Encrypted: i=1; AJvYcCW6hlvp9MPnHC+X1qqlN67tMKhTaNu8pF51zrw2e8/7d+Q0eg0fEfTSrge52loyQCgkcvdLh17ihBvIpnbAG9mo@lists.infradead.org
X-Gm-Message-State: AOJu0YwGeHH0tt/T3yaOdRHQbBo+NGHDFLpRXJ6vXcLFuNopR1FRxPPL
	LICuewNmwIPkYDjo4Teo8nj1l9trq+ZQ9ythEvEmn1OuEpS4r+9qKnWlVSXM
X-Google-Smtp-Source: AGHT+IFSpLs5pynctX41cG49jOy/TRgnzBUWbXzntToH6HnOeihZiHsr2R6TXjAQzTMkwx+9d3neXA==
X-Received: by 2002:a17:903:182:b0:20b:5b1a:209 with SMTP id d9443c01a7336-210f74f48efmr275371855ad.9.1730733617242;
        Mon, 04 Nov 2024 07:20:17 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057083b8sm61833515ad.100.2024.11.04.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:20:16 -0800 (PST)
Date: Tue, 5 Nov 2024 00:20:15 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241104152015.GB3388469@rocinante>
References: <20241030103250.83640-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103250.83640-1-eichest@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_072018_248989_5FDD4103 
X-CRM114-Status: GOOD (  16.71  )
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

> The suspend/resume functionality is currently broken on the i.MX6QDL
> platform, as documented in the NXP errata (ERR005723):
> https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf
> 
> This patch addresses the issue by sharing most of the suspend/resume
> sequences used by other i.MX devices, while avoiding modifications to
> critical registers that disrupt the PCIe functionality. It targets the
> same problem as the following downstream commit:
> https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
> 
> Unlike the downstream commit, this patch also resets the connected PCIe
> device if possible. Without this reset, certain drivers, such as ath10k
> or iwlwifi, will crash on resume. The device reset is also done by the
> driver on other i.MX platforms, making this patch consistent with
> existing practices.
> 
> Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> PCIe device is connected. Upon resuming, the kernel will hang and
> display an error. Here's an example of the error encountered with the
> ath10k driver:
> ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> Unhandled fault: imprecise external abort (0x1406) at 0x0106f944

Applied to controller/imx6, thank you!

[01/01] PCI: imx6: Fix suspend/resume support on i.MX6QDL
        https://git.kernel.org/pci/pci/c/1a2a9024f84d

	Krzysztof

