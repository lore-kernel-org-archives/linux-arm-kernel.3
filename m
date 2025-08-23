Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A5CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 10:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Pbs1Suid1Z61nzIdWL9+X/91Z0qNxBPgsINl8X1ig=; b=e8iFmbbWUAt13Jc4ZEwOQglVJg
	CsKQdzxbY1rfZNPjqmyb+pRBj5A6tQYmIXUyylybD+Jz3ybj1Uoj2nfgSnwOfTDmIia6yuic7Gyes
	UG59mptBwTc2/Th4hK59hjc+nmv57kHM0uAfXpwwpR+RRQEnPuckIV2CWzzz5wRRIBDP6AAz11JQr
	2g27ZNWejxmAdHF/WiYDf/SvEkvIPMaNBBwPqT1SQu/9GUgLYtpLxyiWbcyAJQxV9dULU8b3NVupF
	tsVNALJtswgtMxj9DZ+7iy7AaLjxD2Avy7OmzgGmag8QMhtEwwBvPuDBoyKSn6yRuoeTEQ3NJj8P7
	f4E/P0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplxF-00000004gjI-27WO;
	Sat, 23 Aug 2025 10:58:37 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uplub-00000004gUC-0hyi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 10:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1755946550; x=1756551350; i=markus.elfring@web.de;
	bh=E+Pbs1Suid1Z61nzIdWL9+X/91Z0qNxBPgsINl8X1ig=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wjVuZr0KoKzfYrd4jSyb7A3tS3kv+JUHWy0ImLnZJVvpZaC9P343FclMj9QGc7nL
	 sjjetxtYKqBDVJ3+TJrVwmw03Wnt3S0VGTe2q7DKs1AeoYzBijorQhGvxaozjneHy
	 DgMxXqgbtZvEdh87j89T9WNPSQ5pMLQJ0KZyB7BCuhJvm6xRxR5uRYsq7CVN+kN20
	 jfNIi36XmTsxdurheGhAHrN3bQiSx9iFEuh5ZpcEEWMgE3bMO/UKvFcaV/k6cGC04
	 PyokxtGLcquk9854y075hL40gGv3Wn6eGCrnpp8VYdC6fFTa0HGw02cxMuZrKhbPh
	 HfiZuy3fWZCRBVei5g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.194]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTfkd-1uxHtz1ROv-00UfTp; Sat, 23
 Aug 2025 12:55:50 +0200
Message-ID: <60b72fd4-0a63-44ff-9850-1848d3fe9559@web.de>
Date: Sat, 23 Aug 2025 12:55:40 +0200
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
References: <20250822153048.2287-9-james.morse@arm.com>
Subject: Re: [PATCH 08/33] ACPI / MPAM: Parse the MPAM table
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250822153048.2287-9-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3DzY45z1U1H8WkZoFv0BMtQ1aSNdAklJaG20FL5xddOG8jtC9IE
 oJqCi0d+ZCWs7QzJCH6BNyHIw7jycKNpx/I3SCaIo8Uptx4icbucWBP5ovyp6FT5K3FP6DH
 sn+qtcpKbUGKG/OF3tw3sGEsAXa/br/vnaPlnqnLHFJwz1q1gNmXFFhEqcp9KTW5XhZqM2o
 JWeRhQY75mGVqKE6YJF+w==
UI-OutboundReport: notjunk:1;M01:P0:oJc8AXaJPxk=;6mSbWw8EkvUmV1k0IREVAPKgwJH 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 834RNf8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_035553_579755_15101FBB 
X-CRM114-Status: UNSURE (   5.71  )
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
> +++ b/drivers/acpi/arm64/mpam.c
> @@ -0,0 +1,331 @@
=E2=80=A6
> +static int __init acpi_mpam_parse(void)
> +{
> +        struct acpi_table_header *table __free(acpi_table) =3D acpi_get=
_table_ret(ACPI_SIG_MPAM, 0);
> +	char *table_end, *table_offset =3D (char *)(table + 1);
=E2=80=A6

Please replace eight space characters by a tab character here.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.17-rc2#n18

Are further source code places similarly improvable?

Regards,
Markus

