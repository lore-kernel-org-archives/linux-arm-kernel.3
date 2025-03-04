Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E750C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TgX9nY0U+qPfOivHlBQzS/WnTYH3uLk/U/VnlOE+uA=; b=MVxLivxo8rryaz6k/xbORBH1XA
	0nCNqwDZTHhO58O6g3boUaanOPWxKmHx75Fn9KXM4OEfeK4DvI+DdsUeRxZZdtYYB3YtFPgrrwR+7
	CIRDRCgdubQgpsZCwszM529PIolrT/7MrqS+W7aPhwn9WVpfyGO0jwv2elYQuYwL92c+0zgJaTt7H
	0VnaKWr5kbEsz0EIBiNtt70IRbqeEvnWWKrDPFV2g/GVRUbq1Qs2gz7DkkoF+05mToJLLjh9WucU7
	HGIpfwv4gzzut/MoaHKtl6BwiD8pPC+HkGb1RaHV/LEFh6Jpjrl4F+n7FNIfV+crLlXQo/UqdG43b
	hgx7IY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRzR-00000004j9g-29Kl;
	Tue, 04 Mar 2025 13:07:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRxq-00000004irt-34zl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741093538; x=1772629538;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kId64MTN2SwW88P18+0OurZ0XEpuA7JeJv0/MwjsJj4=;
  b=JknpjyFC2M4rzJkkYClUpvq/aSXxZvrJqIHUgboCSfQl42CJSDlTF02P
   ENFDhRjg9hfQDWz1OnnRoFtaGEVhF6xGXG/z7dyitEhqyhSUupVk13KwN
   O6/YHGVkkGTB7agt11gD0QdPgIVJAYK3ChP6GaTtenDiOBOI9aKDKxhPZ
   PCaOMY7lImhcAKBZf5rei90daDFT2DqAJ51JZUwSL7fvU8XhsPQw0S9YS
   6j8NVCtWkh8+3LDdlqHuB+f2JFWgbb495jgB4GMMTPNUD09Mooj8o+FgW
   3URm19Zer3nxGoPqSs7UNkEUOj4rwxR12D9mxopq3bo4QieMzXhh2kIwZ
   g==;
X-CSE-ConnectionGUID: IRU3ofnOTmyHPCTCJ2cT3w==
X-CSE-MsgGUID: dYV4U4dUTAesWQq5lhkT3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41187701"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41187701"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:05:35 -0800
X-CSE-ConnectionGUID: bmwojJy2R9y2fe7aUkBKJw==
X-CSE-MsgGUID: LIenP46HT/eSa0i+DPjIHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123563998"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:05:27 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Mar 2025 15:05:24 +0200 (EET)
To: Paolo Abeni <pabeni@redhat.com>
cc: Hans de Goede <hdegoede@redhat.com>, x86@kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, 
    linux-stm32@st-md-mailman.stormreply.com, 
    linux-arm-kernel@lists.infradead.org, 
    Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
    Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
    Jose Abreu <Jose.Abreu@synopsys.com>, 
    David E Box <david.e.box@linux.intel.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    "H . Peter Anvin" <hpa@zytor.com>, David E Box <david.e.box@intel.com>, 
    Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S . Miller" <davem@davemloft.net>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Heiner Kallweit <hkallweit1@gmail.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    Richard Cochran <richardcochran@gmail.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Jiawen Wu <jiawenwu@trustnetic.com>, 
    Mengyuan Lou <mengyuanlou@net-swift.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v9 3/6] arch: x86: add IPC mailbox accessor
 function and add SoC register access
In-Reply-To: <48885074-b590-41e6-9794-49ec12713cce@redhat.com>
Message-ID: <d8e04cf2-afb9-dead-f7c2-297c66969081@linux.intel.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com> <20250227121522.1802832-4-yong.liang.choong@linux.intel.com> <48885074-b590-41e6-9794-49ec12713cce@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-97556846-1741093524=:931"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_050538_788765_22685301 
X-CRM114-Status: GOOD (  14.99  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-97556846-1741093524=:931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 4 Mar 2025, Paolo Abeni wrote:

> On 2/27/25 1:15 PM, Choong Yong Liang wrote:
> > From: "David E. Box" <david.e.box@linux.intel.com>
> >=20
> > - Exports intel_pmc_ipc() for host access to the PMC IPC mailbox
> > - Enables the host to access specific SoC registers through the PMC
> > firmware using IPC commands. This access method is necessary for
> > registers that are not available through direct Memory-Mapped I/O (MMIO=
),
> > which is used for other accessible parts of the PMC.
> >=20
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > Signed-off-by: Chao Qin <chao.qin@intel.com>
> > Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
>=20
> Hans, Ilpo, are you ok with this patch going through the netdev/net-next
> tree?

Yes, it you can merge it through netdev trees.

The function added into the header is a bit large on footprint front but=20
there are not that many callers so I guess it's okay.

Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-97556846-1741093524=:931--

