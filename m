Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949E2C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OJlnvMBtd1Qdxb8D4i8PT0Scjad8idgDm1fH/AmWto=; b=xKDBSfaQsXwFGVhtmpT51GehOF
	Xhk2/++OBCRCGBjFA6LH2Fj1xi33WO/aaI8pVHVL3glp+IslzvdqRir6H8F8VSyHUWXAthh9PcvMe
	JaUlvKgEq8z5SdMuqKJHjTN7DvTzf/N4Gz8T4Mq37JLCyJ5pvu6f1iNKHqWo+aCfz76O+XE+j17Li
	VGGlFboczma1c9YybYn/lwYyBITWxXUOfqTj5kcPGG9QqzmZaA5S6uvuuJQ/FB57PhJWEUj4zm/ET
	/KQ5fUaq35hsAklItUWiPEwwQlsSykJKVE/CR9y3tVlhv3vhDRweD3vzPkHvFCj3DQJzi3ZFvXANa
	MfNfQKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEUEV-00000009kLw-2gfD;
	Mon, 12 May 2025 14:34:19 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETua-00000009gTz-2qOt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:13:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so4136545a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747059223; x=1747664023; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2OJlnvMBtd1Qdxb8D4i8PT0Scjad8idgDm1fH/AmWto=;
        b=EJexbqLO8vCt33fTcZAmkQHuTBo+/oyC78k5QqDtrJRGbYrJvGIBBhb41dvUt2jqd2
         QQwqdV4cGeOX57sy2EF4M/1uAxIVERIKlPs8ekI1vq8jVH+SpBLcbTlTymOodwSzh2ZT
         Z4Jw4Pw+XAbAZWDQqqRjzJHvCSWyGYFJ/b0RL/tfJgCNZgfvvXnvGvf9cH5adaSPPj6t
         TZvNYk/pbmUGlzi7HPIbrZfqKgynveR3nSqehUEjZjg8rU5U816XaMKFpC0Gfa+GetLh
         Pm6mh1EFd/3kHIfHDDPkfYR5HotYwTbCGUC3R2UHX7Cxw3zOtwynPcVSFqWcBIkqCp+p
         4sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059223; x=1747664023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OJlnvMBtd1Qdxb8D4i8PT0Scjad8idgDm1fH/AmWto=;
        b=EuNyOGaCtPDMDOsL9ANXGEhkpkIib5Bvx4BY0jauQv3afb54FrFVfsBnYT5vG/2/jD
         pO4tyU61JE/qO359iVE1iwvv19a3/WyUPeilCT+lvKLsJXOUcODVcjV6po/yegXOOEDm
         3Yejxx5KitmygMepFx987gNAWfJ6YLqCfsn6jT2ah9/H+dNRmGdzvFoOL8IQe4RcmRti
         YKOayzG3S63pjy6k6WnsCdrhL1f40HNiOUSdkP0lFGDmvK3Qi7HA8wdn5N5BMz+0phV2
         abeLgWPj3jeZXAIfRoZdqCkGb/iCvdGGDHzuzIhywKOUzCzZVI29VFrAYwmnp0rmCdEC
         1axQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEqVyg8SsmROdXq+qm+bHv+u5+5Vyf0NcnxefVcxVFd/CDAylTkdsTO8RfTH0W1G3Wc96NtNYJT+aaR4e1rNqK@lists.infradead.org
X-Gm-Message-State: AOJu0YywS5nljnAwBF0eMKvItKc194+huvdAQTvzkgDXXA0RBTmk6NV1
	S4mvYkfcBr4uhBM+SnCamXofgySEWclxCwMgXLN03FOhLKh7lFnM
X-Gm-Gg: ASbGncsUHb6Xd66mkYU0gxoOOQ2isk18t3tUn7fjrYXK5P6hRF6FhQDjEGhGXvhIZgg
	gVKCht7yKgV5R+4SG5r2hoec+TrsOcdxMDUS0Uv9DSmB1uqnOPNZOyUvpqy0JdKh7OtdcmjNHDQ
	jrqYXpJtf/VqfVD/KVNI+zmbKjVQvNz6RVUtTBzw7L00XMKxqWvql/TP4+hlC6TbVAKAmz0KxlI
	s6K0mFL/kAP31ffAaqrL4Xd9uI8tlhYUTlsAyXuNgO5WQo2bNDexJMwTOw6ppoLkXPefDXLsfsM
	+XSpdibUx0HJ9xImnk2oxBHhZaOvua3nZ/5kyq/e8llu2uFeDw==
X-Google-Smtp-Source: AGHT+IH5gUoco7N8sKGHqASp+t6n1KYZvtsdLBTVel5nTdgyJkB/lYXE+HXry+XviOclf5k9LSJ5pA==
X-Received: by 2002:a17:90b:3e4e:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-30c3d62e4c5mr22364395a91.25.1747059223077;
        Mon, 12 May 2025 07:13:43 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm6650922a91.26.2025.05.12.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:13:42 -0700 (PDT)
Date: Mon, 12 May 2025 11:13:36 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250512141336.b72ga37qtlrvgaut@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb>
 <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <20250512045613.GB31197@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512045613.GB31197@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_071344_734097_6184B7E7 
X-CRM114-Status: GOOD (  19.37  )
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

Hi Peng,

On Mon, May 12, 2025 at 12:56:13PM +0800, Peng Fan wrote:
>
> Ulf's new API dev_pm_genpd_is_on needs to run after power domain attached.
>
> But if run after power domain attached, there is no API to know whether
> M4 is kicked by bootloader or now.
>
> Even imx_rproc_attach_pd has a check for single power domain, but I just
> give a look again on current i.MX8QM/QX, all are using two power domain
> entries.
>
> >
> >>
> >> In this way we don't need to export unnecessary firmware functions
> >> from firmware/imx/misc.c, as patch1/3 does.
>
>
> I think still need to export firmware API. My idea is
> 1. introduce a new firmware API and put under firmware/imx/power.c
> 2. Use this new firmware API in imx_rproc.c
> 3. Replace scu-pd.c to use this new firmware API.
>
> Or
> 1. Export the API in scu-pd.c
> 2. Use the API in imx_rproc.c
>
> With approach two, you need to handle them in three trees in one patchset:
> imx/pd/rproc.
>
> With approach one, you need to handle two trees in one patchset: imx/rproc tree,
> then after done, pd tree

This patch series is already implementing approach one, as I understand,
right?

The difference is I moved this API from drivers/pmdomain/imx/scu-pd.c to
firmware/imx/misc.c, and exported it there. But you think I should
create this new file firmware/imx/power.c and move the API from scu-pd.c
to power.c, is my understanding correct?

>
> Regards,
> Peng

Best Regards,
Hiago.

