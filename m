Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951D0109C059
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GA4/9xtXkKrksVBbHSHcgOuftKgItmsz7MH3HGa4+8=; b=DT3JNpkVaMNtUgoCPSEz+r//kB
	8jr9MpVX3aeBwpoGQuC2VNllXwdImq3lgSkGrarmvp3EsXycxWHTK7SqA30cGbKTdCuEup3TJOyZR
	Ef4XSUppnDKjV+TnQUzUZj1f2EB/lhuUFG/aQybZfvctmvNyrjeMd49t57Rsoxw0Me9K+EQEtDlyr
	yY/1RIaD/68wl4jY/sf0/Kiv5xGIxOP6MhssdTIA10FYh4MKSD5jvjUoslx8RAk7ePg1szoXB0iuf
	Pf7kEYAKtCMF0KV5bjFREApCw9ca7MgazCNLM8RW/RF8BjecANUMgE8Yut8ZO5+8BIAwzbPFx8tLu
	NQ7IfgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5T7f-000000045Y5-0MCS;
	Wed, 25 Mar 2026 18:38:31 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5T7b-000000045Ww-45Oe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 18:38:29 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-89c6a711ce9so1881906d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 11:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774463907; cv=none;
        d=google.com; s=arc-20240605;
        b=HRROHmla0ppWFCiOdhobJydNWKhtrSDdUz6lUxI+iHnZM5hQJw2e1zpPoaV3V8MK8a
         Gihtud5qg6CcZNgowcLPFCowsTCg2Dcc/V1uuHe2yA5wI/SbIE5oizO7YkLr3a3wVU26
         t3w/U93XvrCGTtHmWtjA2Tx7UVVxDoEvq9OlkHb0Vkc3rMdVd3z1nnVKKuCnKHsTXxiD
         gCb2JOV/yx7n57VxaeGnw9WY+CxNaDkQrO8CQtwCZ3rs1hFxRwVydyT6KwvVmEdQ2VtU
         rIlndpoeaV1nwzPdhV0SvaxWw9WeP5mZKahPq9rrQ4+olsNBT9yBtfI6zgd9IObLLx0A
         RVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+GA4/9xtXkKrksVBbHSHcgOuftKgItmsz7MH3HGa4+8=;
        fh=5weB7nV5mGanSHLhVIFbNiDn4miSQ+eqPGXYZLUIJgc=;
        b=PPH5Y3pvfBLaAOBZnjbbSUPJ70UBboqAyTpNCO53jq1ySb1XRg1E4NVqZswUor5Wjx
         SX9RCxB6gDrGKoasV2a7mIg5u1KUsbr0WDzKWckoigBoq9Bpy9XBXuOhnPEjhNkYBCOw
         h2rrIV4082gRHoyJKgo1zkKXY6QQYK7LQixbd1rgxPMeOQO+4mU+hVdOH5g5rIfWH0H1
         Q7rm+8q2KTgis2i+LDPdXcmo4sFm8iyAlfUTX8eb4HNsvlPMDKpNDdo4rlszK3hB/eiP
         j4U5U0pjhyEUdiMorJ/zjRpf/M+5klJC4rE3rdfHZufN4fNGOHoXWKQ0EXzlzPE/f9tv
         VB4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774463906; x=1775068706; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+GA4/9xtXkKrksVBbHSHcgOuftKgItmsz7MH3HGa4+8=;
        b=Zykpzcx5wvBJHymDoomGAEKhe3rGmm0yZLgNwqDmKp/J0kT+BtClsriCNuo8BWkEP9
         55FO8tFQwEyPB4Vmp6gaBuN3rBZKQDZDnlMVJYt1kXNLsWuPFseK0JlUDLvuEi9S/f1U
         mGXDTd/2gb6JLytMjCJqZUo0RzfO7ah5GAG6tBmmCbD+9jS5sL1NyNdcbWhC2p3QU4cF
         +/55eA4gVnPsLgmawyC0mEA4TDsWz4QA3bgriYK8CWiS2RQO9QAEcgGx96hZK7gjIROP
         bb9fqqZq5tBBsOM87H6Ge1KPXcR5wGEiJvehRlYnL4Eoo7YB0+RIdT31HCzCPFYX29Sp
         ZMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774463906; x=1775068706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GA4/9xtXkKrksVBbHSHcgOuftKgItmsz7MH3HGa4+8=;
        b=VZvPO2m6GwxvFjq79U4ecaqZjLsBHjjDE4nsGCcuxLvdOx0NU4Lp9yJSWKra6zlyY3
         chRJybckuwU6k398c/VzEt/JHdYxZ1b+Sc4dsfpk+eeDycysan6rdsywneGnYirNvuyy
         jUTgwrevr2vVUOvNZPpEW/n7+IxDdqQMnunFHoIxSo3m0wkEoWGsxCWbCXjdOGebYsod
         +8CodPspv027oPLwjwOS+IfYbF0Z4e47iLcN0Us9LMluzguypRcrTTU2V2KWT8Q1Bl4P
         P4kd9tq2ZJpyT7/afa8lk0HGN926b8AhJu+VxFEDrklZ6EI3XIYuikgSKb44Z2aA1t9R
         ZsVA==
X-Forwarded-Encrypted: i=1; AJvYcCXF5FW7cFiZkD3ny2o6KHk7YJH02qLOSWT4jKO8IflIINjI3/uQL9Gd7NQ+raDeTsQCBegUZlnDQm2592miGfKs@lists.infradead.org
X-Gm-Message-State: AOJu0YwCmaAnOcDMVoMQ45KJAyRawW4UsdIziOKLCYfKYlsnvo58aIHv
	NjWTsohgDFs/z53K+SZDpI6B6rynI6be7ULN73p7HEBP7JDaUDBvR0FKwlAM0JAfDLi8iqqGISX
	Lwy2A9anZdaF5zfvW6/56YCqJW5fTlFE=
X-Gm-Gg: ATEYQzzdjr1IlThTxV8VAHSrDLp5qRTXWTQGWtiEwoxD9CJ3kPi+hD/dV+cN2QBTh97
	y9RekbEmi/2x2OEOthkJPZ03lzv6gSqF2JZrkMhxQOJQcABA/K/lm5+mPhoUcWpi0sWuDMv/0SY
	NCS7LILC+cfQVx9FNchGstUb6vJG8zOoJu3VdoYY67Ay7MyTgMLgAgHQ9oiFeXRKt/QfhLpfLF3
	Z//OQ506ipAQ93EpKcp7TaLU8iMUOyyV/f7fU0jmDLveP2FwFIvBIxk9Ixtu/Y/8Vh0VAbSKLt5
	p0JcfC3I4iI04kIm0/Yr9DCSP6y6zR2WuyZhMAe+
X-Received: by 2002:a05:6214:f07:b0:89c:d7f5:b9c2 with SMTP id
 6a1803df08f44-89cd7f5bc2fmr605676d6.31.1774463906525; Wed, 25 Mar 2026
 11:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
 <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p6>
 <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com> <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
In-Reply-To: <20260325063333epcms2p60954532c1b65a1665bad6dcdcfd7d62c@epcms2p6>
From: Justin Tee <justintee8345@gmail.com>
Date: Wed, 25 Mar 2026 11:37:44 -0700
X-Gm-Features: AQROBzAKxPhpmC6ZawP0BlTH0WgQy62IbCN9C0mYIPU9DegmKkKMWApqZpayBrI
Message-ID: <CABPRKS8-x6Tfr90inpz1fR0=8a5HD=mkujtfLJ1h9ikEUjTvxg@mail.gmail.com>
Subject: Re: [PATCH v3] nvme: Add nvme_setup_cmd to host_path_error
To: hmi.jeon@samsung.com
Cc: "kbusch@kernel.org" <kbusch@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
	"sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>, "neal@gompa.dev" <neal@gompa.dev>, 
	"hch@lst.de" <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, 
	"justin.tee@broadcom.com" <justin.tee@broadcom.com>, 
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>, 
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>, James Smart <james.smart@broadcom.com>, 
	"kch@nvidia.com" <kch@nvidia.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_113828_017832_C244A95E 
X-CRM114-Status: GOOD (  12.02  )
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

Hi Minsik,

> - After
> nvme_setup_cmd: \
> nvme0: qid=0, cmdid=32777, nsid=0, flags=0x0, meta=0x0, \
> cmd=(nvme_admin_identify cns=1, ctrlid=0)
> nvme_complete_rq: \
> nvme0: qid=0, cmdid=32777, res=0x0, retries=0, flags=0x2, status=0x370

> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 766e9cc4ffca..378d28b2c971 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -512,6 +512,7 @@ EXPORT_SYMBOL_GPL(nvme_complete_batch_req);
> blk_status_t nvme_host_path_error(struct request *req)
> {
>         nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
> +       nvme_setup_cmd(req->q->queuedata, req);
>         blk_mq_set_request_complete(req);
>         nvme_complete_rq(req);
>         return BLK_STS_OK;

Since trace_nvme_complete_rq is printing only cmdid to help identify
the command, why not define a new TRACE_EVENT(nvme_host_path_error,
...) in trace.h instead?

So, perhaps something like this?

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 5037444687bd..a2e253dbb744 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -511,7 +511,11 @@ EXPORT_SYMBOL_GPL(nvme_complete_batch_req);
  */
 blk_status_t nvme_host_path_error(struct request *req)
 {
+       struct nvme_command *cmd = nvme_req(req)->cmd;
+
        nvme_req(req)->status = NVME_SC_HOST_PATH_ERROR;
+       cmd->common.command_id = nvme_cid(req);
+       trace_nvme_host_path_error(req, cmd);
        blk_mq_set_request_complete(req);
        nvme_complete_rq(req);
        return BLK_STS_OK;

Regards,
Justin

