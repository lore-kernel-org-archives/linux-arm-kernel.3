Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25002E63F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SX/d54PXDjewqxCGR18EtEsbX5HuHmXdDmZUtDAJKY=; b=CQGf3RIpSCsr83to4VYJGkIVD0
	f776lKL/ZweHXF43OTETMEhtWouxBx811jMrE+w6gWz0IGiHEhTX2GXRsBTwS5eDSM5iB+oqX0QZy
	yMiKT0yiuqfuWMt54GHR8TQ6ELMrkxwMSRXEJyKbqomeN/1JlC4j9Xcx9wyythGOzD37WK08TkzMK
	irHRjLwejR6bt8tbQk2kRf2kEayrlS9FPC6LYL9oHc1ueq3WWvFko3PP8XncWAYlKPCse47VXpjPn
	rzP62FVsGTy8c4baVWWrp4cMhcBqMBKSA560AL1J8MlnQFxIVjcwEkfreljDclgWdOM9mOapjVgCF
	UOtCk4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtyn-000000068vT-06eZ;
	Mon, 16 Feb 2026 08:29:17 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtyi-000000068tt-0lP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 08:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5SX/
	d54PXDjewqxCGR18EtEsbX5HuHmXdDmZUtDAJKY=; b=amzlBXRg6ZSAHSuMwTK9
	fxzgQIr3ynoNeTpGYNEXubCW5Wi73ac6vU3LhKIl2+M2hard43Sl85cN5S95SR+D
	i1Z3J4ZR75SjEt+M+lSQbltf6/PsMlBltEfxAgnmXWnDY6PsGim6jK7QjEi3NQZZ
	WABZhMOCYalNPqAewYTbjLYK6a/ErIi89LTwUvur7Dlul5qbsYMFvxx706WkSzQq
	Hi+npE0Qpte9x7ho6NPYQ/SQdOos+iA25htIvjHEXdTa/DpAuELe8O6oV7NrtG2o
	s4pomPV4qsDjsTdc8SzTGY/Mg/2/p/Jfk1qBo+IM2mtYCc88jhCKkCzCSxRzniRT
	Hg==
Received: (qmail 3162847 invoked from network); 16 Feb 2026 09:29:07 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 09:29:07 +0100
X-UD-Smtp-Session: l3s3148p1@ObiYv+xK2JYujnu0
Date: Mon, 16 Feb 2026 09:29:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
Message-ID: <aZLVU9toZRX2vKX7@ninjato>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_002914_513797_DB5EEE2E 
X-CRM114-Status: UNSURE (   8.06  )
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


>    Don't you break the existing users of this API with this change? I see
> you're fixing them up in the followup patches but that's not how it should
> be done -- the compilation shouldn't be broken...

I am not breaking them. The helper is an additional feature and the old
way still works until patch 8. Until then, all users are converted.

I built tested it :)


