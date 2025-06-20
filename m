Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76147C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Pt53J5CQyhMhBy2UHYMO8n7eZQLEZ2R9chwdbp1yGI=; b=2BkOpS5l9dMb5V+0JSUrNO9Byc
	QjBgx+uRutkSHivb3EMBMN4X/tfeYIpspZ3OWmIc117w7e4USJYdon7jB3aR9LqHfU8wsbbwXN9sL
	XlS5/If2Fgk2hM3HBT81nyZopYWFuJTUIJm44HAJDp85dPsBqTl8OnbI+zL3m/lh8at4WGda7sciK
	8nRNIpKZ6F5Hz7tEPDO0Q1Whxzc7OsIdt1HYonNHx8OP2nLrUpzKRCNu+6+fwxD05i86xaf1zxhz2
	s2RC1KVOyIoMVlKwtEyBAc+TtJX/Z6jnWAavYOnRPNpBNznAt9fwF+gdjW6CVkYqd7ONMWMs1/gs1
	L+wHQUiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfB6-0000000GCED-1IiV;
	Fri, 20 Jun 2025 17:05:24 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSehl-0000000G96V-1aEV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:35:07 +0000
Message-ID: <3ff0f1eb-fd69-4452-9e24-738f47b0203e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750437301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Pt53J5CQyhMhBy2UHYMO8n7eZQLEZ2R9chwdbp1yGI=;
	b=Q3rbwmNeb2YVBcJopM73p3v4MtiDUNCI9mWHG/TFSwVNnPebD7QaF4/BgqM6fUTV7RSs9t
	x+sOduJiZ5MM0tyEsz7TPTu7MzYQCtScim8OhAay/pUoPBcdUtSbz0uCTrxgrMWhOi/f+z
	5PFLJIp/YGxBuCohTNfV+cGUbHXzL2Y=
Date: Fri, 20 Jun 2025 12:34:56 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net 0/4] net: axienet: Fix deferred probe loop
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org,
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <2025062004-sandblast-overjoyed-6fe9@gregkh>
 <56f52836-545a-45aa-8a6b-04aa589c2583@linux.dev>
 <2025062054-tameness-canal-2204@gregkh>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <2025062054-tameness-canal-2204@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_093505_570212_D2F233C7 
X-CRM114-Status: GOOD (  18.80  )
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

On 6/20/25 12:01, Greg Kroah-Hartman wrote:
> On Fri, Jun 20, 2025 at 11:41:52AM -0400, Sean Anderson wrote:
>> On 6/20/25 01:10, Greg Kroah-Hartman wrote:
>> > On Thu, Jun 19, 2025 at 04:05:33PM -0400, Sean Anderson wrote:
>> >> Upon further investigation, the EPROBE_DEFER loop outlined in [1] can
>> >> occur even without the PCS subsystem, as described in patch 4/4. The
>> >> second patch is a general fix, and could be applied even without the
>> >> auxdev conversion.
>> >> 
>> >> [1] https://lore.kernel.org/all/20250610183459.3395328-1-sean.anderson@linux.dev/
>> > 
>> > I have no idea what this summary means at all, which isn't a good start
>> > to a patch series :(
>> > 
>> > What problem are you trying to solve?
>> 
>> See patch 4/4.
> 
> That's not what should be in patch 0/4 then, right?
> 
>> > What overall solution did you come up with?
>> 
>> See patch 4/4.
> 
> Again, why write a 0/4 summary at all then?

So if I decide in v2 that some patch other than "auxiliary: Allow empty
id" has to come first then the series still has the same subject. This
makes it easier for maintainers to figure out which v1 the v2 is for.

>> > Who is supposed to be reviewing any of this?
>> 
>> Netdev. Hence "PATCH net".
>> 
>> And see [1] above for background. I will quote it more-extensively next time.
> 
> Referring to random links doesn't always work as we deal with thousands
> of patches daily, and sometimes don't even have internet access (like
> when reviewing patches on long flights/train rides...)

Well, the link contains the message-id, so you are more than welcome to
look it up in your email client. But to spare you the trouble I will
quote from it next time in addition to linking.

--Sean

