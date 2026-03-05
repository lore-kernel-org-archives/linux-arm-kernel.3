Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7901DEEF313
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uoaz7W+ExVjeFhFu+oy/yehfxU/6m5rmsVl0/hxKwR8=; b=K9Sj0ttAS20m99XK/o/A1m6xaG
	uEFaUJa+i8jbSarklrW8GCrHOYE+jztPf7XLm7qL5unJ7lIw4GKvCu5WeRulxBsa0EXgKgoIRJ4z2
	gl5o0yLZ+R+LNJttzEV75c7IZJAB5BGjkdEe+atH+gXhkhrS71eXTEZ7PHQES0NmbsnGzQHdEYom6
	hP/CaJsj9PBMR3ILglnJrwb/X/z/hikRtRj8v5zkWUfmOc6U33fpgyRVJkOLgE6IBLA6XUwLMN0hV
	adJ6cpzqe6/h61DIc139p+MRF/IW1rcF6QajgSrX+a7SlOgAFvNYbY9AeGBj322FSg8tKSVYxkBxa
	6NYeGZRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2zk-000000015Ac-0jQM;
	Thu, 05 Mar 2026 07:19:40 +0000
Received: from smtp.jvdsn.com ([2603:c020:1:bd00::1:3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy2zi-000000015AG-1KLU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
	t=1772695175; bh=28Ie8QvorUqaeXyfBFib6Vpgd0CWzIv1/GxcOBEm6QM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=4I6+dhHDnhoRF7n6JWdDE9O8fP3gN5EuF5Xg0PY1SoG7hZdINWPSf07YIsZbAfKUk
	 0RPU5iLbNHN5ZnGGUdWbVsEgJwbODOeQfmR0zkezNU4GngmeiKycX9nL4CzMY3a2ct
	 /YG+DJ/Fq7W0L4DmDNuUvVgsDmUPMR5Y4X676dsBNeygIP+Ce/g/WyZI9+3pRxI4pP
	 dNZ0TSX+Txu6tsTapGlZbfNVcNYCwDsTZ4ltdkSFo2Et32FQeyLliS+bY4IJqOzFY4
	 oSFlKqqhbmeq4y352WuXhw6/4KcvQdyYp725I00E8PYmA85ikTdLWMLw2+RKW/2OIg
	 ubv1nyl7WwjKA==
Message-ID: <952df8bf-0393-48a3-a844-e3acf13fd770@jvdsn.com>
Date: Thu, 5 Mar 2026 01:19:34 -0600
MIME-Version: 1.0
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Christoph Hellwig <hch@infradead.org>, Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dm-devel@lists.linux.dev
References: <20260303060509.246038-1-git@jvdsn.com>
 <aab5ptuamQ7d_tTi@infradead.org> <20260303193102.GA2846@sol>
 <aagvBY-XMfPIqkDO@infradead.org>
Content-Language: en-US
From: Joachim Vandersmissen <git@jvdsn.com>
In-Reply-To: <aagvBY-XMfPIqkDO@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_231938_440386_002EF5AB 
X-CRM114-Status: GOOD (  12.25  )
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

Thanks for the discussion below, it sounds like I need to ensure 
dm-integrity can use lib/crypto (at least for xxhash64) before blocking 
it in the crypto API.

On 3/4/26 7:09 AM, Christoph Hellwig wrote:
> On Tue, Mar 03, 2026 at 11:31:02AM -0800, Eric Biggers wrote:
>>> It sounds like xxhash should be removed the crypto API entirely.
>>> There's no user of it, it's not crypto, and doing xxhash through
>>> the userspace crypto API socket is so stupid that I doubt anyone
>>> attempted it.
>> dm-integrity, which uses crypto_shash and accepts arbitrary hash
>> algorithm strings from userspace, might be relying on "xxhash64" being
>> supported in crypto_shash.  The integritysetup man page specifically
>> mentions xxhash64:
> Oh, ok.  So at least for now we need it, although it would be nice to
> convert dm-integrity to lib/crypto/ and limit it to the advertised
> algorithms (including xxhash).
>
>

