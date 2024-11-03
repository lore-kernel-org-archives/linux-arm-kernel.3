Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49171E67816
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 01:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxp0UfmCL60Fd3m2qKbpdlJKEAofjpqB2oYq88MXn/0=; b=ccC7dhi+kZf5mD
	930MN6IFHR5AO5tj/yCvJdFoH4AHIXB1F8XCvv17yv5+sFXCLWjIlLKZaqo+CZbVhMQEULa8vMdIX
	AT82x4D+VgzZb75bK1apArPUFSxLNhaBdYeSiChtMmFhK6LLYsfCYPLUPCiCSSFszdLyxI18EulWX
	eBpG5ATvY/28Gdj7W2cIAvjiMNo0YDGCYyZjl+C3nsiaIfaZKxvv1GmzXpCI+X8QDzQiP9ly0Muk/
	SToCp6hxRIESSszvIB/33As6dAyp2G5gln8RNGtOCcJmyZdjgvunV0+1Kc40OBWPzR0ZMgeKB18JU
	2iWzxypnBGePsN+YiIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7PNw-0000000Akf6-1mZQ;
	Sun, 03 Nov 2024 01:26:32 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7PLs-0000000AkSm-1tJG;
	Sun, 03 Nov 2024 01:24:47 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5ebc0dbc566so1584540eaf.3;
        Sat, 02 Nov 2024 18:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730597063; x=1731201863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uxp0UfmCL60Fd3m2qKbpdlJKEAofjpqB2oYq88MXn/0=;
        b=mMeewqhp9ArtIHNAQQTuBGC8HLFEFEWH8Ci7j8maLPjbH2ZHMz3QtFfML/m10Ch0aO
         lOgrh7axzAG22Sd/YmJB/Oh4NlCwqMVWwavyyQYlBXbkq+errdVBKZwBKy3yrOf5tDt4
         Q8u33HF5ltwVHSfPChq2R8elrnITDsxx1xNSWrtwcO2M/nlGpYYlxNF+AdlzJ+sh97ji
         VGL9P8ziYKbU6KXDKw+bdwvT02m3WQK2tdDag8i2GpYdlsqIlkJgSS3PbJn2JaBz5u3s
         Kfgt2nprHOSEXywg6Wj/9ysYS1xy7BWFbtksXLgR5iwPB3jceWP9rdAFuaoqhxPzVKNa
         +DRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730597063; x=1731201863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxp0UfmCL60Fd3m2qKbpdlJKEAofjpqB2oYq88MXn/0=;
        b=rRTU1vqBn3j/dcP2gPo+Vf3liI/Svjgt9OcQLs9uFcWAL9W7v2oQlRjdmc9523hwa/
         5SMQg6pIAxiVb9SZ1hZwTEwekKxj4oR2CshfwEy5DUGdP7ZytiIGGfaVWpeluf2LAReF
         HUryJHoYG84Cl8kiHbAddumSLvrQmuGM5JAlLrKTzV3io3GdXahM19khcMwsM+krd8+y
         07fbbq0LeWOiLP//mfihTVIpjGEPTiHMumAD9ttDzGhJkY5JYObxLxH47tAnfopC3pnw
         UJyoQmlF43pWiT5lufQs1yA4bl5v+tYZDP8IcAslahceZrE3fTTarOoi/aSCHCQIntAc
         z3rw==
X-Forwarded-Encrypted: i=1; AJvYcCVsLBppiHamFVCpglpWvME4epxWbuI1PY18GlIVQIqbLejxzM0O8JZ2ZEkzxUqN8MaPgX5yt2o8KfmFq8tUbxei@lists.infradead.org, AJvYcCW2yvbC2jYghFh7PD35Es9NtP+MbZpxmc/Hjx+iz6r3MxhtVhcJwTNWB2AGfO+i53vpcZtChK0l8ZGkbhnu6P4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdvLu99z8G1bUDBb/gGp4YxOQLC17VJALs6KBd0osaS2eJWBtJ
	1zUoORtaogNQEJLvLGd9QOegXNIXDG13LorFMwuALjHeEbia7Ql5o38qXcnDT7xk4sq46QTK+KJ
	F6RWRCA3IR2Bk1BEv7BmCU1ioojE=
X-Google-Smtp-Source: AGHT+IHkA/uqbEuZYTnMFlg/isXw5fHn6zLD8qPicsNST9YfPw0g6N91zDHGprQP9QF/ZJdy0tOlrdnkRHVEpJ5uXro=
X-Received: by 2002:a05:6820:1885:b0:5ee:bb2:bdd4 with SMTP id
 006d021491bc7-5ee0bb2c243mr292681eaf.1.1730597062621; Sat, 02 Nov 2024
 18:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20241031130930.5583-1-jinjian.song@fibocom.com> <20241031170428.GA1249507@bhelgaas>
In-Reply-To: <20241031170428.GA1249507@bhelgaas>
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Sat, 2 Nov 2024 20:24:10 -0500
Message-ID: <CAHrUA36X2cMZ4WNtRO7NoLaupBNfecLLxDfSVZ4mZzbzHiDjRA@mail.gmail.com>
Subject: Re: [net-next v2] net: wwan: t7xx: reset device if suspend fails
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jinjian Song <jinjian.song@fibocom.com>, ryazanov.s.a@gmail.com, 
	chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com, 
	haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com, 
	ricardo.martinez@linux.intel.com, loic.poulain@linaro.org, 
	johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, angelogioacchino.delregno@collabora.com, 
	bhelgaas@google.com, corbet@lwn.net, danielwinkler@google.com, 
	korneld@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_182424_540314_2AE8D7CC 
X-CRM114-Status: GOOD (  51.72  )
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
Reply-To: linasvepstas@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Top-post reply.

What Bjorn says is exactly right. Just one clarifying remark: When PCI
error recovery was designed, it was envisioned for high-end,
high-availability servers so that they could reset a failing device
without forcing a reboot of the OS.  Concepts like suspend/resume did
not perturb even the unconscious sleep of the engineers. Thus,
stepping through error recovery during suspend would be novel,
untested, and perhaps prone to confusion. The error recovery procedure
is trying to reset the device into a fully-powered-on,
fully-functional and connected state. This might be problematic if the
suspend has already walked half-way through power-down. The fact that
error recovery might run a very long fraction of a second after the
error is detected further complicates things. The fact that error
recovery  usually has the driver fully reinitializing the device,
including reloading the firmware, could be a problem if the firmware
is not in RAM or is sitting on a suspended block device. So it all
could be an adventure.

As to testing: I asked one of the guys in the lab how he did it, and
he said he would brush a metal wire against the PCI pins. I winced.
But I guess it's cleaner than pouring coffee on it. Later we developed
a software tool to artificially inject errors.

--linas

On Fri, Nov 1, 2024 at 8:52=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Thu, Oct 31, 2024 at 09:09:30PM +0800, Jinjian Song wrote:
> > From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> > > On 29.10.2024 05:46, Jinjian Song wrote:
> > > > From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> > > > > On 22.10.2024 11:43, Jinjian Song wrote:
> > > > > > If driver fails to set the device to suspend, it means that the
> > > > > > device is abnormal. In this case, reset the device to recover
> > > > > > when PCIe device is offline.
> > > > >
> > > > > Is it a reproducible or a speculative issue? Does the fix
> > > > > recover modem from a problematic state?
> > > > >
> > > > > Anyway we need someone more familiar with this hardware (Intel
> > > > > or MediaTek engineer) to Ack the change to make sure we are not
> > > > > going to put a system in a more complicated state.
> > > >
> > > > This is a very difficult issue to replicate onece occured and fixed=
.
> > > >
> > > > The issue occured when driver and device lost the connection. I hav=
e
> > > > encountered this problem twice so far:
> > > > 1. During suspend/resume stress test, there was a probabilistic D3L=
2
> > > > time sequence issue with the BIOS, result in PCIe link down, driver
> > > > read and write the register of device invalid, so suspend failed.
> > > > This issue was eventually fixed in the BIOS and I was able to resto=
re
> > > > it through the reset module after reproducing the problem.
> > > >
> > > > 2. During idle test, the modem probabilistic hang up, result in PCI=
e
> > > > link down, driver read and write the register of device invalid, so
> > > > suspend failed. This issue was eventually fiex in device modem firm=
ware
> > > > by adjust a certain power supply voltage, and reset modem as a work=
round
> > > > to restore when the MBIM port command timeout in userspace applycat=
ions.
> > > >
> > > > Hardware reset modem to recover was discussed with MTK, and they sa=
id
> > > > that if we don't want to keep the on-site problem location in case =
of
> > > > suspend failure, we can use the recover solution.
> > > > Both the ocurred issues result in the PCIe link issue, driver can't
> > > > read and writer the register of WWAN device, so I want to add this
> > > > path
> > > > to restore, hardware reset modem can recover modem, but using the
> > > > pci_channle_offline() as the judgment is my inference.
> > >
> > > Thank you for the clarification. Let me summarize what I've understoo=
d
> > > from the explanation:
> > > a) there were hardware (firmware) issues,
> > > b) issues already were solved,
> > > c) issues were not directly related to the device suspension procedur=
e,
> > > d) you want to implement a backup plan to make the modem support robu=
st.
> > >
> > > If got it right, then I would like to recommend to implement a generi=
c
> > > error handling solution for the PCIe interface. You can check this
> > > document: Documentation/PCI/pci-error-recovery.rst
> >
> > Yes, got it right.
> > I want to identify the scenario and then recover by reset device,
> > otherwise suspend failure will aways prevent the system from suspending
> > if it occurs.
>
> If a PCIe link goes down here's my understanding of what happens:
>
>   - Writes to the device are silently dropped.
>
>   - Reads from the device return ~0 (PCI_POSSIBLE_ERROR()).
>
>   - If the device is in a slot and pciehp is enabled, a Data Link
>     Layer State Changed interrupt will cause pciehp_unconfigure_device()
>     to detach the driver and remove the pci_dev.
>
>   - If AER is enabled, a failed access to the device will cause an AER
>     interrupt.  If the driver has registered pci_error_handlers, the
>     driver callbacks will be called, and based on what the driver
>     returns, the PCI core may reset the device.
>
> The pciehp and AER interrupts are *asynchronous* to link down events
> and to any driver access to the device, so they may be delayed an
> arbitrary amount of time.
>
> Both interrupt paths may lead to the device being marked as "offline".
> Obviously this is asynchronous with respect to the driver.
>
> > > > > > +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
> > > > > > @@ -427,6 +427,10 @@ static int __t7xx_pci_pm_suspend(struct
> > > > > > pci_dev *pdev)
> > > > > >       iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) +
> > > > > > ENABLE_ASPM_LOWPWR);
> > > > > >       atomic_set(&t7xx_dev->md_pm_state, MTK_PM_RESUMED);
> > > > > >       t7xx_pcie_mac_set_int(t7xx_dev, SAP_RGU_INT);
> > > > > > +    if (pci_channel_offline(pdev)) {
> > > > > > +        dev_err(&pdev->dev, "Device offline, reset to recover\=
n");
> > > > > > +        t7xx_reset_device(t7xx_dev, PLDR);
> > > > > > +    }
>
> This looks like an unreliable way to detect issues.  It only works if
> AER is enabled, and the device is only marked "offline" some arbitrary
> length of time *after* a driver access to the device has failed.
>
> You can't reliably detect errors on writes to the device.
>
> You can only reliably detect errors on reads from the device by
> looking for PCI_POSSIBLE_ERROR().  Obviously ~0 might be a valid value
> to read from some registers, so you need device-specific knowledge to
> know whether ~0 is valid or indicates an error.
>
> If AER or DPC are enabled, the driver can be *notified* about read
> errors and some write errors via pci_error_handlers, but the
> notification is long after the error.
>
> Bjorn



--=20
Patrick: Are they laughing at us?
Sponge Bob: No, Patrick, they are laughing next to us.

