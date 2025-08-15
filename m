Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1E8CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujZTeyp36GivflKH7z0OobpxvAAGq+Y2WeKFyr8trts=; b=NXZfY6kUrciRXcO+IgulpKTHIQ
	0nSCYgc7GTDrfHCmKERjPS579ChC3gtRv8WpD226CpTmqhF7fFOqd1he1LaZ3dr5L+95OY5nbpdUb
	z2cB9JjrSetkvsbttxQ2ErYQm1AV/CLSxpHaWa6SXlru+6jmViAzO5E9PdYlvnBpJd5GZYEi+GubD
	xFNiosKMmnUHlMe/31cqkaCKGUCDl8Z32D6IEGgZw/ywNf+GrTQIATkFQDpjduPQwjsTxs7xSMBrG
	Mmsg5y0W2LG9P7GkqpfGqfLZ0y41MdSQoUlu8+m6c8/SO18EQJ2VCTKv1SxXIZQPIYvHmqgWusPXW
	j8LLUj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyFw-000000037jj-4A4T;
	Fri, 15 Aug 2025 17:30:20 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwik-00000002t6q-2fIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 15:52:00 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c3RNw16jZz6L5R0;
	Fri, 15 Aug 2025 23:49:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B3A4C1400CA;
	Fri, 15 Aug 2025 23:51:51 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 15 Aug
 2025 17:51:50 +0200
Date: Fri, 15 Aug 2025 16:51:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Robin Murphy <robin.murphy@arm.com>
CC: Koichi Okuno <fj2767dz@fujitsu.com>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Gowthami Thiagarajan
	<gthiagarajan@marvell.com>, Linu Cherian <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Arnd
 Bergmann" <arnd@arndb.de>, "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado"
	<nfraprado@collabora.com>, Thomas Gleixner <tglx@linutronix.de>, "Peter
 Zijlstra" <peterz@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <20250815165149.00004d60@huawei.com>
In-Reply-To: <ea3fda8c-2b7d-4902-9bda-d97d7b090cff@arm.com>
References: <20250815034751.3726963-1-fj2767dz@fujitsu.com>
	<20250815034751.3726963-2-fj2767dz@fujitsu.com>
	<ea3fda8c-2b7d-4902-9bda-d97d7b090cff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_085158_820397_CA22AEA1 
X-CRM114-Status: UNSURE (   9.12  )
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


> > +static struct attribute *fujitsu_mac_pmu_events[] = {
> > +	MAC_EVENT_ATTR(cycles, MAC_EVENT_CYCLES),
> > +	MAC_EVENT_ATTR(read-count, MAC_EVENT_READ_COUNT),
> > +	MAC_EVENT_ATTR(read-count-request, MAC_EVENT_READ_COUNT_REQUEST),
> > +	MAC_EVENT_ATTR(read-count-return, MAC_EVENT_READ_COUNT_RETURN),
> > +	MAC_EVENT_ATTR(read-count-request-pftgt, MAC_EVENT_READ_COUNT_REQUEST_PFTGT),
> > +	MAC_EVENT_ATTR(read-count-request-normal, MAC_EVENT_READ_COUNT_REQUEST_NORMAL),
> > +	MAC_EVENT_ATTR(read-count-return-pftgt-hit, MAC_EVENT_READ_COUNT_RETURN_PFTGT_HIT),
> > +	MAC_EVENT_ATTR(read-count-return-pftgt-miss, MAC_EVENT_READ_COUNT_RETURN_PFTGT_MISS),
> > +	MAC_EVENT_ATTR(read-wait, MAC_EVENT_READ_WAIT),
> > +	MAC_EVENT_ATTR(write-count, MAC_EVENT_WRITE_COUNT),
> > +	MAC_EVENT_ATTR(write-count-write, MAC_EVENT_WRITE_COUNT_WRITE),
> > +	MAC_EVENT_ATTR(write-count-pwrite, MAC_EVENT_WRITE_COUNT_PWRITE),
> > +	MAC_EVENT_ATTR(memory-read-count, MAC_EVENT_MEMORY_READ_COUNT),
> > +	MAC_EVENT_ATTR(memory-write-count, MAC_EVENT_MEMORY_WRITE_COUNT),
> > +	MAC_EVENT_ATTR(memory-pwrite-count, MAC_EVENT_MEMORY_PWRITE_COUNT),
> > +	MAC_EVENT_ATTR(ea-mac, MAC_EVENT_EA_MAC),
> > +	MAC_EVENT_ATTR(ea-memory, MAC_EVENT_EA_MEMORY),
> > +	MAC_EVENT_ATTR(ea-memory-mac-write, MAC_EVENT_EA_MEMORY_MAC_WRITE),
> > +	MAC_EVENT_ATTR(ea-ha, MAC_EVENT_EA_HA),  
> I firmly maintain my opinion that if this is the only place the event 
> numbers are referenced then the extra layer of macros actually makes it 
> *harder* to read and follow, compared to simply:
> 
> 	MAC_EVENT_ATTR(ea-ha, 0xa0),
> 
> but that is very much just one reviewer's personal opinion :)

I'll second this suggestion!  I failed to notice they were only used here.

Jonathan

