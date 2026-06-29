Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80482C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=; b=caA49VTCoyO+RjnaFJM0MdSphK
	dxEipCr7CWdin7dpGtQfFdfU34kQwSbRkDneUORyNgbEUC7gRARqBRtDYp1Ab0QrSX+4/B/rs5anu
	YNgQQfovrV+/ogTK5bSEdEkonNsj1PJ7j2Gh9F5tVhB6sCcaG7x9wPEvxfUdQyqmYUq76aM4tq4yX
	56ifK5971xKl0KNEibHf82fQduy/eYQimK+HGk4JHPwdsoVJ6H8/O/mvIGtp2kCRWH4OuxsVAsp/Y
	n7LE9HPZKvbIWYuaHsq5M9u3yuzWiPyezh8tpiu6YE1esbPPti33lmAcAJpE+oFmw+HxzRbSgvXa9
	W0cWyFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7ju-0000000E2oy-3bg8;
	Mon, 29 Jun 2026 08:53:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7jt-0000000E2oH-0bgE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 08:53:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72aM62163917
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=; b=T1XGg8hWV+HFSMfv
	ZayRu3sTjrhGUa6K+hGv3D8cpX854IbY+g+3K1kEJjx9PhYbM/nKcJXTSEWQTBdF
	KtpLoCpzE4TT4oRoQZuB8FOlEtbzTe7bQzLxawr7FK92zZzcvXx0+6QqixNhgvD3
	n3Evhjco5KhEgQYeM9crVLtLFWnTAZEVG8xlnNF/cICa8358tFuA/q/IEPKHFkWw
	zqtwANNOGtfe3yHk4XjGK2y+jtw2WhR/z6d4qAC1EHj/7Hexil8tvf8KGtxl211i
	WsY8rbmK3yhARXp7f3J9iXpHRKdGsabAUrkNjtcZ7ECLuXKdbOiM0puNFGkwKHsJ
	N+0PGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgeh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 08:53:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e566bae1bso8905285a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723191; x=1783327991; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=;
        b=WsH4gsSwQY7JPgtMPXquAH24oHNXVoJVkGZwjpRwpmkrSvWXiJakhGI9dgDNNSRNv8
         7UqV6TlY6kqGc1HLRh32XQ0cnALeMelZwDdTsXCysrp1TErYjkHDLirZJIXK2o8cyljz
         T4Lu+z/Eg7cMeq2kQMT77H6THO/Ylg2RQwKwge0uJL2KoOawRSW8uDL/uO+62TCnC5pi
         DjEofsuvryO29g3CyCD7ZMkyUToHOyleSx7fk6+GaDBkRuCJDx3Ok4oeS2yTJ0Jt58RO
         fsKjWAVwSLkMTyr0VTi46mmHy06o1QSqpuO6P4jC0SdE5KvAtB5Z0pVmHlX63PDmIVSO
         6e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723191; x=1783327991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxKbFO3jZdx0YMVM28FnI1izFIXZoinjwwywDy6J9aA=;
        b=V4IGXYUYm8cKrXwjlFP/1djDYG9+wrGbWwgpKB0h4prm44bsIERf80zkJ3zJ3ofMYY
         NhLLfneYzaeclz8loo4UidEoHcuP+9XjsBYEJB3tAt0uUVXU2SB0qZ7UPiwkvay0lWfj
         6xKfHd44HSIKClLQoiAYmaSaUw1yXtD8DmntKROA9KaKnl8kYVR6ZYQOED5alTaA1eYR
         fxstFikHb2c/EcBu/yHf450V/KO0BuAd/aN4/5kvF5ACSsazMKKKWUCf5nwf+7AUafl7
         XLZSFrEbFzXv9PsaxJJva58BRq0ZkU0VAtKmAMWdyadfIJipgc68/N20K8OnTfMvAl4Q
         kzDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Cy3HuMYUundnA1uhaK8vErtlf0VFn9/vJtDZVcnTRbjPjyvwN/UHJhPz/TX1hd1aXSGbG8pda3HCVg8dgB4jm@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg8ANZ3kuFrjEHIwr4lj9WchmvF/jx4tUkMNJOhRv1xTCJC8d6
	0P0IYDF744hI+Il5RFE+L91U80a34qBncLfPEACGjfGJNwAzTUI+YjhVcd6kafN1fYO2GoltAwz
	6L1QrsnoXFdsDu5UFkaHxXizCJTZUBYjn9FMisr62w0xFf3rmJPpkfn2cNdQr8J7o6un+JrLsI1
	ci9g==
X-Gm-Gg: AfdE7cnWRY1oVYSe3ycmTwZVwBE7hD/NVc6f7shkw5abp/GnOcZNC314kKcRwqgzNfS
	ChmrDnnnTBth5QtcMynxS4sC5HHIJDGxCxC7tvTnxwRh1KsrbbI8vFZ9LUHA5ngKPDQFcOt+yfd
	VBC+W2HvnV2RBuoLNwMdhwmhF29MVnvyNm1P572JPznB0zzEAkJOyo4ZTqB2OkFcDphfhoG/6su
	X6h/rCKMtuP7smVGKtNMf2yap94Kcl0PzrTu9RGGWP6wqDSlfQDksqNM3shlxuXa3PnQsvgkR5f
	1N5huj67hL/JrrSrDMd/RXKW9dtT3TwNnxy8BTvnT/zjHQ8e8PSSauU9YsXO6s4P0QQahquVVUv
	bzl1EFOojCq8tKUiJ9rsU3x3iuoad/WgikFE=
X-Received: by 2002:ac8:5dd1:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51be9919641mr61100231cf.7.1782723191457;
        Mon, 29 Jun 2026 01:53:11 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-51be9919641mr61099921cf.7.1782723190905;
        Mon, 29 Jun 2026 01:53:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05cbfsm739181166b.36.2026.06.29.01.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:53:09 -0700 (PDT)
Message-ID: <a509092a-1c65-493b-9df7-c8a89564bd7a@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
 <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: enH6gF6RYJR-61Cjtbgbc_mad10yjR3y
X-Proofpoint-ORIG-GUID: enH6gF6RYJR-61Cjtbgbc_mad10yjR3y
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a423277 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX7qYa7PZ7TA7N
 nY+J5rsC02YmkHOMY21tlDcXcIcFJAsm28EhSFEUN/6EIK4hBqJ1QLb+gTE6cQL0BanS2ZAulUs
 f9zXMPjJ7vjv5v0+J0XClCy+pwf9eYg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX5Cnpl/bt0WE2
 PEH4N5hJQeaP3BeJ/e5rGZBa4G+r/VWQaRNBQp/Cq3/nLeQNk2b8+AJKig2FNFarx8H6Nbr2UOF
 YKOj0zTtvpgcZu3GJ4JPnAPVBFcm8XcFa5rDUo301D3OHb297U9TvCUVhAp0oshnt4kFiTes5+J
 ksowO1hSf2rn9e9Cyg1H/vf/xEfBPZe7oT6K4fhD7rxRFe6NEdrRQJePreYj/IneHUeubkFbej/
 zQlfanbWZui5ZhtIEhyqbNxbZTalU7wgqb2J0VY5MUjMx5WEZgEkIW3B83U6r7rmZPaJhUJgzzq
 PcYkYMyw2bcoTgD9tbylzfzWi2r01RasGrt7vxnQps9k/fgRxGSC4z1jnGRZZcJHZ2RXXWfeJ6a
 xHd6gXTr/yIkqFwUoaY8GFGbOVaMbVJtuu7eQxsILhfA0l9i/VPGAenp5BqzaZADFHcmbPLv71M
 u+9rnxwPQCVcEE3C57g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_015313_306678_F04BD11E 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 6/28/26 8:23 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
> interconnects, IOMMU, OPP table and the zap-shader region.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

