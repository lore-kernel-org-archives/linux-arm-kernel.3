Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C47C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YorCO9U54gBbhM07YPBvezJSmHCc/9vnYs1YoAkAYVM=; b=LjSn6wRsyVrep7zH47xctUzm/z
	xAF9/TC9mk1XexgxwL3sOFnj/tSZWhmN4/fRWoY3FYcQjMwULzH/xkAbx3MBQx6KuZ8paAAn8XRYv
	Zan+8fga9NqnDJRmWp2pDJYHy0necRhIsmdNwZPZBLFMiCDo4AMmDNGT+C2WnJSFTrwJ7Czdqp9q1
	EEgePZ43uaaPQhwbD2NKhRwqcHI7H4Nn5PvQW+9plIx+4DskyWlXOohlQK07IjGCShp1uFa3qV8b4
	yIaw9Og6V/e2ZMe1XBCn2dcfuQkaQr945IxSYo3TYdRnYv7ElYERRsPuSfcOrL3T6kTYr802FRQyS
	uW3rSd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Iy-00000006hpN-39mD;
	Tue, 22 Sep 2026 22:49:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Iw-00000006hp1-3Bq1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:49:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJDU2m1167811
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YorCO9U54gBbhM07YPBvezJSmHCc/9vnYs1YoAkAYVM=; b=f7DvbwpJMVDR7TMA
	P4ihPwzr1H6UYxQAMTawgCVJKNVtvcx4mE/9wflDq6mZ0GzO12c1imrLERwRAkl0
	nncQI5NA2EGyXi+9w1GA5++uYr04LbF5p+Ei/e8yy41f9Blz/+Dk0fDN45qgW6/f
	fTTbV5ePWcBvcJrC23PtMtbinCFVQvsg0JEl6VxcngSydKegP51NJG8iEOEcBlc/
	w5XpibGZsyfPemv/2izCojD9X6Zy802NjSVqZGkuJuiT78BcSIgtN2yz2UvN1X9T
	dJfdZ5+yDZS8CMMGUza5KrTYsutWQFYdXn74/ZdNRWbJXyDYyRKZ7xjTtIWufkUT
	QN/Cpw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0y2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:49:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33bb08e80a8so281015eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117377; x=1790722177; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YorCO9U54gBbhM07YPBvezJSmHCc/9vnYs1YoAkAYVM=;
        b=SBcFtq79OCxhpeLMmVODV9aziPkig5i5vAjkHnRgqD+fcAN+Vrl0tOp7Wdofb6oO0Y
         HVZDSBDhaN/WclEwlTrI5TBjTs6lmmy8/S7urbyZ+XYHYigniR/eP+bEHGn9NylIHBAh
         YthacMAjvWBXOfo8dc1P6EcGyLY2bObsXxdjlyDp1vSAsNakxCyBTUsyrJe8J+zTrS4t
         FvW/uOAc7UKxhLitXp5Im3up4EafSWH3lASIJtGrQkruyYkyc4aM+zK9Jb/Xk/FvQsHl
         HwTC7tGTeSdDxnIqb/xfZwRswee7c+5QVPSg3rqhSSEWIQ47HKoW2cZi1t5emVdwN9gU
         /rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117377; x=1790722177;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YorCO9U54gBbhM07YPBvezJSmHCc/9vnYs1YoAkAYVM=;
        b=J/XGZqg9CHJZUogmNQFFSvqOzvBkqezOnobGEhnKH1xPfOYYZFICIN/Oo/BYkrDDFn
         VL0n2EV8UUmwImO7oNQRZKshqY6GGXWs6C8ov7egBwzS3tUqSykVss91WHXXatIovbBn
         yg+PyUHQyREQ+zoF2PlMoyuqPJMR/BYN45CWTHI59B+o1M1bd9ej+gh8ebhVVYNE/0Va
         TqnZ0eh5dziYKcg9YjO9+uqDj5NntxDOXBrlzGQmqC/U+p8j4evCyzokn7kulHgs8ZaQ
         Cwn4MVBCae7/axykzu7L/AEeYEF6LJUwTbJBdU4dGIhOpzqqyqYjttZgs3iuetfW8A4r
         QOsg==
X-Forwarded-Encrypted: i=1; AKwUvBy9uO2o4xci8wqbl6YPuXKlMfBY/5yKZo13/bwHXIso8lBDL8LxA5HgIZ2If/h5Ly8b5n5ZD4ti/vjnu5xNF0NC@lists.infradead.org
X-Gm-Message-State: AFuF++l2UUZl5k/Rsbrb8jZcTkczP0YvN5Z9nqSwtbyD4c16pbc5B8js
	Oh5OSTcsobOBlahGy7P2D1wDQ1BpnlBYma6OW1Kt56iJF3KRwhUH73089MXikCcY2eNaAV9f/zv
	QXh/fjAL+cAAONc/6/Lgtu/OhlXkragSldP1qQCDOoCAwKM4D2egwTp3a+QxT8NcyYr6UnrtsTs
	W3zQ==
X-Gm-Gg: AYBFou3b+3rlbkKsn0PxWVPfadx93juI7KkFEak0Do03yxShr+v4DUx8mOKtHEs7puw
	umqc2fFYdZF6WSDjnbN5aDmU9+nRsjzfZ1VIqFeNRLaYOPAFloCHinmn6UHVru9W/uXfzg9ukIl
	teLvpFA8f48rVyaDNdPk7jwkP0vn23eKLniJPtsiqRVGMIpgUJCaSawHAHj0sKG94uUk5XdEacC
	IZ7riRU5azObcHFervsQMBZhGuX17xg4J+FRgwaUx7jsieEjF/nSzUAOl3pkrFg+AgzaXzkf0BJ
	RGfcTKRD6KElGMW8jVghkbY0Jdwti5cR0rLw57gHZLnBjSngsoU4PogTgXmfLWGLASar6E5eDnv
	zSzQ/VFpJw+Vc650IZfrlkplA+2K2ueIUzIxj8Tv2vXOBr1LnsL4Kqjw=
X-Received: by 2002:a05:7300:7a8d:b0:33c:1941:8f8e with SMTP id 5a478bee46e88-33e5ca9fdc9mr916118eec.13.1790117377256;
        Tue, 22 Sep 2026 15:49:37 -0700 (PDT)
X-Received: by 2002:a05:7300:7a8d:b0:33c:1941:8f8e with SMTP id 5a478bee46e88-33e5ca9fdc9mr916091eec.13.1790117376769;
        Tue, 22 Sep 2026 15:49:36 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e939fe502sm1214322eec.2.2026.09.22.15.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:49:36 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:49:31 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 15/20] KVM: arm64: CCA: Introduce Realms
Message-ID: <20260922154931.0000171a@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-16-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-16-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfXwIsNxmOOpPLP
 s6Nhndy3cpR3ELBHOqFv5UHAlIVhoNvEcUwQpbCBnJlVYf/fqBjLoh2epp8W6/62ULmvq26+opB
 WJkvPHX1GSKfhTHuz5SDkGFt1xYHHqTofVKab9ZN8dGRmues3rmzTJAlFMYxrlrWCebyQew48Ph
 3+pydC4SwvBEVS+DYZUJOPYwbeBX4vtorMkOt5Zv+eu4XLHMLwFnpBwqPOXj82+/s1QXveBDc+l
 SZfDjbVsm89wJlim1iwHHZqdVZ2PcFknowtlcKob90eU4qsxzjysc8OD/8W0LE8OBD6SOwGDJND
 OdD2C2na8z38E5CyDmFt+9VR2I/oXzFJxN/sguPCw0x5EtaUY3qE/5q0s9g/ryuzflAKXtZHydU
 MOyn9d3B6oPdefQ7rib4xgLBLlJA97vlOjn7oZwPuWYSB3gabCvUQYMDrgtD4Utvr+y7zwzLeFj
 55d3y8Oizw6BAynnenw==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab30601 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=1xClAnr3vSIPrHROFcAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 23AVnp02HOrKpQjc8zTPB4l9QN7PHahT
X-Proofpoint-ORIG-GUID: 23AVnp02HOrKpQjc8zTPB4l9QN7PHahT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfXzh3dcnUObQIF
 qhpePJmjCzkxs2we3s+iEFxcw7daTxkUjjubwAU1d7oEQPSMW4WRtUbq494K7xTzV5ovu+XT9PY
 atdKlZf9GJHBI++5VEi+DjNEE2bVNmQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_154938_830318_C7408CCA 
X-CRM114-Status: GOOD (  16.50  )
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

On Sun, 20 Sep 2026 22:28:40 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> From: Steven Price <steven.price@arm.com>
> 
> Add foundational work for supporting Realms.
>  - Add a new VM flavor.
>  - At KVM init, check if the KVM can support Realms (though not functional yet)
>    and will be advertised by static key kvm_rmi_is_available. This will be
>    turned on in a later patches, once we have all the bits and pieces ready.
>    For now check if we are blessed with KVM_MODE_RMM.
>  - Add realm specific tracking in kvm_arch. Since Realm and protected pKVM
>    states are mutually exclusive, move them into a union.
> 
> Please note that we cannot create Realm VMs yet. This requires further changes
> to the UABI and core RMI driver support, which will come later.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Seems like sensible infrastructure to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


