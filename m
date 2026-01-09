Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BB2D1680B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FX3/e4Bui7do3TpGHWokJutJxg3+CkyJAoSTy/dKC24=; b=ALNo7QKm3Z4ON4L8FoRlNTqGAZ
	oyzooMmpJU+xG90SEBVod0OBHUxLgwwPRJmYhFXl3Qqi5vuwin7WExHkhp/NLfzhwEmjgLpn4Eo+R
	TRVPO1ERN40r5LeFOj2KP18dsOCYTKOwL63ek1nYo6gaP5HqI8z23X5U3dZq2331T+U+q6oX3evVU
	CaYoW5oVgJeMHYRGP4AGJmVJRT6owA3MPzxrIliKRpQfNj2U1kdBk+oPQ+usicto3534EGsKPNh2n
	cxSxSgr2mgkG08gOHjGhDcHOOhCqhqiWOkJAfu4qfS70C2wjtn8U3RgqrtkjDbsjbTGyEXDaBiBk0
	i/biSn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veA7s-00000002APj-21dJ;
	Fri, 09 Jan 2026 10:53:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veA7p-00000002AOp-27ik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:53:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6096WExl3142492
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 10:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FX3/e4Bui7do3TpGHWokJutJxg3+CkyJAoSTy/dKC24=; b=Tvsj+KOHvVXjLTob
	/OtLXE9XVhfY6MBxawp+V+KmOA7nxQW92MFSWjTKJKHFX2UuCvVFlXubT2Qq/fNa
	vUw3RK17dQvTphfoxqldvKSuQFqj3JpTcm5uTvpzpnfB+gfgYkIil4+trLdHpYxF
	wz+3fNRGk9rMDlNx/MYJzSwizEOu9M2pQRsbHlxIdiTa9yPuJQxvaC14qFNwZmNK
	vQjSN67c4qMtL8aXWBdr0O+26ftxw0U74aqjXxyUP1RvLOlyRAmMMvU0FNfGgCuM
	/VHSsBaMDoeZ3W+5XghYPf1XHM/dm4F5ejD9rKcf2bBlf8y7xlkK198AZSsuy2Re
	tDuVJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j2c3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 10:53:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so5303591a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767956027; x=1768560827; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FX3/e4Bui7do3TpGHWokJutJxg3+CkyJAoSTy/dKC24=;
        b=cVVnx1zN17BYULTzgmdxnwjsRoyaGuuMpeLCkmYgm91zLrtpsdqvA0uKx2uCboW7CQ
         Lrno3ulNquPVziHtNX3KtOjdSWj4lms0af1ask3rPTbH9ClBWvliXPCAK83HUHYNWWnI
         MPIYfDbYS1rZnWzsdyincrBUchtQOJsI54r+wbMMJK23XsmjDoDlj4vtT7VqelQ1s5Xw
         AUE1OYD85ZbJPd0FypVXYXeNhbyPb3ljza8Dim5gw7Likl5ZMkGA/8nvQAN+IDjGBi6n
         zli5PgkytMqoW20Z1ukb38pwbS3QPUX/+qKf6uLIsdd8HazeNKRsPizNvoH5C11ytRf9
         YiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956027; x=1768560827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FX3/e4Bui7do3TpGHWokJutJxg3+CkyJAoSTy/dKC24=;
        b=K0oiKlvSKXY3CGb1g6l+WJi21TTMldTTZ1s1UTE4rQrUa1RK+VqMorhJTk7j+n5Mzt
         VAS3cnv7+YqbG3nGa9GHJnj7K1O+YDtFsRb4LmMgfKQSYwNHtsnUxPoMx1qTw0iD9weE
         bWurB2V2BxWttPmjDVVN5bHibqDLwzoudR/19claauw9bB68Gw4mqKFBonSob1kL3+wj
         laJXT5ljDvSlfvcE7ZNyJEm7bZufOJjQFJ4KiZrfwvP5dK8t7vLMYCee6eLoxNVR61ia
         aGI3YA7uvXLO8f478xi0R+q+ur0dQayb+nb/T1FxihVAWMU35LZU4oI79QprpQFHSfPy
         HLIg==
X-Forwarded-Encrypted: i=1; AJvYcCU5YJZNjGMjedRZSpIAPGrrT90TxZSoPe3eJdMh3S/S7qQJXrjVf6HCmJV3lcBf/0SQMvnMf9b/+8IGfjAPVZ3o@lists.infradead.org
X-Gm-Message-State: AOJu0YyqcYFOZTHgv1rJZE5R8SZyW6ThyOh8jpZL4ZaBiT5dM9Hx3s2i
	NoU7s2Znu/msEI3mA8YzxiwwiAylBrG6d+MZzqiHHlwVOCZEmyWA+fxGgUlu4tEAzivFf8GHPB2
	+bCivDNIjgcrFLkIT8j542RIZfCWHeLo/K8URR6zUMdH5Sj2Bljesmdz1y6ZiSfdQFJfrAkbSSf
	mLQg==
X-Gm-Gg: AY/fxX5wPs8Gv4uNUa5MyXyI0EZfkLvmkBQzzj/70J+Olcr31pJuIVTDj53vNQP0T/q
	b5B6g2SZs+JzZ56mq+i0EtXj55TdYOvO2AeN7Mrl82lQDFLvB77e1+m9L6e8P2ny8qdqeYGT4zt
	ECy/5zP1kNL3RgjciDWbLffJGP/ihO4tcuK6B5naxFD2fe7xIQEhY9Tnuppw8hp36j0BgaY72nE
	3wl+c4gkxzu8huI8jPpvUjvBVcPZoSqy627euQXJyZV0KnZXyxqAzvcWsDNekDyJElDeJgetgG4
	FPqslLfP91EWidY0cNwzyciVbWbviy0N2BuoP12KJvr/ZnN2egCAHtEEcvKV9WfXwOxel8+IfII
	8ar7tBA4UhoeOAegjn5Rxy4SwywsbZiuDQPpvGZ1EkB2oaBeFn60pm3L+JqK/rWt7XzON8Dd7Eb
	M=
X-Received: by 2002:a17:902:fc4b:b0:2a0:9084:3aff with SMTP id d9443c01a7336-2a3ee509c6dmr91959615ad.61.1767956026657;
        Fri, 09 Jan 2026 02:53:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErzTnVlKE5xwARBJIfQcab8hKCQtqT+guI2WKRBtLVTc+stAGDCN+noJGv98gsdAal+Av8QQ==
X-Received: by 2002:a17:902:fc4b:b0:2a0:9084:3aff with SMTP id d9443c01a7336-2a3ee509c6dmr91959375ad.61.1767956026188;
        Fri, 09 Jan 2026 02:53:46 -0800 (PST)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm102526905ad.9.2026.01.09.02.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:53:45 -0800 (PST)
Message-ID: <4370578c-22e9-4af9-a4fb-e87a8cdc117d@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 18:53:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OSBTYWx0ZWRfX1PypQQL6QJ9j
 GIR7sh1xXcXAMMPvPf8spHaHFoYY4p/U99WcDbAUXNPgxnjw8hCs000xmZNmxZgajSLBZ5EYPKS
 GzKscT9ILdklVZUTQuF0sCxFy67vXHizKIYKUYRdyXikHcm31zuyolDK6NSez3wXw3BV8HOqY2i
 o9QAgfksHC+sax2ohebVplUHz6lxqYJHrF1OE7TBtSG2VlYfcOYH/gwHbX11d+Rm4ZEaRz04zuI
 E0+wBD6JeYJ31YIZo61CPJzCMvhEkaLEqTK+X8wrr3hoQ/blgZNuGa2mK8yoawyVbvMP2UJoFbx
 L6SV2EbzceMmjv2cTzAczzp3b13IsCHtrHbBrglBr2MtQCToQqTaQaRI3qzOMTeKRP1DkaTT+gL
 uBHesEBmejJJJ6RXO0Qtz6Nu24w8ggd3S3PucWj77ovdO+xmhqOHU4PbcSsEfeUY+rkzD2Adeof
 2pgvxrU5ujuDffN4HAw==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=6960de3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1asyLrDfyG44IMe3nHcA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: U7Nqs1fKid5PcoX1rgpKJ2LorKMm3T9W
X-Proofpoint-ORIG-GUID: U7Nqs1fKid5PcoX1rgpKJ2LorKMm3T9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_025349_669999_257EC683 
X-CRM114-Status: GOOD (  15.16  )
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



On 11/6/2025 9:57 AM, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 

Gentle ping.

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 460f38ddbd73..57dede7a90e9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -29,6 +29,7 @@ properties:
>       oneOf:
>         - items:
>             - enum:
> +              - qcom,hamoa-ctcu
>                 - qcom,qcs8300-ctcu
>             - const: qcom,sa8775p-ctcu
>         - enum:
> 


