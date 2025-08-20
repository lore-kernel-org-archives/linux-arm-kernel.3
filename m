Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E73CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkmTSU7V12H2RP8eqKNxvOFsCn0iEaIXoplURtUHu9U=; b=24HpGHo6eg4qLsSI36/x/pSXym
	8dezDajdalIsq4Pr/7F1Bsc7189zNurTlDLSxckVNAqPrh6ca/+EoZpqrnT3BpUDAbvtbh1nak4tY
	MezCNYRkgSyh8IZ+GL7UbnseG88zDGFyPPgnQPVq98J6JRJ5yy95SolZY4AK01Kt9GF4w74mUfxGT
	SABmTE7XHktS1pGeSdZsULiV0fKA9/mfX4nSav8XxXREAAFUtHGkqKFOpoOMOztW0qabMSxoqQjl5
	B2J0hC5827oks6UK9brJsknY15ScFbCJrIa6cidvoEVSfvujPbeECYsDwIXVaN/bp7JM4viUCdxRJ
	LxRVZnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotbi-0000000FM1t-2URu;
	Thu, 21 Aug 2025 00:56:46 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uop2e-0000000EnY8-1T1e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 20:04:17 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57KK444t3208698;
	Wed, 20 Aug 2025 15:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755720244;
	bh=MkmTSU7V12H2RP8eqKNxvOFsCn0iEaIXoplURtUHu9U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QYp5QdeHJ5z18pHvYsl9WkgxBXJm1xhOOjE4iAPTM0sGLzM3gx7h+6QRRF04qj5TE
	 SN1hvMCvvyuFNxMCCpFJJ3pwljgdgWN1h8G21qtl6M9T/lBlZ0L4CjKXhh6YF8A6/G
	 ZHk8yXB39IjDB3GEAf1Ph3s9d67DpCgksYApS/dA=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57KK444x1593271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 15:04:04 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 15:04:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 15:04:03 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57KK43Xm747732;
	Wed, 20 Aug 2025 15:04:03 -0500
Message-ID: <e11fd419-1095-471e-a57f-fc5ff7ce713a@ti.com>
Date: Wed, 20 Aug 2025 15:04:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PATCH: firmware: ti_sci: Add trace events to TI SCI
To: Jonathan Cormier <jcormier@criticallink.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-trace-kernel@vger.kernel.org>
References: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_130416_480438_0E50724B 
X-CRM114-Status: GOOD (  16.04  )
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

On 8/20/25 1:10 PM, Jonathan Cormier wrote:
> Add trace events to help debug and measure the speed of the
> communication channel.
> 
> Add parsing of the messages types but I am not sure how to parse the
> flags, since the REQ and RESP flags conflict. Left as seperate commit to

The REQ and RESP flags should be handled by different TRACE_EVENTs. Right
now you only dump the content of the response messages (the ones in
rx_callback), also tracing what is sent is just as important, so you
might want to add slightly different ti_sci_msg_dump EVENT for the
sending side which uses the different REQ flag parser.

Andrew

> make it easier to drop or make changes depending on comments.  The two
> commits should squash easily.
> 
> Nishanth Menon and Vignesh Raghavendra requested I send this patch
> upstream.
> 
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
> Jonathan Cormier (2):
>        firmware: ti_sci: Add trace events
>        firmware: ti_sci: trace: Decode message types
> 
>   MAINTAINERS                     |   1 +
>   drivers/firmware/Makefile       |   3 +
>   drivers/firmware/ti_sci.c       |  11 +++
>   drivers/firmware/ti_sci_trace.h | 146 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 161 insertions(+)
> ---
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> change-id: 20250709-linux_master_ti_sci_trace-91fd2af65dca
> 
> Best regards,


