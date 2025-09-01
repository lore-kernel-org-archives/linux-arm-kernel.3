Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A40CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2oMNhJf3OWYBmKqw0UcAFYi0BfJGzakQ6uIIoUIvKY=; b=MV3xqfC5OXx64ogqeM579mYxfT
	KEvs60sB7pN2jq3HjAx2WnnuBPFqTARpWoUE62RQdrFcwOEbtIlScUzoEjsrUf7pR9Z5twnYfVcTY
	9/TaHxDFyGLK5P1d4T2N2V8qRZHm8ftl21qlYxV8DRcre/QbD5SqUbxgnGwSEFuIx1ZOux5pWEY9u
	rAh6RczAw4DRpqhgZaPiEwfmPbM2RWF76DD0ZwT7eIlrGCQi7Z051vi5toSkXgKzNT8STfaPtiOv3
	KAiHv8PaIfrL1xmLS8rselqYNlsxd/f0F2Wk4iL7dz2rxLeeFXCCS1F/U/gsIeKKWgiOzav7WszQO
	iiLzep1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1zw-0000000BwTG-3hiL;
	Mon, 01 Sep 2025 10:42:52 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut11l-0000000Bmqh-20lI;
	Mon, 01 Sep 2025 09:40:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E97E43294;
	Mon,  1 Sep 2025 09:40:35 +0000 (UTC)
Message-ID: <8bc8b5b9-30a5-4c2f-b7a2-8074f8321d56@ghiti.fr>
Date: Mon, 1 Sep 2025 11:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] kexec: Fix invalid field access
To: Baoquan He <bhe@redhat.com>
Cc: Breno Leitao <leitao@debian.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Coiby Xu <coxu@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, kernel-team@meta.com
References: <20250827-kbuf_all-v1-0-1df9882bb01a@debian.org>
 <f7d55c91-8877-41aa-8cf0-64af38a9a109@ghiti.fr>
 <aLVhCuzhRTRnDytw@MiWiFi-R3L-srv>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <aLVhCuzhRTRnDytw@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledukedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedthfelfeejgeehveegleejleelgfevhfekieffkeeujeetfedvvefhledvgeegieenucfkphepudejiedrudegjedrudeghedrgeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejiedrudegjedrudeghedrgeegpdhhvghloheplgduledvrdduieekrddurdduheelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlvghithgrohesuggvsghirghnrdhorhhgpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegtohiguhesrhgvughhrghtrdgtohhmpdhrtghpthhto
 hepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_024041_650816_68C340D3 
X-CRM114-Status: UNSURE (   7.94  )
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

Hi Baoquan,

On 9/1/25 11:02, Baoquan He wrote:
> On 09/01/25 at 08:42am, Alexandre Ghiti wrote:
>> Hi Breno,
>>
>> On 8/27/25 12:42, Breno Leitao wrote:
> .....snip...
>> I see that the commit those patches fix is in 6.16 so we should add cc:
>> stable.
>>
>> And who should merge those patches? Should we do it on a per-arch basis?
> It's been in Andrew's akpm-mm/mm-hotfixes-unstable.


Great, thanks for letting me know.

Alex


>

