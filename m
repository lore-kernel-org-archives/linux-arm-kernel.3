Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24251CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rux3uIEwt0djKEKrlDMK9wf/Q+VyRMin5568hbjdQuQ=; b=reV6qsETnZrbytdL9UO0M1a2tL
	lkC56NiZ7Xha+HxwSxs2BFwHyJb3WJ57XRlCsmpXucFVSXQneiqaNmo9/W/H6S1wKEr+peDIlOE3C
	EyYEPDAOVFD/N+Sz4pUNeJyTWQge8/efs1OaoU4X9jQsCz4+k5L3LnmT3jH1W7vdkGDd708qcTI/C
	IsG73UUocYBQWCj8gBua8BF7ufkLm0itkHf2PiYeT8muyO2Cv5drDnCLco8IpzBHmpXKBsQjo66Nl
	KzQ4Y4+ZpleFts5/S8Gs3iYgSR+O/3VJoy4xm29kq///Y0GvelGYO69L9IseNRuUimpGhdgb9klwg
	g/lfA/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4sc-00000009wQv-1sCk;
	Fri, 12 Sep 2025 14:36:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4sZ-00000009wOu-338l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:36:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45decc9e83dso12662915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757687758; x=1758292558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rux3uIEwt0djKEKrlDMK9wf/Q+VyRMin5568hbjdQuQ=;
        b=BXFjtNhVfMn1hInY6YvsUL7W+e1O6QPenCX2XxJx9DVzKkBvaqR5oH5FmfFP+na7M1
         MokL25MPWg66FzTrGFl1PPS9LbsqVk1pOy2ngHPWWUHCmP4tSTIg6+GqZm66UyRQBAmG
         9RYoDtO/jxk/vpr2tB79irpIBwZugdkKZ7+qVjdZ1ElGC6FuuSzBATjLzId0SXkFwOdR
         jcuYVKtHLPP9/4/9o/Bsald8aiattkcNjipwGXDvhZMZwPcpuqpr89yzh9ORpRzKJmhR
         6F9dBMhRdlj1tjAfSsuivuNYjiX81vUcJVHt7BgGp/GZCyvWdZRGSESEhiciLjLRlxv4
         Wb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687758; x=1758292558;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rux3uIEwt0djKEKrlDMK9wf/Q+VyRMin5568hbjdQuQ=;
        b=ZEtWx9Y1Cz4diTvJPfOiIGC1/okr+So3R+A5D1WOzlb2WJ+Jsf/cpjOi9KVVH6nbgG
         au5pAUpR9Mdiy6LsD6Pahap5Fe133B981MqZrU2eU9vhhG1EYtT2KeM1TFScUA6ueqFm
         H+Sea2/k4rdcgtVk1QYzvDPlMyFVHTP9s8TieceXbQ7+NUS/gDJYzdUOLd2TpE5T42NO
         DPnpTQx8IFdMaFdSiLy8RnxnTy832K8RKB6KbqSHEMjHz33/9VnmxSWyGA/fb7rgtE/S
         IgJPVWSTDIylT2KThCBasj6hcvBBWJE0cHOSQBgPctXhGsH/LdVat5TlotGNBFOqZVHI
         KdBA==
X-Forwarded-Encrypted: i=1; AJvYcCVoXqbf7znDMd+vKGYMIXBb+IEpP/bQJwlPmXDXX52P/3VXxzqPG3mWOAPs3CMxM1qkOHeksd4gcKGuC82mm1YR@lists.infradead.org
X-Gm-Message-State: AOJu0YzlbS3y/reknheptE9fFHTaBn0DBXcTVCf8AtefVhVuG1XIZtkg
	DToQSQwPCrl+9cxNEnMJ1kc4qt/lodpXAsG92kI3TCL3ctuMbhdC4gBW6yhAphkEvXE=
X-Gm-Gg: ASbGncsFG7OTaCZxTj11ZCo8r0EIe8irDFGnTe1DvERILm6tyiTS5Hlw+XgnCWpy/xl
	uMyVIJ6l5y7inq1JUcDk/4VWq5j71W8d2BZ6fWisjBS89EQVnm6UecHzAQy4FXODPWgMcT25VYs
	iCNjLsp5gRV3KVtWj8xKUpJx2dccCV+6ebKjxOYbBTzB6iDpj78uGy8IGpCIHIUxFO8GjFMJP76
	HrJRhNDgOi80O0uO+IsPilcv2Jcxr2uhv4HFu8rWjSMj0ZelOMR/UfDJEapfDL16qXA5ssKHFCJ
	BcaUoiSCx9S5cKhJER+LeVIu1H+ey7IMGhpxIV4mN+1yICaVk9DOP7Qpe9aCWWAKew5otG1fCS4
	a+MVC0punaF+PBc1MmiqKg5qsw0+KD7sHnQ==
X-Google-Smtp-Source: AGHT+IH67tRYiTRZR0HlitAXkPqySgTj0c7ALy1itAhNYgQLFYvaB09Ls5bZvLW8qeoaRRjgwtFi6g==
X-Received: by 2002:a05:6000:2408:b0:3b8:d360:336f with SMTP id ffacd0b85a97d-3e7658c1c6emr3279136f8f.28.1757687757628;
        Fri, 12 Sep 2025 07:35:57 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607ccf9esm6659591f8f.40.2025.09.12.07.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:35:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: frank.li@nxp.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250804131450.3918846-1-laurentiu.palcu@oss.nxp.com>
References: <20250804131450.3918846-1-laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 0/2] clk: imx95-blk-ctl: Fix runtime PM issues
Message-Id: <175768775587.453341.7630569911585966967.b4-ty@linaro.org>
Date: Fri, 12 Sep 2025 17:35:55 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_073559_810715_803EDE50 
X-CRM114-Status: GOOD (  10.40  )
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


On Mon, 04 Aug 2025 16:14:48 +0300, Laurentiu Palcu wrote:
> These 2 patches belonged to a larger patch-set I sent a couple of weeks
> ago([1]) but I decided to break that set into smaller sets, where
> possible, as they will be easier to respin, to address any issues, and
> will probably be merged faster than the other one.
> 
> Also, I addressed all the reviewers' comments received previously for
> these patches.
> 
> [...]

Applied, thanks!

[1/2] clk: imx95-blk-ctl: Save platform data in imx95_blk_ctl structure
      commit: aa1735d72bc085c4d107fb2017c597f83bb9490c
[2/2] clk: imx95-blk-ctl: Save/restore registers when RPM routines are called
      commit: 14be8b7b6cbc0a072c749e46e28d66e0ea6d0857

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


