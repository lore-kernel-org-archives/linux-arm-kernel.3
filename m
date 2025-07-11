Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76164C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcgRkyxo9E7UnokfhANIlL1J4t9z0TT6l/cY+hvpOeM=; b=PHS/Qm56Emqz7h7vRhOjAgDbrG
	Nc1kjIULILPvKwqEmphvWgnckO+CMMLy3lUzCW4fqUVLFmAuKyFF9WPsR6/aZ5GpezqxAryzLeIO4
	FUz/80JCPAa5NMNfsVxkc0PqKl0/OW+XIGCg8yrZ1lE0E88X1s5BNjL25ebZ9lEoRLP7TvNvDls8V
	23fGS0t1xanwWlmIWOVlcI6Ni03wXjRQsnQf7bDja62W4AO2HsXwVEhTCtTamfW0iWo50h2a2eOEE
	o2kx8YMDm8nPHjezAHGm/TNsvWm/gFFxgTKaj896fwnav+ZQiYV4bYiUbeSFFb7dX2szUAIDnnZwI
	jChGhMMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGYQ-0000000FHFH-2uIt;
	Fri, 11 Jul 2025 16:24:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtR-0000000FAwq-1Y7K
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 15:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AcgRkyxo9E7UnokfhANIlL1J4t9z0TT6l/cY+hvpOeM=; b=SurklKqiaobfZ3pHJNv9TscSef
	gZ71Y7M+o1JWfX3s/eLJFKVCW6dKLfU4O6YDaw/ggmrEZDbGTmV/6Tc9ewcmIvyITWnw16OMKmlWy
	lmAWwNo5pK7IFqjc06xfGFp+NxKDDsCIeKSAPKsAMc76P3qHp11rkOZMpMZwLp0SQuOUAuwc+OUcr
	Kkq+45Gl4z8LFHfKwADZBvTIAIYNFSj9e0CEqXHOYOluDLTQ7pUw/v/H4AAsgr+Le9f2cUhVjH43k
	6FIu7h84gL5tSJnvSdmP3s2OA/QdlwUVXaCLpgj0cf47FJWj/KjaqBA3qJ61ITxv5TvgNfjhN2Z8b
	fo6/Buew==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFtM-00000009Iox-2Iad
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:42:32 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdwqT1jQ0z6L56x;
	Fri, 11 Jul 2025 23:39:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A774D140279;
	Fri, 11 Jul 2025 23:42:19 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 17:42:18 +0200
Date: Fri, 11 Jul 2025 16:42:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Koichi Okuno <fj2767dz@fujitsu.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	Gowthami Thiagarajan <gthiagarajan@marvell.com>, Linu Cherian
	<lcherian@marvell.com>, Robin Murphy <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Arnd
 Bergmann" <arnd@arndb.de>, "=?ISO-8859-1?Q?N=EDcolas?= \"F. R. A. Prado\""
	<nfraprado@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, "Peter
 Zijlstra" <peterz@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] perf: Fujitsu: Add the Uncore PCI PMU driver
Message-ID: <20250711164217.00006ea7@huawei.com>
In-Reply-To: <20250711071404.2138816-3-fj2767dz@fujitsu.com>
References: <20250711071404.2138816-1-fj2767dz@fujitsu.com>
	<20250711071404.2138816-3-fj2767dz@fujitsu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_164229_006744_CB07E44F 
X-CRM114-Status: GOOD (  10.66  )
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

On Fri, 11 Jul 2025 16:13:40 +0900
Koichi Okuno <fj2767dz@fujitsu.com> wrote:

> This adds two new dynamic PMUs to the Perf Events framework to program
> and control the Uncore PCI PMUs in Fujitsu chips.
> 
> These drivers were created with reference to drivers/perf/qcom_l3_pmu.c.
> 
> These drivers export formatting and event information to sysfs so they can
> be used by the perf user space tools with the syntaxes:
> 
> perf stat -e pci_iod0_pci0/ea-pci/ ls
> perf stat -e pci_iod0_pci0/event=0x80/ ls
> 
> FUJITSU-MONAKA PMU Events Specification v1.1 URL:
> https://github.com/fujitsu/FUJITSU-MONAKA
> 
> Signed-off-by: Koichi Okuno <fj2767dz@fujitsu.com>
Hi.

As much comments would be much the same as on patch 1
I'll wait for v7 to take another look at this one.

In general both are really clean drivers so just minor stuff
to work on for v7.

Thanks,

Jonathan


