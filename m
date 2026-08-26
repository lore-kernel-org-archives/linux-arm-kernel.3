Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B518BC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=us6T1/OFqJY4YFTbnC7ycE3olDDIGXlj7FrL5apbJMM=; b=KnSwusM5PXNqJvMmd0GaHwaaEn
	Fa+akLvCnmLpqUDes/BpkL87omoih9fAcJqrcgUMFO2nT6QacnX0Q4tx7yG+uQxqa+7dA1FXZt1Qs
	KF8K5AxCVThnDCLimoZWw7ScpSIbyYX1snHAYygsP8nwgRt3ifO2MXAxlcILkYBi2drpjcWPXbThK
	I9/shsKzab2TszDV8uqlLaPKnFULkFsUL16v954zH3KdMqa2Zo6bnmN0XGjYQYkHgxszgYbsUXGLo
	mGIWudUZEWG0bBCWl+JinqP8zD4HCij5MJX2SHXU1MTfwvUnumjQ7F8PQvlKY+M3BkOb/VGO3Za6C
	R6cJMqvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEAo-00000002YZk-2qyh;
	Wed, 26 Aug 2026 14:00:14 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEAl-00000002YYl-08mG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787752811; x=1819288811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/TzXwS4YF5gUqidjGf4wMNZnieUtP2YP6qNtEw/gL8I=;
  b=LyqZDVQ+CJYdS3yFvybuZQV5BaQMecgR9jvRlqNXaJ310vqgOLBBitVG
   Lb628+kvPp+/yWKvWLfpXjx7MPUQb/8wZN59XR9etxyTVDNDR9S6CFj0r
   GeZ/ueXVswa7JnASTRUQvPlIi98hPJq10/vTffn5qEKXLq4VfKVn08rza
   GLgkWKzPaXn6ykHONUk8WdVPf/Ks0miAOecjTGXCtmBEsDr4WEix0lu+v
   dY5rCKtGN1t3l4phLrs8CvCDWj6bxBRHh5FfLbIjkJHD0OvqiTFlhtPXi
   TrIOF4buybCVSo+mjMZJn6CMmjC7nGvRegG6Z5Hhmya51rrqGZ9Cx6ukA
   g==;
X-CSE-ConnectionGUID: HiRkKhrGSeScJmplL0a2XQ==
X-CSE-MsgGUID: F7V3obY8Sl2v4WlSA+XAGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="90744758"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="90744758"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:00:06 -0700
X-CSE-ConnectionGUID: dfsx2vyhRDCF5cIeDZjYWw==
X-CSE-MsgGUID: VeOrfRlZTq6usqVghYthtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="267014274"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:00:04 -0700
Date: Wed, 26 Aug 2026 17:00:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] gpio: Unify the GPIO controller node check
Message-ID: <ao7xYVKgM5jW4vUf@ashevche-desk.local>
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MejNn8NJYe6ByKig8cZHL8pq98waNfVozY9SteZYYJmHw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_070011_123958_3CA37534 
X-CRM114-Status: GOOD (  11.97  )
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

On Wed, Aug 26, 2026 at 05:33:23AM -0500, Bartosz Golaszewski wrote:
> On Mon, 24 Aug 2026 09:42:31 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > There are handful of drivers perform the same check in different variations
> > over and over with a potential to make subtle mistakes. Unify the check by
> > providing a new helper and convert a few users as an example.
> >
> 
> I like it. With an Ack from Linus, I can take the series through the GPIO tree.

Thanks, but note that I need to either drop or redo the patch 2/4.

-- 
With Best Regards,
Andy Shevchenko



