Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CE3C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 01:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OGpJKlqYKJlS0pLuHn983Uuh5n9DtUrxuwcndbRF+g=; b=42SXfN3mm0OhsZaWTPpzPIYxXL
	0qLUyuULtkQwjYWh0bSbsAddUlbZB+j3F+FYqZl/jkmTN/FGifSRzNILJfjluUyHUHsCQHuWtR2PO
	CsrUCPk9ZKL2CxllKNV+lrh3JtGvWHCyEWOyB8GXZ/4WtP4Liz5ytTlZJbZK3GKIqG+kwZ4f4E1J6
	63Kl/TN0mBkdadCEdqIRJpBSnPKKTPAng0GryKJWxiVJxMKkVSYue9E1nmhPF/MiEWOdwLTVjsNA+
	iPSKtN4tTOI0ldvBpblLpcUNXkMF2bRqZslE9xxAG7Q1d6SDB+vJt6i9WE+lYVOwEckRYgNR87V7k
	Ca0kE0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgZpP-0000000BpbH-0UZS;
	Sat, 08 Feb 2025 01:40:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgZnz-0000000BpQY-1wh4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 01:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738978725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4OGpJKlqYKJlS0pLuHn983Uuh5n9DtUrxuwcndbRF+g=;
	b=E6gWZsu+36TGo6CxBCuxK/KU0QOuFzlIS8NCLaALobr/rETVpkZjPAV0tfK6tgDpsaTkNx
	1KluWd57+r8+QoFfiIIkBW5jWgN7jfWPLL3oBvs5P3qNV32R4SgMFfW+P4mnN/zgyjI5iG
	AYAJKYUn25NcQ43fl4TAi0ND3ekQExk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-CGeBAf_OMfe2Z_xYLc2IJA-1; Fri,
 07 Feb 2025 20:38:42 -0500
X-MC-Unique: CGeBAf_OMfe2Z_xYLc2IJA-1
X-Mimecast-MFC-AGG-ID: CGeBAf_OMfe2Z_xYLc2IJA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EE0C1956094;
	Sat,  8 Feb 2025 01:38:36 +0000 (UTC)
Received: from localhost (unknown [10.72.112.20])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBBC7180087A;
	Sat,  8 Feb 2025 01:38:32 +0000 (UTC)
Date: Sat, 8 Feb 2025 09:38:27 +0800
From: Baoquan He <bhe@redhat.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexander Graf <graf@amazon.com>, Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	changyuanl@google.com
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
Message-ID: <Z6a1kxR2GlQoepgI@MiWiFi-R3L-srv>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
 <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_173847_569669_359BAF66 
X-CRM114-Status: GOOD (  26.41  )
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

On 02/06/25 at 08:28pm, Pasha Tatashin wrote:
> On Thu, Feb 6, 2025 at 7:29 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> >
> > > This a next version of Alex's "kexec: Allow preservation of ftrace buffers"
> > > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.com),
> > > just to make things simpler instead of ftrace we decided to preserve
> > > "reserve_mem" regions.
> > >
> > > The patches are also available in git:
> > > https://git.kernel.org/rppt/h/kho/v4
> > >
> > >
> > > Kexec today considers itself purely a boot loader: When we enter the new
> > > kernel, any state the previous kernel left behind is irrelevant and the
> > > new kernel reinitializes the system.
> >
> > I tossed this into mm.git for some testing and exposure.
> >
> > What merge path are you anticipating?
> >
> > Review activity seems pretty thin thus far?
> 
> KHO is going to be discussed at the upcoming lsfmm, we are also
> planning to send v5 of this patch series (discussed with Mike
> Rapoport) in a couple of weeks. It will include enhancements needed
> for the hypervisor live update scenario:

So is this V4 still a RFC if v5 will be sent by plan? Should we hold the
reviewing until v5? Or this series is a infrustructure building, v5 will
add more details as you listed as below. I am a little confused.

> 
> 1. Allow nodes to be added to the KHO tree at any time
> 2. Remove "activate" (I will also send a live update framework that
> provides the activate functionality).
> 3. Allow serialization during shutdown.
> 4. Decouple KHO from kexec_file_load(), as kexec_file_load() should
> not be used during live update blackout time.
> 5. Enable multithreaded serialization by using hash-table as an
> intermediate step before conversion to FDT.


