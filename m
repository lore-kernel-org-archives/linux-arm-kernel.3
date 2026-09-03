Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB05EC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aM69eWvXf0pk8FFzXR6VeRD/taqS38wshkXyedGu8FM=; b=Vs+D8DQ6QOtg6SAat6cu1uUFdZ
	dlrMQLGzgNKLKqg7oVotzZWR+i8xPmp0ED+AMz7sfOkSrm/LULpE/lQF7gLhl4jGsYp2W+ytMhd5T
	miB38ZkNQHZ2KnyQGC0AhpUQrj3hksKfmBx5v2Xts0o9DEk7N0vhQ8cmLPPVb1R9CQJbA8km91i1o
	9LP/o0PvFOE5bzqXjgnOxIh3PQI7xpcgyLuc+UGh33P69LkwZziU6/x0q0h3PBVhF8juebO45iidB
	CwhQwzwdg/fyyEo17+hLx4g8pOol/k5/nSyUCFqcfQB8vkJZSi9YQ6CVs5SAzOIHVuK8M1IDjTyg8
	gS+iQc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25aR-0000000HCU5-31ff;
	Thu, 03 Sep 2026 11:26:31 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25aO-0000000HCTR-2N9k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788434773; bh=aM69eWvXf0pk8FFzXR6VeRD
	/taqS38wshkXyedGu8FM=; b=L2N0EeIY3aQ/LhHjBrhYMrAqp5pZbgx9SSNCmtJbQla0/1bh1u
	sMnSaryx50WpaxxYwX/2NSs6ifycqsSXQMyxvZzzow1V1ktsarIBUsC3lV4ADkAR8rqCvQ+Mdrr
	cU5OwpdICmmWAaMnkQTIzMgSAYBVsNkljdA8PojrynhPURbx3KRnD9TxHodsntqxk92sJbDX+F+
	qB+UiENeLP8us6ROZSeMTQcvv8Mf0Iqfw40tDi60Cza2pZAms5uKv/kHWft0kssWEyZHX1dOntB
	zz3djdszNVZ6keN8Ncy+oLi7LhQC7o24YuTqxAxPzeKsOIWc8Rz4Ma+C9at9zPr4BaQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788434773; bh=aM69eWvXf0pk8FFzXR6VeRD
	/taqS38wshkXyedGu8FM=; b=COOcbriixYqkLvy9qMUEsYtjYcCqeCnvbnOBJaC0Qv+44/BCMr
	sH6sOB2+EM9byMGoR7YUNbAd+ySV6zvEvqCA==;
Date: Thu, 03 Sep 2026 12:26:11 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <aplRx8f5NprO9dSU@willie-the-truck>
References: <20260825205839.14571-1-brads@mainlining.org> <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com> <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org> <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com> <aplRx8f5NprO9dSU@willie-the-truck>
Message-ID: <CA3C4FFB-FEAE-4537-B0DE-DEBB06D053FE@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_042628_769113_3C67C0DA 
X-CRM114-Status: GOOD (  22.10  )
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

On 3 September 2026 11:53:59 BST, Will Deacon <will@kernel.org> wrote:
>On Wed, Sep 02, 2026 at 03:03:07PM +0100, Mark Rutland wrote:
>> On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
>> > On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
>> > wrote:
>> > >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
>> > >> This comes out of the hibernate resume discussion where Will asked
>if
>> > >> the restored kernel's hyp vectors are reinstalled before we come
>back
>> > >> from swsusp_arch_suspend() and free the reserved pages. Rather than
>> > >> answer with a one off fix, this series reworks resume to look like
>a
>> > >> resume from idle, which makes the answer fall out on its own.
>> > >> 
>> > >> The series leans on Mark Rutland's old work for inspiration, he had
>the
>> > >> same end goal in a branch from back then:
>> > >> 
>> > >>  
>> >
>>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
>> > >
>> > >Most of the series seems to be a rebased of those patches, just with
>> > >paraphrased commit messages and my S-o-B lines dropped. As commented
>on
>> > >patch 4, I do not think that is appropriate.
>> > 
>> > Same question as patch 2
>> > 
>> > If you want your S-O-B added, ok fine, but yeah.
>> 
>> As on patch 2, please read the documentation before continuing futher.
>> 
>> > Do you think this series itself is good? 
>> 
>> No. At present I think it's in a worse state than it was in my branch,
>> because portions have changed, with no rationale and no clear benefit.
>> 
>> Hence my ask to Catalin and Will to NOT pick this up for now.
>
>I wasn't going to pick them up with the incorrect authorship, but it's
>worth noting that Bradley's patch _does_ fix one of the hibernation
>problems and has been tested by Vladimir:
>
>https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
>
>I would prefer to take your complete set of patches, but if you don't
>want that then should I just take the above for now? Prior to this
>series, there has been no activity for nearly two years on your branch,
>so I'd prefer to get _something_ in, even if it only fixes some of the
>problems.
>

So your taking the bugfix? I'll do V2 later, you'd need to review my sleep
patch tho. 

>Will

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

