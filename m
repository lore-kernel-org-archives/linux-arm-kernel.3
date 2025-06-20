Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D44EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/Y8DjVDPlXRXyjpGs6r48QlsTt9FjgMTVP1ecP+30w=; b=c02MimAVQ3XiaNxHgJ+/0H36FA
	7bCD6JyBQ1ynsQowlX1k5ibTyhM5qodWTssEOPDb+zLMbnGu192vhdLK9zgmqTwp1Aud+WWsC9RZm
	5Eks5Ox1Bp7Tl5pRanndoGEE8TRICmy2yIbtvgxJgqv0Pbw2SyU7nIz8nQRFgv3g35EcABDx92eAu
	tcQTFsCFVB8WMIkkNJ8uhaSBkOJt7pC7Jxmdjy2hKNyjvFbSw+Xp2hoILjODMaYwYKomnt3K67IDr
	xbEocHFE2gxf5cNfWNf+J32+esYt+2JmQooNePihlmy1e0r+eKj1DVO8kB44FG/S9TSXWUmF4VvXC
	+TfDKgZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSij8-0000000GZtU-1wUc;
	Fri, 20 Jun 2025 20:52:46 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSicu-0000000GZHK-2J9i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 20:46:21 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2eb6c422828so1279979fac.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 13:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750452379; x=1751057179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i/Y8DjVDPlXRXyjpGs6r48QlsTt9FjgMTVP1ecP+30w=;
        b=xDX6oPzOGzJCTFFUzEvZ1PAtSa2pa2M766qv8NURQsrUl4c43j4l82IgUVRKWT4CV4
         YoGFdKBFfZVO4dUe05JyAV5YILn+HhQy1iun4OaUGAvBaWiRQY3I7XYOppen08rDMW81
         VQjJdaMwu4woJfwXvDiv/2JS3HHsVxQdWXg1f257ebXwVDj6VOH2Ah1uilpgO5vU5MeN
         FEO92n4yHanFayQ688yaHjxTiZUoSrCvthMBmoxtIvH33hwyQpCjACCFKTzunoZRnxq8
         cM1KlSlys90K+1w8UktpSFTKQWH5VcBhS0yS6/QsIUvsyzBMpG576MRbhhSFjr5sVK1l
         wocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750452379; x=1751057179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Y8DjVDPlXRXyjpGs6r48QlsTt9FjgMTVP1ecP+30w=;
        b=WV5stEQKPwK1AVFQYGFtKy6aVVcgBp4MYb0dhDy64XOBwZiVS2bCXLGoPIuzzWDDI3
         /HEUCrVLFR0sWbsTlovzPH+IEB01ESQ8Vq0pCHgHvD+gR386cZkTOO/0AXlgTNs9GNSW
         mAc5gMl+chXfAuG8mrcJpimp0yYJb2cod2DhPmMTQqXloCHyaXosqHbohJbXTLnIxXQl
         AVgKy4dPMG+ecvdJ98OzvYtHx/d6qUJVZfZz1BgqraUrQPJX+aPc52NkqcEMlAwR9oFQ
         EErqb+ZWL6vKUj9dOwWT9XxTofKgF6a3rQz3wCgst/pzQSc4DklLFg2VUwkXrwgNvb7u
         sR+A==
X-Forwarded-Encrypted: i=1; AJvYcCUDPAXrwKeiO1xtwSI7uYGIFCZulyPZmqvU+amVBxujcPMDqKQ7vJ10mpaN8YAvBYURmmWhIXYGq0wKgd5W0kVc@lists.infradead.org
X-Gm-Message-State: AOJu0YwU6Nl/RA4XyZbhrPVy1PLti9IOmfLAokQ3B53cDEAM5Zb01vNW
	t8X13R+HdVhLLEAC48YvgGDUldUvB2Jk2hDVStIXjruy3bxc1e7kM2L4ExyTJFE5gpg=
X-Gm-Gg: ASbGncsz3uP84/P01QTMom66P4SfVR6rDNUYnqmvhLZci4+MDQZLy28W9OUNptCrK3N
	+pBx8/fNt2qlIDGbb005U44z1eiDc8U5tZpciwIJWsSy9PLsXCdF6o+gQu5ppkAN6F02ocF8a8j
	YqSKKoFtYg4D2DAY8V7i2F3rQ+VtPxvkM4FVnTo/a77rUUffojcoQfRSmzsEUPC9G1kvYwHfYUI
	LEAuG1Ug3BnpmXwRkFXPBgVkRKqoXOsmH8Kqk7aFxUmQ6OhuLVLpKqJgIpiqwStF9U8nqwltD3u
	J+iacXR2fU2qFqwgrSSiAiEmHxRK8MB8JlSdJZAQsxq8itmNI0lnO6qXXFXkT1fDCHt4Yw==
X-Google-Smtp-Source: AGHT+IEltVQQpWX6/49BBfYc6w8RKy2yGvjE97btwLbyyP6cYD1DXa6Ie9CAh5+D8nSPHysnFDl13A==
X-Received: by 2002:a05:6871:69c9:b0:2eb:ace9:197a with SMTP id 586e51a60fabf-2ef2a74cd89mr1902210fac.5.1750452379128;
        Fri, 20 Jun 2025 13:46:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b6da655sm344851eaf.17.2025.06.20.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:46:17 -0700 (PDT)
Date: Fri, 20 Jun 2025 23:46:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 3/7] firmware: arm_scmi: Add Telemetry protocol
 support
Message-ID: <0c71e182-9aac-426d-b58b-41f118b9a8f2@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-4-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-4-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_134620_604021_C46A9A4A 
X-CRM114-Status: GOOD (  16.31  )
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

On Fri, Jun 20, 2025 at 08:28:09PM +0100, Cristian Marussi wrote:
> +static int
> +scmi_telemetry_protocol_attributes_get(const struct scmi_protocol_handle *ph,
> +				       struct telemetry_info *ti)
> +{
> +	int ret;
> +	struct scmi_xfer *t;
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES,
> +				      0, sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		__le32 attr = resp->attributes;
> +
> +		ti->info.num_de = le32_to_cpu(resp->de_num);
> +		ti->info.num_groups = le32_to_cpu(resp->groups_num);
> +		for (int i = 0; i < SCMI_TLM_MAX_DWORD; i++)
> +			ti->info.de_impl_version[i] =
> +				le32_to_cpu(resp->de_implementation_rev_dword[i]);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuos_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> +		/* Allocate DEs descriptors */
> +		ti->info.des = devm_kcalloc(ph->dev, ti->info.num_de,
> +					    sizeof(*ti->info.des), GFP_KERNEL);
> +		if (!ti->info.des)
> +			ret = -ENOMEM;
> +
> +		/* Allocate DE GROUPS descriptors */
> +		ti->info.des_groups = devm_kcalloc(ph->dev, ti->info.num_groups,
> +						   sizeof(*ti->info.des_groups),
> +						   GFP_KERNEL);
> +		if (!ti->info.des_groups)
> +			ret = -ENOMEM;

It the allocation fails we need to jump to the ->xfer_put

> +
> +		for (int i = 0; i < ti->info.num_groups; i++)
> +			ti->info.des_groups[i].id = i;

otherwise it leads to a NULL dereference.

> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

[ snip ]

> +static int iter_shmti_process_response(const struct scmi_protocol_handle *ph,
> +				       const void *response,
> +				       struct scmi_iterator_state *st,
> +				       void *priv)
> +{
> +	const struct scmi_msg_resp_telemetry_shmti_list *r = response;
> +	struct telemetry_info *ti = priv;
> +	struct telemetry_shmti *shmti;
> +	const struct scmi_shmti_desc *desc;
> +	void __iomem *addr;
> +	u64 phys_addr;
> +	u32 len;
> +
> +	desc = &r->desc[st->loop_idx];
> +	shmti = &ti->shmti[st->desc_index + st->loop_idx];
> +
> +	shmti->id = le32_to_cpu(desc->id);
> +	phys_addr = le32_to_cpu(desc->addr_low);
> +	phys_addr |= (u64)le32_to_cpu(desc->addr_high) << 32;
> +
> +	len = le32_to_cpu(desc->length);
> +	addr = devm_ioremap(ph->dev, phys_addr, len);
> +	if (!addr)
> +		return -EADDRNOTAVAIL;
> +
> +	shmti->base = addr;
> +	shmti->len = len;

There is some code later which assumes ->len is at least
TDCF_EPLG_SZ and de->data_sz.  This is probably where we should
check if (len < TDCF_EPLG_SZ) return -EINVAL; and the de->data_sz
would be checked later.

> +
> +	return 0;
> +}

regards,
dan carpenter

