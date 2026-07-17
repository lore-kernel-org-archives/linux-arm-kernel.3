Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E69C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kg+DjNoJWRRRaQne0rluuevQFJgkNzMrGtxjrFO36JQ=; b=ELKjp8f03MlQ9kEC/B3qqEqSBW
	79xA8Y1Xm1GF2Dx9bWaCBd+UKdn4P0c/FMEMVI3zhZcNqMBBfaY9Wv3KURJ4EKBzKHm0sfBZz8JZE
	ldHHiocgp7i9//7NYZzJnlmXxq8sc1Da6tykEz4LE7wCUTZtNzihfajEpQQQ6vxxThO367nMp5eqP
	K0eOtYBVKyxGdVjp/o2DUcqjMPRLdW8Q2k/TuKuDGLDiL1T/EjnVdCrnR7EJRG3n1G6YG+XmObcNR
	WFfeQFaeprJRfDtJ151cXTPg0ZRjTblG2ADx2AiN0+LJB/2Oz6MMnviiwc8w7zyP9dd4BUYf45Y/5
	Rjw5pKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkPG-00000002b4l-0Dfv;
	Fri, 17 Jul 2026 15:23:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkPD-00000002b4M-2ezc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:23:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7rYk1809412
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 15:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg+DjNoJWRRRaQne0rluuevQFJgkNzMrGtxjrFO36JQ=; b=JWp6PcNkNCnGbC5p
	6ZlhQ53/tdiuHSSgP7E9U2cmke6LOok1RO+KLkO5WfgBJgq7dECSQHGU0TRQmtTH
	QZ4L3gUJ70lG6kt8FIZiPnapSwS78kkqGt8lbP8bI8kb1P00yBwYbB+WIbkyYbB3
	MRYNk8r0Fv36FIz6agGaOevGWb2ojofmKtvYvoFOcCsPANZXHLTrc7ONzGxbm+7d
	xHdcTTjGmmRl0cwUb72l4OaiieFszXFpbMtjYzYE+HJJZsmUCfc0c6cOlB4l9Khh
	cmld+nrpkLQDtpjiR3gdHRg+m0uFfo0vVBqVjvfmD/2jCDpX8OReHYzDzeWUun2Q
	xfCtHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8md9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 15:23:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso19937461cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784301794; x=1784906594; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg+DjNoJWRRRaQne0rluuevQFJgkNzMrGtxjrFO36JQ=;
        b=Sd0xeBSk5WZ28pjklfaf4pOu2nPOv5sHCA3BwoUKwuMsBUIl+jiQ+hFSgXvrWYNOk3
         E9k5X+1VNtnFGSACyhdDho2lj+2aWlCS/CWEBmB/LXWmtkTXO9Yqds8tn81ruDRf+4F5
         HGbPht/aboy7CyZoRyG1mWsvIZhoebiFzvAreq7WkCRNev/PSutyD3bSlx1Qw9SV58eP
         wGMa5iAXyuvAORhXY7qjYGzE57WHHl4rzVOhT679CKSxIiLsnQiDkRk++9gsPWeWwRvs
         XtmPm0wSeoPl8CWyqlXIwdAeVAbYoCj4EzZWMCeffrmdwuaq+vVq+ulvGyv/txra12Pb
         8XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301794; x=1784906594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg+DjNoJWRRRaQne0rluuevQFJgkNzMrGtxjrFO36JQ=;
        b=gmQi0meBj5i7Xo0JFBpztP3t93ZU8kHfduzWU9K0HBS9m16MjmLAeViw+91ChZ1GVK
         IMCuLLVON2rSob2SodgyHW9ki6898sUomVc9tHbCKcZ096uwPPBA3eNAP8gHkyRG8gTA
         cZdKyEqkVgjtU93/7QxIzk0/nl2V/S7WmIV8Tq6/9dxcHxoXQEz0/KiB8vyDM52wiytn
         fFxZwR5TE47vxxjj9e/hXhoNPkH4rOs2LcbIrPCXlmcpg3f4ITstctiWvi3e//pawTAS
         9v2n8Ql96v92vuCMTkEbK4ymDFKy04TbeJQcFuzM8kSg4Pf9og3bCslasYxikNPXCbxj
         7Dpw==
X-Forwarded-Encrypted: i=1; AHgh+Rpa1m2JO62DTy5OR11fWjowStpsKTrklBx9eLzuaJxrR8amPC6LINVAgz21sX+j5YzdEIK0ND+Usv4uid7R6gLA@lists.infradead.org
X-Gm-Message-State: AOJu0YwkIlJ3jzYSdUdv3u2DGoBWRm2LwhWPvbxWy065DwrA5nJW4VDa
	QrNUUitn5CTubJasPm3ldoSEvLrJwDXIpvdinezYUAxz7PMt2/4UkVCqqxlMoXPB4VhRpHkOmJq
	hR6acJ366FaIQA9G81yzbJnL6rOVxGKu2g+jhxUtbtNb8/edZc8HnuVml4FNBWQcUxphbx5Wem8
	acvQ==
X-Gm-Gg: AfdE7cncKBdDPkstqOBGpQ3NiaR9SEEv+iJJPnDMgMiEhfIAMUUuTwQd6Im2/2I/H9t
	sIPERAJXZa42lvo8WmBL/a29oL87+U2/oYkCouoseXLbcPnWZIE6Qf9EBSdYZX+/8mmEBaA2uiS
	oDcDHld/Ti1Kb+H9a5fyfJv/l+qbpHPdhvLDoTVMWBoq669uZiBypziCgCO2aOArmnyCoaL1/ZJ
	fu+r4buzscHuNT7k1I588YvjXQD7X5KZRUpd+kwSnBKyy6t5COqbKW02sDyhlLig07iS9uUvq7R
	uT9LBFXZOGw2pgBBH91jj4SVRKZgf1Qw8Z62K4+hF/3PjQYTMcRu8t2GExqdcq0HqrZGuiCPft0
	VTX4egJZ5nroyLxgIbzuEoEvt
X-Received: by 2002:a05:622a:aa43:20b0:50e:6311:7380 with SMTP id d75a77b69052e-5213f861e58mr17403961cf.6.1784301794122;
        Fri, 17 Jul 2026 08:23:14 -0700 (PDT)
X-Received: by 2002:a05:622a:aa43:20b0:50e:6311:7380 with SMTP id d75a77b69052e-5213f861e58mr17403631cf.6.1784301793724;
        Fri, 17 Jul 2026 08:23:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50b83sm93452766b.45.2026.07.17.08.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 08:23:12 -0700 (PDT)
Message-ID: <1648f409-afab-4b2a-907d-a90de62d6bb2@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 17:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/qcom: Use devm_pm_runtime_enable() in
 qcom_iommu_device_probe()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
 <20260717144608.3216274-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717144608.3216274-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0WCNlsEM7rLh3lY8PjelpmPIWlOSVSD0
X-Proofpoint-ORIG-GUID: 0WCNlsEM7rLh3lY8PjelpmPIWlOSVSD0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NyBTYWx0ZWRfXwfcSIj1BvNWC
 PX87YLL3lnIGLnj2pjLVmM8AMgTwArh5w7a6oUNXuXLbnT/QwRJzoYn/xjidXoUeJ4wZqrwG7J/
 GKt6sBtUIOqnBUycgTuc1tn827m/Unc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NyBTYWx0ZWRfX9cwesgErcUe/
 9U0Xcx+M3mj+LVLiP1bzigyibrj6d7spa3ogfK2Eq+6tZa6fQVXhSsE2jk/aoIdXsCwlU+ugzaQ
 QchOL+YjOlTKuuYlUH9NFZD5B9n16TluBGtQGMidRgExxmC13jYfcZu6JWr/fpEsr6piIwSy03t
 d6PuLMhP3XLYRnT11yCH4156ZLk5/V3B3a+afZ3nO0VRByU9P9CXQuZSLswdmLmd7JELNi8VjGZ
 QIDbyC3AeTOk8dls6qNWIGd8hH1f/4g8iyxPNBFF7z2FNCczMW1OIcUWFvI09ettllgVx2uq7q2
 FHSZ318ugpRH0Hwr1TzEdRrLPCQyzSoKVUc+H6PK76Nmq6jbhwX4L4dqpXq4fHoIAWcmFxE6Mgd
 P/jRhmlrA5ahMT2gZk/3pStDQ2qLJahqEkyAmU7cEjX1lyEcxi52PzIojQx0f47/pgh1du6QOmy
 mF4Kv2fdJCHa/5ocf9g==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a48e3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=xoj3hry2uz_LQgjbiWAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_082315_709707_D1BFF0A8 
X-CRM114-Status: GOOD (  11.63  )
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

On 7/17/26 4:46 PM, Mukesh Ojha wrote:
> Switch from pm_runtime_enable() to devm_pm_runtime_enable() so that
> the matching pm_runtime_disable() is handled automatically via devres,
> both on probe failure and on device removal.
> 
> This removes the err_pm_disable error label from the probe function and
> the explicit pm_runtime_disable() call from qcom_iommu_device_remove().
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

the single-use goto could be inlined now, but anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

