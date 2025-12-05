Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AD9D374A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 20:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtFPosF2LgiE2WjxvqOOGkRyYJUYOXnYWCtT9Q8AA0k=; b=uvmT7SIF4cNChug9tuqCfZJNi+
	HI9jiyPKmPL6zzVpaTxqADfk/apMhsM/hkWWWee7gvYvMcl16j5g/UAZjlzkDRhPHBJaMOx2ECA0B
	AKxn19x2jntc1W1sLruEDSDjW0WpQaCEqfv7lpH3OUtGuyfjIO6peVuvqMg6QXrjWKkgSzEa3Jvld
	gFZ6nYF8A+0Z394O09nwxRt3SEZsp3wK1c3Wi2aosadseMeeEefRVnCenVaNkeQ4tAdpSb0Z1/bPK
	sjJwQdKCw4Q7Tmx9KTYpB7L/7k0wC6UgbOufZZyTQC+mdXhv69DKp5QaUOzATlLQE1giKCmaGT3IV
	fypa5O8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcpE-0000000A2PP-0xyq;
	Fri, 05 Dec 2025 20:54:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcpC-0000000A2Oz-0N6A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 20:54:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5HrXqx867199
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Dec 2025 20:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GtFPosF2LgiE2WjxvqOOGkRy
	YJUYOXnYWCtT9Q8AA0k=; b=HyrcEeh2fn/ST9g1pNlY/hYo11L1eO++CR0/+5ZB
	otctzrL8Zxp+lAZMsT60n9fuKoqO5Sl+T5w5wVKda7svL+TgaJyDwx+/bKYK0IW6
	EeuxZI0yohjTQ/c9s9L6s8owJaAd+FUW/ZuNt0rxD8/QxFvV8d7TBJRt5tuq2ob/
	x2g20EKV7EtWw7+QP2G8vNQqIR7StMjbPK2zXq6RQWVMNigI9NSW8HmaK2mGq+Uz
	5L/cMOF5ShxctyxukcbA+mJzN2gx5RWCUw3n7kNWtxiAB3XU8wwwYsuoJJmofCdg
	sdp+trN2r0VV6RRhsurq39Potdu/fDQJK5XM9TYjy/ziTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av46f8es3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 20:54:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b26bc4984bso889261885a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764968084; x=1765572884; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtFPosF2LgiE2WjxvqOOGkRyYJUYOXnYWCtT9Q8AA0k=;
        b=ZITI4bFDmgAOez0EFW9EG9l7Ot3GAwUHAPrRP3ifoQcVA0UcLnrcUNZ6ARp5f6v7U1
         HHoF04z049ewFKHPSbFlKTiPTYpOv85DKgwXgXpYg8qdN25q9yDgcMPSnYkY0Q4jP5yz
         iBgjVRlp4RNUB6QXWS1O4e7FPVrpi9cXAV55YhTOJghJvPbSb2z58xoyXnZJVGGDx16A
         zCS+Ls8LPGaM5H4G+Y81Y6DGI2taTKA+kFy2pcBsYeHRcozVDzKi5SivdPD2gtMLyE9i
         cDpP646qe5cJ/wsN1rlOX1sFCcEDCIH8dZTNw/tJtJqj3DHtCWiTQAlBBNjk+I3ZqKxO
         VRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764968084; x=1765572884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtFPosF2LgiE2WjxvqOOGkRyYJUYOXnYWCtT9Q8AA0k=;
        b=Jg9k94V8q9GlUj8wUzed3upOXZ1hsTa8RU0mdtUTi/hfS3k7v7/UhzKIcxmTjCi08g
         FiU9/J6QV+NwPdPO1ByekbRPE0AiKMTyKV84Gxt9wjGat1mFU8Ug8ggG2IWtPbolBhvM
         F98MMsocIC7RTKNm4Q7lca92Z5IRh9fAL537hkTRIBLkWBiQKa8xXQYOAELg2+E5HxxF
         72UqINfJ+hkCnROIT/wQJAVeZEszJEY2iotufRbe2UnMjxHTP7CA/lJheX/b5IVBxBzK
         /QCqkILM/+o70+tC+nIvxKNA27aSjjTYdpJdeR0uswsfvO56mCSirsxCyX4h4WjlcrzI
         w6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIFkkYyP5nX5/hq9bnmH1hSFwZL24sX/afWoh4TJ4uTjZV9JUgmMDgMzOpWaJsQ/WMzxPBb9GxBJvGHXGgnoVH@lists.infradead.org
X-Gm-Message-State: AOJu0YxBOwuDF03suq8eBN7oPo+Z4lFsqyyNQ+ITBlmshrjl91SvD7xJ
	mFMNQLQHsyIKljtaIczhGEObmCffsxyqUjjbc3hKpvahLFZbQoLHQS3WO6CuVVmgTlPhHecrvuH
	inLcetIORjfBQRHLZllYfZ2dGnoO/0qQr7t3WJWeHIHa/5kUhEAVonUbFm8l1lf/v2dW4TpaY5f
	SNEA==
X-Gm-Gg: ASbGncttOogQ7mxrHwbjmSwVHsUAKGXN4TAR1mTm+LuJYZKyK1mioauuaIWA2IVd8MT
	hdAR4C3Revec1nUFnqTrgDrQ0S6/dubiyL32Ny6MJoilLsTrw14SqPchVK7Ztky3j4Paehuf+q6
	EuaS9YaP55Sh8vG+dehdxwpC2PIw33XSRYJKRFAmy9A0eg2WiyScyqe+MZl4WP3R90ZP8Kvsh5C
	4Xe/nVh85LcWmm1aV5Q7+Is3fCLcL7aMjCgevTWdVVNuI9LGS6yZADCXxzDYKjeubr+9rQkTV3P
	fabSjMw9cEAe6sK2AJb3sEqk4gtaQ3/jemoGuqfMitOsdtMGB+rIr1yzwJx+00WaNyu16Of1SBH
	oeo0zFIlD2Q4NJZA1W/BNnL/ZvlPH2/vxxQAO7871gtBwBRf9w0Zm1kcHqe99SUZAvHUKmuh+dT
	7uD1rVUZTSBIr4Jl7OqNa9L3g=
X-Received: by 2002:a05:620a:294d:b0:8b1:426d:2b87 with SMTP id af79cd13be357-8b6a2503493mr64555785a.21.1764968084186;
        Fri, 05 Dec 2025 12:54:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAybpfmIdKabPoU0b3dhUbqBBQq3XsZxjf+SdNpObrlWklaDL5pyA+vTb0we9EyoSRApMq/w==
X-Received: by 2002:a05:620a:294d:b0:8b1:426d:2b87 with SMTP id af79cd13be357-8b6a2503493mr64540185a.21.1764968081599;
        Fri, 05 Dec 2025 12:54:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2c2sm1826782e87.63.2025.12.05.12.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:54:40 -0800 (PST)
Date: Fri, 5 Dec 2025 22:54:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
Message-ID: <ombtqnvej7vxot7fzhtbgt7doqky4b4wwtockyvorpfi2hl4zz@wslecjpuhmmj>
References: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wvom8Nfv c=1 sm=1 tr=0 ts=69334695 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8Kug02PE9PhwNHeq3GEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: InCT447LdYr2_8CZs27KvtHc8QFXIp-D
X-Proofpoint-GUID: InCT447LdYr2_8CZs27KvtHc8QFXIp-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NiBTYWx0ZWRfX+SIlbMz9nxw7
 AE9h0DzJn4ap/ZBZvGJ+WQNm0gt7Gin1wyvGePFPnJJ8xgDrpI+IEGKrhAaoNfhQ0UkexNGDZrq
 WAP8S1IHCzhRLL9vuajaQaJAqkR+GzzgSlP6sGOhG7be9II/kxTDh2TJezBSPymc8FnLqzvMBHx
 Rd0GfjTijlteaAWXQ2kMVq1Ixnlzy/vm052mEcqOzsKGe3g3OAvklq7qY/CH2ZEaglRBJ7l54Un
 lR7d6Gj8OrxdjVRQuZQ9HTpl0gJb4MAEkmr9YK8pLHibTHm/4wd00fI2jHcrI4v6kBxmIlThcy3
 D1OynMxA8K8eojEMULtCP9BC+EN1evsjoeurxnpV32Z8C7ofeUEFZWyB40KnGZRRdSIuJ8RSAqg
 0xVsFUzKBkFLmiV6vM6TErIZybuWLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_125446_153338_2429671B 
X-CRM114-Status: GOOD (  16.43  )
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

On Tue, Dec 02, 2025 at 06:24:47PM +0530, Charan Teja Kalla wrote:
> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
> 
> These are QoS settings and are specific to per SoC thus different
> settings, eg: some have shallow prefetch while others have no
> prefetch.
> 
> Aswell, this prefetch feature is not implemented for all the
> platforms, capturing to those are implemented to the best of my
> knowledge.
> 
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> ---
> Changes from V3:
>  1) Add actlr setting for missing sc8180x & sm6115.

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 

-- 
With best wishes
Dmitry

