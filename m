Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F43C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 03:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=54+6arpjHzXNhw4PF0Se2nd1gMvnBxhZHEzyM09QGlQ=; b=g0rSU5Be+6kg/qGMy1Hk15smL+
	3PQ5IEPHewXkCHjRjZFEpa3SjJZJYGXR6fytcsKCojeWw3yziRXGd3/rAdyNEKNwIbWODkADeGO9y
	nbKf7HLOu4MFgXOJVr8MhgrySK6ZuXCkBRtg4GK0ehCrrQUgu5Axt8uoIxiryygq6DSLo5FMwtw4P
	Lu9azXppABXPxp7giyI1CHVCMQqCJ5KfqkudVZsjlNrYwL8sUsgneTdgRBi22ehVamXb8exGrcZYR
	GgrnFfSpaU3MENr6t/TDxUpcRjUaBv0F60JZeLCLGFNKgpq5RRdBEotFBZl36FOMt2kq6G4Nt9gKf
	xyrBvfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWS2G-00000003y7W-1AQX;
	Tue, 01 Jul 2025 03:51:56 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWRzt-00000003xxq-1HVe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 03:49:31 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bWTVQ6gzpz1R8g2;
	Tue,  1 Jul 2025 11:46:54 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id 61C87140295;
	Tue,  1 Jul 2025 11:49:25 +0800 (CST)
Received: from [10.67.111.31] (10.67.111.31) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 1 Jul
 2025 11:49:24 +0800
Message-ID: <d612599a-b773-42ca-acfa-67b6867f96e6@huawei.com>
Date: Tue, 1 Jul 2025 11:49:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
	<tianjia.zhang@linux.alibaba.com>, <keyrings@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
 <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
Content-Language: en-US
From: Gu Bowen <gubowen5@huawei.com>
In-Reply-To: <0bf20f7e-117c-4495-9805-baade7f466ba@suswa.mountain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.31]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemh100007.china.huawei.com (7.202.181.92)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_204929_617889_F04AF0D3 
X-CRM114-Status: UNSURE (   8.68  )
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

Hi,

On 7/1/2025 3:41 AM, Dan Carpenter wrote:
> On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
>> To reintroduce the sm2 algorithm, the patch set did the following:
>>   - Reintroduce the mpi library based on libgcrypt.
>>   - Reintroduce ec implementation to MPI library.
>>   - Rework sm2 algorithm.
>>   - Support verification of X.509 certificates.
> 
> Remind me, why did we remove these?
> 

At first, the process of calculating the digest with the SM2 certificate
was coupled with the signature verification process, and this 
unreasonable situation was corrected with commit e5221fa6a355 ("KEYS: 
asymmetric: Move sm2 code into x509_public_key "). However, this commit 
also caused SM2 to be unable to verify secondary certificates due to its 
special implementation. This issue was not resolved, which led to the 
removal of the sm2 algorithm.

