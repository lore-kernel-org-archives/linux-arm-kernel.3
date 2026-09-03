Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F079C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BDHs2uvacSCVRlDdVEf0gLdubQ6czvAjQZ1j9P+AtI=; b=N91HtYlVl8H6EjiZqB7EVMjhY+
	eswhq9TrJsb+T1rEGUeQnBKN2DdcR5u9GMYPnDHI0v9OYZCG8LHUaqrDBIMDw0yP2AMZKPnUEJH0Y
	jLHKdz4T7wgcP9mJiGIpv3ATy+TnoQqu+Hxt13MIMmbOYClV/n95MFlgvP73IV0/RI1OGQ1pv7Y5X
	/tXBuuAkdySGae8noWrr0NE/SJ6Lqwi2i7WjgAeL4SzWKCZj6rX7+IzpCTmcekkqfoDrYj9O+Hp7m
	8NatALc70n1uhnqtw69QrZFx+Q2+urwuFoqFgmKT/jpSQpcqEb1TWTroHngF+BYquaAzR3GmPdAfM
	OgNX8OXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2236-0000000GcQS-2wUy;
	Thu, 03 Sep 2026 07:39:52 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2234-0000000GcQ2-0IuZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788421190; x=1819957190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uDHW7C6c0VOUhhvrt2S3Sz5WaioyN/0J8ywzbnxIHKc=;
  b=grxGfyimGERxtjhwG7coz1Du1Sjkmv4feOWFKSeItL1vyFKr21+kNvgW
   vEtyhkxI0YB9ULm1kSBAi3Rs0Q/HHvq/kBa+stfJzZkpD3PdMGqvXpRXY
   ZkBLqBTM71iD1YdMsEDfLkV/ieCw9PB2GvgMQ1+PtQS8B/F0fxVjmE+ZA
   t36SbiUophEilR5bm8/ue6+ZJCzvKtRpB/uPA4VTI6iryYcrfKuksd1GE
   vObNXoOViMMMHE66svAVZd0HSWiMdO/2IWGY9MbYRe3cDA/Nrwg+2/zmA
   urgJ8pRqTrtSQ63/azCSSUh1jRmzlXqYuk5yjE9TV8N37wCw74H6QQRs2
   A==;
X-CSE-ConnectionGUID: QP5jQBe3Q7OMjeslWHpFhA==
X-CSE-MsgGUID: 0ib0vS7cQ6+ve5xYGmD3/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92763143"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92763143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:39:49 -0700
X-CSE-ConnectionGUID: wX/kLpurT4GA48XlHGT6+Q==
X-CSE-MsgGUID: BAcaZdMqSsupWnZm0UCY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273797726"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:39:46 -0700
Date: Thu, 3 Sep 2026 10:39:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Walleij <linusw@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Subject: Re: [PATCH v2 09/12] i2c: designware: no SMBUS_READ_BLOCK_DATA
 without EMPTYFIFO_HOLD_MASTER
Message-ID: <apkkQFFbPhZl9-Ec@ashevche-desk.local>
References: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
 <20260903-i2c-fault-reporting-v2-9-fedeb91792e6@mobileye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-i2c-fault-reporting-v2-9-fedeb91792e6@mobileye.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003950_145395_FE310A98 
X-CRM114-Status: GOOD (  13.08  )
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

On Thu, Sep 03, 2026 at 08:38:16AM +0300, Dmitry Guzman wrote:
> Controllers without EMPTYFIFO_HOLD_MASTER feature cannot hold bus with
> empty FIFO. This makes impossible to issue SMBUS block read command:
> it is not known how many bytes must be read until it reads the  first byte

Too many spaces.

> indicates the data length is read. Without EMPTYFIFO_HOLD_MASTER, when
> the first byte is read, TX FIFO gets empty, this causes STOP condition
> and the transfer is terminated.
> 
> Reset SMBUS_READ_BLOCK_DATA bit in functionality mask on such controllers.

...

> +	/* Controllers without EMPTYFIFO_HOLD_MASTER feature cannot issue SMBUS
> +	 * block read because after reading the data length FIFO gets empty and
> +	 * STOP is generated automatically
> +	 */

/*
 * Please, use the regular style for the
 * multi-line comments. This reply can be used
 * as an example.
 */

-- 
With Best Regards,
Andy Shevchenko



