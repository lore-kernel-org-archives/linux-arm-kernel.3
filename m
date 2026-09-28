Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B60C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=; b=TihHlz04tXWe2yKUzKXvVx0wyo
	udWV4qWYwqxI03wmkmjUeXq3XtvwGM0k8qgz8FiM6AmydKejh3CfSsImlbaO60Ua3/rfG1RxPy0AQ
	6WMY/oD7ad4YPxyFizcNPVfmaPLQQp4HbLD02wAxoDTfH2nIFjXncRoNvBxR9/37YG9pi2jA/QUmS
	cgqLAVU6IQ9qPlBH+6Xwv91Jc4TIOQWjUfFhulYjezjkofciFNFFZMskaL1sF3z4kvForpLr6rFQF
	V5QcUNs6DxoUDYq/eNOudd8D9Mi8keHirXqsMBbHVkz0XKJdDduI8nM3Ec12nwhJVgT0bdQe/o1rS
	QJ0ESSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5By-0000000HUDX-1AVF;
	Mon, 28 Sep 2026 06:50:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5Bv-0000000HUD7-1wzs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:50:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S61aBh772114
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=; b=LwYh32UwulbZf+IO
	jFpCE09jsSD2szNPg9DkANXz9m8kUMETxG9LCYtzMzFpv7lXFMdde9yaKbrwB8TJ
	7mGM3a4wiI+DpvtiWB5qINf/U8sPmxkjCx1rDH1dVdNrjesQJ3qeY77zovnS4CFU
	8cn37vAhe7RtJrXWeHGG8uZyDhGYByHmyaHEMeFm2geFxnhczHnnUj8dRWe19S7k
	XP+XmRukowi/i3NrMXGm4tULmhijwPT3ALAlZcwO0WFWknGQKXpaGR6cPfe6jCmk
	l5uPUVagub5ceP9pvs9B2iVuUe3cah7FIslcRPpFSKoUPCKTdmU890NSDPMqYkU5
	r+wmvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxg51a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:50:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8823fb254e3so30860b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790578221; x=1791183021; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=;
        b=GKbHV6zROlNk3mF4x024a0ump5ZQaSqL6Cvx6h9juUSjfZr7xkI0uqMFG/aIIwkaeG
         Zyc+TfTa/cLMpU9ywmMD/mfXmN9fD1pgsOaluqcfG/1Pa0014oj65PuzxwtlZ69jr3p4
         6LxiaZtjfkkQQxIuvxHvEBq5f2iQHsMBLpReUz9N+nbc/tfhMqyydvF7sO8vN3ol0ZdY
         +AAjZRVPTtUn+OyU0FsOUlKfg0258T6PvaZ+YOA/jgjAwbPo38zL/Jac0ahNqUyfVs19
         0t880AdMz9yJ4OvEEmUrrHhWafL9MXjJS+veOEWaKYsAnXxkGVxUvdHzEaa8mYFCrF6M
         wU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578221; x=1791183021;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4OUbyzBVRks7k0WbMnD+M/l6sliOO4VjgKoS0xSBAbg=;
        b=cvda9X0tQA+j53xuZ8dMN99M8sVCczaOG+IRC2pucPoK2fZTpa7HwPadYUqbmQPQcB
         GKd0HoL8tIt86o8TnvYKfwjxQm4KkjFl9LbLf1IZAaQzW85EXJm64HtncQlv7Xtcu4f9
         C+VFMZmZJ5kinyWyiMIj18DomRXrcn+HA1v0XCukGFUrTzsMfHFn7oP2nsCEkC9zsnpr
         4xbk9yWWsIoNhVkpiD/OSPaz3XLptnpaxfpafAZf67OKHcTCMdxrXjGhvvf8H2M+9BDE
         Oh9lVmze8+iYbQ2XSQRneEcYXetscVFw/CsMzBQ1NJTkImbsr0ipT2JwuyJgi3RHNary
         dCZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQZlY9TZ6tAtFH9MoLle8srKqerUpGPl35OnJuZ1zcHNybTXeNvGdBGhXXxOKOK2WQLkcO2ZRjAbGWpxhsn1Cu@lists.infradead.org
X-Gm-Message-State: AFuF++lx4mLV9L/DRRcdGsw7nczjZOhCWjBcyVrgVpRCI7i9FwuW5Yjq
	5K2sNOC+HlrljCvH+S82rapvSZFdInPzDuuMMceE0aVcZSz1jqGPL/1pe60Yoqur7igTyUkRuQD
	Il5z7E37a2s3RmPi9KjbkZP0XtvEb3rGqEQB+lKsCYqacdUs6i4lC/Q9zKbRRZsajaLmJ0y9/HD
	ICGQ==
X-Gm-Gg: AYBFou3BoZ4n++8S/MQtc8qFJxoizR1MCbeUPoADYFLfRStdGWLakcUM1AtG8LTzviL
	pKu6i6Qw/REpQfw7/o4sZebAj8CJZPqvtnYlOlLOL48PrWbdkz0uqPXrQ1XQXnEAdOPspY8H8+X
	VJY2BRS70Oc7O9geHZ2iSSbnJCPXxaCnOdbhS2vhY23xzvpx67w9KZFMIGuYJg/7GbVbPMApHQF
	vhw4585nZULlSgpVjcXiRAkeK13lfn4E6VJyTRHZ1QBHySuBDLpkA78Z6kF6Imcd9mcyrfzrnI4
	yIr1IMEcgQPJQri0hLnWIGPc2hVvibAbJx94wPLCXA+FaJLcU9Q6q6+sSaoxaE5O7ZhLgNLTu6i
	CKQnnhyqjCrXxKxR0k+hWcxYp
X-Received: by 2002:a05:6a00:1488:b0:882:4ef4:8eb with SMTP id d2e1a72fcca58-8824ef40e06mr5035239b3a.1.1790578221270;
        Sun, 27 Sep 2026 23:50:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:1488:b0:882:4ef4:8eb with SMTP id d2e1a72fcca58-8824ef40e06mr5035201b3a.1.1790578220721;
        Sun, 27 Sep 2026 23:50:20 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe81f2290sm3633951b3a.5.2026.09.27.23.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:50:20 -0700 (PDT)
Message-ID: <9760cdc5-a2e5-4522-8e2f-3daba8331883@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:50:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: Document GPU SMMU on Qualcomm
 Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Will Deacon
 <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260830-maili-gpu-smmu-v1-1-253e1108ce82@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jKv_11CPyUlyST6GfsKJQz5RbhEqQS8Z
X-Proofpoint-ORIG-GUID: jKv_11CPyUlyST6GfsKJQz5RbhEqQS8Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfX3QApL9DM5dTx
 IFZNuMpUXDJtnqjj5gcpSuY8AeYlZynBB5qmMI6DTq2gbSCERt5GwOCj84QdwLlc087jcbnKr2r
 He+Qy4+Rb2+w3Npa3bUtpyziBh80d7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNyBTYWx0ZWRfXxD95xRxfUiL1
 +Vivxor8hvGLqnFuMb0+jWmI7HfMMrVhCq1Z533gc3BIaOMYuc0n5BEhxb4XOv29b8G/C2qGbE8
 nYbpMUAMwfCBjraAkcZkdq0JLtp2QJM43Mj2lR46yt5r3u+/nD23NlTbZ/qMu9i17gc9GzyzYIB
 segjdno9MxaNdPkRMCAkkDcOIpM3vnweSOO0T8K1ANF9F2UjHFiBsNnbTU2QQ65v9yk1u97E54w
 VW3NZNbbK9kJVLzaNFsRNiCkdUWHc2a3BeIWPcw2AjpMexN3UjyH1WwPRVijykerker0VpAtqv7
 4GQNfJYdueq8c0vBVdIlOeFA2eqGJUnLkIfrpytq2rTOF702zCPlyXy587I+AbjkW/bHi6Tu5zR
 GJPb2R7LBK1Px5XPag/sFXtmFb7Rszpp3HjMIaJYXH+ksISGn5F+IryhmzvLSNOSpHJ/eDLn2hc
 r+cV7rRasQ4vUvLalAQ==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba0e2e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oR-CnN3JeSK-wwzircoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_235023_624826_E3B73935 
X-CRM114-Status: GOOD (  15.46  )
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

On 8/31/2026 10:44 AM, Jingyi Wang wrote:
> Document GPU SMMU which uses "hlos" vote clock on Qualcomm Maili SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index ffa33b7f4a96..187710fcc567 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -101,6 +101,7 @@ properties:
>                - qcom,glymur-smmu-500
>                - qcom,hawi-smmu-500
>                - qcom,kaanapali-smmu-500
> +              - qcom,maili-smmu-500
>                - qcom,milos-smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qcs615-smmu-500
> @@ -579,6 +580,7 @@ allOf:
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
>                  - qcom,kaanapali-smmu-500
> +                - qcom,maili-smmu-500
>                  - qcom,sm8750-smmu-500
>              - const: qcom,adreno-smmu
>              - const: qcom,smmu-500
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260830-maili-gpu-smmu-33d20c1f4672
> 
> Best regards,

Trying to be a polite ping here to request apply since outstanding
series are waiting for apply of this patch.
Feel free to let us know if anything is needed here.
Tested with below series [1] :


[1]https://lore.kernel.org/lkml/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

Reviewed-by: Maria Yu <aiqun.yu@oss.qualcomm.com>

-- 
Thx and BRs,
Aiqun(Maria) Yu

