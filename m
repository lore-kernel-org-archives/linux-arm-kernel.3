Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A930E81A3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bVBWu/12gkNdS8N3cdcsJbbEsD78jPXm2vOBUlvAAM=; b=ms3BkBa6n3FU+1JPQvq1rv9GZa
	G0up2GtZRMEMxD8U1ySw+iyy1Pk6CnfNc+sn/QgePICvttReTj/k0UrJ63R4RxjT6m1d0QoqqDn+p
	+xTu3yMEa8oFdSlMaDDfKejJfL71jNTjPnIqpYHCjh+j5HcW3TQn0MeuIK5JLcpXpDsN5hxmEf8BK
	NXKOuSaTv4T6pbW3FibVtXzwGY0MxTJKNOjvkZeSjgeHU0Qbys9XuYVqBhH3rHqVw/fB13Ytnng57
	ajlMZd6mCgDhjNJvH9UaVZAVaB6qEQGYTeP/MN2URSuZueSscccYv3dTNhnirCmgr6JOt2bAU6Ewn
	Ds/eBn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1D6-00000006yuE-01HU;
	Mon, 16 Feb 2026 16:12:32 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1D3-00000006ytr-0IMd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:12:30 +0000
Received: from [192.168.2.104] (213.87.162.64) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 16 Feb
 2026 19:12:15 +0300
Message-ID: <5416c451-43fc-4feb-b3be-6d6754720884@omp.ru>
Date: Mon, 16 Feb 2026 19:12:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: <linux-renesas-soc@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@intel.com>, <linux-arm-kernel@lists.infradead.org>, Bjorn
 Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, <linux-remoteproc@vger.kernel.org>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru> <aZLVU9toZRX2vKX7@ninjato>
 <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
 <aZL3M6hT45I2WUaQ@ninjato>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <aZL3M6hT45I2WUaQ@ninjato>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.162.64]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/16/2026 15:40:03
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 200548 [Feb 16 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 87 0.3.87
 7430d8ffafccd8879e1d8370e5b501352446c2ba
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.162.64
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/16/2026 15:43:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/16/2026 3:38:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_081229_116380_F0665473 
X-CRM114-Status: GOOD (  11.43  )
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

On 2/16/26 1:53 PM, Wolfram Sang wrote:

>> Is that the statistically most-used response to that question? ;-)
> 
> That I don't know. I just know that I did build-testing for the whole
> series and the buildbots reported success. Need to look up why this was
> not caught.

   Maybe it just built the kernel after applying the entire series? :-)

> Sorry Sergey, you were right...
> 
> Hmm, so is merging all the user-conversion patches into this one an
> option? Maybe the RFC here can be reviewed per-driver and the real patch
> set have this all merged?

   Perhaps you should update the existing users to just pass NULL as
init_data in this patch, and only then do the full-blown updates of
the individual drivers?

MBR, Sergey

