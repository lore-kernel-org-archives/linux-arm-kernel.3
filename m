Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F01BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LuHBNSxHfE6ANORbYQCZpiCLVUHvb/JGg4k1qU+4CM=; b=WL66ynvUl09+RX0NQHI4YHH/93
	E5oFd7sl0t5C2xV00KPnpE/GsL2O8md5VWVCMXXlQYV06DpkpqmQVJsoJl8hJws/riWZkXX5rJeKG
	j1I5Ob7fYyy3ckkXZJMDgrsTBm0h8sxIL50f6KIiL76FHsgO4VZnG2U3gPxblTWNEXFo1fUjvoQL+
	YEjvavaVlNPJvSkhTq44pyix+vpc0TD7JLWxXOjgEe8Omhx5MA9ofc/dc9iIPeoH91HMUnDLVj3y8
	4tKKw4qJfvZJnanEQI7N6VjiFYA4/CgVVD48hz8dvFp+yneeCaxcNa6BFjoNmWqe89xayfHo7/7ZO
	Seb1A9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weydx-00000002hUo-3KRB;
	Wed, 01 Jul 2026 17:22:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weydv-00000002hUD-3Ajh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:22:36 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-475417f010dso628866f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 10:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782926554; x=1783531354; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LuHBNSxHfE6ANORbYQCZpiCLVUHvb/JGg4k1qU+4CM=;
        b=qpDE/p9z0HcuQgq2pJI/0mpEkNky0eSAJw1XVBHuCgJJ2ZAnMCR6afAEWID0JnyVp5
         Kl/yLN5wt4Rn2QKzcufgPT0p0q/x7L/pye4CH/IerGQIdMzbZ2U/bXsbHhnb9RbUxARe
         wjO6h2/xbZh/rYj46ApoJmi7l71HeKbHCnSiHvGj2AFszb6dBtGxW65SWTbTXe+2A6OF
         uNXlnk3HVd78uj8tdAupOo9FlWlE6YOkA9nudg8FURamBR2GiNbOdL/5ADMHB0MZrmom
         ZX27UdsCF8COV59iUqwv6egVZFnta7F0fp2Vnf5KUuAWd3FhyoXLP9BenwuFo8UPJOgg
         D8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782926554; x=1783531354;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LuHBNSxHfE6ANORbYQCZpiCLVUHvb/JGg4k1qU+4CM=;
        b=TDF7B8hmZIDpTpdPNUtrZB9GvS5+0kQjRi3Lecpar2jC4P8sotmVCYhABqMKViSJQE
         vs4+aMSWc9hgF1U78HxpMc+dI8s17onH0r3zyv7pheMx+J33ZAiLhHDTny2DSJkVdsIc
         iaRdTJvxdFIQUrT5PPYMB0Mnk8JNVq3SGze/YnKRCyxUXFAiKhRoS9HAjuda4tUF7LLS
         19dJW5g4zLAzNtq0jY/oXeIZeVsHBP++V9KJRWqArTYClz5g7ZFyI5f6CMRs2ZApZB/2
         pEqnr+b6EzD/QFJrdV04To4n8TX87MSB+S0WrHEO0Z7oigZ3w1NXezPqjIOs0HQmKmoC
         vMuA==
X-Forwarded-Encrypted: i=1; AHgh+RqYkAb5HTuYqqn++9r707UEFYHIqau0k23PKTWdm8S6+hqvzkrExbM+y5UG8pm1UzNoFgOQOMkxkhiaZncTIEEn@lists.infradead.org
X-Gm-Message-State: AOJu0YxzOkgTSHMn5cSkau6IpE3Z0eXmyJPastZfvkkKU6faqFz3T3bt
	ur+NSU6fZ+0HiUb7glrud26E4Bo+jd9Dq/wZTTnFh1N/z5qhlScbr0j5
X-Gm-Gg: AfdE7ckxCUvjKTTQTDrTW7j7301cBFmK26y7vc1YeBTiQOdWuuA+qIjuFN+tPCTvCM3
	r8xfdBoyxBc3d1ta/GezTfUI+dtroQXgxuhit1B0J2tJYR46VAI7SVbRrvSUtn0u/fMlTLcsQQt
	yBq5ppNM2GNUBk3l8Wjt64jyL5qewPbXEHQCV6Icq9wadmFnm6+vVfaE0XCbWQq64B9ZLMNmyA1
	3sCvUdEKPL8ZmZZ+RxMi2Iy9hyhCcL21MwOUGvmjfj2xdnj7V8RIEJAIEyrwP8iNeFazbhWrCno
	vwHvpyD1vkPFJifT6PxbJ6TGktzdcxjKeiEWBNS9XagvHBEzJgCmEdP2YgCZ5hq9wccEAl1iFLk
	xcHGoWtTsU9FjcSpN/xmxtpDjOrfk1sWpDzua/GUVXpiqMvXh5HWQK3Q0/eONLehbL2rANrpGZm
	iOPQMPX2QXb8IvtNr57rkitTTt
X-Received: by 2002:a05:6000:2606:b0:475:e7f7:ef7a with SMTP id ffacd0b85a97d-4775779827cmr4376692f8f.23.1782926553429;
        Wed, 01 Jul 2026 10:22:33 -0700 (PDT)
Received: from strix.localnet ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b83sm1526700f8f.12.2026.07.01.10.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:22:32 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Wed, 01 Jul 2026 20:22:21 +0300
Message-ID: <ihPM7P2dSn-oiyaL8fageA@gmail.com>
In-Reply-To: <20260629-unwelcome-raking-3df3d8ff0422@spud>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260629-unwelcome-raking-3df3d8ff0422@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartVc9fFCIUSOe9qcGAUepe1g";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_102235_833685_15D26784 
X-CRM114-Status: GOOD (  16.90  )
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

--nextPartVc9fFCIUSOe9qcGAUepe1g
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH RFC v5 00/12] ZTE zx297520v3 clock bindings and driver
Date: Wed, 01 Jul 2026 20:22:21 +0300
Message-ID: <ihPM7P2dSn-oiyaL8fageA@gmail.com>
In-Reply-To: <20260629-unwelcome-raking-3df3d8ff0422@spud>
MIME-Version: 1.0

Am Montag, 29. Juni 2026, 18:49:08 Ostafrikanische Zeit schrieb Conor Dooley:

> Bindings seem fine to me, I'll be happy to give you some r-b tags when
> you go non-RFC. To be frank, I think you should drop them as you've got
> no significant questions here I think and you'll be taken a bt more
> seriously.

Thanks for all the advice so far!

Here's one more binding related question: Philipp's request to give the PHY 
reset its own reset ID means I need a node and driver to consume that reset. 
My question is if it should be another MFD subdevice of topcrm or not. I am 
leaning towards not:

usb_phy: phy@2 {
	compatible = "zte,zx29-usb2-phy";
	interrupts = <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>, <GIC_SPI 43 
IRQ_TYPE_EDGE_RISING>;
	interrupt-names = "powerup", "powerdown";
	syscon = <&topcrm 0x84 0x2>;
	resets = <&topcrm ZX297520V3_USB_PHY_RESET>;
	reset-names = "phy";
	#phy-cells = <0>;
};

usb0: usb@1500000 {
	compatible = "snps,dwc2";
	reg = <0x01500000 0x1000>;
	...
	phys = <&usb_phy>;
	phy-names = "usb2-phy";
};

I am not aware of any IO region to configure the PHY, although one may exist. 
topcrm + 0x84 has two status bits reporting if USB and HSIC are powered and 
out of reset. Nevertheless, the PHY feels distinct enough from topcrm that it 
should have its own binding. The phy driver would merely deassert the reset 
and wait for the ready bit and maybe in the future do something useful with 
the connect/disconnect IRQs.

Interestingly the USB IO region is actually downstream of the AHB bus and 
matrix controller, but it has its clocks and resets in topcrm. I suspect the 
purpose of this setup is to allow wake-by-USB IRQs while shutting down the 
main data path.

Cheers,
Stefan
--nextPartVc9fFCIUSOe9qcGAUepe1g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpFTM0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoixfYP/1N5fuUTGEPdtNuW3vG/
UGctsVeP61D6WbybvSCVo7+1KDVP3P6sfavO3bN3qn3TEOPG6QAENugWVQMzgVxN
J6KFEIrSj87dtQePwmnV/hcK0Tt9wgqevxLDJaG5FZASgo4SltRANZqfA5Ck9l5d
yVufi9cvOxmxi2Cu5seCTlLR4jlUkFUFdto0OPA5TfFvqiT04RJSzjyMCzwfeBuZ
HmBBOTx0Qs7CaiXjFW7t4kJ/zYErOfkJeNt+kL2gbOlBjtPeNl5Swh5qbtxdQpHR
vQZotxrgKhuhCz2cTcVlgQ/woxLBvVd11Kr8Wv8Vi9t/Mz3De0hvD4131RJvZ7U0
GlYZXh6o0PBrXjb8obVMiINYWDhfcHFl5jXnrMeiBHyVBj3UIKwp/hpxnjhSRxli
WDP64JocUSKMoKxSLVH4fJN/HJPAHDj7ksjYic6QMtoRzWwtG3un+XfuIMjVnQmx
fIrAO4sLHmOAXNa0THlHDj1YrAVyxktU4fWDK119uvokp8HkUnHQBtUz72bCGKdn
FXRzeNhd/2+p4ubgd0KoecHHSEJW+VAqqpISEHFlaO45qn7HrnD/KmBwnhgeBc/J
XOZKOe169hR6oQA9ZY3GMXzz+fIIZkCmAvlSHFqfRf0jbkG/fBCjkpaOidwvcpja
znrBP0byDtZU6RNhIpGa1ymE
=mB5M
-----END PGP SIGNATURE-----

--nextPartVc9fFCIUSOe9qcGAUepe1g--




