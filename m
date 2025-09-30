Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123DBCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxPeSWWtp7yCi/S8nYJQqvkOJ/VCWtVtMBJciycxULY=; b=TIkVR6byisPzl1orxIAjA07pzJ
	QenKosC+be1SnQAXGrRJan4BQM2a/U3Xm18Ppbqt1as422RYLfKoHHN+qAmlg2xdrMbVW+7IDPTJB
	YKK37g89cmdDaOoM0b5XnJu+KygcDiZJr/zYduu+xvzcla1HgZzlqmBgX4ZWi3W+2UyAaKuVCUkeB
	rtg7vf8HTqeRnDW05tVP4uLaCZTxym0L1oXk7zGJyP7Auz8Njh9TJfBoZ3JaDwbtkIyR/zMEnU+9J
	gfGKnezVFqcr2IHgJfn/pLBhUg79d65I5dvkWktIN+tCk3/VRmvHNZIE55fSdl4cNxGrNiqDb2iP7
	OjdU9d1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZSX-00000005GWO-1FQr;
	Tue, 30 Sep 2025 12:27:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZSU-00000005GSb-36en
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:27:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-57b7c83cc78so5651570e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235273; x=1759840073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxPeSWWtp7yCi/S8nYJQqvkOJ/VCWtVtMBJciycxULY=;
        b=kHMXLj3LWvDXHdk7ofCidwDttPJWTTscuWjREAQcqAcufM5F0TgZe8SGs4o3B0gd11
         5D2PjK5Dxsvh84ubkLGhh7RZU3N0kOP+tdTN2IDYu8eZudslQpdCRceOP9qe7saAG07+
         cS/ynxQUkrlmHDZiKkodqbhEV1R/vdEcEHfVUzxgd5c+vxBUnKe0MOgxFYNUf0nhr6fS
         XOVozt3hfamFc7GvczeTC8+sivOMCC+Wo/CI50Wq7ZyDrBtVEF4Zns1sS0i5ENhF1svK
         aP02ws/MkabxuYweskqWVM49t0B3ftnulQ/EbfIdVRhXCPwrFEDr3h99CJwRBrqlFto4
         7CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235273; x=1759840073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxPeSWWtp7yCi/S8nYJQqvkOJ/VCWtVtMBJciycxULY=;
        b=PBSnxLM+xc14wYNZNYADkHzjdieXkt8Ml/naU9HJjIMxReJ6We75falW2Cv/wP36u9
         f4MpiuZSqw2l+8CUTfqC4ZtO+c2EAk2nZoqJL3BKP51n5IBC1qiApPjlQ9R6aM4FbBRI
         RuEixsrqmhTSbGUQxueca9kM3NiDSQpm1SyBRf85evg/Tq4U9i1ccLELIyLTCRBp2aPL
         xo+URqwBDjGjEANVIk7mJfMb+6wDoDa1n0HNPRQHxbIiSNrYgYJ0dFQ52s+1GlkZpI2l
         sa5wwwNSHn7N74PX9zX+cqd7yyOMD1vUR6/CDncn9JV47CIZGug3F9WtQuaFabaj8AqU
         5mrg==
X-Forwarded-Encrypted: i=1; AJvYcCUsxroJAiyYPAyMIgChYEyZ6rDMZN7NQ6iKdMmU9NAMJI2X95RlVKV8Ib59vaw+oVpQSe8elOsTtfAGt1tl+5Uw@lists.infradead.org
X-Gm-Message-State: AOJu0YxUWJViu+kwfiOl6wDijPO9+dsnZGTVdQoeycaQXvt2IdYziGR+
	qYDMPyuNS/zLnd/6y7WWxwiNRQ7G5TEB7Bl7WXr+pr+mTKtOe6YoOkhx02wyyaIUviaiGR45vkj
	PfTofPeLr0kYJ0rxA3ui3KtK2VVSJva8dlfNkzVetLA==
X-Gm-Gg: ASbGnctDQ4mEDUKaodkrEEoNefA6amtliAn0Oj1kw9v2brSENeHiS/ogk+I/70obdmz
	ovVYboW3pZ01yDXHOC2P+4vTjHa+4cCzv10onp/ti0Lg2QkhZD3UgC8Phpk2QS/keJe+Yk18/xM
	s2jxpWUxMK5GfRcgvu8OTIaozG9EF0+mjVlgq+jnfdS7k+pdDRIim4hKQe6T0pmMzPqoOx0MOkV
	Hr9makjJJ/v627gUCZKP6Yn7NME4CX28kWO/72uiA==
X-Google-Smtp-Source: AGHT+IFl2fD15jSgCh2pFv3aJNRspWrtZV7i7NaeRsIsPQWf104POXmKeFKk8H4hPkV5j7/R8Qw1pfLGsDY+0vg+EMY=
X-Received: by 2002:a05:6512:3989:b0:57a:9595:5b24 with SMTP id
 2adb3069b0e04-5897c90fe5fmr1410763e87.7.1759235272628; Tue, 30 Sep 2025
 05:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250902222334.105236-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20250902222334.105236-1-jihed.chaibi.dev@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:27:41 +0200
X-Gm-Features: AS18NWBwwrrU2OE7TyXGE3VY4x57V1Hc3ztY6uepvj1pSge5poxYVFnZvxeYHBU
Message-ID: <CACRpkdYRD0oNi+tp6bwhUymX+ayDjcSVs4Cyo61uy=tW4Xtajw@mail.gmail.com>
Subject: Re: [PATCH] ARM: configs: u8500: Set NFC_SHDLC as built-in
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: linux@armlinux.org.uk, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_052754_789058_C0788862 
X-CRM114-Status: GOOD (  11.10  )
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

On Wed, Sep 3, 2025 at 12:23=E2=80=AFAM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:

> The CONFIG_NFC_SHDLC=3Dm setting in u8500_defconfig causes a Kconfig
> warning because the NFC_SHDLC symbol does not support being built
> as a module.
>
> Change the selection from 'm' to 'y' to build the driver in-kernel.
>
> Fixes: 344cad0660ea0 ("ARM: configs: Update U8500 defconfig")
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Patch applied and forwarded to the ARM SoC tree.

Yours,
Linus Walleij

