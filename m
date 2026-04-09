Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3D3EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaissuDY4bA2uw4IZS9kJv/vGajVmUL1W3p7mYRFnVM=; b=Kl5aFaEHNIINQMuO1p6CHTEqOh
	l2zjLSKQ9kHyxQtLPDTs3a8NPieRuoIHDj3bFMxRENDclLTlrMSYEQbAArM+AjDulVMvys8vUVNiE
	ivkasNDvJ2Uqm4Ho97ayMMZ1uSJw+uXvtb3HyEUsFyxVdJIlkJpaq1N1/nG3FDuDdQuHDR6tIuc72
	yUQH0rIt8jcH4JY9ghkQeBCUnobrGK4Ew3jd3uD5+RPwOuRDv6jPbRWyMrE1L3k0Cs3QQUXrQ4bKd
	SjBZxl7CV3XJVRX6VjGRx7JKzTDZhpJgRiSbBlU9ES+bFHgIqr1FE22i3scmhB/OLG5IE1t8nFiZy
	RfLkasRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoUr-0000000ANmM-2eAj;
	Thu, 09 Apr 2026 12:28:33 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoUe-0000000ANji-0ueH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:28:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4frzjY0Y7GzKHMSB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 20:28:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 4B9F140561
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 20:28:01 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgDnEAZPm9dpf7bHDw--.44043S2;
	Thu, 09 Apr 2026 20:28:00 +0800 (CST)
Message-ID: <b570acfd-ce59-4cfc-b066-4ad290d6e780@huaweicloud.com>
Date: Thu, 9 Apr 2026 20:27:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v12 1/5] bpf: Move constants blinding out of
 arch-specific JITs
Content-Language: en-US
To: Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>,
 Anton Protopopov <a.s.protopopov@gmail.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Paul Burton <paulburton@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Christophe Leroy <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
References: <20260403132811.753894-1-xukuohai@huaweicloud.com>
 <20260403132811.753894-2-xukuohai@huaweicloud.com>
 <DHJNB77853FP.3601X6NYXA9LY@etsalapatis.com>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <DHJNB77853FP.3601X6NYXA9LY@etsalapatis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgDnEAZPm9dpf7bHDw--.44043S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyxCw45Kr45Gr1xZr4fKrg_yoW3CrXEkr
	Z7G3s5Za95Cr17Jw4kWw1qkFWIgr4DXryUAF4fZr1Ivrn8ZrWF9r95Ga93Aas7t34fAF1U
	uF47JFWfJFy2qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIF
	4iUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_052820_619383_CB336670 
X-CRM114-Status: UNSURE (   8.79  )
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

On 4/4/2026 12:04 AM, Emil Tsalapatis wrote:
>>   	/* Pass 3: Adjust jump offset and write final image */
>>   	if (build_body(&ctx, extra_pass) ||
>> -		WARN_ON_ONCE(ctx.idx != ctx.epilogue_offset)) {
>> -		prog = orig_prog;
>> +		WARN_ON_ONCE(ctx.idx != ctx.epilogue_offset))
> This thunk is slightly different now, the WARN_ON_ONCE() won't be checked
> if build_body() succeeds.

Sorry, I do not see the difference here. The WARN_ON_ONCE() is still checked
when build_body() returns 0 (succeeds) due to the '||' evaluation.

> Do we even need it? AFAICT the only case it
> wouldn't trigger if build_body() fails is if it did so at the very last
> instruction. Alternatively, should we check it if build_body() succeeds
> instead to retain the old behavior?
>
>>   		goto out_free_hdr;
>> -	}
>>   


