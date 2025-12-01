Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6D8CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9NL5wUh2dS12g99RQyCxsHZ07ddXfYUXqkWRaHw8Jw=; b=yW77Uo5snCurXMdFhf6uIMUiNu
	5U0eOyxxITnIvhJEI0Li1JJlckhJ9tR5AobSKOaw5s7r/r6JDTRLHDJAQ4RBRV8qC19tCW1tz1O66
	Z23spv8RRKfkCGFCEnQVF/itf3uO7OC046ZFZthtd6KwNSq2n093DbDTxoJpCQ2tajDi1zJszrc+r
	HxyS0Og1HYcOPnb0v9oUQRz7PdOJgKcENrP+4BMbwgVxW3uEn/Cq0De3pQfNc/FE41PIGZtE6D2XI
	IkFD+6g1Fu9SN6b8h9epXpE1sa0qT33Z40KVaKozRGBhIN9iIO2elnl0lDZSxg1ueTqdZ/6BVTlOU
	jDweJaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPtoc-00000002p9l-14dy;
	Mon, 01 Dec 2025 02:39:02 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPtoZ-00000002p9E-2XAJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 02:39:01 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dKSk758LXzYQtjq
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Dec 2025 10:37:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 4F8321A1B07
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Dec 2025 10:38:51 +0800 (CST)
Received: from [10.174.176.88] (unknown [10.174.176.88])
	by APP2 (Coremail) with SMTP id Syh0CgD311G5_yxpf6i7AA--.50711S3;
	Mon, 01 Dec 2025 10:38:51 +0800 (CST)
Message-ID: <7970e1c4-88d5-42ef-b8cf-ed50d27fedcc@huaweicloud.com>
Date: Mon, 1 Dec 2025 10:38:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug report] hash_name() may cross page boundary and trigger
 sleep in RCU context
To: Al Viro <viro@zeniv.linux.org.uk>, Zizhi Wo <wozizhi@huaweicloud.com>
Cc: Will Deacon <will@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, jack@suse.com,
 brauner@kernel.org, hch@lst.de, akpm@linux-foundation.org,
 linux@armlinux.org.uk, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, yangerkun@huawei.com,
 wangkefeng.wang@huawei.com, pangliyuan1@huawei.com, xieyuanbin1@huawei.com
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <aShLKpTBr9akSuUG@willie-the-truck>
 <9ff0d134-2c64-4204-bbac-9fdf0867ac46@huaweicloud.com>
 <39d99c56-3c2f-46bd-933f-2aef69d169f3@huaweicloud.com>
 <61757d05-ffce-476d-9b07-88332e5db1b9@huaweicloud.com>
 <aSmUnZZATTn3JD7m@willie-the-truck>
 <b6e23094-f53f-4242-acb5-881bd304d707@huaweicloud.com>
 <20251129035510.GI3538@ZenIV>
From: Zizhi Wo <wozizhi@huaweicloud.com>
In-Reply-To: <20251129035510.GI3538@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgD311G5_yxpf6i7AA--.50711S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4xJF4DCrWUGry5Ww43GFg_yoW3ZrX_W3
	y8tr4DCa43ta1fAa15GFW7ArZxJw42vr15KFZ5Xws3K3s2yFW8C398Kwn5Zan2qFWYkFsF
	9Fn3Jr17Cry3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x0pRHUDLUUUUU=
X-CM-SenderInfo: pzr2x6tkl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_183859_846652_0A888716 
X-CRM114-Status: GOOD (  11.11  )
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



在 2025/11/29 11:55, Al Viro 写道:
> On Sat, Nov 29, 2025 at 09:02:27AM +0800, Zizhi Wo wrote:
> 
>> Thank you very much for the answer. For the vmalloc area, I checked the
>> call points on the vfs side, such as dentry_string_cmp() or hash_name().
>> Their "names addr" are all assigned by kmalloc(), so there should be no
>> corresponding issues. But I'm not familiar with the other calling
>> points...
> 
> Pathname might be a symlink body, sitting in page cache or whatever
> ->get_link() has returned...
> 


Thanks for the additional explanation — I indeed hadn't considered
symlinks. But if the data is in the page cache, as I understand it, its
address wouldn't be in the vmalloc area, right? However, for other
.get_link implementations, it's true that there's no guarantee.

Thanks,
Zizhi Wo


