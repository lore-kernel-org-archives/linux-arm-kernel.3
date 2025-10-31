Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2972CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O8jmHsfI7j3mpprPC9vCGVH2KzWiYloucUYA5jACBSU=; b=1Sl3QYdkOKGQ4pI/rPO2LDs6O6
	8iCU4SNFcVdW+2tuW92XLpyWmDw4UqL/Q8EpcMBvfLW/EHn4hqjQZYGSgoz2vjWLUkVFvJWrNRSw4
	7favtxDWWI6TEf4+GHNpESGgR6V/e+PkNztQ3N2+9FmFVnE7JiB/G2ZckuvTAAUOIhmAShACvxhmd
	8c3meyjR0jDpuRAkbxDI07uKMbcQ6zBgXEbe73BKg5b77u4oGHnmH7+hD3sUrgEj11TJbsFeKynr1
	EjZ1Bz12KWX3UcddKdljp0HglDzWQIVIlhF6TTAmMEUOPhr+DjOrc/qKUo6Kn2hrQh79hfLgtCcHr
	xJns+2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn2u-00000005zMb-0F6F;
	Fri, 31 Oct 2025 11:11:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEn2r-00000005zLm-1fo8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 11:11:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9jGH71417233
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=O8jmHsfI7j3mpprPC9vCGVH2KzWiYloucUY
	A5jACBSU=; b=CKSvxiuX99BiWWBH7sdy/10FT0T00zMIbKRh1hMcjdfwuF3FaGM
	F0liTDiMwkFD6uV1kC20obvTbWIziQnbTUy3kqBxnsCO/ZoKAyNDF6Qs4+R1j1tA
	mPx1MB/F2GGKPnZLb+3U44bL08abUrLxYPxMtW7fHoyQs2b4HyRqIXiGEd/t0ltO
	ZGhs/6Q+MpwEabC7tGdQufUlVRV6sJP+ehzPwVVcVmCKLjDWo0jCyJJHT8wv3zJ8
	ord/ybLg3FL0oXP+kVOedsamRdvPQO3ewKnaSistx2mQRcqeP0JPRjApfY93YCEM
	3HZskL7d4sDRhnekcIf2Sv6KulyJH2oWJmA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4k69hh9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 11:11:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a153ba0009so4522195b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 04:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761909107; x=1762513907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8jmHsfI7j3mpprPC9vCGVH2KzWiYloucUYA5jACBSU=;
        b=gj4ru+KAMbTTx+9i0wBrpnzdJpT5nul7B2QvkPjBy1EyipL+W7lSo0zzKOHKxdfaLF
         EQC1LY0PcNhjZsEGnnmMVAUKtRY9Mzhf3vW0cU67/aXr6H+0oPd3J3g164qQUH92vI+S
         qex8zvJg6a36jQ99fLs4HZWCTHX6R1oPRnAWyXqTjqUaqnd7/3RJGA/XIOHcJv4CaJBv
         w3wQ+6XDDtzwF1IfbUA+xgNZ5jwqBGq4tx0cRxGRijAzwhK7gjZlbN/uOao6nCGaiLmz
         U9l3sM/GIrhgXr9itId9sbDQBPSa4+hp8dSdYKnvkrIr6OhruJq5O5R+o7eXOPG1+Wiy
         bjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909107; x=1762513907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8jmHsfI7j3mpprPC9vCGVH2KzWiYloucUYA5jACBSU=;
        b=MQnYi6RHvz5FO77aiKv3M+CKwibp+CdCxNFJMBrJnDk4YKKBMgrWZLopAC6ao7pLWC
         eBnd4JZtetXTFZqCSmA0txx39qrghD/7qQxubcK3j2qGDPZR4HfE6X8yBkw8INJeDdrT
         dhK/SN7MHUVgEx3pNGrIMn/kkPMmjKg5fExknVZA1TnpmiQO9Ttxk7kVa5+62dQNkqKY
         wA7Fx2TGiit0uvrJ5FsVO8Bc5cqEn5MbyZfTfzRVwhmFHDHFaqyVENgG2O12h/Tegko1
         23wCfQAPo0jNp8vx+qOVlymoB8pJW63RqcJ5U0LUrYtq/PanoozKNwMU+GLIoCFSloJt
         Qr5g==
X-Forwarded-Encrypted: i=1; AJvYcCXdX+PipBj4hTg866cPk/OwEs4I/BlowJctQuwsfjLOe2ki+Hhvi0OOk02drJYlw28czHZ2wJDvBjG3AgTaZ66v@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Q3U+NFqDsvDvylUy8K2U7zYUtzM5oyT3yJppuiBrrGG8x6ep
	sBaTbG7K7SgsssbB+vjjcUve/GjAkwczcnGhj5Q0K13wEK7XC0Xsc2fWsR9z1hpwBd/s8DjeaHq
	Tr+WVJB2I0NBd2M8JxiBAaGk5y9zhYZrM2fw4sDpzcvrJ66G9p/DSTRgsw0pcQNPCQZYShay+Lr
	CEVA==
X-Gm-Gg: ASbGncsXSF/AM1ix+JEaEcPofj+iYOONVs2+rd7M6Sz5xiuNhVlNN3E6WD3JPsH5Zif
	P4SKQw/MWVIFsq+rFGcAfx7OXaRFbPd/cG4d8WUNaTg8DkW6oqEvRLelx8WUb4fRsBqdCMn0tKV
	oQtTxgF+VnmYSkQrpAAyqzpltO91hfDaKJGRqR5mWWACsZyJtYjZMJWt6XHzVlqjcG8901g+Z1D
	TaWg1KOCfzZmPw5Xeo78I6FH9x9xTxJkYXNMGmWhExcDDPMMOdbYqQTBoc5pEnOqERO91OvjXXR
	2ZPaDsRy7rGHNiN2kEMyqCXm1LrC0P7SMnAK+mRGD6LswPQZQITqqU89jnaWbrBhefiKnSs8Iw/
	vsQsH7kORS1RmBKWzemLmc2FoX+5eb9roz1DVRJQJiJs+tpl3bZ4h
X-Received: by 2002:a05:6a20:3d8f:b0:334:8d1f:fa8d with SMTP id adf61e73a8af0-348ca762efamr4261441637.18.1761909106550;
        Fri, 31 Oct 2025 04:11:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3afHY3dtpovWcwdTrIQcCAO+PFFAWXBTqpskCU1j8Lnzsmy595gMOOo6WBgKFOobKc8G+0Q==
X-Received: by 2002:a05:6a20:3d8f:b0:334:8d1f:fa8d with SMTP id adf61e73a8af0-348ca762efamr4261385637.18.1761909105915;
        Fri, 31 Oct 2025 04:11:45 -0700 (PDT)
Received: from hu-punita-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b7e197cdsm1804407a12.4.2025.10.31.04.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:11:45 -0700 (PDT)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: Punit Agrawal <punita@qti.qualcomm.com>, chenl311@chinatelecom.cn,
        liuwei09@cestc.cn, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: acpi: Drop default console log message when using SPCR
Date: Fri, 31 Oct 2025 11:11:36 +0000
Message-Id: <20251031111138.1262202-1-punit.agrawal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwMCBTYWx0ZWRfXy23VNZnmcGuj
 Eu+hY0TMY9Kg4BjZLmfFisbNwj/tjoy15zRvfUQxPSJa0ofYSe8LknLCo5YOEdQ5weAysndkUyc
 MOl7QxlPdJRlucN6vo1vh/2q3qxUOIPlEtYJJEgDlZm6SKYsmWdTXJ5PAc1Zph034ofWAvF09vm
 zkAKBMA4Yc9REWncvHCifCZmmUr8drqyF1lWeAjaWCYRzzuFmDfHlLELPDxGsPqE2Hmd76Z21QE
 CgxSLZlzpJGLdK61qI8TLvrTJdunMVKt9mv20P2UaFV4i3dwyjG7RQs65g2MdZQZdZSW8Ps+0AJ
 EicqkCazk3AQ4u6CmImensNtrdD8cKPNTZXgWivxoVI4UYCak68w/aj9ndv4wyoiUoFJC+d1Hmi
 d1ZDZ635LaM6f4saG1y+83DVSDZgIw==
X-Authority-Analysis: v=2.4 cv=Bv2QAIX5 c=1 sm=1 tr=0 ts=69049973 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=o1th0WQ6fIS9ZaslAAcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: UWKWp1yrmhWpk74GUvVRU9DGuzxyzo-F
X-Proofpoint-ORIG-GUID: UWKWp1yrmhWpk74GUvVRU9DGuzxyzo-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_041149_577283_AEC6622F 
X-CRM114-Status: GOOD (  11.38  )
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

From: Punit Agrawal <punita@qti.qualcomm.com>

Hi,

Based on feedback, I've updated the original patch[0] to instead drop
the default console message when using SPCR.

The first patch reverts the incorrect assumption about the return
values of acpi_parse_spcr(). The second drops the logging.

Thanks,
Punit

[0] https://lore.kernel.org/all/20251027141941.3089914-1-punit.agrawal@oss.qualcomm.com/

Punit Agrawal (2):
  Revert "ACPI: Suppress misleading SPCR console message when SPCR table
    is absent"
  arm64: acpi: Drop message logging SPCR default console

 arch/arm64/kernel/acpi.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

-- 
2.34.1


