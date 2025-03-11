Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4BFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23iOwZdcqMnXiNfXwcY1/saA5o6I48TGQZAkJr6gmPk=; b=FLBP1kKC8mW9CrrB2TvuezwQyS
	chwxON3eDO1aUGClxEN3EWyIVvhyukfyT5DHFEZ374fG68arzhv0rgg78nWdlHs2QLY8uxRJyTUtl
	2yahlLU9nMxKKKVAmMgkOR0MdPFitAL5xJaL7Gw4ml040yMEPKF+EJ5dmRVWbvtYYkZ5ZIOxoTD21
	1YmaWIVWxCjJiyR6I7AnuUI6bcKTQQY+TIOZ8c/IJ0/wLBLFmwQEugfKmsMiJEgx94oEcN3V+SPBB
	afR7NCf9t68K1qiBFC8R69joGZ7WCBcoXNm4n9DpMfds+ZZJzn/ENI7xP0REWg+4keHfQNl5590/O
	6rfRIRug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2pp-00000006N6g-0Uy8;
	Tue, 11 Mar 2025 16:52:05 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2nw-00000006Msn-2OVu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:50:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223a7065ff8so14354725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741711806; x=1742316606; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=23iOwZdcqMnXiNfXwcY1/saA5o6I48TGQZAkJr6gmPk=;
        b=xlPoCSFOHXv37U2ne3KDwa00rx3tn4gs6hm5El8hJ9HqOLDJbdaT8ja3Z78AebFr7H
         qmQYoo6ZMRupVjiDPcKXrtdyLqeeecJQ/oP1hyadeVFgvwTPQOmoQTXtMBA+Yacv7ApW
         VYuvH6I18s7zJJSTQcJ3uU1u2DuTao3k+vhAfP8bx/Pg6B93nyzNCqApjQgjBNZEgg4P
         5O8V6nX6d3aQpJgNrnWtp8o3oXkD9VmNlyKW1eRsP+gQScrzLil4qxB81jepyXaHlJu5
         3zkEJLffjBUPWmU8petd5EPMGoPZRuhNfbnUGlFju0vTVUMLaP0M27aXmvTc5QEQiJUy
         kfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741711806; x=1742316606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23iOwZdcqMnXiNfXwcY1/saA5o6I48TGQZAkJr6gmPk=;
        b=oqMgBKRR3qDRBYCb1NXVGXP+Z/j7ANqaEmbjMl/7UtXunq15h3jv90Epp94PpHDbMT
         CP2aQvmHNkKVq/DkZJyQsP40abdHzxzrRRAs+Xwx2MPF885z6KwVkc9unW0QHhd3CehF
         j1AUyEqXDZ5ZdvpIvolSy9MvOF5ZusLskpIZ4beG0xMSnpXZEO8G4bFeFialrYHB+sR1
         8DmJXITJSFD+u3uHlvPm1nZMgSChcquTwR8LvmPYLyviuHVHefNRv9RV2IeZWZGkWuSJ
         zs3+3Yun1HUATEsOaj2stoeabbBaB4iUo21j8V9QKWa0IgazD5mNPz0LkjVjMmgpL2eJ
         Y/eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVydqhfIlKQS9cdzhQ31SDUkGqNA9w79cpcsO4TJ0CdwizGJkYM00TKSIQAISHW2g5Z6f51AJs728b7EGTEtHWf@lists.infradead.org
X-Gm-Message-State: AOJu0YwPMn6CrEdR6j/DbRA2PjPM4RwheGPkzewgz4kRW02p7hI57LhD
	fCKb8gegOGaJqLmNBpxU6+bo9B7S8avkx/AukWWSEfO26D42+axYrfTSfUVsRoAac++ryzPyWza
	29PMTBGPCMompZdWKK09gWeBQa54d3sOU2MEklw==
X-Gm-Gg: ASbGnctkXvkq3hIEtnbxSq8lPcp6vG8khl3kQ4uugJv1pamW23Dn1WlBZH9DVdm0eGL
	dguwirIm4u2koE6tKRDzbraEuhau158l5U+NEPDDF9JuJGE3sooOY4Csku+6Kass3bdOaG7rOOg
	UENCenQB5ilT8BJPBnXc80wBG2sCxKPbrRs6ZjDP0qW5n/e9APeMM9Go7qjZw=
X-Google-Smtp-Source: AGHT+IGRlRimNoESSBKd69bPemttjguo2zF0mTvg+Kb5/5Fg9niMy5gNnw80TuZnQbl3lCDWzV9DtaMCXkkJcAmG5fQ=
X-Received: by 2002:a05:6a21:2d08:b0:1f3:47d6:aa05 with SMTP id
 adf61e73a8af0-1f5449336e0mr29284989637.0.1741711806206; Tue, 11 Mar 2025
 09:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com> <20250310090407.2069489-2-quic_jiegan@quicinc.com>
In-Reply-To: <20250310090407.2069489-2-quic_jiegan@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 11 Mar 2025 16:49:54 +0000
X-Gm-Features: AQ5f1Jq4RzUPjRD0-Pf4PVjALFGSYlNPIsAlLKRkK0wLgCzuiv55sOjf36seIGA
Message-ID: <CAJ9a7Vh7PmBBbvwnUETfCYrTSiXNzeiWpsz+XAGaUWt1Rq1aZw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] coresight: tmc: Introduce new APIs to get the RWP
 offset of ETR buffer
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_095008_617948_427582F5 
X-CRM114-Status: GOOD (  26.20  )
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

On Mon, 10 Mar 2025 at 09:04, Jie Gan <quic_jiegan@quicinc.com> wrote:
>
> The new functions calculate and return the offset to the write pointer of
> the ETR buffer based on whether the memory mode is SG, flat or reserved.
> The functions have the RWP offset can directly read data from ETR buffer,
> enabling the transfer of data to any required location.
>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 40 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
>  2 files changed, 41 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index eda7cdad0e2b..ec636ab1fd75 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -267,6 +267,46 @@ void tmc_free_sg_table(struct tmc_sg_table *sg_table)
>  }
>  EXPORT_SYMBOL_GPL(tmc_free_sg_table);
>
> +static long tmc_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
> +{
> +       dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
> +       u64 rwp;
> +

It is not valid to read RWP if the TMC is running. It must be in the
stopped or disabled state - see the specifications for TMC /ETR

It is likely that CSUNLOCK / CSLOCK are needed here too,  along with
the spinlock that protects drvdata

See the code in coresight_tmc_etr.c :-

e.g. in

tmc_update_etr_buffer()

...
<take spinlock>
...
CS_UNLOCK(drvdata->base);
tmc_flush_and_stop(drvdata); // this ensures tmc is stopped and
flushed to memory - essential to ensure full formatted frame is in
memory.
tmc_sync_etr_buf(drvdata); // this function reads rwp.
CS_LOCK(drvdata->base);
<release spinlokc>

This type of program flow is common to both sysfs and perf handling of
TMC buffers.

> +       rwp = tmc_read_rwp(drvdata);
> +       return rwp - paddr;
> +}
> +
> +static long tmc_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
> +{
> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> +       struct etr_sg_table *etr_table = etr_buf->private;
> +       struct tmc_sg_table *table = etr_table->sg_table;
> +       long w_offset;
> +       u64 rwp;
> +

Same comments as above

> +       rwp = tmc_read_rwp(drvdata);
> +       w_offset = tmc_sg_get_data_page_offset(table, rwp);
> +
> +       return w_offset;
> +}
> +
> +/*
> + * Retrieve the offset to the write pointer of the ETR buffer based on whether
> + * the memory mode is SG, flat or reserved.
> + */
> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata)
> +{
> +       struct etr_buf *etr_buf = drvdata->sysfs_buf;
> +

As this is an exported function, please ensure that the inputs are
valid - check the pointers

Code to ensure TMC is flushed and stopped could be inserted here.

Regards

Mike

> +       if (etr_buf->mode == ETR_MODE_ETR_SG)
> +               return tmc_sg_get_rwp_offset(drvdata);
> +       else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
> +               return tmc_flat_resrv_get_rwp_offset(drvdata);
> +       else
> +               return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(tmc_get_rwp_offset);
> +
>  /*
>   * Alloc pages for the table. Since this will be used by the device,
>   * allocate the pages closer to the device (i.e, dev_to_node(dev)
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index b48bc9a01cc0..baedb4dcfc3f 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>                                    enum cs_mode mode, void *data);
>  extern const struct attribute_group coresight_etr_group;
> +long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
>
>  #endif
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

