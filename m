Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D28D3C52C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jVk1rGI20AlFbcwnNIfZtdQteQ1YPu8ZTyqk/PmGDE=; b=OnM/cL+tDTnGEtUZOm+uzAQ3nC
	/5rd/adKhIgIrNqBUsNgJQfDdHqwBlO95FZIxDNIjQPfemIAyPcJmd1+zTgwisngGiilhC03oLL/h
	qPJe0sWyhv0eGl+vAtgAWaqhCmOvFNOP/RnF5pz9qrJXXj882eD9As1wp8kYTFAqo2EBHZVoNnXRY
	Iv7h0C2aa0ASf87m/kDL8Myf4CrwXrnezR+QhLJOFN3cjk3EmCLvRCw5L9OhK/A1CV+hg7j5Egd74
	OkZCPZ/fi1OP+qUoqxLhBH69gEEY4E685F1qV8Ev/JFoBC9ESXmWzoZvBg9akARcpl/2K3rl2H08l
	Dh8Tu+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTIYB-0000000FOGn-1ItO;
	Wed, 10 Dec 2025 11:40:08 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTIY8-0000000FOGB-1MIO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 11:40:05 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 518045BE06;
	Wed, 10 Dec 2025 11:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765366799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jVk1rGI20AlFbcwnNIfZtdQteQ1YPu8ZTyqk/PmGDE=;
	b=kYKl/p6V2NKnInv1y/na+IlUvpMEK0sX4T1zVqEThCO7yLCYdt6IVoNKTovte+m/473xEh
	JrVvLgM1FbDRVhry1YB/5WlNWDRIRQ62JhvOFbZlrzE+SzOuK5cE9FaI/1/qRjZeidDbay
	pgTMe1RkZgxgeTLRsfuSuhkOeOvf01k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765366799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jVk1rGI20AlFbcwnNIfZtdQteQ1YPu8ZTyqk/PmGDE=;
	b=2FhMQmr5oo8RrgSnMH/AuHuQ17+aG8G2nPv2QLIK4Aae0LeAXROvAXII+bJr8ByNiN5kId
	hOqxGM2Ba6lcSDDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Xm6kJqx1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7lSjDUJO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765366798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jVk1rGI20AlFbcwnNIfZtdQteQ1YPu8ZTyqk/PmGDE=;
	b=Xm6kJqx1/c5gD91yCHK/zjkkubpQxqTMBbXFDFAwDjsoQLlgnG7zDgA0D3iqyJE8rFW6VT
	0j3YeYwz/78DfQaBpndkfDxmfsR8fRfc+TW+9qpIut9iSQRQUEmAxFKhJi6BrILyYxKiMv
	dn2WqYivaz1SYplGq0jTlMj5GimgEjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765366798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jVk1rGI20AlFbcwnNIfZtdQteQ1YPu8ZTyqk/PmGDE=;
	b=7lSjDUJOjG4SblqKIgKWvwmK0LGioLjvSy3cz9JegNBKgDsqf76hnZ99VZovtpTpv7T1hM
	2PFpPN6nvDxC8ADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB2EC3EA63;
	Wed, 10 Dec 2025 11:39:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Wm4mLw1cOWlTSgAAD6G6ig
	(envelope-from <iivanov@suse.de>); Wed, 10 Dec 2025 11:39:57 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH v2] arm64: errata: Add NXP iMX8QM workaround for A53 Cache
 coherency issue
From: "Ivan T. Ivanov" <iivanov@suse.de>
In-Reply-To: <20251210074550.GA10733@francesco-nb>
Date: Wed, 10 Dec 2025 13:39:43 +0200
Cc: Frank Li <frank.li@nxp.com>,
 Jason Liu <jason.hui.liu@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com
Content-Transfer-Encoding: 7bit
Message-Id: <3EB1BF9A-9D76-48BD-B134-D1D7DF8AD2CB@suse.de>
References: <20230420112952.28340-1-iivanov@suse.de>
 <20251210074550.GA10733@francesco-nb>
To: Francesco Dolcini <francesco@dolcini.it>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,dolcini.it:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 518045BE06
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_034004_546921_0632C6AA 
X-CRM114-Status: GOOD (  12.82  )
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

Hi,

> On 10 Dec 2025, at 9:45, Francesco Dolcini <francesco@dolcini.it> wrote:
> 
> Hello Ivan,
> 
> On Thu, Apr 20, 2023 at 02:29:52PM +0300, Ivan T. Ivanov wrote:
>> According to NXP errata document[1] i.MX8QuadMax SoC suffers from
>> serious cache coherence issue. It was also mentioned in initial
>> support[2] for imx8qm mek machine.
> 
> Ivan, from what I can see this patch was never merged and there was not any
> follow-up on this. What's the status? Are you planning to work on it?

Yep, it was put in low priority list and it was forgotten successfully.

I don't have plans to work on this in foreseeable future.

Regards,
Ivan



