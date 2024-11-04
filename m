Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20820D132BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZzOT97FdjuvYJUzFPlXRhKn4ZHWlskpvnv56Nhd+Gg=; b=hsoWlMr5jAl/C/31EIrIvaN6ac
	A6QkmIAAu2YhEsQGPWOv+8j+LlhJylxq28kQ7j0MB09mf1jJqTjqfwGOcWnnQ1Qpw3gJDwbOiBHq7
	1jVUMLPOumpEexlKubzGqB/uLTLTG08ehycdPej66Wh37n/isegSJD8yvc+8nFxVtlLOZ310oWFZw
	qrMui3brCVr/vn1ZhGdchrpxPhKfmgAmk5qePI86gCU/U2uFqW/rbXMHctuYCh5b53MkXkMD8D01c
	ZvnVtVmTC2OHHF4sNTcjuXwjHIYAa7XMUFewyqTONLtdniHnHoMc+IzF3cBRxqAKXUJWHmYCyGgZO
	X/eSvJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7woi-0000000Dn7O-2RNo;
	Mon, 04 Nov 2024 13:08:24 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wn1-0000000Dms2-1Puu;
	Mon, 04 Nov 2024 13:06:40 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so3163864a91.1;
        Mon, 04 Nov 2024 05:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730725598; x=1731330398;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZzOT97FdjuvYJUzFPlXRhKn4ZHWlskpvnv56Nhd+Gg=;
        b=TkV/AtGHdxdwkSP6u9Ly243aU213uVy3Yho5Mtrfz8h7GWs1DrPoyWJhuZ0juAhony
         tztlX0Az746a2OSXuhUDO3746o/Rvf7oEfQDvtaZHPTwKVXkHrwHeB6obhOqVqaxiyQY
         v0o5CTpH52WA6MHdYLXVmUCy7Jnz7nPMzs+VabEX31g2ZyRx+GkXyRVOyAQqMTeDUSlY
         AnxrHw1Dafep39TYuDR8B48DnxTlTramdLYHhpK4GY1/Ol3iULvPHnsa0iLNv60Ip5G3
         QKV6tGxrdYn2zvdXK692cIMhQU4OD2UKak0GpzSo0iTnT5QfR6rL4yIrUb27+p0IE6Kd
         Vt7w==
X-Forwarded-Encrypted: i=1; AJvYcCX6iwtFTiVL/OWWaj7YtNlS1jAiIbTAUR1Vcr5sG9R5ANYbeHcQFvJDm0eF6nwq/QtlRK4GZV3h0T6k4XOrpMg=@lists.infradead.org, AJvYcCXngu8Mg5u85NbTC0tZmNNM6HHfvZ7K9DMjpwmJDc0Mpm9podq59i0tiYMLubufWd5thnC3QhfboL+wafY64rGD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Bpz6HhB1BJ7aNjBEUkJmlz0ur9lvq/3w73paGF2uRPA0FWSH
	1TnKYn07q7by2YuuKp5yTs2rduyq3rN5I4XXCKTabT3BbA7VjtL3
X-Google-Smtp-Source: AGHT+IHCAHuac8LcRXb6oXySdYiXNuST/E5hZ792qvOEl2kds238Dclz1//IuMmOtE6OMUv4eXmd6A==
X-Received: by 2002:a17:90b:3755:b0:2e2:de27:db09 with SMTP id 98e67ed59e1d1-2e8f1078c4dmr33747346a91.19.1730725597840;
        Mon, 04 Nov 2024 05:06:37 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93da8e879sm7544666a91.10.2024.11.04.05.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 05:06:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 22:06:35 +0900
Message-Id: <D5DF0QIO2UZQ.29U999LYCC05M@rocinante>
Subject: Re: [PATCH v4 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
From: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lpieralisi@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
 <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel@collabora.com>, <fshao@chromium.org>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com> <20241104114935.172908-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241104114935.172908-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_050639_399466_DBB07F54 
X-CRM114-Status: GOOD (  12.99  )
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

> +	if (err > 0) {

You could drop > 0 here.

> +		/* Get the maximum speed supported by the controller */
> +		max_speed =3D mtk_pcie_get_controller_max_link_speed(pcie);
> +
> +		/* Set max_link_speed only if the controller supports it */
> +		if (max_speed >=3D 0 && max_speed <=3D err) {
> +			pcie->max_link_speed =3D err;
> +			dev_dbg(pcie->dev,
> +				"Max controller link speed Gen%d, override to Gen%u",
> +				max_speed, pcie->max_link_speed);
> +		}
> +	}

I wonder if this debug message would be better served as a warning to let
the user know that the speed has been overridden due to the platform
limitation.  Thoughts?

Also, there is no need to sent a new series if you fine with the
suggestions.  I will mend the code on the branch when applying.

	Krzysztof

