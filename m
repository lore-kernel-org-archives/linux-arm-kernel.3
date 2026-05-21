Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71769CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQNSCTh24/TxAkpNclCRhegFcgT71o0jMtEZ8taZbrc=; b=BZWKyM6QgdRDOUGHtEyi8lg9Z4
	BPAa1KhN7ZdmQCXA1jYpglYMziayaew1uHIEWVRlgB7xHWL8w7qs7UXuvlo+u8nfI8tXaxL1NPSS/
	XdIHIO5pFvXMSNj7apihSDwWgZrujXKfwaXGunTdpdx4imt0pFw6vInaop7OLv52Mzqnp8dHowjuy
	BleoyFP8QElX2WB+51HKG71xRerSXjrfjCtrXj6pMB22CZjSmZEstq5/SqYt1n3qZj5B9qnmFOb19
	Km66JLMgjnqyEA/DFr/Bv1DGq1N4d9wPjii2peyCyxwORD36e3I3gprwda2BP5uNJh1VG1XXxr7UT
	jCRVcrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzd1-00000007IOr-3T25;
	Thu, 21 May 2026 09:23:43 +0000
Received: from smtp1.tecnico.ulisboa.pt ([193.136.128.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzcy-00000007IML-28al
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:23:42 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F36F1600300F;
	Thu, 21 May 2026 10:23:22 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id X5vN4DKspH5q; Thu, 21 May 2026 10:23:21 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id E0B1D600300D;
	Thu, 21 May 2026 10:23:20 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1779355400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQNSCTh24/TxAkpNclCRhegFcgT71o0jMtEZ8taZbrc=;
	b=jngC8ob9ah2AEwzTgyCuZNkzZjVq3WfouXc91sT//xjgQ8Wg7QYm4XuyEH3FsRQ4jU8RE/
	tkNGbG9S1tBN1TWHRLpoow0ulXeLvJ6DztetAG6tufeOjx1rX6yejqa3KgGseL8yZYe4a/
	PQvN2P7sKyqvha0VpiRd2Og0xE7qKoiNzFyxiOK/rKlZH9R99So3YVGmkczatvWXpwsJb7
	1nDFe3mgPgBhGDKu84f+fQ+9kGA03re5vHmrZVQkpKB4i0mt2rtJOLRpbGeXD73SJT583A
	gyZPAUBG2nohB5VrY8b8N0iTpsUSG/zeMOwbu3ZEX6rlNJQgGmKIIrBcvNhB/g==
Received: from [192.168.96.1] (unknown [89.214.153.114])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 245FF360257;
	Thu, 21 May 2026 10:23:16 +0100 (WEST)
Message-ID: <367bb557-81a0-4286-8788-0e7272cc4d02@tecnico.ulisboa.pt>
Date: Thu, 21 May 2026 11:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mfd: max77620: override PSCI poweroff handler on
 Pixel C
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-3-30f9a4688966@tecnico.ulisboa.pt>
 <ag65LXrLLbbeTbTb@orome>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <ag65LXrLLbbeTbTb@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_022340_694385_26DD62AD 
X-CRM114-Status: GOOD (  13.58  )
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



On 5/21/26 09:52, Thierry Reding wrote:
> On Thu, May 14, 2026 at 04:47:21PM +0200, Diogo Ivo wrote:
>> On Pixel C, shutdown must be handled by the MAX77620 PMIC rather
>> than the PSCI SYSTEM_OFF call, whose firmware implementation is:
>>
>> __dead2 void tegra_system_off(void)
>> {
>>          ERROR("Tegra System Off: operation not handled.\n");
>>          panic();
>> }
> 
> Ugh... sounds very familiar. We have similar stub implementations on
> Jetson TX1 and/or Nano, if I remember correctly. Luckily newer platforms
> seem to have proper implementations for these.

Yes, on my TX1 I was encountering the same problem. However in that case
is it possible to update the firmware with a proper implementation?

> Thanks for doing this. I might want to take inspiration from this for
> these older Jetson platforms.

My pleasure!

Diogo

> Thierry

