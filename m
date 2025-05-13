Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//ZVoYJE5FD18K2yMTq+UkexofBXdKxadbPDKcichro=; b=oLUmiOiz63RN9w/YXv1Ly2IgXM
	m2T8yU8kTZY3+C+GyKDKQNYsUzCm/7QxQUcMAMjnyOD+G4lW3mSxS+IdcQxzswqtN00izC3g/NjGI
	WZGK7jNUa0RE/tESKcly4RdOxgPXYkFi2fglfzJcUZRtJyqIERAY3l6rrzwGl3rBO3VIsGsBeD04t
	MIaR5eKcA7p2cPH21foCr3QSy6GVYYjZ5hg1EtgjQmy8GwyjzZfTir69cSLHFm9FUJog7inci8MM9
	4aPFYr+F6S5FXCchqJJAXkcLGAubblAJoU77THQsHhXDF1yeSwWVKfLN5m+7dwYic79yEAAFfKMGr
	LPzNJsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmJ1-0000000ByEN-1ed6;
	Tue, 13 May 2025 09:52:11 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmGY-0000000BxeX-3ETE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 09:49:40 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D854pR017555;
	Tue, 13 May 2025 11:49:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	//ZVoYJE5FD18K2yMTq+UkexofBXdKxadbPDKcichro=; b=IT2YzIWZjRLdKVS9
	rlyeA1yMuLa8XBWwwcqFAxgUcIwADvUuuxavvDjRpzaEmDpI/V7NW8F1LhrVLZqX
	2gZ+f5kLliRBXV7KHmoCvfIomLp+YlegNvHTHAAtPAVxm0OMW4S9BuHOHdod6Rbi
	pM+7XKQHOuI2bVsSY8u8qDN8+h31XEPKNaEPXBHGKYokHObaxn2384Q+4Kv55OCS
	vKuIgnBAurajHWSGHl4nBm0a4LKbiVjWUxsATpr3mF+SDZBdu+/jzjWeDGliqBnR
	OiSLAeeudCEV21LJzimTxpFyigPgj9j+LtABdhFHtAPBRRL3349wOi+6EHRPCAlM
	IlhGCQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46huxab77e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 11:49:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 02C8240056;
	Tue, 13 May 2025 11:47:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92747B43F56;
	Tue, 13 May 2025 11:47:17 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 11:47:17 +0200
Message-ID: <c4a2ccb6-b052-4cce-8bfc-26bcae2a2e2a@foss.st.com>
Date: Tue, 13 May 2025 11:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
To: Mark Brown <broonie@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
 <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_024939_339737_3C85F5D2 
X-CRM114-Status: UNSURE (   7.54  )
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



On 5/12/25 14:11, Mark Brown wrote:
> On Mon, May 12, 2025 at 09:01:04AM +0200, Patrice Chotard wrote:
>> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
>> acquire/release mechanism which ensure exclusive reset usage.
> 
> This doesn't apply against current code, please check and resend.

Hi Mark

This patch has been submitted on top of reset tag reset-for-v6.16
due to dependency with new reset API devm_reset_control_array_get_exclusive_released().

How do you want to proceed ? Philipp can take it on its reset tree ?

Patrice

