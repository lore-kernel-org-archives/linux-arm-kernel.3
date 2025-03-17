Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7277C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP5ZjBbMb4rni+tuZHNcnT/n1v2QA3RZnXHRssAeFG0=; b=O5mQzKtJ6iWN4hAEVvQjnde2JF
	2vGHDCALVfVdNO4RDX0HXxRPvceyYngp/VLw0GtZPaAv1JgAI66oVzRgWFc6Crmu4xak4yS8tdwei
	Za9W4nB+fXTN3pP3jQ2nnk/EFd4dQm79nq3b4S4n1pgclYr+AtkIGYe//JIoiFVoVv81JILSwm6V1
	sQxaQSiask3aGgUmRW67k7mTUUerAhRGxazPhgdc/cQBKEIL0HAyA9XQNnBSReW7bYT/alNz93plY
	kFRhTN6UddRjiH4ZuFbrsGC9pFtPuUy5E9Ed5sx8drcdvl5cqkCHqfCv4VRQrTV3FXhXL7cEBfA95
	53ik9rBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5Ng-00000001fBR-02lM;
	Mon, 17 Mar 2025 07:59:28 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5M0-00000001epw-0ZRl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 07:57:45 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-72a145521d6so2968586a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742198262; x=1742803062; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PP5ZjBbMb4rni+tuZHNcnT/n1v2QA3RZnXHRssAeFG0=;
        b=GIdKu7Nv5Gmimj2/Mkb+6cxZ0sUEked3BDx8RuVr5JzYAkpCvkXSYDvmCzvl/a0Dt5
         FeAk2KP0EASkC0976f2uxQenC3aYBtZMr+u7UePM5NsNkMf9WspjwS6zg4i3iuVL5BqK
         LbVBfngWMJNDjTfy8MaMFNewgElTSxdd3proZ2lWcuN23BbFOOPFIm8nsW909V4h0zD2
         kuxOcaOMk2SYCfTeJgZBVb/prWKrqsgmFziVuFzWiJd4GSZ4+dF1QLoNS5ZMEUFyXf8V
         5PYSryrCf+40oY0DR8xxXV4D2vEnux3uyd6kfld1zWYUgdCe42H0Piyga897ngn8/Lh9
         GfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742198262; x=1742803062;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PP5ZjBbMb4rni+tuZHNcnT/n1v2QA3RZnXHRssAeFG0=;
        b=UvTLuHepxnFL7Lr9EZWjDuhjUzQLotHUYvkWxvE15GSQs3lpKzE7aarSi2qIp0zRl2
         N24wlTQRFnfXYW/KsImoQLNady7JxhNlC7PVYVNj8xSDAWVaOeEiNg31v3WkSJ3AmGKg
         F8l6MkpNcGTrZb634wv/nwolNmh9OxX9me3racggxcOB4EJUP8SDaximsZN+xDm2Z36G
         CSRogOoDr20nY1oyhKJsancUxCPv7j/mUXE/nglSU+NC9Xsb82cn7/NizgGHZW0YFYeO
         iIaWFyLTRWWBb4KOvNLtOXXA2TpC2QEvDOKjKMSuj3XYqLmsGaUZ5hhNXXg+o/ntL1A5
         42aA==
X-Forwarded-Encrypted: i=1; AJvYcCWLtTc1F5ec9k7z2cQn49UT5MasRPbBBD8JZZbE/Rnt/xBjU1GunWS8NoRo9iO4B8YXQHpc3WnSDv+57XKpNvuw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1D35+jSaKi6R0lnq0Oc5FQGe8q7MGKla8fEzskJPjTDWyUFDO
	UtKhj1djTH5255Ek51ikM6FmsQDQwddQ+Gd/EeYNBt2WCEXg5r/bGSiSMIrPVMVF+GTKMV7dUFL
	DmyB8V/diV2M5vO+aLuVCImWljbvSfRXDcPKvqg==
X-Gm-Gg: ASbGncuQ9vJ6xs4ZTSL9vgOn3eLqCQOjqQKATcjDDcvoxgJeRoHLxknLKHoiKBxZmpy
	GnPDOFJKdUFWqQjjRib4kSDjuHz8D2IZ34EkDaVyCFNocLfBiACzq7oVE0T0oPvL8Q/UW+/CQTN
	frQPcT9uNuQ/66qxFJtgqMveQu3odp
X-Google-Smtp-Source: AGHT+IFXhiV5/jjRM3lIL1BjJLxFk/oc1h/PBdMxRCXg6fQlEslHNKm2pE2ASn+LBLRiqcHrD7Lf49zKnfDqLjjJWKY=
X-Received: by 2002:a05:6830:441f:b0:72b:782a:56d7 with SMTP id
 46e09a7af769-72bbc5222a2mr5673623a34.23.1742198260554; Mon, 17 Mar 2025
 00:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org> <0d7a8cad-adfc-4cac-bcc6-65d1f9c86b43@acm.org>
In-Reply-To: <0d7a8cad-adfc-4cac-bcc6-65d1f9c86b43@acm.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 17 Mar 2025 07:57:30 +0000
X-Gm-Features: AQ5f1JrHrLaWNOaDw_CRYMU3X3v2oxo4LzPuW31oNjLmnPoqXZ9Expwo9ns7s28
Message-ID: <CADrjBPrU1Prw9NmWrVQff+X6VTY4PXEr_BH2Z0DuAr=uiaOsGQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add dma-coherent for gs101 UFS dt node
To: Bart Van Assche <bvanassche@acm.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_005744_204383_0191F781 
X-CRM114-Status: GOOD (  15.34  )
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

Thanks for the review.

On Fri, 14 Mar 2025 at 16:01, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 3/14/25 8:38 AM, Peter Griffin wrote:
> > ufs-exynos driver enables the shareability option for gs101 which
> > means the descriptors need to be allocated as cacheable.
>
> Shouldn't that code be modified such that the shareability option is
> only set if the dma-coherent property is present in the device tree?

Yes, I plan to add an extra patch that does what you describe into the
v2 of the UFS fixes series [1] likely later today.

I sent this out separately for Krzysztof's Exynos DT tree in the hope
he will pick it up in the next -rc as this patch fixes how the driver
is configured today, and is also still the configuration we want once
the driver changes land. I should have made that a bit clearer in the
cover letter :)

Thanks,

Peter

[1] https://lore.kernel.org/linux-scsi/20250226220414.343659-1-peter.griffin@linaro.org/

