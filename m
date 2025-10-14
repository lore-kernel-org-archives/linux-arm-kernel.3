Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28053CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu289ulcjdhzLLjVVVbG3pIUzUH7uYAXzZ5B+3z00fQ=; b=Ij8LrP0g+QWkOpf6YYgz/5V7Fa
	xauzfXobV7PkI3rdXbkIUsEEJaSpe9DYEr8uXa0C1XcsVanlWLR2jW+Za0xTwd+uFBnF2yuIWVPFZ
	hB2uC8eWA3W3BsbUwPONfNQFrbJlktYew4l2JfrtWfoZuly8ZaVZ3uqZ4KApNoshg+Dp4SKa4IIHQ
	qBrez3JMXd7Z8kyLcOh0O3FxWRcXpfGC9E7WuVRshxUzu9ZO5yfamjhSFZNqgEDtfyUrXepLSsRMN
	kKEzrP9VGjPSIhldVVNovEjeyT5JmFNXFQWihVp36VP37Yzz72FZ+BJQrbkYDsCje8ZmPAsHhH0RG
	iKroZ0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iEO-0000000H2JW-31PT;
	Tue, 14 Oct 2025 16:50:36 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8iEJ-0000000H2GW-2weF;
	Tue, 14 Oct 2025 16:50:34 +0000
Received: from [192.168.2.104] (213.87.128.219) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 14 Oct
 2025 19:50:16 +0300
Message-ID: <25e098b2-d786-437c-ad92-eccb90b148f7@omp.ru>
Date: Tue, 14 Oct 2025 19:50:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: 8250_mtk: correct max baud rate in
 set_termios() method
To: Fedor Pchelkin <pchelkin@ispras.ru>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<lvc-project@linuxtesting.org>, Eddie Huang <eddie.huang@mediatek.com>, Long
 Cheng <long.cheng@mediatek.com>
References: <3eb40848-3bec-42ca-845b-c66d4b53cedc@omp.ru>
 <20251014130050-5cdb9e464558d609872d38cc-pchelkin@ispras>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20251014130050-5cdb9e464558d609872d38cc-pchelkin@ispras>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.128.219]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/14/2025 16:35:15
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 197067 [Oct 14 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 71 0.3.71
 ee78c3da48e828d2b9b16d6d0b31328b8b240a3c
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;213.87.128.219:7.1.2;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_References_header}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.128.219
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/14/2025 16:39:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/14/2025 3:29:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_095031_967251_FBB5D825 
X-CRM114-Status: UNSURE (   8.05  )
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

On 10/14/25 1:07 PM, Fedor Pchelkin wrote:

>> Mediatek MT798x datasheets (that I was able to get my hands on) claim

   Thank you, Fedor, BTW! :-)

>> the maximum supported baud rate to be 3 Mbps, while commit 81bb549fdf14
>> ("serial: 8250_mtk: support big baud rate.") claimed it to be 4 Mbps --
> 
> At least MT7987A datasheet claims to support up to 4 Mbps, so I think 4 Mbps
> should be chosen for the upper limit.

   FTR, this SoC doesn't seem to be supported by the mainline kernel (looking
at Linus' repo, at least).
   I think, we should "parametrize" the max (and maybe even min?) baud rate
adding more specific compatibles to mtk8250_of_match[] (and probably setting
this parameter to 4 Mbps for the existing entry)...

> + added the authors of 81bb549fdf14 ("serial: 8250_mtk: support big baud rate.")
> to Cc.

  Just noticed that the author of this "wonderful" patch didn't even sign off
on it. "Excellent" work! :-/

> --
> Fedor

MBR, Sergey


