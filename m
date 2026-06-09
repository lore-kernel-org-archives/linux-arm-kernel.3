Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954BACD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=; b=f5Da4he0vjwL2EToSE8drf+gSm
	WyFCstOlMrtcNfHZvu1+JYomRd7l+yIVYOXsHOY9RqbCQ3Rqg/EPB1oev+NIZMsNt7wbH/mIDrLTR
	epGJuWL3Kskpl+QssEvTKYZq4u3/mD/oIGeJQ5Hvg5AV1jQQuVWwIh9UwuhukgFIoDsoyAidkTwHJ
	I56tVpE/v+U9ZlL2NQpumKFI9RmDCNmKSAzQ/sdQzm4e7H9aPC6KsAAt5qU4cf8nji/rq4Rly2t2v
	+6dNdi0xxmsvzH9wlygJRx5+AqH+GpHbT+EUMcMQlz+HDk37UbhY4JuN4QSxieUwDvKKYQeJ7mjQc
	D/Navh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWscl-00000005Bzo-1AFo;
	Tue, 09 Jun 2026 09:19:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsci-00000005Byk-3og3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:19:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rblN2034657
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 09:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=; b=dSzRjhchuv5J+lA0
	VNfzn1g/9zxFGeqrtj10w6mP+5Vx15ppW68zOAui5kM3IYYYrV/FVdhtdtFjAFNw
	Njo90gM6dPM/GInzXIdglHf2hVk7m/0SsMXmLLN50m+xjjCceihnhGAUlzr7AMtR
	fkz+GgyVYr3L2YD0dF61q0U1D4Kg4JHF6Qlk5v76WGgPnlfPZXMQNKfBLBkUAXVN
	hlsViLtumFWLgxE8/G9zq0IT+3pq3YbcwZ30UlQNaQ3FLXC1Bg7SreQ0tB6IPO6Q
	+uJCXUYqB6O93OSwbJuHpNx5SKbI/RnTF8kpSvscvF1oAfroI0Bx09Ns+492qPd1
	ICzikQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeearf11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:19:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91598af506cso638509985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996791; cv=none;
        d=google.com; s=arc-20240605;
        b=QidBHzjGwfy1Lzsod1GuhRlkZv29+gBq27prsvqCsPJjgWnwkLhLZ6zY869eovUWVg
         wjL5yIeTXUfGfQ5xL27ooo/kFMqX8bHo7maLtbNT0FvPfKG/tPH1I+/HsxNYb6TM/mjJ
         OSJXfWNoncv5s6LghgrsNMkOf4KMHndBTsM2KI68DiQx0lRbON8kmV47s8sLCOetj96q
         tcUvEII1r/TPUpPt9ZbiS1Htv8BETdWq5nvxtsymu1c3L18gxXt5lftbTsSI3F22sXNy
         KFlm/Dyg2M0+lm4jgvg/0M++v0SDYVZ4iJb+dKOH/QXtbbOYhr5wB//2jK9FafdIbbqz
         IeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        fh=KDEFExxQRa9B+hjiyZ/9xCuCks6f9oRMD9eHAzwGN/w=;
        b=cEfHo9JWWZW1s6UflYl/uEnTH/k7tiM0fCzGtf1jSgyzuwqV+7G6AHxohlk+LjlFAC
         ig6L5wfG7vMNaXYR4Y1mnFx+PSxiHv/1Dn9Sa5TdiTwWRlHcTOOeehRfmrz6Giz+fXMf
         zZwKECl/jZC4ouNgEssbfL7ludSn3s1Zn0V6eB/Lu1Iz30WWuqydvKobA0cVEncJienl
         sjkjyoBQpUt9jE1ooQAnYmwgqhTG1S5aVPRBigFCBv+jQYCMOQR+IlXjMI40uUhe2noa
         S0dr5U4zuIdxnUeCSlFYLZGZdsXIlmWU/Wat0wwYjEnmzj66oALzqhUDk5VLsV/uI9pd
         QqQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996791; x=1781601591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        b=V90BwmBdsO8kv+fcuRUUP7/ofGLaMfq5FVM9O3y7cjI0N+hayc57F9jAEre6oUQqVf
         AXOG2H79SJYZiQanXm/QoCF4ffPC9lsB716LGbyehKGq0mMvLFmfgA/3X/MqPJA1DGzW
         CanX78N0EThJLKRGV+92zWqLygz6fpOMef+wXmvzOJXFsvY72vUtnq7BkpHQtxh5+Reb
         xpH7XEiIiato1+cZxB+yFqTdcKPpG4/RDGHn0SWQ3qsfIrJ+iJnyO05r4iwmrLaR0eMO
         1tTCbi3oWsXxb7NjhKleVavoH7Qx3ZAifVDu7xPsxWGOm0K4pxKYInK02Y4Cswo6hFdo
         kAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996791; x=1781601591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oP7WSlZ6SD3v/Z5o7bIIkwTQmbLscnWGhDdc31wqEz8=;
        b=g3IRyn0V1q046J/khVi4Lsr/9dP5i8ACuOBpQ47gQ1o9uhkMlzbfgEFcUNrU6DiYap
         XchFMEBrI80YeMOO8tP/ehUbrBixKkVgI5qlLZApPmYCiPu9UmLLfBLX9hhcwQ7XAhYI
         2tHcFHS2hWr7nEXLWlWJaojDeaA8efVmqNxuXkFjZlq0SHKqFYL1oJS4JxPVWE4zebVF
         y/g6Qgt0CzfayDoyPIyz3morunziOMXWbFSlRtEtuiSvecgTJj3Hclc64ouEo5Ur85AJ
         q+AYh2SUGTWJCYa9KA5Ha3HB8LczNyEnNEa5LXY3AZ8kKvMn1BTiGiU+9/HmXxpYmZid
         vMkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gVHY/MQSlLiyYmcZRjbPMLJ6R1Xv/o6RuF2xiofRpwB7umYR+inoTgcRe98WzpA6MqOl+hZWntwESXF42+Bwc@lists.infradead.org
X-Gm-Message-State: AOJu0Yylmo2wm3XLqKjDda1RpDSKqK4MVtJKGlSi5dDhnH223isUtEW1
	6qmevNT5/UGh3E4X4rS+eZCBJv2wj3j2jhJ3kuDaaYTrEe74sezOYK3uGo56UJ2IQr7UJmu1Jww
	KUivCaKMmMlOAnWulQgmVpf5c87nhT63ss2WrCRbibyxNEoABy8kvLcWycp455NcZsH042QlqDl
	KvBQaoSZSfUj5t+tALKIvGpj/5dWSkeP7hSyO+y52EaoHekW2wrfK4
X-Gm-Gg: Acq92OGEb4YgjvTkg+1WbqDUN+w3CkcFzHlyi/khwZr6ULsBFQffeg2BOsiDNRPW99D
	eBMt5x0UJJnBEqVywSyW/oB1SNMcVHFyh5Cd8G6RewLxI55kRPMFCBvhVHQy+zJNxCUQvhzkJOg
	wkzpqlNX0IUbULXhqgEbypzbl2MucTlPp0TBJNSNVTY9J0DgGZcs1DGz2vNOOPdbUTnEjwSYXSC
	telMkfHaRu81IUBE7myYXRHQSWvyL3oNTRPrim8+MmIjJ0FrPQG0nGnVDVO2T++nECr2Kf5nMm1
	hMJHeUwzFXxCxA4Ski/kk6PvGV2I2bUR
X-Received: by 2002:a05:620a:4590:b0:915:89d4:df22 with SMTP id af79cd13be357-915a9db5d00mr3035343685a.50.1780996791281;
        Tue, 09 Jun 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4590:b0:915:89d4:df22 with SMTP id
 af79cd13be357-915a9db5d00mr3035339585a.50.1780996790847; Tue, 09 Jun 2026
 02:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com> <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-1-88a846afdd5d@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:19:39 +0200
X-Gm-Features: AVVi8CejLh9w5S_OQ6YRu4HaLtjG5GDBpmdR78mQwKNwD0qnxyg2L6IjHLml8Xs
Message-ID: <CAFEp6-3imORRS5FqjTMYV2zOn+bpf54uwhf7Fy_4-uTDadtAxQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: msm: qcm2290: Add Shikra MDSS
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: coocyxPj9YJLMoLRreMSR2UB0nRonPF8
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27dab7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=h5pAuauRZTFNeIU57NgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NSBTYWx0ZWRfX3jvy9iFx89yx
 Rc5v8nY34K7H0FaQqzbElikCZ1NVT/W2KYIRPUl6CI4LEiIK/6MG3dSaV4X1w4YMPRV9f6D0MBQ
 gXeHZ/O9CJRmXTT9MePlIFnUnpSFXUEjm3zdEv1RbH1A4hroYmmtAFuNyowHZNcBNAgl5fdGTtd
 u8SzlL7vMCn1IMD8LW6UaCGfuAqoqGKaCVEHst3VSf6Hcpb7mf93J4eUJM2IBp0r1dH1wzqjek3
 eMyg3z0nnZavg0y3juv1x9HlRqzpEC7n1INh+0qVDMw9Xe5t3B4PpD9OIorAsHmbAjOXW6OjC8j
 P0dU4+2AAqluJuLy9995+wWm+9XmKCm/fK/HUPbhru13Mj609K2sBxMMaDTVhsTkfBGOb01eA5i
 DgMPd35KM2DrpKpoMnx9pdOW12APg8xYsVu1jTOFiRGokf9L0s+itJZ8uPwMeuPlxephZ7FiD3m
 rYW6AS67+hE+jDbO1UA==
X-Proofpoint-GUID: coocyxPj9YJLMoLRreMSR2UB0nRonPF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_021953_064351_89CA0EE7 
X-CRM114-Status: GOOD (  11.22  )
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

On Mon, Jun 8, 2026 at 9:02=E2=80=AFAM Nabige Aala <nabige.aala@oss.qualcom=
m.com> wrote:
>
> Shikra reuses the same MDSS/DPU 6.5 hardware as QCM2290. Extend
> the existing qcm2290 bindings to cover Shikra by adding fallback
> compatible chains for MDSS, DPU and DSI controller nodes rather
> than introducing a separate binding file.
>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

