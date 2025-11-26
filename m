Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5CBD10F33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QARiQahLhFMz4aPurOSQ8f1L3JzeTn8n1hLqA0l0wTA=; b=alzoSyzWaqrjlYpDSNcMXuZdk7
	BpvOS+7NWo/SKpM1/MgKyUEvjUZ73tKV3mVBCnJhw9r+92EZStxiUCVqBhrKgcGHSq/fp78vgKdWe
	tCY3zfDjNSufZuRSbAuT0rWl6Bnzz2Ld36KfHGzrBn/ePwpNNX8hviVrpmL2NYwcz5K3GbFM1Ukg2
	Jre4vpd+vg0wgw0/EiYZwAra7ovKUXWWHzPTx/v8LhCNxvDwzE+17AjJWa3eL6DZ3rOFGG7tQhqxS
	lB47XrLhrK5D5AgOkZ0PZd7Z7XkehExY5JOgPCyOo2AffRsgc54eB5a5MLlxzN9MyGvbSgb2JNmeB
	AZIdjCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEge-0000000Ez3v-1cxo;
	Wed, 26 Nov 2025 12:31:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOEgc-0000000Ez3j-49KU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 12:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QARiQahLhFMz4aPurOSQ8f1L3JzeTn8n1hLqA0l0wTA=; b=djwJHzKNWcZtEBs/eBoV90IvUx
	5/ZcECqNjlDLkgMTHoTXL2wx8KUhFPyJz/L9MZQUEradwnDoigl+hOeNrpM1IpfziNaExPim6zO4m
	3QVa11IM/4VSiTX7VdJSYOt01Qus9TDnUZi3CrSwnwFrgkyZT6/ukj2KDA7qsvNMRcuVpxO/XOUS5
	p9m4jeRKM9Hp19Mfmwpfjow8RqSnrNH5u98FeUsf+iHt7l+YC9lYqxZbVXi3H6vNrOg8kTO9yIPp+
	MZfMuLmbbJqYYoVx/3bQ6A0kKkGZTdNwVoVRlWs5iBgYK323vj5jY9kMozkPZ1+gGen0r3RHdOIk0
	39OcNb3A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODoz-00000007w4d-1TOG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:36:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6391D168F;
	Wed, 26 Nov 2025 04:31:42 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78E243F73B;
	Wed, 26 Nov 2025 04:31:49 -0800 (PST)
Date: Wed, 26 Nov 2025 12:31:47 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com,
	mike.leach@linaro.org, alexander.shishkin@linux.intel.com,
	pratikp@codeaurora.org, mathieu.poirier@linaro.org,
	gregkh@linuxfoundation.org, jserv@ccns.ncku.edu.tw,
	marscheng@google.com, ericchancf@google.com, milesjiang@google.com,
	nickpan@google.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
Message-ID: <20251126123147.GI724103@e132581.arm.com>
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com>
 <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_113629_607763_C0C41A46 
X-CRM114-Status: GOOD (  14.01  )
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

On Wed, Nov 26, 2025 at 12:11:05PM +0000, James Clark wrote:

[...]

> > This fix can still be applied to older kernels, but seems to me that
> > now might be an appropriate time to consider removing the ETMv3 driver
> > from the mainline kernel?
> 
> Yeah, if anyone is using it it would be on an old kernel surely?

We can confirm this in another way: if I don't miss anything, over the
past several years (since 2017), we have not received any questions or
bug reports based on hands-on practice regarding ETMv3 on the Coresight
or perf mailing lists.

Thanks,
Leo

