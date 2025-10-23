Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD6ECCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 02:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R427Dmu3YODNR2POQX9bpNnQmIqw5THl/CmnS0STWbw=; b=cAfBulw+k5nsSGRvdLMqNFBU+B
	jArMiiqTLR7w2LGocuVkoxKGXo26PhQi8FjPH5k8I9YRQHo/ICZEXAYoapKj+2BdfsElWBfVHUwHz
	4uX72I5tAyXDLQCfcpZG1jPL6Xsg0708HhwS5LkHAV2WqPc38aKmmwRElMkwtfEfKf7yHKvM+PWof
	LKdvsG9QqyQaen2pvEfU+CwraQn2NxWozDLFgFaxGiRewfHvAwDgle2PDnrO51z8hwjGUd+zCSaMP
	Rwpq1BSbTQOS9bqHgrCvt9jg3+UWguKLtgcMMUGzRajvn+7/2Tv4Wig2c/igls/Zt1HV7U21VgrJP
	XjcYOgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBkww-00000004owJ-3oGb;
	Thu, 23 Oct 2025 02:21:12 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBkwr-00000004ovq-1g72
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 02:21:09 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-3c99d6ff0deso107854fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 19:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1761186064; x=1761790864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R427Dmu3YODNR2POQX9bpNnQmIqw5THl/CmnS0STWbw=;
        b=evjhr/PcH5QHpFXnkpQKWOcflLM1cIDrmJVhCRB1ZIQ9I7HD4W4P5OE0nZpAMyaLZL
         TaiATdQdIfZOZcCHMrEOSuvDXlzPHcq9HsVt/g1HOuoTkkZIBIgqGhLnDEhX6jftXWC5
         5F3V6A0GmSnrEX4YVpAriaZJWJhhi5eoCN+Oc2Ax/GJxuit27KHMjeWg7h+usp/5uQ2u
         o0mZ0Wo3IbywvgjqkfPIIp9t8ph24hP8Job8XbuBUVib6V4XuW9hysBjweXHVBvrWt1G
         xWpvb1fP+1DZt3zRV6yfs7DzpbmPgEiCF4jXoxINXs2yofwz+AFXCSP2rfVJ8iEdK9u1
         8gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761186064; x=1761790864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R427Dmu3YODNR2POQX9bpNnQmIqw5THl/CmnS0STWbw=;
        b=aoemujkGCV5D5L4OsqA/E7sFwkSJgjoKLoRVoQSmZOv4mF5F8sNIl1Owm0xorZcWnT
         GD3RI1/koqcnUEB610TYCsmOqBBmL9Hp7N7Ncdnl+6zke275JD+OwbohZmH2nujLAr/V
         fdiUqsf0bTzB8gvVdzwiF5eOjIl2/uw4lVUc5PfLqqEAsWBtejuLZLX2rtNsOxkDaJZQ
         YcpL3RSfYDd1mGBtkQVCMqUQR8aLJKeaO8aMIw9c61inZyBIRQQLCVjiqm3fdA9Y1yr2
         kK2iLzmrJSZShaxVSHifBnfIL448VTktuE9yNd03i4lBfwg/sQz9yuVY7Zc8TSVovP14
         LuXA==
X-Forwarded-Encrypted: i=1; AJvYcCUcCG98sULsP98EQVs9Iz2dNfjb1YBhcqL9Ay8BVnjTznkH/7ScUEwewG66vy4kiGwgxD1xGmrzG6LvdKSRNtJW@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGAmumJeZB5SJQ/JoNWZmgCfFhBCAsKPAwyhjzL/OG08u57FJ
	YT/0HUJOBzL2JIzKDIlU4VMuMh7O2Cle1D76ITSpQoenYqnFMvTlwpe7Irq03Hkt5c3z5iq8GZE
	fhNe10GzkqUci3a0Q5f16SkjyYMrHjcXz2FQKqsOU
X-Gm-Gg: ASbGncupgivtmJlol3XwHH9mYzxEPRtgcTu1N3aXxubSmDBhzRUuSoljeJ42EkRM9Js
	/iAe6M/Z0SmMtwQtCzUjN06OH1z+YGfq54tHYdXtTjm5Q69XGCAiuex8hQotzYGeASAly2oNXgA
	ve64RmzYjyHb8MFxiG+8EGsjh+wQ2NZo0o0f1mDANhV1v756TO0l5wW0PdbKcSiEVxdn4Xhm6D7
	aFiNr+bvymeap4BaprgyE8vD5XSBPulc5an+o794rwdRAcWA6ydAzzwr+aS88Yqsb5OinU6loIt
	9ZFj7Eflos/t66tSAkGowNMQKkgigQ==
X-Google-Smtp-Source: AGHT+IHmRLKymahTzphWXAcebUY/vioCOyMVmnPrpkx+yuxscWkWBl0sW3ZAInJO76yoYP2ATwjD1Umq93FfkvRAowM=
X-Received: by 2002:a05:6870:648f:b0:341:33fb:81fe with SMTP id
 586e51a60fabf-3cd88b3151emr2212186fac.4.1761186064007; Wed, 22 Oct 2025
 19:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <0f006338-e69b-4b3f-b91f-0cc683544011@kernel.org>
 <20251022114527.618908-1-adriana@arista.com> <20251022201953.GA206947-robh@kernel.org>
In-Reply-To: <20251022201953.GA206947-robh@kernel.org>
From: Adriana Nicolae <adriana@arista.com>
Date: Thu, 23 Oct 2025 05:20:53 +0300
X-Gm-Features: AS18NWAnX3tdmQK4mY34lhn-vtbSOeSxTP9A7wJ8Ju2u0pZ_JzhEiwf9-6ikOXI
Message-ID: <CAERbo5z6BzHqQxXdxPxmxE_eDR7GGGbt3A8kB0gQiWFBE-28Ug@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] DMI: Scan for DMI table from DTS info
To: Rob Herring <robh@kernel.org>
Cc: krzk@kernel.org, jdelvare@suse.com, frowand.list@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vasilykh@arista.com, 
	arm.ebbr-discuss@arm.com, boot-architecture@lists.linaro.org, 
	linux-efi@vger.kernel.org, uefi-discuss@lists.uefi.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_192105_642623_F1D87501 
X-CRM114-Status: GOOD (  21.32  )
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

On Wed, Oct 22, 2025 at 11:19=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Oct 22, 2025 at 04:45:25AM -0700, adriana wrote:
> > Some bootloaders like U-boot, particularly for the ARM architecture,
> > provide SMBIOS/DMI tables at a specific memory address. However, these
> > systems often do not boot using a full UEFI environment, which means th=
e
> > kernel's standard EFI DMI scanner cannot find these tables.
>
> I thought u-boot is a pretty complete UEFI implementation now. If
> there's standard way for UEFI to provide this, then that's what we
> should be using. I know supporting this has been discussed in context of
> EBBR spec, but no one involved in that has been CC'ed here.

Regarding the use of UEFI, the non UEFI boot is used on Broadcom iProc whic=
h
boots initially into a Hardware Security Module which validates U-boot and =
then
loads it. This specific path does not utilize U-Boot's UEFI
implementation or the
standard UEFI boot services to pass tables like SMBIOS.

Because there's no UEFI configuration table available in this boot mode, we=
 need
an alternative mechanism to pass the SMBIOS table address to the kernel. Th=
e
/chosen node seemed like the most straightforward way for the bootloader to
communicate this non-discoverable information.

I wasn't aware of the EBBR discussions covering this. I've added the
boot-architecture and arm.ebbr-discuss lists to the Cc. If there's a prefer=
red
EBBR-compliant way to handle this for non-UEFI boots, I'm happy to adapt
the approach.

>
> > This series adds support for the kernel to find these tables by
> > reading properties from the Device Tree /chosen node. The bootloader
> > can specify the physical addresses using "linux,smbios-table" and
> > "linux,smbios3-table".
>
> /chosen node entries go in chosen.yaml schema in dtschema repository.
> But first, I need to see some agreement this is how we want to support
> this.
>
> Rob

Adriana

