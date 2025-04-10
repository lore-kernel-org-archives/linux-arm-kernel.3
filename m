Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1ECC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=; b=Cj9AGAX+/RQU9NhbujCKeEv7Pw
	4qyVM/P/cK49qcyDo584WLSwVHf4zDjBps0uML5z/gGIA8I5HgBqxhsOBS1wJvDhEh9wH0kGrGuTZ
	8s/zAJyFVuyMKssuoD5ksGk3VpG0XN0g/QT+9N337yMVrd1rJNee2007PqRGq34O3I3NWCkRIYu6L
	Z+hEtZTvOhNu/H7OpLI6pSkVEWw3e5AvbauGju9ZtbHm2D6PfJ3FgNDTf6kkIaqP/r8O4hihGrjIl
	m+4TpiFcLsK1pabP2L6P7O8LwFNjqTAjgWz0QnbkmgcHJl4aoSUdwhTMn/BP5fH40i5+GkOLqyI9K
	JWf41gew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30Vb-0000000ByVB-1Ujw;
	Thu, 10 Apr 2025 22:36:31 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u30Tn-0000000ByMf-1bAe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 22:34:40 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso12331871fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744324477; x=1744929277; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
        b=LwBdbPLN7aAw3+3q4geTeSOu+eN6BJ5uhjLfszYLvcAsyWe8o6jkhzJrOMA7lTAn3I
         zR/drT1vDAtIKxN40TOB4xxYOzk3enrDaso8Cy9mo7KCs+rRQZQSVjTSTRakf7Qetq7p
         JYmz0LzIyb1qc6Fpdo5D4PijEe0/f0wclNK7YDkYSKfGZbItxmxxM4xUq+PV1sgEV+sT
         mX7/3MPH+7/Iz8GRxpSMg6IsUCOmu+gyXR6liRrroOZ9JMYcQkwPM7zfU3uDxN/mlB+j
         zYyixvfmaoGEIWA62mghz/CVZP+9hInasQf68gd2ia5rrX+uOvvyWIbPSozwLMRzAMeh
         Ajzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744324477; x=1744929277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wxm965eZNAy9BW5/MykKmQUsmb3umX7nRNXwA9XN5e4=;
        b=VurT6XvGF46oionT367ZQO2G/NkMHJ/olLdCerzBk8V6+ssi+CCPmrk9B56qAzxFqj
         /3wApuMlKkrdxRZjsa7TwCxFuBV8JfeZUsBGwZJkk9vnFUtZnWQwNpV+Ie1b/WfOL5vA
         EPxxS8WJjDKHCW0ce0oRwwjWWTkKgknbCUVSN7QpDW29GYb+1roqy1SdF893kX3eLzKe
         N/i5TFgemqm2EmBVMRcYixVDagNfZNhx4N9/r+zyopE2oHOf4rY80DKGuZL3zCT4UhUz
         Rbxqc96L199x70V7FCKMH5twbCCLM9AAj4HM3tI/56za0Rcl5GQ7lCJdTzhCs5zK1yV/
         Ka6g==
X-Forwarded-Encrypted: i=1; AJvYcCVCiJqvipmWOZifM4xR0diFtMocGm2aZCJMinHWpic8SBnPEGBUzZvHVyf31sCZ755rGjzSyv+b4+PMqLLVBQn9@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg+MLIGHWy3N2F/vjL3JJy5pP62HXql3UhHcZReILMEhNJIH5a
	g+rsR6orUc35yw+z/74VLLpn3rxYSva9sPU4XyydYZRuwIyq5Wi0lSL07oXr8rpFgeswkzQUjzF
	svXDpK8wL4qBPb6Dav6hD6C31C4bzXLPKVGXbMQ==
X-Gm-Gg: ASbGncsYR8r/ZSs+Auw/sBOMqt4n3LuTM0f8iYPMiWPCHMKz43DBFXdnGJGetqjb5E3
	oVv8/+5at5XuvLb3F+RILi+UtfsfLsqo4EKC1vOlqgDZNsMsvFQfK68spPYYNpbNS7bnsOlMOlx
	kRE68vHeHUY31oj8joSMw=
X-Google-Smtp-Source: AGHT+IFQ5X/At+JSFNbUE1xnp5LyBwwxt4xHNs/nHrO41KOgi6pNuGUXCpYt2H8bLi1d5Neb0s+pA/F8NRLAxfh8kDo=
X-Received: by 2002:a2e:ad92:0:b0:30b:d63c:ad20 with SMTP id
 38308e7fff4ca-31049a25e74mr1251291fa.24.1744324477293; Thu, 10 Apr 2025
 15:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250318030717.781-1-vulab@iscas.ac.cn>
In-Reply-To: <20250318030717.781-1-vulab@iscas.ac.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Apr 2025 00:34:26 +0200
X-Gm-Features: ATxdqUFAOAmsanh_qMDDdICzYFdtcgmjMNVzfkr1X-a4RyLKP9cm2UhbygtlpGw
Message-ID: <CACRpkdZ+VTCXudLC8L0zK6+Pwd+_NpFDfnR7nf16BXgEnXExeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: Add error handling for pinctrl_utils_add_map_mux()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: ludovic.desroches@microchip.com, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_153439_433455_E93A6B38 
X-CRM114-Status: GOOD (  10.90  )
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

On Tue, Mar 18, 2025 at 4:07=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> In atmel_pctl_dt_subnode_to_map(), the return value of
> pinctrl_utils_add_map_mux() needs to be checked, for the function
> will fail to associate group when the group map is full. Add error
> handling for pinctrl_utils_add_map_mux() to return immediately and
> propagate the error code to caller function when the function fails.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Patch applied.

Yours,
Linus Walleij

