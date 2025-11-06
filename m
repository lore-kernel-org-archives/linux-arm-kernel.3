Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80CBCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmBA/KK70v6rBVGjZpKXDIBM4WBJIcvL/O3YLKuQiHw=; b=1Cd5ZWzJxXGRhKMC9fFgoSf2f3
	LzhACaCivLenOE8xxM6kqRcSo0jJtykPBEWJBT8zefT06YYE/DO/d0figakNSBf791yOq+vHyLCMC
	QRMxJhKvLv76qRdm9G6RCf19qK/9jwtk5bMAoS3lwH+/73vpQ+NXREtWdIHqLW6/HsF6XkypeXF0p
	YilPu/+CPUnlagQ3NISWn+NelifhAwEcMadknDP/r8ehXErEC0QEcG8Nzrz9zNFCZ0sc0cacXGUGW
	xyGKZK9TaYxD6Fbd1oTrohYEMIZxcWjJzD1a6ZgtmPR3VMQHi44BYKet1xQZ929QnUGjZOeSzkML2
	ACIxkSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5El-0000000G7Sl-2ZXV;
	Thu, 06 Nov 2025 19:01:35 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5Ej-0000000G7S3-0Teu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:01:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-641018845beso2122427a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762455691; x=1763060491; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rmBA/KK70v6rBVGjZpKXDIBM4WBJIcvL/O3YLKuQiHw=;
        b=kNHTG8VOYpAK4ZiRFn2pgjuwQ5Bww41ySZVlG7EtWdzIIMFEpwsRiaQhS1p55o44Rw
         syd9/4OsEJhxfho4mC1JBAM4skP/tPVX58WKeChB5F8pyxLZqaAzDFegMIi8OyhMeEKt
         DJpdkPtgwYBFcOwnbPtvbUX2MMn/nS7dbsmH9ipVWPBTAHaOj9KDSOPaBttsRgnrXb26
         5onOyj+OSwcop0t7TGO/656sLNd9kZIAbIPwqHI7sh+6yG0orcqjnVdeB9IZxoMajh3F
         uLS8kC53LGrKLm+fBconQCSkIl8/l1d5Bzsb3AEd1/XqR0ej0ieqrfIo9p3/t+RpzEjB
         3qqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762455691; x=1763060491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmBA/KK70v6rBVGjZpKXDIBM4WBJIcvL/O3YLKuQiHw=;
        b=Dp6kDmnFdN52oX1j9Ppuac0tAtt3QVJpPjM+PV3TgGE7BWjDX/EUYddImvjFmeOPcx
         9liGuvYvvRzE59CPU5wVnocp5cTqfQkfeESxMNgxfbUIVMSjvpq4/gXFbQ6Tmdm5GZDn
         b/RvGdCfy9eoq9Y1OaPUiDHh0mZCbTZjsWlZW9WhpXcud6Lbn/6+a1r1kvwncMFYfrZ6
         vVLZtYowkk8oQvBnNly3plDElwYgHzAgD4g0/JCLEt79Fhi/IQ3XFI15FLa/Z89OHCKd
         jS/zp84zTF9uIZNnNdGMs7tTnqw9q4h7LIXUY2Vf0Wv6mrQHAjFw98060Zbd65/e6kjs
         dyCw==
X-Forwarded-Encrypted: i=1; AJvYcCWefjfu2SNDRbMiP1mpHESZvS6Lmt2BpQoXbC8qu4jVJwOIlcBskXPlgmwAMHESD6mh5zpsMOvZzBLWojz91+OS@lists.infradead.org
X-Gm-Message-State: AOJu0YyCu3BRdWE+qsywsEa/BV0x86bRhrRBXjMtWwI4/c76w1mCQ2wk
	oejmOgpcitNxqJDs4Qvhp7+XIySS6eLt6Q2irgY7UxaqgQDtyuf1OZE7SDXdA43eGwrm4sXpTSg
	P4Al0/0Gf5CIfxpMZY9lGKo4O10fj9gQ=
X-Gm-Gg: ASbGncv8J+F+OSsa8V9+7+lARCzPElCv0HYSOrsRD8NfyB8WMq4ECthHgqoKBWeNAFu
	r6Mv8fAPKECwoHsbDVRB5t4i1ZFMilWipOlqla9TJ4L0392kwyP2Cwi2yx/3WIy/M2Bxl0GxrTa
	Eto6s1s8UL7qwYg9//N17asQHhGon11faZnv4zdm6B62h3fJ1SJR+oeqvhsyFSrlhxMs8HdkI9K
	I8yxddXFF6iad3RTwTa464LzZ5Y56faC3lkGX0hdBYWjIIInQe3wGXXGiI=
X-Google-Smtp-Source: AGHT+IH+Y4Mu5BYHnpAhpDDYEu9pnY0g5fsOj+T+jrFEJrqRN2a3pdfy5tPNDE4xFkznVewhY7OLbh6GTw5tCYHmiBc=
X-Received: by 2002:a05:6402:26c8:b0:634:ce70:7c5 with SMTP id
 4fb4d7f45d1cf-6413f063506mr466646a12.17.1762455690583; Thu, 06 Nov 2025
 11:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
 <cf6zumlp4iiltglu7bbrpdeysaznrkyvlemwl4lxwkfjkgux7a@wl37bxilsprx> <cbvcjgcd7saxj42ifgqn3l6mwpgenlhbr4zuf5ibqbtj6rmzqh@yuc7flbwyi2y>
In-Reply-To: <cbvcjgcd7saxj42ifgqn3l6mwpgenlhbr4zuf5ibqbtj6rmzqh@yuc7flbwyi2y>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 7 Nov 2025 00:31:12 +0530
X-Gm-Features: AWmQ_bnqyEL1PybATXbJIxvw3HT9eVFRywU_mWpf-A2S9gMDT2HPtzblvdFHBN0
Message-ID: <CANAwSgSvtc57kh-VJewk5=_MvfL3KVxNFU8C+tGh4iqJhnEVtw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] PCI: dw-rockchip: add system suspend support
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110133_159638_DE456CBE 
X-CRM114-Status: GOOD (  32.03  )
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

Hi Sebastian,

On Tue, 4 Nov 2025 at 00:29, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Nov 01, 2025 at 07:29:41PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Oct 29, 2025 at 06:56:39PM +0100, Sebastian Reichel wrote:
> > > I've recently been working on fixing up at least basic system suspend
> > > support on the Rockchip RK3576 platform. Currently the biggest open
> > > issue is missing support in the PCIe driver. This series is a follow-up
> > > for Shawn Lin's series with feedback from Niklas Cassel and Manivannan
> > > Sadhasivam being handled as well as some of my own changes fixing up
> > > things I noticed.
> > >
> > > In opposite to Shawn Lin I did not test with different peripherals as my
> > > main goal is getting basic suspend to ram working in the first place.
> >
> > Wouldn't it break users who have connected endpoint devices and suspend their
> > platform? I don't want to have an untested feature that could potentially cause
> > regressions, just for the sake of getting basic system PM.
> >
> > But if your goal is to just add basic system PM operations for CI
> > testing, then I would suggest you to do something minimal in the
> > suspend/resume path that don't disrupt the operation of a device.
> >
> > But this also should be tested with some devices for sanity.
>
> My goal is proper system PM support, but I would like to go step by
> step. Right now system suspend on the Rockchip RK3576 EVB just hangs
> the board and it has to be power cycled afterwards. In parallel to
> this series I've send a bunch of fixes to get it working. It surely
> isn't perfect, but I fear things regressing again in other areas while
> the complex PCIe system sleep is being worked on - simply blocking system
> suspend is not very helpful, since it effectively hides suspend problems.
>
As per my understanding, the current DTS configuration is missing definitions
for critical PCIe power management GPIOs (clkreq-gpios, perst-gpios, wake-gpios)

clkreq-gpios, such as PCIE30x1_0_CLKREQn_M1_L (not sure if it is used ?)
perst-gpios such as PCIE30x1_0_PERSTn_M1_L
wake-gpios, such as PCIE30x1_0_WAKEn_M1_L.

However, the RK3588 TRM indicates that these power management functions
can be controlled programmatically using specific memory-mapped registers:

The PCIE_CLIENT_POWER_CON register at 0x002C provides comprehensive
power management controls, including link-state management, wake-up
event handling,
and clock management.

In PHY GRF, we have the PCIe3PHY_GRF_PHY0_LN0_CON0 register at 0x1000 allows
direct control over the PHY's power state (P-states like P1, P2),
enabling transitions into
deep suspend (L2/L3) via register writes
clkreq_n Clock request for lane X. This is a side-band signal that a
PIPE 4.2 controller needs
to enter and exit P1.CPM, P1.1, and P1.2 power states.

My thought is that using rockchip_pcie_phy_deinit() in the suspend
routine and rockchip_pcie_phy_init() in the resume routine are
incorrect; these functions
likely perform full resets or power cuts rather than managed power
state transitions,
thus disrupting the desired suspended state of the PCIe link

I tried a few things on my own, but I am not moving forward.

Thanks
-Anand

