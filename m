Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FW51d14S;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e3IE4qwQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NpNrTA6Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=; b=FW51d14SA+ApYw/bjkHV6gO72e
	f6Mfop+hzTr4Jd3xpFUwPR/MT7KLd0izlD2PnCqn7xTbEdmNslkPMRdmU6zkUWA/g4X+CfMYqTnmN
	qiSRqegiKwYVtUkSKjl98/U856O9b9BjUVnlS2G/di6VOyEv3qx589oninLUlsTZH6cFIuAqxqIcU
	YPeXd5yyReq2LrGItFMlfMQvPA92vKq3jt6MPYYFiUGE5fplC+dRkcXH2HmNbMQkihTtShTyLu0tm
	KJctBUQNolcaqJ9NiRysa/vVPicPm86vRYRbvQdXdyOGxdu+1UrQy/RFoOkCp75ZZUwGbwBLWa6X1
	QJdfBwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlq5-0000000BgoV-0qNC;
	Fri, 30 Oct 2026 12:36:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlq2-0000000Bgns-3SVP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:36:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG4O43142141
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 12:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=; b=e3
	IE4qwQOFgqK0bbRwjOQxAeUpHNDVsU5XPnIuBzxao7roUq7aP0qACrqYYEVkp5zG
	5oBydsI7dWtfmDdsNKVJ/XGKezJ11vkTTn39WTOWlRHhWm7XQ8U9O2seE4HDrPBc
	DEv6nU5H26xRc2yeFh2BfA7Mcv8yOzRNBRQR5yYqnWo0kZHGUQ/+JkU7xqUL+5m4
	Aj9VCtCaFuyFrHEZbPmTrPz5nJsZ/plqhFvb+pccGa5pJYSRrMwK3UMt7cH1a3ZK
	zSnTShpr58u6PKFXAWaz8ZZf4tJUfxIYGD44MirKKJCFnHtvV2H8k5ZzNQZjtU04
	YYA6jaOZIxkcMdNblQsQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk0qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 12:36:05 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4574f1cac98so681374fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 05:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793363764; cv=none;
        d=google.com; s=arc-20260327;
        b=GFH5H8cWwiAMAEWIaFcrERUZKW4/JqN2wWTM9OGJdObkQQy0eJRpOMlEl6r+AtnDTJ
         VNaNrqXPk+8uaNw50zkL+mk/I25RYTsnxpku2zvyiKYzcvyyVRq4jt11HueDw5MRWJyf
         ThoDjBUwkAu0B/eo5LWKfkWoFtWXiHjaB5bYVG4fX12H6YvMWMII8p5/Hekzfo+lx665
         TJtS3rGRwcXRmNhwCP2nsqwXpG481qo14DfE8TwC8zaXFSsctsoQzTBpbgH8XyPAdvNy
         o21nGjTjqLdGEH9mvX/OYy2TIdI4Qt0Iqh1s3ylmSptEnxBwcgklnzWsPmIXL46HhvB4
         dWVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        fh=yJjpDuchyaT5vHvqD9Ya1sYdIZ8B25ECnuBEAUtYyDM=;
        b=JemOGuRmGN3yWApYgMkKvxkHTCyIaBKYPDcRhYndD25MFPSW8FKhLy4wpWVYMtBn0q
         D5JervRtLOzo0xMp23j+xvzC0q1bky6Bgrx3cCXRwauW1leP8p+yJ2RkyfXD4WfxUNxR
         4x3f1lCUNFLrN37VzIW2CZnS60iH8CvAJoIJHQg4I4xdyDgdD8YeVkY4sBU6tgVq1aig
         h4LzeXq8xvdiNt96FSM9syRvcGlwxiugXzywVWTmyeWowpVwsGl++6CgLBt9dL4/AwXN
         TIblMsEtTmRSAHhhrLITvmyoMMHuEhU4ygN306m1TZXEmekYc9ZoYsl2SJJX4rIwFnBi
         vsxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793363764; x=1793968564; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        b=NpNrTA6ZVJ5nMhZx4vT5ToWePXjwHWmClcMiUJ2/oAne+SMgJxXiL/ejEwJRko2613
         pAlCOKBCtRxu8N9+5cu1A20RMEfJC9TE8w8pKHOSpR2c5ZSBDED2SObNeXQ3W+n/bhhO
         bDx01gPGc7Dbplos45ijjCNtSJ9iU3/XQaN1LI2MS+LcSSDT544uF18opV6vjMSvgnGF
         3piuRvzBS1ABmUXyi+60cw5brGYS4CVCT7z4mUCBXdJxk2ijtIZBeO8mdncjkytHDHiC
         xOzWCb9iKBM1fXR2Xg8RDsa8g5Qp/NOAIqg63D4IJ3bmGCu9z0EM7ZneLH6+ZYXbYgMZ
         XZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793363764; x=1793968564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PsdJ/sQncKvFnzsfbs3L9HOmsbbc8CaNjBNOtLmdTXU=;
        b=Y0QOs+g2NF3oubOM09XG1O+x+SqKKmRHqt2xyTv05WujcKUmQHx0UKN44k+Pv7mINu
         vSJ/hDAeCt3jPsnE6O7OOLOFqNJg8ZXo2q2FM/SG5HT/epngU7mXR7I4E267O8Glpg4n
         QgRTw5c48M3plRhsPMRFXIQivYGfw2dn1BB85YYt3pu3j/05lmyM3i/jDYdvfUmIjd1F
         0P/zDJ4r4jiEtoOzJMB8B5c0MQ4CdH37y7aD7x+C66nAk7PpwsyqTGLJBQZRU08T9LsM
         JLfDI3PHwv2aJmaLppKEqe+BCnigbSSnraXqCCLghfZYFFKrG68IxL53PSFE2cp8fz+E
         b0VA==
X-Forwarded-Encrypted: i=1; AKwUvBxv7A2zVSYMghbOUz/NDTF/vi0ChmBFeL618/yjOVkZnKY4/WoQIQKdpEkj44OEC3mbZ/LBYmwcK+hmsBOw8swk@lists.infradead.org
X-Gm-Message-State: AFq9FYK9iIfrJV5wjonzMT6JtVT9avKZGl8iUXly+A046f8/0CFontMj
	3dD6OAQG0K+iondpw8ZepO93pOQ59i9seieupScJbOSgLE8cquo6Cp+Xn5/8Fqce1yf1jzvXqwl
	gCSPWW/bELhB7UnVykVONkVmYbCTTb21YeKWkY0V+akFdOSwBR1fRad7lUgwMfEEHpcOnQ47H6F
	2ZE62VJ/G9hB2fXJ07EvCBZvgzmWVM5A8rBTGt7e+VsajhrMFO+ZKT
X-Gm-Gg: AYBFou15uhP+8Hpz3hDSqj9xCwhBtH4qgfxXLONm13HiY9yckPuon/rhpw1SmgnLy0W
	E5NwgnDh50XjpdSf3maAHrgrnS7vsl+oxKZCylZDIAWcVLIdKiOxWlfG7sdaKgucUIe6yomUaHZ
	0ZKks2qscnMI5NQX02V7tf6DL5US4O3SnP0V3YZMSVKBZSSEeH/ec9xF66hw==
X-Received: by 2002:a05:6870:a104:b0:475:e066:7714 with SMTP id 586e51a60fabf-4a9076f5d71mr1257362fac.27.1793363764193;
        Fri, 30 Oct 2026 05:36:04 -0700 (PDT)
X-Received: by 2002:a05:6870:a104:b0:475:e066:7714 with SMTP id
 586e51a60fabf-4a9076f5d71mr1257338fac.27.1793363763749; Fri, 30 Oct 2026
 05:36:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-2-robin.clark@oss.qualcomm.com> <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
In-Reply-To: <067b2a6f-9e16-4f8f-bec2-5ee2de10125e@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 05:35:52 -0700
X-Gm-Features: AclHuK_Kxv6J1o1Nk4jiUTeYgcQUlfsMkvo2Oyu2LlP58eHKHYlhfwHqpLn5bVY
Message-ID: <CACSVV00wrjhBHtKE6iJ=yvdPVaZ0RreJm27JQ9KaKy50-FSA1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wQCRpDz3kvGUM_b-03RJWYTvhMJfx3xG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX9oi2LTbchMw2
 tcHEl8b8qbj8GuAuj8X+prJVi0dCLSfVspuH5X6/B5YilEew5bbOT9S0pMMVCR3gev2eGNtSsXG
 U0MgSutwElJcs0NMCUZBQ3DapWgVGf0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MCBTYWx0ZWRfX+Yc0E67cD60G
 zHuAwIZ86ma8mjvnVOQj9AJIYy+Rj+XdQV7ERASlX8ImTd9theak6t7NDXoIrL/EU8WcXPUkXAC
 zsIX+6uGFVbShKSii6KMikgvgyGbz2IiBQyvwfGscyY89g7mgjQa5FAmktPDmn1i3de1Qb03i2K
 phJkJlZp4ZhVKKgB0jWqkKMi0vDq4rScprh+AA6vGqBCbiLgFFn725FC1G6QyvVtrWNju8tjO2s
 BV48tKuKtKXRQTxPX2QhwqKwWNDDRPq4SkDdfhFR2CaMJam77F5+jFpw9aPA4RfUC78DpfS/fGz
 sZVCATM0dKegFl5LZV8u6fQyiXJbjdoHq8sjxblpimAW4Mj4W17CsqzUAKo1QTokDaKQ/aVa8TX
 l71ldc77bhHxSc92mYj+jz8mS01fugc/hiGRQkItN8wtJ1tra2RREy17ZAHLtA57BI20mgEsi+k
 AkdNuPfneR+Nb6WwTTg==
X-Proofpoint-ORIG-GUID: wQCRpDz3kvGUM_b-03RJWYTvhMJfx3xG
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae48f35 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=RaxNTMYahNmlKwi_CG8A:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_053606_977333_8BE4371C 
X-CRM114-Status: GOOD (  15.67  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 1:35=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/29/26 10:23 PM, Rob Clark wrote:
> > Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices t=
o
> > select direct mapping") for arm-smmu-qcom, match GPU and display compat
> > strings to pick identity domain time.
> >
> > The drm/msm driver attaches it's own domain, which it manages directly,
> > so we don't want an iommu managed domain interfering.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> fwiw I'm not sure we have any devices with this driver and mdp4
> but anyway

probably true of arm-smmu-qcom as well ;-)

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

