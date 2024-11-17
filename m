Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78BDD10F26
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 18:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=; b=1/BAzzfgeuT5Dx/2Xqs7jgrMHC
	ISbZ81Vpo/gpd0pNCjt5aFrk6pZGuFzO5YRuLzkgxHtNH78AHh5m5en0LYlpbN3Tp3k55uKjMyYrA
	VKMCz+csdwIKBTXX8wLwY2VpK/yYuFFoLzn1Sh+r2i+ctSQrPX2mGxCPpOr4mbKmI8+2yv6Pu3kZ5
	oPpLaSPCiw0JjQFRV1BfQXceIZI82dqfQrJQ8Izb+7pyfVx9xGg5pQnqN1nAFEQuiA16ZC5cSZA/v
	uAobStjHmr2bhOdUm8Op5XjQHbBVnNslIZAI6DYZ8xh04ij6OcmtaYZUFV7fc1QXx4+tuB5MW6lWj
	dUo3snVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkHZ-00000007h4x-0tQ0;
	Sun, 17 Nov 2024 18:46:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCkGb-00000007gm5-17Xk;
	Sun, 17 Nov 2024 18:45:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43163667f0eso10704005e9.0;
        Sun, 17 Nov 2024 10:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731869099; x=1732473899; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=i+zjBpRMvzjJfs7WNFftcOK3szRjZjDZhTLoX1yTCjwuXfE25A8mzng9pze471rbZ9
         sctaxG7V/wXxEJqyNlsaSVAh9oG4PYi0tuGguhJPICbY7NrnDuq3MziOkRsXfq0Mk2VG
         nd0meBBJUnienj2XS5loByOC1snPcVwJcjHYv6PFp7t/mp8HXyUn6uu1cuUl5Hj2nDYt
         S6LCriGGoDARix0z9lvymLinr8i+irpqUBuBFcSydhKj4Ze2cWUDCb131edxD3mNPAlw
         5cU8sxgfx5RtUrOpqYJkr+Ma8vwq9tmyRXN9RvzBvb5xxfWBxuQykumcU3rXRHaoiM5m
         Vcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731869099; x=1732473899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=OyplDkkDqtsUtXvzwoax3G0H5CXVdpqkd6jDR/ybPva3yzcWy3A+mti5psbZhi7xE/
         xSlKCaJ/6PMXNdH9VLu7KHDD4X9ZJ33VRZLjZUqOLEAJXm/xI3uYo1ByYHcvDV6SuVz3
         52CHGAhfuaKaRaSSLcK27Z3r41LSLYPAR3HLnhx0qbZ62ksO0/4z2Grw19wgbmbbi7uo
         jTpk47pgM6NN2nmh71PT4Jw3vZTJQGyNnIbUskk/mDtSsMRv1Ga2PCs/gYTKQzhZRoSO
         kP+LuHvynj92CEJ4RSoBoTfA/lTXIYLfhLa7qXSFwDZjLbvhKey7LJef/kMgJmsPLVIn
         Tlbg==
X-Forwarded-Encrypted: i=1; AJvYcCV57wMyvXaRhw12cRh6KJUbBpBrQ058V+aUpn49JBNb9yoCOdavoGvvWY6Q27O6NVrfp6SvBoxSHB60gBC+OLGS@lists.infradead.org, AJvYcCWUnAECtgzghavLfdFHOVlqIFwzQycECtPfd5XITzQftSb3fyLQ3bMCDBj1HR3vhr4ixD7vMaVbnHA0kYJQ6eI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyprrhTGinpTqGnF9rg/W1wycgtklnpRXRuQAEfxfvTJayTDd6K
	O5TolciUVrnliC0Ul1rNJBnK27J0CGBfXB8VMI/R4SQvs0E/fFlS
X-Google-Smtp-Source: AGHT+IExQsmvqvt3qJ2z23c4A8JPao3dfuvfjXBOOS7R6FV1JbeEQZGZJ7CVa0sXymsiLT2oFXxoUQ==
X-Received: by 2002:a05:600c:a186:b0:42c:c401:6d8b with SMTP id 5b1f17b1804b1-432e4d9eb6fmr51016455e9.7.1731869099218;
        Sun, 17 Nov 2024 10:44:59 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab806e1sm130493185e9.20.2024.11.17.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 10:44:57 -0800 (PST)
Message-ID: <7b13e516f5c57a272175b23fe5f7da28a91a4d11.camel@gmail.com>
Subject: Re: [PATCH 4/5] scsi: ufs: pltfrm: Drop PM runtime reference count
 after ufshcd_remove()
From: Bean Huo <huobean@gmail.com>
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
  Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Mike Bi <mikebi@micron.com>, Bean
 Huo <beanhuo@micron.com>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <linux@weissschuh.net>,  Luca Porzio <lporzio@micron.com>, Asutosh Das
 <quic_asutoshd@quicinc.com>, Can Guo <quic_cang@quicinc.com>,  Pedro Sousa
 <pedrom.sousa@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>, Peter
 Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Santosh Y <santoshsy@gmail.com>, Namjae Jeon <linkinjeon@gmail.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 17 Nov 2024 19:44:55 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-4-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-4-45ad8b62f02e@linaro.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_104501_301930_A6461C41 
X-CRM114-Status: UNSURE (   4.55  )
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


Reviewed-by: Bean Huo <beanhuo@micron.com>


