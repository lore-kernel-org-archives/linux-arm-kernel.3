Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A40CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLcttbn5k16RAKKI+EzOZF6EXsPtXzfzb9zD7Ffua0E=; b=aKrWk+MMbYffAGzOV9ziEeux/t
	4s3NZnvuIxX6QRwAK7lUfc7dpUOeUAJolOD0pJOfOD+VBx4FA9FnB9RfCJiYKJABgYdEpCA55Riso
	6Mh2HxWit2n/IUexyb4DdpJRSMp5UVSLuEOEfQgyU1mQAr3tZsHCmpmqF+9urwILyH2bMt86D7ndw
	wpTQovs4EP2MfDAF/a62dbAv0OEJTk0C0mTIQ9L0WOAPup0OOEBtWdrFXzLpX3vp0SPtQiQwdb6KY
	tzYF0uCGkXnN/edq12jfBgCiN/pFqZEKo8a/1EWvNa1LrWSqIuJdXdsvWjgOg24C4Mx1w/yrBllyt
	pxiColKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA3cx-00000009luf-1K5G;
	Sat, 18 Oct 2025 09:53:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA3cv-00000009lu3-17M9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 09:53:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47157119d8bso1246065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 02:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760781207; x=1761386007; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLcttbn5k16RAKKI+EzOZF6EXsPtXzfzb9zD7Ffua0E=;
        b=i5zNAvHZsHfYmJfd00wHpAIbJTbAAK7jQhFs2w9Tpumn9TvHYF2TlEyqP2K1PEp31r
         f97dPWSn9IIbpnDgDiitx6vRlZR8RJldW5M9DyB/FJuvTUGQGpS04hUnGv06LR2S3WWN
         iYtWeSEg30reDxBPukL+kRTXdU2W/aLTq+dg+t9fCYKNC0FCqwJG4uukR7k5k+cvrf6V
         pfZ0KLkXz6wFhO1sbU34rlhywbH6DCulpHHlD8TAPmx1L9riiMbQM4MgJHw+XLqYCVBi
         bWUTZx3WPSmu5Z83UVsXUPGM4XgcwWxrxkV/eTQKHZE5kXqrL5QxHcAvJFIO/eDQgs3Y
         V16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760781207; x=1761386007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLcttbn5k16RAKKI+EzOZF6EXsPtXzfzb9zD7Ffua0E=;
        b=CSDaSjA+jyagNBjEDMTeFSA2U3hingdgtUtgpjgtxR8K2YA/Ui8qwbXyD9nWThV8Pa
         oCA54ukUoJT8AVBiLFJeW73atrOCFn09ADSKXILi06+PcdenlLFrpYYL9S3AB2KvVPbQ
         5GIuUseYKRV8bOlkM2R5ctRa2JhorLcrA4X91PBPdEXfpHhIbrBgPnX0VZxBVch7hoIh
         3KOLFSpfdNCemzEcyqr7jmFIU2XbbTug2Q3ECMKC9r/uaUfwaUwgDLJrx+dL0MIXzBse
         2pobx6Js7ImJRRtmKmlPgh+oytyDj0koqJHrUDlCZCAmi8T+G/RMZqxF8Lmv9Ui7qmpX
         z7OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSF3GBGesieboRCo9ab49dE/PylKBxb4GerGfDirX9JqC3ZSwH31XT7YJpHxclOgE0psmRUvjabb4pi+Q/vRPa@lists.infradead.org
X-Gm-Message-State: AOJu0YxcmevrRHDnByVy1KV8klexCejwGmamL9J5PWWxvV0f8JMA2w35
	Xd4pDR9GJr/dm6nZ2Q7YQZOGv6vj5pRvFHpJcfdkLObfq5k6fMvE2fvQPG70KLazzzCnpelkJZt
	IJCaQ
X-Gm-Gg: ASbGncvowtpVgrFtGKjIM5xtarQgO9x5XRAfweO4yGMr64gG26Pwbm0KADeWCZUSfg+
	nmPlnM72iiLEK0JlGwofLnjZ32uSon1MsuQdrFtm+GIUETqvV/6g2NLARaQp4FmiXCAlm/VqF0C
	DZpmQhHip5N9tM/llQf8EkouBszJx8oWRiU10NfCMOfM8v3KU6xfWVsgOLvNFIev9K71nZDT4aA
	VufzaWY7RPO8pWvQ7lodvkQTxMsPe/1vRdSkszqeKk+Cvd0s4rGsMaVbYD99SSbrJPMDVaiLvsw
	hoVc7jTz1ZkLF30K4lUwDORlOuAdJGtO0iJkePnuRVP/uZO3D6NlktUfpETzUtmxFGfgAb3qK+4
	bAJ+LNA83jkzyj5Ve0KVnIJ/p+5cSXuCza8Yg26N8RKoXBytTznopYS2uouzmxdCd4piytMgW6q
	KzwTHGKwp+P1Mcc90H
X-Google-Smtp-Source: AGHT+IE7qvTI/bg1JlFoj/mWNWosxLYB/3XVkN4l0hbhMw4Lq63sfmg28D78UCq3lmimATW7krx+qA==
X-Received: by 2002:a05:600c:34d0:b0:471:1717:409 with SMTP id 5b1f17b1804b1-471179071b4mr45155315e9.23.1760781207332;
        Sat, 18 Oct 2025 02:53:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a96asm4030365f8f.31.2025.10.18.02.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 02:53:26 -0700 (PDT)
Date: Sat, 18 Oct 2025 12:53:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] PCI: j721e: Use devm_clk_get_optional_enabled()
 to get the clock
Message-ID: <aPNjkzrexmIyQXpT@stanley.mountain>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
 <20251014113234.44418-3-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014113234.44418-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_025329_319441_46381788 
X-CRM114-Status: GOOD (  10.40  )
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

On Tue, Oct 14, 2025 at 05:02:28PM +0530, Anand Moon wrote:
> @@ -630,7 +622,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  
>  		ret = cdns_pcie_host_setup(rc);
>  		if (ret < 0) {
> -			clk_disable_unprepare(pcie->refclk);
>  			goto err_pcie_setup;
>  		}

This will introduce a checkpatch warning with checkpatch.pl -f because
you need to delete the curly braces.

regards,
dan carpenter


