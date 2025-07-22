Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC0FC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nEvjrAIXErsS9BfFw8MZCs9FAL8gPxuYujnNEdkoWd0=; b=2UXXmdT6xWfsKnmbDERQYdFL4G
	V3pOpASUPzIJyL4P18KO9lkY/hpKB1VGjBf4gJ5BqR23F0PAu+38RyuK8B4XfVb+A4IxGIVSsPVxu
	EcVdZ3U5QIl37VKotmfkvXftAqpAGxLgyBfm/DUnBRlxjFRUzb+LnV/40IPVHUc8oW+kpixgUCSkJ
	eBSPW8jYOK0ml4Q91iMVtt2ZZhaaYA92XdXs5clrFPcmjs1ruCHOlVao94uQHUojidZLrqY0nk3fz
	YhQMc0fXVITZPpUob7KmuoFBNIev2v3Y/8N+4m2cTsq/JPsXTJMpyFhGBzlvXZRCucs88t7ioXLsb
	SYV2eWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFcv-00000002zL4-11IH;
	Tue, 22 Jul 2025 16:14:01 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEVI-00000002o0F-27sp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 15:02:05 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so904947766b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753196523; x=1753801323; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nEvjrAIXErsS9BfFw8MZCs9FAL8gPxuYujnNEdkoWd0=;
        b=amsG1ISsLLQZ+KcbwBFAlXVfHAhevYX9YF30nTdv6YsTnbnlFZDGt9mIYWvjvJ+Fit
         d3NpjZuMQJI7sczf6IhxS2WY4/GthngHIY2K9AuG0hkKMBlZAdOSXE2APVB+gZdmGoZD
         64jqP5ZyfiZCeV1k9YP/r455ULqLiuu4po0X8CUEZEpGigURHOm89g5q3LsGXUtrx1lH
         vEBH3BRKUPVcusOGUjvzW9I+pzBUN8efGG2KsowTx+Qc+FhLdrbC0g4XTZgh0I6Esj8o
         CpKKhfUhLTQxKAd/I9nqRSrdKJNm1CsblDrxBj6DWyuOU8x4zG0maj0X/vFdBJ4ZWBsN
         1oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753196523; x=1753801323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEvjrAIXErsS9BfFw8MZCs9FAL8gPxuYujnNEdkoWd0=;
        b=pwpih3e2V/PgZgffpmegZgjMvjqcIvum+P+MrGxcbcnUH19xHuGJYtV/IESwJEW9v7
         73UhyRTHvjElGdxDrLoWE6mouRr8VBtKeeLypGYedU/KS2LDDWk0IhBLXylpktcukrbH
         SA+/naExSYN+xDSC9aXoxWPD9alUocwUCXC0M9231W1vS8Md/aLZx3PAX1Ss2p0k3lAc
         1w4rlK71+Q5laM3uHSkrdmkqYUr1Sw4SMKfKyyFLAlzQ12vPbQiMKiVk7CiO4Xze3iXE
         nxhRelOOZ8XtAR30c/slmGYlOUT+/MIhXsfe6xiOQUi7LwbBM3yArjzc9ryyJkGKbvqk
         gmEw==
X-Forwarded-Encrypted: i=1; AJvYcCVFV52bntFR5fqlRbMeCrt11mw3mAVtSOFoA43Mz4GiJ6hwoFDVWyIn0sO5CjHRZPRA26LTAQJPoK4g1lGHd5Ii@lists.infradead.org
X-Gm-Message-State: AOJu0YxWfnRADobo3DjjLzRc5dsd7b+zRCyD0tgbo32pb+GDsfV+417J
	IBSLV1ZJwfWDtyDDYEq3yKBRSAbV04WfzcY6D9l51EKV3cc0Jf3wtQpCON4SuppA5Nb22QOAM3F
	JFN+9NmYK3t6fyFrT8mipIgXSuWnfAhxKRbS6cPlyFg==
X-Gm-Gg: ASbGncsmFNryNVICoTSDaRGFtz2/BuZ181vnha9gehU1iDFzRD1A+/mxDguQtefWyWp
	hKRMAOmBz1wv7sM69nRsM5ORwIymQA6ooMIaKC5ErIYOVSSIuAovcDoIzDNEvEARvukK9XISf/t
	51Yf//BemwmrGioCr18D2Sn5TYyfXi73f687gytlXmoMUyl215cr/+PXTXlradD12XeJWv49ses
	W/UUZmh
X-Google-Smtp-Source: AGHT+IFg73PkXYgN1tNOwxu4msSHw3xq+UPj5j1pYGLTNqKF26OkhV0aHOHkNMbS27ajm5zCuBIru3by7LAgJZv0MNw=
X-Received: by 2002:a17:907:ccaa:b0:ae6:f670:24f2 with SMTP id
 a640c23a62f3a-ae9ce10d92cmr1834939866b.47.1753196521959; Tue, 22 Jul 2025
 08:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-10-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-10-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 16:01:48 +0100
X-Gm-Features: Ac12FXxRqitL3ALJ46-K80sEvvW_k-OcH6ReUch-Dg3IVnZ20mIlZwysjxyZnss
Message-ID: <CAJ9a7Vj_NfO7D+j11_7DbgWD-Cn9cQp4g=r9EqHMZiAU63NomQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 09/10] coresight: tmc: add read function for byte-cntr
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
	Mao Jinlong <quic_jinlmao@quicinc.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_080204_557311_7FBECC2B 
X-CRM114-Status: GOOD (  35.32  )
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

On Mon, 14 Jul 2025 at 07:32, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> The byte-cntr read function always reads trace data from the deactivated
> and filled buffer which is already synced. The read function will fail
> when the ETR cannot find a available buffer to receive trace data.
>
> The read function terminates when the path is disabled or interrupted by a
> signal.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-core.c  | 31 ++++++-
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 90 +++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h   |  3 +
>  3 files changed, 120 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
> index 354faeeddbb2..3ab25adc4e4d 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-core.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
> @@ -318,14 +318,18 @@ static int tmc_open(struct inode *inode, struct file *file)
>         return 0;
>  }
>
> -static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
> -                                  char **bufpp)
> +static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata,
> +                                  struct ctcu_byte_cntr *byte_cntr_data,
> +                                  loff_t pos, size_t len, char **bufpp)

Don't change "core" functionalilty to add in bytecntr parameters.

Use helper functions to have a pattern such as:

if (bytecntr_active())
    call_byte_cntr_fn()
else
    call_standard_fn()

>  {
>         switch (drvdata->config_type) {
>         case TMC_CONFIG_TYPE_ETB:
>         case TMC_CONFIG_TYPE_ETF:
>                 return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
>         case TMC_CONFIG_TYPE_ETR:
> +               if (byte_cntr_data && byte_cntr_data->thresh_val)
> +                       return tmc_byte_cntr_get_data(drvdata, byte_cntr_data, len, bufpp);
> +
>                 return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
>         }
>
> @@ -339,7 +343,21 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
>         ssize_t actual;
>         struct tmc_drvdata *drvdata = container_of(file->private_data,
>                                                    struct tmc_drvdata, miscdev);
> -       actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
> +       struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
> +                                               CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
> +       struct ctcu_byte_cntr *byte_cntr_data = NULL;
> +       struct ctcu_drvdata *ctcu_drvdata = NULL;
> +       int port;
> +
> +       if (helper) {
> +               port = coresight_get_port_helper(drvdata->csdev, helper);
> +               if (port >= 0) {
> +                       ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
> +                       byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
> +               }
> +       }
> +
> +       actual = tmc_get_sysfs_trace(drvdata, byte_cntr_data, *ppos, len, &bufp);
>         if (actual <= 0)
>                 return 0;
>
> @@ -349,7 +367,12 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
>                 return -EFAULT;
>         }
>
> -       *ppos += actual;
> +       if (byte_cntr_data && byte_cntr_data->thresh_val) {
> +               byte_cntr_data->total_size += actual;
> +               drvdata->reading_node->pos += actual;
> +       } else
> +               *ppos += actual;
> +
>         dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
>
>         return actual;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 3e3e1b5e78ca..174411e76047 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1163,6 +1163,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>         ssize_t actual = len;
>         struct etr_buf *etr_buf = drvdata->sysfs_buf;
>
> +       /* Reading the buffer from the buf_node if it exists*/
> +       if (drvdata->reading_node)
> +               etr_buf = drvdata->reading_node->sysfs_buf;
> +
>         if (pos + actual > etr_buf->len)
>                 actual = etr_buf->len - pos;
>         if (actual <= 0)
> @@ -1339,6 +1343,92 @@ static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
>         return found_free_buf;
>  }
>
> +/*
> + * tmc_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
> + * The byte-cntr reading work reads data from the deactivated and filled buffer.
> + * The read operation waits for a buffer to become available, either filled or
> + * upon timeout, and then reads trace data from the synced buffer.
> + */

This entire function should be moved to one of the byte-cntr source files.

> +ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
> +                              struct ctcu_byte_cntr *byte_cntr_data,
> +                              size_t len, char **bufpp)
> +{
> +       size_t thresh_val = byte_cntr_data->thresh_val;
> +       atomic_t *irq_cnt = &byte_cntr_data->irq_cnt;
> +       struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
> +       struct device *dev = &drvdata->csdev->dev;
> +       struct etr_buf_node *nd, *next;
> +       ssize_t size = sysfs_buf->size;
> +       ssize_t actual;
> +       loff_t pos;
> +       int ret;
> +
> +wait_buffer:
> +       if (!byte_cntr_data->reading_buf) {
> +               ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
> +                               ((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
> +                               !byte_cntr_data->enable,
> +                               BYTE_CNTR_TIMEOUT);
> +               if (ret < 0)
> +                       return ret;
> +               /*
> +                * The current etr_buf is almost full or timeout is triggered,
> +                * so switch the buffer and mark the switched buffer as reading.
> +                */
> +               if (byte_cntr_data->enable) {
> +                       if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
> +                               dev_err(dev, "Switch buffer failed for byte-cntr\n");
> +                               return -EINVAL;
> +                       }
> +
> +                       byte_cntr_data->reading_buf = true;
> +               } else {
> +                       if (!drvdata->reading_node) {
> +                               list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
> +                                       if (nd->sysfs_buf == sysfs_buf) {
> +                                               nd->pos = 0;
> +                                               drvdata->reading_node = nd;
> +                                               break;
> +                                       }
> +                               }
> +                       }
> +
> +                       pos = drvdata->reading_node->pos;
> +                       actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
> +                       if (actual > 0)
> +                               return actual;
> +
> +                       drvdata->reading_node = NULL;
> +
> +                       /* Exit byte-cntr reading */
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       /* Check the status of current etr_buf*/
> +       if ((atomic_read(irq_cnt) + 1) * thresh_val >= size)
> +               /*
> +                * Unlikely to find a free buffer to switch, so just disable
> +                * the ETR for a while.
> +                */
> +               if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data))
> +                       dev_info(dev, "No available buffer to store data, disable ETR\n");
> +
> +       pos = drvdata->reading_node->pos;
> +       actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
> +       if (actual == 0) {
> +               /* Reading work for marked buffer has finished, reset flags */
> +               drvdata->reading_node->reading = false;
> +               byte_cntr_data->reading_buf = false;
> +               drvdata->reading_node = NULL;
> +
> +               /* Nothing in the buffer, wait for next buffer to be filled */
> +               goto wait_buffer;
> +       }
> +
> +       return actual;
> +}
> +
>  static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>  {
>         int ret = 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 1dbba0bc50a3..4136ec5ecaf7 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -364,6 +364,9 @@ int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
>                                struct ctcu_byte_cntr *byte_cntr_data);
>  int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
>                                  struct ctcu_byte_cntr *byte_cntr_data);

Declare this in a byte_cntr header file, not here.

> +ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
> +                              struct ctcu_byte_cntr *byte_cntr_data,
> +                              size_t len, char **bufpp);
>
>  #define TMC_REG_PAIR(name, lo_off, hi_off)                             \
>  static inline u64                                                      \
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

