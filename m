Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E0CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5n9k4KX04Bj2DP4+GCETxqUImU32jpS5w2W/MeCTA4c=; b=b1G+XE7kkpf6eXhVjgk7Z0TIIt
	Ce3HKF/VJWfvCERImzxVjh48i6pX9/IXH/qjSYzLto46LeFEnMLjpnzlp0HzBJcJe7O/S6fdLo/jy
	A80vM0bZrNulWPirkVhBYNxTZ73+LuZj6o5mB0XA03JAeHinlRkr6WrD5Be1OuvD3Jz5sFxtRgT9W
	TMAuirI0X/w9awDFBYypb/dDrLZRNgxaXMNyMpPYh+oeV3Kq6x+rXcteeMjDvsOYJTWhe3CEPO9hV
	0FWoERAViTHYNl2uuC0sDE1rORQWEmTnTwri26WxhZ0w9dDEHh68GmKdcCZp+deP3Nsry54L1rkhi
	3RsXIlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3YV-00000006ah3-43SB;
	Tue, 23 Jun 2026 16:00:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3YS-00000006agQ-3fTg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:00:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXbuv1155215
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5n9k4KX04Bj2DP4+GCETxqUImU32jpS5w2W/MeCTA4c=; b=UC5r/AakEX9tCSnR
	VOKYIjJdRnOiPqu6HM3UlLAsyB0P/Rxmuq7LQeKZw5mYYiSewz+euND5UpiqVO/B
	P6SQSUZ8QrqvO0jheBqCj5tUnBqg947l72FUOAeZYF69QvqdCmb53kSx8HTal3y8
	Hg0stY5vl+KWipBw17oOAAQG3sYels5wwH028j4TaPwxfh62Mzcm5tiMeyZyKfLy
	a7h8QNl0aD2DMEt2vwrz0Lno0HM0/VXB1U1tSc0iIpJhNeKwfL7XBY9H0iA+thC3
	0y0ewCkjOtCfNUTYuxtuoFdoytX7pSJmppCp2DPrDe76l0n1llYt9J6Oc30LvYj5
	WnaBmg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28sesk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:00:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8df26121c8aso182956d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230451; x=1782835251; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5n9k4KX04Bj2DP4+GCETxqUImU32jpS5w2W/MeCTA4c=;
        b=iJWDWREh2tsu0p8iMGA/dQAOvnL7zO13w+MgqwkWU06Ecpnkk4L3HUkx7BK3XWpQWA
         WjilCaz0ojU06f8Vsm7qnNIFbutt99bKA6/PbhUsktz29hA6QHbFuZncoKen2+EC0PTQ
         YRPm/RQsWh8UTz7gcfQC9sU5f5sC69xzAUnVICCxt4mfGFvcHretGFM20D6FQFShCDNq
         CsxAzBCl2NHcYVSbjIbDyHNwxQCoKfzJGioRYNJc+mRVmTPxZXBqRSS8acvGvLfUFf8v
         NEKqVpkZD7FX5i69GCVxixMjGIMqv96vXISVeS/rGV9dQRuoSvfb6G+N1JM/WvzYuJVf
         zR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230451; x=1782835251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n9k4KX04Bj2DP4+GCETxqUImU32jpS5w2W/MeCTA4c=;
        b=KDGpi/mdR1r6KW0rU+hmzl+Efmit87pNyw6V9O+x+Ke3V5FN5EmYX66oj018fbun/P
         YBgiVXfvx/NtL/54kTDVVvmzP403vALCs63g35WhnbWCSsjQR7ZnpJDJOscqDhAnCWYY
         LTzac9slFwsB48kh3PNP1rNiRvUl6f90Q6QN1maZpYMkKzwoe4SvAMXZp3fMW3QAS6pf
         XxcuoJNc7Fby87LJwAOUgqDP6pUjn0yzYq79catpiLPuvoQySDbIszfwPH/mlyHLId05
         qsAweDpibZHleQQ9iKQJGDthWUqzfAxPUb1yaC1ddDrHuZs3LjmIA5p8kTAiWSiA+C28
         G1Bg==
X-Forwarded-Encrypted: i=1; AFNElJ/BL3J/00Eu62KzDlIBtLrhXC7dTu02KS416vgmomQk+Jw+KQJY6SeifBE1MdMO0qFppSfIZC+SBOvINg7CtWpX@lists.infradead.org
X-Gm-Message-State: AOJu0YyL9c+1QWGuIvppUMve56XXNrxmgmiq3YrQe4i/GOrtG34UwWkS
	kl+gMeuRWjzK6lFSHmiRZbuZEkotT0/nOwibYltCYiV/PnQiA8Ons2U4kPYM24fVA5x3/uUkj6X
	5qMuHtU8dloUUII7PHmyF6bj9ofl7jfH0E1TF8LJ+SMvEZmpFmuOflm7b9dhNWz4HycxQjAh7ez
	Veh86S+r4yJw==
X-Gm-Gg: AfdE7ckBrUfxIRU7ysl27zIlCaZR65tYTDP7I/CzVnH+dpfujIz0oN9UadgnfoIbg+Y
	qO5+zDpag7YacwLZNaLkpCSnqJ7ehVWQjRWpmCXl48BKNcxmQXHrttmGMXhqPS2b5ZoUcIXXRxm
	6Ip5w38S63ABE2fIEcEkcjVCRlqXndOY+iB4uEi6+dz3auXr9GXJ8yjFlL5nJlLV7H5vqnh74P/
	XqP3BUoJ9gdobj/k8XFJNBNXAsCaPrnnPKl7cEYEbebwyrjkDYgMPTctlfRVs1NuPfMk3zLcnsN
	vywi49YkNUmN4JPGhuXMOPR8ShPIk//S5SPFOk5DzDuKPhuS6Vh4Xw/ZC8uEDzZnNISazzhoVWa
	ELme133/o8xYuaEMRFRwmjZsz57zc2soyIu0=
X-Received: by 2002:a05:622a:24e:b0:517:76dd:4c2a with SMTP id d75a77b69052e-51a4f4e1e4dmr56837331cf.7.1782230449860;
        Tue, 23 Jun 2026 09:00:49 -0700 (PDT)
X-Received: by 2002:a05:622a:24e:b0:517:76dd:4c2a with SMTP id d75a77b69052e-51a4f4e1e4dmr56836611cf.7.1782230449107;
        Tue, 23 Jun 2026 09:00:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e497e88sm550111866b.11.2026.06.23.09.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:00:48 -0700 (PDT)
Message-ID: <5417d960-85ee-4e56-8121-959b01511285@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] iommu/qcom: Fix missing pm_runtime_disable() in
 qcom_iommu_device_remove()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfXxKN6ASxxwlQ6
 SoG0SOMI7eA+FwUkwndmSyOSqSPGLAmEyrs7cA7D+JpxICHBUnem3kW2ivNLk7iHZ4NaJA6BNI+
 IswGQhZqFem3pMb6N3G3z2kltLAisZs=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3aadb4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CVC24o2f5RenLrmZXHoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 1PQD0YsRQH6ElX709Ynw7xxLoQQVM9WI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMSBTYWx0ZWRfX+xV5W1240eeN
 4ziavjOZ5D0tjEqX4PmeAqQKKnsc/jKLbtLkKlOkbWcAvxI5iteFWkxL7dOTa6r9uApqWfwug4g
 I2ELn+sOzuMIYOtLfp/q2kwKbX4d0dftDLioHmkUNho4g5r1V2MCf2S0SkBJ8xVQXs7Gu97k3Ep
 JAGImTsRRBI/5a3vwbfQ39bD2KH+hm/H7u0hlGGT79D/x4T6LJ6pBJu9cpNliFtyE6NTARzvDoO
 3IwnbKRWpkQDXuD3Uhb/ccoWo6azIoBi08ailbiuKIX5b1hQjoa093hGd97KUuZQL+csoYasy8Z
 Bm5cwgGFpHNB8flRZV4BXk7wc9VKbWml9pL3iSokwtFAvAFpzqqpN4PAqxTPua4MDvrQcz5fjS5
 teh6seas7uWbkWukAiCscjKMayXOnfPvItX6PNA/LaiDIVW8sRbTrX3iaNTQfu6/t4Xk4CcpZxf
 /6rQUoXuvPryeBTJgIQ==
X-Proofpoint-ORIG-GUID: 1PQD0YsRQH6ElX709Ynw7xxLoQQVM9WI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_090052_923007_8236A883 
X-CRM114-Status: GOOD (  18.72  )
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

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> qcom_iommu_device_probe() calls pm_runtime_enable() but
> qcom_iommu_device_remove() only calls pm_runtime_force_suspend() without
> a matching pm_runtime_disable(). This leaves runtime PM enabled after the
> driver unbinds, which can cause issues on rebind or if any code races to
> resume the device after removal.
> 
> Add pm_runtime_disable() in the remove path to balance the enable in probe.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 09f2ee6be988..cb43276f4a39 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -878,6 +878,7 @@ static void qcom_iommu_device_remove(struct platform_device *pdev)
>  	struct qcom_iommu_dev *qcom_iommu = platform_get_drvdata(pdev);
>  
>  	pm_runtime_force_suspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);

devm_ would be neater

Konrad

