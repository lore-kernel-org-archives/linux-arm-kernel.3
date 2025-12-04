Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61501D1F9CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIcvz3pM9uua4SWobTJ4iQql5w+gjhdvtv6+L7bhXmc=; b=a1m/8z0Ik3BzQIyR7lVt1K4wEF
	9C5/DiwVa3pDStvy+gn2UsNoAyhQiX3krg/Ms9HEE+dAUPfQj80BoFNwTFvOurnxVjUODbU+8eYhw
	1g3WBLq62c99XNEPyB2AxdUl/fFhCkEEPdcksWPKqtqO+wTnzlU5OBJzdDIonITYUR4H6FG2lWZPh
	6nbjNsgqS/U50w9wv4lNByCNLKK92G+BeZB/rQrNj4rf6Tv122wiY8rLBlad7Al4zWCtUEqyI/FLq
	MAdVwxXcWXxxhx+OBZN7POJ/d6NWCCOOo6mYx1zKUorcRERXNFVd1mVzhzbInZJbiJtsB1DqwQ6tH
	4ev0HwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR84k-00000007xVu-0M5P;
	Thu, 04 Dec 2025 12:04:46 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR84g-00000007xVZ-1A6O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 12:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764849882; x=1796385882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gahuY5j4rl/CtnfZX+Oxd0AZSKt23iPZjS1LKaxOyig=;
  b=IX47SdZ4skGCKIIKzo9cPGloHmGv44xpb2txMWJ+IjhywGOU6Ye4QXKK
   KDdlyW+3xhQEn/9hqN5YatMfWlL1yAuxVqpqJSq/qGZt5k3i/+LNbMkkZ
   d5906be8tAV1djtEZLDKF9LsljnmUtpGOd53yhhoRg9aMcInD74vrmcod
   iS72cwV9fDcIiFrYcmeRUkkh+VC1q0EUOXMT44acjYhK1jeoAsO147JeP
   7wkKT8+UzfDYhlfoSa4NDfeZHxCxuq9MSBy1MP4m+ju6AU01aGgpudf+3
   8OIrhXOh6/BRbA8R89SvCz3Hc4Pd+Z9pfPCrrOLoVoBfJXoJ3+/rRzSnz
   A==;
X-CSE-ConnectionGUID: ZEtPSP5wTO6gGrtkYYw7cw==
X-CSE-MsgGUID: wafcIaxpTrGOpC5RSgl90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66941076"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="66941076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:04:41 -0800
X-CSE-ConnectionGUID: XZTvr8laRxiwi8TbSrRJzg==
X-CSE-MsgGUID: mLq186wHTMKddEFlXQFHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="195777812"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 04:04:36 -0800
Date: Thu, 4 Dec 2025 14:04:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
Message-ID: <aTF40eLT2YTB8OoO@smile.fi.intel.com>
References: <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
 <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
 <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
 <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
 <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
 <20251204083839.4fb8a4b1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204083839.4fb8a4b1@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_040442_373524_543B6794 
X-CRM114-Status: UNSURE (   8.89  )
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

On Thu, Dec 04, 2025 at 08:38:39AM +0100, Herve Codina wrote:
> On Wed, 3 Dec 2025 12:11:45 +0200
> Kalle Niemi <kaleposti@gmail.com> wrote:

...

> Saravana's email (Saravana Kannan <saravanak@google.com>) seems incorrect.
> Got emails delivery failure with this email address.

According to the Git history his last activity was in August 2025 with
adding (surprise) his name to one of the MAINTAINERS records.

And according to lore, his last message was in October 2025, so I dunno
what's going on there.

-- 
With Best Regards,
Andy Shevchenko



