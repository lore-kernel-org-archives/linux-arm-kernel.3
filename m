Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED8C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMhvnmgBPAEdbdjur1Y5DwggiFxhAVP9SEx72Ii5xFE=; b=r7XID6Gnwk2am7e9YMznCI8+a/
	GLldjMchH7HLJZiy5mIvbDi/o37ddwHOJZcJ+HL2VNWyVW2sbh10heKP+o7tz5lnvWHZrvIcMXRwa
	FOImpHXXn7L2w+TB3lmgTR6Pinu5DSC0CnTQwdc7Zq9Nxbx6N32ep4Im5M45r6qam744GLr6MefvG
	SarcTktspS+6+rOUz8aTTXzsV11KSrXMyPgqDbkrsi2CZVyWYC1Bu1VpukQuisIPFIvrT/qAH0v3U
	EYmYcxZNyN50VISZXxs28ZbQk6RBaTMiaEFm8ZVwwuE/yvDSdcUOpd7Gr2Neb4qEdbnjiMNPuCrnS
	dAv5h4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhNM-00000005Ytq-0ZTe;
	Tue, 15 Jul 2025 15:15:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfo0-00000005E7p-1Yhs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 98D79A570D1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 13:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBA9C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752586487;
	bh=+5fnVYi8jGUiwllSXfccJ9ZG874S/+1gUDYyvoKFb0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Om3RG4Gp7iPuBcFfzV0TJrXSvVZ1ziTXeDG8NIjHzeKf0fzxyzu5ewG1JJjYIBDEh
	 oMSlbAknTx0ATbzw8IpDlNBIrVW1lnP16fyzsfYVc8m2i8t74qls7qpTRI/P7OaYVc
	 KXCsvanIabf18oIFopxNwYFsSaT8eOo7AiatP31ifLhGzXVqrVk9e5PUixsZudYIJ4
	 XQkjYpDTnIyf1Tnn8whwjtnj+T5Ygx5q19IlMqCmDHati5kjPJYO+Mk2NdzGwhLMqq
	 wqNzqzPR/BjhVlVfVFNVVKBr1g+0D7TLomCWzuYZ79x3izp2CvaFAvbhU3NSfX5CSV
	 m+shVTHiN8DMg==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adfb562266cso946940066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 06:34:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMIH70KqFp1/1wiOwsb5HseegzD/5eefLITArOljfRUJyPd7hIwQRVRCpZF6ZfChFAIw0D34LE2sxhsfZ7JUeF@lists.infradead.org
X-Gm-Message-State: AOJu0YwaWBs+6oOdfzqQjvWPrBB6L2eown96Nt9EuTTDF/dX7Aeh2Ug+
	L4lNv7CX9uBNQr8BMfvJ6kDr4/Xo4RAxEebYqiW5pOXWPlAtHQYebytAzpKSFXwb0CvhsH5zuD+
	0Ptq9VcQNAhZ3qgLSUWSjuIMmaCtjUQ==
X-Google-Smtp-Source: AGHT+IGRu2JZfsUA5LKiQLqa/UEZNxt2u/LBgONat/gO2EH38uOyxF+eGpc7ilCTo4wwSiYodRP/HpFAhZMX9LDqasw=
X-Received: by 2002:a17:907:9686:b0:ae0:dcd5:ea75 with SMTP id
 a640c23a62f3a-ae9b948923cmr254110266b.5.1752586485564; Tue, 15 Jul 2025
 06:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250715122643.137027-1-tzimmermann@suse.de> <20250715122643.137027-14-tzimmermann@suse.de>
In-Reply-To: <20250715122643.137027-14-tzimmermann@suse.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 08:34:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKSjQy8CVohbVL50kn=o_kPVUsAUFjYvNC3mpcA7pm_Og@mail.gmail.com>
X-Gm-Features: Ac12FXymC2XmqYlRUlcYFWrwlgiDEh1VRFeVs1QRm6fJt93kN_btbEF-gtsl3Qo
Message-ID: <CAL_JsqKSjQy8CVohbVL50kn=o_kPVUsAUFjYvNC3mpcA7pm_Og@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] backlight: rave-sp: Include <linux/of.h> and <linux/mod_devicetable.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
	neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
	simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io, 
	neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr, 
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_063448_479858_04B96FB2 
X-CRM114-Status: GOOD (  10.53  )
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

On Tue, Jul 15, 2025 at 7:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Include <linux/of.h> to declare struct device_node and include
> <linux/mod_devicetable.h> to declare struct of_device_id. Avoids
> dependency on backlight header to include it.

struct device_node should be opaque...

        /*
         * If there is a phandle pointing to the device node we can
         * assume that another device will manage the status changes.
         * If not we make sure the backlight is in a consistent state.
         */
        if (!dev->of_node->phandle)
                backlight_update_status(bd);

Well, that is ugly. IMO, we should just drop the check. A DT built
with "-@" option will have phandle set, so that's not a reliable test.

Rob

