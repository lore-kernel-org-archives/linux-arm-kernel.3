Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E70C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oC5qjHB1PX1QOUkEpX5gtofRWcRiWb2GfBc+5/XWrCM=; b=dLaxBj+Sb3XcPu0lgfNQERGtT9
	p8gmejEg62CKVxD8cmINckTwE4q98YQVbwTLuFEHCR0nq958wswLC8e5mPULI2J6dDOBkwzekQ9LJ
	iK9B9GHjlpaUyHX1VBDiBkmaAFBpEYyaWJIxbJOrpPfOeKpzyCNFY8v2hVOsKf5NBd0B5/S0BAVeS
	+4TcgAgis191SKQj9Mi3dn+icuHAQR0dT5K3SgdUHnSHrtKdGns2WHFWWCq0a+g8a055Xqqu3Eq9u
	ULN/4qDbzXEB7a7ILa0XpIkIbAvlffyaOWvsNuGRVMuf5S8f1oAqFdXYEzCmBl8+n3E55nqH0m3xp
	PvmtIpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6K-00000004Yy8-04Qc;
	Tue, 04 Mar 2025 12:10:20 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQbC-00000004Qiz-40ik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:38:12 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7271cc3d73eso2992010a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 03:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741088287; x=1741693087; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oC5qjHB1PX1QOUkEpX5gtofRWcRiWb2GfBc+5/XWrCM=;
        b=HQhyYbGicQktE0VvrhocUcWuDkjOcvY/lPVYZHsnDNa5Nlj5YPmgHj/nqa4Smccu05
         +lAN4nJEUDP65O1JZMa68uU6DUWvdvmXANeTCdzZTMmRhzdTYyfkW3danNaczaRQXa2v
         XfFJX2ynBq75TJnD/X+zN/c04kWM4/OYYhwBbZNXx5Sp4l5rb/Teex5tVURdO2ap2Pn8
         w+L8HVxPBFYH3MBI1zZ/7AVL8Vk73HURGQPNiodgnZYRWctaQQxRzZxeESHVBKyMn/dr
         KWfyHWynzkiqkgnwtiT6GayqARj1pT+Gj8ySuuuNqypkM809KTSM0zwtvLrO7evSJqMD
         ka0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088287; x=1741693087;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC5qjHB1PX1QOUkEpX5gtofRWcRiWb2GfBc+5/XWrCM=;
        b=GkPxyV3HviQiV43rmQKT66kc2vZ/yKqPhlTOoXaii5vUK20vdbsWxcpkYnPo65cJXr
         sKmvGQcbKqbCVSuzVSVryyDXGf/fxBlcxktuxLqaqzWu2GAF8t7gi58/W/GtE8ObjVrj
         eyKBJCD4SHr7l/RFM+s5k3+s7G1FiSXbs71kw26a/u+nWBVwCu1gYK/Xvozq9m4ojBhz
         5jeLZowEkyfnSf/fWXD1BGR0PEO29pW888+GfJ8pz1/GxvfMO49xLi0KU0NCEXlK2hRm
         AkPuFBeIcUONndBTuNoBoiaLIBQD6l5EmWJlD4OPSNS0ugY/Icv4K2Te1xQlou/Dg56b
         /Z1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIhlofbjW/hV2zeKPSoLHGaFhIUY2jFY9k43BkEv4GFVoXwDzCq2ikNEP6yjyXrALYC3MRy1q9904hEjWr7ulH@lists.infradead.org
X-Gm-Message-State: AOJu0YxSSCEPQfQIq3V7U7pdIGAcrzwInS867qUCxADTKjAzztrD/iB5
	DzjwM7Q7xXnHo7Z220feowR1hFq6FWHHVW4nu4XqxW1IGHPvuvmCuFfe5k802F9WmVpMqdbFzg/
	OgEjd37Lsp18owdOYbYVU1cc9a+oECi8dzGjR4A==
X-Gm-Gg: ASbGncusIsEsoNyiDF9zCXnXIAw/Str4uJn3NLBSLQrlDEAVGWarJU78jyJlguAhaUJ
	4QM6bceT725tko8fyhWkgMFT7ImLueGU9rTW2XioQBWjKj9jXIeNA8j5bPueN5nocX4C2H+TFhx
	gvSixLrB4yhOwXURMs2JnKNDPKf9k=
X-Google-Smtp-Source: AGHT+IEl29p/uRr2dkieWp0OTEK1kdeHqqHxSZa3QXSfzg/07iBAOnkwXHFw1v1HZhu1dFp6njIHzwHLg7pvbXeNaRU=
X-Received: by 2002:a05:6830:929:b0:727:f8f:b25 with SMTP id
 46e09a7af769-728b82f3176mr9942270a34.20.1741088287678; Tue, 04 Mar 2025
 03:38:07 -0800 (PST)
MIME-Version: 1.0
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-7-peter.griffin@linaro.org> <015ce85d-c62b-472c-8527-33217ad815eb@acm.org>
In-Reply-To: <015ce85d-c62b-472c-8527-33217ad815eb@acm.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Mar 2025 11:37:56 +0000
X-Gm-Features: AQ5f1JoxKZtvBwSf5o93rOZKsNyWnyc_-Mlje4_RgWAiq42ic3vdnFhmRmm7aMA
Message-ID: <CADrjBPrOTMPh2BfROdMnCrPWBaKw+uQ=jH3yYNZ-HEKEjNahSA@mail.gmail.com>
Subject: Re: [PATCH 6/6] scsi: ufs: exynos: put ufs device in reset on .exit()
 and .suspend()
To: Bart Van Assche <bvanassche@acm.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, krzk@kernel.org, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, ebiggers@kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_033811_000360_CE68AFBF 
X-CRM114-Status: GOOD (  13.02  )
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

Hi Bart,

Thanks for the review feedback.

On Fri, 28 Feb 2025 at 19:21, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/26/25 2:04 PM, Peter Griffin wrote:
> > GPIO_OUT[0] is connected to the reset pin of embedded UFS device.
> > Before powering off the phy assert the reset signal.
> Does the above apply to the GS implementation only or does it apply to
> all SoC's with an Exynos UFS host controller?

The reason I went with a generic approach (rather than adding another
SoC specific hook) was that exynos_ufs_dev_hw_reset() is already
called by all users of this driver. From that I concluded it is a
common register shared by all exynos implementations.

It is hard to be 100% sure though as I don't personally have any of
the other Exynos platforms supported by this driver to test on.
Another approach would be to add some more gs101 SoC specific hooks
for suspend() and exit() to exynos_ufs_drv_data() or another
EXYNOS_UFS_OPT_.

Thanks,

Peter

