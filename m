Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AD1E9A75A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nM9a1pxcHaHXDj3ydgaTef1ZBO7vSF7D5eDKG2uzOk=; b=G8NufihYpgYk9Jms5FBQLDLw8S
	oycqPedeWAcwBTKvY25YypTtgU23D2gzUNcyIzLdRLzgSGKcVm3Tpf1I2r/YIbRmO2jYty+HT3NUi
	LkvxaBab7j4H4+bhTjdicXmiQfY3AOXsaa4ggDbMTDICEzECqRfm7n/aTE9rRh+wap0sFMnasUCpY
	iOB9IWgIbvUmcSKOVsVZVWO1hSBdXSW8d+IzhxYp+rwsFrwm114UIYtGCnMqnjIlBfv0mDtHLTmTe
	qADRuwjxy4HR6rfBeX5i5XSzeZMK4B+43mt9l65gPbdN3fjpTNXOUCRqH8hKTkK12q/VBfduTYcX5
	wULBEU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4z6c-00000001Dch-3ULm;
	Tue, 24 Mar 2026 10:35:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4z6b-00000001DcW-38ri;
	Tue, 24 Mar 2026 10:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6nM9a1pxcHaHXDj3ydgaTef1ZBO7vSF7D5eDKG2uzOk=; b=MdKlrozK7gZG7pfPlP4Lb8pYF+
	YSTzkAy2U+RrhEZvV9opUVhq59i/KUgAnyVVhzFWd3UjIYSGCO7BKuVaBzEvdZ8CWcalSUNVV+Gmg
	Dt5ySqjMGpgL2gYgPV2U5pNnTVUHLFjsj3ga5M59vcbV4AvGQXUF4KyqNrGRTwv8GXFcR8LPzVr8C
	aPHPXhs+QG0PT6nnsiBT5MGcdn4hz5qUUYx1v7grNBXMaTuLsktFE9i5m4tcjW0glEjUrrCTZm8us
	2gn66afsxwcRlgxIlTDml6kZB1ulsI92C92BSKMWFN4MIa9s0GSXO6fR7as+om9SjNVYY+neyRPwN
	T57Y+4tA==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4z6X-00000003n4P-2Vw3;
	Tue, 24 Mar 2026 10:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774348521; x=1805884521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hAR97mSfzBsK6s2/V2lxo/QMFvGGs27xGdB50d/Icsw=;
  b=PhzNqVZ9MKCXkP5sw7kuv6YQNgMofY97lU3m1GfRkI7AW6Tyt+O0zYbr
   M0M7UdG0dm1T+3RGnW2dfObpVViVNBIbcDFLj6/7+o3Q+kSCq46uQnnBl
   Ku5W65r6X6A4+XDxeoj/VruIqk3IbpL729YAr7HylcMlrwtKfC4CMsYxF
   VZq2E1zWvwJpJ015/TqQ4tHBTH+MXvSUWJZ8TFh5IIO7YHa61ebfINHQl
   g2oPKYkOnGJt0EVL+lpdbAUmTPTU3q2sryuP6Z59ypiLG+BWNRngwH57g
   kJhOZliffU3cz8Jo/fdQ9lpsY2HZYANjVrNMDN0fUZ/4R1l3fXbalSinZ
   A==;
X-CSE-ConnectionGUID: Is9HPRNDTs+XhjeXhjv0OQ==
X-CSE-MsgGUID: O83qrmL3S22pG16GU4M81Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="97978531"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="97978531"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:35:14 -0700
X-CSE-ConnectionGUID: JzFhO/gaRVC88UXRsJRd+A==
X-CSE-MsgGUID: ovTG8psfRoShtwdAORxHvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="262239026"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 03:35:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2B5CC121CFF;
	Tue, 24 Mar 2026 12:35:14 +0200 (EET)
Date: Tue, 24 Mar 2026 12:35:14 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Frank Li <Frank.li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev
Subject: Re: [PATCH 0/6] media: synopsys: Add imx93 support
Message-ID: <acJo4qamh9edxqb-@kekkonen.localdomain>
References: <20260210-imx93-dw-csi2-v1-0-69667bb86bfa@nxp.com>
 <acGQNIUKqfh8eWNB@lizhi-Precision-Tower-5810>
 <acJI3wYnl8_g4WpO@valkosipuli.retiisi.eu>
 <08e6b649-61ac-4059-a914-c537b5c4da7e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e6b649-61ac-4059-a914-c537b5c4da7e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_103522_445341_C1F99CC6 
X-CRM114-Status: GOOD (  15.82  )
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

Hi Michael,

On Tue, Mar 24, 2026 at 10:46:49AM +0100, Michael Riesch wrote:
> Hi all,
> 
> On 3/24/26 09:18, Sakari Ailus wrote:
> > On Mon, Mar 23, 2026 at 03:10:44PM -0400, Frank Li wrote:
> >> On Tue, Feb 10, 2026 at 12:11:07PM -0500, Frank Li wrote:
> >>> This 3rd time try to support DW CSI2RX support for imx93.
> >>>
> >>
> >> Laurent Pinchart and Sakari Ailus:
> >>
> >> 	I am not who will take care this patch?
> >> 	original drivers/media/platform/synopsys/dw-mipi-csi2rx.c picked
> >> by Sakari Ailus
> > 
> > Michael seems to have questions on the last patch, too.
> 
> I.. don't.. think so. After digging a bit in my memory and lore, I found
> a v3 of that series with my Reviewed-by [0]
> 
> [0]
> https://lore.kernel.org/all/20260216-imx93-dw-csi2-v3-0-aabafee10923@nxp.com/

Message-Id <9e14d605-9419-441e-a554-432d435191b3@collabora.com>.

-- 
Sakari Ailus

