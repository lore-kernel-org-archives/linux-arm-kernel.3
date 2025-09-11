Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067FCCAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=; b=f+/3174clb7EphDc3sRCaE7Vf+
	RcBSUvfuJ4J48xgntjJ7AVuHk9wFupUEN+FxhmsTu4GkMMNINAQ5rwwtViuxW9MGLcycww6r9t4d8
	2KwAALyG+KrVu/hBXyCjHvKpdYdrm7SvtX5lAr8WEC6ttlF8inIdtnoaBa8JJDvDoPVGc6XPtPb0f
	u0u3z0dP03eCd0J+t0LpHeOFMP1d5Ex+CwW+TY0dWBy2sjc+h0HbMTUDkATMaNWH70HGFUgcfff51
	ir8beoXEEgmgevtBzL0f92b2qE/VnTAnAaHIvZjnPW60WgnA3XNzT8wqmo+wbRyiEF/bbJk81y+Vr
	f/zuNynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweze-00000002UvG-1civ;
	Thu, 11 Sep 2025 10:57:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwezb-00000002UuC-25p9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:57:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J5ta026648
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 10:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=; b=bkGXXzC7osxLiUED
	rB7nmC2VILhkx5rMILzT06IFeDLGM8styZehSnsAEhQ0urhJRLxKP2a+dEyYfdKc
	oVrVKpQgGD+GI7ckTMLUlDNCnN33bjnuL50qmHkFyohR0gnJabd1q+3dvePDaSGS
	CslxrWLJWb/yYwtyhmmyxW23RCTvlADxoikmfvTMrLxt++ZdmKGiR6dlBhGsO3Io
	i1OYxuo45I6A3hAWOwuZ3BeaNi2E2FIblLnaGo2SctKE557YQiAIQG0nAW6+jiJi
	NPFlnPisTYU1Sej6jGNq5wmGpCubSS+8Pw/LBDVg00ZXIMmBBHgaiztikwG2fhkR
	hpAt+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0y8rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 10:57:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24e04a4f706so7105845ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 03:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588249; x=1758193049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w20I3Or4zRoNyF774X/Fgv8TN+IVZ+rO/jEo5fzcVzU=;
        b=au7REl20JnbdMfAYLIpEriTUKXujWyaWmzbr0zBlsj8Rfah8yvxPisovTjubNuHyXA
         UhzqmV046EAguE5XWxU/oFYRqvSHvYwtJCRb2AxuQByN3nzi2An/R+IUwNUqfqQw3a2g
         hB4ZP6KLVqjrPKR3g73y/+Jse2F209JpFaBM70YMWv4Wj418xRG/SKkbpzhcKCbRuRn8
         LySJN29DmoZoZLMsgIDi27t2AO8Xo4024ybapV33J81r/7Af4B54Erv22b+0/QKs6+Lh
         jf/CAop7su6bcNH0LmQSZ/s2HK+OUeGs1NEiXPTCJ6K2MeoXd1D1PIPCqbnZXovkZ2bG
         qoRg==
X-Forwarded-Encrypted: i=1; AJvYcCV3QdjO+9N861WcJlJMRYB0fReJ7zJKZ1xwVVyyiMVnVM0JElXBhvSkCi3sUMHtBVVPV7jZtWQnxIQxIdIfu/fs@lists.infradead.org
X-Gm-Message-State: AOJu0YxK6c8bVXMm1EnXMpjRkufTZwy2VGgJhEYBjQ0LRzF8BmpCH+8L
	/B31tsREaCLCe4CE8sA0WdCBQg+gBTfUPGtX+MicCPOw1xK4ranZ6DHNv6FF8P6MhfXucM58ahC
	cdy6kD/Qhlidj9vAB7oCCnZxVXR2AeouhAyHRpfNmkBRGuCBdXbApqUQWqrDqtQUT/OmMwI9ZsL
	mbXzTN1N8ycJT16GWJOZxr3veTI/Qb+oezNBeGYGR/r/eHS4QlXYsG
X-Gm-Gg: ASbGncth+g92RXXj3pVFNShGVL83fVLwK89ITSTz62Eeu2yMe+vYem80pNoXUd3QOny
	OgMKE+7jN98bO+d0cI1mW6w/ZZ7MuQg63n4NaHxv39hVHxiItEVGI8f5uRBCmKbBMIz8M/MwP4Q
	K3iEMYFaMpMc7wk3gVdEQOCtv9cVBeFeZ40E4=
X-Received: by 2002:a17:902:f606:b0:25c:8005:3efb with SMTP id d9443c01a7336-25c800540b9mr9214955ad.54.1757588248922;
        Thu, 11 Sep 2025 03:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAH11JD2Q0IWOglR3V4QiPu9OVEC1C5tZSFPqr+NcxPJGuPbUCJ+dsuSyVMVCW06uEy6k6eSWe+gjk2lD+b2U=
X-Received: by 2002:a17:902:f606:b0:25c:8005:3efb with SMTP id
 d9443c01a7336-25c800540b9mr9214575ad.54.1757588248467; Thu, 11 Sep 2025
 03:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-4-quic_vikramsa@quicinc.com> <w54mpkzk7irjb7m5jiouxhj77czj4ex72oqioaph4o5qhcsay2@qjolctktsu4s>
 <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
In-Reply-To: <8104bb41-e827-4daa-bc96-9b6678a9d345@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 13:57:17 +0300
X-Gm-Features: AS18NWDL5Sq7WXLmyGnLpCSE5BXnWmdKo1qJbjlndUcI-PeO2ah0x-l-T_QEjBQ
Message-ID: <CAO9ioeWLrYAFG2cN6w0uOqQE7K83EAyN7om6+QEPUWRZoZ3-Nw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: monaco-evk-camera: Add DT overlay
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>, quic_nihalkum@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: klaS7mhaOhao8QVfuStsp0e9yr3HQQEE
X-Proofpoint-GUID: klaS7mhaOhao8QVfuStsp0e9yr3HQQEE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX7Rx3lQ+Ehdo9
 +YlKuVafbYHRaiHdd8H8FJJJ1bdZubNU1jjiEnqenNq1dUH3nOsfoUJx6YsFbf7gAoU9BJ+9eaZ
 rMG9eyazy0Q4jGSP/qKNkUcVzQORf9BSngdcW2elNc5Z2AbsInzJ9NpG9BHN/Uc0kAT422hZciR
 tfpI6vvQ7D3xfN6oexemEYoDifCJQ8WVpvhL75rUAOTYDP9ee7lEtS0ZTivDvJgKl9I1CjYJTQT
 GKfG4Dp7XNVO1Qatia9UOowy8mNDK+lpkZ2/1ADsKfeXpl7PcLAo+V5He/rY8ZukDq/bd1LDdOG
 KZrhfbgQXvdeJ4EpznUpzCz84kYfxgC6rPwDzvhmfYtfsof6YIHDQjsdkiRC/TMWxxUa87RDnJF
 yoKK0fNx
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2ab1a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=COk6AnOGAAAA:8 a=OL7WMRyR3eFSKxD7jRQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_035731_663102_5A1A9F23 
X-CRM114-Status: GOOD (  17.67  )
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

On Wed, 10 Sept 2025 at 10:03, Vikram Sharma <quic_vikramsa@quicinc.com> wr=
ote:
>
> On 9/9/2025 7:31 PM, Dmitry Baryshkov wrote:
>
> On Tue, Sep 09, 2025 at 05:12:40PM +0530, Vikram Sharma wrote:
>
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>
> Enable IMX577 sensor using the CCI1 interface on Monaco EVK.
> Camera reset is controlled through an I2C expander,
> and power supply is managed via tlmm GPIO74.
>
> Why is done as an overlay? Is it a seprate mezzanine?
>
> It=E2=80=99s not a separate mezzanine; monaco-evk does not come with an a=
ttached camera sensor by default.
> The overlay simply reflects an optional camera sensor attachment (e.g., I=
MX577 on CSIPHY1)
> That is why camera sensor is configured in monaco-evk-camera.dtso instead=
 of modifying the base monaco-evk.dts.
> Please suggest and alternative approach if you feel this is not correct

Okay, I found this email. Please fix your email client settings and
never send HTML emails to kernel-related mailing lists.

--=20
With best wishes
Dmitry

