Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E084BEFD207
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUGoA5Mdlzfvkphr1VZ4u6c5zcEyJv1/BZWrrk27NlQ=; b=19AJ2PpnLM80qxe2jToBNn2EDz
	3OQYGiPAMigQId/p6B6y8qxMTigUTuGV4u1IIDNaBN3iG7yBnTne+pjp3U5aiGGJa1ifrme/yT3gZ
	Eq5bSorSwcAGVsOXZhdBVnKurIFGtcRsw1mhm6xURop9+IWGDFp0jeZvJTRHoJ5QOV994wt6EftV5
	zPCjVRFzbesfLorVfwOHvkk6baz86VSqUk8sXzwi8N+hQYD3oZOe8xyykuIaJxZ39qxQuM3a/xble
	ujf7dxwdokgCyPP3miXtiYZV8ZGFPMXxCv8I0ezbJsYSEFjgTaAYB65MFyD5Q61jtHmAwfCQsV9q4
	jUNal3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA1o-00000003TyX-2dYL;
	Wed, 25 Feb 2026 08:13:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA1m-00000003Txi-0pDY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43D9560122
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A92C4AF0D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772007228;
	bh=yUGoA5Mdlzfvkphr1VZ4u6c5zcEyJv1/BZWrrk27NlQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=a1KW1w1NP0SkuWG0/jC6/7GF6KsOUR1Jc9ooB1NefXY+vLKECYAtkuw/lpJC1kBLr
	 qWxlsEiZ6K/7HM4e3ba/q9fc3PZUw66mBnkKFiyc+gGc5sSExWeJn2JYWO5mEwM0p1
	 2kxoJHO8KuKScsV1zlm4CWaB2w98Dj4tjt5f7gxEtRebBvi7k96l+HKCa1DNOiDVOB
	 H2U2gQu9yrg42zKjkFMr35ODOv7oYVk+v0azDNLAfQf75g9AmJmW9D2Ry0vrVVxKbg
	 xpF+Ear+zia6bwdUAxT2XTjULZDAXj0GRRGhlFDc+DSPpMzCfLJ9jBPaRJB00CIVd/
	 pvONpBxcBy2pw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e62834439so7314027e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 00:13:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXH3d9gDS//f9Msq7DVs9y9o4UnvSmSFB6nLINNah7/M20nAs9nliUtdSXucPdJxJFEQ6w0SjTuimuCNY5snP+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw66T/ydArdVA2qhuza7Ssliw5IhUfBgOkBUkuJNr6Skhfmu9N8
	nJ4k779NcGA+eCFXSbcXFWYnAjvUqrdy4lD3OL13D73otuLYbefpdXSwprcYDUxt9dF0C0MB7h8
	ldcOuwcsPQ6S8HBJbnrqMnTtkan4ZFVUDgNzGN/9UsQ==
X-Received: by 2002:a05:6512:4010:b0:59b:6d12:6bd7 with SMTP id
 2adb3069b0e04-5a0ed99fae0mr4879974e87.40.1772007227325; Wed, 25 Feb 2026
 00:13:47 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:13:46 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 00:13:46 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-4-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-4-wenst@chromium.org>
Date: Wed, 25 Feb 2026 00:13:46 -0800
X-Gmail-Original-Message-ID: <CAMRc=MdH0_JVRLXtc8fWkdr1qMBERCc-kjp58nbyzhVuMnCgrQ@mail.gmail.com>
X-Gm-Features: AaiRm52AQF02eEDkSj7XKJdKxnJmEy0P3IRZQuLjGUKE0XqIuxZJ88cZvI40wzQ
Message-ID: <CAMRc=MdH0_JVRLXtc8fWkdr1qMBERCc-kjp58nbyzhVuMnCgrQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] PCI: mediatek-gen3: Split out device power helpers
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 25 Feb 2026 08:22:20 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> Split out existing code that deals with device power sequencing into
> into helpers to allow cleaning up the error paths and integrating the
> new PCI pwrctrl API,
>
> This change is purely code movement.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

