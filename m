Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E370CF885C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG3ChDDmMT3YrDzxPPea5PzvCSNp1XdHPGl33REZrIc=; b=26zcBDXs80HUxmKqqIEDlWZFvQ
	KRwFN7MiXcwgOL3ehpYUW0B8FZ5TgUdCAGSTt+mg4evpSQtilY+swHRcOVSLYYWGBh3bE+BloYfGC
	H+twldE7GpwswtycZUpxd7Rc/cczSnPT2orzp3TfbYcBrTzEy8UVkMcpOQZGArOvOjys6Uf6vbVRv
	2GTc0b3YyabfHQ2qVlFbW12Y+etQaxsDJDPFzOsGCl4Qfk6n8WA1SMjvrJivPKnJ70+yA7vTZepag
	FC4G+Xj+2Gl194B4gkOnTYz/KicyAZWJwLi9mkWKETNjMtV4QvnbrWpbqTjDCzO/3Hcug23u+Mt/j
	HU76NGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5BF-00000006mUe-3yWK;
	Thu, 20 Nov 2025 13:58:37 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5BD-00000006mTr-0pa3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:58:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b735487129fso145812466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 05:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763647113; x=1764251913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DG3ChDDmMT3YrDzxPPea5PzvCSNp1XdHPGl33REZrIc=;
        b=EB0TE1Z6+zn/rPocwWKLvFFXnWDfnOOtCVmfLq98cWiB3MsSbRUbrQ+jfWbN00+gEL
         1U79UF+k2QCs4RzK/iS2kDLmgW3uaICoSdwGPwji7WJmjbR+oDBDwOqzb77rCJBzx5aT
         otuCC3WL1edIq3UmCUgHeKIzpx1+X5jw2rCx7G+RxPuU9jqDu/IJDwUaTX3lgIzlMJ1t
         7QQ37LIPgpt6GeuQhfoh9ySxDDHbO3rv6K9Qp2IeKSAPqDDhJxGPrz/5Ej+NVuqRvsc+
         D19r8NEWUdm4cYUk591lvUOpnbMVn1Md40Ljidd9GyHALAOKoxFPgPL//60eidWaPI+I
         UwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763647113; x=1764251913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DG3ChDDmMT3YrDzxPPea5PzvCSNp1XdHPGl33REZrIc=;
        b=ausSah2umRUZZ0/C7zqJVjLroDRBSsWBvXfSLnMR3rhLsgrZxXE+Os+WKMAPpsX7SP
         1Ubyaf3E6LRclHtOf67cdV1UMxc+ISbZhszkHpLyMOr9snXHo9yy7AIsAxzBL1yd5g3O
         AwsdWAJadxnItE3O2YHUBJn0lLygGviizsITHFIFQsd50Q9hwb1wQdFow1el1d+LPFZi
         oosdLlijE0iLLUwLDQ4nNtuZBkCTB11eo2tON2yqdSnulQXmvm7KqzEhDeD/o5icN+8j
         lvIdFnndtIGRY3cQYWg9+teqVTNsTs8G3NUeUW63/7Zspth2MkdM493MLajQUbqhMBka
         vf6w==
X-Forwarded-Encrypted: i=1; AJvYcCXAImhhcXfv77IXJhNBIVAcwl1YyKZotV+mCnOKKowufxoG99DMGAT//2yygT5tKgKKCpgkdVRmsWbRX6X7YjGg@lists.infradead.org
X-Gm-Message-State: AOJu0YzaSlCFMZflEmdl5Twc/8+aADsNJPiNTnW4EAWYrxs/70tzC7VO
	CBTI8O/lCrj8dEO19hBZX8AKW/LtLWiFeAFB88+z8tDVc47+S7kxpgvyPJ6GsYo6Zcbd87TA5N+
	HlzHlaJgP/QLwd3UqWFKipowchLClodg=
X-Gm-Gg: ASbGncvIktpbckn8Rl60LOsaTrQMEivJOKd+8X/zAiqYYLEmKJHaXC/NYkBjvwtPjGw
	cBo5hM1Vsx34Tiow5aHb/xKiR+xm9KwsINu4qYSdjXt3w0/fom9cW9KfU2tkTCUEhO9y7ySgQdq
	SeK/qIzKrq6w8125ics+KzstXUNHaoKDgsdS0AJaVpBM61snNdslUzzFFoCVlQQhseDcjWPqMse
	g4fwGJ6nHVf9EHN+l2xvzqOcsCqK4Zn5tZyXCBRrDqzl278VcnsEUnxrQ9glbAGGsFTUw==
X-Google-Smtp-Source: AGHT+IEVLfIBF85HV4ZlfgN4D/4VOtQPabMhTdTM/DaKaBk2/tnTiKXzg1B0RQb5cwyWvIZ3LTgBAP+D+hBXUmc9U8o=
X-Received: by 2002:a17:907:9447:b0:b40:8deb:9cbe with SMTP id
 a640c23a62f3a-b7654cf3b82mr376884266b.2.1763647112743; Thu, 20 Nov 2025
 05:58:32 -0800 (PST)
MIME-Version: 1.0
References: <CANAwSgRHuwoQjr95sXp-X97=L-X3vqUPxjR5=2jNtFZA+4gnwQ@mail.gmail.com>
 <20251120034437.GA2625966@bhelgaas>
In-Reply-To: <20251120034437.GA2625966@bhelgaas>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 20 Nov 2025 19:28:14 +0530
X-Gm-Features: AWmQ_bnrXbdS4d1Wa8FR5sCLFCXhpJ7ae-_eHD85CbC5H6jhwpeTAoWyfYR2uDo
Message-ID: <CANAwSgStRZW322X3H_B4wK5CthFube_4MBUBw=U1BRjyRGeu9g@mail.gmail.com>
Subject: Re: [RFC v1 1/5] PCI: rockchip: Fix Link Control register offset and
 enable ASPM/CLKREQ
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, 
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-pci@vger.kernel.org>, 
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_055835_286626_9A24BC30 
X-CRM114-Status: GOOD (  27.65  )
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

Hi Bjorn,

Thanks for your input.

On Thu, 20 Nov 2025 at 09:14, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Nov 19, 2025 at 07:49:06PM +0530, Anand Moon wrote:
> > On Tue, 18 Nov 2025 at 23:20, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Mon, Nov 17, 2025 at 11:40:09PM +0530, Anand Moon wrote:
> > > > As per the RK3399 TRM (Part 2, 17.6.6.1.31), the Link Control regis=
ter
> > > > (RC_CONFIG_LC) resides at an offset of 0xd0 within the Root Complex=
 (RC)
> > > > configuration space, not at the offset of the PCI Express Capabilit=
y List
> > > > (0xc0). Following changes correct the register offset to use
> > > > PCIE_RC_CONFIG_LC (0xd0) to configure link control.
> > ...
>
> > > Don't do two things at once in the same patch.  Fix the register
> > > offset in one patch.  Actually, as I mentioned at [1], there's a lot
> > > of fixing to do there, and I'm not even going to consider other
> > > changes until the #define mess is cleaned up.
>
> > > [1] https://lore.kernel.org/r/20251118005056.GA2541796@bhelgaas
> >
> > According to the RK3399 Technical Reference Manual (TRM), and pci_regs.=
h
> > already includes the correct, pre-defined offsets for all PCI Express
> > device types
> > and their capabilities registers. To avoid overlapping register mapping=
s,
> > we should explicitly remove the addition of manual offsets within the c=
ode.
>
> > Here is the example. Is this the correct approach?
>
> > -       status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> > PCI_EXP_LNKCTL);
> > +       status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC);
> >         status |=3D (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
> > -       rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> > PCI_EXP_LNKCTL);
> > +       rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LC);
>
> No.  The call should include PCI_EXP_LNKCTL because that's what we
> grep for when we want to see where Link Control is updated.
>
> See my example from [1] above:
>
>   rockchip_pcie_read(rockchip, ROCKCHIP_RP_PCIE_CAP + PCI_EXP_DEVCAP)
>   rockchip_pcie_read(rockchip, ROCKCHIP_RP_PCIE_CAP + PCI_EXP_LNKCTL)
>
> You should have a single #define for the offset of the PCIe
> Capability, e.g., ROCKCHIP_RP_PCIE_CAP.  Every access to registers in
> that capability would use ROCKCHIP_RP_PCIE_CAP and the relevant
> PCI_EXP_* offset, e.g., PCI_EXP_DEVCAP, PCI_EXP_DEVCTL,
> PCI_EXP_DEVSTA, PCI_EXP_LNKCAP, PCI_EXP_LNKCTL, PCI_EXP_LNKSTA, etc.
>
I apologize for not fully understanding the issue earlier. I did not
carefully review your email,
 which caused me to overlook the required changes.

So, as per the TRM

17.6.4.5.1 PCI Express Capability List Register
Propname=EF=BC=9APCI Express Capability List Register
Address=EF=BC=9A@0xc0

#define PCIE_EP_CONFIG_DID_VID          (PCIE_EP_CONFIG_BASE + 0x00)
#define PCIE_EP_CONFIG_LCS              (PCIE_EP_CONFIG_BASE + 0xd0)
#define PCIE_RC_CONFIG_RID_CCR          (PCIE_RC_CONFIG_BASE + 0x08)
#define PCIE_RC_CONFIG_CR               (PCIE_RC_CONFIG_BASE + 0xc0)
#define ROCKCHIP_RP_PCIE_CAP            (PCIE_RC_CONFIG_BASE + 0xc0)
/* Link Control and Status Register */
#define PCIE_RC_CONFIG_LC               (ROCKCHIP_RP_PCIE_CAP + 0xd0)
/* Device Control */
#define PCIE_RC_CONFIG_DC               (ROCKCHIP_RP_PCIE_CAP + 0xc8)
/* Slot Capability Register */
#define PCIE_RC_CONFIG_SC               (ROCKCHIP_RP_PCIE_CAP + 0xd4)
/* Link Control 2 Register */
#define PCIE_RC_CONFIG_LC2              (ROCKCHIP_RP_PCIE_CAP + 0xf0)
/* Linkwidth Control Register */
#define PCIE_RC_CONFIG_LWC              (ROCKCHIP_RP_PCIE_CAP + 0x50)

And then use these like this.

status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC + PCI_EXP_LNKCTL)=
;
status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DC + PCI_EXP_DEVCTL)=
;
status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_SC + PCI_EXP_DEVCAP)=
;
status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC2 + PCI_EXP_LNKCTL=
2);
status =3D rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LWC + PCI_EXP_LNKCTL=
);

If you agree that this approach correctly resolves the issue,
I would prefer to confirm now to prevent further iterative changes
that might confuse.

> Bjorn

Thanks
-Anand

