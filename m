Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFDC88E54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 06:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EC8BKAcsOpPPEJnArc9xnjKjZWetOeHuGnnD7Ed12Mw=; b=j7+0DmiC+cwUXlHkKsnlAQnbXF
	+J5SZMW+bjBUSYWBL4u3wBhUiTBuTlPxiAKBzx0smW5veO30yb1Gb1m06kkrgm92JdOpn2E+97MS0
	nopQGQfRLgEHST+B3NphAvn2WfVNFdnhmkDGU4TCpWOFQAeH2JWZpK4nEgKhaVQpn9HySlZtrG3hR
	iQpvWloPqTH3MQQoOF+pxakjbFBSv67qNDUgKQBhRTDhStCApx0ubsaj5hHK5pWkPLK2FCLe+SbHH
	9WgoD7rEOA9Nzxzk5N9Nn8mmC90WMqQWV/5oAdeF4jttKDSkAZt3zGcD9GzXbCVQq1OgklgZy7CFz
	0yPDrLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkGAA-0000000BzxF-1xes;
	Mon, 26 Jan 2026 06:33:26 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkGA7-0000000Bzwt-37TB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 06:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769409204; x=1800945204;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=EC8BKAcsOpPPEJnArc9xnjKjZWetOeHuGnnD7Ed12Mw=;
  b=ZSJ3jDdf3oEOVRsf9CpD9q0buYaIuWxiBD2orvIWLTjQtiynf2DzjmOv
   jhCe8gWC1OXg3apQZseYVE33Rxg6ieNfEyoHwX3paWusIYmvjm0k46p/Y
   CX71do62Lj9ejrlOC9UsGtYY+atDR3JXO2mZxe5pv/pRWYhCl7JbILT1U
   JIPvO1cqTBJO1Y0QWmlJAcYjYhdwq0pVn0tzIFEXCdec8Tw0CvenwCwt+
   40yFa28o+wF7msOM5Y8pYWVVZOi4cOeZTNF9Bz3i+/uCR7xwT7OOtH1tL
   3lI6GzwFc/3+Pzek+VIebELLzYaI+YA2xMDPl7fFmky1cmLxXX298xDZ2
   w==;
X-CSE-ConnectionGUID: WCx5abhSS4WE9aeMLcKoZg==
X-CSE-MsgGUID: T4PPgGf3Ty2e6ufLNXw/oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="69781391"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="69781391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:33:22 -0800
X-CSE-ConnectionGUID: n0sG5d3HRQyuwMJyVlKMkw==
X-CSE-MsgGUID: 9Wdpytf0Qe+sxOQbP03XpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="212465698"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:33:20 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexander.shishkin@linux.intel.com
Subject: Re: [PATCH RESEND] stm class: Remove unnecessary local variable in
 stm_write
In-Reply-To: <20260126004312.210402-2-thorsten.blum@linux.dev>
References: <20260126004312.210402-2-thorsten.blum@linux.dev>
Date: Mon, 26 Jan 2026 07:33:18 +0100
Message-ID: <83v7goano1.fsf@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_223323_807068_6040567F 
X-CRM114-Status: UNSURE (   5.64  )
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

Thorsten Blum <thorsten.blum@linux.dev> writes:

> The local variable 'err' and the corresponding if check in stm_write()
> are unnecessary. Remove them.

Nice catch! Is this a result of manual code inspection or were any tools
used, an AI agent or a coccinelle script or whatnot?

Thanks,
--
Alex

