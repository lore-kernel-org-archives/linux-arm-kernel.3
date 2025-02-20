Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5E9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaVNXNjq1ElMFLlTTOfZIVj51BctnvhUtgIniMypH0c=; b=DP9gkpQsuv/OfCA665F4vHGkKt
	D3M9AmnuMsaEile6CnsCToRUZUPwnPfN9c0jOv8+bRGoI+I3Fgmf2qwSdw8Jtv++2OTuTuxVRSQn3
	tEBI8xLy7h2CbdGlg1j2YIfKhNv4AI6d8E+G3qn4XVo6ZwoMP1m+CEYT8r2Wzx9dxlhHxSushqb3Q
	WixvZ5Xf2tmaPXSha3fx9Yxfdorbm+uu1QxpS1coRsqRBHiEkthreUZ1obfZOyepLrXyPsHveSjne
	lXK7Hl2hFLDj+pvpEzCgrFn1s3/T/Q2L4qSpHZhrLSO+nrA+czLxEkW8PBTLscH0zBGdB8s4Ytx94
	tTcrEUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6U5-000000011bt-1myf;
	Thu, 20 Feb 2025 13:20:57 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6QA-000000010Z3-4BO7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:16:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54622e97753so908653e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 05:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740057413; x=1740662213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaVNXNjq1ElMFLlTTOfZIVj51BctnvhUtgIniMypH0c=;
        b=X5VLM6b0ga3OxrOjTaPGNUcoPp6mXz51jL+vVDxVI9X8oTeIKNnCluMXciFOzU8gmC
         7/OqTWmUWGFqdvOK2CRRyytpDBC4yVtk+TBGbIJhrqfZGidl38w1P2Lmtel/fHbr3Q9O
         oioSclwUJxe+m3moheel0zNmkiwMTJiXvfXuzj/oHiixKbNn2zCfPkkGy8An1aUzY/g0
         /iaE8HTE7TM30LPVUhIGRhDjaLtmcz4v7CXpK5PtUZG1j++yi6zrD/GFbr8k0yF5wReZ
         HpqbIZR356fLNx43KV8ZqrVC5dxzp/miGFN6OvRoTPoYNKYLoG2hTK9RTtl2Jg/Wj8rv
         DqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057413; x=1740662213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaVNXNjq1ElMFLlTTOfZIVj51BctnvhUtgIniMypH0c=;
        b=DYz1Ru3lOKTHSfPbfi6iX7/oJpd1LOOVXiTBqJ11e4C4sZ4+QXN8jjNq5Kvr7DMVOP
         43bnwFmTANg/lkkLJvSUsInfqyZouw8rkDNDEikLZVAt/XRahcyyvWhmNTgsRv3Bp33d
         wub+HGJRIRTC/E+cJmjdZwYTxka/X3HA5y8k3LFxrn+/0iKwuJMB+s9Uws7J0nU09zck
         Ejeg+onsqbM5qMetLaUG1sG+iFG9shNyQSwj/MGXlbrdBOkTgqlI/yG7DK4S4koY1xJc
         xobmwYAjW/WjIqwU3FLUHoAd5SDyHvR/6tWO1UScUbTQg7j8Lr/qAO2QJjJx7ZSWnA4M
         8MCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuoP6X8s0FLEZAUp9NkNCDVtCcc+vBjEnxLHGsBXzOXL2Z0KcgNUI9qPhK82BfMNGk46PXa3oaHnmTddkWfnDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZgqe0+03zg/UQvcOk429VQSRxx+hORfWCBfBG8jzIFsZYDSaY
	nrCBy+9TPyFmHqJK8Ihqzf9BaTfhUEeHrKVw5JGAPgZMLXeascRXNoT2ykaYOfnaKysLOxiHyBM
	8ze3u7e/yPvfEnrryBd8/y5RBIuQ=
X-Gm-Gg: ASbGncuuIC9pktyk0A7mDp5H5Ewe/mZe9FkCQ/jYvH5CydPMGgxyY5OMDj1vwTwgrg1
	BDSb6HJfzhNRIfE2IzDBUQ6Lz3gjlksoOV27pr61KwcIpva8IUt7gsMoukWpKPorQvC1QMskj4B
	SbfK6Hqe47ouheKqbAsq1ECGhvWyxi
X-Google-Smtp-Source: AGHT+IEqrcUDruUQVQw9PIP2nnmcnaqL8mazMw0/UGT3eK0B4REIyCdcsoXrs0tonKtkAZNfU63+ca9wZ9XZ4Tsitrs=
X-Received: by 2002:a05:6512:308a:b0:545:c75:9c6 with SMTP id
 2adb3069b0e04-546e418b55bmr1164686e87.8.1740057412747; Thu, 20 Feb 2025
 05:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20250203120511.996058-1-festevam@gmail.com>
In-Reply-To: <20250203120511.996058-1-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 20 Feb 2025 10:16:41 -0300
X-Gm-Features: AWEUYZk1uCXrk08JxvlmJsfKPSn-ht4DFhoROrzsctBN9z8H8OYfXWt2Uh7qgi8
Message-ID: <CAOMZO5AT6BfwWQRXo16dhgpT7bJ07xjPCOFdY5M7DTiU7ui8+w@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: dts: vf610-bk4: Use the more specific "lwn,bk4-spi"
To: shawnguo@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	lukma@denx.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_051655_039314_436305CD 
X-CRM114-Status: GOOD (  13.16  )
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

Hi Shawn,

On Mon, Feb 3, 2025 at 9:05=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Currently, the compatible string used for the spidev device is "lwn,bk4",
> which is the same as the board compatible string documented at fsl.yaml.
>
> This causes several dt-schema warnings:
>
> make dtbs_check DT_SCHEMA_FILES=3Dfsl.yaml
> ...
>
> ['lwn,bk4'] is too short
> 'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
> 'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
> 'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
>
> Use a more specific "lwn,bk4-spi" compatible string to fix the problem.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> ...
> Changes since v1:
> - Only resend this patch. The lwn,bk4-spi compatible has already
> been accepted.

A gentle ping.

