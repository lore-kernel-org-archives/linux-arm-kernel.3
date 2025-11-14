Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546A6CE8D40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSlAjd2/bzut7bsXFZj2fHFTw4dhyypYEGn0c01DsIg=; b=R1zx+5fKXzRKy0Cfth3sYoE7pU
	IXLY4TxVFlO/S/mOvngVs+d9kOVZm86bEnYaMUzbnHWbTbU2J/y6rKCInfklsr3pYK5WzwnYKnsfG
	jPzdtmZwdcmZCTSiCQ2amOudOeeU9ITa5qptzeimxnE5ROmsyOko+c6erKIZtP48EuA+EKCa4p49p
	Az5k9RxU2OoOAW8CbgIc7uZNee3D4UJtwBK8ei5Wz/VxEjmLFbuolZqn1aRDlq9vqE5LVGxLxxCWh
	42Kseig5Li08wLAqAKPQdKccb8wOZyLoEH4czU+Ok9SAzwoO93OfDvfT2wF/chtMVPHE1ncIZJnIS
	BlKbMN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJviw-0000000CYaR-2eyx;
	Fri, 14 Nov 2025 15:28:30 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvit-0000000CYZn-41dr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763134108; x=1794670108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z8lCr3fSbWR0YaeRJvRwXvQNpYW9CE1zd/Fm1bcIsCE=;
  b=LkjbqH063u0pq5dYjXDf++VVJnwUmyFcHaX/9V4RECDnUMJL9FNB/Bv2
   Mcz8jDM5RW+xp69OHg/NpzShe51fercrdgPMfcU+5TwgWwdQ//36XnYv7
   AxeYPFMMouHhCbWcQcusPIfFXpKhbKrJI3ld4/Ol+azuxaxZObwlDYcGI
   QaFV73UfBzX3OIi5SAgKv1JOqxsVHOt4i0e76BTh2hpaZCae3CVtQ9hKJ
   OYtgpruwqQKxyIubZRf9e7ho6+cdFVfJBJ8TCdwvvjpUtCXJ1Py/xbCSP
   DJL3PDb9+F1yjoi9eFXr/9E0aoFcPKHfUq46HfqBmLGRh/F7hlAFRXq1e
   Q==;
X-CSE-ConnectionGUID: 1Tt5qtIyRcaK/dip5+VMaA==
X-CSE-MsgGUID: vZayeykyQZ+QsNygtbgUfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="75909790"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="75909790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:28:27 -0800
X-CSE-ConnectionGUID: 82XteTvSQDqJSy/t7iUKSw==
X-CSE-MsgGUID: Ypb8ALdmRFS6MgEOugSKQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189450717"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:28:24 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 606D5121DDE;
	Fri, 14 Nov 2025 17:28:23 +0200 (EET)
Date: Fri, 14 Nov 2025 17:28:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <aRdKlwosRv-80_KN@kekkonen.localdomain>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
 <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
 <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
 <aRdBbn4cpdn_7H0v@kekkonen.localdomain>
 <umslyxkmj4gnr743c6ixsykay5w2seoeiy2hzidg6lb3fcizep@dglvrn7l7a4q>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <umslyxkmj4gnr743c6ixsykay5w2seoeiy2hzidg6lb3fcizep@dglvrn7l7a4q>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_072828_026776_71FF667B 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Hi Jacopo,

On Fri, Nov 14, 2025 at 03:57:21PM +0100, Jacopo Mondi wrote:
> Hi Sakari,
>    can't say timing is what we excel the most at.
> 
> Afaik Hans has applied the PR, and as all comments here are on ...
> comments, they will be addressed with patches on top

This is just sample code, changing it later on will be fine.

Thanks.

-- 
Kind regards,

Sakari Ailus

