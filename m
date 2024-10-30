Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4A6D5CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcLE83f8I5rl8ZtZIrZgOnTLuwTtp/g9tS9d1ZU8SuI=; b=JZ3iDO9QQdIyMq3KQdXZONtAFn
	47ciuB0WhekUksF+udKHFbt6jiUvLH92BdR4XUmqu+gQ90N8RETQvoqhGuiB1nMgx9wcbBjFd1J5K
	gamNYrecPNe9Wm9wgm/WOxfQeJYnq8SSjevAbnHI6valn+LS4IKI0gH5myZvWnKYN6L8hd3YviqsK
	JIZl0sxksQ23GWbtU7BynOhFajF0MbpQNyi7ktciZMmSWZwImBiRztKhj4hg1RPk2degcv5Ief2vO
	TbZ9JK2AERy3PgpILxStBZZ4g135p7+hlYndwh396kYr/09Pyu/z5HATjdbMlQvjXEVD7lCBjwMEl
	ZnMB6gYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68xA-00000000VqI-3pvp;
	Wed, 30 Oct 2024 13:41:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68lC-00000000TWk-0PN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:29:19 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so64630325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294956; x=1730899756; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rcLE83f8I5rl8ZtZIrZgOnTLuwTtp/g9tS9d1ZU8SuI=;
        b=mzL7A/CtFCh69oNvE7GK9QAs5xTM2l1joicHs12j3sDsYn6V77lo2iThDzyumseFEt
         GI+N+gUk8EJSe7PExNn1X70bR3TjxUCDFNO7rWKY5RR8isMRKkiCBwdGG0k9K2Bg4MU4
         iyDuMzr615TsitNjNc2H+T//DRB/03bz+WLNmTG4qHcbUikDSuAF0pm9/w9vdDl9Sjjj
         i8WyNgVAtmZl29L/sGtlDAnx5ceWW+MxG4qJoMSwaIGbcAtB0G7Qjp8OTRca5Jxt0v6D
         g0X12IqYgV8MMgJyaEOu4K3VAeCrTWIgtHkbY2Uq2a5jEHd1pdLwu1WT9tuH4b89QT4B
         O9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294956; x=1730899756;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcLE83f8I5rl8ZtZIrZgOnTLuwTtp/g9tS9d1ZU8SuI=;
        b=i0Xwu8Cvu8Epce+wKJikRfBm1yrQJD2zlOcU7Dg4hGtCDOVPd8k9+w0FFoRsg8RdaD
         zhzoW1G1ScI0iPjVTAfuvRN2az97Rhthi8YlBDDjUDGzjYtIrsElqve39pCidLGXHAO7
         xeBnmbDl2WGF8t9hUGtLMvlaY1bqGmsQ6RiL4iKos0yemrRXjiebrmL5wTYENJdXgMhX
         ubAPQCF2ABbIkaQScQukv1v435eql8TPdbhcB4V+85GGCjkn8XFpsce/UN4uGnWjPAe1
         GANMuVVnxFtDx+Wuheggjwo3Kb3FBML+XMUM/arXoIt3Jep7H730XOyzO3pDDwV+cIJ5
         JaGA==
X-Forwarded-Encrypted: i=1; AJvYcCXoOcue86HFtZ0VT83Q2CT8Qd+nSPs+7rV6oNfnDMG352gdByedbwg81opCFIll2fTU0KCyS+Fi40jJYHoKnq1f@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnblcd/beJCpWlXrg8ft2K/vSP84yBd02znP3gDvKdtEjJqLQl
	9ZfqnHLWfr4Pa55ZX5wi6LU4mMWFjU8L4UBeYwj49TnDdxJh5tTAClVthRXGYyc=
X-Google-Smtp-Source: AGHT+IHp5AbAqgjQIgwYYwcTFJhtpBHYbLWugEe1xzPeyU3dGtA9O/+opSkEXa/XOrO9WuCxMOGUqw==
X-Received: by 2002:adf:ea43:0:b0:37d:633a:b361 with SMTP id ffacd0b85a97d-38061206c0cmr11906179f8f.51.1730294956053;
        Wed, 30 Oct 2024 06:29:16 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9a9a53sm21657955e9.30.2024.10.30.06.29.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 06:29:14 -0700 (PDT)
Message-ID: <8e2a327a-5efc-4ba3-afa2-387099967468@linaro.org>
Date: Wed, 30 Oct 2024 13:29:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] scsi: ufs: exynos: Add
 EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, alim.akhtar@samsung.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, bvanassche@acm.org, krzk@kernel.org
Cc: andre.draszik@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ebiggers@kernel.org
References: <20241025131442.112862-1-peter.griffin@linaro.org>
 <20241025131442.112862-5-peter.griffin@linaro.org>
 <f5ac07e3-3fde-4ac8-8cfc-fb7918ffb2a7@linaro.org>
Content-Language: en-US
In-Reply-To: <f5ac07e3-3fde-4ac8-8cfc-fb7918ffb2a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_062918_180881_7861AD95 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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



On 10/30/24 8:56 AM, Tudor Ambarus wrote:
> tx_linereset_n, rx_hibern8_wait is set but not used anywhere. Can we
> remove it? Not related to this patch though.

Sent patches to remove these fields at:

https://lore.kernel.org/linux-scsi/20241030132649.3575865-1-tudor.ambarus@linaro.org/

