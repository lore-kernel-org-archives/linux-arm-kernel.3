Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE06E63F37
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 08:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL+/9I91y9/qc1bj5//jj3ZkjEziQ9/vnFv+9ooOS+4=; b=rRSVl4A/RAFy/2XyWT0lrYjnbx
	wg6VBv14ucuX/bMXYN/qjnbMaJHi2upZf3sbvv6NPe22HvKrvpXv7UaiSz5KWartj13l+g/egYnb3
	Is7BmazHQ1YN7FZdh2KaPEN79AOnJ/7bHZ3UXEy4skeL08K4+CG6p5B7hwYS7bhP6rhqUsQHKIQ8Q
	bMn2ZHJAy1XQsPc8p8manGwKIIwYS7ZKhDlZaOSIcJwxv9mVLgNHcRqcImJrvOqwdUhUO9IKfjzff
	UZa6fG1W2S5Or9YwmlprHyPLKMarQMYI37rIJ7WB/BMLD3b3Fksmk8elaQWTHZJOXeVyeiUH3kO6b
	i0Ie6ONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtcI-0000000675j-3iIE;
	Mon, 16 Feb 2026 08:06:02 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrtcG-0000000674m-0yfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 08:06:01 +0000
Received: from [192.168.2.104] (213.87.133.175) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 16 Feb
 2026 11:05:33 +0300
Message-ID: <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
Date: Mon, 16 Feb 2026 11:05:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	<linux-renesas-soc@vger.kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
	<linux-remoteproc@vger.kernel.org>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.133.175]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/16/2026 07:49:18
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 200515 [Feb 16 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 87 0.3.87
 7430d8ffafccd8879e1d8370e5b501352446c2ba
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.133.175 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.133.175
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/16/2026 07:50:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/16/2026 7:04:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_000600_283172_838D415E 
X-CRM114-Status: GOOD (  12.11  )
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

On 2/16/26 1:54 AM, Wolfram Sang wrote:

> To hide internal core structures from providers, a callback is added to
> the ops which allows to set the 'priv' field of a hwspinlock. It is
> called when a hwspinlock device is registered and, thus, iterated over
> all locks. The register-functions are also extended to pass a data
> pointer to this callback, so it can do necessary calculations for the
> priv field of each hwspinlock. Providers are converted separately
> because these changes need dedicated reviews.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

> --- a/include/linux/hwspinlock.h
> +++ b/include/linux/hwspinlock.h
> @@ -30,7 +30,7 @@ struct hwspinlock_ops;
>  void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
>  struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
>  int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
> -		const struct hwspinlock_ops *ops, int base_id, int num_locks);
> +		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
>  int hwspin_lock_unregister(struct hwspinlock_device *bank);
>  struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
>  int hwspin_lock_free(struct hwspinlock *hwlock);
> @@ -49,7 +49,7 @@ int devm_hwspin_lock_unregister(struct device *dev,
>  int devm_hwspin_lock_register(struct device *dev,
>  			      struct hwspinlock_device *bank,
>  			      const struct hwspinlock_ops *ops,
> -			      int base_id, int num_locks);
> +			      int base_id, int num_locks, void *init_data);

   Don't you break the existing users of this API with this change? I see
you're fixing them up in the followup patches but that's not how it should
be done -- the compilation shouldn't be broken...

[...]

MBR, Sergey


