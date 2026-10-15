Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637ADCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=; b=ZyPUWeYY3DxOUlgAb6xF5pXsku
	gEtr3ciCAl76vJ33kf5vQ9Cm0QaxabCscpabkItzRVA3PILyLbjhHXVM+sKShBPvql8z7VYV4Go7l
	ggKoS6zfyTchfEborXADxQmbwrCJ0k+p7abmAnslCI8m7v6dAeFynBYigxJPPmPMeU6yqGKOBUkNK
	oJ2Ccgc/RpH1j6Jf9zQz2Q079ynK8fgyUTUwxwyfZMlfHPhFa7RRXKqO0ZnBt11Lv3vdfR9H9NF4X
	C/7Mf6UZUPwZLZXuNL8uut8FYB2iT+f40yIRRqk6QMvhtrF+BUbFUlsn9vBRA5T5hAaEZSD9u4Npi
	wF6igCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRcP-00000001HXj-3VS1;
	Thu, 15 Oct 2026 20:00:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRcO-00000001HX6-28Dd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 20:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=; b=g2ug3YOcwOmuXUJ9E7FpALlrBZ
	xH48WS1jHawmMhxx+Ptm0yKxh/gzGhNtfmu1m/epoC47HyaYGd6wBKaPxtcxZbBPUdFAv/ilofOgo
	DaTqgCJlJc7VLl8UVh/eqW0XEOkNBMVXskxUYErmMn2aaWuYqkEibavkTpJ6Qcbn9xxcdjQfOv6eM
	Opdc/yeJXWUFipFPs73O+Tr6Xn466dOJ48Ektr/DCGMBLcPJEcP+fqu5I1iV/6ycEBMfwqtzCHpKq
	J9aCntshcA+eIVM5FyTsAp9HQJyqZU/tOzvVIpWuP6hUkPJLt9fJoc58EOj/3fpV5iqh+DVqhxEAq
	zvNg2fEQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHRcH-00000000nSC-0zYK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 19:59:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so51747195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792094387; x=1792699187; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
        b=I7Lfcv2mN0DsJFetGldn6KbL477mA/v4uFprUkl8d728cbFa+YQqfAjaCRzAIBBJ6u
         c2KxRIi4CkcyCQwbYxDUCHJxl3u1OSEE947ykAatKT6FgaKxiqdDMZHRy4IiPI+AvD/r
         7+F9DPT3rSUequ4EHbmbMRG8/ajV3XmRa+Onv+rAjYBKRftbgiFJ8Z/Gy1pyPkBINDlC
         rW0pTc1aPQqL4DcgsxmZ8ZjxVcXPaewxkqOuP0LB5Z/BaGSO6uO2y69XbPhfeytVzKfn
         90W+kcYvBL+mRK3WmthA5pHVgFTYOVqVavVa1BCNuTp7vzHLglJ8nhvfjmf2eOIcQK0B
         iMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094387; x=1792699187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gRDVabS7sEgoC5YbuU/p3+usRnz+cBBnRvd0bHzcp4=;
        b=K3o+THe2WWFMpILmNhpl6vdFy7U0wgeAXWujOLZsjBPV9OfUmRJjwAIpCBu5B3ZOTp
         KXJi4ctYr1cw5g8kxaUMyqs6+jAOAb+8mkC5nOVvTHn0Mmlm3/MYKesYWJ6fkh8MwMLc
         YnMmb+ocGsuLE9gLtUtvwMfIkxYDOxmFcapuBMyj4DJ4VAfl8JWrxfHA35rcd88Fm7rs
         CvV/teOIXY8UQZefpFho8vqVWWx+u3kqirgKmdQdVTiSoFfajxoOM9P83ezk8O+7ra80
         TdBB4h0kTdiVTJONOm+Yk7zxeO6IZoZ259QyOaNKPG6omwzlZYKvWt+LKL2d/Y8qECtD
         ZxWA==
X-Forwarded-Encrypted: i=1; AKwUvBzzQZoVN95Wj7cAhIXmFa+09PnaHNRD/jGA8MFnIC5Z4F3iQDGXQmLiv+9440dr/omq2ninSw+B9EnemeXaRAq4@lists.infradead.org
X-Gm-Message-State: AFq9FYLsGKJCs2sEQBJzwNoR2SQVXokcyQcl5cKTVTnMC3c4SujAL68k
	9lqA/uRZ8A/TUHMBRysVULUwLocqnxSIOIEKdyNKBNlJv0Lx827wT7SW
X-Gm-Gg: AYBFou1NbjOwEMV4cY0xDWLE9WPrPMzpWKwuC2p3z3aYfJwjcit+SiyJGL+EyvYhJyL
	bx/sJCaqtxXxhlKKF8FmrRPCNENbakA/Hnok6aWgEzsB0iE5ETLIQ81RUi41Upj8DhDq4zpR2m4
	F2bRjeb+IaXQvNeKqtM/fvJCPCeIAY9F4sJcioc/nc2GeIH5svN+YkpYaGv2E9BsiqB7C+roTRz
	nfustWPQalyeseT0ASgL2G9wergw1nF565qm5OLID339A/2+NeHkkqSjy7j7IkJTUbO1ViafoKC
	MYkIrUDKaU4kRfKFmP0vcE2Lf8z3VmUn1Osto9a06drqxEF10MaSVHOIkoINK2HRmPP/J9I6P7w
	91r8SOjVy/CiBtj0NhTXcebN1BgpITh/Kh10Ks1MzbsGsZhBTwAvQ/YAEkHEQjntXOYNrIvHZqg
	YGzequ8i1iM9EcLF5BmoTmq7CEtNXpfVEpsYEwSkSxk5WPewHN9VOnDgZ5be184Ctypp4tx1EQK
	Q+dYxKzEPrNpm1IW9hQD5U=
X-Received: by 2002:a05:600c:3f1a:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1ac667160mr205111165e9.26.1792094386716;
        Thu, 15 Oct 2026 12:59:46 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm202635f8f.1.2026.10.15.12.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 12:59:46 -0700 (PDT)
Message-ID: <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
Date: Thu, 15 Oct 2026 21:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Language: pl-PL, en-US
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_205957_513471_1C204F5D 
X-CRM114-Status: GOOD (  11.19  )
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

On 09/08/2026 22:15, Dmitry Baryshkov wrote:

> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1

Hi Dmitry,

sorry to barge in but I just wanted to let you know that I 
gave this series a try on the Motorola Moto X 2014 (victara,
MSM8974PRO-AC, PM8941 + PM8841) on top of v7.3-rc7 with the
msm8974-mainline patches and "clk: qcom: mmcc-msm8974: add
GENPD_FLAG_NO_STAY_ON".

Display (command mode panel) works through the MDP IOMMU. The GPU
works too: the Sailfish OS compositor renders on freedreno (Mesa
25.1.8) through the GPU IOMMU, and I don't see the reboot reported
on FP2. I tried 3D acceleration, and it works without issues.

Hope that helps!

Thanks,
Michał


