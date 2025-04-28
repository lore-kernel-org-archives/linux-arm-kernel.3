Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB9AC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDmhszglaNT9fzli8c56cXMbJ0ClF3aeFP5Tl0qaDz0=; b=aWQ1+AKqpvTvA6ttut+EIq1tpC
	wDIHPTkN5TCdQE4avDVcJqnl20Cd+vEF8+Y8sD63KTqzlwt76FpArH5f1nqaWglfX9eJEtlU0aRhc
	vNPMdFXQJRfz6vj9Uz+8tNBQytdqlyRdN5uwzkv93SEyKrMf0LNVMIAZmUkVXH+j/C7EHf81bYcyx
	l1AGxQr/P61RnfPL+Kc9Q6DrUc0w7xLlBK9/mj3Afkj6uLLsmivuhQA6Ff8cJvAckRlf80XLH+yqc
	wdMey2EppWNZS8WwqBEHw7+TNWS+sF5N95YR5r7H0RCO9v+6XTLnv/MjmX6dqXfSNtiVO9VzuZ2/G
	GPnY9vJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MC4-00000005ro5-31QC;
	Mon, 28 Apr 2025 10:58:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9M39-00000005qM5-3ND2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 10:49:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9ZMLh018418
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lDmhszglaNT9fzli8c56cXMb
	J0ClF3aeFP5Tl0qaDz0=; b=MXUnkl4rNXnQo2UMaeZmkMd1wyl9argAL9z+RKBg
	wk3gtZh5prQDnQzLt7zeDeLZL/8glSo+lDd/hcySiSMU//AFOBhKII+cj1bXMFAh
	szmhvWVoo/azNO6jR4Y3LL6H/WAJgcUoGZbHnhUKKq97qkZIkms/KghLtPA//7W3
	IDKxtMiSYfS1/qBgMyC5RjvnWxjwefvm/O8nk/YTK2VFi8430zpvt+0ea361kuew
	8Yetj8tosiB1BJzAWIyX/hNazmSICzZPJUi4la8GmDxCKqDEVuQaYYtde2OvxI9Z
	QJQhpJRRSdQpDoCSKRoRfj5FLzo92hUr7O0N7JfCfypOpA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5g07p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 10:49:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30828f9af10so7557933a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 03:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837362; x=1746442162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDmhszglaNT9fzli8c56cXMbJ0ClF3aeFP5Tl0qaDz0=;
        b=JaI2N8lsh9EbebqTI2vFpeOJgMq9GPB7tSNbHOqSCgH6CCV6GYbNmUw4peAHez9V0O
         fj5MaKR9kG7nsThWUxZwzChKnmuwHsixDNFTNx+s1yp9y8/L8LNxqXntOPs8wXVCXi/T
         k7d9/qZAcVU/4CPKAnHs77L/oAufkDh9aiw7c02Hq4Xq+civTNDULquteYAuTI+CiyWN
         h73oSBtE60gpjZYyLlNDwgLATE9iTH0plU0NcFsJT0dXwbrnLlbMcJpzl3EPr0itWL4x
         A/8Np9sUqWva9hF4R/tBOCES+Pb/JfiSCozUyGLUTVaOGDsI0tSispCt1Bs1x0UvUUQH
         Todw==
X-Forwarded-Encrypted: i=1; AJvYcCXIiyq8sEUYOhW4OgqnW1eAFPvLEUqO50Eb6nIrGWLMOzcl7qR21e6sS06k+IOzTohCZlFXdg6FkLbWfd7AkStD@lists.infradead.org
X-Gm-Message-State: AOJu0YyLMHQeGxceowEllKGgxNYVns/0XFUTD3o2De0e+tj4004TM9Et
	DpyFi5rd646wQ9dmlZ3/iAE4cQoKjVjSzbhb0rcvpcFbpXMLfP8Tfjt/mMxUlGkHTHWv47uyYD0
	6nUt8tQOHXy30pQ/UjkJRqZpAWoCWSY3SHD+19F+EFBM6ZMFh19ojR1r/3pYVjFppR75G/bvtPz
	GFOjSJ8b4mmckWDPPv9bjfOB6UTwps4EQEqm4A7T/UEMHJtOvm
X-Gm-Gg: ASbGncsmqgbo88X3DolAX/WyMUigcSljR080dOumSOg3NNx0T4qQN1aQhyShmN490Fp
	4pDbpR2X6JOnfDvqKo7+CPtUwcxpP4rr9NMh59BPghSdWPodRDgwA/7INDRXZ2UW3X4OpeD1sqN
	s+6k6/jEDDsg+XIJWV9nuXrRaI
X-Received: by 2002:a17:90a:e70b:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-30a012fe1b5mr12489587a91.6.1745837362140;
        Mon, 28 Apr 2025 03:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz+/aYe6LvOR+KmeDd0jMeJ2lt5sUppcByWexbXLICBrt9fYXv9DequtQGO3Qn8Puh7URm/6CRCB6zgv3HI9w=
X-Received: by 2002:a17:90a:e70b:b0:2f8:49ad:4079 with SMTP id
 98e67ed59e1d1-30a012fe1b5mr12489560a91.6.1745837361738; Mon, 28 Apr 2025
 03:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com> <20250428-prudent-hasty-pheasant-aecec4@kuoka>
 <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
In-Reply-To: <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:49:10 +0300
X-Gm-Features: ATxdqUESaAcsAnz3fLSqCu2cYjvTXl2dF4AhQuMy8hC7LO1Y3nzIdjCZakO_n24
Message-ID: <CAO9ioeUo_vO+-wuC4JGi4JfSMZx+JZkvLvsi=ppBD_LvuV2ZLA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: OvTXiw2xZ5aUyKzZY6K4dAfthvY_r7Nt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4OCBTYWx0ZWRfX4qKczaX+sKhD WDXej2XUwifzcc7fy4maHrfbyxq+fikHd3uUkrx5gP2PH4B5zNqx1NueezjJoPun9uNAUZEqF5z SqYKz+UNNMm+M+jooUFRZRRF6QweiDRljnkEZA8jqT9B9Fk2KcOlavoHra3fSClgAX4wopwAh7h
 dtgh29oIJMkgi/ciVQbVYnK/oUTb6/0GxVYvAi1fIxtyAYQBrj0GD3a18PNbYGYTJhP9qlTZZcG GMU+GbaIuovxPwdloDmWZHGlTMh7W2hE1/DXgHQI+2ySG14pSHDH7lWTrnikE1QgQJc/A5tDsKd LWFH1L0MGAfvRLjttrLHEwidRkI00TzN3ppfCWSYIWxPcmQAu4VK8emM44xe7G6WEDO1Y7PXc1Q
 gR0x1qEjEr6fU5gqCVNXmS3AfJVDbxoektZ6LXfZUPfrkXNPG51LJaWFDl0vRBDKhiPDWpd4
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680f5d33 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L9MUveKbg8kMJ_lLYs4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: OvTXiw2xZ5aUyKzZY6K4dAfthvY_r7Nt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_034923_850192_BB1C7CB8 
X-CRM114-Status: GOOD (  19.56  )
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

On Mon, 28 Apr 2025 at 10:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/04/2025 09:07, Krzysztof Kozlowski wrote:
> > On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> >> For some reason Lee has mis-squashed two commits, picking up one chunk
> >> from the first patch and one chunk from the second one. Rather than
> >> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> >> Add qcom,apq8064-mmss-sfpb").
> >
> > I don't understand: that commit looks like direct, proper result for
> > https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> > so where is squashing two commits? The diff markers have offset by few
> > lines, but it's still just few lines and they do not matter - there is
> > no diff/patch mismatch from that point of view.
>
> Ah, difference in compatibles. I see the error. Anyway, I don't think
> revert is correct. Just add missing compatibles.

Why? The commit that went in is invalid, didn't come from my patches
and was produced in some weird way.



-- 
With best wishes
Dmitry

