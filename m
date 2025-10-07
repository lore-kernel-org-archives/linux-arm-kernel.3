Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A341CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoeUTdyH6Ho2hK/WV0Pq7ReoILwQzxKPA2QdB9ZFVa0=; b=kxhN4XYsSsHWqhxmWNaXe054Wn
	/rdzLtgcH90B88KbIEzL1TocliKSKuxSyvDcpYBOM+7ljn+xJDKIa11R7gPu118HA9GOugLTmQZdM
	QorNq7RcfSel9rWTeZbvpVHEAb1kBu8DkoktCwhRqb2y3hHiw3KsJ47PpehU/uG4hdjfY+v3PLDdQ
	YNNriXxy7HWLDPRXJGRoM3N6dBCL8TbiBtVZbBFIRgyVzlAaZSjbW1XH1heTpYMef/ieKn8swoFWq
	3os2ckjlHkaIaX/BB2hoWFuBfg+KmCHIO5dJr+9q3HsAHzZMQ3YUCc7eywGe7vGiOHgEKcq3WUfkt
	u/cq0hQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C2W-00000002WgL-0UBi;
	Tue, 07 Oct 2025 18:03:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6C2T-00000002WfZ-1cuO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 18:03:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-27eceb38eb1so69074685ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759860232; x=1760465032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoeUTdyH6Ho2hK/WV0Pq7ReoILwQzxKPA2QdB9ZFVa0=;
        b=jE4GfCQex0TVw7HC7joTATx4tNw95S2Gv2SjEwBgE7TYhuRONfwNHiRwyoVCN//18N
         c094YQf8NtCEgVnr5V5tYUQKUfbJ6rIv7AGL5iOFL5ETviUWrl6v4fxUuYD0axvNKoT2
         bTA4sAzldRv2pw1hKmqh5KJMhCL9HHUrdQ1x+VCG7F1RrxipT73Fo76cwQw1WLDznnS0
         huIZ5Nk72jCDsmehMEAzEg2AEZmlIhC640esSPDL8yGFHoGTH9OPf7ax96b6xXVNpctD
         KgeJRvUTdArNrQIjwnunwYFFCDZ9RCXPHEOY/7VCEH3XgYA4opBFOPpm0n90IC/NXdFb
         QEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860232; x=1760465032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoeUTdyH6Ho2hK/WV0Pq7ReoILwQzxKPA2QdB9ZFVa0=;
        b=cSCrKUPvotZsQRwl3o5xPhzRwn05xRCMitzRTclDDl/a8/waW9BTXfaRkFWmt/HP/F
         wzZJN/s69MBhgULszX37IHOjH9u9Rj5pCyGGZwWOcLRyi0mIIVnL448zkRne6YCxHEVn
         wcl4C5v7mFfgKAuKYZ7zDielaxFreRMt6QYIbc7yrF6zrt+FFi4BHvM7aVtHexVQ4KfF
         ZKH29E059Wmx1+015Z2Git+A5gRPX2ZoKStI29Vb3YlGzppZ8Ws4BTiEQKn5oV8c7Ofg
         FnZ73xkyoLpl2UwjSEMZEJVnviCc+suikcsuHkKowUDtye5sYlbdmM60h7Ro+At/YDwH
         IorA==
X-Forwarded-Encrypted: i=1; AJvYcCXd5XTAkbXcHcFi1YNtyJOD/g1k19bHyR92buEsDcMXbflkgs2NeREpUdUqZSq7d7a5LLt8sdZExXWv43iy26qC@lists.infradead.org
X-Gm-Message-State: AOJu0YwMg5JH2fcpE+qHdPNW6tGX7Xig/APGj0ZBfeCFwelzEthmeXOW
	GlSlnw1hA8kchBITstfngcJIU4v6X4N0ivW+RhgNtzIIKA9CzmNU++3Ip2BKrPs9GZ/1D/OYUmq
	h3F+rmwm3GyBFv+Gr/fLXo/x079dlNk4U75i9QQsD
X-Gm-Gg: ASbGncu7KZ9DkGZBYOsqeI2ArvSy6uBcS4vli9tSXH5UehAEBGaZuArYQ3d4CY7ZxfH
	RQLcQ/VMfl277wdJPzTtZ0WVEjQ0vQB+vc/N/IHMN8iewoyk+YAc+Bz7RoMQiymliz1tKJ7GMUG
	/75jKGtCP++0bTgZedteWpOve6OaJGCjF7zcbfUlBuv2W2UBanboGazhKHsqluXEy1gdOz+skA7
	v8al4h46DFuheBKG6Pedo4yc5/eiG70JakMZjhd9Ar4RQyNU3rJGgRSv2R1wdew4YB0CsmVUPvu
	1jvsuyNWEqVeZw==
X-Google-Smtp-Source: AGHT+IErqs+kJVv5rsWGTN2Z0xZ0ickiFqF1IQ4SpRF/lYWHEWgJPEacLea7fTefk87mdvoXJ1AdDn7lRgB9V20xPD0=
X-Received: by 2002:a17:902:d58d:b0:266:cb8c:523 with SMTP id
 d9443c01a7336-290273ffe89mr5647285ad.48.1759860231518; Tue, 07 Oct 2025
 11:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <36068ca3-912e-4e71-b688-8689ead8194b@kernel.org>
In-Reply-To: <36068ca3-912e-4e71-b688-8689ead8194b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:03:15 -0700
X-Gm-Features: AS18NWA8U90B63ffP5jXdkUD5e6eOAqItmxz5SXEaQputDmKkvJD4mEmS6I0ARg
Message-ID: <CA+zupgyLx8q23b-ecrLhYAU27HV_ZFMiH9XR81Q2MKRmMwpcNw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Add Google Tensor SoC USB support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_110353_433520_3E50B676 
X-CRM114-Status: GOOD (  18.04  )
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

On Mon, Oct 6, 2025 at 6:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > This series introduces support for the USB controller and PHY found on
> > Google Tensor SoCs (G5 and newer). This includes:
> >
> > 1.  DWC3 Glue Driver: A new glue layer for the Synopsys DesignWare USB =
3.0
> >     controller (DWC3) as integrated into Google Tensor SoCs, including
> >     hibernation support.
> > 2.  DWC3 DT Bindings: Device Tree binding documentation for the Google
> >     Tensor SoC DWC3 controller.
> > 3.  USB PHY Driver: A new driver for the Google Tensor SoC USB PHY,
> >     initially supporting high-speed operations.
> > 4.  USB PHY DT Bindings: Device Tree binding documentation for the Goog=
le
> >     Tensor SoC USB PHY.
>
> This is useless message in the cover letter. We see what patches do from
> the patches.
>
> What you are supposed to explain here and in the bindings patches, is
> why we want this driver and what is Tensor SoC, considering we already
> have one Tensor SoC... IOW, explain everything which is not obvious -
> and duplicating SoCs with some generic name is for sure not obvious.
>
> Best regards,
> Krzysztof

Thanks for the review. Will remove the redundant info and ensure the next
cover letter provides the necessary context on the Google Tensor G5 SoC
this series intends to support.

Regards,
Roy Luo

