Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE54C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 03:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aoi5vBF22QymPvL7WmaokdojVdTMJ7HxY9/JKb3YTbk=; b=sV0pIW+084yID+7vCIE74LdNzK
	LFnGYbbdap94OwON0rD6TvSvP4VuY1jHkzzjFOM2ZIRcHKAK8A/g3MFbPQI+Xpa92ene9gw4s+LSb
	4N4bALXX0tIpcZvFLybMJPjPGHrggHX9L292FkMH3cNNpUFd86LFPWHgZ3z6wqaUZ7m7zh7Cw4uhQ
	ktSRtcq3ooUXeLNPedHDuDQRohpAX8Hpk0SFS7keP8suv0OOvx3YSPYkF3w4WxOdKMQw1NQGw5m6+
	q3VGVa2spgiFawR3+lZHZafmU/F66BZj+VksTfiJwbmGQ5/z8GISLHR8/nJ9GXh5aYmSNyYKvvp1W
	HN8Nl0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VP7-0000000DHOT-3wcS;
	Thu, 10 Sep 2026 03:24:51 +0000
Received: from smtp.jvdsn.com ([2603:c020:1:bd00::1:3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VP5-0000000DHO8-2tgo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 03:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
	t=1789010683; bh=OSmlZrTtowYwV7CqDLWVt9GCCCLsHOffm7LbDvdbciM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HMl5re/5pdfhQrloFTxpSn/Wk9I1N8fBDHCI6Ld7/Mg7K+E2nnE8xYPUFEzyE2KRY
	 u0NV9bNtzXgBAKx7ZRR/FsDbpZQSYHWx42SDjwhEVFbr5ylQBqcMCSPLFX1L/lmv7Y
	 hh8iWN+Zr6v1wDM9hD/iSLa73K00w4EJyM2tWF9xB8oFOQhiM5KWtY6do013FIdpCJ
	 kYTfsi+G219Xs1QFuj6tTQ8O3qPSzJDAvaqNj4I5zwDc0/JnoNhHN+/ZxhsgRzIuYF
	 RrKLLKluVok3nHmgNN18D5yI59CfAFvWCbdZcPLR4dq78IoP2vuAAMECDfYLSGEKXw
	 yg5zRNbaS8t3A==
Message-ID: <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
Date: Wed, 9 Sep 2026 22:24:42 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Thomas Huth <thuth@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
 <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
From: Joachim Vandersmissen <joachim@jvdsn.com>
Content-Language: en-US
In-Reply-To: <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_202447_800960_E7458AF1 
X-CRM114-Status: GOOD (  18.20  )
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

Hi Thomas,

On 9/9/26 9:36 AM, Thomas Huth wrote:
> On 15/03/2026 01.43, Joachim Vandersmissen wrote:
>> Hi Herbert,
>>
>> I don't think this one can be applied yet since dm-integrity still 
>> uses xxhash64 through the crypto API. This would break fips=1 systems 
>> that use it.
>
> Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway? 
> If xxhash64 isn't FIPS-compliant, nobody should use it for 
> dm-integrity there, right? So I doubt that there are any systems out 
> there that use fips=1 and use xxhash64 at the same time?

There is a risk that users may not know that xxhash64 is not FIPS 
compliant and would still use it. Especially considering it was marked 
as "fips_allowed = 1" for a while.

Distributions that actually need FIPS validation will probably apply 
this patch anyway and deal with the breakage if it happens.

>
>  Thomas
>
>>
>> On 3/14/26 12:11 AM, Herbert Xu wrote:
>>> On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
>>>> xxhash64 is not a cryptographic hash algorithm, but is offered in the
>>>> same API (shash) as actual cryptographic hash algorithms such as
>>>> SHA-256. The Cryptographic Module Validation Program (CMVP), managing
>>>> FIPS certification, believes that this could cause confusion. xxhash64
>>>> must therefore be blocked in FIPS mode.
>>>>
>>>> The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
>>>> ("btrfs: switch to library APIs for checksums") recently modified the
>>>> btrfs code to use the lib/crypto API, avoiding the Kernel 
>>>> Cryptographic
>>>> API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
>>>> mode should now have no impact on btrfs usage.
>>>>
>>>> Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
>>>> ---
>>>>   crypto/testmgr.c | 1 -
>>>>   1 file changed, 1 deletion(-)
>>> Patch applied.  Thanks.
>>
>

