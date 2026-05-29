Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F74ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjGV1ydNT4vhjd08DNoiUIAjJm6vDoz197TfHBqCPyQ=; b=FUpiiVG7NIUQKYL654h2UJ99me
	kT7IQLeMHTPvCb1d/mJgxwj/fsbWMyprNV9UBSxr3t3+uYObynTzfjmlHOa7bgf2xMl5gnX3Gxgat
	KrjQ/JTWPJfoPNZTDqxFwWKyRH8kgqo8JUlGalTWis0+eSl5PgnLHSqcpC0j7zxfckI6j660huaz8
	QUK5/nAFhDZZmhNP3+Qay8v8+BADeoYRYKLdFNS0DKh4Jt8VVkH5oNNDTycjwnmb/v4+elqmhpXsf
	EeLKdgJ7RZ35tzqApyXRLLOzh4Rs0qmCmJtoGH8uvUEIJy0W80nX6A6IZSizba9YsmQ/eyaUrRbgR
	ADvJmV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyuq-00000007e90-3WaI;
	Fri, 29 May 2026 15:14:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyuo-00000007e8Y-24aZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:14:27 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so8384591a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780067665; x=1780672465; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjGV1ydNT4vhjd08DNoiUIAjJm6vDoz197TfHBqCPyQ=;
        b=k4x1o6tWKdipyMpkIMpswo2yvbocRG/+CxGc+/0MUAdtTeq6jek1p1a5B4frdOJ0Fp
         2R6MDarDudkWWsDEdOe94UDeczDbTyxflWNbwsgLQPephiLJme9EL+1kdi4TdJWQzRgj
         e/IEKrmkMGditJLtJ5StLxwHssVOEJZALViCAAqtZ7YI4KNDEuJ3LKuZKPOLcEoY7lcZ
         TrQ/2TjaajVSjDF9SFD+FVGFWYspuKcamvONC5+U91T+Utloj1qXb4rTeFxbat7FfhVS
         0sPb6NFDqcQtbDS5BSiBa+yqQvXZy/cjqRc2giP/IeNplPG56HT5nbCNhh4cwu8O6IZW
         1i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067665; x=1780672465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjGV1ydNT4vhjd08DNoiUIAjJm6vDoz197TfHBqCPyQ=;
        b=DqMS4NyL4lP5XB6svvC27b1Nd65gAm9VzaZbY30yl+d5otR+AhwZGoWnZ349XGsM/v
         BJEnluRhWqvlSWAeUwXNsGM492fxvVMizMmZLT5lcU5XgGOCCHiR6X1ISCECOsI4K+Ys
         UmLAFSQnMhDeSxyeskO6NeHi2obqzn0iF05cNsH/0VmeJVgHsZU4ywgne3yI3IgXLiSd
         QQ3bXFoTtxm0EQHQ4ae9ajFaQiGeU11blNUqRpcgFLIaAIeYvESxRCHmthtf6CcinTMR
         XtrO0y1UcYyz6V8fDadnkyUISJO3u4hQdKSfv7TUUV43fSMRksIym36gMyW2WGV6jBPM
         LGeg==
X-Forwarded-Encrypted: i=1; AFNElJ+oJVaeNj+womfUxO5LHckXKOEShRZo0vO86XFz2rboAJAqBNvcCwND6DGQ3zph4oA/M10eLZBHnPGNRexUpzEq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+lj32XY1VAEQVjMPjRmOZuXaLvkmfwXwJN38YfmyPc/NVgeA5
	TkxiGBSxgnC9nbYNJjp7MRRV7bfEBfMBjnsiXr/Eh99EP6GO/1tpgz+jgSTthyRsyTQ=
X-Gm-Gg: Acq92OFCO5Tmz0cfn/X15JauMuk1mxaZIou+lrrQ8tNoIFn9pBJs7P70UsAuBFcyy/d
	KrwM3n0Exg1P67rYEn0clst4qzYb79x60ot+DidiXr25pvRnX27rrMcVJl1ReqPRVXC7VJz5bes
	B1CR7k4OXXhmcINqAFlWVu8rHwO9zFIL8ZTx6zdQ8KEhYDlc6hnWaQdrKvIk2MqrG3hUWFbo+FU
	JO6Ysyj/Rd1pw9eQ2WJ8cQJN/NYrOlssRiJxokPevqg4E9oJJx0JAkNf1NUrwjQCIWeOLYlyZXy
	ExMzeBYElOnBUxnG6NK+b0Ce3y5H9cNZVJ95yQx7rWZCFFdeZvzu39AHPzLGNWbGCYUIIkQ/tzo
	b2ueuRPasRgDSkwvu/5klnxuFgvKI7718uXszcI71DmIK1EgifUi4Uq5X6L/ewLol5fY/Vlj8yJ
	DJ1yuMQv118Unmm47rXc444A2ey3peCoQqxnRWXQ==
X-Received: by 2002:a17:902:fc8e:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2bf368463e6mr2923465ad.27.1780067664889;
        Fri, 29 May 2026 08:14:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fe93:5096:4a36:4399])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm24992375ad.8.2026.05.29.08.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:14:24 -0700 (PDT)
Date: Fri, 29 May 2026 09:14:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] remoteproc: xlnx: add auto-boot support
Message-ID: <ahmtTVp9Kv2ZH-Ds@p14s>
References: <20260527051611.194844-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527051611.194844-1-tanmay.shah@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_081426_543651_A48F5AB3 
X-CRM114-Status: GOOD (  15.96  )
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

On Tue, May 26, 2026 at 10:16:09PM -0700, Tanmay Shah wrote:
> The Linux kernel remoteproc framework provides auto boot feature. When
> enabled, the remote processor framework attempts to start the remote
> processor based on the firmware-name provided in the device-tree or
> attach to the remote processor if bootloader has already started the
> remote processor. Enable this auto boot feature for all AMD-xilinx
> platforms.
> 
> Changes in v3:
>   - add more descriptive commit message in the patch 2/2.
> 
> Changes in v2:
>   - remove the auto-boot property from bindings patch (1/2)
>   - rebase on latest remoteproc for-next branch
>   - refactor the driver patch (2/2) and detect the auto-boot runtime
> 
> 
> Tanmay Shah (2):
>   dt-bindings: remoteproc: xlnx: add firmware-name property
>   remoteproc: xlnx: enable auto boot feature
> 
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  4 ++
>  drivers/remoteproc/xlnx_r5_remoteproc.c       | 48 +++++++++++++------
>  2 files changed, 38 insertions(+), 14 deletions(-)
> 

Applied.

Thanks,
Mathieu

> 
> base-commit: 90de217305800ff32df4c0308e240925c8deb385
> -- 
> 2.34.1
> 

