Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C36CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 18:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NI46s4EnJvuP923IrCreg9YPlL82QCQYf/Ag8Yhe+Gg=; b=Ufh16f2/Cld1mndoW8xmsTET/u
	SuQWy6eL2CJ3PuNoo0a29RGJgeYlRsUSe2lF9748z6+OYFzeziSLVY3lXjvrjq4qA+PQKp2cGu0rh
	o1V+rlyEfjV4/IGv69R/1czX6Q1H8gl2gyK82qcFScBDf3J6tbaKOuyWucLtM4IAhdD5yC9Li+MGi
	cMrOsH6MZVAfs3/RJoGkKhLUZO1uW9Er7kIpnegxMWIKMnEBhMcmhRWsU9Ggi5JZ7025Rq5bmFAvO
	Ut3qMB2cwo2n96pY2DovBJKNHPj7FQyzGAfwt/0JCNWZ9gU0mUtW5ACF97TCxEqxf6azez/2jtD2a
	698Eng9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcSTN-00000008Dwc-1pwN;
	Wed, 24 Jun 2026 18:37:17 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcSTL-00000008DwH-0eCJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 18:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782326232;
	bh=NI46s4EnJvuP923IrCreg9YPlL82QCQYf/Ag8Yhe+Gg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=abQkgu7NFxeoFje3tY15Ct7rEGE1UYqmUqhAlpWEFcuJNYYjvc6tHdnVP5WbkUQdl
	 q76dm//6kZk9Tu1OxSyWOHKn6vyCa7jBDOe+zcCLX5SvFeVwlk6bs/yob8mdnqVMg2
	 Yh9gU3E0XBtHs6AEzIEMQDd6T2j0yGnfEKFJatIM=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glrJS6fykz10tT;
	Wed, 24 Jun 2026 18:37:12 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glrJS2KFkz10s3;
	Wed, 24 Jun 2026 18:37:12 +0000 (UTC)
Date: Wed, 24 Jun 2026 19:37:11 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>, Gavin Shan <gshan@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_3/3=5D_KVM=3A_arm64=3A_top_up_s?=
 =?US-ASCII?Q?tage_2_memcache_for_dirty_logging_faults?=
In-Reply-To: <86ik77re2n.wl-maz@kernel.org>
References: <20260624160028.15591-1-include@grrlz.net> <20260624160028.15591-4-include@grrlz.net> <9FCEC7E9-DE50-443F-8E82-9FA22CA15ED6@grrlz.net> <6FBA06E8-B0C4-444C-B226-0B756C0172A7@grrlz.net> <86ik77re2n.wl-maz@kernel.org>
Message-ID: <548B439F-7DDD-418B-98E2-D7D6BB047A6E@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_113715_343294_F1C007A0 
X-CRM114-Status: GOOD (  11.76  )
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

On June 24, 2026 7:25:04 PM GMT+01:00, Marc Zyngier <maz@kernel.org> wrote:
>On Wed, 24 Jun 2026 18:46:10 +0100,
>Bradley Morgan <include@grrlz.net> wrote:
>> 
>> On June 24, 2026 6:39:16 PM GMT+01:00, Bradley Morgan
><include@grrlz.net>
>> wrote:
>> >
>> >Note: Patch 3 seems to conflict because of patch 2 (the comments)
>> >
>> >
>> >Oops! :(
>> >
>> >V4 (after people have their review go), will contain one commit (patch
>> >3) with the updated comments.
>> >
>> >Patch 1 and 2 applies as usual.
>> >
>> >Apologies for my messup. 
>> >
>> >Thanks!
>> 
>> 
>> Actually. Hmm.
>> 
>> I'll just drop patches 2 and 3, I'll do them at a later date, please
>> disregard patches 2 and 3, patch 1 doesn't rely on 2 and 3..
>> 
>> If you guys wanna have a look feel free! :)
>
>As I suggested in my reply to your hasty v2, taking a few *days*
>between versions is generally a good thing. it gives the reviewers
>time to chime in, and gives you the opportunity to reflect on what
>you've just written (reading your own patches after a few days is a
>sure way to go and rewrite them).

welp, I guess I learned the hard way with the hastiness of my V3, (that's
kinda why I dropped p2 and p3)


>Actually, by posting more often, you are guaranteeing that people
>*avoid* reviewing your stuff, since odds are that there is a new
>version coming in the next 10 minutes, so why bother...

I'm not planning on posting another version, until fuller review concludes


>But hey, that's free advice, so it's probably worthless.

advice from someone with experience isn't worthless. 

just stupid me decided to unpark my V3 and send it :(

Sorry about that..

>	M.
>
>

Thanks!

