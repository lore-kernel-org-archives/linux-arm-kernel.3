Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF8DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 02:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQJFO3d01XRWHlItzAgkgKpAHFmrqaV2k8tk3VC7Qsk=; b=U5B6u8fr3woIiY2l+n9Id2Kt8m
	g7pXmkY5jGiZYZ5JLFX4hpLksWQMaw2Ti9w5XE+gjU/gcrne+2s9sVGfw1Y3l34cGWSkvs1snaSvF
	GpPoGKldtHSMUf29m1hvmKd3C78uddb1QSJzDRiEuZaxP/jwGlIjWQBaGGc+U8azMv/n60q9dd8OX
	bj6AfDFyJz2B7L22yFjthsSpH/u1cW5nlTqL3bMx8dzWAsa3cN6TI98+E4e9AJneUJNCah9iE5n0K
	VlBXtOJdd83sMpCpiHN3jDOXwYm/N2NFn9YH6wuWxvvhJIo7amR3ar1ozKtcck6Tw1tIW83KLF/qY
	/o0/ihYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCSO-0000000GaSp-3Ccs;
	Fri, 07 Nov 2025 02:44:08 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCSL-0000000GaS0-3VX0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 02:44:06 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-656bf426c81so92529eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 18:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762483444; x=1763088244; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tQJFO3d01XRWHlItzAgkgKpAHFmrqaV2k8tk3VC7Qsk=;
        b=bXYcHsVWtWvXeiqTgmGfvnKdQP/YqTbpklaPofsxvdbeCyIFLZJ+/EZ6UtroqFGo+D
         ocyBgQxo/hgkVdYt3E0CMzpZnUUcyTDs3HNb0m8O3f1g9iTAf4lsO2X5zChqu+Jg31o1
         EfaykhyNHsiulIwtg5HgB9jjEE2FS5/BO+eCY7OEDgotwWkQNQbgkcKW+FdaeqOejSKK
         Gt4XkFSWXH5Ad4QvgpcoDEwFt5gT3X2pQr+L3D6Tc7/xkITeswy/N3XeOUhIDPB5oZ+8
         yFTO/60cR9KilbBd1i8IB/9BD5NqUHNZkV9Ou2UDle6YHmiaXiZvj1Oido8yEZcPWWyk
         iQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762483444; x=1763088244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tQJFO3d01XRWHlItzAgkgKpAHFmrqaV2k8tk3VC7Qsk=;
        b=xU64lf3n++JIyZc39WRwTUt5C+CYsuKUdO5d9DEOY/j2ttS9/j05RxnXoCZpB0rBdA
         SFSPKQH3zPtqznM1zIANzE9kvSUDNU3vaoD+bYSMsAfEK6lfu7iMkhYG1i1DvYgudatm
         iULDwJ+XSPinM1H0S+zn6I8rNgmPjG6ria9Ow2q/uuI+rtYHOzwSHbA/p2l/xZ17epdz
         kfqTHLKysh412lZOXBHdNU8IJUNXZykdOh/FzAbzePmAAEuoYkZf5uBWqJpfeKCXKIWk
         XkS1lRuQnVUqNCa+96AYcGQRdfLQ1dF9MutIJYesU1eNOClyW4i5mPjvu5htzuJC3yx2
         SLfw==
X-Forwarded-Encrypted: i=1; AJvYcCUqqFeSr1wg6Hm69ye22dKMAyUqjdzUvvgyp3UbQJdkrb2nvFw5L/rhEr1eIa8dtKWT7MgenLL56jTtnkSwDy5R@lists.infradead.org
X-Gm-Message-State: AOJu0YxOSJHDE9N0RWVMhN2V1LXuiOCLBXO1zF1sEthDoB/x6SLV6ClK
	DF/yXo8KhWsXIu4R206UQ4xy3KuN5xMTdZoDPu+R/6qdpTHuAl308UDv
X-Gm-Gg: ASbGncscZGktBt0OGpy9iElOmvBRRDZ9JuLSkBjeockshVePqQxU86E/H8Thq7qcoAe
	sKefq4VPIRsF2WtLw43Y0k6yfDM5SnVFTIusZKmywjQUBIuMGsJw4e4J2ZhZxjC38IP3N/2E8KQ
	a+y/nq4j+xTNTsO0lOlIWl6TeGoXWDyt1NLzkEKpQlAD/xmwlGRnaV3cK1r1+tg7i+RWOXQcm4V
	Nq6CetC8/S1RUJdM4ewOHdaEcCN6Z24ynn/JWFkXgrR/EzpZCs6usmXKPSpwCox7vXMDx2YFXob
	grI4XqaSV0mlYqw4yK3rsCoeg7RrA0URyFeDpcGVPLYACSpa0EiizuO/cGbEAmGJ2T00fp2xEEy
	L6bHgaVFR1uwwPi2QdjnrM633/Db3UVE2lXN15t9ts6T+UlWoR461CWbSw5y4+A==
X-Google-Smtp-Source: AGHT+IFD2D//hG6hBMCeFSWKnWdmScBR8+/9DZwOHc0uXkeVWeA8HfOnZLz9J/lfwgpLyio/zbkAWg==
X-Received: by 2002:a05:6871:51e7:b0:3e0:aec2:8b50 with SMTP id 586e51a60fabf-3e42aba92a0mr60346fac.22.1762483444119;
        Thu, 06 Nov 2025 18:44:04 -0800 (PST)
Received: from geday ([2804:7f2:8082:6c9::1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e41f1ec269sm760868fac.20.2025.11.06.18.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 18:44:03 -0800 (PST)
Date: Thu, 6 Nov 2025 23:43:57 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aQ1c7ZDycxiOIy8Y@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_184405_876988_CD0ACA7C 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, Nov 05, 2025 at 04:56:36PM +0800, Shawn Lin wrote:
> 在 2025/11/05 星期三 16:18, Geraldo Nascimento 写道:
> > Hi Shawn, glad to hear from you.
> > 
> > Perhaps the following change is better? It resolves the issue
> > without the added complication of open drain. After you questioned
> > if open drain is actually part of the spec, I remembered that
> > GPIO_OPEN_DRAIN is actually (GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN)
> > so I decided to test with just GPIO_SINGLE_ENDED and it works.

Shawn,

I quote from the PCIe Mini Card Electromechanical Specification Rev 1.2

"3.4.1. Logic Signal Requirements

The 3.3V card logic levels for single-ended digital signals (WAKE#,
CLKREQ#, PERST#, and W_DISABLE#) are given in Table 3-7. [...]"

So while you are correct that PERST# is most definitely not Open Drain,
there's evidence on the spec that defines this signal as Single-Ended.

Thanks,
Geraldo Nascimento

