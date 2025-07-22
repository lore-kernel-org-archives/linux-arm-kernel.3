Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAD1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYA6BM6RuT7QlZka2P+M+8292j7neabTFGbKg/RuP8A=; b=U+dcbKUMmiRFLNTQzjp66N1/zd
	2hagF486/OuoLPqjhrRes7TXGDcibvLvqRjXCOuvjXjvCSUlEuW68mwAbLhDtp9d/1zkYi5PAcyrs
	WozEh+Gy9IvMnNAW9xwoH8T44B6MhmKp9YDXO1KJzKnUPclm17H2+zBtnsh4tFEIvYtnK5CfTycnp
	8vO1DBW4cotapcETKzleWMdwoi4bbwDMEnKOoMFbVHIxWZpb31QbfputUMgEhq2+1aBG1HkFtBgSc
	ZFjqBq6IoLRIq34gKXpMvzNPoCn35D5NQc5HAaONgOO/MDoT1nR1vjpPpmJvq6A4414bBd0d8gfIR
	/zUhH9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEw0-00000002sJ5-1k91;
	Tue, 22 Jul 2025 15:29:40 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDgc-00000002e6P-2qGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 14:09:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-75b5be236deso2233970b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753193382; x=1753798182; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYA6BM6RuT7QlZka2P+M+8292j7neabTFGbKg/RuP8A=;
        b=CmTZxdIQBR3rM/DxuI4yQ6BzDleRiVuEBKYOzNyDStQDD3TymYbZCOV0KrdPt/WoDQ
         uClsY77qLyZGiFXP/JhOz89ZxSbUfOcnnsJwa2uZOBTM14nuiLUHvKkX9EDmJcuM/NzQ
         edsILj1ugoo8mDPRXfxnEmbaI/Y+7VqaVfTzT2+YSPAwczeKkxezsi2wqPvX744eqeO6
         cdb4cZpl/LBTtpbEMX7OJmKjLgwiVbZEZvaqaedTgcz8RUfZBf3dsBcaOwbwjRH4Bu0E
         UEUXOWFeFzuBJlTVzdyFEboM69sWLbFFHOR+d5ujnm1M9SyitaGYHHKrFnJURagn3Ph4
         ULoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193382; x=1753798182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYA6BM6RuT7QlZka2P+M+8292j7neabTFGbKg/RuP8A=;
        b=Cgkn73tDD62qJhUfdbPrgO5fBwCltAssokjCCO+YgHeg/QLRARZD+lxRUxqtPHDpP8
         fw/mu/msktyA/axVKVAEi/B+dwMlKcx30rNVibv2UcdMWm+a+AFs6EGAARMnElEBEtej
         /ZkYjlh8ypz5xg9dEkh4il7D6nBSZH9xab0KPUO4oT6vhAI5WkxAZyk3hmB/rIwn0HZE
         b5xxLfVuzGjvqdqp+8onXVu8oLKu+Usc/XxgaKLlSvRpQ9cHn3+htIeVKTVuR7oikibQ
         pYeWpMvz1+pk5hAcDSmv2XyDs5KEsBag4HXg2MSDxysYpw8VGVkucA1QOPptE2Si1uy1
         OAzg==
X-Forwarded-Encrypted: i=1; AJvYcCWRyjxbewSDELJLBCGoI7figLmeEbA2RjvNQ1iWFM8vllnQ6EJEqzQHT34eNWcqF4SP9N4sYd5al5MXOaqIcegv@lists.infradead.org
X-Gm-Message-State: AOJu0YwBPRBaZAXwKFGRRx2SIUjLv6Zx0VpwRaZLzerIxOMQTWLWhK/I
	kH8ut+wNYlzqvhvCzEoqW+2hhgYgqCq0b8Wt8Vf9QwO5PgSHjHThsMAMn4ig5COng0CIdxxiaEG
	AT+fHej3allnDHUUOfLopXcUnNMBWujHp8f7+QYeAlw==
X-Gm-Gg: ASbGnctCP05ygBErcGqBw3yJ/TJZqeIeogVFKK6Xy3hvfKRHCzKcSHMCHGyvkhLr4+m
	anXgah8nVINHqGhvFZETSH/IcZvVzz1x7L1Mjnmzd8LWjR4PrDmemxLu/tzCWhK8IuWMy9u6i6+
	MTM2oYy8NrWmF7+2eNJLupO3ZU0lpu5JvTUaC4DK7B04eLIFn0vU/gJcmnQbOYK6pKK/2TmvlRa
	3VddJRomDyRAKMbqgI=
X-Google-Smtp-Source: AGHT+IGFU4VWxlYJEYbLdchAtv1j2H85pNZPMbrhLD3/A1/ePknqXU8Y1b1MkhV+cBTSRgsa7pHyElQVUGu1ZTiaT3M=
X-Received: by 2002:a05:6a00:3d53:b0:748:3385:a4a with SMTP id
 d2e1a72fcca58-75724e89802mr35964790b3a.23.1753193381756; Tue, 22 Jul 2025
 07:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-9-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-9-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Jul 2025 15:09:30 +0100
X-Gm-Features: Ac12FXwqHXk4-Uo6jXL4Zzw0JmKbOZ72WWBz7IbZfbByNQJn0Pkpcd6_VysI01c
Message-ID: <CAJ9a7VhLXrdP_CPQPgAYTAGWJfsVUa9SG9Bzv9dLtFzR4nFROg@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 08/10] coresight: tmc: add a switch buffer
 function for byte-cntr
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
X-CRM114-CacheID: sfid-20250722_070942_728161_007619FB 
X-CRM114-Status: GOOD (  28.39  )
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

This buffer swap code looks OK in principle. The ETR is stopped,
memory synced and set to be read.
See other comments inline.

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Switching the sysfs_buf when current buffer is full or the timeout is
> triggered and resets rrp and rwp registers after switched the buffer.
> Disable the ETR device if it cannot find an available buffer to switch.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index 2b73bd8074bb..3e3e1b5e78ca 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1287,6 +1287,58 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>         return ret ? ERR_PTR(ret) : drvdata->sysfs_buf;
>  }
>
> +static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
> +                                       struct ctcu_byte_cntr *byte_cntr_data)
> +{

This entire function should be in one of the byte_cntr source files,
not in the main etr files. Please keep byte cntr code separate as far
as possible

> +       struct etr_buf_node *nd, *next, *curr_node, *picked_node;
> +       struct etr_buf *curr_buf = drvdata->sysfs_buf;
> +       bool found_free_buf = false;
> +
> +       if (WARN_ON(!drvdata || !byte_cntr_data))
> +               return found_free_buf;
> +
> +       /* Stop the ETR before we start the switching process */
> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)

Can this function be called if the mode is not CS_MODE_SYSFS?

> +               __tmc_etr_disable_hw(drvdata);
> +
> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
> +               /* curr_buf is free for next round */
> +               if (nd->sysfs_buf == curr_buf) {
> +                       nd->is_free = true;
> +                       curr_node = nd;
> +               }
> +
> +               if (!found_free_buf && nd->is_free && nd->sysfs_buf != curr_buf) {
> +                       if (nd->reading)
> +                               continue;
> +
> +                       picked_node = nd;
> +                       found_free_buf = true;
> +               }
> +       }
> +
> +       if (found_free_buf) {
> +               curr_node->reading = true;
> +               curr_node->pos = 0;
> +               drvdata->reading_node = curr_node;
> +               drvdata->sysfs_buf = picked_node->sysfs_buf;
> +               drvdata->etr_buf = picked_node->sysfs_buf;
> +               picked_node->is_free = false;
> +               /* Reset irq_cnt for next etr_buf */
> +               atomic_set(&byte_cntr_data->irq_cnt, 0);
> +               /* Reset rrp and rwp when the system has switched the buffer*/
> +               CS_UNLOCK(drvdata->base);
> +               tmc_write_rrp(drvdata, 0);
> +               tmc_write_rwp(drvdata, 0);

This cannot possibly be correct. RWP / RRP are pointers into the
system memory where the ETR stores data.

> +               CS_LOCK(drvdata->base);
> +               /* Restart the ETR when we find a free buffer */
> +               if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> +                       __tmc_etr_enable_hw(drvdata);

What happens if the ETR is not restarted? Using __tmc_etr_disable_hw()
is correct for this use case, but if you do not restart then the extra
shutdown that would ordinarily happen in tmc_etr_disable_hw() does not
occur. How is this handled in the rest of the update?

> +       }
> +
> +       return found_free_buf;
> +}
> +
>  static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>  {
>         int ret = 0;
> --
> 2.34.1
>

Regards

Mike

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

