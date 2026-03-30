Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A1A1061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpB8EE5DN+dzBnxMc30HBDUOsH9XHSaxkV3ApmYwWbk=; b=0U/6e4+sk/Ne4pF9ObXy7XGnOk
	4Wx992m94EvV5BT3qD5jJVbeps31DHLcWZqAD+3UfLW838cOsd6TBhAsmmpwJbb5eTPOWg7bpbuDK
	lBQiAvrkiGA5uS42LdZkJCZg5HEPD/wAcWZTihlMB7tIz2BCxzPDxV10AfFUHX4loziYToJtrFyo4
	Qpor/wYcxAhoWRC5mhhD0Bwy1JYDIRJT6+BCUH+Q4/RyUzIdmG5Vn/tON2S8bm4Bfvr8dKtjChZcC
	Ho4COR/aeIrKF6VOV1aiOODolr1PS4S7eqKdtCr2FXmXGTOS+QgzqW+xESt/vw6k699Fd6ucK5Od4
	f/ZJNE8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JAN-0000000BpgP-1liK;
	Mon, 30 Mar 2026 20:24:55 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JAL-0000000Bpg2-0gBe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 20:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774902293; x=1806438293;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6O0R420JsaobqCAMpIhjIoGFKW4TulkjH6tJS6uS2s=;
  b=I4rvMLabUxKJl7BY8w/zu8MQnb37J39/ypXTlHwWY71JDqzyVNQgTRg8
   nwb3erMaHxbunEyjsmuwXrmJWgGePxGfrMuOx81z3pV7voRfUSJbxCaNs
   BFEEiSW4cO0/ZmTgk3bylAchgZzBAL8kPluMqxcJ0UHAawivUBAMG03CO
   /pRthJW2yqpSQzXvV/9m/a381Wwn609L446l0NesEE1Lych3eg3T+j+lc
   2ME0JgSv7K/DZ2S4Ad3nUazQ6dSHMjFlOh5hTENAxtLCw7/+mD+Qrq1Q7
   pONEOArmusjY/iO2A1oVJb8YgHIoRONmhDrHvKBd1fKWeCaoENfm9vnIa
   A==;
X-CSE-ConnectionGUID: SfuLv24QRpa0yqSNmXBMDg==
X-CSE-MsgGUID: kyJ+hiA7QZOqvbFsrlspIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86598212"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86598212"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 13:24:52 -0700
X-CSE-ConnectionGUID: TXJZI8ekRJ6g6M9KfTUpgw==
X-CSE-MsgGUID: 7aHZRfASRmelp1lYOfoS4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="223280125"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.100])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 13:24:48 -0700
Date: Mon, 30 Mar 2026 23:24:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	brgl@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
Message-ID: <acrcDTPpXZ_5A4D8@ashevche-desk.local>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_132453_217105_8B6F9B01 
X-CRM114-Status: GOOD (  11.46  )
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

On Mon, Mar 30, 2026 at 02:40:47PM +0200, Bartosz Golaszewski wrote:
> Software nodes are currently initialized in a function registered as
> a postcore_initcall(). However, some devices may want to register
> software nodes earlier than that (or also in a postcore_initcall() where
> they're at the merci of the link order). Move the initialization to
> driver_init() making swnode available much earlier as well as making
> their initialization time deterministic.

...

> -static void __exit software_node_exit(void)
> -{
> -	ida_destroy(&swnode_root_ids);
> -	kset_unregister(swnode_kset);
>  }
> -__exitcall(software_node_exit);


Why? What's wrong with the __exitcall?

-- 
With Best Regards,
Andy Shevchenko



