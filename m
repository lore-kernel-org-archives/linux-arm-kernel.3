Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB5ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQeaqW1+PAxLRkQR+E6xlA/aozp/Xw69MJj1v5/LkC4=; b=U4CxcYH0MoHmSMkWtSAF6iJN3H
	w5h6bHeKlh5rsa0CuVHP1Vu8EYxgSiDO9IjDHcoRL69IQ6OVq3WXsS0K539o6A6+oWrUdhhp0dg38
	RZBYbr/8zbyE1cBNCqNFVHeo4snwqYxyRgrTyUIqK+VjRz3a55credsyAKEgiavTlONHaK++F0Ii8
	5fqV23xdb+5R+AYu8KJGpJAENnK8i/4MuJhGI90hxltnwZnKPq+9pFcJy3XFkdWDWLhpVqP+jrQ2A
	uwlRz/hFzHGqkshhzWcZe4ksPp3Y1GDm2OJT8Q1PyewSlZyGS0UEKbLdK410fXmhlPjLHebG6UjFQ
	B+SBk43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGPQ-00000004Qnq-0sJ8;
	Wed, 27 May 2026 15:43:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGPN-00000004QnF-0oDZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:43:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 060E544535;
	Wed, 27 May 2026 15:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9169B1F000E9;
	Wed, 27 May 2026 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779896578;
	bh=KQeaqW1+PAxLRkQR+E6xlA/aozp/Xw69MJj1v5/LkC4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ndBR25q6q7st0Qvnc+uNw5sdJKl7URqJw7i4E/N9IoVzrPerkayXj3fRCJzXs3Dyw
	 +j5kMU3+LBdQZBcZQHW6PAQq18LcdoUSdRFq7eFDMsT21+DKa0LH6rckjoR9Lsr6Xb
	 tQhRByjYkFNp27NdaZnNDyTBN5QAvcGSpW0U8v3zmIpw+dblBDdOKgQAlQ8Jl1yz/O
	 kn+AU+ml7+hsSSt/UJwmhxv9NAr87s9D3l0vynrzywoJGqqsR1ROmeMhFeHEqbwSQy
	 q2nBDKms8p/eE0kTi83rMQgUj/a1Qskb/O1jIF/C+TUKCEGexyE1ViRQU6Ueg+ImxF
	 kNLG1cfCrKoiQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BDD82F40076;
	Wed, 27 May 2026 11:42:57 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Wed, 27 May 2026 11:42:57 -0400
X-ME-Sender: <xms:AREXaoSI_p6MhV985PW_wnOupdQuItqMXUu5b4oHXNrwPdVEW9Edkg>
    <xme:AREXagmMRY7U3rT6dv6B-js5z5_6N9vxep6xjPvq8SL0em7QWhCGhHOIy6mqFlDCT
    NKmU1W62fn3V3ljLnOxGp3x0kNuNlHJw90YmCydAlEq61VvRITzxsI>
X-ME-Proxy-Cause: dmFkZTEhymfpeOVTwNQAvYsfWvZQF5DpQe1q8xYhnt+2bWmmC+4lU/6dDjTWC4SiAIlF4s
    0IRV5gi0tK0Oo5LJ2FOrbozPQclpv2H5/pCfhN1czgPZBqcO6i7bIg6ddq49zWDADCqcjz
    TnnmqZM9RxdFZF3aS+0ehDM89TBKA4fITpBXQOI/8UJWjoJbbgYPp0lwwiLJAB4r486+jq
    9DpAKJQKSJEqRRlaoMpD9yRQNB+1+lFoTQR1jjlhUXXQdzkVDIXk24IrCbiyymplWWUqJB
    W6iLWuuYYP0h0StXS66s3zUvGbqEPpN9yORvLQIIoilaITZuDnlVwjEVe3B12LMl7kDbUm
    A9qS6Oo860prPkD9aurWfTyX31DyKRsTq+MvtZPlJxroJ0VhGX56DoWUdHOtTuj5oc0kts
    qNW8ASovQ9M6SDQA9NAhFYi/C7oLGWy6GnNjmGcjufxnCSEgd6MtGgMron3E42zCCWju0E
    9St93KSpPr6kSDxaeroe3tXhoFbQaBngcYC7wiRFmkqgVmvWP+OOytOOqKexIn3mS781Bd
    /fvHUzBZ+dpqeRqBXYegIQcVogBdGsTfCylY0odK+yK6eXLeTWTKyr21zUlLwyCqR8l7ok
    A1Fi3O5EWYmhfH264GlmyN9cdkd3ciMn3hVIDUOTHhIfCht/R6lm2npbV+PQ
X-ME-Proxy: <xmx:AREXaqPNYQ3ehPYiUSJhMpYJrahq7EFfTV48yu1f8x2T9sya3JTRfQ>
    <xmx:AREXat61NYt0NrtPVptOh2Lw4Q_JgWvtp_QkdoawRss8PyzIXN8HkQ>
    <xmx:AREXalgTbDVZKjvmD5SAygCe7TuB1S8ISQ3H3Hgb_Ia1s7kb2cFLBg>
    <xmx:AREXaqcCJw8w1f2EKTFL74hzi2KmVZU5lPD_FGhh2mQJP4IBQdcKdQ>
    <xmx:AREXalwn-YzFSeOZHPzeegFMfslQ3DR_dNCmbCvnhb2wFmQUoIAgUiSq>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A0D851820082; Wed, 27 May 2026 11:42:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 27 May 2026 17:42:37 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, "Christoph Hellwig" <hch@lst.de>
Cc: "Ard Biesheuvel" <ardb+git@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Arnd Bergmann" <arnd@arndb.de>
Message-Id: <83ee320a-972e-4f1b-b3bf-8ede24013505@app.fastmail.com>
In-Reply-To: <20260527015754.GA13078@sol>
References: <20260422171655.3437334-10-ardb+git@google.com>
 <20260422171655.3437334-17-ardb+git@google.com>
 <20260423074712.GC31018@lst.de> <20260509202354.GD11883@quark>
 <20260527015754.GA13078@sol>
Subject: Re: [PATCH 7/8] lib/raid6: Include asm/neon-intrinsics.h rather than
 arm_neon.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_084301_280018_9DCF3CFA 
X-CRM114-Status: GOOD (  20.88  )
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


On Wed, 27 May 2026, at 03:57, Eric Biggers wrote:
> On Sat, May 09, 2026 at 01:23:54PM -0700, Eric Biggers wrote:
>> On Thu, Apr 23, 2026 at 09:47:12AM +0200, Christoph Hellwig wrote:
>> > On Wed, Apr 22, 2026 at 07:17:03PM +0200, Ard Biesheuvel wrote:
>> > > From: Ard Biesheuvel <ardb@kernel.org>
>> > > 
>> > > arm_neon.h is a compiler header which needs some scaffolding to work
>> > > correctly in the linux context, and so it is better not to include it
>> > > directly. Both ARM and arm64 now provide asm/neon-intrinsics.h which
>> > > takes care of this.
>> > 
>> > 
>> > This could potentially clash with the raid6 library rework I'm doing
>> > for 7.2. Although git has become pretty good about renamed files, so
>> > maybe it won't be so bad.
>> > 
>> 
>> I think this patch also breaks the userspace build of lib/raid6/.  Which
>> is going away in Christoph's series anyway, but maybe it would make
>> sense to drop this patch (and patch 8 which depends on this, I think)
>> from this series for now?  That would make it a bit easier to take the
>> rest through crc-next.
>
> Ard, are you okay with me applying just patches 1-6 to crc-next?


Yes that's fine - thanks.

