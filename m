Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=; b=puNgdE0oybV8MeYra/51sWSFet
	uB2WjJdwbf4tyHPPU5jVJn98jYKyUMzH12W3QmWJDyeI4KOtb5wgXkC/lUhT+/u0tj9o/UqzavGm6
	GLOFUzvxET5Z7FEfsyHfan8bZqD6sMWuneVgk4H3mdCETghK5P7Q3zsSMMED0yItng1bFNsSbp4vR
	O5NmiGjywtIueyFe+U9p2WCbaU5dE+sqpRsXjmK3NKElzzB5mf8tkewNghCq8hoQYvAv57bLror6d
	LUNl/XlVutgSNPR2MRxdonJjAb9XDsUdAkOCm4q7VORg1sdGqzpSpmUVftqqJ8PdTAMtNSsLIR8Lz
	b0RTHNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdoY-000000074nc-2mvr;
	Fri, 03 Jul 2026 13:20:18 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdoV-000000074m1-1GyF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:20:17 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-664c535f1a0so762246d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084814; cv=none;
        d=google.com; s=arc-20260327;
        b=n2bk7FrrXsZptWqKSRIYydbJTdkWtw2//3rOG+ESdos9gOZIFlmzVNwPTsk7nKq1Ly
         cRKDVNApjMPiI5f6MZA6QkIwK/XBQpFXve6ySEJyvzHgRblfr4/Pqkr/JUHoUh3GoHYl
         3ZWZMDB1WKQQdX52Zxyn37iZ447E5F6xokGxERaCzT7xt7o/YPV6RZuBA4V4HeSmX2jg
         Yir2nMUoTYO0UoNEy1fzlBb0zazzrwtCCRMH3zONoPlZnsQk4V7vTLlRKdk3kYaQ/U2r
         bkWwETkuFQpruyM4D9btav3fAtk+BCWt6mEzUMXWDlTVmTdi0kJ5kWkNzzLrTdzVXEhj
         Y+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        fh=IZSLploOhsNUi/3y0azWO+eqXQcglnjGsQdWWVQyOxE=;
        b=JB8bX86H3F0JNKNZfMA/gxUR3CX/OR4PifQA9jeZddf3xmRRGS2pPSoocOqAf3ATVu
         Dw6M33ryl8DFTpTJQEV63m/uGqJZzzI3uIPAgVUlY97l7Ww6J40wkhOjwb9xzApMwBpy
         UEIVgOl/JTp5QET/3khq9rS1aMvI3dLdmE5+pMELl06rnyiZEAkaChmnw/B6Wv7pUTmT
         yHINwdkVsl2cWxwIZeDBut3d0hzUVhVI0h7Xt3Bf7SU6zzgFr3EXqNVgQqpG6MdguU8h
         WOwKiFODoPGwSz1RnsvQsp9kkAEXt/qsbykryhHHqxNr0au1pMyNc/ZUZkeixJjv0BzE
         FVEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084814; x=1783689614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=CU3TRvWzriCBbB+COt1gipzShuDEORoHjHMQ4RPxSAu0gCNES1Wm9R0QZwLw48/nIk
         8jhMdPL0/LzKU46KH60Wuhxa3I10f6a0PQ2wTbDMkEeIOUhWvujnOVO8QvgLaOeKLeLn
         3koRRMUN6rPmj/v8FCf/Zuk5UA6vwMDyuO7JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084814; x=1783689614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=FCm4/11eR74Kpe3K8cmbUtA94ql/p5Z88ULx6QktLFT+bwjsJGxU0ovtKieUUUvd3/
         yXjrYUo0e+S2KJPsgcrm5fygz52Anxai0ioroKQ/k48IiNf+BpbpM1JScSI/YVDsydrU
         1SbeNXFay/1QF6TnYOm0K0DqdqKKDdH4EXGzgmi49rxkQ+kqo//sPPxj4fFWXEWofFFm
         YBlfa+blPJ8Whvr5YxqW7K5Djk0QFVIp9imQgYBcfX48DBWr3bPbtA3yCq+ZCBanKQ8d
         sgps9Wd/uI13NdE1MjIpBtekHi4Ws3QC6a3L3dq73PWhbJi36aRmCk3vE5ksuAcvvfiW
         O4Vw==
X-Forwarded-Encrypted: i=1; AHgh+RozoL7Xxau17Rb2lj0CpImqegmFDwT+whQy3JRPQLWtmJsSlzBUlnmqtzhPu8k4+76JEstbgEAmf6Z/db6gYIu4@lists.infradead.org
X-Gm-Message-State: AOJu0YzuReOAlMx6Yq9C/xEkJ3GTynOl3xS5j97S/3Zsz2fzB974pJkc
	iZqCfwoMRCPX9kU26Yi8TTXwxwyfwHrMmGEgimAOmEtsIRNPrJbqW0ktZuGULInjPsSFfIzX50j
	ZhvF4QoW7XGy2Wg2exJdVxD/xLjONtKeizzXU6myx
X-Gm-Gg: AfdE7clX78NgSOGpbK/t//Mpp1r/nqUdbPGx9jUd53aoH6CKmnDknCQd2kSczm9qFMi
	7MwtgJ6BUs+zE3wMWxCuVzWTbc13DuVMXTyPA/uE+kLgiBhdKghCXoGp7BimqQcDNi9WvBNuGFj
	CQ8A84ArodX+iB2iAUiFkCO5PAOTqt7jPq4nPXv+iZwVfLwxkOZ5wJWoBKROoSELgdpyCyEjb+e
	wvJ2C+/zElubcfUiVbyg2DonvZtBQo+CX9BCRlcJoB4u7icJ0Q1JaX3ej+evcrpYkCtN3P6Mr/y
	YWnWtvdPwW/2Mj7D8hADOQr0/Vg=
X-Received: by 2002:a05:690e:418a:b0:664:ae6a:e9a5 with SMTP id
 956f58d0204a3-66521d54781mr9923763d50.75.1783084814296; Fri, 03 Jul 2026
 06:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
 <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com> <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:20:03 +0800
X-Gm-Features: AVVi8Ccxmi-jSFxGKDTUuToCDHyjKIoBrT_lajnjop8tp06Df09KPZI8Is_qoIU
Message-ID: <CAGXv+5GH3navtUC-V--dJOEjqiDtOauXf_TKxzdQ_T+bK_v9gA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_062015_350716_01038FFD 
X-CRM114-Status: GOOD (  18.79  )
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

On Fri, Jul 3, 2026 at 9:16=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 14:58:56 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >>
> >> So this is only needed to not have to track the state in a separate fi=
eld?
> >
> > Correct. Reading the field is not the problem. Updating it is, as the
> > fields are packed bitfields, and Sashiko suggested that locking would
> > be needed, though it may have been for the peer port, which has since
> > been removed.
> >
>
> I'm not sure if it is. The user controlls the handle. We could argue, it'=
s up
> to them to provide synchroniztion. We only assign the target and pwrseq f=
ields
> once in pwrseq_match_device() and only change the powered_on field later =
with
> pwrseq_power_on/off(). Unless the user does something weird, we should be
> alright. Maybe a small note in the kernel doc would be in order.

I was refering to the status bitfields in |struct usb_port|. As you already
explained I think the pwrseq stuff is fine.


ChenYu

