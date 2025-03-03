Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42173C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 08:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/kOfm+NCxRWU3KiubFOyYUQosuGisbp/XscJHpDiwI=; b=lWcY4nz281RkB9vKsPIjvZ5mdW
	uyMGuG/SEygP3XZeqiaHBn/fAO9O58mqT4XFkWuHIzZD+24rcevCWOymCnlr44RwQD7AC9pmoaP5S
	J5EG0QroChNtCxgZziosv4glkLQe9bLcKIAkenViAPCCZ91VNiH27w49GYxyskhoxN1/WM2DXOksA
	pKLcuh3BAa50RGaPdH6cqYY9TJXWWd7UZ45IRoVX8F6WqdaIFMsIcNdRMb9Yef2RGc+kr0OoLJdgk
	gYkF1QSbR2FeriS/oagR4KDFN4N2Q2rIaOYyPQnx+X542Pa7H98dCu5GC9dmPhG60AYhND7c9oJSX
	uoWEUwOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0nN-0000000HTfC-34LJ;
	Mon, 03 Mar 2025 08:05:01 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0lp-0000000HTZG-1gUy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 08:03:26 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so492132a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 00:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740989003; x=1741593803; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/kOfm+NCxRWU3KiubFOyYUQosuGisbp/XscJHpDiwI=;
        b=uIxqmFmha9XZX9Iw4QFDRokkMAnxMLLe2C42zGm85fIvR0udxkG5mAdWa7IS/4oBtg
         4QMlMkOJIKUilbteLgcnre9dXPQfDe+/r4PTNq6nsrbKPn9hB5u1EWmobgaM8dg56ak6
         ULRn/Hs7jHKc6AyYYbjeka1m1I5zWgDoIcKH5L+NPmT/A1IU4re1Dj5iTmB+Q6lCkj6P
         5o0R/rBpH8TJBils3FMwW8PiXDn/c9yGGP7Q7YZB/L//fe16i/NKVNZvdK1yEdQENFca
         vrOHc0FYEt7c1geqWr46dSE3Prnqi1/0rOyrKyEKeg1u2euvwuDzxUPKApOhY4+zALxV
         HGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740989003; x=1741593803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/kOfm+NCxRWU3KiubFOyYUQosuGisbp/XscJHpDiwI=;
        b=v43MK2FPaPdgpgiCBi9zHAimLz6HjtUMLvmexJVnsAs0r+HichZlEPn28nnkx6qj+1
         Md3PaVV8y35C1UUiGFJZwoGnI9HIYnPiC8Ee/ocLKzaLc4PipbNj0Xyt73T+v8R+WZY7
         1RfnMFlStb4YTLZ1nzGvfFBL3mpv9GV2pmoT9Phmtoe7wGMJeGdjqsM8xrjp8kQPDngb
         7LSqGkpDtOIBBI36TXsEgwRjSAMO5jdVwLKI2LxoO5Rq+N7M0dBFPhuOUYONdsH6jZOc
         LRpM/m0BHsWTpEQV/Qnaq84+8kskcZAt4c50MWMWjpP1atm9Gnb0DPffcTwDWaqbSxu1
         JZwg==
X-Forwarded-Encrypted: i=1; AJvYcCUEixDY9C96XMr3/FdwYnIywCidWvJIutUjnH6YsLbH9Fu45woRRdjxbpe9itMLL3mEMYLCu4jzNEMx3+jDfMNk@lists.infradead.org
X-Gm-Message-State: AOJu0YypVeHPofj5LiYmbBi90MYoU951l+ogyEyJqPvFFFTl4dUmJ4e3
	bdMEPlCqsMSKHxY6+/WwwfCQXsXmayVAbajI9cT5g41elOC/lVQY0LjehYjvUXk=
X-Gm-Gg: ASbGncu3cpGBWZEzo+HkVMy4SSYaeusmbYYy5eBxEfqcW8W2YjUj+059gDRcMlOQJws
	uXzTfLMM4YvgrW3C+fzx4hSe2bx97H8bPm4Z5Lt1xKyMHAcXu/WNUXK0bUQmtKAEL6KHfIbzGR4
	rZdPzNW7kdy2SnQaXoyvbkSz+D9WjhyEAUGVWDeZmhRhW25NXTpdz0ruGI2Kkhk5lePOouQl646
	CrWb/s0ckk+CYJbpsLstemFV+MqnyRHhaMKa5OVp31MdPd8qUawtcDpzhvzHHZHHLnRLCppWbir
	kA+C41ltTaRqFmKyvCSytAJWzTxfmMBurv/4bPWZd9drbvgFxQ==
X-Google-Smtp-Source: AGHT+IHSJwyoyFbSkRa1UEg1HQ8PZPp0oWijLI/xxUyJmjC4df5Zae4YdAsynhyaSb+1Hid60bmPNw==
X-Received: by 2002:a17:907:7f26:b0:ab7:f853:1445 with SMTP id a640c23a62f3a-abf26883e80mr1335907866b.26.1740989002624;
        Mon, 03 Mar 2025 00:03:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf0c6ee730sm764757766b.104.2025.03.03.00.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:03:22 -0800 (PST)
Date: Mon, 3 Mar 2025 11:03:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <2c8e8e93-4ce7-4260-94bd-eabba0b7732d@stanley.mountain>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-imx-lmm-cpu-v3-3-7695f6f61cfc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_000325_447298_E890FFAE 
X-CRM114-Status: GOOD (  11.40  )
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

On Mon, Mar 03, 2025 at 10:53:24AM +0800, Peng Fan (OSS) wrote:
> +static int scmi_imx_lmm_attributes(const struct scmi_protocol_handle *ph,
> +				   u32 lmid, struct scmi_imx_lmm_info *info)
> +{
> +	struct scmi_msg_imx_lmm_attributes_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_LMM_ATTRIBUTES, sizeof(u32), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(lmid, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->lmid = le32_to_cpu(out->lmid);
> +		info->state = le32_to_cpu(out->state);
> +		info->errstatus = le32_to_cpu(out->errstatus);
> +		strscpy(info->name, out->name);
> +		dev_dbg(ph->dev, "i.MX LMM: Logical Machine(%d), name: %s\n",
> +			info->lmid, out->name);

Print info->name instead of out->name.

> +	} else {
> +		dev_err(ph->dev, "i.MX LMM: Failed to get info of Logical Machine(%u)\n", lmid);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

regards,
dan carpenter


