Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B1C8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1NgvuOJViNQoQa3YdxL37LV+10hlKR/k1LPKw76dTU=; b=2K0JD56ukGrBqnhNk7BxJ7yDiP
	rAzkVn/3++J9PHi9s98l1hBHowmA3fhXz1WsYyMs2tOc32wmPq8r/DovVY7FeNTDSnimNxbyk42ut
	uxdclbvnk5UeGipnyH+3dmYiJlJv1rZ76Dl8kHmVmYD7c/5BCuDgLNI3L+BLHF9+VRG65uSvPohCF
	wUUavP2BemBbzH4YPkxDNKGwVN1Oz7c6OQKnkPmdmVxdm8Y9pvWDTXRWBEZmcd4gb6rmboMa9D9KS
	Q6MG+viCpa6W/hLqMMrLzJgAyVk6L40IMxpNABZuAtkMRg82exRLSuaLhgv2t7aQpB3CUuKDbAaP0
	wzPgJ/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDkO-00000002CSi-2n27;
	Mon, 30 Jun 2025 12:36:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDDb-000000027uP-2NEi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 12:02:40 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UAmwnf029679;
	Mon, 30 Jun 2025 14:02:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	v1NgvuOJViNQoQa3YdxL37LV+10hlKR/k1LPKw76dTU=; b=D1hgo3sdFbaC2Bbs
	9lLvzpaYsrXuOOHj40rLw8GUtIv69bF8So+wuyY4i5FosAPKndrnwhtcTubgkesG
	csIa/1FLZkF6RZKb/OOaXseiCArM5OmD37WhIZ1Zqfk9vLAtvqYfnTI9sUhVULh9
	TmXkQVS7m2hYFDwlkSZky7qd0ZC/rmGeMtplj5c2oOcPavL9o8QZmMC9/U8LN4gY
	mJS4QjM9A5IPrYet6UyalO/UwZspUccurR++cth9P0Y73MpzwDRHSRymCf9G1LxP
	SLspA/qgYu9rujKTdNHXO+yFWu9XeTMDd0yadDs6S1T+Sly0nCl4nWgLCmcghLja
	nPr6Ag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jubnmt6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 14:02:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D0EA24004D;
	Mon, 30 Jun 2025 14:01:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E2415B2B8D1;
	Mon, 30 Jun 2025 14:00:51 +0200 (CEST)
Received: from [10.252.20.7] (10.252.20.7) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 14:00:51 +0200
Message-ID: <3d4d0eb4-a9ec-4fb2-be9c-4d8999cfeebb@foss.st.com>
Date: Mon, 30 Jun 2025 14:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: stm32: fix pointer-to-pointer variables usage
To: Mark Brown <broonie@kernel.org>
CC: Antonio Quartulli <antonio@mandelbit.com>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alain Volmat <alain.volmat@foss.st.com>
References: <20250630081253.17294-1-antonio@mandelbit.com>
 <5e61da51-cd02-41fd-9773-8bd776e1db62@foss.st.com>
 <192fb276-1e5a-4f69-8815-133f6bcd36b3@sirena.org.uk>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <192fb276-1e5a-4f69-8815-133f6bcd36b3@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.20.7]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_050239_871551_183A6780 
X-CRM114-Status: UNSURE (   8.15  )
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

On 6/30/25 13:20, Mark Brown wrote:
> On Mon, Jun 30, 2025 at 10:28:50AM +0200, Clement LE GOFFIC wrote:
> 
>> Thank you, LGTM
>> You can add my Reviewed-by
> 
> If you want to add a Reviewed-by you should actually write it out in the
> mail, people rely on tooling like b4 to pick them up.

Yes, sorry.
Fixed it.

Best regards,
Clément

