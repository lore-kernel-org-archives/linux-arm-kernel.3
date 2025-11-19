Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B89CF58C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pv0XlKeHKZGqLBZRpSk45yrLMGSlkYdrCdlOGgiMXMk=; b=aMkpteXYAIS2dS5MO88s2CQBI/
	bB01dOD1WPg5qqK8Fw0+W4sEvjDmpUUblgG+VO+GNarRO08cy8PB9ANEwBrUrbumbM04JRomLSpfk
	UPg0KVvT88el1OdK+eTM+R5KvTEbVesNm6uxOlsRta/CNuxoDbwimJyRZbglp8UnrCcsOoWPKG18S
	by0+FvExaJiG11m9aLAwNeIoNzG0s36vAP3Mr6e/Ha6Aw6I5NbrrSxHd1sR9Fh+XpcQ8XrbSl1xW4
	s3xbaUpDERun7IKX+KKd74U0EATUAX7lAppvEwUnwXltpE+mPLkyuFDPV3hiVqrxzjoQxNfUYJqBY
	FqsbuKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn4L-00000004fIU-3s8T;
	Wed, 19 Nov 2025 18:38:17 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLn4J-00000004fHJ-0U1k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:38:16 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id C8AB716060D;
	Wed, 19 Nov 2025 18:38:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 81EA330;
	Wed, 19 Nov 2025 18:38:06 +0000 (UTC)
Date: Wed, 19 Nov 2025 13:38:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
 mhocko@suse.com, tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-arch@vger.kernel.org,
 tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 00/26] Introduce meminspect
Message-ID: <20251119133836.47d9ae73@gandalf.local.home>
In-Reply-To: <b0102b82-9ae8-4e01-ba27-44b78b710fca@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
	<20251119131534.392277e3@gandalf.local.home>
	<b0102b82-9ae8-4e01-ba27-44b78b710fca@linaro.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: cc1o33w6u6owrkxkfh83ifny9egjgrsa
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 81EA330
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18eQxzjFElSFMQBkWmqdnIUBJkOF0f6iiE=
X-HE-Tag: 1763577486-542771
X-HE-Meta: U2FsdGVkX18hYyFLn4NceFAtmtr2U9i2vMLdUUZa/XY9sbc18Qd8d0XqWxwjkyLUW391A4PmfVST6fTOPo9/v/GlV/882/v3PjE3Q5zfS5DD1vsLm+4ecyYB6S0zd8UbhIjnn5oMxPSN9iXqq6UxrC6D2V+tXEx8ZTe18jJnlx5L3nYf++HdtV6ezZc8QQOsd5Sji+bCYcQ6BWUI2yZNs93T38KE14+xuHs3A5shJ2l0kZqx610Kyw6apiwgHfwv9/5JD181MK+WYyNpUzWoatcjkFOIYbmW/eiebkRWkR1PTFbDxKfNL2AREBIQ9kzXso7tg4Agi6AvAp3c/q8HXYwDktY4Ul7c6O7qpQnkvKOsmFMGedUEWwFLRTKDlkmz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_103815_239790_85B8A79C 
X-CRM114-Status: GOOD (  22.58  )
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

On Wed, 19 Nov 2025 20:24:23 +0200
Eugen Hristev <eugen.hristev@linaro.org> wrote:


> The problem is that all the meta-data is not allocated inside the
> preallocated buffer. The meta-data is kmalloced all around the code. I
> mean the structs that hold the information on what's in the buffer. You
> know what I mean.
> And all these kmalloced things, turn out to be in order of hundreds just
> on a kernel boot, which I tested. This is not feasible for the
> meminspect table, as it would get overcrowded very easily.
> I thought of perhaps trying to kmalloc all of them in a dedicated cache,
> but I haven't progressed on that. Another idea would be to try to
> recreate the meta, but I have not found a way to do it yet.>
> > That is, by using the persistent ring buffer code with the meminspect, if
> > the firmware doesn't save the memory across reboots but allows you to dump
> > it to disk, you can enable tracing within the persistent ring buffer, on
> > crash, extract the buffer, and then use trace-cmd to rebuild a trace.dat
> > file that you can now inspect, and see the trace that lead up to the crash.  
> I used 'crash' tool with trace plugin and I am able to see all the trace
> contents, but, with the limitation above. (To achieve this, I dumped a
> huge area to include it, so , not feasible for my goal )

Can't you at boot up just run:

   trace-cmd restore -c -o trace-head.dat

?

That records all the meta data of the running machine, and places it into a
trace-head.dat file. You can save that off anywhere.

Then after a crash, if you split the buffers up into individual cpu raw data
files, you can then run:

  trace-cmd restore -o trace.dat -i trace-head.dat trace-cpu0.raw trace-cpu1.raw ...

And it will create a trace.dat file for you that you can read with:

  trace-cmd report trace.dat

-- Steve

