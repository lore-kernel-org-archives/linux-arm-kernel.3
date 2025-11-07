Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60CECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=; b=YeoQ/qIUOLs+VeUyUEqOXa/qsI
	wxSRG5Dh91nA5TEkiJambFXvX6/nxhv4Lkxk08xbRLYuiUNsXnh3rmHTgjyWcr9DiQuiz5d8Z81f+
	7UQ9gt1s1sfNSfF8j1WiU9RLiuk/fG1nRsafGmhiNhgchNWd+Lo63vbhT34iuRjLDB4YBUqIGDe9G
	F10IQwycGi2miRSiq+Tss1bbPSmyV7cdr1YAuQNFHRwl/rzpAGCmAtZLJddY37KscVgAynHTzvKyf
	wkSXn5xBx2sRpKlBV2PnCe8v8y3O0ZyJdxQE4NOfzsHdgdTVmJqWssSn0KZIH0UqZbZvZ4YxAkPh4
	fbBkHJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHIX-0000000GooM-3dFM;
	Fri, 07 Nov 2025 07:54:17 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHIV-0000000Gonz-18Wd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:54:16 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7ade456b6abso406551b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 23:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762502054; x=1763106854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
        b=XyzW9vg43VJueF+mC25+BVzcxBWTst4yEL2IxfKcwQsuLb0Y2kHL0jaDmo0gy1jdZS
         Cep9RrCf9LQ8tSaN5HC9vudNZ/Ueh9ilQIwGbZXjqldbywhs71m9O7n0RJlA8xuE0KmK
         eFlfK3enRrhAcle6xhh5xIA5jr6ge5Lz+h+1BTXg7uTjwjCrG/zM70p/dITxVzSmazji
         JgWgxrnNOnVJGn3aNVzpmwnodxccqom6stKELYRGTeOwjGnYYinaYJ/ClYJ6kK+czGFv
         4RJ+aG9TmOWUeVdHPAopr0Hb6pzoPGtpuiPqJby2SxfoaiwkBcFyBPJV63780qCy88vZ
         9nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502054; x=1763106854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hht2khT+M/paWxzoLF4glbCzxzDG6WfHD/Jh8JDmVm8=;
        b=BVtXEGq6ELOGnsdLDU6/U58waSX5p+caQMnnKw2tFpmsqKPfL2bImAQ4ZHjFSAmqdb
         xcXI31AJvmXcf5/swFY30jm2XIxGFrhtaEgWByEYcjnq6mFUDpEjz7gBiq1cT9mJV28W
         2YRq6KOdW/ZRiRDj4oF9pLaTYQdHgxFT50sUvkQ6muCezTax2nhRleqfTYWpi7wskkg2
         m0sZtkHXtVc018jdjD1/hB14NfDfUR9IYlI/KfzTwSiY9YVwnzNlRikWpW7jsrzp8Gnt
         7AftHqwhrdDCW0j99pgtsIxm+RrPSScJzI9wEyAPpxCp0ZGBf3ZpOGlp8x7O2xe99i+S
         iD0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsjetnfJzw9hF3gPbixsQmgbJSR3TYUVQztI4cPzWR8ZtMK9OkYQYaYfiyyjKy32y3Z3s9qeRg9lPNwAsK0Bns@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5wa0R8YlITtDbIlTL6IeaupkDOMXfvpqPxA82zKxCyL6SINFa
	s50Xpq7E+B1iKpeHt3My6CNwfFf4rmFI9/ocQ2Skv0NoexoDKZTcqVOAokYXpY7s8o7W/JT1d8Z
	AfEg/RJ7pfD7LPimozjVvngIHThIh6QU=
X-Gm-Gg: ASbGncvTRXsEU9gdXSixhSLsQAGFsCUMfprIa5MsOL95TRi2qsWEWWzCLF36bAjbe0z
	8dmxmKJ/AjY65ABsHlIDDFUZTYDYqKjLfu7ceSI8CFezReM0dVkvpdLK/kC0mQO/p2L99x4txSa
	EV0rncD0+V8k7GbI/kKPm5KpllZVFHaPxTwgXAMvo3HAS5FYooeu/uXrSQGvPkg5AbXiNQwn8QW
	bKPwl6kp5A0voFRC0i1n65iTKL83yZJzTMv0iutCOK51zOlLuozUoYdqA==
X-Google-Smtp-Source: AGHT+IHL0mKF9QQYctg7K2SDNNvhbCsy5jQOa37KMcgcdBvRiNDOg88v8nsypzK+cTSQzbs7MXiMalVatyoMujxAM6A=
X-Received: by 2002:a05:6a20:914f:b0:334:8e2e:2c55 with SMTP id
 adf61e73a8af0-35228572ba4mr3084918637.18.1762502054278; Thu, 06 Nov 2025
 23:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com> <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-3-758b2e547a55@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 7 Nov 2025 09:56:40 +0200
X-Gm-Features: AWmQ_bldmBxOD-3eNLQss-begsdemT3T5zDmdImzkOkUALSL6znnWYvoGByIzsQ
Message-ID: <CAEnQRZB4szsOxtP2QmRdpwR+ZJ+8ydGg8hGAo5DqHC=tw23M8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_235415_332967_B8C730FC 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 31, 2025 at 4:28=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
>
> Allow each platform to provide its own prepare operations, preparing
> for i.MX95 LMM and CPU ops support.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

