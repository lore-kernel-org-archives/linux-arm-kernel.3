Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F532CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 02:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5o8thSzIALN1uPBnoTvMoKA6rLfBMmP8vLMFrWtTp60=; b=lkrn8a+6pNicy0XRMIvIZVJb4i
	2VJYg/a8UBJNlwrZ9x/F4dT+YS6ruY/iu7FnDpW7eQuJ9AkI1iizKNJRdsQ4/tXmQhm2thabHKDm2
	aezB2B5IhttQQSiReNVd+0fdtow7G63V6dWpLKKbcLhFU3H8Kvx6UNDz1h5lQ7lA1YYBTu6eQez3w
	J6q+xtgGnadTpAGommPOo98IPLzKiIfqTzchEY+70C/eZ1Q4CbPPsSs0icERA8r2DeZz9bULbQRX+
	fcIi3prmwXxHAFVZY/CNLjZh1XYXkhQpJDPWQhiu8xTYYPznrWymxVMgTzCqj6PL6zpRb7/Xvf8GQ
	UPUkseLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYoW-0000000CCWQ-35n5;
	Wed, 20 Aug 2025 02:44:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYkt-0000000CCCQ-18rp;
	Wed, 20 Aug 2025 02:40:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-245f2a8fa81so625925ad.0;
        Tue, 19 Aug 2025 19:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755657650; x=1756262450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5o8thSzIALN1uPBnoTvMoKA6rLfBMmP8vLMFrWtTp60=;
        b=huIPOAZpoueoWSMjsW1mLDu1hvnZXyULTgkafVEiVi4Zy5BPZZIL/ZqOLXydA60mWJ
         I02UIyxeZ0QIOCjjZ19kyNHJGo1XYQoJR1Bi+0WgTAqYXUQhLualH3ker+hW+Bwoxe8I
         D6qJaa8VdXH5US/fjZolDuSXSTpKxHtf1yeb3iiD9q+50OrpLw3oAkWm2uiJvCXlvc/7
         3A3+LpsSm3PXZZz2TTVQQdNFFhjNrpS8brkLa+OAsOl4wLFeXB786tr0bmLY9hoiZ0l2
         /VIlRLqTBlkhGpzHbgpYzniOHaxMwz0fmKIVvq6jlt9/qN6Kd3wA0LJlb26YNEWqFOX2
         oPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755657650; x=1756262450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5o8thSzIALN1uPBnoTvMoKA6rLfBMmP8vLMFrWtTp60=;
        b=dbyHBxdOp9yf4HtxO8/MdU3Sg5DEHv+oU8xptURUibm2eEBh9DDAXNfs+49Bywtj5Y
         WtLQmK3252B44mueRxzxrIf+H3THw88+eIuzg8cvwtE3JH8+JWWacTfi4teIVbJX3tic
         bx5vuJwunTac3KYQmouzWnaCMsDyj5y3Zz1G6RBrMzdEkvlE3KrwBNBdISif6KjV715m
         MsxRjKSmq7+tQG1O7VQnADJyaVtKcqPKS820dkXFpvclrFkJOU5AFqsbdWdDc0ccfY20
         nrpJVWQf4Im3WU/wdLt9PE5m7RZI021fWkSc1XBZZzz/33nv9klXevKMLI0CpzV1uGDu
         uHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVxTVRXv01mOQtq4EKpRmJDFHk4rFV8b84dR0JukRzSvXBjF4TTt1MJagBrl3fVs3VXaIu5zbF3Rftxh0ItaSa@lists.infradead.org, AJvYcCWMq0bleMeOeIZjNNXfIHla41spjZBlcKzlanjrZSsBAx64LNLhTMv0TnlLilpmH1JiY27kjGG9zu5MENW2nHE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Q5M04DWLSXzv4fQ16iGFoHPF7P6y+8ExwznVWC9IKqlqE9p+
	KspyIkghzbsTj6ZZ2fCPRwI33p2uuQFbcGamKKnO2OYf3cgWphHG/WDZ
X-Gm-Gg: ASbGnct9cvKJ35YQiChoIyZTVTBtfORb9bVmqZCil+TJnQtlsiwSPyl68zMI3Crszu1
	4FBnEkIKf4L4zLNqlhXQ8d5V57v884gjaVCPJIcKqf3cmqjjphowKm/iSY9l5qN5UnLa9rgAfQR
	g0OQk2y2uWU4kqT7N0WwewT+e0UB+Ln1DgcVKv4Ju4ro6dg7IkNuEQBMdYroCvzwjDoVB6CyHBp
	QWP/kQb5mgaWq9hkWs74Sb06n7uMN5rYtrehcS6SaIkc1aAtQqi9TxPBO89s+5fJv8DTkK4hNma
	SZld8gU5VffoK83w4ZLjhGKi31bi2qcyj8607TJv8GWceCtpQS/vD4c9iFnmaHC3qrchuYUPfUL
	xVc7fcXpLZWlOGDQ=
X-Google-Smtp-Source: AGHT+IHq6qOIwEilWM/BAT9k4oZ2UZBkL4UPMZyaTKIJz4HZq4C0Dc+kdcM0flbXi6E7TpzgZz7WIw==
X-Received: by 2002:a17:903:90f:b0:237:e3bc:7691 with SMTP id d9443c01a7336-245ee117b55mr18310785ad.13.1755657650342;
        Tue, 19 Aug 2025 19:40:50 -0700 (PDT)
Received: from anyang ([106.250.177.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec0ddsm10880125ad.114.2025.08.19.19.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 19:40:49 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:40:44 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Change ethernet TXD timing
 delay value
Message-ID: <aKU1rJKzkkS4P+VT@anyang>
References: <20250819075522.2238643-1-tobetter@gmail.com>
 <20250819151019.877709-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819151019.877709-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_194051_313826_8A991819 
X-CRM114-Status: GOOD (  15.88  )
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

On Tue, Aug 19, 2025 at 11:10:19PM +0800, Chukun Pan wrote:
> Hi,
> 
> > Very poor network performance is observed on the ODROID-M1 Board
> > (REV 1.0 20220613) when running iperf3 (under 200Mbits/sec), and
> > this problem can be resolved after changing the value of TXD
> > timing to 0x35 from 0x4f.
> 
> Can you try changing phy-mode to "rgmii-id" ?
> 
> ```
> --- a/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts
> @@ -200,7 +200,7 @@ &gmac0 {
>  	assigned-clock-rates = <0>, <125000000>;
>  	clock_in_out = "output";
>  	phy-handle = <&rgmii_phy0>;
> -	phy-mode = "rgmii";
> +	phy-mode = "rgmii-id";
>  	phy-supply = <&vcc3v3_sys>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_miim
> @@ -209,9 +209,6 @@ &gmac0_rx_bus2
>  		     &gmac0_rgmii_clk
>  		     &gmac0_rgmii_bus>;
>  	status = "okay";
> -
> -	tx_delay = <0x4f>;
> -	rx_delay = <0x2d>;
>  };
>  
>  &gpu {
> ```
> 
> --
> 2.25.1
> 
> 
Thank you for suggesting me to try 'rgmii-id' again.

I'd remember that 'rgmii-id' didn't work with the very early version of
the board, however your suggestion works. Let me test the change with
more boards and submit the new patch when it's done.

Thanks a lot.
Dongjin Kim.

