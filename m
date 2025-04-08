Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6195CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+O8LIaQE6WLNSGODkrJEsZ72gySO7jid8n0Swavjxzs=; b=q5TjSDpqC8AoEzXPFy35cIWDb6
	V0VoroeqmzCpy/CjxywT3lGc82ttYoDU3NOuucJOOn8cjggM7DPOyIm0/JnkhqcnDLDb9olOSvQg9
	I28LNUo41nI46qeNgp1Zte3Y59ZckMOATk93eGfj0gDAgtSdTQqydyUXQIMMNtc3gF5VlWx032B+B
	KZrHpH3FzF+W7gkBxr9QvaIvudG9kUy3FbkKJBudZNxz8pCmwAcoyQsBwlNNHvTA3PhN5aoPWJdso
	4jcVL8ysbesbQPXvfSUeyj1r0kotWwXIOYyG/bJrPwZvUhkRjiAqq+gsSN7viadBBOoHhhiiOSS6F
	V1amDmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lj-000000045yK-0Hit;
	Tue, 08 Apr 2025 13:13:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26K2-00000003h6Z-2XpH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:36:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so37131555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744108609; x=1744713409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+O8LIaQE6WLNSGODkrJEsZ72gySO7jid8n0Swavjxzs=;
        b=BPzL9IwdEYI+s045Uak/KliHNyemAfq6HW5YrKkqt0eDbvw9Rv7stwnf6+jzXNRRKL
         be8lmN1zmV7qM9XojG4p+CksRNDlM5Awp9CodpXMZpF5ZQQFRnRUxiNVtse14h+Cqcod
         2UFkh3oSIAA7yWvEQmGg/Hq/bEjgacS1PbKgMexaDXFH7uxClf7tB74cMsmX8SyrrZvg
         nOBVsnEqy7Mb2FgXzxmgSIvGJzgOzyw+57vUKIHaBgiZSvVk0XOoD/DXwoBMji8TwV/v
         wlMenjVP2gLLeiQbhAklcLYC7Bukyx5sXur5Kodh5CxDGYlTYOZW31mgw1zwCOv5iq5y
         i/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108609; x=1744713409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O8LIaQE6WLNSGODkrJEsZ72gySO7jid8n0Swavjxzs=;
        b=uwtktYWmbcT3WpyUfa93hvuCZZDvP05L5mXzWuCC9lKbm/kZjFKfhDjlXgN9VytK3h
         FzwFbfkGzaUeKkBLOy9m6/81pIIEmRVRNYXNfOW5VBDzSC5KaQCY7gYhCcKIVhaJEeW/
         roRUYp4eLDxRZyC5J5v0wNUxyPu+noaaggfW8LmqV6FyQWJrfmkxCAvsy2oQ0FnUXu2v
         S+f8oNDuq46ijEDiW/ZB9d/HiPPIOu9TpYHwIROmh3SRHGu1yFvsCOSM/XtXDMDfVwcK
         RYZcQkr6KOvSgffhRjIPu3uWkg2YsBSFaB3eVUl4Up31t97AOmYMghNcqTXDF4T3bg5T
         AmCg==
X-Forwarded-Encrypted: i=1; AJvYcCXrwbtrCa8iVtp8qv9fSRsteiaCWCZ/Z1JTgpYNxjwZt21X+t0E2Lq2YOJ2bmtHWPpkfSDwkNiw4d0FZpDyPUfz@lists.infradead.org
X-Gm-Message-State: AOJu0YxWvYGvjcJnqcnfIfLvPj1ly+p8AqstA+F+knyAL9043No/Y6CV
	iZ3Quq0ji9lU4E+NVxk8bDhiMNfiJGqOqMCigrvfRUtVldsx+rJhsGqd48cngeo=
X-Gm-Gg: ASbGncvuNDTZ0lx0jv8g7PujnF1tITtRDFHbdCx1TAHGNBEdTGL3I7ncxWnjcSaH5MK
	AAGJT0+dJ6b8l4NLeiOqhNE8/N9j5qKjNaWRHNKXIqMWA8bU2XuS+iR6iqTqDrEgomkVFnFOdkv
	/rSUmwcD1n+dq/dmSmEJQlyqmnRel/CqCy0fYYxlD5PSS5vJndykjUGKd+upoKduhYhidHL5RMH
	VPg+HlByBOL1zrX5YwDSNpCCHDSzevFWESQGnv3pAysqEkeWJjKASwqIlVzDpI3fkazHDr8c0N2
	ru32Mn4z/fpaS+oLklD0mmiQB7gx6nCkNCIozPbwRqXNbKJueQ==
X-Google-Smtp-Source: AGHT+IGOw9Xy8oGk0GJfiu7VaitjR/t55edX0t5tshdnocYA+5fRdb4Pypir8G5VxuDaVk6MtoCiMg==
X-Received: by 2002:a05:600c:3494:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43ed0bc8d96mr155476115e9.9.1744108608941;
        Tue, 08 Apr 2025 03:36:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30095ea8sm14397521f8f.20.2025.04.08.03.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:36:48 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:17:54 +0300
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
Subject: Re: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <c71fb862-85a5-42d4-91f8-398d0d532872@stanley.mountain>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_033650_659341_4E61B4EC 
X-CRM114-Status: GOOD (  11.47  )
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

On Tue, Apr 08, 2025 at 04:44:27PM +0800, Peng Fan (OSS) wrote:
> +static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> +						struct scmi_imx_lmm_priv *priv)
> +{
> +	struct scmi_msg_imx_lmm_protocol_attributes *attr;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*attr), &t);
> +	if (ret)
> +		return ret;
> +
> +	attr = t->rx.buf;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		priv->nr_lmm = le32_get_bits(attr->attributes, SCMI_IMX_LMM_NR_LM_MASK);
> +		if (priv->nr_lmm > SCMI_IMX_LMM_NR_MAX) {
> +			dev_err(ph->dev, "i.MX LMM: %d:Exceed max supported Logical Machines\n",
> +				priv->nr_lmm);
> +			return -EINVAL;

This needs to call ph->xops->xfer_put(ph, t) before returning.

> +		}
> +		dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n", priv->nr_lmm);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

regards,
dan carpenter

