Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70814D12D6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOWnkIRJZlMYfvBdntLM8OIUOPXbDKElPfu2JoYWbfk=; b=sS6r4aWdb8cQA2nuu8oyPYTiwh
	ADF/nRq5kKxkUwKAmFwgmIEjPsGf2SEe622rL2JVAOAwkiMnQXqonnLoU7A7NZB5SJ1brYKZWuQxd
	R3ZpUezKLhbz33mXE01p9Yv4iV8Ok8hFO341zkUMNfZmt8DQdQ/l1skLl+qU2vTO9X0UjB3aceCY7
	5OzJb26FZrsZk9oQ5HdSRMeXaygjtNDqP+ixCMAuwJcCdrLA+J2enhKdqvbGSsoALNbBKxvVC8riW
	iO+KRIWlzs4DB0h2THnP9pZ7P5X0zVDWB32+z75NK+0MWh3qPP1ZCuDb+yDfERmPbijhA7eaOx7fE
	kwucTfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnp3-00000006eGv-0teJ;
	Wed, 03 Dec 2025 14:27:13 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQnp1-00000006eGT-11Mv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 14:27:12 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8b2f2c5ec36so708696285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 06:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764772030; x=1765376830; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AOWnkIRJZlMYfvBdntLM8OIUOPXbDKElPfu2JoYWbfk=;
        b=QDus5KO6bihR1dh7w2v722JJplziZsBNDi1+XoaQbUcW3kQ5fNMRxee8xXhbqpSruI
         3+RGNh/ay1Jggik/cxcaVQQIB/PkiIEFiExQpBP607c71Ax7K37dy9YueQqaVmthprtl
         iX1N/8GoKoKkS3NDJ0AMNoApg2yXo1d1/ZeczIzwGRyJ/K+IUWvKcSwFqOKdUz7BCFbX
         UdmQp2IuPI41pyO6ZVoTmFFqT/BJmwOodFHpb/B4nLFEJponauxG2Qtbpy7iFyFFgV0Z
         /HzEgQS70ZRm5eM8pyzWSzyT6D9PUIHnWnNhGRqNsAloRxfHGre5v0FHmN5RvRPDoOl6
         Rw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764772030; x=1765376830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOWnkIRJZlMYfvBdntLM8OIUOPXbDKElPfu2JoYWbfk=;
        b=BJHmgWut3a0GmSeoYKpWB8UHVpESH9fsEjOcsjhWujKicuoyf+clKJK0sy+p55TMUr
         UqgyNv45WOa6C46IDgv5ZZFZrtWxDcj76DVBPr0lou+/iovVSfjOuMBATWLw6OokVwE8
         KchqHz0PWk7ushU8wwK2R7dRTNgSygff4b/mVQ28cqee26l3cW7pzY/AX1i0LHWjmBsG
         eeViwmFdRMqoLgUeMK6qJy6J41xcGanS1rEha+Fq9DedyJUuTCk1uOkU6dMYEpF3qUkG
         xlEveSJUnQU/3+4x+kfdPxhTn/S0ay058pzmTJQo3LmtziYtpPRFxHzaFj89N79XChfb
         fn1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr2Wty+IJaz9sHHc8oQSji2jHvN4B1ZkKLhtuynwfABgBNHlrlTjJ6D9fI7hoXTAJHxKXMxERBe7XyIGqDEGyT@lists.infradead.org
X-Gm-Message-State: AOJu0YxW3NW7KR2bAE7RLLOt9NXEKuW3eaAWHD5JwHUHdlgAvHMAMtHu
	Eh2ykD1KxdvI83glor4fQj8VO5a/fNQphLWzS65C0OAOoKHyqI5V2F+ApYpvjlWIhIGUs2nnLnA
	+xQs0Pu8Wbamjv+q+M/TmWY7taLKIQp5ChXgNovdgoA==
X-Gm-Gg: ASbGnctCyd9m0vN6JsjBqTKnRIyx2T6L3iHlvOCoROKICz0V7RC4jW9N6RNAbvuDDlE
	RJPjDbZiINdZWmFQ+htxIBHPQ7U4W+PEQmq1OncjwrsflkNYYQXLb14O+ePGRFYrdCM37vswgYQ
	sFSWdPTqkqfX+mirKYLjab+/uX+xJ+APi/5VK88ieiVx6do4tH28jzKL/pbmVn/e2wb2g1qopX1
	C5xx0XX2D4wslQVeJE+B+yYOMTc0XaPSYl2Xn4MWFyEOM2iQYMQ6XXuo6UpN1JLCX4Fj/UXTduF
	L1OA5ExPd1F9JYVlgju3jFeRbnuqUJgwhpg/9Qs=
X-Google-Smtp-Source: AGHT+IFNGJk4s9lPW6fY+k5+AVtO9FAylsbP6PpdkIIKavRVY5uJxDEvlJAXv4kVASM3j7tYT1/H9qLCpTrzGdArpA0=
X-Received: by 2002:a05:620a:448e:b0:8b2:eb66:c64 with SMTP id
 af79cd13be357-8b5e5646192mr333305285a.29.1764772029729; Wed, 03 Dec 2025
 06:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-4-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-4-1db9e621441a@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 3 Dec 2025 14:26:58 +0000
X-Gm-Features: AWmQ_bnOyt0zjYPZlE9hvMXqjUVxenScrOKMJzaNlCT6V8A1ZVtEm0eyoMNIGlk
Message-ID: <CAJ9a7Vg93PZzgxao6NjmGW2rJrZnnMj6+Lz3tdJ2P5AP-JS7ow@mail.gmail.com>
Subject: Re: [PATCH v6 4/9] coresight: tmc: add create/clean functions for etr_buf_list
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jinlong Mao <jinlong.mao@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_062711_322775_BE6A3EC8 
X-CRM114-Status: GOOD (  25.71  )
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

On Mon, 8 Sept 2025 at 03:02, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Create and insert or remove the etr_buf_node to/from the etr_buf_list.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 94 +++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tmc.h     |  2 +
>  2 files changed, 96 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..ed15991b3217 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1909,6 +1909,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
>         .panic_ops      = &tmc_etr_sync_ops,
>  };
>
> +/**
> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
> + * @drvdata:   driver data of the TMC device.
> + *
> + * Remove the allocated node from the list and free the extra buffer.
> + */
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
> +{
> +       struct etr_buf_node *nd, *next;
> +
> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
> +               if (nd->sysfs_buf == drvdata->sysfs_buf) {
> +                       if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
> +                               drvdata->sysfs_buf = NULL;
> +                               tmc_free_etr_buf(nd->sysfs_buf);
> +                               nd->sysfs_buf = NULL;
> +                       }
> +                       list_del(&nd->node);
> +                       kfree(nd);
> +               } else {
> +                       /* Free allocated buffers which are not utilized by ETR */
> +                       list_del(&nd->node);
> +                       tmc_free_etr_buf(nd->sysfs_buf);
> +                       nd->sysfs_buf = NULL;
> +                       kfree(nd);
> +               }
> +       }
> +}
> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
> +
> +/**
> + * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
> + * @drvdata:   driver data of the TMC device.
> + * @num_nodes: number of nodes want to create with the list.
> + *
> + * Return 0 upon success and return the error number if fail.
> + */
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> +{
> +       struct etr_buf_node *new_node;
> +       struct etr_buf *sysfs_buf;
> +       int i = 0, ret = 0;
> +
> +       /* We dont need a list if there is only one node */
> +       if (num_nodes < 2)
> +               return -EINVAL;
> +
> +       /* We expect that sysfs_buf in drvdata has already been allocated. */
> +       if (drvdata->sysfs_buf) {
> +               /* Directly insert the allocated sysfs_buf into the list first */
> +               new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> +               if (IS_ERR(new_node))
> +                       return PTR_ERR(new_node);
> +
> +               new_node->sysfs_buf = drvdata->sysfs_buf;
> +               new_node->is_free = false;
> +               list_add(&new_node->node, &drvdata->etr_buf_list);
> +               i++;
> +       }
> +
> +       while (i < num_nodes) {
> +               new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> +               if (IS_ERR(new_node)) {
> +                       ret = PTR_ERR(new_node);
> +                       break;
> +               }
> +
> +               sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> +               if (IS_ERR(sysfs_buf)) {
> +                       kfree(new_node);
> +                       ret = PTR_ERR(new_node);
> +                       break;
> +               }
> +
> +               /* We dont have a available sysfs_buf in drvdata, setup one */
> +               if (!drvdata->sysfs_buf) {
> +                       drvdata->sysfs_buf = sysfs_buf;
> +                       new_node->is_free = false;
> +               } else
> +                       new_node->is_free = true;
> +
> +               new_node->sysfs_buf = sysfs_buf;
> +               list_add(&new_node->node, &drvdata->etr_buf_list);
> +               i++;
> +       }
> +
> +       /* Clean the list if there is an error */
> +       if (ret)
> +               tmc_clean_etr_buf_list(drvdata);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
> +
>  int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>  {
>         int ret = 0;
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
> index 292e25d82b62..ca0cba860d5f 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.h
> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
> @@ -459,5 +459,7 @@ void tmc_etr_remove_catu_ops(void);
>  struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>                                    enum cs_mode mode, void *data);
>  extern const struct attribute_group coresight_etr_group;
> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
> +int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
>
>  #endif
>
> --
> 2.34.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

