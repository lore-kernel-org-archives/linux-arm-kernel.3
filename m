Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D8BC36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DhpDvkNUPpfOH8u7g4NeRGrOLZYObi0VJk2tn4IER4=; b=19Xgclq0sSVU3+3UicmQvwk766
	uarzHi8rilZL3nPjYztGXWKhGGnibaUUMkbR84tHXCVlWTSgzGq18E54iqGSAuf/zluX2usluh6av
	6iR4jpIsx4+7YEwlS0BXGwtEPsPDY+TNphxfpmyA/oHBX4XwmGXm8rWtze6uf8Qxt3ITDsAqcNdvv
	zpYQsQtZ7L2O9x2rcMQM5sCLwfbAOsAQAd1oDEzyVbRkyE72kYHtYCTlgt7mz79N2A22bDaME3+IG
	lHvfh9Ojp3XKcOBAPGQJIOaD+SvqQjTd9GC32H2L3k0O9ck78bFxGNBOdTDGiUbpXB5y3PiIiULBZ
	CMzIGnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeUp-00000003slr-0VhT;
	Tue, 01 Apr 2025 16:29:51 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeGz-00000003psh-2CEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:15:35 +0000
Date: Tue, 1 Apr 2025 09:15:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743524131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DhpDvkNUPpfOH8u7g4NeRGrOLZYObi0VJk2tn4IER4=;
	b=VhHBMTqEvRt/W7d00gi4rZv5Vt1sCkI5ZjgFbjtPoY1C7HnULbeBlTPvlVAnbDMIyfrbQP
	cPq04Z8ih+Jha0ocloWyHnjO/ac7jH0NfHR2hGoGdLvpq3KA7IhBDbHJV/+up6tiMhH4/V
	QWd3mUEd3ZzAc8n9rErmjeYPnH73pfk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	corbet@lwn.net, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	yangyicong@hisilicon.com, tangchengchang@huawei.com
Subject: Re: [PATCH v2 5/6] arm64: Add ESR.DFSC definition of unsupported
 exclusive or atomic access
Message-ID: <Z-wRGyMrz0Tqh0CO@linux.dev>
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-6-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331094320.35226-6-yangyicong@huawei.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_091533_714907_EE2E535D 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 31, 2025 at 05:43:19PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> 0x35 indicates IMPLEMENTATION DEFINED fault for Unsupported Exclusive or
> Atomic access. Add ESR_ELx_FSC definition and corresponding wrapper.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Just squash this into the next patch. Adding a helper w/o any user
usually isn't a good idea.

Thanks,
Oliver

