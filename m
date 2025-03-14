Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3780AC35FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEZ/C92I7ZmrCxL8IlGbszsJAl6imIlNGPyscyDrJzg=; b=EG8nn6lQhsd0PLNtJiuZMgEIJG
	pIknPns7OX6VM6app1CF74yuu7R96S8tf8hk2IMgjTSnu+I/EatPpwbUuWc7AIaW/bQK5DQwdoT2D
	frU3z79VfkFgZBY+6ekxi2GHESa/GrjcSlWGO0p/GDcZwZqQKpPKa4S2jq8tHdDxJvv4oWS30t5HC
	CQoo89hQ1LrSITUJo+55pjkQrEBNZp7K8+gH2v9J+NnK1yiWQhCqZJrAkuAYnCAy9WlxWhtttI3IE
	iUmWGssDR8E/qtp8OmrOIByVaZNHPIWovNlTXaLE8trz9JgYCMJ1E35XttzjKQhf28n5W7P4tmQop
	2jOx5O8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0lB-0000000DXCh-0eoW;
	Fri, 14 Mar 2025 08:51:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszeq-0000000DKxK-08K5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 07:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CFC75C5568;
	Fri, 14 Mar 2025 07:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C2CC4CEE3;
	Fri, 14 Mar 2025 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741938039;
	bh=cZHObQyc4WIrTAFoYw+ZBLwnZMrRJxIHZxIxht/mE34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=slrqn5rSprDoCRW37ehneMOSF/4zeDbuA/8+MwVmT03/JpailkBFrOdPFVPGwJHay
	 vnhcaD+TlbvL7VyIbaZiKfv2UrCrACOXIj6dd36+9fTjjbJt0FXbN9FAxAnZcUGbwh
	 FIPhVPvYCAGbE79OfShlWbOeKoZafz28W+t095NishYtkFFqlK/VUd30Js1ovcktt0
	 kzxgf2s6XOK1TCHjSZYXJyIx54D29Sb52pqqBHrKVVz9p2cS1LEj8XdhFgpOYRSko4
	 wdk4wb8bpaJmsVTct8Giw4ID4yVc5Wxb4JG1XFyJnDCgrKqM4cOsP7Rl9GV7xgl/XE
	 nJxlc4uFFDIew==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tszem-00DSa3-IQ;
	Fri, 14 Mar 2025 07:40:36 +0000
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 07:40:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, broonie@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Anshuman
 Khandual <anshuman.khandual@arm.com>, James Morse <james.morse@arm.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64/sysreg: Enforce whole word match for
 open/close tokens
In-Reply-To: <20250313215622.GA8101@willie-the-truck>
References: <20250115162600.2153226-1-james.clark@linaro.org>
 <20250115162600.2153226-3-james.clark@linaro.org>
 <20250313215622.GA8101@willie-the-truck>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <36968527640d231882444ba7065317fe@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: will@kernel.org, james.clark@linaro.org, linux-arm-kernel@lists.infradead.org, robh@kernel.org, broonie@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, oliver.upton@linux.dev, anshuman.khandual@arm.com, james.morse@arm.com, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_004040_187934_D60667C5 
X-CRM114-Status: GOOD (  16.25  )
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

On 2025-03-13 21:56, Will Deacon wrote:
> On Wed, Jan 15, 2025 at 04:25:56PM +0000, James Clark wrote:
>> Opening and closing tokens can also match on words with common 
>> prefixes
>> like "Endsysreg" vs "EndsysregFields". This could potentially make the
>> script go wrong in weird ways so make it fall through to the fatal
>> unhandled statement catcher if it doesn't fully match the current
>> block.
>> 
>> Closing ones also get expect_fields(1) to ensure nothing other than
>> whitespace follows.
>> 
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>  arch/arm64/tools/gen-sysreg.awk | 31 +++++++++++++++++--------------
>>  1 file changed, 17 insertions(+), 14 deletions(-)
>> 
>> diff --git a/arch/arm64/tools/gen-sysreg.awk 
>> b/arch/arm64/tools/gen-sysreg.awk
>> index 1a2afc9fdd42..f2a1732cb1f6 100755
>> --- a/arch/arm64/tools/gen-sysreg.awk
>> +++ b/arch/arm64/tools/gen-sysreg.awk
>> @@ -111,7 +111,7 @@ END {
>>  /^$/ { next }
>>  /^[\t ]*#/ { next }
>> 
>> -/^SysregFields/ && block_current() == "Root" {
>> +$1 == "SysregFields" && block_current() == "Root" {
> 
> Stylistic nit, but could you just do:
> 
> 	/^SysregFields$/ && block_current() == "Root" {
> 
> instead? That way the diff is smaller (well, same number of lines) and
> you avoid the ugly $1.

The code is trying to match the first field of a line such as:

SysregFields	ZCR_ELx

while you seem to try and match a SysregFields all alone on a line.

That being said, my perl-foo is sub-zero, so I may be very wrong myself.

         M.
-- 
Jazz is not dead. It just smells funny...

