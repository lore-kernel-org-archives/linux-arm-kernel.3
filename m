Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB13C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkAIK4sJSZ+M6U7rXtAMjWYbvL4XnlFujZHGVX//GSY=; b=OLV5zLykoVmm+xx2eRkucc/fgf
	sItpmHv6OAe9DWVtUTlrE0pbXCltgT97iWwjnf8QqVYhe0OAtZD3JJsPTkxIR8dbOE9kVh2+wddTx
	1wynWJDa7ptUeS5uirtUJm/62pFDhXmVUfnpClphpLynhBkMk4H8MVFH3n1hm7av80h+gyvfQpgxO
	rHtZ5QRfB0U0m7P9fdqWOix5+kCfnkXpT4QzlD5PCSJnNSLmCF2rHHScYAtwzfp4Aw4vDjNMLZI3e
	7P9ztq6CkoI+8SBR/obXT5FnzaUzKLdYGxmmgNl2aAs9wFNs6tWT1qSVGqc4A6fhv0IUHThEmR7R8
	RMRZ+Mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwuF-00000005qeY-0B7F;
	Fri, 28 Aug 2026 13:46:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwuE-00000005qeP-1SU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:46:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA4F341455;
	Fri, 28 Aug 2026 13:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61C81F000E9;
	Fri, 28 Aug 2026 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787924765;
	bh=ZkAIK4sJSZ+M6U7rXtAMjWYbvL4XnlFujZHGVX//GSY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=NjUjFPGg1szvr3eb78v2BpGQv+wgHid47nEyNFCF4UtD4VOdqNOt8xN/TmW/lz7pC
	 Hfb3M4OLv9NBqnBI+kJP2HzzaQSfvx4FzS4UkOu2qMkys/Jzo+q0CYKmZHRdS8Cfoj
	 JqFpNq+Z2uR2W0ItcWD+dCY9h2kI2Pmtons2mtYREqzuyo7tePoAoomC+yQ+/8dMxh
	 MYP2TMHM1ohEBtisAJojUoUmBbyoKBQAGOZ2Dgt2MclbRwi7ECg1HEnTtD0fhWK0ol
	 OchJFRcQw7oZASNd4EtzB9ztlpmIdHTFtHoNS9+K5QGBPzOzEazxuoD3I83FcQ3XIJ
	 x6jZWn3Eo7bEQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 5F2B21980072;
	Fri, 28 Aug 2026 09:46:03 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 28 Aug 2026 09:46:03 -0400
X-ME-Sender: <xms:F5GRaqE2NkgyW7Ns-LsvSLTTDYKdh01qS6ZTDLQ4fw9t-N0Ddrtc0Q>
    <xme:F5GRamK8JEod1kC8v70PUAKg83EM3BJ4mNsF9zenJckTWXg_DbGiqaZsOaLiTcf1f
    Un5nzICP58n5e2w4IxsrJ6DR2ew4HXCRnU0kgMGarbUP730m9edsSHf>
X-ME-Proxy-Cause: dmFkZTERWf76UbFSBm7gP10dcMTeqKkA8/cAL0sZG2rtqNj9Cm8XygX+z/UkBm5JSSVYUy
    tiYsLDls4/Z8P0ArKeB4JwxyT1aUPV/lD2jc7QsFKIVQHQani//0H1PZEuJk/TiRbXXB2d
    2quRJqkXk73Cy9UXGvcExqZtTKUBQHobcpzJhpw2JFide00btCWCAKJxj+FFD/0LYuztV0
    RDQfQ9I5GuMU2Gp/6HPTrAQR0FUWuP5nz+ODfL0oI1jx4s+jzNT/OxnaNHzIWAbOUDVPAP
    w5fd1Gn9Re9N8rvjRkwEA2WKBs4KNvy7cNDKTIaIdI60cHjToYvMPt6lZJQt9iOoIsFcNt
    RgMeFGqQHwKXp/37eumLweC5yrLclcKzJJT5cNY+IHV1VdIyqIG3ZtBU5HWRsmj47nFXXO
    E35L8lICEmkjQ8uKpI/zFxfHP7ZNKUlS9+8zbra8ZkiUUpsAFf0YCS46pUJJrUCDgx6aMI
    V3tmtGKfMb0aauZJvHtfGU1pRrhYIJs+OLLCQ73AXWjoo3DemVX15rIZX+nlbfZxakHWuF
    qQOXvsSwhEkofy7Mi18iqc/ZOGzI2iapsjruAeX/BsRit5HFPQYWWAYVRwICynS23+3qDa
    lSE1BUqfAQ+/hmaZUT/n/B29/elggaG5nEArlIRIROmCs2ooVKdFgmt50K7A
X-ME-Proxy: <xmx:G5GRaidmDIofxjDrnckkltqpU-EBp3Rle_aBNo2F6P7BC62Z4iDwZQ>
    <xmx:G5GRagLQLLdIZbdkb7L2guevnkadNbHtrAwSNHFCWgxQJ7GeNQ4xXQ>
    <xmx:G5GRasCciwc4APHUJloqDeNMxyVffl53TzupnMualIviek0VAjp3Uw>
    <xmx:G5GRaphOIhi5fNP21BBwmTKuIl5vQHIh-O74BW-RnFIO-oBnHepfnQ>
    <xmx:G5GRamNZICx_vr-e_gFs2Augf5avMnxddCHXulCSvH7Iw1aF3MgajzWL>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 89751F80080; Fri, 28 Aug 2026 09:45:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 15:45:39 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Petr Pavlu" <petr.pavlu@suse.com>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Mike Rapoport" <rppt@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Daniel Gomez" <da.gomez@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Aaron Tomlin" <atomlin@atomlin.com>,
 =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Kevin Brodsky" <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Message-Id: <cee89666-9de0-4012-b665-69da3846c5ef@app.fastmail.com>
In-Reply-To: <524b5817-c097-47cb-b301-4a9c0f1d2947@suse.com>
References: <20260822135323.795946-11-ardb+git@google.com>
 <524b5817-c097-47cb-b301-4a9c0f1d2947@suse.com>
Subject: Re: [RFC PATCH 0/9] arm64: Allocate .text and .init.text together
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Fri, 28 Aug 2026, at 15:07, Petr Pavlu wrote:
> On 8/22/26 3:53 PM, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The arm64 module loader has to deal with a couple of corner cases that
>> may occur when .init.text is placed out of direct branch range of .text:
>> 
>> - ordinary direct branches from .init.text into .text may require the
>>   use of a PLT entry (i.e., a trampoline aka veneer), which means not
>>   only that additional PLT entries need to be allocated for
>>   cross-section calls, but also that .init.text needs its own PLT
>>   reservation, as the one in .text will be out of range as well;
>> 
>> - dynamic patching of the ftrace handler into .init.text code needs its
>>   own dedicated trampoline as the one in .text may be too far away.
>> 
>> - recent compilers may omit BTI veneers for static functions that never
>>   have their address taken, and so additional veneers will need to be
>>   added to .text in case cross-section direct branches from .init.text 
>>   require a PLT entry (and therefore a landing pad at the target end).
>> 
>> This is unfortunate, because it is actually somewhat unusual for .text
>> and .init.text to be so far away from each other: only when allocating
>> either of them (but not both) exhausts the 'near' (PLT-less) module
>> region, the other will be allocated from the spillover region, which is
>> not in direct branching range, and therefore requires PLT entries for
>> cross-section calls.
>> 
>> This series addresses this wart by allocating both of them as a single
>> chunk, and freeing the .init.text part along with the other init
>> sections at the appropriate time. This ensures that the two regions will
>> never require veneers for cross-section calls, allowing the arm64 module
>> loader to be simplified.
>
> It looks like this should also be useful for ppc64, which currently
> merges .init.text and .text because keeping them separate would require
> stubs between the two, and consequently .init.text is never released in
> modules on this architecture.
>

Thanks for the data point - are those stubs needed when there is some
distance between the placements of .text and .init.text?


