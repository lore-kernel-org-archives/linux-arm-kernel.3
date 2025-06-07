Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5214C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 02:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CefWT92/pn4Htibx0ZcptASfFKnZ0vYyjmoTK16U7Y=; b=IvJQzg1aJuVV3PAdgE3XYaTCZD
	u/v03bsyH0s3f96kl12HZpp/DoUJUozsYD4CQ6sNXcMrGQRWJH9eV0jj+soyuBFR+rL7QWcGw2Rf4
	OOHHZQEABYE+mRg9J2BQSIcLjGSVJiWFhRiNxrkh7gnW2cutC7QCq1UWh+HWUNGVlo0Q3vYlwmcd7
	zrsCie2IKW2t+aNyF+yPVW/h49xXed4SZQubukZjIM1TSsAV/YyqqsHwcBFBoT3+G8+RkNEER9HoD
	NDPLC4jJkGI37LsJPwXIjyDv087GoqD6izQeCNz2hVmMbnZNKh6AoOoGCqagT+OScLl9ZKBH8PGn5
	klLRho/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNjYF-00000001GCB-3iHg;
	Sat, 07 Jun 2025 02:44:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNjW7-00000001FuM-3MbJ;
	Sat, 07 Jun 2025 02:42:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a5096158dcso2303864f8f.1;
        Fri, 06 Jun 2025 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749264161; x=1749868961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CefWT92/pn4Htibx0ZcptASfFKnZ0vYyjmoTK16U7Y=;
        b=e9cXOC/6kAUPdXZ9IMjcx3ttLTpL16V7OlCjLBkZZRuxQtS2yAajqVQjGtDP7GyhZ/
         xzYA/JAzDq3LLpbARNKjJurshL9r1r+G0jJypGV56UYAxCCqNp9X2uaFFwv5q5L53SYz
         qTdHHaSAoJjba4cfnhakmbvU1a4kpXyuKCF2frjUMqAOL6NW1o6Zbwxo2bjONPE9dHJu
         kN9L89VSnFu+x/f58ShF8HxC30SRhbi/ZVG7IbJgmVyt6IUZ25fHHzyyPm5hzoDgwPnI
         qySz7B57bMIBXWW1WSCgIT+lhkX+xg4rG2dQOe2tHUaNbWxQBb7qxz4oyXAeRvIuRJsv
         bVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749264161; x=1749868961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CefWT92/pn4Htibx0ZcptASfFKnZ0vYyjmoTK16U7Y=;
        b=dbMTpna4FRKbTGpbWeasmcwYpx1wfu3+JYQaURBZNhx2N/5u7T2bxu/psAnXYFiiEp
         oUZRMKZPNuez0nQso6RSMcPzXsBhziFRME6358sNzlx1RIYaeQC46sk/LJEo0j5OHPZc
         gEfo4Ff4PehSg0vZ66uflU38KbN/uPwrE92lWcSLIkXhkEb9VA7+ynGapiNzuux80ZEY
         YfgHZ1QcNEhjYoYXl0aBvy3eP/r1M1Wd1SoVXikceI2q2dD0YBmtgUPPYSiaNl2jHZYP
         6W6TpIxveHKF2LZ2CUrF5hkV17YU++OZ9XVay9+IAS+LRPFyLwl6in9LxiJE6HtbPjM2
         AeNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSa1T0kxz7NGcHwy5xRNwJcSX1rX35GUvaysp2kUX/M6ZIMUTpc8FDYIYNeTrWdiLlbr0rXFhmmiUXBKwKwBA=@lists.infradead.org, AJvYcCW8x31tCgkJeb8oQpLRDXnx6G0xeADOf2IaU726F6i5qRH42L4CcvKRzEup1ATLw1IJRXfBfUkmQEIHincjVtNy@lists.infradead.org
X-Gm-Message-State: AOJu0YwtLmDvxBa1t2KxM/U4Jwpmu37u/PIXxbXFqD3dQvGEjdgsohIT
	SXI2oOvgRzAOexzEwBNvWHrYPzP5stkTp9cx25hLRn/4ksuJzeM1UIvhqqQEPRdowYMqiaSX7SO
	FonCjOy2Sh/JQZssuDuW/U5DcN4ZMop0=
X-Gm-Gg: ASbGncv6m0qEa3YbSCMUASbVbZR7pPtcOtNt2QqLKyfLXlSAZmKBy+acuaF/cwfwl3k
	AS2KQTav+oJs7q3G3nrNLTqNDUFgC6TrMeQbnOFMy38syIS+neCyNMJqTEkqBuGqaqugUBhRw/s
	aR85B2ixJ7JQJ/22fLmFdlEnRSYvuwzh/FPTj4OstCVtCrb/URTMm0Ime1dlwzQBgQXJ9amf2Gp
	g==
X-Google-Smtp-Source: AGHT+IGcEKkjQjtCriThcqw8RLc0+PuS0lf/rMkncpVF4bkgmYsjA2mOt2fM8jKZfdbuxZZdA2tkH6bTKQQT9twpEKA=
X-Received: by 2002:a05:6000:2dc9:b0:3a4:cfbf:519b with SMTP id
 ffacd0b85a97d-3a531ce09e4mr4689955f8f.44.1749264161453; Fri, 06 Jun 2025
 19:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com> <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
 <CABjd4Yyw5xStJYU5c5snUGpBjEYL8=qoj=bWYLnuzSWzr8shaA@mail.gmail.com> <CABjd4YxfG3WZxRL3ihQLtdVdp_3Hq=TKKrZJktJ_C5i+xCM2Ag@mail.gmail.com>
In-Reply-To: <CABjd4YxfG3WZxRL3ihQLtdVdp_3Hq=TKKrZJktJ_C5i+xCM2Ag@mail.gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 6 Jun 2025 21:42:29 -0500
X-Gm-Features: AX0GCFsASrqjmeogHKGqU5uJIqowBQVTy5uoU6CN1I531lsTS5iFJUyKloDL55Q
Message-ID: <CALWfF7KS_kGK-RQVfcPMkvo_2PD_w992Z9hka_3=b=Cgnto6Lw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_194243_842346_32CBCD89 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, Jun 5, 2025 at 9:14=E2=80=AFAM Alexey Charkov <alchark@gmail.com> w=
rote:
>
> On Thu, Jun 5, 2025 at 10:32=E2=80=AFAM Alexey Charkov <alchark@gmail.com=
> wrote:
> >
> > On Thu, Jun 5, 2025 at 6:43=E2=80=AFAM Jimmy Hon <honyuenkwun@gmail.com=
> wrote:
> > >
> > > >
> > > > +&sdio {
> > > > +       bus-width =3D <4>;
> > > > +       cap-sdio-irq;
> > > > +       disable-wp;
> > > > +       keep-power-in-suspend;
> > > > +       mmc-pwrseq =3D <&sdio_pwrseq>;
> > > > +       no-sd;
> > > > +       no-mmc;
> > > > +       non-removable;
> > > > +       sd-uhs-sdr50;
> > > > +       sd-uhs-sdr104;
> > > > +       vmmc-supply =3D <&vcc_3v3_s3>;
> > > > +       vqmmc-supply =3D <&vcc_1v8_s3>;
> > > > +       wakeup-source;
> > > > +       status =3D "okay";
> > > > +};
> > >
> > > When you enable the sdio node on your v1.2 board with the broadcom
> > > chip (using SYN43752), does the btsdio.ko bind to the device and
> > > create an extra rfkill bluetooth node?
> >
> > Good question, I didn't have it enabled in my build:
> >
> > # CONFIG_BT_HCIBTSDIO is not set
> >
> > Let me add it and report back.
>
> So I've rebuilt it with btsdio.ko module enabled. As I boot the
> system, WiFi (via SDIO) and Bluetooth (via UART) drivers get probed
> and load their respective firmwares. btsdio.ko doesn't get
> auto-loaded. If I load it manually after booting, it doesn't bind to
> anything and doesn't create any extra rfkill nodes.
>
> Is there anything else I need to check or look out for?
>
> Best regards,
> Alexey

That should be all you need to check. I guess they stopped incorrectly
advertising SDIO_DEVICE_CLASS for bluetooth.
Jimmy

