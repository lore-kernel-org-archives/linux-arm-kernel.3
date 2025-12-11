Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCC1D41C12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALPKJzUlnZXJ/6gjqQ6arOHkYaGm2gRES/mST2IfNSU=; b=yJFk/5zFDgOArzfb8+r228UaEf
	7KHIo2ioELGCQSUwlEf7wViMwInLLmSpVGaf1gm4m/7NTBLh/5QCNy6l9PFUXstKKrg/As+V4/jnq
	3uXNtOvbaLST29RfjAzsLMEFO/HXWtg+uHnME2VQnEsv1NvlAGg76AQ2CAaScZkm7gYxO+/eCF2RI
	rZtV95QRBTeQyzCN4HpOEearNJzytwL3hn0neuabAohC06RtTSbFSWLKUjW++NN4i2u5S4Ssj8OIj
	drp93GoPf6eO5tRVKuKYPMY8BBJhFbCfUa41xQDyrRWNhdlE4aZGhWG0x5RQxUB+XaySGVumU32Wh
	7PY+79Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdKB-0000000GSZW-2ozr;
	Thu, 11 Dec 2025 09:51:03 +0000
Received: from mail-108-mta50.mxroute.com ([136.175.108.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdK9-0000000GSYu-0wPT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:51:02 +0000
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta50.mxroute.com (ZoneMTA) with ESMTPSA id 19b0cd2146e0004eea.003
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Dec 2025 09:50:53 +0000
X-Zone-Loop: ae36e92b66566ed1294a86496055afb36bf6d1e30475
X-Originating-IP: [136.175.111.3]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=josie.lol;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=ALPKJzUlnZXJ/6gjqQ6arOHkYaGm2gRES/mST2IfNSU=; b=nha09h
	LS2BhKjpPdEvWYr0kS40R/OYJC5iH2/za39LA5ae0ydQIrFIOz/DbmPNsBvBoF39j0IHs3+hPx8G5
	RWuvDnZiL3zbji7fPw2osAmljWF8D5xqLlcp0TDqSiZ4aS2XfvhxuNudLBmhD/i+LbrUdqWVwr+li
	lrpkwfYR8/whWTesK7WREfS9cJt+q5Sejn+ewIK9KRBIC+nyWM/EOMzBHz6CqbNdMq/slwpLZQLYR
	ggl+XMHq4EBDIMtbgoR2XlWzv/HazCU4N6ApW0OWR69NWMGEh25XLe75lK9uB4gRLwSk7FfQsx41B
	qHaP0OO/IyRIXYmt79W54+pce5gA==;
From: Josephine Pfeiffer <hi@josie.lol>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: ptdump: use seq_puts() in pt_dump_seq_puts() macro
Date: Thu, 11 Dec 2025 10:50:49 +0100
Message-ID: <20251211095049.182437-1-hi@josie.lol>
In-Reply-To: <20251101210201.43210-1-hi@josie.lol>
References: <20251018170416.3355249-1-hi@josie.lol> <aQNyaoXKsMdkIDrc@willie-the-truck> <20251101210201.43210-1-hi@josie.lol>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: hi@josie.lol
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_015101_357991_51C2D5C8 
X-CRM114-Status: UNSURE (   5.14  )
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

Hi Will,

Friendly ping on this patch. The s390 and RISC-V patches from this series
have been merged to master. Is there anything else needed for the arm64
version?

Thanks,
Josie

