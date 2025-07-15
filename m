Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D7BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jy+zLONzq0eoMhsKSOJBs3xoxQSZWPvQT5RYI7oFf8g=; b=030vXqNvKho75HQziqYiqGPAuI
	zqDCAUTcagBU1/sxlrLnRUpEgf+cFD64JNK0TUwh590+/2Fl+Yttnxa+i+w4pNHYRDgwhtEgnatfC
	B0GnO0eUJORFvDuVRzqH3q2/7fPwGa2x3uEwphXdLeKqUDtwLYzyxfcCdZrmHarn2eqgmdrNygOZN
	05QPyiMIelB0kA4D3bP3InyTQ4yXZudlHHDEuYmR7VKQ51JO2Zt6PpGBgWc3XHfX9HjYpfgXe9jBu
	e67O67zvtW1aAAWvahxFk4ciA2M8HlmFTcaMi86tpgdzgFAey0YCEAfgKk/uSbYNQSnsKbrZGguPY
	l5z8/pYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiE3-00000005heN-1lAD;
	Tue, 15 Jul 2025 16:09:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgi6-00000005O1I-1hYS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:32:47 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74ce477af25so3460386b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752589965; x=1753194765; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy+zLONzq0eoMhsKSOJBs3xoxQSZWPvQT5RYI7oFf8g=;
        b=ggB/fAhCnco2S7g54QGknE9R6SWvgR6hLAzzC22llaEfUTAAsjW+KMprUCuxH5BGnQ
         XqIso5KfvHrBOXkNu2nyW73H5kVYXj0HNRECfFaudyL6tDiNE2Xv3MidSvma6Sgz6XI+
         RcEBd2pRUIsBWc08x9IZgMB/3T8AagynWFlGrAutxbq3ovucXk1kG55Sj/sBYiLziAyF
         FIRWsJ2rDTx+n7/D+Nznc2JoXONgBzzQ0ZcB8Gh+57mU6IcDEtDGRZev1mWhuX2PoLxn
         LNGhQmrE63V4WkDBjWI9IRUkmW8dHHandE8WPs9K385jxbPWl4qEQOTufyQRstU9gB0o
         bfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752589965; x=1753194765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy+zLONzq0eoMhsKSOJBs3xoxQSZWPvQT5RYI7oFf8g=;
        b=dGrJ9VQZMYbn5BqUMUG9VYm6nV/qumCll2O2EM1PukWjQxmq+M/26+R+Vy015AtoDs
         sSlrpf4qhsvL2/jmBIfXkj+me+4yGzvERFEcmbT6Q1H3HbmiEjCLazAg/jTQffsuqDJi
         2LSQCGIQpoFv9657xcaDCxRqMWBvJx0+ltmEtmfKzJ7dlfEZy3ZX+JfXHzvJ95uvxKuh
         7DpJngiAfinCtu2S1p86QXUpSawnoOP/SK8bz4ya4xylUROM0qHtaVv7CuatR8O/Q854
         Ka+kZ5TA+SSSm8oQbFD0dAQ+Qji3R8jJsdXgcOsCCKbkomu22vGzmVoDZ6YUJejwKmeq
         +W2A==
X-Forwarded-Encrypted: i=1; AJvYcCUfBzHsyQebvJDq3+sjU5BHNl8SIUyeNUvK5SHYUD4aWzp6yBVLsD9REdLqIWOFvj9tZcn3uSBwz+YD0eWr9Hbb@lists.infradead.org
X-Gm-Message-State: AOJu0YxR65c2dbycipcCpbJBdrHuinkx72LeyRkfgJF3cxEQza7/OPRk
	Tr4uDTmGhkCaDw4ghyLvpG3eRXGxEsvClIu4F8A3Q4/bcykGmhKq6TM5PDPwEaNDTpN0wMbwifU
	gRKpYFFCaVpu3jgkl2Y+5eGulVYZGHe9Alb5RO1fSdw==
X-Gm-Gg: ASbGncsHXZgA9EAXvYb6/GiY4FtMqhXclRhqdRjd6nXp6gzev5/55vkelMwlxGTb0AT
	R0TC3WWPqJvCgt6t05IXKPfSuwU8UWjfRo5U7qdmt8fuNYwRC7Xc0bKQorf7868wNck7d6D7fd3
	CC8M12hEuSRskT3RpzNs9DY+X+NATyw/7PuwlvdqisTvyPzZskRULZ22SknXFCxT9vX5AZ7w/Jv
	Dga8yYg45s79gD1JDnoFBXvDwX3ieWj9KaaOejG
X-Google-Smtp-Source: AGHT+IE+IduVbNAc8nw4bBZAMCvLfuNk0OXJr7aDYYbgTbX5zz2ncNz3P9wtfO+fHREW/sG3zacFuoG2MFi/Aocurcw=
X-Received: by 2002:a05:6a00:b91:b0:749:b9c:1ea7 with SMTP id
 d2e1a72fcca58-74ee30456b5mr19203397b3a.17.1752589964904; Tue, 15 Jul 2025
 07:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250709171730.14786-1-chelsyratnawat2001@gmail.com>
In-Reply-To: <20250709171730.14786-1-chelsyratnawat2001@gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 15 Jul 2025 15:32:32 +0100
X-Gm-Features: Ac12FXzStWXGQdXuDNCrnyostOneCIL0WI-FgDRfO8fpYIBQEDgbVpm8NysE6tQ
Message-ID: <CAJ9a7VgfL8QifeynouQDNkqfbxR_P6FY1CDn4nQ3dd-1j7PCVg@mail.gmail.com>
Subject: Re: [PATCH v3] coresight: Replace scnprintf() with sysfs_emit() in
 sysfs show functions
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: suzuki.poulose@arm.com, alexander.shishkin@linux.intel.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	james.clark@linaro.org, coresight@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_073246_454533_C7111694 
X-CRM114-Status: GOOD (  18.71  )
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

If this change is to be made, which is a high degree of churn for no
functional difference, then it should be comprehensive.

The sysfs _show() functions in coresight_ /cti_sysfs.c / tmc_core.c /
trbe.c / funnel.c, which all use sprintf in the show() function should
be included

On Wed, 9 Jul 2025 at 18:17, Chelsy Ratnawat
<chelsyratnawat2001@gmail.com> wrote:
>
> Documentation/filesystems/sysfs.rst mentions that show() should only
> use sysfs_emit() or sysfs_emit_at() when formating the value to be
> returned to user space. So replace scnprintf() with sysfs_emit().
>
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> ---
> Changes in v3:
>  - fixed warnings from checkpatch.pl
>
>  .../hwtracing/coresight/coresight-etm-perf.c  |   4 +-
>  .../coresight/coresight-etm3x-sysfs.c         |   2 +-
>  .../coresight/coresight-etm4x-sysfs.c         | 118 +++++++++---------
>  drivers/hwtracing/coresight/coresight-stm.c   |   8 +-
>  drivers/hwtracing/coresight/coresight-sysfs.c |   4 +-
>  5 files changed, 68 insertions(+), 68 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f1551c08ecb2..8cfdcbc2f8f6 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -851,7 +851,7 @@ static ssize_t etm_perf_sink_name_show(struct device *dev,
>         struct dev_ext_attribute *ea;
>
>         ea = container_of(dattr, struct dev_ext_attribute, attr);
> -       return scnprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)(ea->var));
> +       return sysfs_emit(buf, "0x%lx\n", (unsigned long)(ea->var));
>  }
>
>  static struct dev_ext_attribute *
> @@ -943,7 +943,7 @@ static ssize_t etm_perf_cscfg_event_show(struct device *dev,
>         struct dev_ext_attribute *ea;
>
>         ea = container_of(dattr, struct dev_ext_attribute, attr);
> -       return scnprintf(buf, PAGE_SIZE, "configid=0x%lx\n", (unsigned long)(ea->var));
> +       return sysfs_emit(buf, "configid=0x%lx\n", (unsigned long)(ea->var));
>  }
>
>  int etm_perf_add_symlink_cscfg(struct device *dev, struct cscfg_config_desc *config_desc)
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 762109307b86..4868eb05a312 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -1182,7 +1182,7 @@ static ssize_t cpu_show(struct device *dev,
>         struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->cpu;
> -       return scnprintf(buf, PAGE_SIZE, "%d\n", val);
> +       return sysfs_emit(buf, "%d\n", val);
>
>  }
>  static DEVICE_ATTR_RO(cpu);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index ab251865b893..4ddc0d344b61 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -63,7 +63,7 @@ static ssize_t nr_pe_cmp_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->nr_pe_cmp;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(nr_pe_cmp);
>
> @@ -75,7 +75,7 @@ static ssize_t nr_addr_cmp_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->nr_addr_cmp;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(nr_addr_cmp);
>
> @@ -87,7 +87,7 @@ static ssize_t nr_cntr_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->nr_cntr;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(nr_cntr);
>
> @@ -99,7 +99,7 @@ static ssize_t nr_ext_inp_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->nr_ext_inp;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(nr_ext_inp);
>
> @@ -111,7 +111,7 @@ static ssize_t numcidc_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->numcidc;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(numcidc);
>
> @@ -123,7 +123,7 @@ static ssize_t numvmidc_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->numvmidc;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(numvmidc);
>
> @@ -135,7 +135,7 @@ static ssize_t nrseqstate_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->nrseqstate;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(nrseqstate);
>
> @@ -147,7 +147,7 @@ static ssize_t nr_resource_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->nr_resource;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(nr_resource);
>
> @@ -159,7 +159,7 @@ static ssize_t nr_ss_cmp_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->nr_ss_cmp;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(nr_ss_cmp);
>
> @@ -287,7 +287,7 @@ static ssize_t mode_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->mode;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t mode_store(struct device *dev,
> @@ -453,7 +453,7 @@ static ssize_t pe_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->pe_sel;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t pe_store(struct device *dev,
> @@ -488,7 +488,7 @@ static ssize_t event_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->eventctrl0;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t event_store(struct device *dev,
> @@ -537,7 +537,7 @@ static ssize_t event_instren_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = FIELD_GET(TRCEVENTCTL1R_INSTEN_MASK, config->eventctrl1);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t event_instren_store(struct device *dev,
> @@ -593,7 +593,7 @@ static ssize_t event_ts_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->ts_ctrl;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t event_ts_store(struct device *dev,
> @@ -623,7 +623,7 @@ static ssize_t syncfreq_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->syncfreq;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t syncfreq_store(struct device *dev,
> @@ -653,7 +653,7 @@ static ssize_t cyc_threshold_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->ccctlr;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t cyc_threshold_store(struct device *dev,
> @@ -686,7 +686,7 @@ static ssize_t bb_ctrl_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->bb_ctrl;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t bb_ctrl_store(struct device *dev,
> @@ -726,7 +726,7 @@ static ssize_t event_vinst_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = FIELD_GET(TRCVICTLR_EVENT_MASK, config->vinst_ctrl);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t event_vinst_store(struct device *dev,
> @@ -758,7 +758,7 @@ static ssize_t s_exlevel_vinst_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = FIELD_GET(TRCVICTLR_EXLEVEL_S_MASK, config->vinst_ctrl);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t s_exlevel_vinst_store(struct device *dev,
> @@ -793,7 +793,7 @@ static ssize_t ns_exlevel_vinst_show(struct device *dev,
>
>         /* EXLEVEL_NS, bits[23:20] */
>         val = FIELD_GET(TRCVICTLR_EXLEVEL_NS_MASK, config->vinst_ctrl);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t ns_exlevel_vinst_store(struct device *dev,
> @@ -827,7 +827,7 @@ static ssize_t addr_idx_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->addr_idx;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t addr_idx_store(struct device *dev,
> @@ -866,11 +866,11 @@ static ssize_t addr_instdatatype_show(struct device *dev,
>         raw_spin_lock(&drvdata->spinlock);
>         idx = config->addr_idx;
>         val = FIELD_GET(TRCACATRn_TYPE_MASK, config->addr_acc[idx]);
> -       len = scnprintf(buf, PAGE_SIZE, "%s\n",
> -                       val == TRCACATRn_TYPE_ADDR ? "instr" :
> -                       (val == TRCACATRn_TYPE_DATA_LOAD_ADDR ? "data_load" :
> -                       (val == TRCACATRn_TYPE_DATA_STORE_ADDR ? "data_store" :
> -                       "data_load_store")));
> +       len = sysfs_emit(buf, "%s\n",
> +                        val == TRCACATRn_TYPE_ADDR ? "instr" :
> +                        (val == TRCACATRn_TYPE_DATA_LOAD_ADDR ? "data_load" :
> +                        (val == TRCACATRn_TYPE_DATA_STORE_ADDR ? "data_store" :
> +                        "data_load_store")));
>         raw_spin_unlock(&drvdata->spinlock);
>         return len;
>  }
> @@ -918,7 +918,7 @@ static ssize_t addr_single_show(struct device *dev,
>         }
>         val = (unsigned long)config->addr_val[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t addr_single_store(struct device *dev,
> @@ -974,7 +974,7 @@ static ssize_t addr_range_show(struct device *dev,
>         val1 = (unsigned long)config->addr_val[idx];
>         val2 = (unsigned long)config->addr_val[idx + 1];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
> +       return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
>  }
>
>  static ssize_t addr_range_store(struct device *dev,
> @@ -1049,7 +1049,7 @@ static ssize_t addr_start_show(struct device *dev,
>
>         val = (unsigned long)config->addr_val[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t addr_start_store(struct device *dev,
> @@ -1104,7 +1104,7 @@ static ssize_t addr_stop_show(struct device *dev,
>
>         val = (unsigned long)config->addr_val[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t addr_stop_store(struct device *dev,
> @@ -1152,7 +1152,7 @@ static ssize_t addr_ctxtype_show(struct device *dev,
>         idx = config->addr_idx;
>         /* CONTEXTTYPE, bits[3:2] */
>         val = FIELD_GET(TRCACATRn_CONTEXTTYPE_MASK, config->addr_acc[idx]);
> -       len = scnprintf(buf, PAGE_SIZE, "%s\n", val == ETM_CTX_NONE ? "none" :
> +       len = sysfs_emit(buf, "%s\n", val == ETM_CTX_NONE ? "none" :
>                         (val == ETM_CTX_CTXID ? "ctxid" :
>                         (val == ETM_CTX_VMID ? "vmid" : "all")));
>         raw_spin_unlock(&drvdata->spinlock);
> @@ -1219,7 +1219,7 @@ static ssize_t addr_context_show(struct device *dev,
>         /* context ID comparator bits[6:4] */
>         val = FIELD_GET(TRCACATRn_CONTEXT_MASK, config->addr_acc[idx]);
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t addr_context_store(struct device *dev,
> @@ -1262,7 +1262,7 @@ static ssize_t addr_exlevel_s_ns_show(struct device *dev,
>         idx = config->addr_idx;
>         val = FIELD_GET(TRCACATRn_EXLEVEL_MASK, config->addr_acc[idx]);
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t addr_exlevel_s_ns_store(struct device *dev,
> @@ -1325,8 +1325,8 @@ static ssize_t addr_cmp_view_show(struct device *dev,
>         }
>         raw_spin_unlock(&drvdata->spinlock);
>         if (addr_type) {
> -               size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] %s %#lx", idx,
> -                                addr_type_names[addr_type], addr_v);
> +               size = sysfs_emit(buf, "addr_cmp[%i] %s %#lx", idx,
> +                                 addr_type_names[addr_type], addr_v);
>                 if (addr_type == ETM_ADDR_TYPE_RANGE) {
>                         size += scnprintf(buf + size, PAGE_SIZE - size,
>                                           " %#lx %s", addr_v2,
> @@ -1335,7 +1335,7 @@ static ssize_t addr_cmp_view_show(struct device *dev,
>                 size += scnprintf(buf + size, PAGE_SIZE - size,
>                                   " ctrl(%#lx)\n", addr_ctrl);
>         } else {
> -               size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] unused\n", idx);
> +               size = sysfs_emit(buf, "addr_cmp[%i] unused\n", idx);
>         }
>         return size;
>  }
> @@ -1352,7 +1352,7 @@ static ssize_t vinst_pe_cmp_start_stop_show(struct device *dev,
>         if (!drvdata->nr_pe_cmp)
>                 return -EINVAL;
>         val = config->vipcssctlr;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static ssize_t vinst_pe_cmp_start_stop_store(struct device *dev,
>                                              struct device_attribute *attr,
> @@ -1383,7 +1383,7 @@ static ssize_t seq_idx_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->seq_idx;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t seq_idx_store(struct device *dev,
> @@ -1419,7 +1419,7 @@ static ssize_t seq_state_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->seq_state;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t seq_state_store(struct device *dev,
> @@ -1453,7 +1453,7 @@ static ssize_t seq_event_show(struct device *dev,
>         idx = config->seq_idx;
>         val = config->seq_ctrl[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t seq_event_store(struct device *dev,
> @@ -1486,7 +1486,7 @@ static ssize_t seq_reset_event_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->seq_rst;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t seq_reset_event_store(struct device *dev,
> @@ -1516,7 +1516,7 @@ static ssize_t cntr_idx_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->cntr_idx;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t cntr_idx_store(struct device *dev,
> @@ -1556,7 +1556,7 @@ static ssize_t cntrldvr_show(struct device *dev,
>         idx = config->cntr_idx;
>         val = config->cntrldvr[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t cntrldvr_store(struct device *dev,
> @@ -1594,7 +1594,7 @@ static ssize_t cntr_val_show(struct device *dev,
>         idx = config->cntr_idx;
>         val = config->cntr_val[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t cntr_val_store(struct device *dev,
> @@ -1632,7 +1632,7 @@ static ssize_t cntr_ctrl_show(struct device *dev,
>         idx = config->cntr_idx;
>         val = config->cntr_ctrl[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t cntr_ctrl_store(struct device *dev,
> @@ -1664,7 +1664,7 @@ static ssize_t res_idx_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->res_idx;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t res_idx_store(struct device *dev,
> @@ -1708,7 +1708,7 @@ static ssize_t res_ctrl_show(struct device *dev,
>         idx = config->res_idx;
>         val = config->res_ctrl[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t res_ctrl_store(struct device *dev,
> @@ -1746,7 +1746,7 @@ static ssize_t sshot_idx_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->ss_idx;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t sshot_idx_store(struct device *dev,
> @@ -1780,7 +1780,7 @@ static ssize_t sshot_ctrl_show(struct device *dev,
>         raw_spin_lock(&drvdata->spinlock);
>         val = config->ss_ctrl[config->ss_idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t sshot_ctrl_store(struct device *dev,
> @@ -1815,7 +1815,7 @@ static ssize_t sshot_status_show(struct device *dev,
>         raw_spin_lock(&drvdata->spinlock);
>         val = config->ss_status[config->ss_idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>  static DEVICE_ATTR_RO(sshot_status);
>
> @@ -1830,7 +1830,7 @@ static ssize_t sshot_pe_ctrl_show(struct device *dev,
>         raw_spin_lock(&drvdata->spinlock);
>         val = config->ss_pe_cmp[config->ss_idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t sshot_pe_ctrl_store(struct device *dev,
> @@ -1864,7 +1864,7 @@ static ssize_t ctxid_idx_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->ctxid_idx;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t ctxid_idx_store(struct device *dev,
> @@ -1911,7 +1911,7 @@ static ssize_t ctxid_pid_show(struct device *dev,
>         idx = config->ctxid_idx;
>         val = (unsigned long)config->ctxid_pid[idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t ctxid_pid_store(struct device *dev,
> @@ -1972,7 +1972,7 @@ static ssize_t ctxid_masks_show(struct device *dev,
>         val1 = config->ctxid_mask0;
>         val2 = config->ctxid_mask1;
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
> +       return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
>  }
>
>  static ssize_t ctxid_masks_store(struct device *dev,
> @@ -2090,7 +2090,7 @@ static ssize_t vmid_idx_show(struct device *dev,
>         struct etmv4_config *config = &drvdata->config;
>
>         val = config->vmid_idx;
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t vmid_idx_store(struct device *dev,
> @@ -2135,7 +2135,7 @@ static ssize_t vmid_val_show(struct device *dev,
>         raw_spin_lock(&drvdata->spinlock);
>         val = (unsigned long)config->vmid_val[config->vmid_idx];
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t vmid_val_store(struct device *dev,
> @@ -2187,7 +2187,7 @@ static ssize_t vmid_masks_show(struct device *dev,
>         val1 = config->vmid_mask0;
>         val2 = config->vmid_mask1;
>         raw_spin_unlock(&drvdata->spinlock);
> -       return scnprintf(buf, PAGE_SIZE, "%#lx %#lx\n", val1, val2);
> +       return sysfs_emit(buf, "%#lx %#lx\n", val1, val2);
>  }
>
>  static ssize_t vmid_masks_store(struct device *dev,
> @@ -2303,7 +2303,7 @@ static ssize_t cpu_show(struct device *dev,
>         struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
>
>         val = drvdata->cpu;
> -       return scnprintf(buf, PAGE_SIZE, "%d\n", val);
> +       return sysfs_emit(buf, "%d\n", val);
>
>  }
>  static DEVICE_ATTR_RO(cpu);
> @@ -2461,7 +2461,7 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
>         val = etmv4_cross_read(drvdata, offset);
>         pm_runtime_put_sync(dev->parent);
>
> -       return scnprintf(buf, PAGE_SIZE, "0x%x\n", val);
> +       return sysfs_emit(buf, "0x%x\n", val);
>  }
>
>  static bool
> diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
> index e45c6c7204b4..fa09a43889d7 100644
> --- a/drivers/hwtracing/coresight/coresight-stm.c
> +++ b/drivers/hwtracing/coresight/coresight-stm.c
> @@ -470,7 +470,7 @@ static ssize_t hwevent_enable_show(struct device *dev,
>         struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         unsigned long val = drvdata->stmheer;
>
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t hwevent_enable_store(struct device *dev,
> @@ -499,7 +499,7 @@ static ssize_t hwevent_select_show(struct device *dev,
>         struct stm_drvdata *drvdata = dev_get_drvdata(dev->parent);
>         unsigned long val = drvdata->stmhebsr;
>
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t hwevent_select_store(struct device *dev,
> @@ -534,7 +534,7 @@ static ssize_t port_select_show(struct device *dev,
>                 spin_unlock(&drvdata->spinlock);
>         }
>
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t port_select_store(struct device *dev,
> @@ -581,7 +581,7 @@ static ssize_t port_enable_show(struct device *dev,
>                 spin_unlock(&drvdata->spinlock);
>         }
>
> -       return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
> +       return sysfs_emit(buf, "%#lx\n", val);
>  }
>
>  static ssize_t port_enable_store(struct device *dev,
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index feadaf065b53..547f4970e1e5 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -315,7 +315,7 @@ static ssize_t enable_sink_show(struct device *dev,
>  {
>         struct coresight_device *csdev = to_coresight_device(dev);
>
> -       return scnprintf(buf, PAGE_SIZE, "%u\n", csdev->sysfs_sink_activated);
> +       return sysfs_emit(buf, "%u\n", csdev->sysfs_sink_activated);
>  }
>
>  static ssize_t enable_sink_store(struct device *dev,
> @@ -343,7 +343,7 @@ static ssize_t enable_source_show(struct device *dev,
>         struct coresight_device *csdev = to_coresight_device(dev);
>
>         guard(mutex)(&coresight_mutex);
> -       return scnprintf(buf, PAGE_SIZE, "%u\n",
> +       return sysfs_emit(buf, "%u\n",
>                          coresight_get_mode(csdev) == CS_MODE_SYSFS);
>  }
>
> --
> 2.47.1
>
Regards

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

