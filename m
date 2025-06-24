Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF9AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XsNdAHj/TeTWbS97LIusJoIJAQIBgxjV5yCRWn4yiOs=; b=QI3VYGWddFEes2
	JG1t2rAGCvL4fTp+eNWaJESLAb/Tvg4XGqjrI7Lv70OY/nK8vA756/6igxkM0ZAYK3uv10t8JXXOR
	hghGZr0wbMOllWwSVEPzYNBMbuvOVFy+pWnch6sQkuInjO916RkkwlYgDcfMzx0tUY0CXJLXrdE8l
	1FrfNRuuo8CWRwTiLhhFahv2laf9+UL6818NanxEhtBvKDdz0zikyUgpCMDwlx2rMZVCT7t4XOtlm
	9HxabVa5pdTTF4TfhD2GdtaqUr+3PDXIcCCgEKYteigp4butS+LQ8ku36X93qvwZblhZgl4TeI3Kj
	XsK6OHUPhuBVIJBvGszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAVx-00000006nar-25Z1;
	Tue, 24 Jun 2025 20:45:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5ZR-0000000675v-0iYu;
	Tue, 24 Jun 2025 15:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=XsNdAHj/TeTWbS97LIusJoIJAQIBgxjV5yCRWn4yiOs=; b=lr2aNqyyPfR3kOe+jrordWATI0
	0BJP2oQquYP+qXf6/2scytXgvZlsXjl3FLQrPQ2VyPLvkyGA165YB1npSZXt7eRrMkPF4HwAurvvt
	vp7eMCqZmPBV07mWpp58xUhMI/KHzBdcQL33+/uTsbd/3HpNr+ErI3YymXRkYxw/RY8HKTRYpg1Vg
	WfgIv/luOjNpRDwjlg7yQblfiAxoURxhLm6qN1YWl4wA3azHkIAjz7WxBR8SK2YMo1EPL2rkH8a3y
	nQNBxskeMKjkc+ZY6kLkiaJh7CJuVrp7+TuzhACfNpgUvEbiyRp0yochMJWqgWmaYNofKg1Lu/uPU
	mmYTSLdA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5ZN-00000005Tcl-3eUm;
	Tue, 24 Jun 2025 15:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85429445D4;
	Tue, 24 Jun 2025 15:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF9FC4CEE3;
	Tue, 24 Jun 2025 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750778896;
	bh=Pl3NFZyhrvklSpvN1eF/J9iEI8F8auASAYz/1jCX/eI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=aX667HMmD7Y51beRdU5f4Hd584kRCoEk7KvoexSEew+t+eRh1pj1fR9UYQkqZHZfh
	 fWZBuBKFpWbUuR18ZgET27bcKTR21VWtudD2h/MiJg6xbrWNzJmKi4wWdNJxp8UTpF
	 cLfLjNx7iOPtPZpUkfu58+hbZmJ888pu5bFPuQLLNe3jewq+aBRDEgJjvD7ycC26mJ
	 gerZK14v2YkZRrVmf2+j4+xZpI9yO8HqO8Rg7b5p731cuNj3lCL5h1fcWXBFxZrqNF
	 KCL0s7tmxxejQDhFnb583lC+8Fm9OWcJ3n4gkCCspwZLuTbTLsDNKxeUPWTTXNkXBe
	 /ynLZbIg6aNbg==
Date: Tue, 24 Jun 2025 10:28:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>,
	"anhphan@google.com" <anhphan@google.com>,
	"wak@google.com" <wak@google.com>,
	"yuxiaozhang@google.com" <yuxiaozhang@google.com>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH 5/7] ARM: dts:
 aspeed-g6: Add PCIe RC node
Message-ID: <20250624152814.GA1477818@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51343F38D4F9C130A4CE3FED9D7CA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_162822_279630_3CAB7366 
X-CRM114-Status: GOOD (  11.44  )
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

On Fri, Jun 20, 2025 at 05:24:39AM +0000, Jacky Chou wrote:
> > > +				resets = <&syscon ASPEED_RESET_H2X>,
> > > +					 <&syscon ASPEED_RESET_PCIE_RC_O>;
> > > +				reset-names = "h2x", "perst";
> > 
> > PERST# is clearly a per-Root Port item since it's a signal on the
> > PCIe connector.  Can you separate this and any other per-Root Port
> > things into a Root Port stanza to leave open the possibility of
> > future hardware that supports multiple Root Ports in the RC?
> 
> The PCIe RC that designed by us is only one root port.

Yes.  But this driver may be used in the future for other RCs that
include more than one Root Port, and it would be good if that didn't
require structural changes to the DT.  Also, there are RCs from other
vendors that include more than one Root Port, and I'd like all the DTs
and drivers to have similar structure.

Bjorn

