Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D082C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 01:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ly5FuncggLhXbMUbhUGfi8iZRSSYI9Jm5KjBg8D2bi0=; b=o71nayeOsP06hpGcN+Bj+ioX0F
	/Zo190urK22a8m+i3vTTG9qPMCTKfojcJJ3mZwU4i82xBPeVOGhDlKWrbKn5vCW3xTNam4LTCGdYy
	hoayx/O+IRTBGsSatnzIa+udiD2BECqq0gpQCjaKuY7XJsp0p1KyCGfeZDXAm0vW8qtBz6VtxJjN5
	pPgLnzy4h7CT9UQdGOIyUTmYkGd0AMIiF2xBzr89xEAKxTerTgvh7l1eTi9B6FMTylIv4ixf1hZSa
	QSKwNR+H8P3QsSxU91dFiydnnCVWW85IvRVw0wwdq3Ftj5LJMfvrXIczEsvG/UBCkhiGxJcIftL6i
	C7v/XNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqhXw-0000000GA24-04RI;
	Mon, 03 Aug 2026 01:32:52 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqhXs-0000000GA1h-1WCj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 01:32:50 +0000
Message-ID: <6af761df-9abc-4854-971d-ca6e4ed7a2b7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785720762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ly5FuncggLhXbMUbhUGfi8iZRSSYI9Jm5KjBg8D2bi0=;
	b=PdBfkCdXX4c2Ob0V4n7XAwF5okf8087+nlLd/Z6DdOK5NsvxNWr43oDh7owS/wZKYuyKQK
	Zgx0dMHJI3r6YiGIlTiiTwJXPdVfTRaQOGI7BPULl2H3nF8TvPxrk/zUFhu9Yww40URGyk
	TsYvYHhQJEziQ9EZY2h2dDaN3Ui15Jw=
Date: Mon, 3 Aug 2026 09:32:14 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct
 calls
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260727142844.21212-1-leon.hwang@linux.dev>
 <20260727142844.21212-2-leon.hwang@linux.dev> <amnqXeC6D4mjcAe_@krava>
 <d745ca80-6516-4c61-8107-88c6a2d9cea4@linux.dev> <amsuU7eXuoziObdh@krava>
 <3f8e64b4-e60a-4eba-afb6-5af668ac1f85@linux.dev> <am-sK_buCVI3khJv@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <am-sK_buCVI3khJv@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_183249_383976_77B458D6 
X-CRM114-Status: UNSURE (   8.70  )
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

On 3/8/26 04:44, Jiri Olsa wrote:
> On Fri, Jul 31, 2026 at 10:30:37AM +0800, Leon Hwang wrote:
>> On 30/7/26 18:58, Jiri Olsa wrote:

[...]

>>
>> Right.
>>
>> Pls see the sibling thread with Ihor. With in-range BPF trampoline
>> allocation, the slow-path regression should mostly disappear.
>>
>> Let's continue the discussion in that thread.
> 
> please paste the link/subject for that thread
> 

The link is
https://lore.kernel.org/all/77edc25d-a521-4f65-84ed-dbb016593902@linux.dev/.

Thanks,
Leon


