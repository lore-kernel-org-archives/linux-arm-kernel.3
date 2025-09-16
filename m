Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5712BCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xzv5p6owT6EL+wfHjq1N+1BcwT2xgrM1X7zJEAxZ9aY=; b=kPAl7ZGmtagT1L/yrRnfRh5EMP
	EOWP+7HOaYUGa5R4lL6cCnkWOrHSce1NaD/fL9yHbD2pynacZSG66/hlypaWNwPcKMiT2f65siCjm
	+Nt/XzkDUoBtgZFtBRC8WqdnALH4+SJjoaOoSXOpJOD2EK1fT6adNstlPEjEghD6a/e+R371vvJxE
	+nPA6dCQewXlSMvwcU9omImxrVY4zMS9BLeHsJ7eobkaVonRqxoeFBvZduRoqvg6kxUKiCT8Emj5n
	FpzHjuAVswilM4565nqUShON1bkuGFjPJE9UjV/heQi2VDQjCtftJ6qZNDNaF+Ug+EzRCIIv1SeRS
	FmzIFQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZ3V-00000008Z2D-3GkU;
	Tue, 16 Sep 2025 17:01:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZ3T-00000008Z1w-3R2S
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Sep 2025 17:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Xzv5p6owT6EL+wfHjq1N+1BcwT2xgrM1X7zJEAxZ9aY=; b=OMuMzUWM3ArIJhjMatgjQIS88v
	PwpkedWHGjmfv2DV7KteWwFARlANfkQeaq7pkwseaVO05dZX/DebDkRPXgb40Jv9DAnnuaFOQ86fI
	VelK2t4St0jY5fTJYFRC6qasRi2LgRRUuD7ijFL/fhFtDgMve7+IiW3FQCmdqpw7z/4NbNbz/QnT9
	oqPWZ9gB8PnMbpKxY3AOeRt0sFELROBfohx1CIjViInOMQq7nx934qDhQn0XLianHVVrimzpXhzlw
	d5ECEh0oFdt7cDx3XFHlfz7WxGkL4yyVRt3aoDDXnEvAzIy6SXob1WRipkTBGPi8zmuooDQ516Hcb
	Ji3FWfhw==;
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZ3Q-00000007F67-0Sq3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 17:01:22 +0000
Message-ID: <42f1c98c-1432-47bb-9203-e878f011ff6e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758041475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xzv5p6owT6EL+wfHjq1N+1BcwT2xgrM1X7zJEAxZ9aY=;
	b=EPXsIUKUEYq5lC67bIQmYD+ru51kr4NDTFa4sGNgf33AHftf+dwJYPAqrklL6IeZRr3fn+
	cglopwl1EsJLZi9Tggm8VZcl/XyfY5pkGxMBd+bpxW+BC3Zy3CSKDXgWR0fGUqSpb7iCaD
	ZrJi5AwolL0OuAY3PQPYYuhOZL3/XLU=
Date: Tue, 16 Sep 2025 12:51:11 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v3] coresight: Fix possible deadlock in coresight_panic_cb
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Linu Cherian <lcherian@marvell.com>,
 linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>
References: <20250912151314.3761026-1-sean.anderson@linux.dev>
 <20250915095820.GH12516@e132581.arm.com>
 <3e618117-96bd-44f3-bede-7cadfe0264dd@linux.dev>
 <20250916160027.GK12516@e132581.arm.com>
 <a35e2d54-f1f5-4ae4-9daa-ae1f3a8a302b@linux.dev>
 <20250916164854.GM12516@e132581.arm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250916164854.GM12516@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_180120_719380_6713A28F 
X-CRM114-Status: GOOD (  13.98  )
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

On 9/16/25 12:48, Leo Yan wrote:
> On Tue, Sep 16, 2025 at 12:14:40PM -0400, Sean Anderson wrote:
> 
> [...]
> 
>> > Could you check if the drafted patch below looks good to you? If so, I
>> 
>> As stated above I disagree with a half-hearted removal. If you want to do that,
>> then I will resend v2 done with an rcu list and you can make your own follow-up.
> 
> It is fine to disagree, but please don't resend v2 :)
> 
> We have plan to refactor locking in CoreSight driver, I will try my
> best to avoid adding new lock unless with a strong reason.

As said above it will be done with an rcu list, so no new lock.

Or I can do this patch but stick the notifier block in csdev as suggested by Suzuki.

--Sean


