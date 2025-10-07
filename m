Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A65CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 05:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TY1Z3zjE2hmR/H8RZQ8GW2E7K5sHv4uVwuJ09oV8pME=; b=hKTb3B/L2kITCN7O6W6uUU2glN
	x8Fvc+cDt54PkWDuHNaEXi/12EAFzvVa9HLnLAcSzKWTKR1fOncAzR0+wTSi8mGTW+T85lxEtWuaS
	xx72H6at1ZTy9lcXbe75yE/bGqzByZ6CjuJhPBkd7OFS66cfS2bDouhS7WTetcOV0iLy/AzokNZJM
	cJmZ8DFVTx1J1la+XAYXe1u1K/yxYITsRGzsYLbOhqX1FzV7/vVLfu25QqcZPIANbiAy0mearSJXd
	6fASbtdOAdkWrAjqoBmvNe5RZge2QNvthb1MpVWAKywLjQjZrTI8zCcmY9/AySMfmelAM2qGYR7Rw
	HNdik4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60jH-00000001KQD-1a31;
	Tue, 07 Oct 2025 05:59:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v60jE-00000001KPI-46Nd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 05:59:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-27d2c35c459so42216985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 22:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759816756; x=1760421556; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TY1Z3zjE2hmR/H8RZQ8GW2E7K5sHv4uVwuJ09oV8pME=;
        b=cDErINHYzYGhhyxwVmr95J52tjS80sr0NnRXYOJ5FYcqrOh6KxY7ERhP/KdETiA30U
         XArGfAQBU/pv5QRzBW3t+YXAjargpRyf7lwfmOgQvLcGSewlUfwp812xrLQP+cm9B9m/
         pwwMs+aWCccJ/WWqo8KTWGPDHVtNnTzma8XFndUma3CjJCWkBe6JMnLNAiO7RMtHarN3
         c2hQ0pRbGbBNHRFckpo8WE2gdYpMWMii3Ehyw+XQoYSt9wcrHW9i9QA2iZCImjdK7Rzy
         eLUCPIcMDYUDJ4MvItLdPv5YzUpXrdpdrsz222pqdJUgFq6JpD1ze1KkU+Q5xGUnuBuf
         qfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759816756; x=1760421556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TY1Z3zjE2hmR/H8RZQ8GW2E7K5sHv4uVwuJ09oV8pME=;
        b=IMossBCGJPcuU+l+gRfznzGoKq5Rvx1dc8m9J4kFS2hQKPuhOIqCAvINuQpduBhI/8
         DM0SxhzFqMjLsDni7PrACgAFUY9z5c4BV3wXiIHFBdIgVMH7Hvd/sq5MdXe0/GSgpF4Z
         F1LWUg/HvkMIY/GbH6wcmeAk0TDk/oc8Y3dOoa4eVZLhGYgN1OFGRsx/ZfoG7Gtjh0hV
         n6QwRW0vlEceX5xOSbyauTBFhyG0sigMQukoprDIgtHTRlQelRWt1V5USIOi2dSo86j0
         DR72qKH4ExXKdMrYgxnoM3NgkGe5BZDgiHuAgDv5+/gtLs1p+c6sH0mLyhlsT9SPRyx2
         4y1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjI40Br9ti1t0fn3CO2+YuaV5JGsl4VbxvzFs7+DbjUVnHIntZBDAThLKwdO3Rs3y804pRvCvpasVzfcM9TUJu@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkFE+fkvWgGzRxaQfsv+qV9cYQELz3N4zF+XDBZt06krOhofN
	kocsK6xNrCq0MZyadl5uEcKG99kt61LruIH+ZX7VGROK6uC0l5nMEd7H
X-Gm-Gg: ASbGncuQIqnt8c01e+bz8F3d9VgJn32+WtnPW/SvuqtTanLG4sNGh+VLytOy4c4vi6h
	n6+Uo+eUacwG+MA1hxT6HkVf8EoXk0B9AsfAhchdNRDf38ZUmc2LaYqPhjGb58Mcy+9aUG9SSlf
	/TvqqNhZbcOcoqTirh6y5lasPHeFeE7zSd7wzVZSLrnwvCOZqtiQ4Z4l7m5k+V0ONCGThc5da7f
	lQ0zcmgHoHbu38Wza8gVrQeQoTami3yptzZJMfKHZkhZ+BKQyS476tXEtYJ6Qb2a6i4Pjz0fes0
	fTiTYZ5g1dV1eRZ2zjUTnvj4RFgozaovUmRfJzLIF5g82A0NKLyfSZ/wkvYetl4PSsre7xoyCUt
	WCh8NHshQ3X8lwWe08NPc99FWlcedOUNYjuaUl8QFyhVbsOfh0shDwRrocdWt4HNSyWRlCmXL7U
	FWnDuNZvohovK4G1cuIjvsAs1r
X-Google-Smtp-Source: AGHT+IFlzsudHAIxUbF3d9k5TBWY8zUqb3RirQ/wOsrjbntDRjbfjMsD2j/0ZFEZEcTWL9AWUFx/Eg==
X-Received: by 2002:a17:902:f708:b0:27e:ef27:1e52 with SMTP id d9443c01a7336-28e9a6aa8ddmr160679545ad.35.1759816755990;
        Mon, 06 Oct 2025 22:59:15 -0700 (PDT)
Received: from [192.168.68.62] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d135cdcsm151111185ad.59.2025.10.06.22.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 22:59:15 -0700 (PDT)
Message-ID: <7476a26d-c629-49a4-ab47-eaffda482782@gmail.com>
Date: Mon, 6 Oct 2025 22:59:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] arm64: dts: rk3399-pinephone-pro: Add
 light/proximity sensor support
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>, Martijn Braam <martijn@brixit.nl>,
 =?UTF-8?Q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com>
 <20250929-ppp_light_accel_mag_vol-down-v4-1-6598f22d3451@gmail.com>
 <DD5714TDL1NA.26WS3YF7EMZ5I@cknow.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <DD5714TDL1NA.26WS3YF7EMZ5I@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_225917_049484_FF5BEA39 
X-CRM114-Status: GOOD (  10.22  )
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

Hello Diederik,

>> +	stk3311 {
>> +		stk3311_int: stk3311-int {
>> +			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;
> On page 11 and 17 of PPP schematic V1.0-20211127 I see LIGHT_INT_L as
> identifier so it's best to use that identifier here, thus
> ``light_int_l: light-int-l {``
> and update the pinctrl-0 reference accordingly.
Thanks! Since this is a simple change, I will wait for more comments in 
this patch series (would like comments on the mount matrices for the 
accelerometer and the magnetometer). I will put this change in v5 if I 
send one.


Thanks,

Rudraksha


