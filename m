Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFAD606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TXCoECx1;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=f8acjVyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mf9JVkCLwRxWPLrxaj3FzU/TGDnGM5kYKZYNlKzxksM=; b=TXCoECx1UaZxl5
	YtCR0IcHsbD2570nLdzKVSmFEb4VVpYvIjjrU12u9JhoLcvFyQQ+Y48DUwLmPt+MQfqlNbtLNT0g1
	HcyEmGTNv06Yca2wrIVX8UDX1u77oCbGW4TmbHRktBur8pgV5hE605nuF2345giHDCy8O1PUuU5cc
	zkw8a9d9z9RlD5KtUiiePOBzgiZGp9nGvogb2RNapLyDI9+TR9vjHf80Dq10CoXfqLNZEfmLdAlZY
	K+HiejHAlfqeZqNmsr3iEFvtkkBCDygByfhs3sT6Y4Nbye2MeL59JG2bTzrOiLOyMXN+45cr7NJxk
	qLqPC1Fe9x/RnCQPmBuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIcV-00000003KqB-2yMB;
	Tue, 03 Nov 2026 17:48:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIcS-00000003Kpk-2nSd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:48:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D80D41595;
	Tue,  3 Nov 2026 09:48:19 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42D093FA32;
	Tue,  3 Nov 2026 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793728102; bh=vaCQ/2L0/fMVdYR2RKY5kjdcqk1pSk5EfL4D0OKx3ts=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=f8acjVyioUA89Cqjgqw3CUI9m7xifXp8trNfDFQD/7XkaJDEHPXIWlc6Di3Qr5xuL
	 cV4Jw3RQ8vmHxwME9Hh+2ySyT6ovXwHOP1iP552NJjzNA2Pe5FcPYiMK46/19L9LnI
	 tQHMNLh85P39+CMo/1z9PuKTp1ccaNbe0pCFjrQ4=
Message-ID: <9400d7a6-3d00-474d-bf1d-6db1a08c16fb@arm.com>
Date: Tue, 3 Nov 2026 17:48:19 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when
 allocating a domain
From: Ben Horgan <ben.horgan@arm.com>
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
 <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
Content-Language: en-US
In-Reply-To: <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_094824_747348_BD843D6F 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Reinette,

On 03/11/2026 15:01, Ben Horgan wrote:
> Hi Reinette,
> 
> The change seems good but I think the commit message can be cut down at bit.

It looks like this patch also has the plus of addressing this sashiko
report:
https://sashiko.dev/#/bug/linux-9a564d61-b4d8-400d-b4b9-cd5f20729468

Thanks,

Ben



