Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FD5D132DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixt2pxhE+GUMP1ybg0LFnpaT/CtOYUtl340zmznlIek=; b=MEEc8WVN3VWZrthc1FUBdJ7wei
	Mg2j4TMJrGmp6Om+XO7/tWP5kRIxGwIsTXoOgqTSX9zgjBQyauI9fD4vdD7FyArqUNSpxLLglBKrK
	NUpT4DOE6aJxHd95bOyK7ckjXkOBcVG5WyN0ZJ7XQaqKrDM5bwyBuku8hSRzVXY7toJ8KTH0pl8hp
	UN/IXbnGIYkC/IqPQpJ2Orcbx9Ole11z71Jevs36U6Bml4uY25XcVWa/Zrtc/N/gO/IYN9keyreCY
	P24dd1xhOrbm3vajiOKiauPUdDjGW3jEUAuRL0kza1yJXgPQ5G6RUjRrrFwTVrgEWwoIKgWgkV/UI
	aLnvfo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7z94-0000000EEHv-1vGn;
	Mon, 04 Nov 2024 15:37:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7z2y-0000000EDII-0Yov
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FD445C0453;
	Mon,  4 Nov 2024 15:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB60CC4CECE;
	Mon,  4 Nov 2024 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730734275;
	bh=3Fy1jOsQOnUvBVYuqqqVwd9tb0/m9bzjV5s/aymLShs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kacN7HFey8Z9quF31vtpdKNqCWiQEPm2so2YOGa87PVujVygueSqvAyOSA/3jlJcj
	 qrQLwuOMb8lpDvHKU08OSFiCNmCF8MiRwqoZckD1QY1Fvuv0mhaKSFDw0TivYfe8L/
	 E0+YAoD1lM5YrMYeViXrHz5S/ZYblKc+2E/q8OoWKStrjivH8H/GXqvPBR1bLqxSfs
	 cPEuLAZdYZbnRi0EZcCVd3ErfIGKlo5H5BAS2mi7Q4ZPAAQwWJvk3gAywxvrZVWkwY
	 7oAUms39P3WCDVujJSWoLv4tCFNuIYCTF5x93rI2mDM9jjXkTT6fU4JVt7u6FmviZe
	 6qP6OVQOL+1YA==
Date: Mon, 4 Nov 2024 09:31:13 -0600
From: Rob Herring <robh@kernel.org>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Frank Li <Frank.li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	IMX Review List <imx@lists.linux.dev>
Subject: Re: [PATCH v3 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241104153113.GA111159-robh@kernel.org>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
 <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
 <ZyOyvgw0qZ4YKwTi@lizhi-Precision-Tower-5810>
 <4b82e393-093f-4477-bf0f-ee559a3b97c1@oss.nxp.com>
 <ZyUWhLdODsNk7KTe@lizhi-Precision-Tower-5810>
 <0e3edc61-02c0-40cf-883f-9b8cd6019c49@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e3edc61-02c0-40cf-883f-9b8cd6019c49@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_073116_292603_517A2F25 
X-CRM114-Status: GOOD (  31.52  )
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

On Mon, Nov 04, 2024 at 10:22:05AM +0200, Ciprian Marian Costea wrote:
> On 11/1/2024 7:57 PM, Frank Li wrote:
> > On Fri, Nov 01, 2024 at 11:29:24AM +0200, Ciprian Marian Costea wrote:
> > > On 10/31/2024 6:39 PM, Frank Li wrote:
> > > 
> > > Hello Frank,
> > > 
> > > Thank you for your review!
> > > 
> > > > On Thu, Oct 31, 2024 at 10:35:54AM +0200, Ciprian Costea wrote:
> > > > > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > > 
> > > > > This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.
> > > > > 
> > > > > Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > > > Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> > > > > Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > > > Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> > > > > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > > > ---
> > > > 
> > > > next time you can cc imx@lists.linux.dev
> > > 
> > > Thanks for your suggestion, I will start adding this list.
> > > 
> > > > 
> > > > >    .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 99 +++++++++++++++++++
> > > > >    1 file changed, 99 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..3694af883dc7
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> > > > > @@ -0,0 +1,99 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> > > > > +
> > > > > +maintainers:
> > > > > +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> > > > > +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - enum:
> > > > > +          - nxp,s32g2-rtc
> > > > > +      - items:
> > > > > +          - const: nxp,s32g3-rtc
> > > > > +          - const: nxp,s32g2-rtc
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  "#clock-cells":
> > > > > +    const: 1
> > > > 
> > > > Does your RTC is clock provider? why need #clock-cells
> > > > 
> > > 
> > > RTC clocking on S32G2/S32G3 has a clock mux for selecting between up to 4
> > > different clock sources (parents).
> > > Now, as suggested in previous reviews, I've switched to using the CCF in
> > > order to implement this hardware particularity. In the end I've resorted to
> > > implementing 'assigned-*' approach which while not mandatory as per proposed
> > > bindings I find it quite scalable in selecting clock sources for the RTC
> > > module compared to the first iteration (V1) of this patchset.
> > 
> > Any link of previous review?
> > 
> > Frank
> > 
> 
> Please consider the following related reviews:
> 
> [1] https://lore.kernel.org/all/202409121403232ab1295b@mail.local/
> [2]
> https://lore.kernel.org/all/6659aa90-53c5-4a91-a9f9-01120c88f107@oss.nxp.com/
> [3] https://lore.kernel.org/all/20241016160823c22ccb22@mail.local/

I've replied on the prior version.

Rob

