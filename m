Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDB7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd1u1j3eg8lhJXpqmh2gB1y5eFliojuhqpAg0rdcDaI=; b=Khuoh5MfQ/hC9lhG3feuRfzb00
	q8CIknlYAJgYX6ZtNlLGCQtdb61jeNRfamQrex0bz8Asr7vjZ1O9i71elHH07Ri6SFTaNjXXEsVCm
	K7aWTDGB3b6Vyf3tn7aNQNgqbZGyKLk2dvnRBpcGb7qQP5RkGhbFA5ie+vyzzjehVPuYof9TRWFOx
	gixTurLYDRomiNTlTO7VI+7i787hHRwQOdCafotU3DETRmIA3G3g/2vA4dWAwpIyV9gGLX43TjYgv
	gqetxavZupXMfovGcR3yuq9orXULW/6jtDJxgyNy8QnXaC2AsMb2dZ+Mjl/rwN50JC4cIprrS6ZAC
	NSbUDcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmJh-00000003l54-1Ltl;
	Mon, 23 Jun 2025 18:54:53 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiuC-00000003Bph-2R3j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:16:22 +0000
Message-ID: <0854ddee-1b53-472c-a4fe-0a345f65da65@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750691776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rd1u1j3eg8lhJXpqmh2gB1y5eFliojuhqpAg0rdcDaI=;
	b=dsmeYcZBdpgJopeN4LNPwALDwYY+cURYbbJFzwtvGAFWR3Lmky/rd1MjDVS5iF/C5J5Dx2
	WViTrdief/+/PyFhnRJPblh77uiIy/aKL5lLcFHLVHs/4iVkw+4eL+p5RlhkAkywMUl2Iz
	FSBlI6hQdcjFGHPHGSmncD4B4LpYKnw=
Date: Mon, 23 Jun 2025 11:16:08 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Saravana Kannan <saravanak@google.com>,
 Leon Romanovsky <leon@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-5-sean.anderson@linux.dev>
 <16ebbe27-8256-4bbf-ad0a-96d25a3110b2@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <16ebbe27-8256-4bbf-ad0a-96d25a3110b2@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_081621_205430_48C4FED0 
X-CRM114-Status: GOOD (  12.49  )
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

On 6/21/25 03:33, Andrew Lunn wrote:
> On Thu, Jun 19, 2025 at 04:05:37PM -0400, Sean Anderson wrote:
>> Returning EPROBE_DEFER after probing a bus may result in an infinite
>> probe loop if the EPROBE_DEFER error is never resolved.
> 
> That sounds like a core problem. I also thought there was a time
> limit, how long the system will repeat probes for drivers which defer.
> 
> This seems like the wrong fix to me.

I agree. My first attempt to fix this did so by ignoring deferred probes
from child devices, which would prevent "recursive" loops like this one
[1]. But I was informed that failing with EPROBE_DEFER after creating a
bus was not allowed at all, hence this patch.

Limiting the number of deferred probe attempts (at least before
continuing to boot) is a good idea in theory, but would not address the
root of the issue. Setting a good threshold is not obvious, since there
are almost certainly systems out there that are missing some device
links and have a lot of deferred probes. 

--Sean

[1] https://lore.kernel.org/all/CAGETcx-koKBvSXTHChYYF-qSU-r1cBUbLghJZcqtJOGQZjn3BA@mail.gmail.com/

