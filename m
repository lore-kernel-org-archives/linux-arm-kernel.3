Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EEBC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wgc8m2ffW0K8m7hNVPYrvZDbb5H5c3q0ozQ5Jpfyw6M=; b=vpInBRK9ngdWBO6XK8IqmmDXQT
	Z+RYJDiFFtPn2F/ISQhs2jkP/9ns6U9IDIQv0ve7lnR2jq4c/AJ1oPYCLCPcNtbVRZEIAzCESz4+V
	g68Cw1U1sIH3G96xV2H3Lsf3rYgpifgyfp2S4/1HVMfrANfYJVDYkxP/kue2TdNvHDH5jPvgtkmKx
	mtRs35jj5Cog+nWNU068nLDldj6FCwEa505DXlNJ0npceXJEQ81fSDoOImJiHBnLVOoDUaZRi4u/h
	mtw+oXoA7BAi4UaC8y2ajhjdAYf1s8+Isc4yHBSXbO/v526TgDgF+80+neZOG3Bhh6r93Z5fAWVcf
	Oe1Y63Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifDr-0000000CSQo-2mNM;
	Thu, 13 Feb 2025 19:50:07 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifBm-0000000CS8n-1no4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 19:47:59 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2b8e2606a58so682483fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 11:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739476077; x=1740080877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgc8m2ffW0K8m7hNVPYrvZDbb5H5c3q0ozQ5Jpfyw6M=;
        b=WtvOZFo/R6YBIpdqdhuVCILkldm8nKH4azfuK80c7rhmejkOpjEKiS5XG3W8Ls31jW
         LT3Ff3Gnw/xMeEyCotXLip9sozOKrq+OpTjQFP6oENLJdKD2ysWCaWtL9sXVpF4CNUxk
         EuS79wUCQTkfRMpYgrtWahyY60N64wXea71QCqpI5WOZgQlJ6hty0SsBDmPIjxFgLMme
         JrwBPGbTh7b7qeKRPBQm4mqqL5arrsIK3eeo04vJ6qJuvXkmp+a66MXr4HaAsR9h7TmZ
         YkszwcC5s60npIGzMakg5BAjaQOIAPOZNYfXX+Xdbv0Bfcc8NKyOQNxm5G0Pqaqf+log
         NGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739476077; x=1740080877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgc8m2ffW0K8m7hNVPYrvZDbb5H5c3q0ozQ5Jpfyw6M=;
        b=N8fv7AC6CUklTcWvo8yqXn+Yh8R5eD6zaKUILJIiw/Xq+5prB0SPXaA34jXgwUaUNh
         raN0EKhSMz0lZ6kpD0SAyoOjf6z9nuDmtvDa60rsTYLXdS0rSXMVTOFDJ1UNbe2A5uyF
         ZP7+zl0iQCCUjObkMh/Zxq1jUYTV44TkYcNLmPkAbWbcvMcw2GmXa3xuPEs/rw8YBVNC
         1YLhuylzHj8fBhQHRbLnQXzngSYVsVRGV8RDIIo3Pk45hIVzi+mS4NOFH8KIg+mEmaSi
         aDXZA1JnyyOw0/w5Lchytsz3juGvm5aVeaSa0oTwnbdzwiMsH1UOXrXbbL0AefyzUs5E
         QxCA==
X-Forwarded-Encrypted: i=1; AJvYcCWbcVuvhXq9qBzLw8LCd80mBJuHo8O0+W5WqgDTzz90yi7NiSb/ciJYBXIwlIC9zafGmqJvrt2cINdnBua8zkxt@lists.infradead.org
X-Gm-Message-State: AOJu0Yygb2PHFPWDBd6OuKImgOGWVl+sP0ZVnkivMWL6v5KljNyVScMc
	xDlBPEriLDyMKc00PUTde5AuP4i1u8mJ8ALyXE4+UNqT1ArjC8ec
X-Gm-Gg: ASbGncuT6ItvjTkdB5wvqAgc65a1y1YSQtNm8zDdhSGt+xyLj74TlgaX6loGs0+6EJU
	BRogc0Mt5DrMfssWy4EGjzoRLd3zo4GcNpqN69YG6OvvjoCQHwyjHA0kNw+lON6e5PSyKDnsvSz
	FAFejbEGER+PoPFaXm3/WUdl3YOHs+Xd4S0itTXFhgKj1VcuFSKk0vXu1nsLcmQIHpHl3w8m2ww
	yI7snEYWiOfEcIV1kjujhu6bSRawLGl9OEqLQghzmU284P2XUZ1tTlvkHmSQGPHggkkNHz9k0+K
	wgPhKmeIOsQQcOabgtCKSl9I9GibNSIFkImPrLD+3G3xeYvlhMtvxDvpF6Q6nA==
X-Google-Smtp-Source: AGHT+IH40VRoRAnhhkBrdBVL3wpw5PZCEeEg4F12l8trpqePnOjbk6m3KtGHvVNpBjAdLQge2XaEhA==
X-Received: by 2002:a05:6871:7b0a:b0:284:ff51:58ad with SMTP id 586e51a60fabf-2b8daf08a71mr5152420fac.27.1739476076940;
        Thu, 13 Feb 2025 11:47:56 -0800 (PST)
Received: from droid-r8s ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b95a6bf7b3sm1049692fac.32.2025.02.13.11.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 11:47:56 -0800 (PST)
Date: Thu, 13 Feb 2025 19:47:45 +0000
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, andi.shyti@kernel.org,
	andre.draszik@linaro.org, broonie@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
	peter.griffin@linaro.org, robh@kernel.org,
	wachiturroxd150@gmail.com
Subject: Re: [PATCH v1 0/2] spi: s3c64xx: add support for
 samsung,exynos990-spi
Message-ID: <Z65MYSNuDdCFNlv6@droid-r8s>
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
 <bad7b5b6-c61b-4e93-9415-6476976c8e81@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bad7b5b6-c61b-4e93-9415-6476976c8e81@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_114758_477019_8E1F452C 
X-CRM114-Status: GOOD (  11.97  )
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

On Thu, Feb 13, 2025 at 07:05:22AM +0000, Tudor Ambarus wrote:
> gs101 mandates 32-bit accesses too.

Also in exynos990 [0]

> > the SPI node where it will have to be specified in DT (Device Tree).
> 
> gs101 has some USI nodes that can work only in uart mode and indeed the
> fifosize there is 256. Does downstream define SPI nodes with 256 bytes
> FIFOs? Can you please point me the the downstream code?
> 

Yes, Exynos990 has SPI nodes with 256-byte FIFOs, and you can see this in
the downstream kernel. Here are some relevant references:

- SPI8: [1]
- SPI9: [2]
- SPI10: [3]

Best regards,
Denzeel

[0] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/drivers/spi/spi-s3c64xx.c#L767
[1] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/arch/arm64/boot/dts/exynos/exynos9830-usi.dtsi#L1641
[2] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/arch/arm64/boot/dts/exynos/exynos9830-usi.dtsi#L1662
[3] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/arch/arm64/boot/dts/exynos/exynos9830-usi.dtsi#L1683

