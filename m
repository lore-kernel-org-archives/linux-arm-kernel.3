Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9700C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 02:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmiWBqek51VzZAyzv7udCGLaQxhBVLGFuRDlpB6UWk4=; b=zVilfxVJFwdvRpMU1UXR2+sAly
	nEKzIYRjsxQVXPmjHT5BDTCxRtU3D8CnPUxZOSixGqPm6haBY0Nj0duZRrRYqIpggNs9xzBu9mWU5
	cNU01HbLV38gUHdJM4c/k+kZjOQiAX2+SOfnRKIgEdYJT3jYZYY0H6uvJujJz788erW2n7Em49Ihl
	FF5An92kwjK1iW5251nQ2L6rP0MN/uOgGJMYkf3E17Hvx22Odsp2JhTg+qccrN/8oGpV+s7oOgry2
	p+KkdrlBGP/qdlbbdcN5MT1ptRFV7DNevBvwE/rwaIbw9v1SEL6UCyX6uf5qBbc4lz4EW7z1dEbaw
	bmfqizMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua3K3-0000000DWca-424t;
	Fri, 11 Jul 2025 02:17:11 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua3Hh-0000000DWTw-2XXR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 02:14:47 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bdZtX72Whz2Cdk8;
	Fri, 11 Jul 2025 10:10:28 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id 90F0A140278;
	Fri, 11 Jul 2025 10:14:33 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 11 Jul
 2025 10:14:32 +0800
Message-ID: <3654a091-053a-4330-a019-a681d06166be@huawei.com>
Date: Fri, 11 Jul 2025 10:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Tianjia
 Zhang <tianjia.zhang@linux.alibaba.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, <keyrings@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <aGaCTOJ30KNPOBIC@zx2c4.com>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <aGaCTOJ30KNPOBIC@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.31]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_191445_944305_8D699524 
X-CRM114-Status: GOOD (  29.37  )
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

Hi,

On 7/3/2025 9:14 PM, Jason A. Donenfeld wrote:
> Hi,
> 
> On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
>> To reintroduce the sm2 algorithm, the patch set did the following:
>>   - Reintroduce the mpi library based on libgcrypt.
>>   - Reintroduce ec implementation to MPI library.
>>   - Rework sm2 algorithm.
>>   - Support verification of X.509 certificates.
>>
>> Gu Bowen (4):
>>    Revert "Revert "lib/mpi: Extend the MPI library""
>>    Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
>>    crypto/sm2: Rework sm2 alg with sig_alg backend
>>    crypto/sm2: support SM2-with-SM3 verification of X.509 certificates
> 
> I am less than enthusiastic about this. Firstly, I'm kind of biased
> against the whole "national flag algorithms" thing. But I don't know how
> much weight that argument will have here. More importantly, however,
> implementing this atop MPI sounds very bad. The more MPI we can get rid
> of, the better.
> 
> Is MPI constant time? Usually the good way to implement EC algorithms
> like this is to very carefully work out constant time (and fast!) field
> arithmetic routines, verify their correctness, and then implement your
> ECC atop that. At this point, there's *lots* of work out there on doing
> fast verified ECC and a bunch of different frameworks for producing good
> implementations. There are also other implementations out there you
> could look at that people have presumably studied a lot. This is old
> news. (In 3 minutes of scrolling around, I noticed that
> count_leading_zeros() on a value is used as a loop index, for example.
> Maybe fine, maybe not, I dunno; this stuff requires analysis.)

Actually, I wasn't very familiar with MPI in the past. Previously, the 
implementation of sm2 was done through MPI, so I used it as well. 
Perhaps I could try using the ecc algorithm in the kernel.

> On the other hand, maybe you don't care because you only implement
> verification, not signing, so all info is public? If so, the fact that
> you don't care about CT should probably be made pretty visible. But
> either way, you should still be concerned with having an actually good &
> correct implementation of which you feel strongly about the correctness.
> 
> Secondly, the MPI stuff you're proposing here adds a 25519 and 448
> implementation, and support for weierstrauss, montgomery, and edwards,
> and... surely you don't need all of this for SM-2. Why add all this
> unused code? Presumably because you don't really understand or "own" all
> of the code that you're proposing to add. And that gives me a lot of
> hesitation, because somebody is going to have to maintain this, and if
> the person sending patches with it isn't fully on top of it, we're not
> off to a good start.
> 
> Lastly, just to nip in the bud the argument, "but weierstrauss is all
> the same, so why not just have one library to do all possible
> weierstrauss curves?" -- the fact that this series reintroduces the
> removed "generic EC library" indicates there's actually not another user
> of it, even before we get into questions of whether it's a good idea.

Thank you for your advice, it has been very beneficial for me as I just 
started participating in the community. I will try to implement the 
functionality with more robust code and only submit parts that I fully 
understand.

Best Regards，
Guber



