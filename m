Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0716F8D761
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 17:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+WTaxx++A4fmUPLH8/ep/XSvkYJBE9H9Qw/DE/nnB4=; b=qAMkh0vB719uosHqZKSYDPEyHB
	3rx6VFGwYdpebYrziOaGQRD/G02d18G8TUoqQ5Y0g7Lt6+ErGlCkqEWxc6Qy8/irkHva8uy+vLO2d
	UOG27vifeWILbsgZx2RQqwU6LztN5dOy3SfS9nvD/eM1vn/geUdCo6FWLguafRvQKjEnSBijnN3G6
	CnPfF7vpm+uGYciEfbLeGPd0tNGDpNysPWwwbskXj17UyV7BUIT5bcNTW9jEVIfJOuPe5Pq1ZsgqV
	zJKK0dyrW9jd/F7440GHeI5DpuKS8/T6vFBFWTazkTNNwdhLUUpPbpUBvzyUGfpmMVOUnf1iKlWgt
	Z1UuXp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQ7V-00000002hE7-0mlt;
	Thu, 16 Apr 2026 17:03:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDQ7T-00000002hDl-0ecP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 17:03:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB91B24E9;
	Thu, 16 Apr 2026 10:03:02 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90EB3F7B4;
	Thu, 16 Apr 2026 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776358988; bh=CkT2Mkvuq4h7knuFYjVS0j+7pcNunecYN1l472zFcBU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ioDzWc+syAC3h6+Pv/+21Qijh7CWWtaL3WjagXKgMGHCPNhFYIBCfP2/1QvFa8/8m
	 B8wice+IBUrMmdb+VgUuF1kE9Q5j0Gm44XkEYbnY0QUk7x4WlC3rcl0ewRiBuPsTn9
	 TDEl21dtvFsHULTY/kZYlL/XWLa3zbJkWbquMKIQ=
Message-ID: <d2e44254-a61d-4429-8902-4f508cd5d90a@arm.com>
Date: Thu, 16 Apr 2026 18:03:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
To: Mark Brown <broonie@kernel.org>
Cc: Demian Shulhan <demyansh@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Mark Rutland <mark.rutland@arm.com>,
 Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, Li Nan <linan122@huawei.com>,
 linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com>
 <acJhCCPfVxjFUZ5R@J2N7QTR9R3>
 <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com>
 <20260331063659.GA2061@lst.de>
 <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
 <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com>
 <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com>
 <CAOLeWCtf2rZyPeJH-LuZ2A+c7mC9M2r-Ya0VjyOJFpun3TFMnw@mail.gmail.com>
 <8db4defe-8b5e-4cc3-880b-72d46510b034@arm.com>
 <acc15515-4c43-402c-9800-c9b5e3da9891@sirena.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <acc15515-4c43-402c-9800-c9b5e3da9891@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_100311_244265_A99EE561 
X-CRM114-Status: GOOD (  12.23  )
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

On 16/04/2026 5:47 pm, Mark Brown wrote:
> On Thu, Apr 16, 2026 at 05:26:08PM +0100, Robin Murphy wrote:
> 
>> Unless you've got a CPU with truly big wide vector units that _can't_ be
>> fully utilised by ASMID ops, then SVE is only really offering whatever
>> incidental benefits fall out of smaller code size. However, if you do have
>> those wider vectors, then the cost of correctly saving/restoring the SVE
>> state - of which a userspace benchmark isn't likely to be very
>> representative - is also going to scale up significantly.
> 
> The other case will be when there's some SVE only extension that
> accelerates something that's relevant for the algorithm.  That's not
> really a thing at present but I imagine that we'll run into that at some
> point.

Indeed - I was implicitly thinking in terms of things that _are_ just 
transliterated from NEON to SVE, where the primary gain is stuff like 
predicate loops, but even that _could_ potentially be enough to justify 
an argument in-kernel SVE (using a 128-bit VL to keep the additional 
state/cost to a minimum).

Cheers,
Robin.

