Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F72C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=; b=GJLTAWt/LSq2qGp5dBBaD11YOb
	SJNDgJnW3ZT3P4O4WuEOaH0MEZR+hrjXvOWlemlKFoeHzqC8g13j2gkphcgwzFdJm0lUF3omPDRQb
	BQOHPMx7QOG2PSvNuzQqsvFuJmVCU37y/nHG+HYef4+eEBA15mBE8ZDJlCwyMNpcow5+CTsTtc3aH
	OsYnaGN5RF1lfFylUN9tD/7uGWqdigox7zuv/MDyQyTB//dw2TB5BK9eOwJTMZy0h4WHs05mv7h6/
	G10ErOxP3lrIgxVNI5BtuhPRsJiTwYyUpPE9QGhyOEDkdOIB/vFB2hyU336SKhLPkewVetNpTx32Z
	Jw+ErewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L2E-00000005Cop-1Rrq;
	Tue, 15 Sep 2026 04:44:46 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L2B-00000005Co7-23yB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 04:44:44 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa663c2so412514266b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789447482; cv=none;
        d=google.com; s=arc-20260327;
        b=Fe00Pk+7Fe4lMtV3cnWWPOMqr1MaD41LBm/0mGcSqvOYfIyz7NwKvRuzQJL1pvAQ84
         g9hiC6jSfGQzKfmILl68aasXNIg4EJYWbr0PaE+bKhFHt5WwQhLzE0DOY9fh8OnrmWee
         96k39q0GvzPQFsAQ+/XAzk5O9aAfF6+dkXtgy5wNGyckolMLgZDOOuZHVJccokHEcd5V
         wNyX1weKDCEFs1sFyx0uIndYIxyuHiloccaAzN7p3dayzRGwL/VC+uVCwABGV1BWjb4r
         v+trczQCxi/dx5P7a7yzxzp4R4TAdqzsjjMzfyRGpxnqPYMQ3NlWZzuoVwO5krkuMfy3
         VM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        fh=ctDZfpqJpGsclvoTkcTN3shNRM//K3aZuqwje0eCUm4=;
        b=sjJ9pH57lztFfqF5f9gQkXNVQVcb1JbKp5dvMhhXUpu+v70WvoFMungkiNYhgJG6LV
         jAcGMaI2rP/pr591eu9BZcZLXvFOJJyOocGTjmU8T36ySyDEJQ46B8+3zVto9E8hwdUa
         umvWdMxuSzq88zUurgTwmClPwzVw/nl/xXvOdvoHYVKbb2K3qdeq3pwe+ZN472/yszBi
         aN2kcD8/XOpMkgFscVHug+KMDfCYbzYv9hP0zmSIKMiARwrxFuvaDnk/4bdInvoub2/7
         WaGuRrfmu4Tz/Ay6AhIdoTeTtZ4mAvYf/se+v429kB4cESUe0V19UQq0prq+1Sb+xGBD
         +pwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447482; x=1790052282; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        b=njUE5Qqe3Zwpe4gYM0KnRN4hU3p1fcalp+oYE+VOdDBov8JKdxIM5cq6Vibc72jHC+
         1s5yC4r++kxEYC8dtGjxrhyrJpUcILfKpNUWK8WdpxRdqQObBDbRZIr5/Cl0uykxnkhz
         NDPFvkfWxqLs1iuvfb/5gcWCkC0AKUuRMuvbw8NcTFt4rIdyxg8yHUHSR0KtxIgzxhFn
         HyzOHuRDufUBrU55FGYCZWMcqjJ+aKZOIEOqidQGhYes9ioTTiQYzGxSoVo3ILrB7SMC
         WONkRPzYvRijCKm+t/iztCA1Ciiz2WK9E6ErIUFKwFPsSqS9g5XUgRNTrGyNqgrw/xAQ
         smCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447482; x=1790052282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OuAEPVCCSuU2/NfeOknYQEwV5oigOdlMWrN/kmgtJS8=;
        b=zN6mHUDnqLFx0v2ThhNi+JlQq8HgtdTRDrecTGQQfOpTxmtXlPcWyMVZQDBDFNmP9D
         N+B/JjXwjRLCU7Qii4HYmXKLiTWTHYBwjVfM+u7cM9On/bSbHYCH4+PCPdzzGaCvqi9m
         JdNIvABenfp5oGA/epcAOparyO9dPI+8QuSN5nftehgpsP8e5Hmdu+ZjtnemvtsHA76S
         lceq8gBCB7oNKv3WzJmWOOCqU6qDxh/k4OlsrJBWk/i8lvOoxpTnLmSopD3fVmZ9KhDf
         NOBAWoepzQ/lwL3EnArByNGshoUIMOqdbb2pkxZ9u+UCcSmmDOV9LZMDcOzYfOdIRFM0
         02VA==
X-Forwarded-Encrypted: i=1; AKwUvBxKE2rBehXW8dzJWnJs3xaN+HNsAbG/DNlQCQ7A4QhZIKDH0fwg4hEGDMamZ6ebLJMTp9TLcpuOeBEr6hCEov2+@lists.infradead.org
X-Gm-Message-State: AFuF++lH11FSAk8Llqzv7kbz5BHWr1+S0b6CaK7HY6PZbkKSpHH3Q995
	/pyqvYZFmPr2Kxp1S7FDISmcSYydZcNfzqQelTCTOZG/Y8jZ/N59fRlIL/quGMfKLyqgiRuqh7e
	8D2HTo7O63g/TVIxqqKHrgkIyBVrdxus=
X-Gm-Gg: AYBFou2uF2U559P1FMyGo5TLbpOjKXOj2eIOQ7j4MrI3t4JY2onVsfURIPIO6j99xuC
	BGzd0mtINS0toBH1tDZ+gw7vdCZDH545uwggEBSkswezedJ4d33uiSOSmxXD3peVNA2iqBU3BeT
	xvTss/68ZwOGh/DMvy1OiV2BRUtk4QqUA4oqWUWtjK4W9iQtl+b8pXsoV45f/B3Dl1h6hh1FS34
	u52enMLse3F51CX9Rq2LbZcgWIhqn4RS7WUsvu8GiF5TLXG0aQ44BkVFYmEa+YH5vNLroz/mZ3n
	cI+iDFSBggy/S7bIxwrqOnmzHq0xUV7wRB0Bz/FQavRGR3i1M2N8dA==
X-Received: by 2002:a17:907:3e07:b0:c25:8c05:902f with SMTP id
 a640c23a62f3a-c29b86b7559mr700042866b.13.1789447481668; Mon, 14 Sep 2026
 21:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260913145905.9404-1-linux.amoon@gmail.com> <20260913145905.9404-9-linux.amoon@gmail.com>
 <8d547f65-a260-4b8b-80e4-4695d4422497@kernel.org>
In-Reply-To: <8d547f65-a260-4b8b-80e4-4695d4422497@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 15 Sep 2026 10:14:25 +0530
X-Gm-Features: AcwNN1UE0alxnYRR3jtRD2u3dEd1ayGXdU2bhjTuNvTUC-ZbJLtS9W7X8MU3WLY
Message-ID: <CANAwSgTEJf0gYQZKPQm+=90S5i2dRpJzOLv0gkyt+4ZmUTWZ=g@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] thermal/drivers/exynos: Add missing drvdata
 assignment in Exynos TMU probe
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_214443_548326_AE579CE4 
X-CRM114-Status: GOOD (  18.23  )
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

Hi Krzysztof,

Thanks for your review comments.
On Mon, 14 Sept 2026 at 12:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/09/2026 16:58, Anand Moon wrote:
> > Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
> > ensuring that the driver data is properly registered and accessible
> > throughout the lifecycle of the device.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> This is somehow confusing or completely incorrect code.
>
> Either this was needed by the driver or not. If it was, then why no bug
> is being described? If this was not needed, then you are doing no-op
> changes.
>
I was looking into other SoCs that use this while debugging the
device-tree mapping issue,
so I initially tried adding it. If it is not required, I will drop this change.
>
>
> Best regards,
> Krzysztof

Thanks
-Anand

