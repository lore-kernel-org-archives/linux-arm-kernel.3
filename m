Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9615BE68155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=; b=lWltUikqh6cE6PP4YUe3CEKYPZ
	briLKNZIdUQzCOiUMOufVKr2qOh2fiUVBEn9JD+of/fgk/9Uy3KDKdM631zeCwqtskd08huWI6mQX
	bpKI+yQsh9etvBKfAOpEWG6aG6RVd099BCoNNuNGnIgOvwgNw3gr/eViK0KQKbomh1YvoBWELNrxo
	co3F+4qaOt0IpBdfCydlmFtI8Oc2RRnRj5IWJ4+T0LIqDq1DshpN5rxFSSzMkHQScUVE8XmNXEMPS
	Yx0w4kZkGx/AdQEUB/zwcQemtsQa1j8Ea7NmzNSi5BgvJ1lJ4r4GtrKA/JBHFOo1khvPOEZCNLxba
	HKncIueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHZD-00000007xme-2SR1;
	Tue, 17 Feb 2026 09:40:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHZB-00000007xmJ-3cBb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:40:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54hAp2111937
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=; b=ZqfWP1wBIW2arHQv
	fmq26m3UTL3/49uN6OX74gSV69SE3xlZ6E7v9P145qVphbD8lLJNTzaAlSA14ya6
	u4ZoiwNpJrMW+2NaMPLwpIaVbzvpv/mKD2/8rIy1AX6Md5mcDHM14Gdfd97f8jYI
	ojE4SIHmDDz4oiF/Y/GYAcUNXAxv3FaZxx7DgJHR0Raf/RekAZoZIoM5toNo5fFo
	yhAzainorf4z8gpk+u0rWFqoTj5kKAADnZ/CynFx2+mBPdd7IMOMY2RZirSCe43v
	besRIIv1VQw/tr4f6bP2QK8mVWZn8N1xAij/xxK+0F6eNhM94hFIFaoxocge5yBv
	jnfDdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4gjry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:40:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb5a76f13eso142141085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771321224; x=1771926024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=;
        b=V6X/7U3/QqLTp9Cnck/FcCGGWdPX/wC3YcJR3s9QYeHAeeT/DPExLO2MNUXVU2fnZZ
         7C/rPTYXPxG0jdZVn2eMiwV2ONzDAt3zWVhbpTbmtsMrynEp73Fpe+eG7zaH+z+8iBQY
         lfUZ/25uWzO0C582sLNGsAzaYs0bc0uZSrx0YenxRZCHJRQIdMufN3MNVXO1tT7tKVVO
         mB8mQDGhE5LBDF4PbvXSFXm3n3Hfq+T4ADqYWPJO3AlpFECtWtZjiqO3VrQcdz/n3fpt
         vDnfJgkd+oVDkxaDjb96OuS3wW+1Ls9Fi6H0LOWQYp50erYq3WgnaUBDnQbwl1olW3fD
         HRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771321224; x=1771926024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=;
        b=enw7unjpcIkh1MnXAYEL6cm7Vi8e5GwD4kG4c5cSSN5GK/JbKVSD1SENNOAZquGzyO
         pTzIX9O1DECCTh6DIy5eMgG8uMOy3fkVL45ymaFi6INwayZZs5ihelXV7Fw532vXpBc8
         Sxxs3yzucugisRlfwJVV42m2O+N66VSYt9A/Bd/s7ACEGPyK0lYNOaoVcglqVwTfgqb9
         QYnxENj3Y81tenIc2r8DBiywaS58IudMiNktcd/i+2jgP3Fgs1hd/1PTuYWKI00dabAn
         bAONXsXLyc28peszp/5N7uh5/zXTE0MkNAu/e15TlCZVXTnVySL4Dr+eg7zqLXUNnf/J
         +wkA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Jw2DWNOYvsT0RMB5JHBPV615oEMUxcthySEpqZGPva8Yt9cCVRoqrpNc8NQF7M6SQMAXR3gsX+cMbkRb+yDp@lists.infradead.org
X-Gm-Message-State: AOJu0YyiCsJoJWCA2CkorBtS/KkOCBAyh6ozPFRzy41IK0WrHVqscXr5
	FvUEaKzNpuLqcmljC9xe1fnhnNLarvK+7gN4coQONaANohSDlJyJjASKOcqI7QazcQDirglaVQt
	tUOrfVA524hHd4fzFWD0URIw5WoOd92V+0dKbiTGLH5oUE7jfyBZdf1k0f9gQyZ2gPiqlD8l7Fw
	ab2w==
X-Gm-Gg: AZuq6aKfTMWE6Vf0H+8zYXkRDBQ3eTF3XoN3szmSXJMEF+ZI1VYELTesfc+a/Rq+CYK
	DfIkOT31iaadwkcBvOpybOgC6EfHghIG4GNtP3VMiz7kwcxMAjDJjK2jyoB47i0cozSR5H1zcsQ
	Z1yitRxFJJ+YPbtcit8ndLBXJvFsBKY/AUg89HWnJ4erlVB1nriQQcBkoAjmwAtOK1KhcKSMGsT
	b80V2me3cNKBBrr6K+TQLjq55Caxf/Tz4sUoapvPNz901rUi7CVBALYm4yTOdS/TV9mIEWy6ZyC
	zq6iQfVhXOlO9yvwAFS84/YDOPSjGVw+4JNw6v5I8HczFuZLeKKKWsc9SVq5hi7zMimB1dVFfDX
	2Jm09rgAXyNlEh17+uTdNgfKr/xxqqb5ZEtq6zATvEWAWJc05K3uB+3bG9urM7fKj8cRWeBJ1SJ
	5Y1pA=
X-Received: by 2002:a05:620a:15b5:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cb52c271aamr616329485a.7.1771321224456;
        Tue, 17 Feb 2026 01:40:24 -0800 (PST)
X-Received: by 2002:a05:620a:15b5:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cb52c271aamr616328485a.7.1771321224081;
        Tue, 17 Feb 2026 01:40:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7bf7sm329218166b.29.2026.02.17.01.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:40:23 -0800 (PST)
Message-ID: <0fd7a5f7-a983-498d-b18e-5a7efd910410@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69943789 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jOm0eYPikRZL3_VOfAkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OSBTYWx0ZWRfX+Kt4ntWX0uC3
 t67ryo9Y9+Y6eJBn3kU/sgrZ8EkBlEKENq1wgnLnr5A4ZKhd6eI/VG8KK8w6xWj9YtJ7SmuJfx8
 q1R6fH4u0olkfsOD0aBOv6g33TegXOYU1MHOM/UFwMVeXFtEt4fjK+Odi9LIBhArpU5UhLMOxEp
 nE66wpR+tgqaZgh+6TJhKSOWK+DNI+mvUUdkG5RUXxO6ITtPglQFumnWhQyjf+yQLhbQ3PVX/7/
 V37P7H0WS+HXiQigA4QQstG2jZ0CpFFXgFgZcIgSB8W2reTSKEuW0S/8Ih1BwJ+01SKmuuDD0QD
 X9KWcF/V+G+IsJ09yvM50DfX7SEJkJAjgzr5Ljoj7eAKg6PdQwZGGgwooO2Fx+BtlN4apl9XRKU
 w3WzuD/eALK5bkLE2wXUbflUf8t1r24IxqAbhzhJtwG+WECKuJteETQc1Q+87UFktQufpKD5fda
 0DN2ils1qTCYGDc+fFg==
X-Proofpoint-GUID: 5AzuUO2c_mDjtcELhdPbeqhufG5VWOcV
X-Proofpoint-ORIG-GUID: 5AzuUO2c_mDjtcELhdPbeqhufG5VWOcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_014026_122145_7D53BD03 
X-CRM114-Status: GOOD (  11.25  )
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

On 2/17/26 8:14 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp0_phy: phy@220c2a00 {
> +				compatible = "qcom,sa8775p-edp-phy";
> +
> +				reg = <0x0 0x220c2a00 0x0 0x200>,

Since you are going to resend already, please uniformly delete the \n
before 'reg'

lg otherwise

Konrad

