Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391FFCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pw+CPMxX7kIpTRzGOW9utdbjRiEhzIi4EfaZkGwIwfQ=; b=kvXjOOIeOTJFr127IDOgi5rsRq
	BrRE8u6xTogz8EifzpGl0t8au6rIbIXF/bmVG26hEA8SISBSEYf2+ZaKecsFmkIDfZV6GUVzXP2ez
	zMTOJ323NTemnQLAiRNx4i5xVsI+jPx/DM8ufIkYw+n+j+VhkysBO/1cpC6Vb9vwNNPMxyJ9REbAn
	ryntmf5ZFcUmo542Rc7swiR435TRE+vZg0rWPchPJ3DVmnigRFdRPFqKFmIBaxYtoxn0ggNDvU+7H
	PjM9SZJOLnhIgSv82rOePOU/5IsYF142KEtTGaaA9agSSI0D1xyGD+lvLn9o+BGZhXfZFCejDfm1I
	RTadGHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmDy-0000000Gw6g-0ejJ;
	Wed, 17 Jun 2026 09:06:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmDx-0000000Gw6O-425O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:06:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 505B840611;
	Wed, 17 Jun 2026 09:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CD61F000E9;
	Wed, 17 Jun 2026 09:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781687177;
	bh=pw+CPMxX7kIpTRzGOW9utdbjRiEhzIi4EfaZkGwIwfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zbe5rA8Bp1ZRulmaMmYPa5pKdOrFqNrOs5Se+yDhmavxDWaJqTuHpePKyWkUD9AW4
	 KmL6PsO65Wi1be5roCIcW/aU/oRDosM0QnH6Ai8nenfTn7vevGg+PgpvvFqLpbOZgj
	 jd7bDKt4g5S8ikvOaONBSbT7QQdf/s5Ki+Jfqj/EBDsvoq/19Bxa1dV05WOmAH4or9
	 mz8HSUnmQ+qKgFcvvNEsLbQMO005Ojj049W1W3fzSTnEYlJU8cFZHpEmAl/VmRQyg4
	 2D7abf91XRNhU/HeQAof4QHkWl7/uMQgPhNFRriuHGghBLl0UQUhkbecfqJr9cNYtZ
	 NjERu/NhylcgQ==
Date: Wed, 17 Jun 2026 10:06:13 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
	Trilok Soni <trilok.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Subject: Re: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
Message-ID: <20260617-glittering-aloof-dormouse-3acd96@sudeepholla>
References: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
 <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
 <eb50b45d-ad04-4da7-8cfa-6e1abb1ffba4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb50b45d-ad04-4da7-8cfa-6e1abb1ffba4@oss.qualcomm.com>
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

On Tue, Jun 16, 2026 at 02:14:59PM -0700, Unnathi Chalicheemala wrote:
> On 6/12/2026 3:55 AM, Sudeep Holla wrote:
> > 
> >> Per the FF-A spec, the all-zeros UUID is the defined wildcard that
> >> instructs the SPMC to return information for all partitions. Map NULL
> >> and empty string to uuid_null rather than crashing in uuid_parse(),
> >> preserving the intended "return all partitions" semantics for callers
> >> that pass NULL.
> >>
> > 
> > Agreed on the spec part but not w.r.t the interface. Where is the driver
> > using this call and why is it sending null or wants to extract all the
> > partition information ?
> > 
> 
> A developer wanting all partitions might reasonably pass the all-zeros string
> "00000000-0000-0000-0000-000000000000"?

I understand that and the core driver does exactly this when initialising
to enumerate all the partitions on the system. But you didn't answer my
question as where is the FF-A client driver pass NULL ? You just expressed
the possibility here.


[...]

> > I object to make it uuid_null. Below check is enough to check NULL
> > dereference.
> > 
> > -       if (uuid_parse(uuid_str, &uuid)) {
> > +       if (!uuid_str || uuid_parse(uuid_str, &uuid)) {
> > 
> > 
> > I don't think we need to service NULL as valid argument via this interface
> > as the callee driver needs to pass its partition UUID here.
> > 
> I agree with you, NULL doesn't seem like a valid use case.
> 
> Will send another version with your suggestion, thank you for the review.
> 

Thanks!

-- 
Regards,
Sudeep

