Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B7AE92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69uecwgRKtnI113SYEYBMNlRr9aR/4PXli3pplj4ltA=; b=0UZzVRtTiYBBn4FiOns3An85O+
	R+X+L4gVkWdtoaIsHTfTxtYHKMGM2flScgIApHAoCEOw5OMXFKrSXTZVYMOUMtM5AP9tnfmMxEmLD
	u8Xta3iMOdF2tBWv4DRHS9NVuL30HH2bcjXUTSi/dmCwtV5IaoHJn7cWihIejoDf9qYIKjks4mBMQ
	R83kT2UuPO+tbC1ulODUEseBJIvslXbJ9Yj/6IN4OC7c7fEpR+gFZPY6n51rMs/NQkRMofwV7IVfy
	dcwBSV2oSkBYZ6io05naH2r0/LnBSp5zbmfcKzSXSbttf7S3tSf2uFUYYUUXxyFlJ+wKXKLiC6SyX
	VthfQYNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaP25-00000004HfZ-29wZ;
	Tue, 30 Dec 2025 02:00:21 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaP22-00000004Hf7-2iwf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:00:20 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dgGWK287Xz9tJ1;
	Tue, 30 Dec 2025 03:00:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767060013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69uecwgRKtnI113SYEYBMNlRr9aR/4PXli3pplj4ltA=;
	b=Q76Np9mTD1wuhv22NaAnTH9trBh9GZExepWTALh2F104dz39G5CV4urZkP39CyOKtSsJJa
	FVUuJIF1scEwoUDnESRbLVEanIQ90KT9lHTEKsxm/s1JrXPvf29sIg4sjRXBVqPtgGNwQN
	/zYI8kmQ+Pjqbk42iWS/oJnfr0UslFuOE8ube/teX/HGp8Ic1OGUnN8bNw8Sn9JeUr1omg
	07BEVjENGPG5fm5VvL6aK9n75bA71ofQ9aVieUrGRcBMTCl7A8NBLrPUyxt0m9cYqdFCUn
	OQ7tjttfikt2fFbrpy0XN3ErqT9rEXHJEJ2YbQ30efUjJDWwq8ziS7Hq7HJojw==
Message-ID: <b0e0afff-2693-4bee-9fb2-afee5565d4aa@mailbox.org>
Date: Tue, 30 Dec 2025 03:00:02 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org>
 <24c8da41-37db-4e69-b9aa-e33b2154acb0@mailbox.org>
 <87y0p13dlh.wl-maz@kernel.org>
 <adefdb3e-7a10-42a2-b2fc-8c1490762454@mailbox.org>
 <87sef83azt.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <87sef83azt.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: baf2eae30d738fb5f02
X-MBO-RS-META: 93cbnmj9ho4cm7w1drqxb9xo93s1wjgd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_180018_859555_81AA1933 
X-CRM114-Status: GOOD (  16.20  )
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

On 10/24/25 11:27 AM, Marc Zyngier wrote:

Hello again,

>> Similar to what Linux already does on the various speculative
>> execution bugs on x86, something like this?
>>
>> "
>> MDS CPU bug present and SMT on, data leak possible. See
>> https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html
>> for more details.
>> "
> 
> You're completely off base. The problem at hand has nothing to do with
> speculation, and everything to do with access permission to counter
> registers.
> 
> I also wouldn't be surprised if you could take your whole machine down
> from userspace just by ticking some of the AM*_EL0 registers (the
> pseudocode clearly shows that there is a route to EL3 in this case).
> 
> Honestly, I think you should stop trying to papering over this issue
> behind the user's back. If you want this addressed, do it so that the
> user knows their machine is fsck'd, and that they are OK with that. Do
> it by implementing an ID register override that requires a kernel
> command-line argument.
> 
> Do I sound like a stuck record? Probably. But that's IMO the only
> acceptable solution for what you have. I'm looking forward to
> reviewing a patch implementing that suggestion, but I'll stop even
> thinking of how to paper over this in the way you suggest.
Just to wrap this one up. TFA master shortly after 2.14 release now 
contains X5H support with fixed AMU enablement, so this AMU access issue 
is gone. I think this thread can be closed.

