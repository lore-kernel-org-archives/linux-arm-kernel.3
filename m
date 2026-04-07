Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788D0EDB7F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=; b=1+1ItOxaGRB/+XIAI8YgQuLu/4
	qMqO9OOhDuM+cvaENT7nnfbMwE5blFPVuJlm0vuUIqdN94KHKMresYVExwdnWvmHaiQpwX3C7W1Ns
	xykL+hvm1/R0G8T5Tqv6W6/YkQlMCCzL/9nqUyoFlG7XtiAUXyNFI/Bczhwf04Ud5SCtqG1cpHIAX
	XIP7JP1l8nQ0NBAu7xqevUHFeR/PCLZIBmPb6tpUw3kVlwu++VxmxAfn56ZI5JehFyDZhjYCbm3ch
	c6MfVWQZX8n7qw9eeYqB50Te8hJM/iszGhd7f3gIroD5jPuBRvMsW+OOvtObnnWHRgde5JdJUuLGd
	9gUehPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3fD-00000006Hci-2T3q;
	Tue, 07 Apr 2026 10:28:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3fB-00000006Hbt-1OtQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:28:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376gUMY492494
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 10:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=; b=KADg3fNvYPYMbE+r
	1ZeLX9q29d8XSNFBedzbzdBmONEcR5M4PmwblQVNs36BQ4uMEbB/JLKWbBQesEwb
	u6NvwsAKtxMr1eN468WpqZ/Vi81LNwO3iLwPf8snpz3dfR9BeyPQAdyJEWS3p+tT
	ZTz0t6qsqegeQeT66dUixfujqU1Dzvwsskkc8EuN8QgeGLWtK194pNnN+DoXc04n
	FgYCmPtyzG/mAGv3otxPB7qta5zusy8freIErrQN+TIJhigYgfyc8jXEZdswFZ3j
	MspNR+W2QgRTe+sf/+T3V7/JgoP2BDdAUUeb5sg3WkGj122gxKpkdGFFsK0h7mjG
	j81HBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t8e5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 10:28:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so20079676d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557684; x=1776162484; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=;
        b=dMdsveUzL2i9XndpqaULeIZup7LTEnuMvTz61CcaUFqNl9C8kZV8aM4WjeoExeWKfz
         53N4dKnaN6Fq/lJwRTVTQrqEp+kkFVW1IunaBro8LhF5ROsuuev1d7qhhgybMBoMlPxY
         98Om2inINwtBtXQPcKtCifNo3+h3wQAICKXtsQaV2jC3osCeyrHi5TIBJ0FNW0AypVMP
         5ilddmb20jcdSp4P9dTIxA1JjQnn1kAkG9gFgJqqt3AtfwnLdg4UGbH+3AyuIpIcaDQv
         zobyGSKdQqF77XqHmQpFvwI8jQcZhZFCJFfcAUD4HOXlKt8heKT3hsqbhuGd8kgqA+hV
         eXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557684; x=1776162484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdxD3dXHf9v7B1spgG0Hozv6M7VLoe1/5naDNyB9xr8=;
        b=fGpcAlvt0kCMO/ns9eOtGaFprWqww8vyN5bltF40MqrLu7PwPNg8oAM+mECTMbQZH+
         tBi4WDB5bW+rWeuWVXfCY0w6RlvIK3oFcYhImVh3ELTCTwUhDLO1qoSa9ScrpvVAtt73
         HGAyCrKUk/awqHAY0kqtV/7SAFsayJJmO+WXDfd/JJLDB7cn1K02jYogX+V6ypHqxhA9
         d6YDoBxe2E+LRlk2i7rS3QSFBQ01A7ZZUrGlPIMP8bAlu1fF5IJSGyJ1k5W60xezc3Kf
         vyKO6V4AjQa56RwpvTe0SfLpFvW51ICYCYOTcIV0OasHut29AxZOgbIFttpUlE4La6Mb
         SPOA==
X-Forwarded-Encrypted: i=1; AJvYcCWeO8MokJnkDSIk9JN3KKZHQtPeSvQbjkO2pES0P5ZR9mAHbIGnByKF6jg100S4xn4xCbTRD9q6L8upCPF6i3h8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8MV7iaXtapUq/ENh1hPInBSf0UjHG9204XWRzSsJccphrf7y1
	GX5pExd/C8hscBChht1j04dQyX7pfbKr5FwLelgwQnpitgbKN3laWTl6mFSgD+HD+MYHtqsBjMh
	b0s7Gxs/jT5em5U3gTlgjcosmeUP1ZAoPqy0kq/5l+zyJjBphqz2XQwvtjnuScQ79nugY6W5pg1
	Tipw==
X-Gm-Gg: AeBDietmNogxC3de14VhkBlc8LoSYXKPLGL/T5HQHKl7tqaAiSVjCHgg//4Ywp4s8OQ
	q1dDi2knCYWkG5Iuha1zEqo0DguOV0If9/2gOXbSH0ZDtUAajwMWix5luhKdQ2ZFsAuJpeht2Gk
	Sjxtk9CKxm7xxKbIPbRkiZMpfGuhVZdNTOxMiWAHnSj3/n1UoVhKm/6Azi36jqe7BzvJKrB2WZX
	l/MX7VDw9VyObOGOiuEuHqAWq68XAY7Qw1pDTRcjea7vEwxn00opIqqENhLCBQx/q1dkkW7NEcS
	vTJEz6Fznj4tgRBEKaocrvUk+DW3Ssan5KLY/j3YrnIHq3DA+FHq3Adp8FwqUTjBzRxCGYNUviA
	0yNjEeezYm/NwYFxpS/f3BfxsIag2lmjsO3/3KzqfrK64PKqqT4kAWv8LbWKXQ1p611QmdRSuqa
	+PKmk=
X-Received: by 2002:a05:6214:29c5:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a7055842b9mr189699666d6.6.1775557684043;
        Tue, 07 Apr 2026 03:28:04 -0700 (PDT)
X-Received: by 2002:a05:6214:29c5:b0:89a:595c:b805 with SMTP id 6a1803df08f44-8a7055842b9mr189699476d6.6.1775557683589;
        Tue, 07 Apr 2026 03:28:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972293sm542256466b.11.2026.04.07.03.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:28:02 -0700 (PDT)
Message-ID: <97abbb44-6259-45c6-8b75-99a646d22427@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
 <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-m8-dts-additions-v2-4-c4c4bd50af48@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TZqEJTuGquA5c0ftsDRxXCfjkpSwZAfb
X-Proofpoint-ORIG-GUID: TZqEJTuGquA5c0ftsDRxXCfjkpSwZAfb
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4dc34 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8poMKPHdAAAA:8 a=EUspDBNiAAAA:8 a=h-iMAVde12pwD0qB9LkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NyBTYWx0ZWRfX449YyhFq47Ad
 INELZkygTusqoVKgEH2qTAeiYBvCG5107U9YOkHaQAK3FMqOyHBzykV6/J/47LP4pJQP8pIxPR6
 erzzilWsXGLDEb8OO7XWH2fn+rsLnA5kE2mjninC6KpxrgH6xVOjyH61afmGysSHkvFt+CYKhJc
 lQ/H8vOEUtEutmrPnE/xpMDVfjYoGmtbI6ss5tF7HF+RG3+agKvRxgH1cz4Jw14FSMza0idm/VG
 cboocAzDm3HaIz9/nwP1kho6m3wfa/+0r/k6ffEyJQ69/fd+DJUdywQ3LHhQdWoDOsMKbWpURh1
 wxtbOseC0h/juka1LJeBWxpfcWB33xrAfi3Bp0hLkTgTjhcGzisadNBPvQuF7/F935+J1dTB7sq
 EZg1gmhKlgBU2IRoImG92DgMi1DZw6W29S2LIwRU4TqfshA5tBOMum4YSUes3+OF58Cxckh9aV3
 DDwS9irFYGG6iGnmdUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_032805_381939_A398388A 
X-CRM114-Status: GOOD (  11.05  )
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

On 4/6/26 7:17 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the touchscreen device node for the HTC One (M8).
> 
> The downstream vendor kernel used an I2C frequency of 384 kHz
> for this bus. Use the same value as the vendor.
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

