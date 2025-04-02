Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965AEC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9+sgrKUixJfScmblE4/RYiP0Z7a8pyQDBnyIip9mUWU=; b=O7nJCvkw/t/qYb17jxjSKvKmit
	rlMlQbzInMJ8L90/V4oQbox2VrnqV9YwNEDl6cswWQscgzJcDs3k3aYG2gCVQ/kKIHLk5Pgg4FABn
	aL54jMUg7RArdtPtE8Cw6tpqd5qg5OiE0LMNs9iIJArWJjiEUfcgdS4ehTy5uRX2liC+VBf7qkX+B
	sHH3kq6MeKzKcA+IckCscN6dDnU1i0rfPJGLRG9GnpLbEWxoX/Y5VSRlPzkYDRB5nSpccrIfQjekb
	6eFXweaC9pMsVDQwrbUylAoLt7n/jbsJY9P2jIwaOa0t+qiCmwVA8eN551euirUhgzYD1+iKu/a3v
	imWQ4O7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u004n-00000006Wr9-3Jc0;
	Wed, 02 Apr 2025 15:32:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0031-00000006WY1-3kQT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:30:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27D3A106F;
	Wed,  2 Apr 2025 08:30:38 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E9943F694;
	Wed,  2 Apr 2025 08:30:32 -0700 (PDT)
Date: Wed, 2 Apr 2025 16:30:29 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/7] firmware: arm_scmi: imx: Add LMM and CPU
 documentation
Message-ID: <20250402-pastoral-screeching-panda-da4a45@sudeepholla>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-1-7695f6f61cfc@nxp.com>
 <20250401-quantum-coyote-of-admiration-bf1b68@sudeepholla>
 <20250402123503.GA23033@nxa18884-linux>
 <20250402-acoustic-analytic-guan-d3cda5@sudeepholla>
 <20250402161037.GC23033@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402161037.GC23033@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083036_015999_C5B2230D 
X-CRM114-Status: GOOD (  29.54  )
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

On Thu, Apr 03, 2025 at 12:10:37AM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> On Wed, Apr 02, 2025 at 12:46:14PM +0100, Sudeep Holla wrote:
> >On Wed, Apr 02, 2025 at 08:35:03PM +0800, Peng Fan wrote:
> >> Hi Sudeep,
> >> 
> >> Thanks for reviewing the patch.
> >> 
> >> For comments that I am not very clear, I marked with [TODO] for easily
> >> jump to.
> >> 
> >> On Tue, Apr 01, 2025 at 03:15:46PM +0100, Sudeep Holla wrote:
> >> >On Mon, Mar 03, 2025 at 10:53:22AM +0800, Peng Fan (OSS) wrote:
> >> >> From: Peng Fan <peng.fan@nxp.com>
> >> >> 
> >> >> Add i.MX95 Logical Machine Management and CPU Protocol documentation.
> >> >> 
> >> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> >> ---
> >> >>  drivers/firmware/arm_scmi/vendors/imx/imx95.rst | 801 ++++++++++++++++++++++++
> >> >>  1 file changed, 801 insertions(+)
> >> >> 
> >> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> >> index b2dfd6c46ca2f5f12f0475c24cb54c060e9fa421..74326bf2ea8586282a735713e0ab7eb90ccce8ff 100644
> >> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> >
> >> >> +
> >> >> +PROTOCOL_MESSAGE_ATTRIBUTES
> >> >> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> >> +
> >> >> +message_id: 0x2
> >> >> +protocol_id: 0x80
> >> >> +This command is mandatory.
> >> >> +
> >> >
> >> >For completeness add parameters here for message_id as in the spec as it is
> >> >referred in the returned value and seems incomplete without it.
> >> 
> >> [TODO]
> >> Sorry, I may not get your point here. You mean below format?
> >> 
> >> +------------------+-----------------------------------------------------------+
> >> |message_id: 0x2
> >> |protocol_id: 0x80
> >> |This command is mandatory.
> >> +------------------+-----------------------------------------------------------+
> >> |Return values                                                                 |
> >> +------------------+-----------------------------------------------------------+
> >> |Name              |Description                                                |
> >> +------------------+-----------------------------------------------------------+
> >> |int32 status      |SUCCESS: in case the message is implemented and available  |
> >> |                  |to use.                                                    |
> >> |                  |NOT_FOUND: if the message identified by message_id is      |
> >> |                  |invalid or not implemented                                 |
> >> +------------------+-----------------------------------------------------------+
> >> |uint32 attributes |Flags that are associated with a specific function in the  |
> >> |                  |protocol. For all functions in this protocol, this         |
> >> 
> >> message_id is not put in the table, but it is list above just below
> >> the protocol name. I would prefer to keep current layout and align with
> >> the MISC and BBM protocol.
> >>
> >
> >I meant why is the input parameter message_id not described in the table,
> >but is referred in the return values. For completeness, just add it even
> >though it may match the SCMI spec in terms of input parameter.
> 
> I will add below only for PROTOCOL_MESSAGE_ATTRIBUTES which refer message_id
> in the return values. Please raise if you have concern.
> 

Ignore this. I see even existing BBM and MISC follow the same pattern for
standard protocol commands(0x0-0x2). We can fix them all at once if it
needs to be in the future. For now, it should be fine as is.

-- 
Regards,
Sudeep

