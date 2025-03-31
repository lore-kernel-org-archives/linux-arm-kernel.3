Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DBFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCAGxL0VVs2jXAatMFawmHHlHOvWUQPotdex+Y7qOQY=; b=BclknOJvWux9wBkE7QibcVIpti
	WEalzMXZPbYAo8y08T6Sk9zqT0J52UfrPsQ86hKttss3Zk0qjJwUbRcVlCHWd8ThNy/V1Smx8dSro
	Cw9QEpMDrFWpozljxj/EeUKghPkmQ4/YEt5oRSCce9R7aZuqO/wuPrvQVeHL6H0uLS+k/BdZO1MIj
	4UYHKzZLR+QMmIjfnJXD9RwpiJ6qeLXEYDZjx828145mq5E2bA6I02RXzyG0E2hPrfOI+J5pW5mEr
	l5AQorL3N9mbMfX5WIJoTQbyUJkg58LQ1YxHSwXPENvlCMXbBEpPgem4oFi9IKuhxvDCapYmumsX9
	d310u7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEJx-00000000LrF-1Ulu;
	Mon, 31 Mar 2025 12:32:53 +0000
Received: from out-14.pe-a.jellyfish.systems ([198.54.127.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzEIA-00000000LMs-2kcG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 12:31:07 +0000
Received: from prod-lbout-phx.jellyfish.systems (new-01-3.privateemail.com [66.29.159.56])
	by pe-a.jellyfish.systems (Postfix) with ESMTPA id 4ZR9TS5WnBz3xLy;
	Mon, 31 Mar 2025 12:30:52 +0000 (UTC)
Received: from MTA-15.privateemail.com (unknown [10.50.14.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 4ZR9TS51wGz2Sd0T;
	Mon, 31 Mar 2025 08:30:52 -0400 (EDT)
Received: from mta-15.privateemail.com (localhost [127.0.0.1])
	by mta-15.privateemail.com (Postfix) with ESMTP id 4ZR9TS3hXsz3hhV6;
	Mon, 31 Mar 2025 08:30:52 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=framepointer.org;
	s=default; t=1743424252;
	bh=oA0qd1nicMZSBrlxjfG3/k0n2p/I87faDWnmX4g1KxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A58LaWNzi547O0g1lcPpQkt1fmRxCRizs+iU6osyiLjwmazUaJJmhDnUL6NtYe4zL
	 0zhiP+kMaEgndo4r/gMFZaLh7jmILRCVUJeZOt2/krkFzoyOr8v6/3QIOZMHfvB8bw
	 sMkATcN5hmgd7Zjr4lfhC1Wt7vqfpHXRflbM5uJRPq6QTUuWI1TsGjzQlKAnDzRBDl
	 ym9087dR1JQl57i7Zicg4ThVwo7s6TpUPdYrkG5RTxwy6zcx5NzMo0TZq5ZsFlhDnC
	 QglYHB3ZzAD8daM3yevrvlWB7Kb3QxoIFFW6coR45mgeltyFuEpI0hXI3z9FEiOfL7
	 3PpEArkj3LkEg==
Received: from 65YTFL3.secure.tethers.com (unknown [152.44.190.141])
	by mta-15.privateemail.com (Postfix) with ESMTPA;
	Mon, 31 Mar 2025 08:30:36 -0400 (EDT)
Date: Mon, 31 Mar 2025 08:30:38 -0400
From: Sam Winchenbach <sam.winchenbach@framepointer.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, mdf@kernel.org, hao.wu@intel.com, 
	yilun.xu@intel.com, trix@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, michal.simek@amd.com, linux-fpga@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Sam Winchenbach <swinchenbach@arka.org>
Subject: Re: [PATCH 1/2] dt-bindings: fpga: zynq: Document ICAP on boot
Message-ID: <p4bujnmgkcvsu4qipmgh2j2loedepmwgp7zlaxrurhaveb6tbc@ibqtbjnbzdzj>
References: <20250328141944.119504-1-sam.winchenbach@framepointer.org>
 <02496a88-3d9c-49ee-93ab-8f1400fc0c6b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02496a88-3d9c-49ee-93ab-8f1400fc0c6b@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_053102_716338_4587F6F6 
X-CRM114-Status: GOOD (  25.26  )
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

On Sat, Mar 29, 2025 at 05:59:07AM +0100, Krzysztof Kozlowski wrote:
> On 28/03/2025 15:19, Sam Winchenbach wrote:
> > From: Sam Winchenbach <swinchenbach@arka.org>
> > 
> > Documents the ability to enable the ICAP interface on boot.
> > 
> > Signed-off-by: Sam Winchenbach <swinchenbach@arka.org>
> > ---
> >  .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml     | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
> > index 04dcadc2c20e9..bb2781ae126ca 100644
> > --- a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
> > +++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml
> > @@ -31,6 +31,13 @@ properties:
> >      description:
> >        Phandle to syscon block which provide access to SLCR registers
> >  
> > +  enable-icap-on-load:
> 
> Missing vendor prefix.

I will add this to a v2 patch, assuming we come to an agreement on the
suitability of this approach.

> 
> > +    type: boolean
> > +    description: If present, the ICAP controller will be enabled when
> > +      the driver probes. This is useful if the fabric is loaded
> > +      during the boot process and contains a core, such as the SEM,
> 
> I don't get how this is suitable for DT. If you decide to load the
> fabric from driver, that's driver decision so not DT.

Before writing the fabric to the FPGA the driver disables the ICAP, enabling
the PCAP. Once writing is complete it unconditionally disables the PCAP,
enabling the ICAP. This patch just makes it so, depending on the use case,
the ICAP can be enabled at boot. This will not prevent the system from being
able to load a fabric through the driver. I added in this boolean so existing
behavior would be maintained.

Do you recommend another approach such as writing to a sysfs attribute to
switch from PCAP to ICAP?

> 
> > +      that requires access to ICAP interface to operate properly.
> > +
> >  required:
> >    - compatible
> >    - reg
> 
> 
> Best regards,
> Krzysztof

