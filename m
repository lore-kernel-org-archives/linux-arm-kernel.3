Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F214C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sXLqOGwJPjjQ1mrwjcKafFgt74IfGmcKaUYu1Vea1Y=; b=ENUx2jkMX+Bd3SQG36Rr7zuX99
	c3a/KOqky9FAVPoUbhCHTHz1Ufn7TqPfI5fiUpODOV1crxWjeTFpvfrg/huyK+xyL7TRl5nRQ93sC
	qHcbW8YfNGBPiX7PIjjrkO6Q8HO4SR2e6Uha1dSj6R7w8olg3DKXTM3FNjwFdhgBrsZLXUaU6j4+Z
	1edF+3cHoJv6dnLHd2zE0K5GaPHDF2ksix5/wfpw497V4YykOAdoAyAVHnBES9sQqWUKRFskumzhP
	s8oXNnDosBkNcAVArXnveyvTeqxAy4EDHsLseTXJBBz8uubU//d2Kj+4st82kEhejVcTN0Eea0/U5
	arY54R0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTkP-000000056Ji-2Q1q;
	Tue, 04 Mar 2025 14:59:53 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTfA-00000005525-2fcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:54:29 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 524Eqsmu2303478
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 4 Mar 2025 06:52:55 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 524Eqsmu2303478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741099977;
	bh=6sXLqOGwJPjjQ1mrwjcKafFgt74IfGmcKaUYu1Vea1Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=HsBac2XWWG8JTb5veE6LuaAtOLLvQu+vBFWgoKJItDg2FR2nOr9Ue8lryfQJFNb5X
	 ojvI2P5MCIyrjDnZDpX41nGdlho2yRe4glo+hru+12GUQ7NBtdvcBedZZUsuJAWMmd
	 N1yfFPWJ9WTY4SudzJVAuXk+ooFW+J2KOOkX3rNtdkndtmyJKXCfOOPoNoEFrEvYyS
	 l+SyUMQ+mbWmrFpz4qKD1NBiUxnxzQF3eOYkhvJKEwllwoiSYqGIWHFHl+eS6oQqxV
	 mHa7p//gFjY/UXuPZ99CFf8KpquSyK6rWISD0Qpt03vNg4h+TUDKnvTetXzksGMPfD
	 /cUCOphcQnqWw==
Date: Tue, 04 Mar 2025 06:52:53 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>,
        Menglong Dong <menglong8.dong@gmail.com>
CC: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
        eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org,
        davem@davemloft.net, dsahern@kernel.org,
        mathieu.desnoyers@efficios.com, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        samitolvanen@google.com, kees@kernel.org, dongml2@chinatelecom.cn,
        akpm@linux-foundation.org, riel@surriel.com, rppt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
        netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
User-Agent: K-9 Mail for Android
In-Reply-To: <20250304094220.GC11590@noisy.programming.kicks-ass.net>
References: <20250303132837.498938-1-dongml2@chinatelecom.cn> <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net> <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com> <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net> <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com> <20250304094220.GC11590@noisy.programming.kicks-ass.net>
Message-ID: <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_065428_671393_32480982 
X-CRM114-Status: UNSURE (   9.14  )
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

On March 4, 2025 1:42:20 AM PST, Peter Zijlstra <peterz@infradead=2Eorg> wr=
ote:
>On Tue, Mar 04, 2025 at 03:47:45PM +0800, Menglong Dong wrote:
>> We don't have to select FUNCTION_ALIGNMENT_32B, so the
>> worst case is to increase ~2=2E2%=2E
>>=20
>> What do you think?
>
>Well, since I don't understand what you need this for at all, I'm firmly
>on the side of not doing this=2E
>
>What actual problem is being solved with this meta data nonsense? Why is
>it worth blowing up our I$ footprint over=2E
>
>Also note, that if you're going to be explaining this, start from
>scratch, as I have absolutely 0 clues about BPF and such=2E

I would appreciate such information as well=2E The idea seems dubious on t=
he surface=2E

