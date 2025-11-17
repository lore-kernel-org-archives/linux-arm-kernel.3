Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06697CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sByeHxexy5kWSs8+/tkO3CtkAg5ldrp4UQhBhk1t06E=; b=EpDa1GyzS7jZvcQLOVBfcV75Be
	/dqYhtJkXgfqce+ZkCMq+leOt4AmfsO1DFQzSpBaDgJD/G9sSpS/JM5IZuYjm22x+h2T9gOhlWPVC
	K0rfC1NrpYFrPklsk5J03gmBpj+g9qFqneH/ZemPI5xJMRksje1opWAvQkO1aRoKg3dcBqA9bdfDn
	UNbbn2j/44Yt+Ue+mzXMUKva9V0Q//aGI6GdZctjIFq/jDjBoOB5IRvXG4GUIwauQh2ekbwrnVTCZ
	ye3vt1+QV3KgJ3eWG2YYB8Gfofz5B1iTLaeFWeR5CSd0NnLRGHa7hEjAswaA153Ifk2L7k18DbegC
	jm84pYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Bu-0000000Gmix-0N7G;
	Mon, 17 Nov 2025 19:47:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL5Bs-0000000Gmio-3Fjs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 19:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFCD4605CE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 19:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7728CC4AF0F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 19:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763408827;
	bh=oi69ubzOmcWFnTTKfRQwkdBK9UrATVG/MfQMp9iqORg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=spiEg2UDwv76ckplilFyfzUY4NIlOa+tT/rP4n1jJOLr40fHBHJFIj3wAr5fsG/eo
	 xQhuXgGAQoyyMDTd11SGOW8ncOziRl+sMqM8hzEFp/eNYTbcLPeW8sjEbOZB8lVsZp
	 cbiOf9K9Mhk/kcB+UtBAEvkHxdUj+O8p4Ce6QYSDYHskwo328JpECR693Jsco0nyPo
	 6dXuK+RKPJFMVYP+j3Mbqt5OXz8waVAv0qk5I5UrtwDT9Mg4FefLlXFJ6vxPsNZtNK
	 RvBVMhA26G6/dVq/j8zuep/iGdlK8MxTackVJ2eDvAPLR1lA1laYNTgbP7HKSZ87e4
	 Drl8TRTAnn1Yw==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-657244ed2c2so1193066eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 11:47:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdNV8xRLHuaUGkijZNJBkSqICC5QceUfMel0cqpVbXIJRCtqmvggNzvSrx+lDMKTk+IL5pVaWKbETeU5arh7H+@lists.infradead.org
X-Gm-Message-State: AOJu0YwYG4JIMk7yGhHDxz8C0z3bEy4bOay1Bv1eHMtqEMPYMbQ8Gav+
	+mi4MHM3O6j+iamOapHfuWT4Mk+WEFMYbXXXXLwM8bd4FtGslFQ0ZMYctbaBmIF5UPCjatNn0sJ
	fkkgmtAUMCzGApn/nPmFJZCsgozt9mDU=
X-Google-Smtp-Source: AGHT+IH0IDOS0jWW+2CcgxSKT4rM/q/3QpPlqyYMAztkSrbQ6LlWMQIlex/xYO/eLfb/v/eEjABpLCDHWZNByM8wq1w=
X-Received: by 2002:a05:6808:1b24:b0:43f:5619:ce72 with SMTP id
 5614622812f47-4509741adbcmr6421105b6e.4.1763408824124; Mon, 17 Nov 2025
 11:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20251117170014.4113754-1-ben.horgan@arm.com> <20251117170014.4113754-9-ben.horgan@arm.com>
In-Reply-To: <20251117170014.4113754-9-ben.horgan@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 17 Nov 2025 20:46:52 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hAPoE96C7=ynR=Ex4huPP3b896sBRNdBiLe=3Q9vKwHQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmWW5WMwkoNO9miPOqWpTmGCYnIxjnfsWWdSfIjl34zJdMaHEbUGRqKZIE
Message-ID: <CAJZ5v0hAPoE96C7=ynR=Ex4huPP3b896sBRNdBiLe=3Q9vKwHQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/34] ACPI: Define acpi_put_table cleanup handler and
 acpi_get_table_ret() helper
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, amitsinght@marvell.com, baisheng.gao@unisoc.com, 
	baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com, 
	carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org, 
	dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com, 
	fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com, 
	guohanjun@huawei.com, jeremy.linton@arm.com, jonathan.cameron@huawei.com, 
	kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lpieralisi@kernel.org, peternewman@google.com, 
	quic_jiles@quicinc.com, rafael@kernel.org, robh@kernel.org, 
	rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com, 
	sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org, 
	xhao@linux.alibaba.com, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
	Zeng Heng <zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Nov 17, 2025 at 6:01=E2=80=AFPM Ben Horgan <ben.horgan@arm.com> wro=
te:
>
> Define a cleanup helper for use with __free to release the acpi table whe=
n
> the pointer goes out of scope. Also, introduce the helper
> acpi_get_table_ret() to simplify a commonly used pattern involving
> acpi_get_table().
>
> These are first used in a subsequent commit.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  include/linux/acpi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index a9dbacabdf89..1124b7dc79fd 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -8,6 +8,7 @@
>  #ifndef _LINUX_ACPI_H
>  #define _LINUX_ACPI_H
>
> +#include <linux/cleanup.h>
>  #include <linux/errno.h>
>  #include <linux/ioport.h>      /* for struct resource */
>  #include <linux/resource_ext.h>
> @@ -221,6 +222,17 @@ void acpi_reserve_initial_tables (void);
>  void acpi_table_init_complete (void);
>  int acpi_table_init (void);
>
> +static inline struct acpi_table_header *acpi_get_table_ret(char *signatu=
re, u32 instance)

Maybe call this acpi_get_table_pointer() ?

> +{
> +       struct acpi_table_header *table;
> +       int status =3D acpi_get_table(signature, instance, &table);
> +
> +       if (ACPI_FAILURE(status))
> +               return ERR_PTR(-ENOENT);
> +       return table;
> +}
> +DEFINE_FREE(acpi_put_table, struct acpi_table_header *, if (!IS_ERR_OR_N=
ULL(_T)) acpi_put_table(_T))
> +
>  int acpi_table_parse(char *id, acpi_tbl_table_handler handler);
>  int __init_or_acpilib acpi_table_parse_entries(char *id,
>                 unsigned long table_size, int entry_id,
> --

