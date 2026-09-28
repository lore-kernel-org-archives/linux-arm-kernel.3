Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A5AC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0pjlC9s2ArhYjQY1ae0MzGnNdrjLVGIM+GY+diDyYM=; b=Y4zi+1H9t4jyeZjoYlCwc/kwFS
	gaAMqwCkrOk45nP9sh5h0y4/XoO6GTikUwC4grig/F5Fk+gXm4/LtmcXXfilayJKlSVOfxiyehgEs
	2+KSpyXw9r+GCHCJXCrAQNsDmrnBCbndwuebN2eIysxkHUYGQUvkZE7sHjmRYcT6UxMkt7d13cLUH
	UzHq/4J7zQxZwGDbaoc9AoF4tIQ9D+zDwNiUo6TEphbQuJQOJpQA2EvSl0dQxgfoZw7tivqfVaAnv
	mhyXuwRjUTJU2JtUTXVjRnlWfSaLzsIulLpWr5rLe4J9qstJFsJCJu6j/DN8Uqsk7EiMraIbMueWZ
	HPQmIgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6sJ-000000006lI-2OjU;
	Mon, 28 Sep 2026 08:38:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6sH-000000006kr-1QzL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:38:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A011570;
	Mon, 28 Sep 2026 01:38:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 474163F86F;
	Mon, 28 Sep 2026 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790584691; bh=w0pjlC9s2ArhYjQY1ae0MzGnNdrjLVGIM+GY+diDyYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGfBwdWdd4BK9b9ZKua51uLgASRtHck2xx2qZ3pOBeN7oSUS2hPM7X9B7akmdo6Jj
	 759Ti9E7kSVVuXbAvtq/m8JZpdU2ONuY4llhKT18v/phPVM5KLnbVlcJDRin/CCeE/
	 OtxvkP+PN/F+91foYbOxKyoUDqzwB50Lhm1B26JI=
Date: Mon, 28 Sep 2026 09:38:09 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao deng <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device
 registration failure
Message-ID: <20260928083809.GC14479@e132581.arm.com>
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
 <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
 <20260924162404.GN200420@e132581.arm.com>
 <E6F9385348472E5C+1794efa3-5320-412a-ae81-cfcc4969b76a@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E6F9385348472E5C+1794efa3-5320-412a-ae81-cfcc4969b76a@kylinsec.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_013813_421006_94035E4C 
X-CRM114-Status: UNSURE (   7.84  )
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

On Fri, Sep 25, 2026 at 10:40:22AM +0800, yingchao deng wrote:

[...]

> > @Yingchao, do you mind to work out a formal patch for this?

> Happy to. I'll send the patch.

Thanks!

