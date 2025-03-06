Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F06C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F58zD1KPXjvS97YM9EyLtNejKNfhEHL4YP2fhCSVYAI=; b=iSIUoqSPO3V7tM
	guhx3FEUrfHcgGaAGy1+zZ05jOxoF5HG8TxTjetkXXHlY/5kUGQqMKBojCBRkMf1Q6yqL7MgsY4UL
	blbcJn0eT6Pvae98OEBQBt3pLaxx4+V6Sze8HujvElC835WO+JKM/KEmmjwI9603AaZljxcMyVKht
	nJjVzYFp7Pw9imE5SJyAiadGtgnhkRycIMKyhYR9CY9iqS5EofzuDC7B2uem+LJmsNWj3mE4q5obT
	QvhsZl4qfmlG+53RW5UyLQi3N8SBCptyJvh/HhcithVdHgWabwU5hqXijWXjAK7l7XCc4IJePyrGT
	4tCgb4/oH7BDVX+pqRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBcL-0000000B6ne-1Btn;
	Thu, 06 Mar 2025 13:50:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBWC-0000000B5dK-2pTl
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 13:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F58zD1KPXjvS97YM9EyLtNejKNfhEHL4YP2fhCSVYAI=; b=DDPDAN/Rc5SfJsR0zihLgneYQ7
	yBkKxPDWYALvWTOa+Fmtxzm3wogSzRiEuu3lsK+pywBjqI/O0LzxIFP/QqsTjpcWsBeMOAJLSyziz
	e2zYWbAkFrStkVyCj9hKzzYfdMH3jfgosghgmVNyPvFudadpMkt/h+kwJg06rKH/UZcm+sy7bLuQq
	SPrLVgGxMRjZgmnlLI0YR1zvOCY5I8SNkfHQ3xqgFqRo4kRMqm8B/ulpfgZfKMvEVDvPGRDMCy6Li
	u98iYMGR24qg8kHq7qtBItSjUs0RiWVLECuWUe/kIG3m43EOePHJEaEe1a4dst2FgkVhWJJSW3qRP
	kAxHJlWQ==;
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqBW8-000000016V5-3PHZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 13:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=F58zD1KPXjvS97YM9EyLtNejKNfhEHL4YP2fhCSVYAI=; b=GLNF7/vViLVas2l4dYtlA7nzRv
	VN37Fu9gMHnjYGhgF8QsrXLgZ/Nn+taCvR1fBkOZ1I4NijVwkTB88HB85SYt3EbOg/P/qtBv73B2B
	u8xH8lsIA6U9QMt1QWKe28dusvfqVf+fwj14n57KayEt81Tj+TiBqQUVip/cZS50PhKs1HP0YMA0+
	nm/Dj95s1UkxuaxSP3LuLPMddc3v6VYQvcdpvM2AyPC8yGWl/Q63y9TCHEM3PdlR/nhBbD9YJX/tZ
	4vBfHQ65x4JFJ3V4G305lalGh5kIQhROwSZBSKWItn8nYbRMw6y+kWnwp0i6XuTtcUFJlHSLBnBt4
	OCCAuqFw==;
Received: from [122.175.9.182] (port=34841 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1tqBVL-0000000020s-0x6M;
	Thu, 06 Mar 2025 19:13:15 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id B5E4E178247D;
	Thu,  6 Mar 2025 19:13:06 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 955EC1781E38;
	Thu,  6 Mar 2025 19:13:06 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Fa2jILuXZBoo; Thu,  6 Mar 2025 19:13:06 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 547BC1781C4E;
	Thu,  6 Mar 2025 19:13:06 +0530 (IST)
Date: Thu, 6 Mar 2025 19:13:06 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: nm <nm@ti.com>
Message-ID: <1229872038.768025.1741268586173.JavaMail.zimbra@couthit.local>
In-Reply-To: <506678778.717678.1740740287558.JavaMail.zimbra@couthit.local>
References: <20250214054702.1073139-1-parvathi@couthit.com> <20250226184408.d4gpr3uu2dm7oxa2@handwork> <506678778.717678.1740740287558.JavaMail.zimbra@couthit.local>
Subject: Re: [PATCH net-next v3 00/10] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: IPUW/PB0LmhbxyH+Oxy+FoQN15s69iwVZZVb
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_134405_413544_FE684034 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, m-karicheri2 <m-karicheri2@ti.com>, basharath <basharath@couthit.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, schnelle <schnelle@linux.ibm.com>, mohan <mohan@couthit.com>, richardcochran <richardcochran@gmail.com>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, jacob e keller <jacob.e.keller@intel.com>, ssantosh <ssantosh@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, pratheesh <pratheesh@ti.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, horms <horms@kernel.org>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

>> On 11:16-20250214, parvathi wrote:
>> [...]
>>> The patches presented in this series have gone through the patch verification
>>> tools and no warnings or errors are reported. Sample test logs verifying the
>>> functionality on Linux next kernel are available here:
>>> 
>>> [Interface up
>>> Testing](https://gist.github.com/ParvathiPudi/f481837cc6994e400284cb4b58972804)
>>> 
>>> [Ping
>>> Testing](https://gist.github.com/ParvathiPudi/a121aad402defcef389e93f303d79317)
>>> 
>>> [Iperf
>>> Testing](https://gist.github.com/ParvathiPudi/581db46b0e9814ddb5903bdfee73fc6f)
>>> 
>> 
>> 
>> I am looking at
>> https://lore.kernel.org/all/20250214085315.1077108-11-parvathi@couthit.com/
>> and wondering if i can see the test log for am335x and am47xx to make
>> sure that PRUs are functional on those two?
>> 
> 
> In this patch series we have added support for PRU-ICSS on the AM57x SOC.
> Hence the test log was only included for the AM57x SOC. We are working in
> parallel
> to add support for PRU-ICSS on the AM33x and AM43x SOC's as well. We will send
> it as
> a separate patch series at a later time.
> 

Further update:

We have successfully cross compiled the kernel (linux-next) with this patch series
for AM335x and AM437x SOC respectively.

Kernel is booting well on both the SOCs and we have verified PRU functionality by
loading simple example application (pru_addition.elf) on the PRU cores, by using
"remoteproc" driver from mainline kernel.

Below are the logs for the SOCs with boot log and running PRU with elf file specified
above:

AM335x test log: <https://gist.github.com/ParvathiPudi/87d7ddf949913b80f022ed99706337ac>
AM437x test log: <https://gist.github.com/ParvathiPudi/b2d556829cb4a9e3b6b4c5656dbdd594>


Thanks and Regards,
Parvathi.

