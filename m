Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2427EC47BE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9SJsn0IaBRHmsN3YyFL5FZJYk6K2cgBjWAKNd98Wh8=; b=ifWFgKjlucZ1XYH/NQOTUceR6N
	qHCRSwCP0pnXgaHYlgZsAFGx53+rT6BIPqeUTA/+Xf7k/QJ/gNb/BIvKpg5/s7xtho5f1i4lOxY4h
	oNgkk05NHaY8RLTX4QuZS/DXLb7JRXocjlt8LrptF+4E2EepcY4dyqBeBnRAv/EAgAik3+Rd5p/mP
	XIacd5IuKw16npIOy5TpVJHGw47QWDW49ky51RVh9KfkKaqvHx0spyl5TM0C9McI26zNRDmJUVZjn
	jnHFqhR1KdGzv1gnG/2uPEFHuGJzz4SMaLceqGCFBN2cju3Lq1NO4FrmKkmgOxRxVSAKdUSU4XT/X
	jPNOyjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4yk-0000000Cqk6-0EDY;
	Tue, 06 Jan 2026 11:11:58 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4yd-0000000Cqiw-0PDN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:11:52 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-430fbb6012bso598563f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 03:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767697909; x=1768302709; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V9SJsn0IaBRHmsN3YyFL5FZJYk6K2cgBjWAKNd98Wh8=;
        b=U8jz3MvunU80+tHif0xGs0+3qdOw+9thumhXfPan4ursrmnyJXuUpO9WsXqMl796Ou
         clVfxH6F1LJwmKZyZUDZmDIag6K6wRvBVP2E4h+DUmJf80lugUKLv3aRkTpv5DxhmbVk
         wICHyc3CpuPIKXBQQR4DX24+zw5cJx/oMsn8WFruPPTJclByp/wUQgRB7osHCSmhIWGU
         8ULHIWL0fYXzlJbFo3gAyqy2xeiWbDQwgyObnSPEvj991FkEZFZ4CKjtuAN1UBQsakuc
         /iLaQ7n/k3CWoSbTHcmVRs1N7yYUbWqgYIrNtS7O9EH9vSXxZWzIZzyP1PY9Gx20HPZ+
         zoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767697909; x=1768302709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SJsn0IaBRHmsN3YyFL5FZJYk6K2cgBjWAKNd98Wh8=;
        b=LaczMGFllPQHLBGuZ02vL3OtA+HpOZmu/9KVN2z6zObxrGeZOFbqpm3RieKN/o9xq8
         FO4vHX8mOKbn4SIfj3DprocFc3neSVYInANMWek0zMpCZCQh79MV/X2vy+CDfEJvnSVM
         yKbFLzlF9F6tx78VXfSDdOq4ELdKqdlOwVSOhy8enTvT55enpneWo9SI1On+F0Pj2vzm
         Mnhu5etCyTiz9lvNScDZm9C1dNgAZfbR8Ml5jO9B+RnS1sB9kJChg0HlTeotUN9/IOZO
         FDOdiNoDRQepl+K7VM9gnG5vzwPKPyB6YdQMZz8kGbXkHxbe6/eWwd+eSinGxRtCO9NA
         FT7w==
X-Forwarded-Encrypted: i=1; AJvYcCUY6MvfChXEWpv68PHcGsZy5tlDOCIM7E5r7z0whCicBeIb0AhkbSodb9mts5DMliish3Q2NKaUorQD09Tpj8bC@lists.infradead.org
X-Gm-Message-State: AOJu0YxqAzBtPPJpzzkPDN3WKvEJN7XxEsPupADV47xHlUbZkvZ3VXTH
	bKjCSz9zH5DOmJ8fLRJOQjLeDf5S3ITzP83B+J27ThFNQIuSGuneNKGh
X-Gm-Gg: AY/fxX7IDnK8P4snjJffIm+wjXJB2vzNheUEG6IzH/JezT0CEEiCOtRWM7SLNAFR0AJ
	ID8OOWqPcQ0jNfSfYpgOdl05J/LXE3GDxA1MW/03D8ZIgtp4rSuyOErVCOiE3OQHUeTnw/kxTzW
	HPi6qfqUyXj3FF+cEsEDgV5rW3vvFUPjMbnl47eVVHxJH5aDKOgRf0T+MwcSEuAh673lXQz5LH3
	vWGerv6uBdEWYGfghJNMYcL71AXhf2iwPQYwTo9VaygOiboSe38bVJBrkrkjEPa+Nhff4w7299q
	tdRKU58D1IissY4xJaJHrqEFmCbdBVPQc/b7+047qjNXNztys27vYvk7eDbKxmcQEGGlfmIAK+4
	XTzFncgpQ1uGUu70HkCDpXqqzT4uqakzTje07G/HNGOyhiUuVidTSREYpIeCVPoa+viEHdi0aqr
	1tZXyrmJSkifu+dRrLS2qhiHubHpxL7pjZtlbpeqR2xQ91AMSO3J3fg9FYb9hEh1hETeE7P9RBO
	zmI5VhADm/z1YT63hsiHdfi8LyR+w9z
X-Google-Smtp-Source: AGHT+IHUuYlVORpetXhgVAXfGMDXsPDVfwvE/C/OPeXgrPCsTr8liGY2193dNTUJMH/upS3YC04ZsQ==
X-Received: by 2002:a05:6000:3105:b0:431:864:d492 with SMTP id ffacd0b85a97d-432bc9efe6bmr3137882f8f.36.1767697908526;
        Tue, 06 Jan 2026 03:11:48 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm3797112f8f.35.2026.01.06.03.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 03:11:48 -0800 (PST)
Date: Tue, 6 Jan 2026 12:11:45 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>, Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX95
Message-ID: <aVzt8XemmIPz18aQ@Lord-Beerus.station>
References: <20260105102412.6674-1-stefano.r@variscite.com>
 <20260105102412.6674-3-stefano.r@variscite.com>
 <aVzjQEhpv4fenAWF@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVzjQEhpv4fenAWF@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_031151_150380_CD458944 
X-CRM114-Status: GOOD (  13.46  )
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

Hi Fabio and Peng,

> 
> CM7 support still not landed, and VPU support also not ready in upstream.
> You may need to drop these reserved nodes.
> 

Thank you for the review and feedback. I'll address all the points
you raised in v4.

I appreciate the work you and the community are doing on i.MX mainline support.
We at Variscite are starting to be committed to actively contributing upstream,
and we're happy to help with upstreaming efforts for the i.MX family,
including driver development and IP block support that may still be missing
or lagging behind vendor BSP.
If there are specific areas where we can assist or collaborate,
please let us know.

Best regards,
Stefano

