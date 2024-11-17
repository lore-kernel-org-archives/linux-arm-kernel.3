Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD25D10F25
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=; b=F5vjKFTnYFYQavPDQwo9/Zv7nK
	mdoiIA/0AnRWFwg2InEPpYwjYIyLkWhTWSm4nKEkQrpWkH4+/ixdpsJUiF93IadfFopQR7VbGPAVb
	xquEE5E1121zec2p/TfpHpsI4IQwNIsCwZf5/ETw2qPRMHUOBHI+X+eGDsC0n3nDC3BjWyx+TCUQt
	iQG0HnNdxaltNccEFwh7U8JmQGdqSGnhYRm+Y2wqDf1NrFIigkTGC1E8pIF/79fDltWiYoRuLgX38
	jjyXeKfHV8vOX0wldLXLoar9XHmHgtiovdvk05VpilwGDlm75af77SsKBFMlqeSkvd1v/5j4LJz+n
	jf2JIgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCj8a-00000007cH0-0Ihk;
	Sun, 17 Nov 2024 17:32:40 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCj7e-00000007cCa-21Ab;
	Sun, 17 Nov 2024 17:31:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-382423f4082so425665f8f.3;
        Sun, 17 Nov 2024 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731864700; x=1732469500; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=IDHP1Tt0tovyfL29L7HcLcVkj1LWIhZvnJ9/Zg+v1ywETqMKJP5nAvUCedRC+6tE/P
         qMdDgFvaKWq2uzfxlvCcAns+2Nb7WvWplz9Emn/fUR8kUHQw1e2xkz81AwLMDjaF3QRq
         +BWcyJmdMwCmoL0yupQgcnaMsMliiZAK4gMOQjO64kCWgL4GOdKV5i07na4EQQZvSAbe
         TOFENxoweE9hdUCcavp8JQnY+rdVn3/NGx+LT1P6xqkdYs3Vvf5/3g+LJkwgkExGn78c
         j8q652voONHSyZCAGvB7vlUIigJQ0MpQtVcqwDeMciVADBkYUVoFv93w86FiNNGjf/rw
         OqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731864700; x=1732469500;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU3f8iOzysWsUXprwUt22rCfRKOt8VzIxFdJ24lS6Ew=;
        b=Xz/7TDdKC0hWztohT5vR6WO6DuQeVLiRN/hPTTZLKtqf7xa5ayh0Mlz59rHj1NlSc2
         kfWUWIHjlwVGajIEOg3dgUpRQ0LmAeYRwiD9EthPPeO465q+CRWgvI+CAFb2AenfuYUn
         t7xPvmiZViVHulMd1ZojVD1cdV3cII7o0JeEGRv/t0dWxFmcB2cW3CxldL1fLarI5XcU
         DeVPr6LwMHypWX+01vyXS88poqPaHPZr6HYvzmbmKhOthRVuUcfUHNRYScrsIJZQkJfb
         z+qJmtwfLvvD1Hpuf/cqxNaYnupsiygGKlraZykchpboxn3pZw47pjKlGpTBkfcp1iVJ
         0Ajw==
X-Forwarded-Encrypted: i=1; AJvYcCUHlM3h18UvW0ibWrBNkvlfqiFmiORvzPx0C1N/CCtfwTPk5VQrDG4/QKIcJFIaHcCK1+BCAB2GEZzdYBoWHhs=@lists.infradead.org, AJvYcCWzKsKFcV3neOu0a+C6m7/bibp90BEMp+kzbkOM/O7FLowLnAhpwp8M60azu1x7x09e8eGH+TjTwKoqphsOVlAH@lists.infradead.org
X-Gm-Message-State: AOJu0YyyHoxgBoja7gF2QDIUajDs0Uxo7OtouOUPQZm1b+WwmQm3sd5s
	n9LXEhqpYbEy27iQ485oqxYSEbdUtXXW87UM9KLEedFuKNQ739pG
X-Google-Smtp-Source: AGHT+IGM5AOKwL/Gq+vlCdXodaTvKaKrFRZZ7omamsRPMIsQdxFKGxSowkpEpgRfKiIOKPWFsLR64Q==
X-Received: by 2002:a05:6000:1fac:b0:382:d7a:315b with SMTP id ffacd0b85a97d-382258f0d9emr8122852f8f.11.1731864700227;
        Sun, 17 Nov 2024 09:31:40 -0800 (PST)
Received: from p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de (p200300c58705a8eb1a556f9921c6cbbb.dip0.t-ipconnect.de. [2003:c5:8705:a8eb:1a55:6f99:21c6:cbbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae1685csm10504821f8f.83.2024.11.17.09.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 09:31:39 -0800 (PST)
Message-ID: <050e354f0d413dc39164bb72262b84b8c2038073.camel@gmail.com>
Subject: Re: [PATCH 1/5] scsi: ufs: core: Cancel RTC work during
 ufshcd_remove()
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
Date: Sun, 17 Nov 2024 18:31:32 +0100
In-Reply-To: <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
	 <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_093142_567111_000D097E 
X-CRM114-Status: UNSURE (   4.44  )
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

