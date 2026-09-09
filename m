Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9845DC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBHCyyidJUAro23ju4IMIUDqTWZtl4Wqq8769jnU3UA=; b=2BPp/Vk8nMWuDIPcl1G4jU/uvI
	BF/drH+Ag7uQCU4XjuqELpCj/+xTt2oPUnG22ezeNqPnqQLYyfyYPe86fbeB3FV4w9AlwAok5AZYF
	qjJ3AOebsJLbi0zCbeVBazsU8fwR11xIn3PmB+hHjlaZ99kN2TNPcHXxTpFc83cLem1BZsyzvxND0
	tD2UF3pxDhSbsivCHKd4uPl5uIPqKf7MDOF5lb1gQJyKB+ZBPqwQ0QetCo+ZJfJcEARaTqNOQh6YN
	y+afcxITkg4NgscLraXxsC0zKT2BaC94wQnlhu8X8B6wHCpMClGhAFCXYIPWgDjBCL+0wnSb5VRMr
	SC9x9zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ech-0000000BIlu-1VT3;
	Wed, 09 Sep 2026 09:29:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ecf-0000000BIlZ-3LH3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 09:29:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YBHCyyidJUAro23ju4IMIUDqTWZtl4Wqq8769jnU3UA=; b=YFxQ/o4aUsvbc5AFaz5qKVongz
	50Bfz601wKCtBW6CKWTVtUuXOiH6uyqcujJPiAcTfrIzrwMfm16J0AJbgzONJBtrMLZlPF4Oel7WC
	iZ/5eLFYfh6d58PfM5BuWK7XSbtlGL2njN26bni4IaRChQu4+uS45H4RfIyVhOlB17oL/m6p5ZHZm
	LML05G7BCoBeWix2W+fLwTFPVMqfQGA3ENdQITHbc05F32aLc2ZzzkhgmKy6Sww8QYRSQz3bUNVq7
	l4J3DVjOjpO7YODipMAasLW4tnoxdu8DHd/r3EZYoayTtGfACn+sEJshQk+X6TjOf8HrqtnCWsPMU
	snMk6+rg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Ecc-0000000102G-2i6G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:29:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB2C01576;
	Wed,  9 Sep 2026 02:29:32 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 174D53F528;
	Wed,  9 Sep 2026 02:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788946176; bh=YBHCyyidJUAro23ju4IMIUDqTWZtl4Wqq8769jnU3UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnlZk8Bc/XKeil61O/z4hKox/RfFo/tBcfry3clDwaP29ttvrEzFTy+qZ4B7r+BbH
	 BBhP+tK5CW3qRGD7SQ0exGGP21UTBMhIKK3l2au2SIcEvxQAP0Q/1ZbAiY4TJKwdbL
	 ENoiJsagOIgPciAOcAHcXvf3Es1PZWxVDyegc2Y4=
Date: Wed, 9 Sep 2026 10:29:34 +0100
From: Leo Yan <leo.yan@arm.com>
To: yingchao deng <dengyingchao@kylinsec.com.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Miaoqian Lin <linmq006@gmail.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn
Subject: Re: [PATCH] coresight: syscfg: fix deadlock on device registration
 failure
Message-ID: <20260909092934.GD200420@e132581.arm.com>
References: <604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn>
 <20260908161614.GA200420@e132581.arm.com>
 <ACA6A9E0ED9B6395+1c28050a-b7f5-419e-be5d-e88010592ed7@kylinsec.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ACA6A9E0ED9B6395+1c28050a-b7f5-419e-be5d-e88010592ed7@kylinsec.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_102938_966819_0E0FD0F9 
X-CRM114-Status: UNSURE (   6.87  )
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

On Wed, Sep 09, 2026 at 09:34:07AM +0800, yingchao deng wrote:

[...]

> I'll send v2 with your suggested change.

Thanks a lot!

