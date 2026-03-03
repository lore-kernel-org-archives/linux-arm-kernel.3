Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C71EDA687
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UH+wJFG1is4VhCt6VCQk3B+WYW2jwwCpdCeVnjAZdCI=; b=AqX/yeSGbUGaupHwDUDEJqLAQf
	ZR6tsOZf/nWnmxxVcVua/+KB/8WER3LTWlcjFpXzqNzRDiuXTLQET+Hy1cAdFmqPxXXJYFmDp51xe
	8ssYfLp01n5eK1N+xQ9W/hAwaA2sg9Y0EYAXbiXb673/cW9L7FStkdI4wweexDWmPs2wMm7Ju2go+
	l597OcmeNkFe3g4X1xTbVl4lDylmzZgzvIrcBSDbgfdfTzINfBR7dJ12nCqHqzo8lV076rz4q0lVR
	np5hr1ztDioErS69WXU2xl13PN1zRMiB3FJhiVIhgBu4xGAqFjz4MPk11obBp/QuPZ3UhrjQ/9d9Y
	rL3g3TMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRdg-0000000FQg4-2OBQ;
	Tue, 03 Mar 2026 15:26:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRde-0000000FQfO-1bR1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772551581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UH+wJFG1is4VhCt6VCQk3B+WYW2jwwCpdCeVnjAZdCI=;
	b=VzWD5kmKt3VNuP41wKrm26NKQUfJVxuLWxbm9WfQ4s1d7XUnrKvaXKnX8jcIqdOHc55XPu
	/nfVmD9JcLbjMU/Qv7qzd+CJLSEo98Foqbnq9XsL/Fj8vBF3CPIOmw2u2hjyyYRmYjIWn0
	DAz9pYoH59G3jc32bTN1O0pKVsbSouQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-cbjmnpNFNh-MvtOM7B-7lw-1; Tue,
 03 Mar 2026 10:26:17 -0500
X-MC-Unique: cbjmnpNFNh-MvtOM7B-7lw-1
X-Mimecast-MFC-AGG-ID: cbjmnpNFNh-MvtOM7B-7lw_1772551572
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D2D91956055;
	Tue,  3 Mar 2026 15:26:11 +0000 (UTC)
Received: from jbrnak-thinkpadx1carbongen9.tpbc.csb (unknown [10.43.17.6])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BEC381800576;
	Tue,  3 Mar 2026 15:26:05 +0000 (UTC)
Date: Tue, 3 Mar 2026 16:26:02 +0100
From: Jakub Brnak <jbrnak@redhat.com>
To: James Clark <james.clark@linaro.org>
Cc: James Clark <james.clark@arm.com>, Leo Yan <leo.yan@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	broonie@kernel.org, acme@kernel.org,
	Andrew Kilroy <andrew.kilroy@arm.com>,
	Vince Weaver <vincent.weaver@maine.edu>,
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v2 1/1] perf arm64: Send pointer auth masks to ring buffer
Message-ID: <aab9ioyUSAZ7n8Gw@jbrnak-thinkpadx1carbongen9.tpbc.csb>
References: <20221020101921.1219533-1-james.clark@arm.com>
 <20221020101921.1219533-2-james.clark@arm.com>
 <Y1F8DUWaWhlh/phL@hirez.programming.kicks-ass.net>
 <4e50b890-0588-1551-fb7c-6cd8191d1054@arm.com>
 <Y1q914IVy6XgE1xq@hirez.programming.kicks-ass.net>
 <133c2f4b-1ca5-2d0c-f4f4-e01ff5e028c8@arm.com>
 <aaW7s-ISz1QGpmqB@jbrnak-thinkpadx1carbongen9.tpbc.csb>
 <197f3d1e-5d1e-4b2d-a12b-782287eecc43@linaro.org>
MIME-Version: 1.0
In-Reply-To: <197f3d1e-5d1e-4b2d-a12b-782287eecc43@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: zm6afdwtC1BX8OG5GQq_pEM5Dwqe6zeMxHICuzMp-xg_1772551572
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_072622_504323_0660C9CC 
X-CRM114-Status: GOOD (  49.23  )
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

On Tue, Mar 03, 2026 at 10:38:23AM +0000, James Clark wrote:
> 
> 
> On 02/03/2026 4:33 pm, Jakub Brnak wrote:
> > On Mon, Oct 31, 2022 at 01:48:56PM +0000, James Clark wrote:
> > > 
> > > 
> > > On 27/10/2022 18:20, Peter Zijlstra wrote:
> > > > On Tue, Oct 25, 2022 at 04:28:12PM +0100, James Clark wrote:
> > > > 
> > > > > > Why do we want the same mask repeated over and over with each sample;
> > > > > > should this not be part of the address space (side-band) data?
> > > > > 
> > > > > You are probably right that it could be done that way. The reason that
> > > > > we did it this way was to be consistent with ptrace feature [1] where it
> > > > > is delivered to userspace on a per-process basis. And there is also a
> > > > > prctl for the enabled key types [2] which can be changed dynamically.
> > > > > Particularly for the last reason is why it was done per sample.
> > > > > 
> > > > > Having said that, the enabled keys field is not used by perf, only the
> > > > > mask is used, so I can drop the per sample data until enabled keys is
> > > > > needed, which may be never.
> > > > > 
> > > > > I'm going to assume that perf shouldn't use ptrace because of
> > > > > permissions and conflicts with debuggers, so I could put the mask
> > > > > somewhere like PERF_RECORD_FORK instead of per sample.
> > > > 
> > > > Yeah, or create an new RECORD type which you can also send around at
> > > > prctl() time.
> > > > 
> > > > The only thing that's needed on top of that is exposing the mask
> > > > somewhere in /proc for existing tasks; which is what perf also uses to
> > > > syntesize RECORD_MMAP events on startup etc..
> > > > 
> > > 
> > > Hmm ok, in that case I can just add the /proc interface for now because
> > > the mask won't change and we can add the new record type at the point
> > > it's needed in the future.
> > > 
> > > Thanks for the feedback.
> > 
> > Hi all,
> > 
> > Does anyone know how this issue was eventually resolved?
> > Specifically, is the mask for the pointer authentication bits
> > currently exposed and stored somewhere in perf.data so it can be
> > used when running perf report?
> > 
> > Thanks,
> > Jakub
> > 
> > 
> 
> Hi Jakub,
> 
> No we never finished this, you're actually the first person to mention it.
> Can you give a bit more detail about your use case? Maybe we can dig out the
> old branches and work on it again.
> 
> For a summary of the current status, frame pointer unwinds in the kernel are
> working with pointer auth because the kernel strips them.
> 
> We patched libunwind for support on commit f67ef2867bc5 ("Unwind with
> pointer authentication on arm64"). And libdw on commit 0af6c7289c22
> (libdwfl, aarch64: Demangle return addresses using a PAC mask). These two
> were to support dwarf unwinding, but the kernel changes to expose the mask
> and Perf changes to pass it to the unwinders were never finished.
> 
> Thanks
> James
>

Hi James,

Thanks for the answer. I was investigating a failure in one of the perf tests on 
AArch64 RHEL-10 that verifies stack unwinding using DWARF, and it was consistently 
failing. I dug a bit deeper and discovered that DWARF unwinding in perf report does 
not work correctly at all, and addresses polluted by PAC bits are likely the cause. 
I stepped through the program and observed that in libdw the code path responsible for 
masking these bits is executed, but the mask is always set to 0 and therefore has no effect. 
During the unwinding process, there is a structure that is supposed to store the 
mask and use it later. However, since perf constructs the unwinding context offline from samples 
and currently does not store the mask anywhere in perf.data, there is likely a no way to propagate 
it into that structure. It would be nice if we could push this forward. 

Thanks, 
Jakub 


