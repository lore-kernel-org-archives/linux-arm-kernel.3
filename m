Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D127C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vikwJdOuHjIeEUEXRBhLZ+IYjzfHJGZOTh+ryij6T4=; b=jwYPGJP/C24VVAAyx138LL+f43
	7EaSqQIEdcGUOFvrw8TZ0nCOEO7PqRyplrGQxAh0EWHmXaTfuc77oPmlVHkt95yqjxntZXnjnZ9pn
	djyJIJde8Ak/rZs0SGxIx1IrIXJQm2PdKxeOCUogqO18KkgDsTtg/9Lnl3Rtxeu7Br7niRAoxTts/
	VBn7P3m1RCWPjDOFQZvDlzxLvpxJvWWGPfh948xAS2gbjOa5YoY1kTVBRcuqyMIw29jBpUhwf7bT6
	dBEUp9ixbtsAlgSuMunhaeNGlGQWtgHiheWkFmFQHNob/+VmctDsuW1XQC2iNn+AhyaP4d1PFJ7Wl
	KEfBekLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd9J-00000005vbv-1PLS;
	Tue, 01 Jul 2025 15:43:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbTx-00000005boj-4Bca
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9517A4673C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 13:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B31C4CEED
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Jul 2025 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751378229;
	bh=bfyf64/9Lz8TeBB7ZRQVJI6e73cpzQVKOsse3DwDWRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ahU48zzhuH3p0zjEEHJCC+eyqLqcVOS6ZGsdCIeneizv3aQAg97P2s3FrQBaEpu/T
	 zc6YioylJbdVu47UwHW6qo6wJ93aZz+E5j/MLruvSvwKVzzRgtiu+4bhm4mOx6a06c
	 n13afKMjPR6sxyjncmIFbIzvBdQcbgj/Zp7Qb2lmlWWu1xL/3ZQeYGtfkcIB3C3HuR
	 REmvCvt4QUcSQ2rJwPKk3CZJVSxp+SrfxLAWXGjn86gF6xll986zDjE4k2e9xzKYJZ
	 g4lAAgQ71DCVPESNVYtMOZyJ9B/Igc9pk8NkaEZGLZTyQjKe8OhxkAvMi4TTsbZ2sX
	 5XwpoS4YiTdwA==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6118c1775dbso1681007eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 06:57:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXO0Xym/fv36YZjIIL5Od7OtIAytXEeX1eRMEDQjpam+iiKVc9LZHtYm0RjoOyUCD2FdtRDsnrPmwtespobo2vr@lists.infradead.org
X-Gm-Message-State: AOJu0YyXcw9awXaDBF9Zx9I2L4veF5gawbaOZEQt7oC42wB2ty7FOQiE
	ObnGhaZXciHJHQnmvtujwi1YuZITuUhOT47PKGsU6YJYOGF/mbifwjZlS1NGkRBYrW+eBOzMbh6
	ArvPyq3LEBcMkrUm4HEqtQObja3bHFJo=
X-Google-Smtp-Source: AGHT+IH8y5e96zUJRFb1OuI8gvD6XWj6u4OkFPyGcGOEmUKVc6TEctKaRmc0KPqe/ewtdYlc9kWivElDVmZVzHILVRs=
X-Received: by 2002:a4a:ee96:0:b0:605:f34d:7e00 with SMTP id
 006d021491bc7-611b914ca94mr11199187eaf.7.1751378226833; Tue, 01 Jul 2025
 06:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250404112050.42040-1-xueshuai@linux.alibaba.com>
 <20250404112050.42040-2-xueshuai@linux.alibaba.com> <0c0bc332-0323-4e43-a96b-dd5f5957ecc9@huawei.com>
 <709ee8d2-8969-424c-b32b-101c6a8220fb@linux.alibaba.com> <353809e7-5373-0d54-6ddb-767bc5af9e5f@huawei.com>
 <653abdd4-46d2-4956-b49c-8f9c309af34d@linux.alibaba.com> <de5d2417-dc92-b276-1125-4feb5151de7f@huawei.com>
 <f60f1128-0d42-48e5-9a06-6ed7ca10767f@linux.alibaba.com> <20250428152350.GA23615@willie-the-truck>
 <6671c3cc-5119-4544-bcb5-17e8cc2d7057@linux.alibaba.com>
In-Reply-To: <6671c3cc-5119-4544-bcb5-17e8cc2d7057@linux.alibaba.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 1 Jul 2025 15:56:53 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j3NC2ki1XPXfznxZRBLaReDBJ+nzHFgvqMx5+MgERL-A@mail.gmail.com>
X-Gm-Features: Ac12FXx9H-3vG8ZmZDA8pugDyN2jgQvzGSowL6_ycQvP5EUOr-jzraGGBrVWxV0
Message-ID: <CAJZ5v0j3NC2ki1XPXfznxZRBLaReDBJ+nzHFgvqMx5+MgERL-A@mail.gmail.com>
Subject: Re: [RESEND PATCH v18 1/2] ACPI: APEI: send SIGBUS to current task if
 synchronous memory error not recovered
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, rafael@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, "Luck, Tony" <tony.luck@intel.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com, 
	ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com, 
	baolin.wang@linux.alibaba.com, tglx@linutronix.de, 
	dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com, 
	robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com, 
	zhuo.song@linux.alibaba.com, sudeep.holla@arm.com, lpieralisi@kernel.org, 
	linux-acpi@vger.kernel.org, yazen.ghannam@amd.com, mark.rutland@arm.com, 
	mingo@redhat.com, robin.murphy@arm.com, Jonathan.Cameron@huawei.com, 
	bp@alien8.de, linux-arm-kernel@lists.infradead.org, 
	wangkefeng.wang@huawei.com, tanxiaofei@huawei.com, mawupeng1@huawei.com, 
	linmiaohe@huawei.com, naoya.horiguchi@nec.com, james.morse@arm.com, 
	tongtiangen@huawei.com, gregkh@linuxfoundation.org, jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_065710_079759_3075B94E 
X-CRM114-Status: GOOD (  18.23  )
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

On Tue, Jul 1, 2025 at 1:00=E2=80=AFPM Shuai Xue <xueshuai@linux.alibaba.co=
m> wrote:
>
>  >=E5=9C=A8 2025/4/28 23:23, Will Deacon =E5=86=99=E9=81=93:
>  >> On Fri, Apr 25, 2025 at 09:10:09AM +0800, Shuai Xue wrote:
>  >>> =E5=9C=A8 2025/4/25 09:00, Hanjun Guo =E5=86=99=E9=81=93:
>  >>>> Call force_sig(SIGBUS) directly in ghes_do_proc() is not my favouri=
te,
>  >>>> but I can bear that, please add
>  >>>>
>  >>>> Reviewed-by: Hanjun Guo <guohanjun@huawei.com>
>  >>>>
>  >>>> Thanks
>  >>>> Hanjun
>  >>>
>  >>> Thanks. Hanjun.
>  >>>
>  >>> @Rafael, @Catalin,
>  >>>
>  >>> Both patch 1 and 2 have reviewed-by tag from the arm64 ACPI
> maintainers, Hanjun,
>  >>> now. Are you happpy to pick and queue this patch set to acpi tree
> or arm tree?
>  >>
>  >> Since this primarily touches drivers/acpi/apei/ghes.c, I think it sho=
uld
>  >> go via the ACPI tree and not the arm64 one.
>  >>
>  >> Will
>  >
>  >Hi, Will,
>  >
>  >Thank you for your confirmation :)
>  >
>  >@Rafael, do you have more comments on this patch set?
>  >
>  >Thanks you.
>  >
>  >Best Regards,
>  >Shuai
>
> Hi, all,
>
> Gentle ping.
>
> Does ACPI or APEI tree still active? Looking forward to any response.

For APEI changes, you need an ACK from one of the reviewers listed in
the MAINTAINERS entry for APEI.

Thanks!

