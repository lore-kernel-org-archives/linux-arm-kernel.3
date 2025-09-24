Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388EFCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEtxo1qh0vSZfiRMY7z3jrPAH+D2wK0pK7I8P4ap9/c=; b=0PGrfTUs/gFk/pBo+H5u8ndqPN
	9uNzhNmz14cnPkwXtULanzDzPL2cjIIeGVzEv3IW+lHFxgSrIsoOsgAdbM/lb6fD15tmLP8NPMjFR
	db8mssJpSCgozpEH9B3S/IMsE1IzZQ0o9AnYtDtHqUpVqtKH4QxR30ETHyk4JquUTU0Hv/Da4LqV2
	ddTbiKBL79Gq0upUgrYb4IrejjZ26Lg7Sl0+I1BT36CK24qh5WwxgwaJJE81qybXbOpl0wdW0FK/w
	MLz9kZ67cYVGLWUQ0NeY/kxYTSeDXFSmGm0A8eJKrQkaeTn7Q/4XZmgowl8bH4hf57NGt/9+FYJcy
	9eBg9BaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Mcn-0000000GS4z-0PSw;
	Wed, 24 Sep 2025 10:21:25 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Mck-0000000GS2q-2nPS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 10:21:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3306d93e562so5934486a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758709282; x=1759314082; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEtxo1qh0vSZfiRMY7z3jrPAH+D2wK0pK7I8P4ap9/c=;
        b=xJUZgGXySMZxWp9GWT2LzoPpzF9A6jsgUgGrIginL6KFjTtVYfxnu+q1ddMGlIQ58k
         6rXJJtdUHUEmUY1Mj27KpcWuzena19nMXCxmt22ArSzFjeub56CoNsdBa3sOqL3D3iQo
         DaLo+t0/A0xQSrEnSCo25PWHm0YlD/7YYPaiD7ilW7FFXEPMapDzUNhDAfjt/yAWPtU7
         4Uppj869Nynp9JKbJsh/o/j3b9Z7aWV+3sygXOyxJOSPLsN8O3liSQwugr6oB/3p0vpP
         dtM6c4I8ZYKPl/LpLDVrJs2VVKhB+GwWxf/YRIWWBgdjFsUvU5p9u7y6tLdzVcJ+FkLq
         6ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709282; x=1759314082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEtxo1qh0vSZfiRMY7z3jrPAH+D2wK0pK7I8P4ap9/c=;
        b=naAcdQ0CDoGj58mdQpzeuA81BK+gf6sh27vLWURi3NgD+nXU72quY9XG1MJGrpv1nD
         Kaqpas+AZMMRmlWa/evx973/pBO1rjZeSRB6zH9HqX3gYdu6yaMz1O0ornrlp9qan2Xg
         TLnLEUv6SkDubUMv0BomMG7VcoU6bk+BOrZ2u+8QrGTnGA2+GFTD+k3Uxk6Z9wavllNW
         8YgDv7izrHcRdL3ZhGgXZpwLkNI0mMmDqbg7M7Gk6h7mPv71ZeUoIA2AkSSBgwzwx/VS
         QAGZMCvNkW3/3XdxDF5FxBAOx3iC0AepTm8R39h+EwocHY5j/WrriXDuOe6A1MxxJVeJ
         JZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyBqYaeRaiCPB0+8mxOp1doBblc32BgI7lYCx9GxEIRN798VVLkfjMhKzLWRDdxh0lOnqphH7ayaNKc3aaZ7zv@lists.infradead.org
X-Gm-Message-State: AOJu0YwQazroghLEjzgRDsNkNPA5rm7J9ZT8vjkToB7DTmg4YLVonHuI
	gUlGCbP1KOLccNHYKPmcJAg+4Gpa91exwQs1JzXHq3lDyTqQ1HhlyevX86KdR13LKFVTSKb/BCU
	TDXjppnOXQ4VrMKozyk8mJ/CzyPQIF3HPaI2AyBxK/A==
X-Gm-Gg: ASbGncsWk/zVxy+jsklbgPGjkoEVvHVGP54nxKX1WvTwaBss/1Ga9mXvRBkCXdit/gM
	wVa3C4Tkc5FiBC0wRtDOWASLKm3j1zGQULmP82FGxpMVYbnDkpWOwJDsFYfPlo4gbWhWqx5v5vO
	quWu01DALHEJzf0+08hB/WV+q9iv5CuTfa0t8t5BFJj0UYguCtMeyQGUyYxwUGSDSJ6IGHAgT74
	/bZoS8y
X-Google-Smtp-Source: AGHT+IELzzr59iWDFLuLUlnodmKRzoKN3FELPWASFS/xO49v4Qy3nq0EpzogKfl7Z5fEFAlvjSXdLYsIE340jGGlCfo=
X-Received: by 2002:a17:90b:2ecc:b0:32d:db5b:7636 with SMTP id
 98e67ed59e1d1-332a9705134mr6815232a91.27.1758709281426; Wed, 24 Sep 2025
 03:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
 <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
 <874isuo0m2.fsf@rasp.cworth.amperemail.amperecomputing.com> <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com>
In-Reply-To: <f7be3833-9b33-4935-b821-a2e0000a2557@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 24 Sep 2025 11:21:10 +0100
X-Gm-Features: AS18NWDFNIL7VglMmSBole_iUD49ro8jRAt-S6snaAybCp3PILujr8-kdaePfko
Message-ID: <CAJ9a7VjaUE+iy=FFwPhCdfXgoGR3rP9WSx-ZkKYeCHhqJ2yzMg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to
 the path
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Carl Worth <carl@os.amperecomputing.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_032122_718594_6BD6FFCF 
X-CRM114-Status: GOOD (  41.44  )
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

On Tue, 23 Sept 2025 at 02:49, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
>
>
> On 9/23/2025 1:31 AM, Carl Worth wrote:
> > Jie Gan <jie.gan@oss.qualcomm.com> writes:
> >> From: Carl Worth <carl@os.amperecomputing.com>
> >>
> >> The handle is essential for retrieving the AUX_EVENT of each CPU and i=
s
> >> required in perf mode. It has been added to the coresight_path so that
> >> dependent devices can access it from the path when needed.
> >
> > I'd still like to have the original command I used to trigger the bug i=
n
> > the commit message. I really like having reproduction steps captured in
> > commit messages when I look back at commits in the future. So, that was=
:
> >
> >        perf record -e cs_etm//k -C 0-9 dd if=3D/dev/zero of=3D/dev/null
> >
>
> Sure, I=E2=80=99ll include your commit message in the formal patch series=
, I
> think it's V3 since you have submitted two versions, if you're okay with
> me sending it out.
>
> >>   /**
> >>    * struct coresight_path - data needed by enable/disable path
> >> - * @path_list:              path from source to sink.
> >> - * @trace_id:          trace_id of the whole path.
> >> + * @path_list:                      path from source to sink.
> >> + * @trace_id:                       trace_id of the whole path.
> >> + * struct perf_output_handle:       handle of the aux_event.
> >>    */
> >
> > Fixing to "@handle" was mentioned in another comment already.
> >
> > Something about the above still feels a little off to me. It feels like
> > we're throwing new data into a structure just because it happens to be
> > conveniently at hand for the code paths we're needing, and not because
> > it really _belongs_ there.
> >
>
This data is perf specific - not path generic; so I agree that this
structure should go elsewhere.

I would suggest in the csdev (coresight_device) structure itself. We
already have some sink specific data in here e.g. perf_sink_id_map.

This could then be set/clear in the functions coresight-etm-perf.c
file, where there is a significant amount of code dealing with the
perf handle and ensuring it is valid and in scope.

This can then be set only when appropriate - for source / sink devices
and only when in perf mode, and avoid the need to pass the handle
around as API call parameters.

Regards

Mike.




> The core idea behind coresight_path is that it can hold all the data
> potentially needed by any device along the path.
>
> For example with the path ETM->Link->ETR->CATU:
>
> All the mentioned devices operate by forming a path, for which the
> system constructs a coresight_path. This 'path' is then passed to each
> device along the route, allowing any device to directly access the
> required data from coresight_path instead of receiving it as a separate
> argument.
>
> Imagine a device that requires more than two or three arguments, and you
> want to pass them through coresight_enable_path or similar functions...
>
> For certain coresight_path instances, we may not need the handle or
> other parameters. Since these values are initialized, it's acceptable to
> leave them as NULL or 0.
>
>
> > Or, maybe it's the right place for it, and the cause of my concern is
> > that "path" is an overly-narrow name in struct coresight_path?
> >
>
> It defines the direction of data flow=E2=80=94serving as the path for tra=
ce data.
>
> Thanks,
> Jie
>
> > But if a renaming of this structure would improve the code, I'd also be
> > fine with that happening in a subsequent commit, so I won't try to hold
> > up the current series based on that.
> >
> > -Carl
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

