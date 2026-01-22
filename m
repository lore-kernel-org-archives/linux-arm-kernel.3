Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A97C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 11:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+UcNIPm8dyZnR8BXU0OMEYGl+DXyJ7iURZd+ps1GVU=; b=nUOpSWSlUXKVT1UwGaKSPzAQoc
	XVwz/csu0jM3hZ3ANvzcTFHrbkaZZSd2TWqIP+zUoe5ioRhkuAgECETP0x6GJr17ZtX99pLhiUAdl
	CZGaeZ5lwHPo4HXZS2Dl8Y/59GJhcgLCgkFDptqCh5uhSgW6d0sAud6Qvm/ngoyEqq/ggc/bFoni3
	VbajxDk36z1U4Rx08J+bfx/+betWsh9HG9WZTUxTr67bby5uQOq/u4ovMa0e4RX1g4BcdMOIqpxWx
	7Nm/c3Qf1ATf4hMw74Qe2fsVjjMIGJAtmyvIGcIoz1pFBGro8qGcpldKviFLE4W+pTqnNsg0tTgmM
	skx63ozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vispY-00000006xq5-2WfO;
	Thu, 22 Jan 2026 11:26:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vispW-00000006xpb-1T80
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 11:26:27 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34b75fba315so564365a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 03:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769081185; x=1769685985; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o+UcNIPm8dyZnR8BXU0OMEYGl+DXyJ7iURZd+ps1GVU=;
        b=iBzaPbSYVCEmcyLRo54M78Qjb325W7xbmO/7pnp1re8A38qAvs9OzfR+YktZdG1SZz
         QDlOQFT2ossO8s3+a4KYgsPMTa7bwnov3zgQc6GTl+iRpdLJkOOQwLi6uT+N+aQVofWn
         t/9FeHGjbl4iaZLvPsJqAhGEPZz+fdkGT8aVp9pYdkiCvvjeuV0jp9yVeVbBzILli8wn
         lsCtsjjnVBfDcDcKB/lrOsxy3bl3cTuecqtkB7vIP75CVJ6MXwWP5XcLCUQtDqUz2/9C
         DS6T9O7YXEl1MH93tej4L3uVR8/E1sqxvHvCGhFPTYyM48au34l5Y/dc4KozJP3dIykg
         +8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769081185; x=1769685985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+UcNIPm8dyZnR8BXU0OMEYGl+DXyJ7iURZd+ps1GVU=;
        b=VpvmsLZ7kly9rQPVHrWtpmr2mgf+tKWz7bPht5KdK4hybzpQYy4HT6XNXtDMIB7p7X
         cPnXNq0QNU/9giJhvLGl7MFyDvcafOHC2w+XFEIR6UAAfym3qm6uFKiTVyN388Z0ZbVf
         HnsnfeOnoH0+ZAiYijqfDm450QXVBr8sSIOSBi6Ui1X6tsXWLgSc8fK/0c4PMZj2gkB4
         wrfV7Swyjp2//Ba1LEoDXTxEv1cP4mu19MZD4noNeekKrVDmtwNV8nOmeQ8qGEqXMomt
         lak0vU0FIwwE2qXOubeYCEfJmL5mTdVhDvskM3MgInVWoGwEN5nUOT0x+ZTaJ/DF+YGJ
         AQvA==
X-Forwarded-Encrypted: i=1; AJvYcCU+CUZPTacF5SWs3nGT2tDXbG5Hb5muB2J6ywAfoAARIpPlbLck4IHaca2Cxg2eWOKMTM30biITRzMUtIiJcr4T@lists.infradead.org
X-Gm-Message-State: AOJu0YztHUaqq/ZmyvwztHBaj7UO/PBulOYRTW9LPnnKZC0O0bZsiga4
	SXH+kKDkdfH8vMOo4R3h+HWaab9o4Rdthe0V7EzZkz3qRmE55K9mQNfPQH/kSGDavvQ=
X-Gm-Gg: AZuq6aKNxOxDM6jfLZ/HPycFGmPlMckM26cOjdi75ECFeTk/wIffJKB5J5bY223IC2I
	TH6RzK93A1hLfLwrWdhXr7aRf/KTZYeI8LhT+5ACjuMcMS2F1KpGfz3h+R5+UkbfGhBYwBDJCi/
	8GG/RVJs3b/6uBQwbTHg5/TI4FX7txfwr7Yrj3OWGiO0R1YqVHcWlltNo2YDFrJxc3eXiJPlQOj
	jFs8RSrhtN5Heps54UpRf0JSO7mfV7nB0jF4mBgqKSdmfLF/YEQvmOciXv69tql0g1kbMz/eMdA
	gAjEt+M7EwviWXZRSIG0ZBf9Fbjbj76t2xJROUw+/FqKTKoRvpRpJkXbQ0OzLbTXxcaO3p8Qg0j
	0nbDDhrMCOVdW7ssgTLlSTzKlRyqpJRiW86Pjhskwb0aR46DHm5t4Babx1fJBIFkQ6EQ6Ua1JR+
	LTVv7D59YI4SY=
X-Received: by 2002:a17:90b:3ecc:b0:33b:dec9:d9aa with SMTP id 98e67ed59e1d1-35272fb7c36mr15941134a91.25.1769081184772;
        Thu, 22 Jan 2026 03:26:24 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d82fsm17201003a12.19.2026.01.22.03.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 03:26:24 -0800 (PST)
Date: Thu, 22 Jan 2026 16:56:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kendall Willis <k-willis@ti.com>, Bryan Brattlof <bb@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: support cpufreq
Message-ID: <dys7x6zsaofct4ozb4unbojc22devxiz5qebdb7m3b7kxx6nmb@j5iaqv7yuptn>
References: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_032626_387016_4CD495B9 
X-CRM114-Status: GOOD (  13.21  )
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

On 22-01-26, 16:19, Dhruva Gole wrote:
> Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse table
> syscon to k3-am62l-wakeup.dtsi for speed grade detection.
> 
> Add the operating-points-v2 table with CPU frequency steps from 200MHz to
> 1.25GHz to k3-am62l3.dtsi
> 
> Configure CPU clocks to reference the SCMI clock controller for frequency
> scaling
> 
> This enables proper CPU frequency scaling capabilities for the AM62L SoC
> using the ARM SCMI protocol to interact with the power management firmware.
> 
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
> The driver changes were merged previously [0], and so the DT patch
> is now being posted seperately. 

This should still be marked V4 with all previous version history.
(Don't resend just for that now).

-- 
viresh

