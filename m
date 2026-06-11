Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C457CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8yrJlgURSJNOVVUnz5/bius6aZ6nIJOyw5U4+njbvk=; b=3sB+103Qbh7i27RvOtkYZX92dh
	mQByiZNRalaHoa93Qhb1QlPISWRuKvHNSsJql3aPu55pJJUdmS7kgCPwC/aFzkjZWD8k7QMIAeSav
	wN7Svj2u0xU0aDofDZcKNgApG2q/tA8zqhiU3tF5rc7YtKcrJ4esM5hiw6TgvUwVPk3z9T9G8ixEO
	wgxd+O17HO+PBVb/FhWkPZe0xTFQNSXm9CzPjqtSRWZ6nWVzgM/xR7Lh9FKHQIdmMrihnQeVit7/S
	2yySP/a5qYrAJ2Om9YEcz2GSEj3zUzda/psh2NTcnzHxaFk+gBQ4D1GwgxheM25DrfucyZGKuD3ig
	etUVJ8wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXavF-000000091hb-3BQ2;
	Thu, 11 Jun 2026 08:37:57 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXavD-000000091hA-0aus;
	Thu, 11 Jun 2026 08:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781167075; x=1812703075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ai4mXzWajtLKC33BxFXRCMf6dWYQxHfjWVW663QbhRU=;
  b=S9Z07KothLAUTAqSlSnfPoAICzGqie+6q8AdqoHkKEITBiagZZkmYIUz
   BNp2Y2z+qyOleHB9RIbYGPgYCJY67RNCpbFWn7T6e86/A3cvB3D+byGDA
   GgL+lJXHw/qYyOC6wqszIZ0ZiKhE/9BPFsLYX3TsvSXZg9fB9EE3JHT32
   3mh5ruOPL+TucF4jI80WVA92usBk/A3DKJVkNSDAlzA5Hk0qDh2AgxGd3
   CQf1lR36Orvy5+gLludeY6ZkRC5bxLB2dGBsbn5iC7zwnzLueOy03HVIa
   pdDEH7U5gxBjEca78G69JyMSeEtSjjrTwKPhBbD49m/hXooPQNsYmaw5p
   g==;
X-CSE-ConnectionGUID: I0h12TgcQq+l6t8PWwELYQ==
X-CSE-MsgGUID: 5dTgrckORBSPWXwYEkHGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93363399"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="93363399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:37:54 -0700
X-CSE-ConnectionGUID: DG4C+DU7RLqPDacCZUSHiA==
X-CSE-MsgGUID: dJFo0kyiSgO0ryNVI1csHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="241987912"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:37:49 -0700
Date: Thu, 11 Jun 2026 11:37:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port
 device
Message-ID: <aipz2zMFcdnZYTxS@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-6-wenst@chromium.org>
 <ailxrP-_9_NL8qnN@ashevche-desk.local>
 <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdiwQM6yk8FXcc+RisVP2iqWKWzVsn2-Yy6dyJXt-1X=Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_013755_218016_98B8E8A8 
X-CRM114-Status: GOOD (  18.65  )
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

On Thu, Jun 11, 2026 at 04:20:58AM -0400, Bartosz Golaszewski wrote:
> On Wed, 10 Jun 2026 16:16:12 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Wed, Jun 10, 2026 at 04:40:39PM +0800, Chen-Yu Tsai wrote:
> >> When a USB hub port is connected to a connector in a firmware node
> >> graph, the port itself has a node in the graph.
> >>
> >> Associate the port's firmware node with the USB port's device,
> >> usb_port::dev. This is used in later changes for the M.2 slot power
> >> sequencing provider to match against the requesting port.
> >
> > Okay, would this affect ACPI-based systems? if so, how?
> > Can you elaborate on that, please?
> 
> Is it possible that there's an ACPI device node associated with the port like
> on some DT systems? I don't think so and there should be no impact IMO but I
> also don't know enough about ACPI.

The API is agnostic. There is a possibility to have software nodes associated
with the port. I think the best is to be sure that ACPI-aware people who are
experts in USB will check this (Heikki?).

Also note Sashiko complain on reference count leakage.

-- 
With Best Regards,
Andy Shevchenko



