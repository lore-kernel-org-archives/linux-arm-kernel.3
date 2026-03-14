Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D546F10706DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCQypaxGFFgaS/osfKeG64nMyEQeNeo+f0gUaL2VzCQ=; b=0gSawI9idKMwN5O32aO/dZNrI9
	2LicoD9Qldkbr+3wtsU/PV2/5LVCILhaRT19v58bOvjwz8lpQ1YiAYQdXP5EHHoIGPkgQRd0oGpSP
	StpxBHW+Fgn6xeDHbJDqOFcll5OYN9f3skCfs7X4t1HD5gKp3BLmnc0AFc78Eli0fCgfQaxKBZ0lj
	8D/J8CyoryaZ/vzZOmNJmIq+7HRNCJ+2TFm+6cXUToVaWF+QEAvdeAc4mH1R53OeKm0+MaGPgVEGA
	cZWZwKwpWJxfeprEEqGdQSg0z1KKe0tLVzJOXl5Tvf2TzlqC8fUgjweNqxWFY/RAj2phvBe+lsm54
	1TmQ/P8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1P9Y-00000001tUk-0t1F;
	Sat, 14 Mar 2026 13:35:40 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1P9U-00000001tU2-2qub
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 13:35:38 +0000
Message-ID: <9ddae3d2-173d-460d-b283-12c983164a69@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773495330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCQypaxGFFgaS/osfKeG64nMyEQeNeo+f0gUaL2VzCQ=;
	b=ATcLf6pUL5PolIpynwkOemQNh/JOzJgYMTtGVocrmmsdcKE9lPzi9ndB0PzBgNNSSM0ICr
	wjFQQqPQVnbd6X4T9U0cuetJfLL/c4CIy5VLk81YnMRZS549AA5wpqCADTy63tsjdpB759
	OpD0gUF9wxLUxYQXXBGzc5UvPvV0Rpc=
Date: Sat, 14 Mar 2026 21:35:10 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v9 4/5] bpf, x86: Emit ENDBR for indirect jump
 targets
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: a.s.protopopov@gmail.com, alexis.lothore@bootlin.com, andrii@kernel.org,
 ast@kernel.org, bjorn@kernel.org, bpf@vger.kernel.org, chleroy@kernel.org,
 daniel@iogearbox.net, davem@davemloft.net, eddyz87@gmail.com,
 gor@linux.ibm.com, hbathini@linux.ibm.com, hca@linux.ibm.com,
 hengqi.chen@gmail.com, iii@linux.ibm.com, johan.almbladh@anyfinetworks.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, list+bpf@vahedi.org, luke.r.nels@gmail.com,
 martin.lau@linux.dev, naveen@kernel.org, paulburton@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, udknight@gmail.com,
 xi.wang@gmail.com, yangtiezhu@loongson.cn, yonghong.song@linux.dev
References: <20260312170255.3427799-5-xukuohai@huaweicloud.com>
 <20260313101505.104686-1-leon.hwang@linux.dev>
 <f384599a-75b8-4387-80db-b20429a0bafd@huaweicloud.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <f384599a-75b8-4387-80db-b20429a0bafd@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_063537_249605_BD3ED160 
X-CRM114-Status: UNSURE (   8.32  )
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

On 2026/3/14 14:48, Xu Kuohai wrote:
> On 3/13/2026 6:15 PM, Leon Hwang wrote:
>>> +#ifdef CONFIG_X86_KERNEL_IBT
>>> +        if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
>>> +            EMIT_ENDBR();
>>> +#endif
>> NIT: is this CONFIG check necessary?
>>
>> EMIT_ENDBR already checks it.
>>
>> #ifdef CONFIG_X86_KERNEL_IBT
>> #define EMIT_ENDBR()        EMIT(gen_endbr(), 4)
>> #define EMIT_ENDBR_POISON()    EMIT(gen_endbr_poison(), 4)
>> #else
>> #define EMIT_ENDBR()
>> #define EMIT_ENDBR_POISON()
>> #endif
> 
> Well, the code was originally written exactly without the #ifdef, but it
> triggered
> -Wempty-body warning: https://lore.kernel.org/bpf/202603051414.AAMjmOHv-
> lkp@intel.com/.
> 

Let's update the macros instead, which can avoid the build warning and
get rid of the CONFIG check as well.

#define EMIT_ENDBR() do { } while (0)
#define EMIT_ENDBR_POISON() do { } while (0)

The way of "do { } while (0)" is commonly used in kernel.

Thanks,
Leon


