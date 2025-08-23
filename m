Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055FECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZupNgyDCywSPEVi8QHgO5gsSonLJl51i4Hq+4q5O8M=; b=2HJwMDvhB8UFr8gN6u+fNWXXYT
	YP3XJUq46GtJ9pHTIFN1jB45s5bnZQYPvjHvrhZoDbzl84PrrDVE5cSm0MQ4L2bgmmqxKy1USn6eL
	p1Kq6T5Ek11RQ/rUJcJlNcTyNTOZBoA70ttoWryQBzYQ3sgGszmnsXtieg7G3QKrgmqaGwj1yKU7a
	98W+M+9OO1ft48f7SdHldKuRC/cvPXEoqzYxe3Uv7txgNvTr/62xu6Nd6WGCV94ndelKWCWLE/ch0
	U8Zt5dc4rTX885B55UoTYx6+IiQ+VjfszRDGmPr9clmmXp6njAsBVU0BtaKw0MTRnnzsRfmFu0qkB
	Tjz8pX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upnCG-00000004kPh-0HuB;
	Sat, 23 Aug 2025 12:18:12 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upn9d-00000004kHT-0R9R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 12:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755951283; x=1756556083; i=markus.elfring@web.de;
	bh=JZupNgyDCywSPEVi8QHgO5gsSonLJl51i4Hq+4q5O8M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UsVxS1ZtYPPi5JhgUusJPIrUda4wWMVqkNokClYCTVOSDpYWYbfV7Mfhs2Q3W2kV
	 bAwO+nh2Kq2gxRd3+wO/p0d/kB6CamZXqygCo+REvFdjFLSTJqNUtFKA7KLv86Lhq
	 wMOAObEuMaym7T2FnFCKsrHmKhThpwnG6XIL63NNJi9D0Y776opIw7pPmLIUi8YAr
	 oACoVjvLdrSzX3/MZHFnMwNbQtGf3HvYaM1hiLU30+baFwoDh5INU/hMTokNiHWYI
	 LGUYksBW7iWcujqmX2eaP5JvcDfTfdqkHRnQF8KCfAQdzI8DQ1mmEeBV+OfStKm3r
	 e2X5JN3JJ5xSw+LtEg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.194]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MK52q-1v6vO907wc-00Utya; Sat, 23
 Aug 2025 14:14:43 +0200
Message-ID: <6f2db559-5088-4082-ab5e-7b4a66723eb8@web.de>
Date: Sat, 23 Aug 2025 14:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Amit Singh Tomar <amitsinght@marvell.com>,
 Baisheng Gao <baisheng.gao@unisoc.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, bobo.shaobowang@huawei.com,
 Carl Worth <carl@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, David Hildenbrand <david@redhat.com>,
 Drew Fustini <dfustini@baylibre.com>,
 D Scott Phillips <scott@os.amperecomputing.com>,
 Fenghua Yu <fenghuay@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hanjun Guo <guohanjun@huawei.com>, Jamie Iles <quic_jiles@quicinc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Koba Ko <kobak@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Len Brown <lenb@kernel.org>,
 Linu Cherian <lcherian@marvell.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Peter Newman <peternewman@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rex Nie <rex.nie@jaguarmicro.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Shameer Kolothum <shameerkolothum@gmail.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
 Xin Hao <xhao@linux.alibaba.com>
References: <20250822153048.2287-6-james.morse@arm.com>
Subject: Re: [PATCH 05/33] ACPI / PPTT: Find cache level by cache-id
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250822153048.2287-6-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Qu0CFpEklXcJA1oHaNG97ZwkzNgU/lo58aVYxv00Qfpjt3xgpCb
 rbvCzWw1mR5N77Sy/JmWUnMcK5qiEmpgAaCZEOg7RQoF0NXiizR044BdiqJ9vbPjTmlB9YF
 ma62IRCeNFxOeGWKq5VNFWOO4D8ec0Dattpryg+JC7WUSGlvrbp88k7s4QNDkdClijd9n/b
 5qzlHwBkMb+owxYVKwsfA==
UI-OutboundReport: notjunk:1;M01:P0:+jJkB4Utdbg=;S6f4kOtwK/6EVIU8qoMhe1rHR7q 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 JhMoB0o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_051529_511963_0A5F6D21 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
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

=E2=80=A6
> +++ b/include/linux/acpi.h
=E2=80=A6
> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>  void acpi_table_init_complete (void);
>  int acpi_table_init (void);
=E2=80=A6
> +DEFINE_FREE(acpi_table, struct acpi_table_header *, if (!IS_ERR(_T)) ac=
pi_put_table(_T))
> +
>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
=E2=80=A6

How do you think about to offer the addition of such a special macro call
by another separate update step?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.17-rc2#n81

Regards,
Markus

