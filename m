Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8C0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5DKf/JSZuAS6z2Xq7nrToIfpwa9ePTbW/i2x4sP8aQ=; b=ieJuHzEzi5AUvih3gJZlDXdSzh
	nzvoNawVUCozQAl0O0FMwgCBfjfoAyeLl2Pm6Qm1gQmsyyVnDjN02nY3mh4y4zuVtH2ouDiwv+j5q
	Z2+kdiexRuId7kl3mjijbx7DiOqpmeUKdaMFqJTpdzSlWHwA5VZxAbJF2DtNI1yawvM0zaBAUDgc4
	hLh35wf13eB6wLyDvUWtq11zPWdPcCQtnprr+Y76VJw1Z6NpICU6uyM3mzp1kjhiAP9hwBWR7xLZr
	QztfbYV6yQxcr5BMmVFD8m80XI+mGxSs9EoKeDfqLu79Hg9eTd/tlGWrASs+Ur9bg2fDb7EgR8AW7
	iwOoGF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgth-0000000C68F-2H6X;
	Fri, 18 Jul 2025 08:56:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgbR-0000000C42P-3k2b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 08:38:03 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7481600130eso2433967b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752827880; x=1753432680; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T5DKf/JSZuAS6z2Xq7nrToIfpwa9ePTbW/i2x4sP8aQ=;
        b=zMc2Eazlh5GhmY0aymUgOf0C2V8dSWI8RQK1C3Juybv6qx3KF3waaqRfgNGTpGw/Qd
         8b93fRHnBJ6TZrqd2sMfRi+RgNRRARdbnMY8uuPG7QS9PorqYj6RfGNg340XHQeZkhPL
         g3GCz+57Ept05MVpwNArMtPiKk/yRPshwObSf5G4FQZnOGIgkS1onNFaXPQHif/EFwsl
         Z1FhuWHbYszm2u8hFg4+HDaeBdFSPeKWE9CCMQ8o++oMBDrCa/TmssvzHouYnFzXi3Lo
         rqK/ylS19ahBmHIRHkY6gfyAreMfErQwmGoqPuAonzuD3imtD1HiMtowA0R4pxiJyEDd
         BBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752827880; x=1753432680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5DKf/JSZuAS6z2Xq7nrToIfpwa9ePTbW/i2x4sP8aQ=;
        b=C2147EDXpCOF9HbgQNFb4PISL5VP4YRoPPtlZp/8VY3TDha7RFWskmKfM0v7zeyDxd
         O5u7RMEz2ZCYT0i9NTuUOoNEqCVgI21ezbmWTdTBxz9bFv0RgTCDZw5X++8aSargvcZZ
         YyqlvLVFeYL4AFdareP6XZHxzUl8I4ZoX+hCUVMH+M3USPIIjX9VqHhsLrGVG9+x9qGr
         wy/fMgYmp6TaaMKTSOnsQx6SX1ySsZtksQ1e1KmGM3kg0qIDMCFmaeH9mozZfmW4NaGc
         dobIHRJVXtCKbvhtaCG+bbLhL6ETNJaC5/smbYjfJvvExw2ttfa+AA/ZYrtgwD8Q8Hhf
         c+mg==
X-Forwarded-Encrypted: i=1; AJvYcCWNIvA+TFRtBAQwVPyWR4vot0IAdVbP6k+CaHQXNFioE7+2CNmaV1WKJk2On4p6xmDZU61J7NRonpS/nUs5vpT3@lists.infradead.org
X-Gm-Message-State: AOJu0YzXLeYi6Oi/WYpZDy/e0fkzCwMa5Sda75oFWqP/ABql3UmDfItR
	RSNwjd5WNQSt8qWISJQWt0Vz66qdIx5aTqn/HDV0KboPCVR0j8WV7Ga+1uX47VLO01l4OlJ4TpT
	ZEfvc7aMdx43rb5f8pVwvWPeOgXpT/eMuJTaPEL3zQw==
X-Gm-Gg: ASbGncsZhaKZWqgAfki4Utgy4ljCXIqwBOJMRz2zUhNeiDT2pkwit+KM4vbiuFC9L0a
	rHZVB5F1uem2GwZM3d638RUKtz20QXwhDYnZxPeZQ7Yagyw+t4JmK1jhe+nnaPlJ4To6gb6GBzc
	wofmNR4B5mVvFpixetFZyvfz1m5ZfuFw4y0lSIgatB0/N3CPRKrcFBpcggvTDfmA1WTs8f91PTg
	qHrZ5Jb
X-Google-Smtp-Source: AGHT+IFqh+j+6EUjya6/Rjc1r8NT0FseuVGCh1Ka+tsqzW1wYMCTrimcXhsVexvinaMtnBJgBfcFHLy00MJtnLuDPNY=
X-Received: by 2002:a05:6a00:1883:b0:736:5664:53f3 with SMTP id
 d2e1a72fcca58-7572427b03amr12830626b3a.15.1752827880483; Fri, 18 Jul 2025
 01:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com> <20250714063109.591-3-jie.gan@oss.qualcomm.com>
In-Reply-To: <20250714063109.591-3-jie.gan@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 18 Jul 2025 09:37:46 +0100
X-Gm-Features: Ac12FXzbwn7h5sLCdV0XEMivqozSxEu3_Wm23VZ6koC6hPisQ9WkjxcqJkjzS7w
Message-ID: <CAJ9a7VikU9UktC-fpLfR5EdpGupHHor2GaDGAujBnQJky=W17w@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 02/10] coresight: core: add a new API to
 retrieve the helper device
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
X-CRM114-CacheID: sfid-20250718_013801_938673_5843DE17 
X-CRM114-Status: GOOD (  22.82  )
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

On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>
> Retrieving the helper device of the specific coresight device based on
> its helper_subtype because a single coresight device may has multiple types
> of the helper devices.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 30 ++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>  2 files changed, 32 insertions(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 5297a5ff7921..76e10c36a8a1 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -580,6 +580,36 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
>  }
>  EXPORT_SYMBOL_GPL(coresight_get_sink);
>
> +/**
> + * coresight_get_helper: find the helper device of the assigned csdev.
> + *
> + * @csdev: The csdev the helper device is conntected to.
> + * @type:  helper_subtype of the expected helper device.
> + *
> + * Retrieve the helper device for the specific csdev based on its
> + * helper_subtype.
> + *
> + * Return: the helper's csdev upon success or NULL for fail.
> + */
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +                                             int type)
> +{
> +       int i;
> +       struct coresight_device *helper;
> +
> +       for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
> +               helper = csdev->pdata->out_conns[i]->dest_dev;
> +               if (!helper || !coresight_is_helper(helper))
> +                       continue;
> +

Manipulating the connections list almost certainly requires some
locking. See other functions in this file

Mike


> +               if (helper->subtype.helper_subtype == type)
> +                       return helper;
> +       }
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(coresight_get_helper);
> +
>  /**
>   * coresight_get_port_helper: get the in-port number of the helper device
>   * that is connected to the csdev.
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 07a5f03de81d..5b912eb60401 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -158,6 +158,8 @@ void coresight_path_assign_trace_id(struct coresight_path *path,
>                                    enum cs_mode mode);
>  int coresight_get_port_helper(struct coresight_device *csdev,
>                               struct coresight_device *helper);
> +struct coresight_device *coresight_get_helper(struct coresight_device *csdev,
> +                                             int type);
>
>  #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>  int etm_readl_cp14(u32 off, unsigned int *val);
> --
> 2.34.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

