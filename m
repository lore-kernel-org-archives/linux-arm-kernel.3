Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFFDC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mb0tIdmPk9Fq8CRLkem1lUekwQ0REImkzyM8RgoOvOY=; b=X8Oc/uIZSDIP3NbKsF/H36Tu0l
	oEmiOLfg37tFU22tmG4RrCR8w6fP/bndfN9ZT5KqTJcsi3Iywnb3OJ/h3RgR03O20dfS5lVTC6uOl
	sQQPUkn+iZNDxsrw0hqO6yQpoNCB7OIrxNDTJl4L6kN2nIEY0oYyidyOz3pnDAoGEo539pEnV22Ku
	TscokbCSBh/iGtl2UOvOHOs6Rb3LhD8DMhrTRYloQcZwq45m2j1QWACK8ewclUdhfv+sYiAlKgdeR
	hi7JUycBg0LgFgIUaF+8YH8QXP9D0N5QdpVoLn1t5PRKwAOy2NgnTLtCxh9SpXZcLyAMYb7PWx/Ao
	8wQNZxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ag-000000096X4-3Ox9;
	Tue, 21 Jul 2026 10:20:46 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ae-000000096WL-3yXh;
	Tue, 21 Jul 2026 10:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784629245; x=1816165245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BuikVx7La/9chV7s1hxXnMG7wdWI9UN7BDknLSFwfoA=;
  b=klVErddC1PjfrsptqTnbGGK9EjiDmwDAb05TIdYDZRiBZkYwyDg9MLY0
   BQBEf1/ioFsqq9FqOSUfaffkuZtgVc63uMMb2BLX3ZvkAbWsF9o0DtlZY
   GQGl2y0F2ybfWuDQQQRteILaB1gg81v7c4OD9s3CNoe/AL+M/k7/QGLlS
   VNVEM594NQWRk9Gdkb052X//OUtQ/U0KR9yZv0ZCpNwyN6Z05gZnb+r3k
   ExYunKpNUrVCHBqofQejxbLI57vpVCGo8OTM2THW2lz2KSg7WCsLlg72C
   iKCv6C+sukT2y63jihDYyluoA+HiVZENvXSvBKZqW/LFzKQXYoTuLVg2e
   Q==;
X-CSE-ConnectionGUID: PnxoBa0aSwGjPJ6vtrx/vQ==
X-CSE-MsgGUID: vseq8GkNT7yOw2Vq2WFWHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="72760706"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="72760706"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:20:44 -0700
X-CSE-ConnectionGUID: emV8fJJ2RYaoLii1C2v5Wg==
X-CSE-MsgGUID: 735o4J9fS5Kac9BFspqMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="257793437"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 03:20:41 -0700
Date: Tue, 21 Jul 2026 13:20:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/9] Input: elan_i2c - sort include statements
Message-ID: <al9H9rn7Y2qtIJ80@ashevche-desk.local>
References: <20260721075226.2347933-1-wenst@chromium.org>
 <20260721075226.2347933-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721075226.2347933-3-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032044_998411_96DFEBC6 
X-CRM114-Status: UNSURE (   8.29  )
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

On Tue, Jul 21, 2026 at 03:52:16PM +0800, Chen-Yu Tsai wrote:
> Sort the include statements before adding new ones in the next change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



