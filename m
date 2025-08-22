Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B482CA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQHjqdGHZGwz5jlXpEQ4A8fr2g0aWp9TNlx/qZj0tAM=; b=PyF85FyVuJ3zAWpaM/0Pu0eH/5
	bKsFW0XLCbcefVnKdxgULLhK4BQyn6QyID5ZB3PtSZxgeUvcLQrrxyN8h/7OY3VGZXCza0sm8z81u
	n+Wc/EWhAMG9ruxiPP/VXUE2w+ZdFhURJxSIa9PFhfmfPhzEmERxK9FE6CQQ6enqVmMATpBhGmIiv
	RP3qSYtODAnMt9uG4aFtCrNYAVjDHAE8cur2PrL2c817vVyYEo23gtcFOa3G290mGTe4PbHkktvfJ
	5BTl86lXKXlOqKF4KnVjJab5ENBaJ8p41TEvHzILJmG/FyrMP6HmsI9B/cd4C0SLcsbR2MNsrX1H1
	uUSdFtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfU-00000004Uqf-397h;
	Sat, 23 Aug 2025 09:36:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVje-00000003FeE-1llh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 17:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EQHjqdGHZGwz5jlXpEQ4A8fr2g0aWp9TNlx/qZj0tAM=; b=owi6R8EP5Rq0PvxnqZaVuLdUR8
	wsepIdJGW5tOL3t57oGxhLYnqkb8K4c2BKJ6xyzk0DJgLKTHpnYdvQbDYr/umHmQbB5YvKlM1vGCg
	yYKxI0Ww/u1eJcl7bf4GUHSl+FyIwviM787Hn61KK9x+/yxzD9G3fTHe+em7B1kKh/rZxmbotPj0F
	k1W4DU1eisezp+20mAIewJMVfVdauQhtqsjNv2Xn/LkZZTUyaxeFoiEnGPiKEFMB09fACMgXGp6AK
	XmRAQE2tpSyBROoY4IeBSB0+QSGiEPQSbN1FXKA6PPgydmW+V2rqMGBA6iGuo4riUwKko9v5MPyB+
	Eu+K2rWw==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVjb-000000013HH-0YrQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:39:29 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57MHdDTg299741;
	Fri, 22 Aug 2025 12:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755884353;
	bh=EQHjqdGHZGwz5jlXpEQ4A8fr2g0aWp9TNlx/qZj0tAM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=StjMwzwVLVDe40mulHlLMB/LS+E0mfIWI6dPqG3qcqRYLkOXRNINtgiW0Yb3khtZP
	 EcV3Mlx1iwu/KMlqC8SK3YRsG6wuS9hAeMjp6raftH98LLC2rP8sRun5DJ1jpfLgR+
	 D1GFZjCuShnGbbCx8PnBcSOJGOjKWpGqis6t5168=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57MHdDpk3077731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 22 Aug 2025 12:39:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 22
 Aug 2025 12:39:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 22 Aug 2025 12:39:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57MHdCxq3898888;
	Fri, 22 Aug 2025 12:39:12 -0500
Message-ID: <c05c0a13-e7af-4fc0-9363-b629b2c48201@ti.com>
Date: Fri, 22 Aug 2025 12:39:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PATCH: firmware: ti_sci: Add trace events to TI SCI
To: Jon Cormier <jcormier@criticallink.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami
 Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-trace-kernel@vger.kernel.org>
References: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
 <e11fd419-1095-471e-a57f-fc5ff7ce713a@ti.com>
 <CADL8D3aR_ecr4q54cX7yfr_aDPA7NhXmLhkiHjUY9MjNZeg78Q@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CADL8D3aR_ecr4q54cX7yfr_aDPA7NhXmLhkiHjUY9MjNZeg78Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_183927_653348_741727FE 
X-CRM114-Status: GOOD (  27.81  )
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

On 8/22/25 11:05 AM, Jon Cormier wrote:
> On Wed, Aug 20, 2025 at 4:04 PM Andrew Davis <afd@ti.com> wrote:
>>
>> On 8/20/25 1:10 PM, Jonathan Cormier wrote:
>>> Add trace events to help debug and measure the speed of the
>>> communication channel.
>>>
>>> Add parsing of the messages types but I am not sure how to parse the
>>> flags, since the REQ and RESP flags conflict. Left as seperate commit to
>>
>> The REQ and RESP flags should be handled by different TRACE_EVENTs. Right
>> now you only dump the content of the response messages (the ones in
>> rx_callback), also tracing what is sent is just as important, so you
>> might want to add slightly different ti_sci_msg_dump EVENT for the
>> sending side which uses the different REQ flag parser.
> 
> 
> Does it make sense to have seperate trace events, one that only decode
> the hdrs and ones that also include the buffers?
> 
> I'm bothered by the code duplication, but am trying to convince myself
> it doesn't matter.
> 
> Currently, with the above updates, if you enabled all the traces,
> you'd see something like:
> 
> [15.579036] ti_sci_xfer_begin: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000402 status=0
> [15.xxxxxxx] ti_sci_tx_msg_dump: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000402 data=<data>
> [15.587595] ti_sci_rx_callback: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000002 status=0
> [15.xxxxxxx] ti_sci_rx_msg_dump: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000002 data=<data>
> [15.606135] ti_sci_xfer_end: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000002 status=0
> 
> Presumably if you were worried about timing, you'd disable the
> msg_dumps, avoiding the extra memcpy's.  And if you only cared about
> the data being sent, you'd only enable the msg_dumps.  Does this make
> sense / is it worth the extra trace calls?
> 
> Or removing the buffer decoding in the msg_dumps, removes the duplication:
> 
> [15.579036] ti_sci_xfer_begin: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000402 status=0
> [15.xxxxxxx] ti_sci_msg_dump: data=<data>
> [15.587595] ti_sci_rx_callback: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000002 status=0
> [15.xxxxxxx] ti_sci_msg_dump: data=<data>
> [15.606135] ti_sci_xfer_end: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000002 status=0
> 

I like this one ^^^ but I'd also just remove the `ti_sci_rx_callback`
trace, the contents would always be the same as `ti_sci_xfer_end`.

This way you have two sets of symmetrical trace events, a "begin" and "end"
that can be used for timing measurements, and a dump message for "send" and
"receive" that would help with debugging based on the message contents.

As for the code duplication in the send/receive traces, I'm not sure
what can be done, these trace macros already confuse me enough without
trying to optimize them :)

Andrew

> Or do condense the trace calls so they all have the data into something like:
> 
> [15.579036] ti_sci_xfer_begin: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000402 status=0  data=<data>
> [15.587595] ti_sci_rx_callback: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000002 status=0 data=<data>
> [15.606135] ti_sci_xfer_end: type=SET_DEVICE_STATE host=0C seq=00
> flags=00000002 status=0
> 
> Simplifying the code in the trace header.
>>
>>
>> Andrew
>>
>>> make it easier to drop or make changes depending on comments.  The two
>>> commits should squash easily.
>>>
>>> Nishanth Menon and Vignesh Raghavendra requested I send this patch
>>> upstream.
>>>
>>> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
>>> ---
>>> Jonathan Cormier (2):
>>>         firmware: ti_sci: Add trace events
>>>         firmware: ti_sci: trace: Decode message types
>>>
>>>    MAINTAINERS                     |   1 +
>>>    drivers/firmware/Makefile       |   3 +
>>>    drivers/firmware/ti_sci.c       |  11 +++
>>>    drivers/firmware/ti_sci_trace.h | 146 ++++++++++++++++++++++++++++++++++++++++
>>>    4 files changed, 161 insertions(+)
>>> ---
>>> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
>>> change-id: 20250709-linux_master_ti_sci_trace-91fd2af65dca
>>>
>>> Best regards,
>>
> 
> 


