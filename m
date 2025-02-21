Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8503C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0vFszfjLRPUBsYWT5+eUQORh5cGIC4pgSuTijYp52A=; b=mYyAXiSMxvXPX3lfRYSVBnJ4Np
	pBp12p7uKOJ9Ryg2+9Eq9N0APuXroYQS713w6ynzqZv2214SlMfqvoV/gyF0/1xQfrtA2fytheAfR
	sNKe8uillgkHUCnstf6fpByIqgzjgLsEtBlWf569rDa2oQdM3ePTDBGK0cZoXIzD+oVYGrpEOlAAw
	5c5QRvtpJNshDck5saF3INLO4ML7Zmx54QuFcMtxWl0INgGbGoIGPY3rCJXnQ1vJ3JD88Dt41EZ7s
	t9GhP9p1wE0LzW5T+rCxSkoZjujoS6kU/N2JvoODBvLQWOjUwPxLonVgk4SEd0f+0sUsfku6ySH+L
	QciY6Ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWWY-00000006Jo8-0sx7;
	Fri, 21 Feb 2025 17:09:14 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWM8-00000006HVz-07R9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:58:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E21244327;
	Fri, 21 Feb 2025 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740157103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0vFszfjLRPUBsYWT5+eUQORh5cGIC4pgSuTijYp52A=;
	b=TYK6ehXeLbHK0RIEExHccJKgNtcaYsy53jurbwoa4CiaZqXiOv96PkqPPed+4qwAYpjAuO
	r2uhzLSM4bH6moFmPA2saexW4KimCSKoGMXa9hpqk9Lgf5vynKkwJwe3tADJjZxFz6tw78
	C4mULaELttNGUC0aQyQMG+PLkRTKcfHJ5svUbmhyVud1is/g4ZRumQwGBlgx/nFDAV4vNj
	FF95HbqmPoG0cegOhkGupJZXzmmqlu7u2D5MQijyFopXD3na0bVoFWlOXhgGaeD4Qnn4n9
	Yo27SAheJ0IDMmb/mJk47MKUbAybOUZu16HVxvGmS4ku/9b7Z/Ibw8yYp7Ji1g==
Message-ID: <b41cb993-3cdf-4cfb-a131-14c1a66c8824@bootlin.com>
Date: Fri, 21 Feb 2025 17:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2] arm64, bpf: Add 12-argument support for bpf
 trampoline
To: Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay12@gmail.com>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Florent Revest <revest@chromium.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>
References: <20240705125336.46820-1-puranjay@kernel.org>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <20240705125336.46820-1-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduuedugeevveelledtudegleethfffuedtgffhlefgudektdeuheegkeekudehfeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgfkrfggieemvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehpuhhrrghnjhgrhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehio
 hhgvggrrhgsohigrdhnvghtpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeihohhnghhhohhnghdrshhonhhgsehlihhnuhigrdguvghv
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_085828_544968_CFF8E3B6 
X-CRM114-Status: GOOD (  18.87  )
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

Hello everyone,

On 7/5/24 14:53, Puranjay Mohan wrote:
> The arm64 bpf JIT currently supports attaching the trampoline to
> functions with <= 8 arguments. This is because up to 8 arguments can be
> passed in registers r0-r7. If there are more than 8 arguments then the
> 9th and later arguments are passed on the stack, with SP pointing to the
> first stacked argument. See aapcs64[1] for more details.
> 
> If the 8th argument is a structure of size > 8B, then it is passed fully
> on stack and r7 is not used for passing any argument. If there is a 9th
> argument, it will be passed on the stack, even though r7 is available.
> 
> Add the support of storing and restoring arguments passed on the stack
> to the arm64 bpf trampoline. This will allow attaching the trampoline to
> functions that take up to 12 arguments.
> 
> [1] https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst#parameter-passing
> 
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

[...]

+cc Xu Kuohai + cc Florent Revest, who are involved in [0]

We at Bootlin are currently working on improving eBPF selftests coverage and
aligning ARM64 support with other platforms. For this second topic, one
remaining point is the support for 12 arguments in bpf trampolines. It looks
like a big part of the work has been done and submitted through two different
versions, the first one from Xu ([0]), and this one from Puranjay ([1]). There
is still some rework needed in both versions to properly handle some alignment
constraints.

@Puranjay @Xu are you (or anyone else) actively working on those series (I kind
of understand that you both agreed that Puranjay was continuing this work) ? If
so, if there a way to assist you on this topic ? If not, can we take and revive
your work to try to handle the missing points and make this feature integrated ?

Thanks,

Alexis

[0] https://lore.kernel.org/bpf/20230917150752.69612-1-xukuohai@huaweicloud.com/
[1] https://lore.kernel.org/bpf/20240705125336.46820-1-puranjay@kernel.org/

-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

