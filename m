Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD7EEA4E3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhyPpNHT+7FAPWparjtNDEXTVS3lZcX8CHma9Mj4ghs=; b=EnwCMd2QcMcE0ZSfRmeobvdEBl
	8Z2sk0tltM/T+8Qe5H6x2+3ndPsQtWV0mtSmK0zNTqYsfpCTi0453FvvTQjICPJ5QWvbo7/JqoY2n
	HICyy9gjskfrR+3nMJ6VyQUaAtg1RB2M1kqjWCW5CZVbbZ730LjA1nG9lW/mS7fzvAlEzxQpnP1om
	3kiRpOvhuBvwtED0ynjdFgE8s+SkJgaMPGfjgbFUMTLD8NvhAgx1ub1lNsTtPfasJSZxOfBEdQO3e
	W2fKWZi2kZwMskzeS6gv+Y4p/MckbMVYkoKAsThAaS1obSJ9/3MAE6BLajNI3eMHzw7Xx/EcOk+SY
	WTWeS+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6Ec-0000000DVCy-1IlG;
	Mon, 02 Mar 2026 16:35:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6EZ-0000000DVCV-3SOU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772469301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qhyPpNHT+7FAPWparjtNDEXTVS3lZcX8CHma9Mj4ghs=;
	b=cCl3zcn+64BnksJwZVl5JeqLShkxYsyZGH34ct5aBliv4YCqQy6oJ1+Lou151+Xo0fj7Xg
	BTmeOPDzGaRugv329Lbxka/QgTr2Zs93kg1CRft4aHfOVfmeFvKm1f+N6DljlWChNGRrk6
	Zsn2Xg/gk5SOhpOTKnkSb7Wurt/Ek9I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-jeHT-FfnNsmFsuaxdFbFAw-1; Mon,
 02 Mar 2026 11:33:19 -0500
X-MC-Unique: jeHT-FfnNsmFsuaxdFbFAw-1
X-Mimecast-MFC-AGG-ID: jeHT-FfnNsmFsuaxdFbFAw_1772469197
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D41851800352;
	Mon,  2 Mar 2026 16:33:16 +0000 (UTC)
Received: from jbrnak-thinkpadx1carbongen9.tpbc.csb (unknown [10.43.17.6])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 835DB19560A3;
	Mon,  2 Mar 2026 16:33:10 +0000 (UTC)
Date: Mon, 2 Mar 2026 17:33:07 +0100
From: Jakub Brnak <jbrnak@redhat.com>
To: James Clark <james.clark@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org,
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
Message-ID: <aaW7s-ISz1QGpmqB@jbrnak-thinkpadx1carbongen9.tpbc.csb>
References: <20221020101921.1219533-1-james.clark@arm.com>
 <20221020101921.1219533-2-james.clark@arm.com>
 <Y1F8DUWaWhlh/phL@hirez.programming.kicks-ass.net>
 <4e50b890-0588-1551-fb7c-6cd8191d1054@arm.com>
 <Y1q914IVy6XgE1xq@hirez.programming.kicks-ass.net>
 <133c2f4b-1ca5-2d0c-f4f4-e01ff5e028c8@arm.com>
MIME-Version: 1.0
In-Reply-To: <133c2f4b-1ca5-2d0c-f4f4-e01ff5e028c8@arm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: Acoz674rDJWdDnLRGpZD5smVkppR0VoqGPqRUqkaCZ8_1772469197
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_083503_940281_5F2768D5 
X-CRM114-Status: GOOD (  29.47  )
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

On Mon, Oct 31, 2022 at 01:48:56PM +0000, James Clark wrote:
> 
> 
> On 27/10/2022 18:20, Peter Zijlstra wrote:
> > On Tue, Oct 25, 2022 at 04:28:12PM +0100, James Clark wrote:
> > 
> >>> Why do we want the same mask repeated over and over with each sample;
> >>> should this not be part of the address space (side-band) data?
> >>
> >> You are probably right that it could be done that way. The reason that
> >> we did it this way was to be consistent with ptrace feature [1] where it
> >> is delivered to userspace on a per-process basis. And there is also a
> >> prctl for the enabled key types [2] which can be changed dynamically.
> >> Particularly for the last reason is why it was done per sample.
> >>
> >> Having said that, the enabled keys field is not used by perf, only the
> >> mask is used, so I can drop the per sample data until enabled keys is
> >> needed, which may be never.
> >>
> >> I'm going to assume that perf shouldn't use ptrace because of
> >> permissions and conflicts with debuggers, so I could put the mask
> >> somewhere like PERF_RECORD_FORK instead of per sample.
> > 
> > Yeah, or create an new RECORD type which you can also send around at
> > prctl() time.
> > 
> > The only thing that's needed on top of that is exposing the mask
> > somewhere in /proc for existing tasks; which is what perf also uses to
> > syntesize RECORD_MMAP events on startup etc..
> > 
> 
> Hmm ok, in that case I can just add the /proc interface for now because
> the mask won't change and we can add the new record type at the point
> it's needed in the future.
> 
> Thanks for the feedback.

Hi all,

Does anyone know how this issue was eventually resolved? 
Specifically, is the mask for the pointer authentication bits 
currently exposed and stored somewhere in perf.data so it can be 
used when running perf report?

Thanks,
Jakub


