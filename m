Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D893C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 22:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=; b=apJOXh/xuY+u6jJaIcI53Fbhzh
	tAAICUR95UcvAVsZLrdCFFkVHtfGApXjtCf69aKFDxNBWWbSV/C1jZMq8oTtmPv0+GqDYIUzlsldf
	qgB1zqD0xjvSEln/qwdh+aFu+Ho38uCkUt1BI0/UbrouSFsGMGVIoUQDI3d9Y2kOcKlygnifwYj9b
	zOQw6Non6YXVPBCBYzP/ZrRsuTbJFWTGQsxMSmG0e+05PN0sR2SN7CxidOFONAiAV1ehFuQVROFaP
	vV/pVGc2t3l5ZhZyx9l72O7KgVlOC5sWHQ5NJ39VDWPSXvLRWOh6XOOS5oYNLVU4vSfB53x2Dlpqm
	gGxFCw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tdD-0000000G1qL-090U;
	Wed, 02 Sep 2026 22:40:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1tdB-0000000G1q1-055H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 22:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788388832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
	b=GevMvYmL9hNcRELakV7oukmrZUbOy9vWITwigzZ/snN2VQjXHeAFPt4x3eb/oWP0sN1ZEr
	l/W3rkT7n57Zl1mJIM4ONgq6rIcTdJt9k3B0UEoUQVCW6rMH0Kjh19MYmJDLYETwlk8BNx
	jZW3P5FpTm5HWZiBBVbgA/nXamU7Rrg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-459-k3obYAGcOR-Kz3dOUV3Msg-1; Wed, 02 Sep 2026 18:40:30 -0400
X-MC-Unique: k3obYAGcOR-Kz3dOUV3Msg-1
X-Mimecast-MFC-AGG-ID: k3obYAGcOR-Kz3dOUV3Msg_1788388830
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so331905685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 15:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788388830; x=1788993630;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNcn++DDYySJZokz8/3409CMhSq8WdyhJVAopZOy+GM=;
        b=f5+8lYZ+PnUsBVXXY0JRssvOPBYbUptdg5iyTWQylXpj8nYGgmdRNBU5hUqMMssVOc
         eYS9sYCyaHmGWXZC4L8Zdmeo6iIyqQmupynvr9sKA1fIstZ8bG/sg+o5AA5zP51zluRL
         E5ilNn6agZpGqZ8yC64KnRFGdoYQTTJQq++tLzPcKHW+ZIaJMB547rSzN99XpCmGXxR0
         hBP3YcgV2KmdJCAqoXI+l5RW6AzeqUTQZlr6/cUVqJiSKqE5Gplbb0aY7pWt2iHRYbgg
         19MeTR395nyelhmvOQqkyWDKyFlgqjv29tKuLlk9zDdrFKRUM24gylj0WReAyYfxUDID
         A5KA==
X-Forwarded-Encrypted: i=1; AKwUvBxy5nDQcQDrKwpfZwoU9+4makGY6D4NOOdYWkfpuUFGCfu+1KQThtG4g7BgreZKXmX8RNLnSjzp4xiERizlCLXW@lists.infradead.org
X-Gm-Message-State: AFuF++naqskzHR3YyhfDdTp4zIfpTdP9lLNCrJ5candRvwMmuAL6R1zM
	aGPgdXLdy4USvt9BN/Thic5hfxLmmMsEAyD5WRC1f3F3P4BuzE9wpDNuemm+qXwthgygFmVbRmY
	R8JPMSSC2qtmqskBHlPGoql8iadBnhB0pwyqT70WTfMOUu1pXQrATYT547wPl9H0ymemnRFNHHl
	TdsUFtWl5O
X-Gm-Gg: AYBFou39ddbGJSy0peqYSn6Zlr/WyvdCJA+uYinUVcDtt7jgR/9RZwPtYwAGx9WN/DW
	+qzAC5kioJEmXVVo8SEUqucHFivZ71wsXYYa34r5z+Zsc6eRqrBlIvmN5AcySD68w/TNg17OJIv
	2tUpskwkBM2zP4tGyasTj2WjC1KMg2/jDP73VuQZjY7sBdSLo/R4MkYuclsF5bYwafRHcRJxE/d
	g/9gHOQtevVkD39CKD2KexYSNOMiUCl8ZFWLwTSM9JvUR3A0aJ5/FmrkAzJqs3MkkKHohsqEpn8
	5WW/TS+ifmDoX8SUlyivooyIyXZ7mwzRs2lFE3SjqzDRhoOVv/vLFwb9Hjq/5Xzdi7UrwRcf8g4
	LdQ==
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234854885a.45.1788388829994;
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id af79cd13be357-9396de96ebbmr234852385a.45.1788388829633;
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f157ec6sm325731685a.7.2026.09.02.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:40:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: mturquette@baylibre.com, Triet Hoang <triet.hoang.dev@gmail.com>
Cc: sboyd@kernel.org, luca.ceresoli@bootlin.com, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, peter.griffin@linaro.org, 
 alim.akhtar@samsung.com, michal.simek@amd.com, shubhrajyoti.datta@amd.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
References: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
Subject: Re: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <178838882032.2062832.5940694093369397743.b4-ty@b4>
Date: Wed, 02 Sep 2026 18:40:20 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=303; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zL0boMPnZXSvjvuLkbS1bHkmEeflCn7eOnBIJo/+CW4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLL0VV+h7R0zPm9dX9HPSGX61EsfIdw9vtRTN/i5/t
 j/WaLZpRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMJW8fIsH36qdUPmP4Wzj0q
 rGyUEmQd/uuT83qbiGs/py98ZH52/wlGhteCFQ9jr3uHZX69fKc99RrbBgm9fRUeH5YsUXdtrLG
 6xA4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qZZh_6-iw4xYihytRLfnqiS5binI4ZPxYhvANtbPgkk_1788388830
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_154033_139331_C0BACA6D 
X-CRM114-Status: UNSURE (   6.63  )
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


On Thu, 20 Aug 2026 13:59:04 +0700, Triet Hoang wrote:
> drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Applied, thanks!

[1/1] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
      commit: 48bec6fd8ec32ffdf65a5ccf268428a9f79ea210

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


