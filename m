Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42C9CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HnJGUuH5eNBfEnrm1c2/GsIle+JyJvfslh3ceYOWxk=; b=KzHrnAW8diztVxhSsNkX42XcSk
	MxVYmMoaBqfxLeGc6ts7DC2hIxxmtiktzidSCUdkV4Vt79322taLyzID+enxyXY/Am4KetmBRf1KS
	L1DM/VAOnEskj8XT/Dk/DYWFL/arat2p2djx0nAykfVDf8Z8KYuaEXu0ZSy5RHmK7fyF9pEXsTxZS
	/RJfxPQ2R4Bv6u5t07u7jnr8hW9QpDNwWDODGOesrqcvlQW4fo863hATt7QXQ+j29xguJU51jfaot
	nV1sHhL+J37YVDy6BGywTA1dGi0ZxcPlraoYXjHeL6BV1Mm64JOXAWFbP99MP11JfvAi/HSXVobod
	ruh0xHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVu7-0000000C8UC-0exG;
	Tue, 13 Oct 2026 06:22:27 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVu4-0000000C8TZ-1OS0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791872544; x=1823408544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZfsT/JnJx9KNk/XKB+11jQcQueyMxv3z5WgRkl62X7g=;
  b=lTvYNIP+Io6n5D+90GNm9htBHiMwnydDp/krJs9HR0gOmKeqH0Bs8Y+n
   1VhRW2IMXiBihvqaR6R+zmjlcuidwJjicanYcctig77GAdk95ez4cBrmR
   Lw7STKkic8RmlqGjmq6Q2IyKUf6fymQ6zMw0ZOR1Uhzf/LzOYaRij4PM6
   I4Lll9kwfwEAonU9Z1gA/6f6svSecPzKBX+y2xqRteG7gSnsxfzvgmnGm
   HO4fqTmJu/G37oVK7BQemXXAd/dZ/jWl1xjK31rDyQtfiyZzvYV4n4afG
   H0QyE8aHA+k+SrQuTUNEbnrjIX+bcX0nAxo2pM67CDaXlCB8NTKV7o/Lk
   g==;
X-CSE-ConnectionGUID: XFjMVeu6QdiZRBtFNbHj/w==
X-CSE-MsgGUID: n2xBYGkdSQm11uTV7hbhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="488007"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="488007"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:22:23 -0700
X-CSE-ConnectionGUID: WBV46saPQgWfz29cSZhMRA==
X-CSE-MsgGUID: Z44VSfF9SPuWjTtafJMR7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1092067"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 23:22:18 -0700
Date: Tue, 13 Oct 2026 09:22:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Phil Rosenthal <phil@phil.gs>
Cc: "git@gregoirelayet.com" <git@gregoirelayet.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Lee Jones <lee@kernel.org>, Tan Siewert <tan.siewert@9elements.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	"andrew@lunn.ch" <andrew@lunn.ch>,
	"jacky_chou@aspeedtech.com" <jacky_chou@aspeedtech.com>,
	"yh_chung@aspeedtech.com" <yh_chung@aspeedtech.com>,
	"ninad@linux.ibm.com" <ninad@linux.ibm.com>,
	"anirudhsriniv@gmail.com" <anirudhsriniv@gmail.com>,
	"andy@kernel.org" <andy@kernel.org>
Subject: Re: [PATCH v6 4/6] mfd: aspeed-pci-core: add AST2600 PCIe BMC device
 driver
Message-ID: <as3OF7O5hnImaAWO@ashevche-desk.local>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
 <20260818-aspeed-driver-v6-v6-4-fd7cc0b338ea@9elements.com>
 <C5A01ECE-9A61-4BCA-88C6-83A1673AA69C@phil.gs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C5A01ECE-9A61-4BCA-88C6-83A1673AA69C@phil.gs>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_232224_387676_37125999 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue, Oct 13, 2026 at 03:04:43AM +0000, Phil Rosenthal wrote:

...

> The simplest fix would be to make aspeed,lpc-interrupts required
> together with aspeed,vuart-over-pci in the binding, or to set SIRQ 0
> and 1 for vuart3 and vuart4 in patch 6/6, so the BMC side always
> matches the host's table.
> 
> The more robust option is to find the vectors at probe, which Tan asked
> about in that thread. That works whatever SIRQs the BMC side uses, so a
> board DT that leaves them out or gets them wrong still gets interrupts,
> and if no vector can be found, the ports fall back to polling instead of
> waiting on a vector that never fires. It would also be the basis for
> stock firmware support if that ends up in this series.

I interpret this clearly as "Let's allow vendors to continue making mistakes
and provide wrong DT/configuration bits." My vote is definitely *no* to a such.
If this needs to be done to support some weird firmware in the wild it must:
- be a quirk that is clear sign that one has avoid such an example
- inform the vendor to fix their crap

Did I get it wrong?

> It's the MSI counterpart of what the 8250 core's autoconfig_irq() does for
> legacy ports with UPF_AUTO_IRQ; I described the method in [1], and it's
> aspeed_pci8250_find_irqs() in [2]. With the DT fix above your boards
> don't strictly need it, but I'm happy to send it as a patch for
> aspeed-pci-core if you'd like it.

-- 
With Best Regards,
Andy Shevchenko



