Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSUEvMdfd3OtQjcJtnT8MNHYb+tPfeWYuWYxCvun5Ec=; b=TP2V8ijHzgHpuHI2+sq6viN7gx
	ahagLSAavvWbBp0ENme2Sr8yDwiVDgTeW1ha/W4TqqMquxO3lmoLA8Sh81906CaLtNMSz1+UFOlrr
	hHjor/+2vf81U1w6bxTs49CIbKr0go+S8VJ+zWUQlCfx4OFW35G/T8CBnpFVv4KcbIS+f9TrpqIQI
	FcGpxVXy5hFG1FSQENgkK9ZLkstz5axiMS4sqGyQBaQo5jD0db569/2S3SU+G4HFz9KQchxJLUbC1
	oejD0UPUnJ19FoPtF/SNfc4usvTOS8DvCFFfUR+2IYNrGVFRo9nYdHnT5aE+nDS87Tt+fNbpHuzlU
	JKx0VTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGoe-0000000FJoz-2A7r;
	Fri, 11 Jul 2025 16:41:40 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaG5w-0000000FCqu-3hPB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 15:55:29 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso2707727a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752249328; x=1752854128; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSUEvMdfd3OtQjcJtnT8MNHYb+tPfeWYuWYxCvun5Ec=;
        b=eVf8UhYlgK2Dbdf/x2t7pizGmn/DlxJ1uPkgt3x+qVWkkgfpV3Mn9DcrJdBz33qHwx
         LJ9OIunYx7BPqG8p5l2syQ7fuqsX7vygh07zA5jcFt4hY7PbXR6ovPLoDDQtMmBf1MV/
         mhpDBHNMMF73kWoILuAWMgs+i9LY0GSfPmLArmDzPXNpF0W0s9nBMxJ4BLwkG/HHNTza
         8qJzuVWyzmcP1yp7Og7MqhBzT6zDImidgExyc976et00P1s2mxMSQYF24ZFdjSMPQErV
         BQmEoqeqiqBWFqgmGkcuqAFVpACBMdLtIZKtNlhuQn33y+hpCzS9iK5uApLyZhwR/oEc
         201g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752249328; x=1752854128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSUEvMdfd3OtQjcJtnT8MNHYb+tPfeWYuWYxCvun5Ec=;
        b=LgLnO5sboIXN1nsm15IzZQ54wPy7oF7q65OL/TqhtiKFDqGDvfIf3QNvtpprnRY6P6
         IRyiPMtUhOW7hXwCKW5PA+a6MpLfINf+9pE8vbpfpSOVILww1bzibpvuh9ge6WfJ4thp
         q+PisiFYt0mWUTSsAiE9nUq5+wEUDov+1hbYUF/Qg0WASdQUgSjO2cAuczCmRmpLuq8o
         Rgll3OBgo8A2R8mdXJ2un+1Ot4JDWlGWC4yqVSp1nlHcNGjb0GooKD4DYIp+XLhTheZO
         XutQdX/0QjRLtpoIhC3t8WgMc0FZ0CSJA/pxL+Jwox0ciOuy+jMRAhwdn/A0dGQJy2Xh
         De/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbVFe3N6+BfVi1HQ1BAXg3dCKyJLDRy0TWJgh03Q0QJ0TQGcyh8eQuWUASOwtVa/rtfGXCy1I00paYrqnBLN3m@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+M93KLPuwtcduBQxXB+4q3EQeTy7qv1yIp/X7B6laryCEtnD
	K65L1LfKi/zYmM4zAjkRpn1UMmZRg4rFJKceVQgUZ6xN4R7sowuqfsqUM3XPPWVoWOeoWhXUd4E
	15kj2ckfk79tL7+Cmj6UbxK2cok7Egm6sHj2iGOSPOA==
X-Gm-Gg: ASbGnctc9rlbo1rx9rK4JJ03buHp06gAD/WB/bCd3eRfFdgWcxoURO5cjQ+5rmGjUlc
	utRYEV7RfMLfozS2f51M8QZbn1bFS+fq6dgk5trDAet+dEjZHZgcv/uwMUG2XrB+ld932hM5zu4
	GUSzZdFlnoHlKG4t6Na/eAPip5BFX7ASfXIb+t56D0HI7lLJ0Lnk9zGHfhIkHgr1YNsLOSartPF
	6nQvs/9Bv2//kV6qYjreQ96W3q34iVBDxWexHZR
X-Google-Smtp-Source: AGHT+IH2f1kHKtkhmbSDnFwU9FsRvu0+CvMkmIgA/3wZF988KeEXY1isz3v5NjcaxVFtljjYa3Rl3Y2Bu4pS6enpzQo=
X-Received: by 2002:a05:6a20:244a:b0:230:f847:6586 with SMTP id
 adf61e73a8af0-2311f4315fcmr6577705637.29.1752249327964; Fri, 11 Jul 2025
 08:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250708151502.561-1-alireza.sanaee@huawei.com> <20250708151502.561-4-alireza.sanaee@huawei.com>
In-Reply-To: <20250708151502.561-4-alireza.sanaee@huawei.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Jul 2025 16:55:15 +0100
X-Gm-Features: Ac12FXy6OFHr0HcNSbuwxmKfYiD99i1dpKvfe3JL9VMIP9NGMICwwAp3JOTw9ag
Message-ID: <CAJ9a7VhfW2RYXv6ZO28m65C75iyJUqTYos1tFXs8gAG5gx9yDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] coresight: cti: Use of_cpu_phandle_to_id for
 grabbing CPU id
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: krzk@kernel.org, robh@kernel.org, coresight@lists.linaro.org, 
	devicetree@vger.kernel.org, dianders@chromium.org, james.clark@linaro.org, 
	jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linuxarm@huawei.com, mark.rutland@arm.com, ruanjinjie@huawei.com, 
	saravanak@google.com, shameerali.kolothum.thodi@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_085528_918432_5A305DE4 
X-CRM114-Status: GOOD (  17.28  )
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

On Tue, 8 Jul 2025 at 16:16, Alireza Sanaee <alireza.sanaee@huawei.com> wrote:
>
> Use the newly created API to grab CPU id.
>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  .../hwtracing/coresight/coresight-cti-platform.c   | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index d0ae10bf6128..e1dc559d54aa 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -41,20 +41,8 @@
>   */
>  static int of_cti_get_cpu_at_node(const struct device_node *node)
>  {
> -       int cpu;
> -       struct device_node *dn;
> +       int cpu = of_cpu_phandle_to_id(node, NULL, 0);
>
> -       if (node == NULL)
> -               return -1;
> -
> -       dn = of_parse_phandle(node, "cpu", 0);
> -       /* CTI affinity defaults to no cpu */
> -       if (!dn)
> -               return -1;
> -       cpu = of_cpu_node_to_id(dn);
> -       of_node_put(dn);
> -
> -       /* No Affinity  if no cpu nodes are found */

Leave the above comment in place.

>         return (cpu < 0) ? -1 : cpu;
>  }
>
> --
> 2.43.0
>

With that

Reviewed-by: Mike Leach <mike.leach@linro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

