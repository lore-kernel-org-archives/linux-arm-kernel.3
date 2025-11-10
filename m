Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B403DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBBN9infbPjez6qdJxMptt1hzq/iyvX0xcfU9jpmlSE=; b=d4vfsu1PHJWt2I76FaiUzFs+bL
	DPkdk7fyu0LuVb9YkgxPRIVkHU/+P6L4UgcmZowbjxp2CY5Ii1pK8GxOJT9BAHOhg0t/EQcowHk5H
	vws7X6Q19yCdz1g+9h6mVRNuQ5JpfJ8ogm9BZcndXQvW2b1LRq+bgdcjEyiDYKK3ufpWHbxNEc8nO
	8ZQze5eGbQtzvU+Og46cvmQPLPSbb+/uL41hnEpSB3UpFyUSVSk9qWN5ceB9PQnPvPy22iiEID9tj
	MUqbhKhfMmJLjMEQi+/oiQRpzbVtuRS0fVJpn1TeLQhWIY+oVgGoOpw/5j2hCYEhpkTMv24rwIP/Z
	ISlnYcTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVvg-00000005vrm-0TSe;
	Mon, 10 Nov 2025 17:43:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIVvd-00000005vqp-0uUZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 17:43:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2964d616df7so42320475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796624; x=1763401424; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBBN9infbPjez6qdJxMptt1hzq/iyvX0xcfU9jpmlSE=;
        b=WNIyL8PSaLxmnEuBlfXuLyCmxZ7QM4lsHDL4QfcwumiKyyukiWx7siX447Vh+0IGdK
         Py3XAcmvI60B95wpv5Vbij+hZIMmy+SLjAzOpmqPl8+8GAZUg53XPrFCE++SWj6fYQ8i
         h9MRJ5E/7Ft/GueogoNluiuW3vSVQYTwZ5puWxqkOeYTeNo0iMXHWAepfDUquKgk0yKw
         Yaeve19kelsCgIZgZBZ0JNVwTbGINtBEX4NrRCMk1UzkHYNWJSMMMFb0fHiDhXiMoLZM
         K+IpFsy68xgV88xrojc2E0L28r+z7Ju9glLzWDwqSoKt97OCeJ5Y0qiSZ+eE5YbVhnI1
         B0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796624; x=1763401424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBBN9infbPjez6qdJxMptt1hzq/iyvX0xcfU9jpmlSE=;
        b=fGalo0V1uaxvwbRGhg0Z8WGOrWdtZ2/BaAGuBlCnaa08qytLWZUoT5wPOLb7uR8cbZ
         T1fBEY7Qp1kaxKpT8mtWOfrZDc3ved4cqfGo1vjyQKhrijC3BN7ZLQ0F9rvUPiFn9oi7
         h2u7um3/O0x/kFKs8VQhHrtqpb9mhhBzkaf8fR/L4H8t472sdhIyBjA5YWENNwE/5zgP
         7agnrCyzN9yjukrrh+9U0LDRVOKp11s8HzmT/IFt95p1tjIw8o9HCNalortCtJP5XyGB
         2Lj59nWKlRroHy4SA+Vke6Qc0jWZ6GviXOkxUIN6Etcp6/b4BLpcUQ6E5/taY5rKQJIq
         t/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCURBSRhFouOGZYw2guI9+tJsBbuqL5OfAehvJv+vf9NdWygJg9FsQK3uo0mqr+hyg7nYjFFWTzRR9QD2LPieJgr@lists.infradead.org
X-Gm-Message-State: AOJu0YzdMoxVdYAsDJiEmPltQ3eNObUNAaJ8omRBIgQRZdeX9HL5s1RC
	JIo6Xrurm1SDR+55cVi1n9UJegaJnkIiYFn/H7/idsq3S3s2UwKJk5usMxCf7uubPOs=
X-Gm-Gg: ASbGncvoYLfJR3BifcRRbpFL1EZIdo9fJEZt5mJcWxrlu/g0TZMBxkpD5Q52jF9KsK7
	ldEIHCxEtkgY08QoWvtLhO1ZQeOpfeSxXagDrOqSdfux4Cbf2ZeVAhtwqMfcxiX3Di0uGhB8yei
	SY+1FzJBCUQQisMrnKPnJtBG8bQ614+jfzRCgs0Sc1yZ59jFd7wl3pVH9l4y/Z1x+8zfNb7xQ0E
	goj8Z6OffqZFdSFbxz4wVe2PQzgzRap+E/Rf6NmG9o5c6R/hAvrgT1ZH0FDLEIciwqcjNTcHFnR
	/uqxn703NnGyWDeO5RJOZkV74AtjXMtw/W4yzzfDbSB1B8UhxL5cyVeIu5ltExIakvQXlOI5rG9
	tC5Y/dgEuY8GsI1t+0kx+xuRqlc54bbd2g+tRpZL7Mr3DkWlWRtHd7ayVU8QlT0qyD00Z3/sCXr
	oGBKpFDD0FSqQp
X-Google-Smtp-Source: AGHT+IH9KL6qJufmaDst932E6GsFJgG2DPRvV0ZpXeCS06v9BXdY1k3lpKtvHXKr+tDgIwa14Fuucw==
X-Received: by 2002:a17:902:e545:b0:26a:8171:dafa with SMTP id d9443c01a7336-297e564cef9mr133819655ad.21.1762796624024;
        Mon, 10 Nov 2025 09:43:44 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:e689:789c:c35:41e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c747d1sm151325125ad.63.2025.11.10.09.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:43:43 -0800 (PST)
Date: Mon, 10 Nov 2025 10:43:41 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
Message-ID: <aRIkTV8C9gjSyH-o@p14s>
References: <aP8agyKj73bLZrTQ@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP8agyKj73bLZrTQ@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_094345_259255_A0A704F6 
X-CRM114-Status: GOOD (  26.56  )
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

On Mon, Oct 27, 2025 at 10:08:51AM +0300, Dan Carpenter wrote:
> The snprintf() calls here work but they have several minor style issues:
> 
> 1) It uses ARRAY_SIZE() which is the number of elements in an array.
>    Since were talking about char that works, but it's more common to
>    use sizeof() which is the number of bytes.
> 2) The printf format is "%1d".  The "1" ensures we always print at
>    least 1 character but since numbers all have at least 1 digit this
>    can be removed.
> 3) The kernel implementation of snprintf() cannot return negative error
>    codes.  Also these particular calls to snprintf() can't return zero
>    and the code to handle that zero return is sort of questionable.
> 4) In the current kernel the only "core_id" we print is "0" but if it
>    was more than 9 then the output would be truncated so GCC complains.
>    Add an "a >= sizeof(scp_fw_file)" check for output which is too long.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: The v1 introduced a W=1 warning because of the truncation issue.
>     It's a false positive because GCC assumes that "core_id" can be
>     every possible value of int but actually it can only be zero.  And
>     also generally, in the kernel, truncating is fine and it is fine
>     here too.
> 
>     But let's use that as an opportunity to do more cleanups.
> 
>  drivers/remoteproc/mtk_scp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 10e3f9eb8cd2..db8fd045468d 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
>  		return ERR_PTR(-EINVAL);
>  
>  	if (core_id >= 0)
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
>  	else
> -		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> -	if (ret <= 0)
> -		return ERR_PTR(ret);
> +		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
> +	if (ret >= sizeof(scp_fw_file))
> +		return ERR_PTR(-ENAMETOOLONG);
>

Applied.

Thanks,
Mathieu
  
>  	/* Not using strchr here, as strlen of a const gets optimized by compiler */
>  	soc = &compatible[strlen("mediatek,")];
> -- 
> 2.51.0
> 

