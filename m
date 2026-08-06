Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079F2C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1LAD7QVIQ9IN0uV0OgxzHXNFiJRLLBuHpOekRGHt874=; b=v+Ry26FpEDP5dVc2ouJV0rvOZi
	Zs5CZ8VutUDYmxVauQyXdiDuxPNepY/U2MNOUXEVTwqNhEoMkBVK1knPCv41B+3tX+a2LLNjPxjW0
	biAgbEzouZJhYxJUIDiuVA6BeFF8Qg/13ww+AbSDngPcem93SbXMKLiKYb+MEfdqLw5PFz8of00eq
	mnS/mOUS+irjpzjkHM/AWKVwnQg7tFdMEv0Y+w6vkUB6s1ORTEwoINB0+1cTFMnQD98Zr2SzMDysC
	bzZ+AdD17ryMF6iktTHuM2/UldxsOovD2BRC7X7LFOEI0zqu97wedo/+auH15k3pU5++fe6Rxtxur
	T26Pvzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruaS-00000005S9x-2uth;
	Thu, 06 Aug 2026 09:40:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruaQ-00000005S8G-1T9m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:40:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f6609c657so972151f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786009224; x=1786614024; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LAD7QVIQ9IN0uV0OgxzHXNFiJRLLBuHpOekRGHt874=;
        b=fG6waZVyp5YiYNyW6cVymSuRyAOeOkPE9a6Lvz3fLbqTsvu3Pu5aOx7wvdIFUzSyrL
         crJobs9u8guxhrEn2KM5SSVCj6zRsfVqTrBmeSu7xlfQHhSvElijuaZAyH3n6fCib37j
         8BfOb4qzA3vqSqqXflrUG75a7OhfVB08YTj2Ckf9o8zgy81OJC1cN7wuKC5nboO2gdSW
         7y8Ba3cYF1Wyfdpin1AsuQZkiifglsI0wdjeVOE2JNxD3RYy4D/rH5jFAU4ETzqWx6fv
         s2050T5a9Cj8+W4g4dnytCK0Qy9ryllOBN7NkfbaCaiQ8fZQft6YwwNEYafp9zv+vTru
         wMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009224; x=1786614024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LAD7QVIQ9IN0uV0OgxzHXNFiJRLLBuHpOekRGHt874=;
        b=mpm1aPRfvTO7upvFGrL0Vj3t5ZlK9j31QveOjVNjcLG3J0+ntHydphJtJz/NAf8CtX
         qqOw8ur+OZ6DAItCbKgMJahjKMSqzzBPWVTG0uueTarc9FXimqT9vBEfHcJcx9LHIype
         YXlKsmmUQed1t+yQjWNudmahBan208RU8JP7mRf6bfw1x//gI5JWu1KEVWnVl5up0l94
         MXGNTPAIhxRWaH/P0Inu1kWzq9DQi1D0sQHpUUzzcj0lEg+lwh7Zt2RpAf4Nfx3I/6U2
         oL9jq5ADINYR2YSoM8XLEXwWgbZ+u9IzYgZdBzrQgl3tVvC8iJqpzBg11VLEIJ++YDbm
         PaCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJSAaInM0cyFKPOfaHPd8GGtyOrgou6JUpnEG0CfvFQ5puzg8agdJcJjM1ArW7ZLD9wjYW89uvStnh0AtlEofT@lists.infradead.org
X-Gm-Message-State: AOJu0YywQftCqggi1CiOkD9suJqKsAB/cl/DjJR3QGpsa1z4GqJcNUk7
	y8mkpQCFux+ULwCITxE47QuaP0LBq3XBKPNtHidaoVt3AIkmjeTeEEDCOctBd2n9TOY=
X-Gm-Gg: AR+sD13tRZwvfqmz1B3AU+9bmkhvzQ3LjiM5W4ifb1kk3ex6EMwLG5fxVVynplCHSeA
	friOjkwJRZPT6keU+TR4uDdCSVOaHYAZWZGKEaPKzrK5F38zbsySH6QOKOSuhJm3i/hM3Tz4dsx
	3OFC6fkM/OJYVclVdgVqdf/uDhKNqDNsFltUXHMTGcwCo/s5JjSQ9CMmlblzynCT/jNoWKyL2st
	z6br5PAnZKbvkImPN3OkHeCSUApmNa3JCFAqdfhPhMods3ecEYu3CLpjUeboa2WbOtyM6TQHmgA
	y2zs4VXu+5MtjhSAWR1vXTcJtPIm4ZLp8BI2LqxHx6cH6Cqhy409/aFKACcoYB9kghPkUsneBpv
	5GsEGA0HFhMPZNuYV3tUaNJMCjYGR+0RwxT49Fj0s8tDH+sY4qnqNh4IRT8SGJU7HPgGfGAe7x0
	aLCnyveUJ6SU9vtZw7Qbt65E6ejFhrzSdk3wfRyUW/OtBlI+nv/3ZewJZmW7iDOqrCtnGmWeoyZ
	WyWJ7PlRI17J80Nlh33eXs4qSAWW5D+WXoutA==
X-Received: by 2002:a05:6000:4796:b0:47f:8b2c:3d98 with SMTP id ffacd0b85a97d-47fec4e72b9mr17131460f8f.4.1786009224385;
        Thu, 06 Aug 2026 02:40:24 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b3279dsm4319973f8f.36.2026.08.06.02.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:40:24 -0700 (PDT)
Message-ID: <449549e3-8670-4c9e-a348-0ad3c6a521b2@suse.com>
Date: Thu, 6 Aug 2026 11:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: unwind: modules: Fix the mismatch between
 .ARM.exidx* and .text
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, linusw@kernel.org, jpoimboe@kernel.org,
 rostedt@goodmis.org, mcgrof@kernel.org, da.gomez@kernel.org,
 samitolvanen@google.com, atomlin@atomlin.com,
 Xiao Junzhe <egg12138@foxmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 lilinjie8@huawei.com, liaohua4@huawei.com,
 Xiao Junzhe <xiaojunzhe1@h-partners.com>
References: <20260806041001.143888-1-xieyuanbin1@huawei.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260806041001.143888-1-xieyuanbin1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_024026_420226_85F52FC5 
X-CRM114-Status: GOOD (  15.09  )
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

On 8/6/26 6:10 AM, Xie Yuanbin wrote:
> For the new version of the compilers, C code that does not explicitly
> declare the section attribute may be split into sections other than
> ".text", such as ".text.unlikely" and ".text.hot". If unwind is enabled,
> this will also split the ".ARM.exidx.text.*" sections.
> 
> As scripts/module.lds.S, ".text.[0-9a-zA-Z_]*" sections will be merged
> into ".text" section. However, ".ARM.exidx.text.*" sections will not be
> merged.
> 
> For the following module code, using the gcc-16 compiler and the
> latest linux-next code, will result in dump_stack() failure.
> ```c
> void noinline stack_func_issue(void)
> {
> 	dump_stack();
> 	pr_emerg("dump stack finish!\n");
> }
> EXPORT_SYMBOL(stack_func_issue);
> 
> static int __init mmodule_init(void)
> {
> 	stack_func_issue();
> 	return 0;
> }
> 
> module_init(mmodule_init);
> ```
> ```log
> root@(none):/# busybox/usr/bin/busybox insmod test2.ko
> [   10.846774] test: loading out-of-tree module taints kernel.
> [   10.851840] CPU: 0 UID: 0 PID: 93 Comm: busybox Tainted: G        W  O        7.2.0-rc6-next-20260805-00002-g3d7269e6e98c #3 VOLUNTARY
> [   10.852350] Tainted: [W]=WARN, [O]=OOT_MODULE
> [   10.852405] Hardware name: Generic DT based system
> [   10.852516] Call trace:
> [   10.852939]  unwind_backtrace from show_stack+0x10/0x14
> [   10.853487]  show_stack from dump_stack_lvl+0x54/0x68
> [   10.853512]  dump_stack_lvl from stack_func_issue+0x8/0xc0 [test]
> [   10.854134] unwind: Index not found bf000008
> [   10.858157] dump stack finish!
> ```
> 
> Merge ".ARM.extab.text.[0-9a-z-A-Z_]*" sections into ".ARM.extab" section
> and merge ".ARM.exidx.text.[0-9a-z-A-Z_]*" sections into ".ARM.exidx"
> section to fix the issue.

A fix for this issue was posted previously:

https://lore.kernel.org/linux-modules/tencent_08845B64E5F38EB7FA1779982A071AB4A607@qq.com/

-- 
Thanks,
Petr

