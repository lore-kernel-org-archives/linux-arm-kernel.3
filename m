Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2771C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIU+SJtkIfybDXXmoUFk3eibvPS+E8RO9Lx9I/iDWvc=; b=MDkDbZHDxdLQRyRW97t6GY6HBl
	toKDXxfZB93hQ6mbaQ9psf6yU9JnQz3s0XfGKz15VMBXZXBExC0QUUaDsUwdBLkxwImzbq3YaTPg7
	TTHIzOo7RGzAIQOAXN+xtWRK6o5bsamNBYJS/JBjjIEgmW9ZY2oHMz8nWbLrFZmknzBPYgW3a1Uem
	BqUWjGc1h9Q43Jw7cMVWYnPcJEk/qZA/Ov3GzTP6dzrOIfrgNBPi2G7PgdQ1+ypgKqSfUwmF3xbmj
	wv438jp1+KKAWJZ+zZCzMsgt+EtV2jCVL0eamJLRijiovNNhuoc5RQyjetxsdaFWcNei/zBQ/ZEc0
	AjYV7tOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Wme-0000000DP2I-3HAv;
	Thu, 10 Sep 2026 04:53:12 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Wmc-0000000DP0n-0v1w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789015990; x=1820551990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USeOFNpDGXQjN6aRmhfuPnevSjX11EyywpmYrkmenIc=;
  b=g3U7ng0JQJnPkF3LievEgAGm3NTZ4ooUROjX1aFrZCo3fw+Xu/P1C2OY
   Q7j86hbN9WV08tcnJL5EG1CCP+6xfKKZneF09d3OppRTKXr4NKpFMIFjY
   4cSEwae8oe6iDXdUJ7D1OdT0EK4xO+dsK3cVCXvIo8R/eDT0d4TfTKzVb
   0sRiiJO7lz/BZV2WD395lklnNlmLDtUqHFJPQ0hwXJp/I+YXyIi4Ahui9
   tz7ccIphBF4JDiNebwY7EyOdTes1No9ef6a6fsIGrsdIaVdVqS4q8Hdvh
   vz5bAo7u001HqGEL1dgPHFtG912stBbqmXGLcTRc1QTycDB6nQ/CakzbI
   A==;
X-CSE-ConnectionGUID: z63tmgplQ66aiU889VQ7pQ==
X-CSE-MsgGUID: bw/Txtz2TUSmo0rwWiP9SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="88400089"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="88400089"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 21:53:04 -0700
X-CSE-ConnectionGUID: nmriR2Y6SfKCCmZYZngiPw==
X-CSE-MsgGUID: Jq5tGFnjRBePw97xGD45VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="295017967"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 09 Sep 2026 21:53:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4578B99; Thu, 10 Sep 2026 06:52:59 +0200 (CEST)
Date: Thu, 10 Sep 2026 06:52:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
Message-ID: <20260910045259.GO106095@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
 <20260909060615.GJ106095@black.igk.intel.com>
 <33699664-6afb-4b46-99d1-98a0f5e57f39@kernel.org>
 <5a8bc263-0263-4ccb-b5dd-f5e899dc25c4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5a8bc263-0263-4ccb-b5dd-f5e899dc25c4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_215310_274219_1DB85DA5 
X-CRM114-Status: GOOD (  28.55  )
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

Hi

On Wed, Sep 09, 2026 at 05:25:32PM +0200, Sven Peter wrote:
> On 09.09.26 17:20, Sven Peter wrote:
> > Hi,
> > 
> > On 09.09.26 08:06, Mika Westerberg wrote:
> > 
> > [...]
> > 
> > > 
> > > If it is possible, I suggest to use the same way we do in ACPI side here:
> > > 
> > > https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-
> > > for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-
> > > through-usb4-to-usb4-host-routers
> > > 
> > > It was specifically designed so that it should support DT as well (that's
> > > why it uses the device properties _DSD).
> > 
> > Oh, nice, I didn't know those existed. Konrad already has a PR open to
> > add these to dt-schema [1] and a PR that already makes use of these for
> > dwc3 [2].
> > I can just write generic code similar to the ACPI one then to add the
> > device links and split it off from this series, though I think that dt-
> > schema PR must be merged before we're allowed to use that
> > representation.
> > I'll adjust the dt-bindings here for v3 to just drop the representation
> > as OF ports/endpoints as well.
> > For the PCIe/DP tunnel notifications I should be able to use the same
> > representation, possibly with an additional usb4-adapter-index property
> > or similar to differentiate between the two DP IN adapters, once I get
> > to that then.
> 
> Though now that I read it again: do you know what PortInstance# in
> 
> Package () { "usb4-port-number", PortInstance#}, // PortInstance# is unused
> and can be 0
>       }
> 
> refers to? Is that meant to e.g. by 0 for the first DP IN adapter and 1 for
> the second? Or is that meant to be used when the NHI handles multiple Type-C
> ports? The description isn't clear to me...
> 

That's the USB4 port through the native PCIe/USB3 Gen X is tunneled through
but like I said in the previous email you don't need this for DP, only for
PCIe and USB3 (Gen X/T).

