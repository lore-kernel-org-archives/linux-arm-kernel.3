Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C86C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jNMU8ip6rBeSpqlISiaPJWQQi8raU32gK6jMCIpWKM=; b=IH4YnDJ0HOAkoojgwzhkAqhdye
	0nWAJefExpikeivqRPNtdwySu4IoFIAVls5qhr8MCEtDm4OYEEAhHdUMk6oepIcEAXeIY1vcCp+28
	T15muqXfJ6WZrR8OA6RRJqTBSCtqM9CokTdh+81+jLLkiHVRMaR6XPq1B+He9G4Tfeg/eHm2JFDcO
	Q7v4iIFP6hZRs8CunzZqxY6RIe9Xsdp5TXgaMjWvpWT/VxxJzIFMTKLawJBHn8vQzzH4NzHbdAZB2
	QZNfUlD17BXyqDlxvs77W8Eb2NYO7IMhmsWXZTYXGHzEUwQsh46sfO3LG9E3p6h0MoRFzA+WUmQaU
	Fub3dghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUxS-00000009xFy-3gbC;
	Tue, 18 Feb 2025 21:16:46 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUaC-00000009rmi-2f0X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:52:45 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 41147411AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739911962; bh=8jNMU8ip6rBeSpqlISiaPJWQQi8raU32gK6jMCIpWKM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RGZ+lDdax8qjIOiB5ZacnAgWnZTgsFpylEbMW51u+P/MIZ4iyhn77FaRGI2dDgZ/7
	 PSdVV5Ab40gE18mE/GC17G4zDapRXyDnjvtMyLX/X1z8KjuhPso6bXPWo8AreECp1G
	 98znlH/rTluOQYNBlOJ3zgZgHPpYqLWuZudgxDv3yJkDcFhOdWhqo1YhFEhOHIeY4A
	 VAIzOxV+UDEcDyE8DFXCRzajUWTxsxZbIOIWZNKLrJ8usY8w0570cRguzaHptPlgAX
	 T0ovBK0bp9qEs6SV4ZG5qi7exbun4747718D6XGCFauEWi9SsploIuqSqI6XFFY4zS
	 3PACaipur3xJQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2d7f::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 41147411AF;
	Tue, 18 Feb 2025 20:52:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andreas Noever <andreas.noever@gmail.com>, Avadhut
 Naik <avadhut.naik@amd.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Eric Dumazet <edumazet@google.com>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Jamet <michael.jamet@intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Paolo Abeni <pabeni@redhat.com>, Sean
 Young <sean@mess.org>, Yanteng Si <si.yanteng@linux.dev>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Michael
 Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, James Morse <james.morse@arm.com>,
 "Nysal Jan K.A" <nysal@linux.ibm.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/9] Extend automarkup support for ABI symbols
In-Reply-To: <20250212135808.58d2f032@foz.lan>
References: <cover.1739254867.git.mchehab+huawei@kernel.org>
 <Z6yFG_NntQfkwYli@archie.me> <20250212135808.58d2f032@foz.lan>
Date: Tue, 18 Feb 2025 13:52:41 -0700
Message-ID: <871pvvnffq.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_125244_676394_0001CBF2 
X-CRM114-Status: GOOD (  10.30  )
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

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

>> WARNING: Documentation/ABI/testing/sysfs-class-cxl not found
>
> I need to double-check verify this one, as it didn't appear on
> my tests. Are you getting it against docs-next or linux-next?

I get this one too, FWIW.

I've gone ahead and applied the series, but this would be nice to get
cleaned up.

Thanks,

jon

