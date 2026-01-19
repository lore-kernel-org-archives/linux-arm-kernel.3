Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AB9D29C32
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG6nRlScgv4EgzSEG38CyLsoC266o6zac/M9Wp3T0FU=; b=u+zH6548JvwTcqIaY5rD+5UXj6
	5paoBN9icM1ZNdK5FQsnp8LuR9Sn3LzMQ2CXdBsPw5jSnj8pGl7mX4gtJHxQ56pbafzpu+pj+pVMx
	9Z/cxBqVeh855K+IGW8GAS+z4sS5O+Sw7l+jc3FUor4N7s9EVgCY27cmgfkH5nsoe62G9tbGuJN1G
	P3Vz75F8St4qh3PZXWjsv+qDC9t6E1kTCOF8B8ix+PjEzee8Y5F5swKRjjbhHxPOOaMPxMzyElp7f
	X+IyLck9asyI18gftozdqxrlhyZoRwRWtvk3tyGjzP7fiLyzD0HNxoeOgO1Oxoh5QoiJWPiQ1Hu9I
	vIrL3+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht0W-00000002dxH-27kr;
	Mon, 19 Jan 2026 17:25:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vht0R-00000002dwY-1xVQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADA494365C;
	Mon, 19 Jan 2026 17:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CA9C116C6;
	Mon, 19 Jan 2026 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768843534;
	bh=ef9KQiTORUeb2xh0Xx3sReVnHgoY66PauPM/FZXCvKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEyzhk9ZqdotAX7CWbrJ8CF/jmjwQf/SDsxcWMpaKGVGLWpbZpmXyXk26ST9ULELX
	 0rp1RQBRbcV7SWWtXwe6HIO5PhcXE9fmFgPSZAoTtUGUmJzM2HiV+fdev8TvJSe6/C
	 aIvrXwejtSNAAeolmTbC+msJEIvFFGXcc3hXo83q/VHu+gutfs9yXpwCug47930cvw
	 1cV4L6X2lwNWANrA1tIN1YxfWWz7csgxms2BtforRUKaCgPoRzhJzgIULLD0U+Npkm
	 V5v+HILIwJc7O5Qn7zmhNTVrj/R+fQ2x5VHOT8Ny5b9Xv/HUTSMBW6B5fWH/N5iaI8
	 ZTLeGRn/z7STw==
Date: Mon, 19 Jan 2026 11:25:31 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <i4zd3jesjrbljym7xuhwo5v7gwbsbuesuarnxr462eeuosevij@64hcfdzht6w3>
References: <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
 <aW5iQABCRukZXpZH@bogus>
 <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ldzdsyspd3s6on3cwyanjeheegoeba6kn6qaybojtqeca7335@cyemyxk6kck4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_092538_220903_68BA6019 
X-CRM114-Status: GOOD (  30.15  )
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

On Mon, Jan 19, 2026 at 07:20:09PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 04:56:32PM +0000, Sudeep Holla wrote:
> > On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > > > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > > > 
> > > > > To me, when you decided to add a second caller to soc_device_register()
> > > > > you created a regression in the userspace interface. If nothing else
> > > > > it's a leaky abstraction.
> > > > > 
> > > > 
> > > > In that case, shouldn't soc_device_register() made to give error when an
> > > > attempt to call it more that one time then ? Also should be change the
> > > > ABI documents to refer it as soc0 and not socX ?
> > > 
> > > Then the whole SoC bus is an overkill. But I have a strange question
> > > here. Consider the device having the "BT / WiFi SoC" next to the main
> > > SoC. Is that SoC a legit target to export informaiton through sysfs /
> > > soc bus?
> > > 
> > 
> > Just for clarity, I agree with you and there could be duplication of
> > information if there are multiple source for that information. E.g.,
> > the setup in this discussion where the EL3 firmware provides SOC_ID
> > information via SMCCC SOC_ID and DT providing vendor specific information
> > about the platform. Both are getting exported via sysfs but the problem
> > here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.
> 
> I understand the context and I understand that we ended up having two
> soc devices for the main SoC. And that's exactly why I'm asking about
> the WCN SoC exporting the information through the same interface. If it
> is a legit user, then it is a possible outcome that WCN binds to soc0
> while the main core gets bound to soc1 (even without SMCCC_ID in place).
> 
> Likewise if WCN if a legit user of soc_device_register(), then we can't
> make it fail after registering the first entry.
> 

But by this definition, a vast variety of discrete IP should register
with this interface - instead of providing such information in their
respective functional interface.

My interpretation is that the soc_device_register() related to the
entity which is represented as /soc in your DeviceTree.

For a broader "dumping ground for different IP to register their
version information", we'd need some way to associate each entity with
the related component - which I believe there is none, because then you
could have used the specific driver interface in the first place.

(I.e. there's no representation of the WCN SoC in our system, we have
representations for the PMU, the WiFi, and the BT core, but not the
whole).

Regards,
Bjorn

> > 
> > We are exploring ways to see how user space can survive this.
> 
> -- 
> With best wishes
> Dmitry

