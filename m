Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26FCCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/cjSZfGXkfMX/oq1yvyojc5xqlL+Ltp0AG5OjB5oXA=; b=NT5XdrRXaEJBQSmY5JETbrENzG
	/SeSthJACj98snP4GgWYqGHmNrWQCrYOgS9tBdqoKB3O4KALi4aJahSXXpxw/WnOjqI7eOHRsutyw
	/L6PdNG94IXS3onMEAJqr6Z5s3HFzHVC7523J4lsDyAnpukitnBL+SS3y+o328ayqD+vLiq6zJfaa
	doZ27hoxIZ1Xywj/X5PaHtu3ie7ADELKiiZIxcdYCn2qvvED/HW/kjNN7PGV96AoQ59MxjpCUguqe
	yIpmhVcamCU+TkbHokSpBQMxitluSmNom5orickvUFkx7xPSUd4dVcCnfhxnG+rmt0QXzxs9hpwyk
	oPJDjTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ZJ-00000001uLG-2961;
	Wed, 15 Oct 2025 14:33:33 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ZG-00000001uIk-2dJF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:33:32 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmtqY0gMtz9tg3;
	Wed, 15 Oct 2025 16:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/cjSZfGXkfMX/oq1yvyojc5xqlL+Ltp0AG5OjB5oXA=;
	b=LthLcyfElyxrh4OtE/QaH42IDBlASpFRp34dmblnqS6N6+owvi+AGpLnnw3KCg7WNVlcPS
	KWe90qCvVVeqotrQv4iseL6lTeG130sJDlTGg8X+pxV4jkLSB5YHUpdr82Yap7LnDuoI2o
	CDpntdFSRYmrQ3yYGNdWjHtrUaUQgUdfBMGy1B3gAMmNqR/VpaOIlCPqBXVO5E3HGfhsFq
	OU8l2JjKybnt7bs5r1M+TwrH8JScxN8vaefudtQnxD3iOm1riqgfzSL2952UavuJlicPEc
	jrwyTWrpihhwMbXHFwKJagBoDNs7GKFJajQE65FpwkLZwQ7f9XqzjkJ8Ey316A==
Message-ID: <8809b170-9cea-466a-8f73-29ff560c92da@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/cjSZfGXkfMX/oq1yvyojc5xqlL+Ltp0AG5OjB5oXA=;
	b=DC1Mgh6k6xBxK1WRjL20A9FKI4waL0OXlyTdp8kRpVzBt5DtmT/53chovN0EQX/gf4Dr6S
	jYClvxnNmkzTxQ9NBBBVy4xwJQm3LGf7u6aYk1TvtlXzxMPW1UAfJijHyqCHlY07UNQ22J
	cPX6w1vl9TEO1C1BCPBwERAL/rM6R+tba7Sr/RNcuQHOUdAz0RFHqto2G2ZC6pqMBz3L4x
	kdb7QlWz6oKfisc+13bORkTkOYwt3serJaxkj3DWZcb4c//ZUI+WLfdruzrP5xIQ0+8eZn
	zAWdnHiQDHzjBTcGDGxTtKGipqgts9c9LtguySLScyQN49gk52CmHOJq0VXPdA==
Date: Wed, 15 Oct 2025 16:24:44 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
 <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
 <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
 <b5b47ad5-b3e4-4213-84e9-9e649a250237@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b5b47ad5-b3e4-4213-84e9-9e649a250237@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 7ttxq4j69pdefxjn89h4ju6n166yx5t5
X-MBO-RS-ID: 5fcd48714613e0e4852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073330_967228_FBC8BF9B 
X-CRM114-Status: GOOD (  13.84  )
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

On 10/15/25 12:52 PM, Matt Coster wrote:

Hello Matt,

>>>>    - Clock ZGφ: Appears to be a core clock for the GPU (3DGE). That would
>>>>      make it our "core" clock.
>>>
>>> This should be 600-700 MHz clock on M3-W , so that sounds like a GPU
>>> core clock.
>>
>> Agreed.
>>
>>>
>>>>    - Clock S2D1φ: Appears to be a core clock used on the AXI bus, making
>>>>      it our "sys" clock.
>>>
>>> This should be 400 MHz AXI clock, but wouldn't that make it "mem" clock
>>> ? I think this might be the clock which drives the AXI bus, used by the
>>> GPU to access data in DRAM ?
>>
>> Agreed.
>>
>>>>    - MSTP ST112: Appears to be a whole module on/off control of some
>>>>      description, and definitely doesn't align with the missing "mem"
>>>>      clock.
>>>
>>> Maybe this is the "sys" clock, since it toggles the register interface
>>> clock on/off ?
>>
>> Probably.
> 
> Yes, this is probably correct. I got my AXI interfaces mixed up – we
> have both a manager interface for accessing memory (using the mem clock)
> and a subordinate interface to expose to our registers (using the sys
> clock). Here's the summary table from our system integration document:
> 
>     +-------+-------------------------+------------------------+
>     | Clock | Modules Clocked         | Dependencies           |
>     +-------+-------------------------+------------------------+
>     | mem   | SLC / AXI Manager       | Run for all operations |
>     | sys   | SOCIF / AXI Subordinate | Run for all operations |
>     | core  | All                     | Run for all operations |
>     +-------+-------------------------+------------------------+

Thank you for sharing that. I will send a V2 series shortly.

-- 
Best regards,
Marek Vasut

