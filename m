Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EAFCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOuwO8Oe7+fhFiUNtPbUZRGD3ndfLf9Y9W/ejus3N+4=; b=lEUTTChAKzvyya/EkB8wBCaru0
	5cZQAHImq9oJSROIEFIk2+PBqYW48/s7GAsK0KVybIEVjzgX6+qhhqpFyH7yjpEDJcQq3fbdm5rHp
	OUb/2A2ab2vAQeaNzzd/7gwBcDiTBk/is8D0BMzWbgT/LIRJl4GtTAP+iBTgxynUA64zKjcBdpUdn
	Htb1QhXu0GmiNsJJdSQhCdvg4Vta9dFvrPOjqooZrX74RIDdM3r9pDgufGXgmXzXBe7HC6jDsvlMp
	XnwQ96X8DHGtlwLYKw9Gu92wfXXEFxAIPbBQ30p6y3FDaQqb/ExE8YbJzodde96yzvYFI4+t/Dqlo
	H0eQtwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCpd-00000003GmD-0K9D;
	Wed, 13 May 2026 16:53:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCpb-00000003GlV-0Os0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:53:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF4qTu2887823
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZOuwO8Oe7+fhFiUNtPbUZRGD
	3ndfLf9Y9W/ejus3N+4=; b=VqcTOxGY8MgLhpL7QdJ7no1pbuPJqDQSDCOQZvYM
	mMv2QA+Iibd/P3kLfEp/Ky0P4VHfBddRiB/PPRujgkEMFpfPetiBU6hWAsdCxFIR
	8Ut7dqpEQwHYBfUyicHI/0cWX9KFNFZE8rT3VOCjQcL8m9+BfElsdQUsIATm1skS
	pjqwAgJ3ViXZjsjoVldeMz5idJoo0ZkjKbBATknvuPAPXU97jAjlkJH4mqR05W1q
	VnYqmW12Qt9uGodhMDo4ORsMNGmV9eXSkRflCsy1J/r6OmTNtqFcMmFHAlhVr5RO
	81+YfJ1nhuBpv3IM31e6/dco5ewo+GlxS3b6PQ639X3PqQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghx9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:53:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b5d6bb45so45611091cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691190; x=1779295990; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOuwO8Oe7+fhFiUNtPbUZRGD3ndfLf9Y9W/ejus3N+4=;
        b=howubZImTXr79K9N6m945Uj1L570J4otW94Gl3sTeKODiYvTPeAeY/LS9vA5woOJM4
         lq40n/1enmiYkcKihTYzgVkph8NRIM1B9EwtYLfFM0jeWrL/wVM6d+jOWT/MKJ0FqQ/N
         qml/1neVixNg32VIQ3cPXewaPjov+S1O/6U3FYuTqC32rrfd/tJXqqtUDGO9nxZdcRym
         wSOr9y9Qkrn79dBxiCrqVcFd4r7ZJsENxPsXoQ/EOgyjnA18YIHotVLeq6VWzgHyr/fc
         238Pa+FiMAC0YhHnDcBPArHQwjrfZCJHEDKnW0nnktwxe0jDO19Xe9nEZziN/zZhPs2J
         ax7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691190; x=1779295990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOuwO8Oe7+fhFiUNtPbUZRGD3ndfLf9Y9W/ejus3N+4=;
        b=SEsIS4YW83eNH/7vZQs4cuvLTTk0lRXnshL+NNkJ5/wSWoAT8qrFr71e4HbX5vZbUO
         tzjT2yxdmC0IOA2G7RFJObhVl7mbhiE0B50pgsUqfmYv9eVxFk5mQWCvbddtSYEYo3Ws
         tUg+oTArW2xWDN0QppfcBOnEWmHUETIypKGmfVBRI+55Ikp8c2folsiMn0nTLh+I8vRn
         LoVME0ZRotlVjc+OTAXueyJ73TglNQBfqWYxtqRLG/Od5/NU4CLQeW+yw1vSoaA1WDn0
         vmv1cPo0ERHt0Yv50nog21dj9y6jVAxzgjfQ79EkZKdqkfpYKb0GZ8CphBow4rf/g8F1
         bwEg==
X-Forwarded-Encrypted: i=1; AFNElJ9vM/mOYMPrlz9LfII9z5dJOyh6e0be6KzUsxgKkACgbCJgELcgfqbGM2tCVJfg4OkMVv6d0erorF2Z3NiNJMNf@lists.infradead.org
X-Gm-Message-State: AOJu0YyjIVUxAueJgxdDBVZo3CFEl5BuDqrL4kAnKLp+oucd3+fHMFm9
	jhtqYS1ThtpkoPsOw9zo8Ph7knZRm4ck0YEA8GRNA1b97ty1JI9q0WmEkUp89BZ+BFHSK+6c1cG
	MOEWQd77jtqvhA/zt7F8hR8rvEF089jAqnVXsTMoKrCyeUThUGAbS7CP8RxCskYUKIWaVVYxN7b
	3MUQ==
X-Gm-Gg: Acq92OFZzJPMCuCS0jc51DAKIEiLzaZFlg8FgvTtXLlvU4a7iOhSnMMH9H7vZkxSDL0
	ags0QVH7VLiDBIsO9ReN2bhUl0NkXi7kxulw1xQ2rTCuVw5ODdm+1dZ7HLjGXEkQlbeZFMVG8Go
	lWgXCG1XyMmKYcr30CYhykyoXmJKBp2QMArmeGWBy6h0DnV6QoADlgbU8ISjiQaggb3y5CbjTXj
	Po1MPRDRTMJQ88RbYl1m1htlbS4n/SyLehQ5Izz3YVcGYAcYGrvvtlJQHMuARX02gNzxHNN2ziN
	aRT4euJeNs3zIqHVt6Kb0DlivP7iStrIV9rNV9AyzOsq+OuiAh+ChFNTlHXwemiq209MqJd9Ci3
	xgtN+nWMniazkCik8elMlrq7fVrud5WYUvTkIGYmApryFeXE2G4WuhfDwYJxsj2Q7Tri4JAa7wQ
	Nx6IwfjRGkDFnrc2EJCEEoH4oja1FD1Um2B1w=
X-Received: by 2002:a05:622a:5912:b0:50d:7384:a660 with SMTP id d75a77b69052e-5162f43f2fdmr54430601cf.6.1778691189611;
        Wed, 13 May 2026 09:53:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5912:b0:50d:7384:a660 with SMTP id d75a77b69052e-5162f43f2fdmr54429961cf.6.1778691189063;
        Wed, 13 May 2026 09:53:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f628a724sm40620501fa.39.2026.05.13.09.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:53:08 -0700 (PDT)
Date: Wed, 13 May 2026 19:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
Message-ID: <hdpvs6gftjhaa2xx3r3ds6ss44bvytnllv2lg6anoiq2iyxwtc@qd7ejefkxmwk>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-GUID: jmGxanVTzI_uE8wmwjwCDgxWJtcsOOwY
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a04ac76 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=XJtuOP1FUQBXJGSJDRYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jmGxanVTzI_uE8wmwjwCDgxWJtcsOOwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MCBTYWx0ZWRfX6FTIjgA9Hxes
 czihZL1ekC7osLw/A9+Emhze0uDzBloKB7UPgby3/eOu0qjTxvUxajx36uEgr82RFEjvM+GJhRG
 ES2I5ybRlgXvFJt9Zhb7TSBdoGS0WiESxarrls/NziMM1SIgw2L2xVTsV9LbEoXd2MritS6mCTi
 eDalveFIgSbDoSlp5XAlS79NcETnbIdqL7TY8r1yzHYqGyeOc7sRKGumQ7LF7SOhJQa9gjiRcxf
 ijmCb7VNjYiSOCELvZFEZDLzJnd8TQ956Xh3WpKXM97oDhtAT1g1KIOjvUf9KqeYqVm6H5T767C
 Se1S48lJF5clfArSYrj+y6Mu4Uv4DM0BRRXt4+y9r+8GWtJsZyyMnBEpdpfcJ2qeYeQiswruQ5R
 re6gp28lBVZq1ln2R7ygCbJvUQVULmx558CrJ2a2eAUkxnMmwUIHecc5YzTn0asR5ZTe+t3gXC9
 QVcMzDGfCJnz6mRF+cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_095311_139923_0999C3B8 
X-CRM114-Status: GOOD (  16.87  )
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

On Tue, May 12, 2026 at 03:53:19AM +0530, Akhil P Oommen wrote:
> Adreno 840 present in Kaanapali SoC is the second generation GPU in
> A8x family. It is based on the new slice architecture with 3 slices,
> higher GMEM/caches etc.
> 
> There is some re-arrangement in the reglist to properly cover maximum
> register region. Other than this, the DT description is mostly similar
> to the existing chipsets except the OPP tables.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 232 ++++++++++++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

