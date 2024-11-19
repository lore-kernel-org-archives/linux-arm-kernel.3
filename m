Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D078D62072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSP1S7MUoVjaLFj2D118kG9vhTloaLbOPS8zYic+qdc=; b=FIQVrBf12c/fhW+ho6u6Mp1X/X
	aRpLyvHKTJziDP08dpBIFTatIWyiDyjti3lm7KCc1SQgtpGo/ltqKjixPDAfoInRmVVnZGB8sl7cL
	HP4k9Ybq5DO1BcJP7nSNO/hfD36ZlpHz2aDn1VvApPaILHIRM7e1avAyNRXK6UfBQNQ/l15vEe5bc
	/DgE8QhG6GFS6gyJan44BPBNc9NFOlrxQzkxo0sOv9toC8io2XNRmX51HDLSysAAwhyW7M1dFMqzy
	FoZBW0Gf/uF8vCO6Ea/ssCrc93/s0Y9bgF3qtNnCX/RjYWeO+8yZ0PibwCZ3vjRoWQsPwP9Tp9FIy
	5yPlE1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLZs-0000000C4oQ-1Qz9;
	Tue, 19 Nov 2024 10:35:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLTr-0000000C3aK-2xQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 10:29:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3139C1596;
	Tue, 19 Nov 2024 02:29:40 -0800 (PST)
Received: from [192.168.178.6] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 585263F66E;
	Tue, 19 Nov 2024 02:29:08 -0800 (PST)
Message-ID: <3f24c6a9-27d7-46ad-a479-18a806444740@arm.com>
Date: Tue, 19 Nov 2024 11:29:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and
 RUN_TO_PARITY and move them to sysctl
To: Joseph Salisbury <joseph.salisbury@oracle.com>,
 Cristian Prundeanu <cpru@amazon.com>, linux-tip-commits@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, Bjoern Doebel <doebel@amazon.com>,
 Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
 Geoff Blake <blakgeof@amazon.com>, Ali Saidi <alisaidi@amazon.com>,
 Csaba Csoma <csabac@amazon.com>
References: <20241017052000.99200-1-cpru@amazon.com>
 <ca5c6d15-7205-45e0-96a9-e78ab2a52b45@oracle.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <ca5c6d15-7205-45e0-96a9-e78ab2a52b45@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_022911_781123_7D6A73C7 
X-CRM114-Status: GOOD (  10.65  )
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

On 14/11/2024 21:10, Joseph Salisbury wrote:

Hi Joseph,

> On 10/17/24 01:19, Cristian Prundeanu wrote:

[...]

> Hi Cristian,
> 
> This is a confirmation that we are also seeing a 9% performance
> regression with the TPCC benchmark after v6.6-rc1.  We narrowed down the
> regression was caused due to commit:
> 86bfbb7ce4f6 ("sched/fair: Add lag based placement")
> 
> This regression was reported via this thread:
> https://lore.kernel.org/lkml/1c447727-92ed-416c-bca1-a7ca0974f0df@oracle.com/
> 
> Phil Auld suggested to try turning off the PLACE_LAG sched feature. We
> tested with NO_PLACE_LAG and can confirm it brought back 5% of the
> performance loss.  We do not yet know what effect NO_PLACE_LAG will have
> on other benchmarks, but it indeed helps TPCC.

Can you try to run mysql in SCHED_BATCH when using EEVDF?

https://lkml.kernel.org/r/20241029045749.37257-1-cpru@amazon.com

The regression went away for me when changing mysql threads to SCHED_BATCH.

You can either start mysql with 'CPUSchedulingPolicy=batch':

#cat /etc/systemd/system/mysql.service

[Service]
CPUSchedulingPolicy=batch
ExecStart=/usr/local/mysql/bin/mysqld_safe

# systemctl daemon-reload
# systemctl restart mysql

or change the policy with chrt for all mysql threads when doing
consecutive test runs starting from the 2. run ('connection' threads
have to exists already)

# chrt -b -a -p 0 $PID_MYSQL

# ps -p $PID_MYSQL -To comm,pid,tid,nice,class

COMMAND             PID     TID  NI CLS
mysqld             4872    4872   0 B
ib_io_ibuf         4872    4878   0 B
...
xpl_accept-3       4872    4921   0 B
connection         4872    5007   0 B
...
connection         4872    5413   0 B

My hunch is that this is due to the 'connection' threads (1 per virtual
user) running in SCHED_BATCH. I yet have to confirm this by only
changing the 'connection' tasks to SCHED_BATCH.


[..]

