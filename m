Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEBBC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd4HwaQvojYM3Pl9uoqp0lfo6g48PNSGU+VNp9HzeL4=; b=smrSVJOKd5bCLJCkFxrfi8wbL/
	2uumfnQDek+voP2nEaX+UskVd9FIO4yr1ypomeUopYvaOUE31TksE+nSXQ2XlvlHh0FcbmPfF62OL
	yQUSUJ/MdkMTuWOXSfMlg/wafLIzpKp+tzDVeyYRwMnXpQLuDBaG8ctd38xQx3M2m+WVFkKN1WCqV
	guTfXLICU0xWO7LjNuHa+Ww9rvbUs4fvgOrrOodkgF11ucL3xeb4NzEv7zTNJLTgMj4HIpqOab2s2
	zxjtG788tCELNmOXrDtLMttZUl9U1K3SDUBT9f0NoMW1vwwry4xAZueBJ99FLQ6QjjXJjBpg6Zk52
	VYUyBPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKrb-0000000EC7t-466r;
	Mon, 28 Jul 2025 10:13:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKp6-0000000EC18-3Zhk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Jul 2025 10:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Vd4HwaQvojYM3Pl9uoqp0lfo6g48PNSGU+VNp9HzeL4=; b=KjqHr8cOiVIbpJ2sm8kRaQJIvn
	3IdrKHhsOusl9+hWqh/FQpsIqzQqEBPJhtX73ILvsbkKHCPkjdZsmgkjnUvoKs79xcBaYrrJPDcqw
	/YBVOf4Su2u+gXQw5DhYQxfLyhhEvQihfrd8Mst4idYI67V9oiGb3kG/X9OiNv2a2HYdhjsUpkvym
	qgMGgAQ8pQq6wXmunnKmfIV0wX/YtEXld1pqtR2McNlpoOorfhXJyL5Wj2aKjTKWK8hW9Jg/TLH9c
	cWwJeTFJN41DhChZ4zOGm9MTGSbKFHxK3pteWtgOYPIeoT2jFBeJQiWdI7uw3TUNUkLkil5qPjz0o
	hCL0u4KA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKp3-0000000CQdD-03g3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 10:11:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4brDfb5q5Rz6L5fX;
	Mon, 28 Jul 2025 18:07:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C71F41402F3;
	Mon, 28 Jul 2025 18:08:52 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 28 Jul
 2025 12:08:51 +0200
Date: Mon, 28 Jul 2025 11:08:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>, "Rohit
 Mathew" <rohit.mathew@arm.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Zeng Heng <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>, Carl
 Worth <carl@os.amperecomputing.com>, <shameerali.kolothum.thodi@huawei.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, "Xin
 Hao" <xhao@linux.alibaba.com>, <peternewman@google.com>,
	<dfustini@baylibre.com>, <amitsinght@marvell.com>, David Hildenbrand
	<david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>, Dave Martin
	<dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
Subject: Re: [RFC PATCH 10/36] ACPI / MPAM: Parse the MPAM table
Message-ID: <20250728110849.00004062@huawei.com>
In-Reply-To: <20250716180725.0000452d@huawei.com>
References: <20250711183648.30766-1-james.morse@arm.com>
	<20250711183648.30766-11-james.morse@arm.com>
	<20250716180725.0000452d@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_111109_193714_B2800109 
X-CRM114-Status: GOOD (  10.95  )
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


> > +static struct acpi_table_header *get_table(void)
> > +{
> > +	struct acpi_table_header *table;
> > +	acpi_status status;
> > +
> > +	if (acpi_disabled || !system_supports_mpam())
> > +		return NULL;
> > +
> > +	status = acpi_get_table(ACPI_SIG_MPAM, 0, &table);
> > +	if (ACPI_FAILURE(status))
> > +		return NULL;
> > +
> > +	if (table->revision != 1)

Missing an acpi_put_table()

I'm messing around with ACQUIRE() that is queued in the CXL tree
for the coming merge window and noticed this.
https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/log/?h=for-6.17/cleanup-acquire

Interestingly this is a new corner case where we want conditional locking
style handling but with return_ptr() style handling. Maybe too much of a niche
to bother with infrastructure.

Worth noting though that one layer up it is probably worth something like:

DEFINE_FREE(acpi_table_mpam, struct acpi_table_header *, if (_T) acpi_put_table(_T));

That enables nice clean code like:


static int __init acpi_mpam_parse(void)
{
	struct acpi_table_header *mpam = __free(acpi_table_mpam) = get_table();

	if (!mpam)
		return 0;

	return _parse_table;
}

This series was big enough that I'm spinning a single 'suggested changes'
patch on top of it that includes stuff like this.  Might take another day or so.

Jonathan



> > +		return NULL;
> > +
> > +	return table;
> > +}

