Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F3B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sk+MJIZv;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D5oX3oCH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vbPfZPJoYQ0C6lfKs2aymef5rN56sPJo97x0rrbpNk8=; b=Sk+MJIZvllT2zE
	iH8FqU9BcYSvHLUK+n4L6cliOrRpYmcZ33cn/A4arvB7pC7ak+y8nTkmtOEZJifmzQW/FOaoj/sDI
	7tk6AMjzktYc+Jwi8d6rKH0yZQhoYG8W+arDDngNi7Eik/58cIZ/zOVm2iD9Vq/s7ow+yJJjNID1I
	bVgLyRPwciketWeg/bvoGDXFszNSfJ9INM/BAE5xwLFKNiQfdC7RoauINdPEm9ieO0Ur/mfyaMdjL
	uOMeGJ1Wt/4A6yQPgnOA909TQHWU+uMw9K4VRZwHDlWE/+YZ9J7v+JWY5amugjwBtlxgzPEu5o2sD
	diTqnRa8KNC/S1fgvi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNorg-0000000G7Pp-0kHg;
	Mon, 02 Nov 2026 10:02:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNord-0000000G7PT-3jqN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:02:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 715BE1595;
	Mon,  2 Nov 2026 02:02:01 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A6DF3F59E;
	Mon,  2 Nov 2026 02:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793613724; bh=h4Xk0lr5kbJWzEIn6ychy0sjf+fV8fkwo6IeleqRgRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D5oX3oCHYZNYcvuBTbRPgfj9gLUa+29ws6N1QKtVCAc7adecVHnhTCZj3NKZ5znHR
	 uVbF0lzrh4YlNaIFNY1oo2uCyie2TMjAlUfJq2hYHwuB99qTvSvL91Fhhng/pid0LB
	 yJfa2P7cJ0h2fA8n2D47PRHRde39GxYuqrhzqaaU=
Message-ID: <c54e9853-b503-4aac-87cd-71c68ef4f7b3@arm.com>
Date: Mon, 2 Nov 2026 10:02:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Warn when firmware leaves PARTIDs disabled
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <8950f9bc-8ca9-476c-a7d6-2b434908b80c@arm.com>
 <20261101025550.1633447-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261101025550.1633447-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_020206_001077_17B81D02 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Ping,

On 01/11/2026 02:55, Ping Li wrote:
> Hi Ben,
> 
> Thanks for sharing the direction. I asked our hardware team why they
> implemented HAS_ENDIS: the motivation is power. Enabling PARTIDs that
> are never used does not affect performance, but costs leakage in the
> registers and combinational logic behind them - with e.g. 32 PARTIDs
> implemented and only a handful ever used, the unused portion is pure
> waste. Their expectation was that software would enable only the
> PARTIDs it needs at initialization time.

Thanks for this information. It may also be useful for getting data associated out of the cache
quickly once the associated PARTID is unused.

> 
> For a general-purpose driver that cannot predict how many PARTIDs
> userspace will actually use, that is not something we can do. So what
> I plan to do is either enable all the PARTIDs from the driver, or ask

Enabling all the PARTIDs in the driver is a good first step to support hardware with ENDIS. However,
going forward I think we could actually make use of the feature by enabling PARTIDs when a control
group is created in resctrl and disabling them when a control group is deleted.

Thanks,

Ben

> the hardware team to drop the HAS_ENDIS feature.
> 
> I am happy to drop this warning patch in favour of your driver-side
> enabling patch.
> 
> Thanks,
> Ping


