Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C0CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWVd3a6QjlDIBu/GZcAsaGjfMi/nlIyITb4lz5jcIMk=; b=FHqETiKKwy+TLqgPCuAR1icJHW
	dfT1eod2QOFLlPvrB2fgmSmDhN4QlQjJ66FROO7+K1rIxkhCWz7pmnA8x0mMj6G+ReQgUqkwIyVlB
	6tS9AhU6Av2/kD9peKewhUNewIALlvv6pOXJGJpImeecV07cmO9EKtW69aiVOZ7kJ5U+MVr8Pp6pr
	n9E0zbc8/jtY9DJUAMadKeXWjVJDwWZAKYJvOw+51Jzs94QtETKW8O76cEWA/SRCcSuk3A64o1O2H
	DIHigV1wDrNsoib0ZkPBzDY/euYjZcD3Yp9qKsM4fVAdlTIcxKy8C75nb4vj1L8KITEb3g0yl4Ydb
	vh8mHGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umwbH-00000002s6M-0CMy;
	Fri, 15 Aug 2025 15:44:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuFu-00000002Xym-3bGr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 13:14:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45a15fd04d9so19396375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 06:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755263641; x=1755868441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aWVd3a6QjlDIBu/GZcAsaGjfMi/nlIyITb4lz5jcIMk=;
        b=iFQ7pBKx5EcqNOiJlLhmOrxjXN4JowquUm3gPZl9/RvEHD8q46JytaAhPxv00XupJZ
         nvTvl7HwQt/sp6TnJ6m9oOQ6nrUw9SFF1m3jeeatnd0fi04LGVxqY3N0MxbXvRVFJfWE
         QwoEnKaz9OMJUh6/bsTSX4z3dxVr2rsqdwZfNH26uTemrvNfz2Z8SzTHQvxMkOKRGpS9
         DyET4/yjssLwEnVVGzobgKCTnxkNgmI1lMqxNGYDnSMT0Dvy/Zbm1l4YEz9us1kVP9wy
         w0tvPmixbVCXj5sc31osLoTd8byqk7YWNIt2M8vvqmHcJtYHcyjwgKhgEGuZRJItryUa
         S1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755263641; x=1755868441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWVd3a6QjlDIBu/GZcAsaGjfMi/nlIyITb4lz5jcIMk=;
        b=AWbXyKqyRELIWC5oxpCcwFMnw06i5xw+4a7Avd8RLzCTsPTkcLQelJwbu72zcOSjDG
         WrdFwLr8svN6T6+W3vxFbYP9f/tiFrRLmEodSf2DZ4/9srFeQEsstA+LVEmIFiXTnXlx
         FWdvqEbSes31uzOJKsfXtOggRFDk/hupvej2MgVXdMYOX/A/Vsz/Qz2DUmYrWo7i+ALF
         /WXyZcqNdlNjaQAol92hYK3x2chnhLI2m1Ihvzth20kGnVyCMCpLauuC4Nj8d9PVKsAT
         DH/h5n7Au4zoWwgGxd4zTPOQyAobxSYGlq8HGieMlFm5qgIVvHAFyP22k8oqm8DJXEpv
         gJKw==
X-Forwarded-Encrypted: i=1; AJvYcCV3MKtY9hSey69ZmSnwPs/xK06YZaIXmzRZAcUarNbzIxnWi8NnqOT4Ki036+PstUpp6a38UostvwMePRCSNZ4i@lists.infradead.org
X-Gm-Message-State: AOJu0YxfGMUjpg/wRd5OjZu8Zer8TjR/RniauguTC8947Nol77DEaiXN
	gqtavAU6tDxG88cFzvlo5ifp8E9iy/kGH3E63MuVwM5mZnZUXvUsw1NnVHx8A0vPXHw=
X-Gm-Gg: ASbGnctagRkq/wJV3L1KKS768bpPML/bdxpkZ690rrwr1poi38+MdwfO30WB+OY/g45
	dvrchTp42oBZbw0anjO2HWJpwCt2etmeQ1BaKXb6D69ESoY5XqJHKinBQt+BC5jF5hKtmJmpDfP
	hhhcySM73W13kaY5NFhgCkz3Lh2xamNG3UkWksr0xR1oxlw4ESnrGSQQooU5XQZxcnHkPGx9Bei
	Sus5Nax3SiBb9m16syzeTHU0BOxGGFOFIRuG+i+y+fHkZguqRK4VK9fSDSqV4OROUOyU/mFGsS5
	43skmkKpbAaNwvWiKvhAxEz8yoXsj30PwxoSKN8DRG9UQQl62ZhtNIKU77bSYFsc+lYb8aWE/Dm
	dcvpnz0CH5J0eFMSSr8FLhw3yNbM=
X-Google-Smtp-Source: AGHT+IEGkzA5H/8XCgBmKZzZLui8cTS/0lu1L381PDJX0bf2RM2IKP9iCXo6EURHpv4ew13E3k7NJA==
X-Received: by 2002:a05:600c:3502:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45a21859687mr19402065e9.14.1755263641313;
        Fri, 15 Aug 2025 06:14:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1b1d4212sm37507125e9.0.2025.08.15.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 06:14:00 -0700 (PDT)
Date: Fri, 15 Aug 2025 16:13:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 3/8] firmware: arm_scmi: Refactor powercap domain layout
Message-ID: <aJ8ylY6jjS70z8lL@stanley.mountain>
References: <20250813114609.1305571-1-cristian.marussi@arm.com>
 <20250813114609.1305571-4-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813114609.1305571-4-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_061402_898493_4AF365D2 
X-CRM114-Status: GOOD (  13.56  )
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

On Wed, Aug 13, 2025 at 12:46:04PM +0100, Cristian Marussi wrote:
> @@ -486,7 +514,7 @@ static int scmi_powercap_xfer_pai_get(const struct scmi_protocol_handle *ph,
>  }
>  
>  static int scmi_powercap_pai_get(const struct scmi_protocol_handle *ph,
> -				 u32 domain_id, u32 *pai)
> +				 u32 domain_id, u32 cpl_id, u32 *pai)
>  {
>  	struct scmi_powercap_info *dom;
>  	struct powercap_info *pi = ph->get_priv(ph);
> @@ -495,8 +523,11 @@ static int scmi_powercap_pai_get(const struct scmi_protocol_handle *ph,
>  		return -EINVAL;
>  
>  	dom = pi->powercaps + domain_id;
> -	if (dom->fc_info && dom->fc_info[POWERCAP_FC_PAI].get_addr) {
> -		*pai = ioread32(dom->fc_info[POWERCAP_FC_PAI].get_addr);
> +	if (cpl_id > dom->num_cpli)

This gets fixed later in the series but it should be >=.

regards,
dan carpenter

> +		return -EINVAL;
> +
> +	if (dom->cpli[cpl_id].fc_info && dom->cpli[cpl_id].fc_info[POWERCAP_FC_PAI].get_addr) {
> +		*pai = ioread32(dom->cpli[cpl_id].fc_info[POWERCAP_FC_PAI].get_addr);
>  		trace_scmi_fc_call(SCMI_PROTOCOL_POWERCAP, POWERCAP_PAI_GET,
>  				   domain_id, *pai, 0);
>  		return 0;


