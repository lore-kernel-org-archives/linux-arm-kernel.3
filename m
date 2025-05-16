Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80743C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yNiiKDF+KREAb3BL5tgjMXVU2VSaNddorcUcOqgweU=; b=KuUyg1x1MhKopLBh9hlEFerjTC
	exVlAjeXiuOhQqKbAfvSOGjRyjTjIjpEK4YSioj5WDPi8NJdvtBM4px57Z0hsITOzTmMVCeCV16G7
	hRsJcR2TfhxYFZ2mzTQNSbNg3J8MEBpEA6fgO2BoYch7abgHLdNB5l3X70BWG1d+Ilw2UNhJUmNDa
	Z/VY4m1LgG1Vc2lq53P7jy3fQ7wf1vla98zLlReT7+A9ecl/f2WvyQCXmGZU7FbnbB5ICz1SCLSvU
	aNUHo82m/v3SCo4nhPSHcr85aU2MQdFERz0BJU6wArq7/2TAKySHBPeu3fBne82+W3LD17IG9Fxd6
	YB5c6Meg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG09U-00000004NcO-2cAx;
	Fri, 16 May 2025 18:51:24 +0000
Received: from mail-24427.protonmail.ch ([109.224.244.27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG07T-00000004NMV-103a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 18:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747421348; x=1747680548;
	bh=7yNiiKDF+KREAb3BL5tgjMXVU2VSaNddorcUcOqgweU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=YfSLBGme+j8sYt6NOtKuOUslAYSSy5jMhTgXKeh1Te/z8i1Ab3lSiBojNz003mqfi
	 Diz0TWon7Y/W3BD/3c0ViEiGDAxFzRpV1EyJOiyz6PYCfr2N0QjKanbMEfjnsUy/HC
	 256JSo7wEkjVwq/HEK6Hh1IwvUTOE7hT8tEJz/BIzMw7WtBV2s5fj/PjUzTfGHjGJs
	 j56yR09sxYPfbIU/gn/gY4RAF/2PRY9JoHBzkCaC22evAvIooVP3C3nr/Jme/Hr0fb
	 zn3wsw07kH2W73i/q/J6sYWLpcqnZL/G0LBrPa0FaAwp4N6FsgzKcTF4wdMvVg1CmT
	 zxsEcQ9CJf95A==
Date: Fri, 16 May 2025 18:48:59 +0000
To: Niklas Cassel <cassel@kernel.org>
From: Laszlo Fiat <laszlo.fiat@proton.me>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, Krishna chaitanya chundru <quic_krichai@quicinc.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, Damien Le Moal <dlemoal@kernel.org>, Hans Zhang <18255117159@163.com>, =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <5l0eAX7zaDMDMp1vJhvB9MVKXSPn3Ra0ZiP5e2q1E4rwmADBB6MlREZO9cuD_zvclAOhhBE0-NFthVbOajeSCfYjchT-83OgLbjclOgx3T4=@proton.me>
In-Reply-To: <aCcMrtTus-QTNNiu@ryzen>
References: <20250506073934.433176-6-cassel@kernel.org> <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7> <aCNSBqWM-HM2vX7K@ryzen> <fCMPjWu_crgW5GkH4DJd17WBjnCAsb363N9N_h6ld1i8NqNNGR9PTpQWAO9-kwv4DUL6um48dwP0GJ8GmdL4uQf-WniBepwuxTEhjmbBnug=@proton.me> <aCcMrtTus-QTNNiu@ryzen>
Feedback-ID: 130963441:user:proton
X-Pm-Message-ID: a32a7c4b900ed4f1e27a751ddab136cfa7cdfb9b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_114919_423506_DA4ADCA3 
X-CRM114-Status: GOOD (  29.56  )
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

Hello,
-------- Original Message --------
On 16/05/2025 12:00, Niklas Cassel <cassel@kernel.org> wrote:

>  On Thu, May 15, 2025 at 05:33:41PM +0000, Laszlo Fiat wrote:
>  > I am the one experiencing the issue with my Orange PI 3B (RK3566, 8 GB=
 RAM) and a PLEXTOR PX-256M8PeGN NVMe SSD.
>  >
>  > I first detected the problem while upgrading from 6.13.8 to 6.14.3, th=
at my system cannot find the NVME SSD which contains the rootfs. After reve=
rting the two patches:
>  >
>  > - ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can de=
tect Link Up")
>  > - 0e0b45ab5d77 ("PCI: dw-rockchip: Enumerate endpoints based on dll_li=
nk_up IRQ")
>  >
>  > my system booted fine again.
>  > After that I tested the patches sent by Niklas in this thread, which f=
ixed the issue, so I sent Tested-by.
>  >
>  > I did another test Today with 6.15.0-rc6, which in itself does not fin=
d my SSD. Niklas asked me to test with these
>  >
>  > - revert ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we=
 can detect Link Up")
>  > - revert 0e0b45ab5d77 ("PCI: dw-rockchip: Enumerate endpoints based on=
 dll_link_up IRQ")
>  > - apply the following patch:
>  >
>  > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pc=
i/controller/dwc/pcie-designware.c
>  > index b3615d125942..5dee689ecd95 100644
>  > --- a/drivers/pci/controller/dwc/pcie-designware.c
>  > +++ b/drivers/pci/controller/dwc/pcie-designware.c
>  > @@ -692,7 +692,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
>  >                 if (dw_pcie_link_up(pci))
>  >                         break;
>  >
>  > -               msleep(LINK_WAIT_SLEEP_MS);
>  > +               usleep_range(100, 200);
>  >         }
>  >
>  >         if (retries >=3D LINK_WAIT_MAX_RETRIES) {
>  >
>  >
>  > which restores the original behaviour to wait for link-up, then shorte=
n the time. This resulted again a non booting system, this time with "Phy l=
ink never came up" error message.
> =20
>  That message was unexpected.
> =20
>  What I expected to happen was that the link would come up, but by reduci=
ng
>  delay between "link is up" and device is accessed (from 90 ms -> 100 us)=
,
>  I was that you would see the same problem on "older" kernels as you do w=
ith
>  the "link up IRQ" patches (which originally had no delay, but this serie=
s
>  basically re-added the same delay (PCIE_T_RRS_READY_MS, 100 ms) as we ha=
d
>  before (LINK_WAIT_SLEEP_MS, 90 ms).
> =20
>  But I see the problem with the test code that I asked you to test to ver=
ify
>  that this problem also existed before (if you had a shorter delay).
>  (By reducing the delay, the LINK_WAIT_MAX_RETRIES also need to be bumped=
.)
> =20
>  Could you please test:
>  diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/=
controller/dwc/pcie-designware.c
>  index b3615d125942..5dee689ecd95 100644
>  --- a/drivers/pci/controller/dwc/pcie-designware.c
>  +++ b/drivers/pci/controller/dwc/pcie-designware.c
>  @@ -692,7 +692,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
>                  if (dw_pcie_link_up(pci))
>                          break;
> =20
>  -               msleep(LINK_WAIT_SLEEP_MS);
>  +               usleep_range(100, 200);
>          }
> =20
>          if (retries >=3D LINK_WAIT_MAX_RETRIES) {
>  diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/=
controller/dwc/pcie-designware.h
>  index 4dd16aa4b39e..8422661b79d5 100644
>  --- a/drivers/pci/controller/dwc/pcie-designware.h
>  +++ b/drivers/pci/controller/dwc/pcie-designware.h
>  @@ -61,7 +61,7 @@
>          set_bit(DW_PCIE_CAP_ ## _cap, &(_pci)->caps)
> =20
>   /* Parameters for the waiting for link up routine */
>  -#define LINK_WAIT_MAX_RETRIES          10
>  +#define LINK_WAIT_MAX_RETRIES          10000
>   #define LINK_WAIT_SLEEP_MS             90
> =20
>   /* Parameters for the waiting for iATU enabled routine */
> =20
> =20
>  On top of an old kernel instead?
>

I have compiled a vanilla 6.12.28, that booted fine, as expeced. Then compi=
led a  version with the patch directly above.

>  We expect the link to come up, but that you will not be able to mount ro=
otfs.
> =20

That is exactly what happened.=20

>  If that is the case, we are certain that the this patch series is 100% n=
eeded
>  for your device to have the same functional behavior as before.

That is the case.

Bye,

Laszlo Fiat=20
> =20
> =20
>  Kind regards,
>  Niklas
>  

