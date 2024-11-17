Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F7BD10F26
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 18:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=; b=xKHEdu3s892R859LCvKBmyCTuf
	yol23ennoMFC6q5EzPi1cdPaUmbqqKuZQlN5d4CuohCkL0OUEd00/uVxGlGUW4De24t7t9AEFW2+V
	bG7S8DPyHHEtc1zA+b+m4iyemN6Gafx5E3Uf5s76b4az/HcjBEijV0dfNY3VeEDmDNTSm3msnim2G
	QZH8Y4vXWejT6fT+DxgWxVP2mMX3NcAnz3/hhPDZnflonYtmX17eaLMd1c6f0z7e05yfX9q2nYI9G
	HkARt2c244+1Gak6g3UmJ3DYiqawIK3YgdeL6uHgmvfPgh2a8u4cMO+cXYFACE8NJlTNmBv+/QsZN
	YaHUJy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCjZf-00000007dck-0XlM;
	Sun, 17 Nov 2024 18:00:39 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCjYi-00000007dUz-43HX;
	Sun, 17 Nov 2024 17:59:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3824038142aso532751f8f.2;
        Sun, 17 Nov 2024 09:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731866379; x=1732471179; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=Il9duE9j3WOkItxuo/Ryv1TRUGvCYCQzYcSxenk4KsM51ZsRmiq8eDpoH8BjK0gAYY
         2Ul9nOSmqCT1F4XSK+A+R/7I6H5NmwI8/DILZjWX7o4LnXn1dkrSP3Ahnmuev/+tE0OZ
         njZ5w58b2fX5z6xT1xz9C5ZcE67216vdtl4Z0TYy9Ec7SQArcas5rDG/oaHHVXAkUxil
         vE0UU1RfH1zBnT5tN8s2F0GmcHUoenXgQeoRwLAtqN2psahFqpoK1xAo3EcBjWTn7Uzt
         dVU+pm0XjbSmkXI1dMCTq6iniRL641HtwgLDrXfmgUZOVXlLewtSPciPUm23eI4TLmpM
         /Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731866379; x=1732471179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=sQ6quDmxSVbNTjbMOiWhxO6bc8/igfR/fnw6pEPGeebugBkgsoAw9QVt0zCW5uuh2x
         3yCsuzdbv197cMQUnh3d1NLKhgheJNZYWxr4x3wLuHANGGQ/ABPzyVBvN7q/OuYF9Gki
         ujbsv4kwomxfrPuH1UcwwoQjyEIS94kKSI1/ZMw58OgOUa7woXBhf3tNtKzmyx8ajosK
         VHY0Y5nX7tNhX0hL2Aqjix/ivvGSPKy7o3j7U3VLGkHX6t2JiMQdWoUV714K5EoUtd/u
         1RBuGb7hPP0xT85tLl2jaRlkKYGVlmxsspwgZBwS8g1m7l/pkBbaj/cg0h1gX8j2GugW
         biuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNPGN7kG6NB6P+sOJv57rhTfEEvf1xH8G/Xf4r4HFqRc/+kMqDnpVb3UVxEMO4Lw/XGzqCbE2nueZh4jRm2QsV@lists.infradead.org, AJvYcCUii37WxAuX+MCXlB2/QkBEBkVlWxp7O8OozAn6gleMPt/GxSnCxtDxC01pJhn00MP5R/zvKSbklSLUmCk1vHc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaR1Melg0Z8H5fsV+XAYhZlFvk8Hwoyo5Yk/9CDzCdjVFxIdOE
	n/lXPMmc/n1tNvGpTjoO6Uhrrs0KJtnjyz6ty6Fp2uKx5ynPX8li
X-Google-Smtp-Source: AGHT+IHqbrlLtaP5Yd3T+27nHAETyVBfr+n6kx9rmAYJRbEsnbFwXaqkEA83aORA115kLsYVwdaKWw==
X-Received: by 2002:a05:6000:2a7:b0:382:4485:2db2 with SMTP id ffacd0b85a97d-38244852eacmr1792870f8f.1.1731866377467;
        Sun, 17 Nov 2024 09:59:37 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3823e0c910asm3389235f8f.39.2024.11.17.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 09:59:37 -0800 (PST)
Message-ID: <e96fe03c6515e65f91c2524181ffc48815c2831f.camel@gmail.com>
Subject: Re: [PATCH 3/5] scsi: ufs: pltfrm: Disable runtime PM during
 removal of glue drivers
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
Date: Sun, 17 Nov 2024 18:59:33 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-3-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-3-45ad8b62f02e@linaro.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_095941_018592_B6B78F96 
X-CRM114-Status: UNSURE (   4.22  )
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

