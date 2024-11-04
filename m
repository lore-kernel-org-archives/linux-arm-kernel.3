Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D32D132C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAYbSq5mlU7adPkgvorpMNMhcx0QaHzk2bxUeWeRhik=; b=msjMkm5eGRDzrRwvxA8gVjxfFo
	qQ4c4dgT2iWPygDN8XpoNG0tsTh/s6PyW+e51BPtyu/krQ8UkODKnEEegHiZHJgFVCZLWBvSprc8j
	Ug6m6VfMDNbCoFE/AUbcTs+3KLL2fnVMYMVjuJnZiwponP9ahtMM+kyJ3yEu9EGqxqT5YavcmNoKi
	7u8QaLfPuL3ymOA23uhfVBxyB9bcprditiISflJoSqKwRQlXnldyFxVUAJtitXHaW7ZxlDp4OUacX
	LcplDlkAgP0ay/o7/i56famaCRITNsTw6g3gmVSQRQpT/AfsGqbZAM4RTK5YtKzogZjYruJ/xXchk
	u5ca10uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x2h-0000000Dq2x-0i6F;
	Mon, 04 Nov 2024 13:22:51 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x0j-0000000DpKV-2oCz;
	Mon, 04 Nov 2024 13:20:50 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20ce5e3b116so32012075ad.1;
        Mon, 04 Nov 2024 05:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730726448; x=1731331248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAYbSq5mlU7adPkgvorpMNMhcx0QaHzk2bxUeWeRhik=;
        b=Aa2mwizsoTlzMAda8+G78Xsc9XdttTuIR0K1vWYk71BEefwcBlwbt+i/DJJkhDEgW1
         L//c0SxKeqnZ0SHPNZbej/YvOQEK4DkJu++1dUURsFh8P5mNMyeQh/qwKqrV079fmQkC
         2na7KiP4X8W8e1MJBxw+lUVVOQUw8iLuiXcPwqiAhl4gCyrAYC7t9PbA9eWH9SWUWO2+
         cKvMipw2EJh9MAoBzD69iJwH01/+nRHNMpHB8+4QCK1WLftyswVCbER7CvjXANSJnwhI
         eGDqRWbMoN6wyXfen1xcM3kp69B73ckCSfmHvDTnuybkBX+HbmCeVGt/uNllkt8ZqB2u
         SLbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkyzp7iiBt4kRAruqkE4d5ts4MWHwpyQDRK8sxa0gmTfQcRwggDJqEAMu83vRdKRuKhp1OaCCvEHfDZXhvOpYj@lists.infradead.org, AJvYcCXciTH+MHHuw51CxHRr1rxgXoj3hA9OQlcTIiXBB/iB0pdnO0k7gBGYa2/AycCGJ0f3PUOoomTt7PhGeYdX3RA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyioPeYI5Fxpbs18KDVc4I8fdWiGB/BaO+hgIGYgB9jeupUFSFV
	PB1fSaaPtFSjITn2N7bfjf2aQTXEE6E9j4F4Ss4YwpmXg19rY9a28O5cx9z1
X-Google-Smtp-Source: AGHT+IFPbiyTwQNpyLarXOasgjJJbddopeoCOOsJvaCh85ieSNwN3SrqIlcdYNIvZeGmYFnzFxul9w==
X-Received: by 2002:a17:902:ce8c:b0:20c:e262:2560 with SMTP id d9443c01a7336-2111b0078bdmr151908315ad.50.1730726448397;
        Mon, 04 Nov 2024 05:20:48 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93db18128sm7460203a91.36.2024.11.04.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:20:47 -0800 (PST)
Date: Mon, 4 Nov 2024 22:20:46 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, robh@kernel.org,
	bhelgaas@google.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	fshao@chromium.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v4 2/2] PCI: mediatek-gen3: Add support for restricting
 link width
Message-ID: <20241104132046.GA2504924@rocinante>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104114935.172908-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104114935.172908-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052049_729098_1DFC1F74 
X-CRM114-Status: GOOD (  11.48  )
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

Hello,

> +	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
> +	if (ret == 0) {
> +		if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
> +			dev_warn(dev, "Invalid num-lanes, using controller defaults\n");
> +		else
> +			pcie->num_lanes = num_lanes;
> +	}
> +
>  	return 0;
>  }

If you were to handle non-zero return value as an error here, perhaps the
property has not been set, then we could reduce the indentation here.

Something like this, perhaps?

  ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
  if (ret) {
          dev_err(dev, "Failed to read num-lanes: %d\n", ret);
          return ret;
  }
  
  if (!num_lanes || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
  	dev_warn(dev, "Invalid num-lanes, using controller defaults\n");
  else
  	pcie->num_lanes = num_lanes;

Does this make sense here?  Thoughts?

	Krzysztof

