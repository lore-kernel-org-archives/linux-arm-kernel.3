Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDB5C71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dt8Ksd3h2FYmayz03UsrnSwEDKb105FJ+JFrE2T+WrU=; b=A59oBdK+xa/CFW2Ua5Tv7SF8SM
	thjWyHvpbcyTYtjnLiSP0Mt35geNqm4PsaMPLVQRYCCZw6wQ4gfDZrkaJ+kcvKmQVPVOPoIMkp/bY
	7nmmsxGUY+6uXvKqbbpfLm0FE8Xti8G8kaz/zA3WXOL3fm1JtD2ruHn52fOUF8AXD/5UskydEiNC5
	D898UokGZB5WtPY2o125WbdkGXg8dBllZM8TWHJ9pCl59nnIjvdgXh6qF+EliukthoLDgdF5UgcIa
	EHJPMP4XCWzjMv4hGssK5iFw3179J0XI++dkDJisuIbJOJQf+elpAkDZ/c6sSpYJ88/25NSYg2EsK
	M3me9bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRWl-0000000B1jq-3ctQ;
	Wed, 11 Jun 2025 19:54:27 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN7g-0000000ALL6-430x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749654738; x=1781190738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w50J13DoDa3ztdz0aJJJjIaFHSClneyL/iYpIIag/qs=;
  b=atsW6y3uLL7aaZCmvA+uPogMEimWE8GVPt4gdinmLHwfdn/P7MQwdqZg
   adQ2U5gNDVpeRwY+w9WJqECj2H4tRsrkTHhnZDsdtQ9phZ5AqjZhHvTpj
   Qaavvt+Oqq0fwOOxilsAvkwaPX5CWulopf/FyvYp73SB9Ff5DYADosLHS
   XwlIltQBKCrjL9dAOwiY/chtPkoSZp5jyHx2N8HrXX0LYNFhlDGn7OP4H
   MRMCBC2AFwoFWeH0Bubg5tbxYh/2/qyizdqXtpiRxdgQog5vFyJ/qq4rH
   CGVJDONpQSD+EGJcSpvrWE6FVBXQWg0jNQtOo5pzKNIaAzgiFyuqqc8mS
   g==;
X-CSE-ConnectionGUID: nJnq79jfQ2KBW9F/epya+g==
X-CSE-MsgGUID: LRjxs2nzQAuAN5jf3hJUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62083553"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="62083553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:12:16 -0700
X-CSE-ConnectionGUID: y29W/3r0RkKpTtbZaK2+RQ==
X-CSE-MsgGUID: h+7CkrccS1exPpWmkCy9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="184427637"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 08:12:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uPN7X-00000005gGG-2dL9;
	Wed, 11 Jun 2025 18:12:07 +0300
Date: Wed, 11 Jun 2025 18:12:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/33] serial: 8250: sanitize
 uart_port::serial_{in,out}() types
Message-ID: <aEmcxySiXun--YZs@smile.fi.intel.com>
References: <20250611100319.186924-1-jirislaby@kernel.org>
 <20250611100319.186924-9-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611100319.186924-9-jirislaby@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_081217_038722_070FB2E2 
X-CRM114-Status: GOOD (  11.26  )
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

On Wed, Jun 11, 2025 at 12:02:54PM +0200, Jiri Slaby (SUSE) wrote:
> uart_port::{serial_in,serial_out} (and plat_serial8250_port::* likewise)
> historically use:
> * 'unsigned int' for 32-bit register values in reads and writes, and
> * 'int' for offsets.
> 
> Make them sane such that:
> * 'u32' is used for register values, and
> * 'unsigned int' is used for offsets.
> 
> While at it, name hooks' parameters, so it is clear what is what.

At a glance this looks just mechanical change. Have you used coccinelle for
that?

As for the whole idea, I like it,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

...

> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>

These also can be moved under '---' :-)

> ---
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---

-- 
With Best Regards,
Andy Shevchenko



