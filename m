Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE26E64A86
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tvro9mEQlAtwRjtvQz0MghYZVlLpP5OWs63wlrCMkC4=; b=wrMbMqU11kRIahKMLQw+KmYAA5
	EU3+XCVWjqkr2GvCTisg/yEV1Jup7VE8NKYWphIa8CKZN4yz4HBJK5GL9NKKIPDMSkFe0HTi9LOsw
	1W9s1M5eRDPg1QVrIpbqDhWFrVrAxpgbXDjS/k8CC/+a0rsh8v4VwisWhY4QFnZNBpUksYt5RFzzI
	yHH08n2AjI9OEzW1qLKxclFR+js1Pmf7D5kL/UFNLZXHMzJc2eJkgGq1fnc8+DYYPXzqurACBSt9/
	k5nDkpWdgZYmtuBh7hHXgRaI1utabAm+UN+wrpxrwTiB26+Ah5MEU+SHKdzz5uSCWiOUx1sQS5+rc
	NNtkVOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRya-00000009QIe-3ms7;
	Tue, 03 Dec 2024 12:26:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRni-00000009Nv2-2m4m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:14:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3C8FEC;
	Tue,  3 Dec 2024 04:15:14 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801D43F58B;
	Tue,  3 Dec 2024 04:14:45 -0800 (PST)
Date: Tue, 3 Dec 2024 12:14:42 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/3] firmware/arm_ffa: remove __le64_to_cpu() when set
 uuid for direct msg v2
Message-ID: <Z072Mm61eE_Twx1B@bogus>
References: <20241125095251.366866-1-yeoreum.yun@arm.com>
 <20241125095251.366866-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125095251.366866-4-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041446_739768_8F652508 
X-CRM114-Status: GOOD (  11.61  )
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

On Mon, Nov 25, 2024 at 09:52:51AM +0000, Yeoreum Yun wrote:
> From: Levi Yun <yeoreum.yun@arm.com>
> 
> UUID is saved in big endian format.
> i.e) For uuid "378daedc-f06b-4446-8314-40ab933c87a3",
> 
> It should be saved in memory like:
>     37 8d ae dc
>     f0 6b 44 46
>     83 14 40 ab
>     93 3c 87 a3
> 
> Accoding to FF-A specification[0] 15.4 FFA_MSG_SEND_DRIECT_REQ2,
> then UUID is saved in register:
>     UUID Lo  x2  Bytes[0...7] of UUID with byte 0 in the low-order bits.
>     UUID Hi  x3  Bytes[8...15] of UUID with byte 8 in the low-order bits.
> 
> That means, we don't need to swap the uuid when it send via direct
> message request version 2, just send it as saved in memory.
> 
> Remove le64_to_cpu() for uuid in direct message request version 2,
> and change uuid_regs' type to __be64 because UUID is saved in network
> byte order.
>

  |   warning: incorrect type in initializer (different base types)
  |      expected unsigned long a2
  |      got restricted __be64
  |   warning: incorrect type in initializer (different base types)
  |      expected unsigned long a3
  |      got restricted __be64

We will get this warning back with this change, wondering if we can take
up BE support separately.

--
Regards,
Sudeep

