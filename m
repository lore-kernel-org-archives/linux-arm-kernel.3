Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10E8C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 05:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejt8F/jG6bpSz1vmmfKxJnYrV0UQOG6l/egw1qFjuDs=; b=MBs8EpmkcnPi2auNb29ZI6YjHv
	qTdugsEguVt+6nkZ4BrCvBrREebZdsoH391ccqar06nYV/wiLWkfXI5eOVLMKTC45LUVmvUZUaXuz
	xCgbm6dUE+Tr/tvPc0azXDZqs8vNK/zhyY4qxwVqkxBfPx8MT3VIhsyRDMqPwBvgHQLZ0FM1ldcfC
	NrIhVNXJA3FLHoKxOhWeFARCZYeRIEHiiBk6m9nW3RenW8rTlxbZ5+9NBiZvObrIS0oQJsCHvvuGU
	MEKxfrYLT7TrT9rbhb8UQGIPd8aUI5yQG6yZb1qIYpcIwchDCPPEOWkZqUmNbKjncAAOY3mIEJyST
	oI1YB3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXZ79-0000000DKbn-3OP0;
	Fri, 04 Jul 2025 05:37:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXZ2t-0000000DKB3-1Ejk;
	Fri, 04 Jul 2025 05:33:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-236377f00easo8546605ad.1;
        Thu, 03 Jul 2025 22:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751607190; x=1752211990; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejt8F/jG6bpSz1vmmfKxJnYrV0UQOG6l/egw1qFjuDs=;
        b=bZ8qINDlBU3m0/2incWgl9Iy78zfkCVHqyjNh8ntGGYAAtPcBJLAh8UpBCBFWqQCch
         NvxLIpuX+4yIfYaWMsqkOgbWCfN9Y417PzH1KNPH0w7JyDH4hnUCYdBxcmQwTo3eZz5H
         xXgagDfRqJHtTMblG8IOa5FCWS6XaqxmWB/6eYpKsQGWdWXK+onGjiIdMFQolaoiaLdX
         AhttzT/avTLIRpxMpTqmPNwUTupmysb2/COzGPsQ1B970oDc0ze7A+cy7klEyko/ZW13
         Z8WK8DZyOKh7OsdEdpptyAr8ZeQapUDQuax8yZdLqD35KWheeVIX+seX1XDKWptashSd
         IIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751607190; x=1752211990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejt8F/jG6bpSz1vmmfKxJnYrV0UQOG6l/egw1qFjuDs=;
        b=eJdc+kofMUi+RJSSAh7eBcMqk1Vb/P7VmiFL0mj4IqVJirESJ+9nnpOLYDu9ZOTLA8
         ZrQfOm4F6LIWmMSvdgMGjFbbyjJjcYiBmZi/Lr0d2zdjhaqnt6dz1XszEtuLkgFp20p4
         FYaoZWpoD+hJDJkUoSseme+2nCTuK0DaE4qHwVn4GdRMmD4o8X0LIKBXb0qGNt8e7JXm
         89fbZLU4Lpgh2EG9ZuDiNuoLqZjoVMOxM+jxAj/m1sAuAOuO3jeoujN8TuMbwMq8QV66
         uTQ2fHwawWlCBW1rh5w3LglfjnYZPSkuEVfNsaMewJz9LAdorxl6RJdUg4dHKUWPo7Y7
         kGMA==
X-Forwarded-Encrypted: i=1; AJvYcCV8DBEzdqbKuoEnLuFhd0puU/y0BxPWgN5qLc23+dOAy8jDpTe7VHHOuMBBsSEI8HAPs2EgVrqjHdQpoawDfC8=@lists.infradead.org, AJvYcCXmq42UMonOdCUxe26XsBC/KeaaTGElrw3KqGT2r/I8RzrPzdTLFvIVzyhEXFSADC52FAPw+21N7PYQ4NRxxl9g@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/f/r4qmGMGPJlWRDMjmlywORk4z9h4yMJfhUSo8LJRTPL2xLK
	7/wrghxv4QszgK9Z4L3DdflyxMgGgtqPN7jCXwoOacQk64dXGF7Rn1GT
X-Gm-Gg: ASbGnct04PHpZz7taIqXKDm0Fer2wZtzi0iycE/ysFeABFTQICFCXdbPtvcm1QeV03t
	Zq17/bI2jBNFtXYSt+7ysdbvg8VQ/fIc87zgx8Qb5llZpOwUn0ieIGL4Vy0d7661PcXi3AEnj9X
	gtfqdcHU+YkYlIdTdv8JXfgKSkdyoF9SNNnz4jj4Rn583DQrQicK1pKZXtm2qdkEbj3cIOSj4oi
	RdjQ749wbs/T4q9jWq58wW6s3TCBE4Qke1FwXrhRD2AJxGifBDNLnTIUj31Lzu85ixRI+c8SDjt
	Y45G/95RO0oo/1/C6Qrs7EUfCPW5ouhWupyigTAPhXSBypET6/4l2pj08d8/xssgfzXbAbSYRQ=
	=
X-Google-Smtp-Source: AGHT+IHIo3bt8SUUJoWUFyFWNKZw20xUxwX84UI64gCV5521klw5BbnY34brDo8xiSeCwodsN3rq1w==
X-Received: by 2002:a17:903:19cc:b0:234:f580:9ed with SMTP id d9443c01a7336-23c85e18d97mr26485625ad.21.1751607190144;
        Thu, 03 Jul 2025 22:33:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8ddd:816c:9ca2:2a5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459e14bsm11636345ad.228.2025.07.03.22.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 22:33:09 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:33:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - add support for MT6359 PMIC
 keys
Message-ID: <vfdsmhfafwmdlbk2n6kibeaiufwkcdf3mbz77kw3w2fy353xgr@tjcmjp7mb6c6>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
 <20250703-add-mt6359-pmic-keys-support-v1-1-21a4d2774e34@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-1-21a4d2774e34@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_223311_335599_2C40F3BA 
X-CRM114-Status: UNSURE (   8.40  )
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

On Thu, Jul 03, 2025 at 05:41:03PM +0200, Louis-Alexis Eyraud wrote:
> Add PMIC key support on MT6359 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Applied, thank you.

-- 
Dmitry

