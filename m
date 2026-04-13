Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEC9F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtewcD3NlQ9T2rz4r/4NzvXWwz+tL/DhJnSJQl16Rzg=; b=vA5AhOeymzv8gcd/RywpdkFweL
	L1ypuzl0ujKSiSC2wqhwzo8WS+d5JDdOvtW8rRxPCIHvphcv4xhY1FL3MiFWSGo6IzJPREzGKAGEO
	ql1G9/RcUXCA9r7FRWm08bmd8PTBrIDQHeTZxceTUIehowOxbzI43fmAliTYzY2jKmsS2mwpXPZ6/
	okVNJTtmCVdMfQ1HJ85kmbHp8y2MCX3b0ZhpY3l92f9ntmsgRGEDseDHS1Uh7yGUCuPMDLkLRFa1z
	d/qj18Htv141XSy8CbaHs23wFch+EXT1aMpdK1+0jHrXMyDRNJrzbZBcTOxMUSMfQQd3MEOrtCf6j
	A1/uauFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGsz-0000000Fh9l-46Ck;
	Mon, 13 Apr 2026 12:59:29 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGsy-0000000Fh9O-1Jxc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 12:59:29 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-8cb5c9ba82bso678470285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776085167; x=1776689967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtewcD3NlQ9T2rz4r/4NzvXWwz+tL/DhJnSJQl16Rzg=;
        b=FrTU8dkg2KKFYn6jIWWLCnRj6MDNuqs8afvJZD0iT1ovTc8SiOVy/K8crp2zmfF/dY
         GSg1JIPrnWsb66JPoo+QC+SHSuJQngRtyAahYJQ6IOt+Jqx3wVyPP4IDYiLlTK/EyZ0k
         /S2pZ3HJqSOza9BnCHCn78nr1QltB2mydFKyeWuoeUkWBI7KlO4yXVQ6DWS3UH0sFbFT
         lZcahFcCh+F2+nx/3SshTfcCGGgKUs9klvenFfvrQNQcvvLAVDlHThk/9jakz3V1Cyey
         nFG8hIp40COL03qn0UwlxauXQkWzn9n6D8HvKy70Ob9/CqacUSKE9OQxcCYFmLbobRkR
         bXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776085167; x=1776689967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtewcD3NlQ9T2rz4r/4NzvXWwz+tL/DhJnSJQl16Rzg=;
        b=DBE64bQOB0NqRe/OzDLjWiKBY5TkdzZlUkFXBcsFb9Y4MPY2h30GJmH8IXA7JApPCi
         X/KHp7Dn/ernSeEg/9u0naxtlgfgr7RT64O7qRHsuLuRJSFdHghvkeToqYA3RzHjT/Ph
         tgoJPlh37Dao46Xy45sm1k77UHvO/4avoLSnKnvKIEJXWPj9SNME2hlt3+RRUeqUsVXk
         808KQkxIs8DBCwiluRnYi5FB9ijV2Bu1IFYTb7MmH0wKnZb4kgUlK1i25NF1nvRmHawK
         mogfUxjJLj/rWU/hRtTrbBQE1xVUQzv+FQoBDAONP4l0SfZpHzDEcySXlklLvmsJrYda
         FW/w==
X-Gm-Message-State: AOJu0Yw9aB2sTsJxlUtKLm59j4UI3WvHJrSz8t9PaRvX8mRrZvYOxIcH
	wuQPpUo379IHkbm+S5s1mgOhmocVUYSG/dEY1UiufsmiLOaZLDJPsgRLBQHfTjC/JD0=
X-Gm-Gg: AeBDieuOMg4niws1QaDVKhKG5mZT7VxVHqikyxtktiOwZaoGtqs5BvEP0rB6KQoBjj1
	rDHN2v+flw6F8sQzw/RrlTBYCwQQtm+EHbswIp6GqzpdkhzSuw0bB34YOhAZgaYa6BIpt+p7LXI
	Mc0YHHGmHjkXCKW9FNhr02mQN0HxTie2R9d2OVHPvJ3STPGamBMRJA+Lh7cqIkhslegpEjtRQy+
	yxkRww69E49YWG8NA38hVuWyDUlxDmJfWqdl/mJ16458JoA6cm5IvKNVYqFCHle9wPrBOGOcdIS
	ZOKSPm8BNzcsulYUu1Rmc1Pt8vhG24uvMeyvJuqt2k9ZDnoYI6flqUKMQ5k+yV1hAq5qw0xiV5d
	ExdgR5uvZXJ/sxgVuYM4FoGzETGEEev94yJ9pCfRCmrPiyA8WjAoN5hc083UyK7598Nb4wHiIIl
	HDOuIaFo8rAiZE0O/ijFb/EfGzhEIAgQxbIQFfWoCmQSRDeeWYlp+nxrAXnK5o0tBQjggDbcluh
	MTqKA==
X-Received: by 2002:a05:620a:2589:b0:8cf:e015:afe2 with SMTP id af79cd13be357-8ddcf6b5c97mr1946023485a.48.1776085166749;
        Mon, 13 Apr 2026 05:59:26 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb646d715sm826322485a.15.2026.04.13.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:59:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wCGsv-00000005Aom-2whV;
	Mon, 13 Apr 2026 09:59:25 -0300
Date: Mon, 13 Apr 2026 09:59:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sami Mujawar <sami.mujawar@arm.com>, Dan Williams <djbw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, thuth@redhat.com,
	Suzuki.Poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
	YeoReum.Yun@arm.com
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260413125925.GK3694781@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413084957.327661-1-sami.mujawar@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_055928_366289_CA1EA2C9 
X-CRM114-Status: GOOD (  17.09  )
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

On Mon, Apr 13, 2026 at 09:49:54AM +0100, Sami Mujawar wrote:
> This series adds support for Arm Confidential Compute Architecture (CCA)
> measurement registers in the Linux kernel, enabling guest Realms to
> access, extend, and expose measurement values for attestation and runtime
> integrity tracking.
> 
> The Realm Management Monitor (RMM) defines a set of measurement registers
> consisting of a Realm Initial Measurement (RIM) and a number of Realm
> Extensible Measurements (REMs). This series introduces the necessary
> infrastructure to interact with these registers via the RSI interface
> and exposes them to userspace through the TSM measurement framework.
> 
> At a high level, the series includes:
>  - Helper interfaces for reading and extending measurement
>    registers via RSI
>  - Definitions for Realm hash algorithms as defined by the 
>    RMM specification
>  - Integration with the TSM measurement subsystem and sysfs
>    exposure for userspace visibility and interaction
> 
> After applying this series, measurement registers are exposed under:
>     /sys/devices/virtual/misc/arm_cca_guest/measurements/

I'm surprised we get some random sysfs files? How does some more
generic userspace figure out to use this vs a TPM or some other
platform's version of it?

I also think exposing PCRs as was done for TPM in sysfs was something
of a mistake.. Allowing extension without logging is too low level and
is very hard to build an entire attestation system around.

I really think we are missing a subsystem here, TPM has sort of been
filling this role in a non-generic way, but we should have a
common uAPI for platform measurement & attestation:
 - Discover available measurements
 - Report signed measurements, with ingesting a nonce
 - Report measurement logs
 - Extend measurements and udpate logs
 - Report certificates used in signing
 - General reporting of various kinds of attestation evidence

And it would be nice for the PCI devices and others to plug into the
general framework as well instead of building a parallel TSM framework
for handling evidence.

Isn't this also sort of incomplete? Doesn't anything serious need
signed measurements? Isnt't there alot more data that comes out of RMM
than just a few measurement registers?

Jason

