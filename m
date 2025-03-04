Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AE2C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66psdEYIrVGR86JKMR8+mqBEFxkGfgmcukM2sBzapxc=; b=mvRrWES4k6XKHZOM6TksCAtSoM
	3405HxnYy7HVZbVexiu9FgEXw6d4duMRo0k2r9yn/K0EYU0EaZyUbCn9XDCJSgReGD3M5oE3Nert/
	0tnW7EfE4Cc5jfe3/TKKGD2FsY+y1X1J+UNFXWDhyu1DHiXGPvWVTNH79ksHab2Q6Tdf+ibvB56op
	JdBfLAOjOWRM29qyRfaEfraYli3XEqnmuVVTcMrIzVOFM1zhQ52w7OpClQ4mYDeoQo9yASoq+Ppcw
	1ba8eDLbbncaASOEfDcsqpdnBrhf+04IgMeg/hKfY4whq7ZLMbuSlfsXLhZRNXbsD8PLWCJ+gHfzx
	hMjY8QWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVHA-00000005SW0-01R4;
	Tue, 04 Mar 2025 16:37:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUDb-00000005DeP-2aZk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:30:04 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2235908a30aso96891005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741102202; x=1741707002; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66psdEYIrVGR86JKMR8+mqBEFxkGfgmcukM2sBzapxc=;
        b=tqHlj5eyIbLMYS1NmqsoFWNhS+q/+qT1JDECGMYgWfSgkUbX8ZaQKbs6BgR6lO040h
         idrp9cVrhvUKU9m1Ml7uMEblei12IDYOz7lWnFTItrYwdjEQ70YyPS1tfUXoE+Q+VrqL
         wMBIDhDqfY9CtQp6R0OhZvy3VtEXOblvp21UDgfFTUU161pEEcIWEY9QYW1ANmd2pG2c
         9kwBz67SM6fBw1LjgXIyYLCCIFdzNQ4lrhjp7/G31YNPo3ffaqponei27tJ1K2JsZbEU
         FLvMiMubZ3Z3EqihQGSCg+TJaZAjnHiXFcLUiYA2JwikVKC7qT9h/DnYXf+jmias8298
         qsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102202; x=1741707002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66psdEYIrVGR86JKMR8+mqBEFxkGfgmcukM2sBzapxc=;
        b=SrAcOo/TCI89P1Zrl3o1XQzxqanfRhVFRf687EsB4l53G39llorVKANDs5zimcumiH
         3cZwuRzlfo0nXQ4AJ0tWlxOKS7UpnzuI9GiZYNeLC/eto7pUogYoTM6OW9sk3CF8dG4Y
         Zhnt58idwvKVOk98mpS7OA/c3L96F/Zrycmhjpx5t5O5cELE7NnhQQtESTzAKJEtahts
         KjKwGD1zXmEnBn9aXmbGu06W5asEW99CHlpXdmhGzLLCDAfezgbxIcjFdfPuPGqYpWUI
         FqeRvCM2kaCtIAGVXwrSDjFf8S0MJUXDGnHJmK0ai+YJJbfdL2+qP8Nk+hKhAPnvRef7
         Q4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfwVUrBeML+jcRT0Yjts4vdV+nncUSx+0iFtbf9BLiE5K4K9tIGgr1iueGuL0YRKMQY06FbDfKLpgFFDErzw9x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4JlPKDZtVVkeyIP6U8+T11kwASJr/jQ6NsGB23OA5YuR/NUeh
	AqGPYM9QKi1Dhz3Qu888k8YDZE0SCS9mah7YD5p/WLaSk+E6mIENQrXN4gJdqg==
X-Gm-Gg: ASbGncuAyaXK+sCgiyZijspuuIqiLR/uYF9pDhh84woyftoWs6pA/N1W1sNjYh73cAp
	LDGEfoDzSea5aNtEVC2nGr8ut0A98D2JX74DH80wB9F+WgGSaYF1PGTnnBNtmnqoTDCXcRsXLbT
	UaGgNWa1F6cWSoT8fwZOJnXu8oFGkTvscUrOx78EyrXYBoEczUBRHzZ7FUH+rAgNc/Y4QIgsO6j
	f6tr4XEJY31IRI7zObUWjvE6OmIFTQxg5cubkMPvdnyfZhZ5QLNup3PoiHsooK1PVqLdxAtTm/W
	NexbxaBZtZ/pNs8FDSJEN9K8Ow+AkR9hFmGLxkIfgSdCM2pNlmcIKe0=
X-Google-Smtp-Source: AGHT+IHDLoudvsE8ThGCBDtv8xpmDC4PMrV1KRLn9yaD488OmdYvS42vvygcsTzqkS+txl9sTFzPNQ==
X-Received: by 2002:a05:6a20:7348:b0:1ee:be88:f5cf with SMTP id adf61e73a8af0-1f2f4e00bfbmr34435609637.32.1741102202650;
        Tue, 04 Mar 2025 07:30:02 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de38003sm10265993a12.33.2025.03.04.07.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:30:01 -0800 (PST)
Date: Tue, 4 Mar 2025 20:59:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, fan.ni@samsung.com,
	nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 4/5] Add debugfs based error injection support in DWC
Message-ID: <20250304152952.pal66goo2dwegevh@thinkpad>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132039epcas5p31913eab0acec1eb5e7874897a084c725@epcas5p3.samsung.com>
 <20250221131548.59616-5-shradha.t@samsung.com>
 <20250303095200.GB1065658@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303095200.GB1065658@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_073003_656366_EF63B9EE 
X-CRM114-Status: UNSURE (   9.22  )
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

On Mon, Mar 03, 2025 at 06:52:00PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > +		29) Generates duplicate TLPs - duplicate_dllp
> > +		30) Generates Nullified TLPs - nullified_tlp
> 
> Would the above field called "duplicate_dllp" for duplicate TLPs be
> a potential typo?  Perhaps this should be called "duplicate_tlp"?
> 

Looks like a typo. As per Synopsys documentation, there is only 'duplicate TLP'
field.

Good catch!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

