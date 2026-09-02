Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F350AC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7znxOme7R9B3zqE4QI3W3BM8OqUXvcsFNPFaJlfJoEI=; b=sUsEuL7x2atVjjeB+sLHBANYHP
	XYP8jlyYF+uzqYideW/zDIDQv4gOo3eHm331SraAmVYQXdgqoDTXcwtXPmE/5kCrq/uhJFMuGeKem
	unOIsUESogqT/g6uydrPovhF9YmxiaKZxw93kSjLFEyzjLjrXHSBlbeUPetKWEmrWf3qTacV8Lifi
	KoNPvcz+KR+sOhwYurKtJmTwbdVOKWN8ATP0pNAnd98QGh+g8yp7mChggEUkwFyEpgaM2GtWVgz84
	J9A9FKD3MdPFWTZ0Usz+6vCvp3i9fG9tBQWcLYeJknAE11atzuqvgRbdMHfgoIRJtph7VHWCL8bPk
	8c4I3/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lM7-0000000Equb-1ggu;
	Wed, 02 Sep 2026 13:50:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lM4-0000000Eqt0-3FP4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:50:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA8DE165C;
	Wed,  2 Sep 2026 06:50:13 -0700 (PDT)
Received: from [10.1.34.165] (e121487-lin.cambridge.arm.com [10.1.34.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343403F673;
	Wed,  2 Sep 2026 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788357017; bh=Mn7lImXZWkh6B4HK0ved6SfMz2UwLPCZxp9UBfpFjPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j5hyB6j2tn5RRXsTxu0PQsT64pvTXYCyFGeGfrCBFebgXphQLNLX+66Zij137hF7i
	 RFe7cQY/Dkag8Kpk8VrZRNEJOfkIC0eF+B33hisuqhvT8oVt0WwxYpX95ijaecMxjb
	 Vvwtt/FXeF4pROmQgbqLE0F9qkr+pkDmX+GiTiZ8=
Message-ID: <22b3e98f-16b0-42e0-9386-909deaff8e02@arm.com>
Date: Wed, 2 Sep 2026 14:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/45] arm64: Add support for FEAT_NMI
To: Ashok Raj <ashok.raj@oss.qualcomm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <d594b97c-747d-41df-8f7c-563ea11974df@huawei.com>
 <18338c14-c7c0-433c-8a88-ba5624313c48@arm.com>
 <aoh4S4TE8-NTZFPV@hu-ashoraj-lv.qualcomm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <aoh4S4TE8-NTZFPV@hu-ashoraj-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_065020_862427_D96B3A82 
X-CRM114-Status: GOOD (  10.16  )
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

On 8/21/26 17:09, Ashok Raj wrote:

[snip]

>>>> The series would also benefit from extensive testing on real hardware
>>>> (without NMI, with pseudo-NMI, and with FEAT_NMI), as most of the
>>>> testing so far has been done on QEMU and Fast Model.
> I'm also starting with QEMU!. just doing virt I suppose, do we have
> sbsa-ref model as well working? just wanted to check, I was thinking
> about it for another use case.
> 

I used virt. Did not try sbsa-ref, yet I do not see immediate reasons
why it should not work. Booting requirements are documented in patch
27/45.

Cheers
Vladimir

> 
> -- /ashok.raj ashok.raj@oss.qualcomm.com Qualcomm Inc
> 


